--  Copyright (C) 2016 Free Software Foundation, Inc.
--
--  This file is part of the Cortex GNAT RTS project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.
--                                                                          --
------------------------------------------------------------------------------

--  Modified from the GCC 4.9.1 version for the Cortex GNAT RTS
--  project, for STM32F4.

package System.Interrupts is

   Default_Interrupt_Priority : constant System.Interrupt_Priority :=
     System.Interrupt_Priority'Last;
   --  Used (via rtsfind) when Interrupt_Priority isn't specified for
   --  a PO. This can only happen if the pragma form is used.

   type Interrupt_ID is range 0 .. 81;
   --  Has to match Ada.Interrupts.Interrupt_ID.

   subtype System_Interrupt_ID is Interrupt_ID;
   --  This synonym is introduced so that the type is accessible through
   --  rtsfind, otherwise the name clashes with its homonym in Ada.Interrupts.
   --
   --  i.e. this is necessary to support compiler mechanisms.

   type Parameterless_Handler is access protected procedure;
   --  This is actually a fat pointer, containing (a) the address of
   --  the protected object, (b) access to a wrapper procedure
   --  handlerP which takes the PO as an in out parameter and performs
   --  the locking, operation (in handlerN), and servicing.

   type New_Handler_Item is record
      Interrupt : Interrupt_ID;
      Handler   : Parameterless_Handler;
   end record;
   --  Contains all the information from an Attach_Handler pragma

   type New_Handler_Array is array (Positive range <>) of New_Handler_Item;
   --  All the handlers to be registered for one PO.

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : New_Handler_Array);
   --  Install the static Handlers for the given interrupts and do not
   --  store previously installed handlers. This procedure is used when
   --  the Ravenscar restrictions are in place since in that case there
   --  are only library-level protected handlers that will be installed
   --  at initialization and never be replaced.

   procedure Install_Restricted_Handlers_Sequential;
   pragma Export (C, Install_Restricted_Handlers_Sequential,
                  "__gnat_attach_all_handlers");
   --  When the partition elaboration policy is sequential, attachment of
   --  interrupts handlers is deferred until the end of elaboration. The
   --  binder will call this procedure at the end of elaboration, just before
   --  activating the tasks (if any).
   --
   --  Null implementation in this RTS.
end System.Interrupts;
