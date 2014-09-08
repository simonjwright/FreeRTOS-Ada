------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--              S Y S T E M . B B . E X E C U T I O N _ T I M E             --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                     Copyright (C) 2011-2014, AdaCore                     --
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
------------------------------------------------------------------------------

with System.BB.Parameters;
with System.BB.Board_Support;
with System.BB.Threads.Queues;
with System.BB.Protection;

with System.Multiprocessors;
with System.Multiprocessors.Fair_Locks;
with System.Multiprocessors.Spin_Locks;

with System.OS_Interface;

------------------------------
-- System.BB.Execution_Time --
------------------------------

package body System.BB.Execution_Time is

   use type System.BB.Time.Time;
   use System.BB.Interrupts;
   use System.BB.Threads;
   use System.Multiprocessors;
   use System.Multiprocessors.Fair_Locks;
   use System.Multiprocessors.Spin_Locks;

   Interrupts_Execution_Time : array (Interrupt_ID) of System.BB.Time.Time :=
                                 (others => System.BB.Time.Time'First);
   --  Time counter for each interrupt

   Interrupt_Exec_Time_Lock : Fair_Lock := (Spinning => (others => False),
                                            Lock     => (Flag   => Unlocked));
   --  Protect access to interrupt time counters on multiprocessor systems

   CPU_Clock : array (CPU) of System.BB.Time.Time;
   --  Date of the last Interrupt

   Disabled : array (CPU) of Boolean := (1 => False, others => True);
   --  If the CPU clock is disabled the next elapsed time will be discarded (to
   --  handle CPU idle time). At the start, only the first CPU is enabled.

   procedure Disable_Execution_Time;
   --  Disable the CPU clock of the current processor. The clock remains
   --  disabled until the next call to Scheduling_Event.

   procedure Scheduling_Event;
   --  Assign elapsed time to the executing Task/Interrupt and reset CPU clock.
   --  If the clock is disabled, the elapsed time is discarded and the clock
   --  re-enabled. This must be called at the end of an execution period:
   --
   --    When the run-time switches from a task to another task
   --                                    a task to an interrupt
   --                                    an interrupt to a task
   --                                    an interrupt to another interrupt
   --  and before an idle loop.

   function Elapsed_Time return System.BB.Time.Time;
   --  Function returning the time elapsed since the last scheduling event,
   --  i.e. the execution time of the currently executing entity (thread or
   --  interrupt) that has not yet been added to the global counters.

   function Read_Execution_Time_Atomic
     (Th : System.BB.Threads.Thread_Id) return System.BB.Time.Time;
   --  Read the execution time of thread Th. The result is a coherent value:
   --  if the execution time has changed from A to B (while being read by this
   --  function), the result will be between A and B. The error is less
   --  than 2**32 and less than the increment.

   function To_Time (High, Low : Time.Word) return Time.Time;
   --  Low level routine to convert a composite execution time to type Time

   function To_Composite_Execution_Time
     (T : Time.Time) return Time.Composite_Execution_Time;
   --  Low level routine to convert a time to a composite execution time

   ----------------------------
   -- Disable_Execution_Time --
   ----------------------------

   procedure Disable_Execution_Time is
      CPU_Id : constant CPU := System.OS_Interface.Current_CPU;
   begin
      Disabled (CPU_Id) := True;
   end Disable_Execution_Time;

   ------------------
   -- Elapsed_Time --
   ------------------

   function Elapsed_Time return System.BB.Time.Time is
      CPU_Id : constant CPU := System.OS_Interface.Current_CPU;
      pragma Assert (not Disabled (CPU_Id));
      --  As the thread or interrupt handler is executing, the execution time
      --  accounting must not be disabled (it is disabled only while in the
      --  idle loop when neither threads nor interrupts execute).

      Now  : constant BB.Time.Time := System.BB.Time.Clock;
      pragma Assert (Now >= CPU_Clock (CPU_Id));

   begin
      return Now - CPU_Clock (CPU_Id);
   end Elapsed_Time;

   ----------------------------
   -- Global_Interrupt_Clock --
   ----------------------------

   function Global_Interrupt_Clock return System.BB.Time.Time is
      Sum : System.BB.Time.Time := System.BB.Time.Time'First;

   begin
      --  Protect shared access on multiprocessor systems

      if System.BB.Parameters.Multiprocessor then
         Lock (Interrupt_Exec_Time_Lock);
      end if;

      for Interrupt in Interrupt_ID loop
         Sum := Sum + Interrupts_Execution_Time (Interrupt);
      end loop;

      --  If any interrupt is executing, we need to add the elapsed time
      --  between the last scheduling and now.

      if System.BB.Interrupts.Current_Interrupt /= No_Interrupt then
         Sum := Sum + Elapsed_Time;
      end if;

      if System.BB.Parameters.Multiprocessor then
         Unlock (Interrupt_Exec_Time_Lock);
      end if;

      return Sum;
   end Global_Interrupt_Clock;

   ---------------------
   -- Interrupt_Clock --
   ---------------------

   function Interrupt_Clock
     (Interrupt : Interrupt_ID) return System.BB.Time.Time
   is
      Value : System.BB.Time.Time;

   begin
      --  Protect against interruption the addition between Execution_Time
      --  and Elapsed_Time.

      System.BB.Protection.Enter_Kernel;

      --  Protect shared access on multiprocessor systems

      if System.BB.Parameters.Multiprocessor then
         Lock (Interrupt_Exec_Time_Lock);
      end if;

      Value := Interrupts_Execution_Time (Interrupt);

      --  If the interrupt is executing (i.e., if we are requesting the
      --  interrupt clock from the interrupt handler), we need to add the
      --  elapsed time between the last scheduling and now.

      if System.BB.Interrupts.Current_Interrupt = Interrupt then
         Value := Value + Elapsed_Time;
      end if;

      if System.BB.Parameters.Multiprocessor then
         Unlock (Interrupt_Exec_Time_Lock);
      end if;

      System.BB.Protection.Leave_Kernel;

      return Value;
   end Interrupt_Clock;

   --------------------------------
   -- Read_Execution_Time_Atomic --
   --------------------------------

   function Read_Execution_Time_Atomic
     (Th : System.BB.Threads.Thread_Id) return System.BB.Time.Time
   is
      use Time;
      H1 : Word;
      L  : Word;
      H2 : Word;

   begin
      --  Read parts in that order

      H1 := Th.Execution_Time.High;
      L  := Th.Execution_Time.Low;
      H2 := Th.Execution_Time.High;

      --  If value has changed while being read, keep the latest high part,
      --  but use 0 for the low part. So the result will be greater than
      --  the old value and less than the new value.

      if H1 /= H2 then
         L := 0;
      end if;

      return Time.Time (H2) * 2 ** 32 + Time.Time (L);
   end Read_Execution_Time_Atomic;

   ----------------------
   -- Scheduling_Event --
   ----------------------

   procedure Scheduling_Event is
      Now            : constant System.BB.Time.Time := System.BB.Time.Clock;
      CPU_Id         : constant CPU                 :=
                         System.OS_Interface.Current_CPU;
      Last_CPU_Clock : constant System.BB.Time.Time := CPU_Clock (CPU_Id);
      Elapsed_Time   : System.BB.Time.Time;

   begin
      pragma Assert (Now >= Last_CPU_Clock);
      Elapsed_Time := Now - Last_CPU_Clock;

      --  Reset the clock

      CPU_Clock (CPU_Id) := Now;

      if Disabled (CPU_Id) then

         --  Discard the elapsed time and re-enable the clock

         Disabled (CPU_Id) := False;
         return;
      end if;

      --  Case of CPU currently executing an interrupt

      if Current_Interrupt /= No_Interrupt then

         --  Protect shared access on multiprocessor systems

         if System.BB.Parameters.Multiprocessor then
            Lock (Interrupt_Exec_Time_Lock);
         end if;

         Interrupts_Execution_Time (Current_Interrupt) :=
           Interrupts_Execution_Time (Current_Interrupt) + Elapsed_Time;

         if System.BB.Parameters.Multiprocessor then
            Unlock (Interrupt_Exec_Time_Lock);
         end if;

      --  This CPU is currently executing a task

      else
         declare
            T : Time.Time;
         begin
            T := To_Time (Thread_Self.Execution_Time.High,
                          Thread_Self.Execution_Time.Low);
            T := T + Elapsed_Time;
            Thread_Self.Execution_Time := To_Composite_Execution_Time (T);
         end;
      end if;
   end Scheduling_Event;

   ------------------
   -- Thread_Clock --
   ------------------

   function Thread_Clock
     (Th : System.BB.Threads.Thread_Id) return System.BB.Time.Time
   is
      Res : System.BB.Time.Time;

      Sec : System.BB.Time.Time;
      --  Second read of execution time

      ET : System.BB.Time.Time;
      --  Elapsed time

   begin
      pragma Assert (Th /= Null_Thread_Id);

      Res := Read_Execution_Time_Atomic (Th);

      --  If the thread Th is running, we need to add the elapsed time between
      --  the last scheduling and now. The thread Th is running if it is the
      --  current one and no interrupt is executed

      if Th = Thread_Self
        and then System.BB.Interrupts.Current_Interrupt = No_Interrupt
      then

         ET := Elapsed_Time;

         Sec := Read_Execution_Time_Atomic (Th);

         if Res /= Sec then

            --  The whole set of values (Res, ET and Sec) isn't coherent, as
            --  the execution time has been updated (might happen in case of
            --  interrupt). Unfortunately, the error in Sec might be as large
            --  as ET. So lets read again. The error will be small, as the time
            --  spent between this third read and the second one is small.

            Res := Read_Execution_Time_Atomic (Th);

         else
            Res := Res + ET;
         end if;
      end if;

      return Res;
   end Thread_Clock;

   ---------------------------------
   -- To_Composite_Execution_Time --
   ---------------------------------

   function To_Composite_Execution_Time
     (T : Time.Time) return Time.Composite_Execution_Time is
   begin
      return (High => Time.Word (T / 2 ** 32),
              Low  => Time.Word (T mod 2 ** 32));
   end To_Composite_Execution_Time;

   -------------
   -- To_Time --
   -------------

   function To_Time (High, Low : Time.Word) return Time.Time is
   begin
      return Time.Time (High) * 2 ** 32 + Time.Time (Low);
   end To_Time;

begin
   --  Set the hooks to enable computation

   System.BB.Time.Scheduling_Event_Hook       := Scheduling_Event'Access;
   System.BB.Time.Disable_Execution_Time_Hook := Disable_Execution_Time'Access;

   --  Initialize CPU_Clock

   declare
      Now : constant BB.Time.Time := System.BB.Time.Clock;
      --  ??? Clock is called before timer initialization
   begin
      CPU_Clock := (others => Now);
   end;
end System.BB.Execution_Time;
