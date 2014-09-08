------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                   S Y S T E M . B B . I N T E R R U P T S                --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
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

pragma Restrictions (No_Elaboration_Code);

with System.Storage_Elements;
with System.BB.CPU_Primitives;
with System.BB.CPU_Primitives.Multiprocessors;
with System.BB.Threads;
with System.BB.Threads.Queues;
with System.BB.Board_Support;
with System.BB.Time;

package body System.BB.Interrupts is

   use System.Multiprocessors;
   use System.BB.CPU_Primitives.Multiprocessors;
   use System.BB.Threads;
   use System.BB.Time;

   ----------------
   -- Local data --
   ----------------

   type Stack_Space is new Storage_Elements.Storage_Array
     (1 .. Storage_Elements.Storage_Offset (Parameters.Interrupt_Stack_Size));
   for Stack_Space'Alignment use 8;
   --  Type used to represent the stack area for each interrupt. The stack must
   --  be aligned to 8 bytes to allow double word data movements.

   type Int_Stack_Id is range 1 .. Natural
     (Interrupt_Priority'Last - Interrupt_Priority'First + 1);

   Interrupt_Stacks : array (CPU, Int_Stack_Id) of Stack_Space;
   pragma Linker_Section (Interrupt_Stacks, ".interrupt_stacks");
   --  Array that contains the stack used for each interrupt priority on each
   --  CPU. Note that multiple interrupts with the same priority will share
   --  the same stack on a given CPU, as they never can both be executing at
   --  the same time. The interrupt stacks are assigned a special section,
   --  so the linker script can put them at a specific place and avoid useless
   --  initialization.

   Interrupt_Stack_Table : array (CPU, Int_Stack_Id) of System.Address;
   pragma Export (Asm, Interrupt_Stack_Table, "interrupt_stack_table");
   --  Table that contains a pointer to the top of the stack for each interrupt
   --  level on each CPU.

   type Handlers_Table is array (Interrupt_ID) of Interrupt_Handler;
   pragma Suppress_Initialization (Handlers_Table);
   --  Type used to represent the procedures used as interrupt handlers.
   --  We need to prevent initialization to avoid elaboration code, so we rely
   --  on default initialization to zero of uninitialized data.

   Interrupt_Handlers_Table : Handlers_Table;
   --  Table containing handlers attached to the different external interrupts

   Interrupt_Being_Handled : array (CPU) of Interrupt_ID :=
                               (others => No_Interrupt);
   pragma Volatile (Interrupt_Being_Handled);
   --  Interrupt_Being_Handled contains the interrupt currently being handled
   --  by each CPU in the system, if any. It is equal to No_Interrupt when no
   --  interrupt is handled. Its value is updated by the trap handler.

   -----------------------
   -- Local subprograms --
   -----------------------

   procedure Interrupt_Wrapper (Vector : CPU_Primitives.Vector_Id);
   --  This wrapper procedure is in charge of setting the appropriate
   --  software priorities before calling the user-defined handler.

   --------------------
   -- Attach_Handler --
   --------------------

   procedure Attach_Handler
     (Handler : not null Interrupt_Handler;
      Id      : Interrupt_ID;
      Prio    : Interrupt_Priority)
   is
   begin
      --  Check that we are attaching to a real interrupt

      pragma Assert (Id /= No_Interrupt);

      --  Copy the user's handler to the appropriate place within the table

      Interrupt_Handlers_Table (Id) := Handler;

      --  The BSP determines the vector that will be called when the given
      --  interrupt occurs, and then installs the handler there. This may
      --  include programming the interrupt controller.

      Board_Support.Install_Interrupt_Handler
        (Interrupt_Wrapper'Address, Id, Prio);
   end Attach_Handler;

   -----------------------
   -- Current_Interrupt --
   -----------------------

   function Current_Interrupt return Interrupt_ID is
      Result : constant Interrupt_ID := Interrupt_Being_Handled (Current_CPU);

   begin
      if Threads.Thread_Self.In_Interrupt then

         pragma Assert (Result /= No_Interrupt);
         return Result;

      else
         return No_Interrupt;
      end if;
   end Current_Interrupt;

   -----------------------
   -- Interrupt_Wrapper --
   -----------------------

   procedure Interrupt_Wrapper (Vector : CPU_Primitives.Vector_Id) is
      Self_Id         : constant Threads.Thread_Id := Threads.Thread_Self;
      Caller_Priority : constant Any_Priority :=
                         Threads.Get_Priority (Self_Id);
      Interrupt       : constant Interrupt_ID :=
                          Board_Support.Get_Interrupt_Request (Vector);
      Int_Priority    : constant Any_Priority :=
                          Board_Support.Priority_Of_Interrupt (Interrupt);
      CPU_Id          : constant CPU          := Current_CPU;
      Previous_Int    : constant Interrupt_ID :=
                          Interrupt_Being_Handled (CPU_Id);
      Prev_In_Interr  : constant Boolean := Self_Id.In_Interrupt;

   begin
      --  Handle spurious interrupts, reported as No_Interrupt. If they must be
      --  cleared, this should be done in Get_Interrupt_Request.

      if Interrupt = No_Interrupt then
         return;
      end if;

      --  Update execution time for the interrupted task

      if Scheduling_Event_Hook /= null then
         Scheduling_Event_Hook.all;
      end if;

      --  Store the interrupt being handled

      Interrupt_Being_Handled (CPU_Id) := Interrupt;

      --  Then, we must set the appropriate software priority corresponding
      --  to the interrupt being handled. It also deals with the appropriate
      --  interrupt masking.

      --  When this wrapper is called all interrupts are masked, and the active
      --  priority of the interrupted task must be lower than the priority of
      --  the interrupt (otherwise the interrupt would have been masked). The
      --  only exception to this is when a task is temporarily inserted in the
      --  ready queue because there is not a single task ready to execute; this
      --  temporarily inserted task may have a priority in the range of the
      --  interrupt priorities (it may be waiting in an entry for a protected
      --  handler), but interrupts would not be masked.

      pragma Assert
        (Caller_Priority <= Int_Priority or else Self_Id.State /= Runnable);

      Self_Id.In_Interrupt := True;
      Threads.Queues.Change_Priority (Self_Id, Int_Priority);

      CPU_Primitives.Enable_Interrupts (Int_Priority);

      --  Call the user handler

      Interrupt_Handlers_Table (Interrupt).all (Interrupt);

      CPU_Primitives.Disable_Interrupts;

      --  Update execution time for the interrupt. This must be done before
      --  changing priority (Scheduling_Event use priority to determine which
      --  task/interrupt will get the elapsed time).

      if Scheduling_Event_Hook /= null then
         Scheduling_Event_Hook.all;
      end if;

      --  Restore the software priority to the state before the interrupt
      --  happened. Interrupt unmasking is not done here (it will be done
      --  later by the interrupt epilogue).

      Threads.Queues.Change_Priority (Self_Id, Caller_Priority);

      --  Restore the interrupt that was being handled previously (if any)

      Interrupt_Being_Handled (CPU_Id) := Previous_Int;

      Self_Id.In_Interrupt := Prev_In_Interr;

   end Interrupt_Wrapper;

   ----------------------------
   -- Within_Interrupt_Stack --
   ----------------------------

   function Within_Interrupt_Stack
     (Stack_Address : System.Address) return Boolean
   is
      (Current_Interrupt /= No_Interrupt and then Stack_Address in
          Interrupt_Stacks (Current_CPU, Int_Stack_Id'First)
            (Stack_Space'First)'Address
             ..
          Interrupt_Stacks (Current_CPU, Int_Stack_Id'Last)
            (Stack_Space'Last)'Address);

   ---------------------------
   -- Initialize_Interrupts --
   ---------------------------

   procedure Initialize_Interrupts is
      use type System.Storage_Elements.Storage_Offset;
   begin
      for Proc in CPU'Range loop
         for Index in Int_Stack_Id'Range loop

            --  Store the pointer in the last double word

            Interrupt_Stack_Table (Proc, Index) :=
              Interrupt_Stacks (Proc, Index)(Stack_Space'Last - 7)'Address;
         end loop;
      end loop;
   end Initialize_Interrupts;
end System.BB.Interrupts;
