------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                         S Y S T E M . B B . T I M E                      --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2004 The European Space Agency            --
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

--  Package in charge of implementing clock and timer functionalities

pragma Restrictions (No_Elaboration_Code);

with System.Multiprocessors;

package System.BB.Time is
   pragma Preelaborate;

   type Time is mod 2 ** 64;
   for Time'Size use 64;

   ------------------
   -- Time keeping --
   ------------------

   --  Time is represented at this level as a 64-bit unsigned number. We assume
   --  that the Board_Support.Read_Clock function provides access to a hardware
   --  clock with a resolution of 20 microseconds or better, counting from
   --  0 to Board_Support.Max_Timer_Interval over a period of at least 0.735
   --  seconds, and returning a value of the 32-bit Timer_Interval type. The
   --  clock resolution should be an integral number of nanoseconds between 1
   --  and 20_000.

   --  In addition, Board_Support provides an alarm facility, generating an
   --  alarm interrupt at up to Max_Timer_Interval clock ticks in the future.
   --  The clock frequency is the same as for Read_Clock, but it may or may not
   --  use the same timer. See the next section for more information.

   --  The Time package uses these facilities to keep a 64-bit clock that will
   --  allow a program to keep track of up to 50 years in the future without
   --  having the most significant bit set. This means it is always safe to
   --  subtract two Clock readings to determine a Time_Span without overflow.

   --  We need to support a clock running for 50 years, so this requires
   --  a hardware clock period of at least 1_577_880_000 / 2**31 or 0.735
   --  seconds. As comparison, a LEON2 at 80 MHz with 24-bit clock and the
   --  minimum prescale factor of 4, has a period of 2**24 / (80E6 / 4) = 0.839
   --  seconds, while a 200 MHz LEON3 has a period of 2**32 / (200E6 / 5) =
   --  107 seconds. For faster clocks or smaller clock width, higher prescaler
   --  values may be needed to achieve 50 year run time. The prescale factor
   --  should be chosen such that the period between clock ticks is an integral
   --  number of nanoseconds between 1 and 20_000.

   type Time_Span is range -2 ** 63 .. 2 ** 63 - 1;
   for Time_Span'Size use 64;
   --  Time_Span represents the length of time intervals, and it is defined as
   --  a 64-bit signed integer.

   ------------
   -- Alarms --
   ------------

   --  Alarms are used for two purposes:

   --    * Waking up tasks that sleep as result of Delay_Until

   --    * Clock updates, to prevent undetected wrap-around of the
   --      hardware clock

   --  Alarms use the same time unit as the clock used for time keeping,
   --  and need to be able to provide an alarm up to slightly less than
   --  Max_Timer_Interval ticks in the future; there always will be a pending
   --  alarm within this time frame because of required clock updates. A
   --  requirement is that an alarm always can be handled within 1/8th of the
   --  time it takes the hardware clock to wrap around. This gives an upper
   --  bound to how early we have to set the alarm to ensure timely clock
   --  updates. This will result in an interrupt rate 14% higher than
   --  absolutely necessary. However, as long as sleep-related alarms are
   --  sufficiently frequent, no extra clock-related interrupts are necessary.

   --------------------
   -- Execution time --
   --------------------

   --  System.BB.Execution_Time will set these hooks to enable execution time
   --  computation only when needed.

   Scheduling_Event_Hook : access procedure := null;
   --  This hooks must be called when the charged account change: in case of
   --  rescheduling and before and after the handling of interrupt.

   Disable_Execution_Time_Hook : access procedure := null;
   --  Called when all tasks become idle. Note that the time spent after the
   --  last call to Scheduling_Event_Hook is not charged.

   --------------------
   -- Initialization --
   --------------------

   procedure Initialize_Timers;
   --  Initialize this package (clock and alarm handlers). Must be called
   --  before any other functions.

   ----------------
   -- Operations --
   ----------------

   function Clock return Time;
   --  Get the number of ticks elapsed since startup

   procedure Delay_Until (T : Time);
   --  Suspend the calling thread until the absolute time specified by T

   function Get_Next_Timeout (CPU_Id : System.Multiprocessors.CPU) return Time;
   --  Get the date of the next alarm or timing event

   procedure Update_Alarm (Alarm : Time);
   --  Re-configure the timer if "Alarm" is earlier than the Pending_Alarm.
   --  Update_Alarm is the only routine allowed to set an alarm.

   --  Execution time

   --  Ada allows reading the execution time of any task. To support that, we
   --  need to have exclusive access to the time (which is costly as it is not
   --  possible to atomically read that value without using a spin lock and
   --  masking interrupts). To avoid that cost, let's split that type in two
   --  parts (that can be read or written atomically by the processor). It
   --  is not possible to read atomically the whole value, but it is possible
   --  to read a coherent value: if the time has been changed from A to B
   --  while being read, the value read is between A and B. Because of the
   --  architecture of the runtime, the execution time is always written
   --  atomically (written by the processor executing the task, within the
   --  kernel).

   --  The type Composite_Execution_Time is declared here so that s-bbthre
   --  doesn't depend on s-bbtiev. But this type is used by s-bbtiev.

   type Word is mod 2 ** 32;

   type Composite_Execution_Time is record
      High : Word;
      pragma Atomic (High);
      --  High part of execution time

      Low : Word;
      pragma Atomic (Low);
      --  Low part of execution time
   end record;

   Initial_Composite_Execution_Time : constant Composite_Execution_Time :=
                                                                     (0, 0);
   --  The initial value for Composite_Execution_Time

private
   pragma Inline (Clock);

end System.BB.Time;
