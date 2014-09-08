------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                         S Y S T E M . B B . T I M E                      --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2014, AdaCore                     --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion. GNARL is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

pragma Restrictions (No_Elaboration_Code);

with System.BB.Interrupts;
with System.BB.Board_Support;
with System.BB.Protection;
with System.BB.Parameters;
with System.BB.Threads.Queues;
with System.BB.Timing_Events;
with System.BB.CPU_Primitives.Multiprocessors;
with System.Multiprocessors.Fair_Locks;
with System.Multiprocessors.Spin_Locks;

package body System.BB.Time is

   use Board_Support;
   use Parameters;
   use CPU_Primitives.Multiprocessors;
   use System.Multiprocessors;
   use System.Multiprocessors.Fair_Locks;
   use System.Multiprocessors.Spin_Locks;
   use Threads, Threads.Queues;

   -----------------------
   -- Local definitions --
   -----------------------

   Alarm_Lock : Fair_Lock := (Spinning => (others => False),
                              Lock     => (Flag   => 0));
   --  Used to protect access to shared alarm resources
   --  (Timer configuration and Pending_Alarm variable)

   subtype Clock_Interval is Timer_Interval;

   type Clock_Periods is mod 2 ** 32;
   for Clock_Periods'Size use 32;

   function "&" (Left : Clock_Periods; Right : Clock_Interval) return Time is
     (Time (Left) * (Time (Max_Timer_Interval) + 1) + Time (Right));
   --  Combine MSP and LSP of clock to form time

   Update_In_Progress : constant Clock_Periods := 0;
   Epoch              : constant Clock_Periods := 1;
   --  Special value to signify Last_Clock_Update is going on, so on
   --  multiprocessor systems can avoid race conditions during updates.
   --  Choose 0, and have epoch start at 1, so Unsynchronized_Clock can
   --  ignore updates and just return an early time instead.

   type Composite_Time is record
      MSP : Clock_Periods  := Epoch;
      pragma Atomic (MSP);
      LSP : Clock_Interval := 0;
      pragma Atomic (LSP);
   end record;
   --  Time representation used for the software clock, allowing concurrent
   --  updates and reads, see Update_Clock

   Software_Clock : Composite_Time;
   --  Clock with same time-base as hardware clock, but allowing a larger
   --  range. This is always behind the actual time by less than one hardware
   --  clock period. See Update_Clock for read and update protocol.

   Pending_Alarm : Time := Time'Last;
   --  Time of the current alarm handled by the timer. Used to determine if a
   --  given alarm is before the current one, and so needs to re-configure the
   --  timer.

   Max_Sleep : Time := 0;
      --  The longest time we can sleep without updating the Software_Clock.
      --  Initialized by Initialize_Timers.

   -----------------------
   -- Local subprograms --
   -----------------------

   procedure Alarm_Handler (Interrupt : Interrupts.Interrupt_ID);
   --  Handler for the alarm interrupt

   procedure Update_Clock (Now : out Time);
   --  This procedure has to be executed at least once each period of the
   --  hardware clock. We also require that this procedure be called with
   --  interrupts disabled, to ensure no stale values will be written. Given
   --  that limitation, it is fine to do concurrent updates on SMP systems:
   --  no matter which update ultimately prevails, it can't be old. While, on
   --  SMP systems, the Period_Counter may not always be monotone, the time
   --  returned by Update_Clock and Clock is.

   -------------------
   -- Alarm_Handler --
   -------------------

   procedure Alarm_Handler (Interrupt : Interrupts.Interrupt_ID) is
      Now             : Time;
      Next_Alarm      : Time; -- Time

   begin
      --  Make sure we are handling the right interrupt and there is an alarm
      --  pending.

      pragma Assert
        (Pending_Alarm /= Time'Last
           and then Interrupt = Alarm_Interrupt_ID);

      Board_Support.Clear_Alarm_Interrupt;

      --  The access to the queues must be protected

      Protection.Enter_Kernel;

      --  Reset Pending_Alarm before computing the next alarm time, as other
      --  processors may set alarms concurrently, and these alarms would be
      --  ignored otherwise. The alarm lock must be held for this.

      if Multiprocessor then
         Lock (Alarm_Lock);
         Pending_Alarm := Time'Last;
         Unlock (Alarm_Lock);

      --  No need for lock if not on multiprocessor

      else
         Pending_Alarm := Time'Last;
      end if;

      Update_Clock (Now);

      --  Ensure alarms will keep going to keep the software clock up-to-date.

      Next_Alarm := Now + Max_Sleep;

      --  Multiprocessor case special processing

      if Parameters.Multiprocessor then

         --  This is the alarm CPU, we have to wake up the other CPUs with
         --  expired alarms.

         for CPU_Id in CPU loop

            if CPU_Id /= Current_CPU then
               declare
                  Alarm_Time : constant Time := Get_Next_Timeout (CPU_Id);

               begin
                  if Alarm_Time <= Now then

                     --  Alarm expired, wake up the CPU

                     Poke_CPU (CPU_Id);

                  else
                     --  Check if this is the next non-expired alarm of the
                     --  overall system.

                     if Alarm_Time < Next_Alarm then
                        Next_Alarm := Alarm_Time;
                     end if;
                  end if;
               end;
            end if;
         end loop;
      end if;

      --  Execute expired events of the current CPU

      Timing_Events.Execute_Expired_Timing_Events (Now);

      --  Wake up our alarms, and set any new alarm

      Wakeup_Expired_Alarms (Now);

      Next_Alarm := Time'Min (Get_Next_Timeout (Current_CPU), Next_Alarm);
      Update_Alarm (Next_Alarm);

      Protection.Leave_Kernel;
   end Alarm_Handler;

   -----------
   -- Clock --
   -----------

   function Clock return Time is
      Before_MSP : Clock_Periods;
      Before_LSP : Clock_Interval;
      Now_LSP    : Clock_Interval;
      After_MSP  : Clock_Periods;

   begin
      --  On multiprocessor systems there may be a concurrent update of the
      --  software clock. Retry if this happens.

      loop
         Before_MSP := Software_Clock.MSP;

         exit when not Multiprocessor or else Before_MSP /= Update_In_Progress;
      end loop;

      Before_LSP := Software_Clock.LSP;

      Now_LSP := Read_Clock;

      After_MSP := Software_Clock.MSP;

      --  If we know the value of the software clock at the time of the read
      --  of the hardware clock, we know the time of that read, because the
      --  software clock can never be more than one period behind.

      --  If After_MSP /= Before_MSP, we don't know the the time at which the
      --  hardware clock was read, but we do know that at some point during the
      --  execution, the time was Before_MSP + 1.

      if After_MSP = Before_MSP then
         return Before_MSP + (if Now_LSP < Before_LSP then 1 else 0) & Now_LSP;
      else
         return (Before_MSP + 1) & 0;
      end if;
   end Clock;

   -----------------
   -- Delay_Until --
   -----------------

   procedure Delay_Until (T : Time) is
      Now               : Time;
      Self              : Thread_Id;
      Inserted_As_First : Boolean;

   begin
      Protection.Enter_Kernel;

      Now := Clock;

      Self := Thread_Self;

      pragma Assert (Self.State = Runnable);

      --  Test if the alarm time is in the future

      if T > Now then

         --  Extract the thread from the ready queue. When a thread wants to
         --  wait for an alarm it becomes blocked.

         Self.State := Delayed;

         Extract (Self);

         --  Insert Thread_Id in the alarm queue (ordered by time) and if it
         --  was inserted at head then check if Alarm Time is closer than the
         --  next clock interrupt.

         Insert_Alarm (T, Self, Inserted_As_First);

         if Inserted_As_First then
            Update_Alarm (Get_Next_Timeout (Current_CPU));
         end if;

      else
         --  If alarm time is not in the future, the thread must yield the CPU

         Yield (Self);
      end if;

      Protection.Leave_Kernel;
   end Delay_Until;

   ----------------------
   -- Get_Next_Timeout --
   ----------------------

   function Get_Next_Timeout (CPU_Id : CPU) return Time is
      Alarm_Time : constant Time := Get_Next_Alarm_Time (CPU_Id);
      Event_Time : constant Time := Timing_Events.Get_Next_Timeout (CPU_Id);
   begin
      return Time'Min (Alarm_Time, Event_Time);
   end Get_Next_Timeout;

   -----------------------
   -- Initialize_Timers --
   -----------------------

   procedure Initialize_Timers is
   begin
      --  There may never be more than Max_Timer_Interval clocks between
      --  updates of Software_Clock, or we lose track of time. Allow a 1/8th
      --  period safety for early wakeup. The alarm CPU should never have
      --  alarm interrupts disabled for longer than this, or we may miss
      --  clock updates.

      Max_Sleep := Time (Max_Timer_Interval / 8 * 7);

      --  Install alarm handler

      Interrupts.Attach_Handler
        (Alarm_Handler'Access,
         Alarm_Interrupt_ID,
         Priority_Of_Interrupt (Alarm_Interrupt_ID));

      --  Establish invariant that there always is a pending alarm at most
      --  Max_Sleep time in the future.

      Pending_Alarm := Clock + Max_Sleep;
      Board_Support.Set_Alarm (Clock_Interval (Max_Sleep));
   end Initialize_Timers;

   -------------------
   --  Update_Alarm --
   -------------------

   procedure Update_Alarm (Alarm : Time) is
      Now             : constant Time := Clock;
      Time_Difference : Time;

   begin
      --  On multiprocessors we want to do the entire procedure while holding
      --  the alarm lock, as we shouldn't read or update the Pending_Alarm
      --  variable, or program the alarm, concurrently with another update.

      if Parameters.Multiprocessor then
         Lock (Alarm_Lock);
      end if;

      if Alarm <= Now then

         --  If alarm is in the past, set the minimum timer value so the
         --  interrupt will be triggered as soon as possible.

         Time_Difference := 1;

      else
         Time_Difference := Alarm - Now;
      end if;

      Time_Difference := Time'Min (Time_Difference, Max_Sleep);

      --  If next alarm time is closer than the currently pending alarm,
      --  reprogram the alarm.

      if Alarm < Pending_Alarm then
         pragma Assert (Time_Difference in 1 .. Max_Sleep);

         Board_Support.Set_Alarm (Clock_Interval (Time_Difference));
         Pending_Alarm := Alarm;
      end if;

      if Parameters.Multiprocessor then
         Unlock (Alarm_Lock);
      end if;
   end Update_Alarm;

   ------------------
   -- Update_Clock --
   ------------------

   --  Must be called from within Kernel (interrupts disabled). Must only be
   --  called from one processor at a time.

   procedure Update_Clock (Now : out Time) is
      Update_MSP : constant Clock_Periods := Software_Clock.MSP;
      Update_LSP : constant Clock_Interval := Software_Clock.LSP;
      Now_LSP    : constant Clock_Interval := Read_Clock;
      Now_MSP    : Clock_Periods;

   begin
      if Now_LSP < Update_LSP then
         Now_MSP := Update_MSP + 1;

         --  Need to do "atomic" update of both parts of the clock

         --  Mark Software_Clock.MSP as invalid during updates. The read
         --  protocol is to read Software_Clock.MSP both before and after
         --  reading Software_Clock.LSP. Only consider the MSP as that
         --  belonging to the LSP if both values are the same and not equal
         --  to the special Update_In_Progress value.

         --  Because interrupts are disabled, this special read protocol is
         --  only necessary on multiprocessor systems.

         Software_Clock.MSP := Update_In_Progress;
         Software_Clock.LSP := Now_LSP;
         Software_Clock.MSP := Now_MSP;

      else
         Now_MSP := Update_MSP;

         --  Only need to change the LSP, so we can do this atomically

         Software_Clock.LSP := Now_LSP;
      end if;

      Now := Now_MSP & Now_LSP;
   end Update_Clock;
end System.BB.Time;
