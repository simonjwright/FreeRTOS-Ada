------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                  S Y S T E M . B B . I N T E R R U P T S                 --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2004 The European Space Agency            --
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

--  Package in charge of implementing the basic routines for interrupt
--  management.

pragma Restrictions (No_Elaboration_Code);

with System;
with System.BB.Parameters;
with System.Multiprocessors;

package System.BB.Interrupts is
   pragma Preelaborate;

   Max_Interrupt : constant := System.BB.Parameters.Number_Of_Interrupt_ID;
   --  Number of interrupts

   subtype Interrupt_ID is Natural range 0 .. Max_Interrupt;
   --  Interrupt identifier

   No_Interrupt : constant Interrupt_ID := 0;
   --  Special value indicating no interrupt

   type Interrupt_Handler is access procedure (Id : Interrupt_ID);
   --  Prototype of procedures used as low level handlers

   procedure Initialize_Interrupts;
   --  Initialize table containing the pointers to the different interrupt
   --  stacks. Should be called before any other subprograms in this package.

   procedure Attach_Handler
     (Handler : not null Interrupt_Handler;
      Id      : Interrupt_ID;
      Prio    : Interrupt_Priority)
   with
     Pre => Id /= No_Interrupt;
   pragma Inline (Attach_Handler);
   --  Attach the procedure Handler as handler of the interrupt Id. Prio is
   --  the priority of the associated protected object. This priority could be
   --  used to program the hardware priority of the interrupt.

   function Current_Interrupt return Interrupt_ID;
   --  Function that returns the hardware interrupt currently being handled on
   --  the current CPU (if any). If no hardware interrupt is being handled the
   --  returned value is No_Interrupt.

   function Within_Interrupt_Stack
     (Stack_Address : System.Address) return Boolean;
   pragma Inline (Within_Interrupt_Stack);
   --  Function that tells whether the Address passed as argument belongs to
   --  the interrupt stack that is currently being used on current CPU (if
   --  any). It returns True if Stack_Address is within the range of the
   --  interrupt stack being used. False in case Stack_Address is not within
   --  the interrupt stack (or no interrupt is being handled).

end System.BB.Interrupts;
