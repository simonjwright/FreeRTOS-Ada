------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--               S Y S T E M . B B . C P U _ P R I M I T I V E S            --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2004 The European Space Agency            --
--                     Copyright (C) 2003-2013, AdaCore                     --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
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

--  This package contains the primitives which are dependent on the
--  underlying processor.

pragma Restrictions (No_Elaboration_Code);

with System;
with System.BB.Parameters;

package System.BB.CPU_Primitives is
   pragma Preelaborate;

   type Word is mod 2**System.Word_Size;

   ------------------------
   -- Context management --
   ------------------------

   --  The context buffer is an abstract type that holds all values indexed by
   --  Context_Id that make up a thread's state which are not otherwise stored
   --  in main memory. This typically includes all user-visible registers, and
   --  possibly some other status as well.

   --  In case different contexts have different amounts of state (for example,
   --  due to absence of a floating-point unit in a particular configuration,
   --  or just the FPU not being used), it is expected that these details
   --  are handled in the implementation, which should ignore updates of
   --  unsupported state and return a default value for queries of such state.

   type Context_Buffer is private;

   type Context_Id is range 0 .. Parameters.Context_Buffer_Capacity - 1;
   --  Type used for accessing to the different elements in the context buffer

   procedure Context_Switch;
   pragma Inline (Context_Switch);
   --  Perform the context switch between the running_thread and the
   --  first_thread. The value of running_thread will be updated.

   function Get_Context
     (Context : Context_Buffer;
      Index   : Context_Id) return Word;
   pragma Inline (Get_Context);
   --  Returns item of the specified context.

   procedure Set_Context
     (Context : in out Context_Buffer;
      Index   : Context_Id;
      Value   : Word);
   pragma Inline (Set_Context);
   --  Updates the given context.

   procedure Initialize_Context
     (Buffer          : not null access Context_Buffer;
      Program_Counter : System.Address;
      Argument        : System.Address;
      Stack_Pointer   : System.Address);
   pragma Inline (Initialize_Context);
   --  Initialize_Context inserts inside the context buffer the default
   --  values for each register. The values for the stack pointer, the
   --  program counter, and argument to be passed are provided as arguments.

   ---------------------------------
   -- Interrupt and trap handling --
   ---------------------------------

   type Vector_Id is range 0 .. Parameters.Trap_Vectors - 1;

   procedure Install_Error_Handlers;
   pragma Inline (Install_Error_Handlers);
   --  Called at system initialization time to install a CPU specific
   --  trap handler, GNAT_Error_Handler, that converts synchronous traps
   --  to appropriate exceptions.

   procedure Install_Trap_Handler
     (Service_Routine : System.Address;
      Vector          : Vector_Id;
      Synchronous     : Boolean := False);
   --  Install a new handler in the trap table, both for synchronous and
   --  asynchronous traps. Interrupts must be disabled before the the trap
   --  handler is called.

   procedure Disable_Interrupts;
   pragma Inline (Disable_Interrupts);
   --  All external interrupts (asynchronous traps) are disabled. Note
   --  that this will take care of the CPU specific part of enabling and
   --  disabling the interrupts. For systems were this is not sufficient, the
   --  Board_Support.Set_Current_Priority routine must also be implemented in
   --  order to do the board-specific enable/disable operations.

   procedure Enable_Interrupts (Level : System.Any_Priority);
   pragma Inline (Enable_Interrupts);
   --  Interrupts are enabled if they are above the value given by Level

   procedure Initialize_Floating_Point;
   pragma Inline (Initialize_Floating_Point);
   --  Install the floating point trap handler in charge of performing
   --  floating-point context switches.

private
   Context_Buffer_Size : constant :=
     Parameters.Context_Buffer_Capacity * System.Word_Size;
   --  Size calculated taken into account that the components are 32-bit, and
   --  that we want then aligned on 64-bit boundaries.

   type Context_Buffer is array (Context_Id) of System.Address;
   for Context_Buffer'Size use Context_Buffer_Size;
   for Context_Buffer'Alignment use 8;
   --  This array contains all the registers that the thread needs to save
   --  within its thread descriptor. Using double word boundaries allows us
   --  to use double word loads and stores safely in the context switch.

end System.BB.CPU_Primitives;
