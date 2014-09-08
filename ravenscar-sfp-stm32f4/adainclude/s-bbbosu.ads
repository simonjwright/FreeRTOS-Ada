------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                S Y S T E M . B B . B O A R D _ S U P P O R T             --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2006 The European Space Agency            --
--                     Copyright (C) 2003-2013, AdaCore                     --
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

--  This package defines an interface used for handling the peripherals
--  available in the target board that are needed by the target-independent
--  part of the run time.

pragma Restrictions (No_Elaboration_Code);

with System.BB.Interrupts;
with System.BB.CPU_Primitives;

package System.BB.Board_Support is
   pragma Preelaborate;

   -----------------------------
   -- Hardware Initialization --
   -----------------------------

   procedure Initialize_Board;
   --  Procedure that performs the hardware initialization of the board.
   --  Should be called before any other operations in this package.

   ------------------------------------------------
   -- Clock and Timer Definitions and Primitives --
   ------------------------------------------------

   type Timer_Interval is mod 2 ** 32;
   for Timer_Interval'Size use 32;
   --  This type represents any interval that we can measure within a
   --  Clock_Interrupt_Period. Even though this type is always 32 bits, its
   --  actual allowed range is 0 .. Max_Timer_Interval, which may be less,
   --  depending on the target.

   function Max_Timer_Interval return Timer_Interval;
   pragma Inline (Max_Timer_Interval);
   --  The maximum value of the hardware clock. The is the maximum value that
   --  Read_Clock may return, and the longest interval that Set_Alarm may use.
   --  The hardware clock period is Max_Timer_Interval + 1 clock ticks. An
   --  interrupt occurs after this number of ticks.

   function Ticks_Per_Second return Natural;
   pragma Inline (Ticks_Per_Second);
   --  Return number of clock ticks per second taking into account that the
   --  prescaler divides the system clock rate.

   procedure Set_Alarm (Ticks : Timer_Interval);
   --  Set an alarm that will expire after the specified number of clock ticks.
   --  This cancels any previous alarm set.

   function Read_Clock return Timer_Interval;
   --  Read the value contained in the clock hardware counter, and return the
   --  number of ticks elapsed since the last clock interrupt, that is, since
   --  the clock counter was last reloaded.

   function Alarm_Interrupt_ID return Interrupts.Interrupt_ID;
   pragma Inline (Alarm_Interrupt_ID);
   --  Return the interrupt level to use for the alarm clock handler

   procedure Clear_Alarm_Interrupt;
   pragma Inline (Clear_Alarm_Interrupt);
   --  Acknowledge the alarm interrupt

   ----------------
   -- Interrupts --
   ----------------

   procedure Clear_Interrupt_Request
     (Interrupt : System.BB.Interrupts.Interrupt_ID);
   pragma Inline (Clear_Interrupt_Request);
   --  Acknowledge the end of the interrupt

   function Get_Interrupt_Request
     (Vector : CPU_Primitives.Vector_Id)
      return System.BB.Interrupts.Interrupt_ID;
   pragma Inline (Get_Interrupt_Request);
   --  Function to be called from the trap handler to determine the external
   --  interrupt to handle for the given trap vector. If the trap does not
   --  correspond to an external interrupt (that is, if it is a synchronous
   --  trap) then interrupt level 0 (no interrupt) is returned.  If the
   --  system shares a single trap handler for multiple external interrupts,
   --  this would typically query the interrupt controller for determining
   --  the interrupt to handle.

   function Priority_Of_Interrupt
     (Interrupt : System.BB.Interrupts.Interrupt_ID)
      return System.Any_Priority;
   pragma Inline (Priority_Of_Interrupt);
   --  Function to obtain the priority associated with an interrupt. It returns
   --  System.Any_Priority'First if Interrupt is equal to zero (no interrupt).

   procedure Install_Interrupt_Handler
     (Handler   : Address;
      Interrupt : Interrupts.Interrupt_ID;
      Prio      : Interrupt_Priority);
   --  Determine the trap vector that will be called for handling the given
   --  external interrupt on the current CPU, and install the given handler
   --  there. It is an error to try to install two different handlers for the
   --  vector, though this procedure may be called for multiple interrupts
   --  that share the same vector, as long as they use the same Handler.
   --  The handler expects a single argument indicating the vector called.
   --  This routine may need to set up the interrupt controller to enable the
   --  given interrupt source, so it will actually cause a trap on the CPU.
   --  Note, this should not actually enable interrupts, as this is only done
   --  through CPU_Primitives.Enable_Interrupts, which typically uses a
   --  processor status register. Prio is the priority for the interrupt, and
   --  the hardware can be programmed to use that priority.

   procedure Set_Current_Priority (Priority : Any_Priority);
   pragma Inline (Set_Current_Priority);
   --  Only allow interrupts higher than the specified priority. This routine
   --  differes from the Enable_Interrupts/Disable_Interrupts procedures
   --  in CPU_Primitives in that it disables interrupts at the board level,
   --  rather than the CPU. Typically if board-specific support of an interrupt
   --  controller is needed to block interrupts of insufficient priority, this
   --  routine will be needed. On other systems, where the processor has this
   --  control, or where only a single interrupt priority is supported, this
   --  may be a null procedure.

   ---------------------
   -- Multiprocessors --
   ---------------------

   --  The following functions define an interface for handling the "poke"
   --  interrupts that are used to signal other processors in an multiprocessor
   --  system.

   function Poke_Interrupt_ID return Interrupts.Interrupt_ID;
   pragma Inline (Poke_Interrupt_ID);
   --  Return the interrupt level to use for poke, or No_Interrupt if the
   --  system is a monoprocessor or otherwise does not require pokes.

   procedure Clear_Poke_Interrupt;
   pragma Inline (Clear_Poke_Interrupt);
   --  Acknowledge the Poke interrupt

end System.BB.Board_Support;
