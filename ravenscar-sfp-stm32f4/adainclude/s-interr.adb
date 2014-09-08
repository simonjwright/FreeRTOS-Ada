------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--                     S Y S T E M . I N T E R R U P T S                    --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                     Copyright (C) 2001-2013, AdaCore                     --
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
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This is a generic bare board version of this package

pragma Restrictions (No_Elaboration_Code);

with System.Tasking.Restricted.Stages;

package body System.Interrupts is

   ----------------
   -- Local Data --
   ----------------

   type Handler_Entry is record
      Handler : Parameterless_Handler;
      --  The protected subprogram

      PO_Priority : Interrupt_Priority;
      --  The priority of the protected object in which the handler is declared
      --
      --  As the handler is a fat pointer to both the subprogram and the
      --  protected object, it could be possible to extract the priority
      --  from the access. But there is currently no mechanism for that ???
   end record;
   pragma Suppress_Initialization (Handler_Entry);

   type Handlers_Table is array (Interrupt_ID) of Handler_Entry;
   pragma Suppress_Initialization (Handlers_Table);
   --  Type used to represent the procedures used as interrupt handlers. No
   --  need to create an initializer, as the only object declared with this
   --  type is just below and has an expression to initialize it.

   User_Handlers : Handlers_Table :=
                     (others => (null, Interrupt_Priority'First));
   --  Table containing user handlers. Must be explicitly initialized to detect
   --  interrupts without attached handlers.

   -----------------------
   -- Local Subprograms --
   -----------------------

   procedure Install_Handler (Interrupt : Interrupt_ID);
   --  Install the runtime umbrella handler for a hardware interrupt

   procedure Default_Handler (Interrupt : System.OS_Interface.Interrupt_ID);
   --  Default interrupt handler

   ---------------------
   -- Default_Handler --
   ---------------------

   procedure Default_Handler (Interrupt : System.OS_Interface.Interrupt_ID) is
      Handler : constant Parameterless_Handler :=
                   User_Handlers (Interrupt_ID (Interrupt)).Handler;
   begin
      if Handler = null then

         --  Be sure to properly report spurious interrupts even if the run
         --  time is compiled with checks suppressed.

         --  The ravenscar-sfp profile has a No_Exception_Propagation
         --  restriction. Discard compiler warning on the raise statement.

         pragma Warnings (Off);
         raise Program_Error;
         pragma Warnings (On);
      end if;

      --  As exception propagated from a handler that is invoked by an
      --  interrupt must have no effect (ARM C.3 par. 7), interrupt handlers
      --  are wrapped by a null exception handler to avoid exceptions to be
      --  propagated further.

      --  The ravenscar-sfp profile has a No_Exception_Propagation
      --  restriction. Discard compiler warning on the handler.

      pragma Warnings (Off);

      begin
         Handler.all;

      exception

         --  Avoid any further exception propagation

         when others =>
            null;
      end;

      pragma Warnings (On);
   end Default_Handler;

   --  Depending on whether exception propagation is supported or not, the
   --  implementation will differ; exceptions can never be propagated through
   --  this procedure (see ARM C.3 par. 7).

   ---------------------
   -- Install_Handler --
   ---------------------

   procedure Install_Handler (Interrupt : Interrupt_ID) is
   begin
      --  Attach the default handler to the specified interrupt. This handler
      --  will in turn call the user handler.

      System.OS_Interface.Attach_Handler
        (Default_Handler'Access,
         System.OS_Interface.Interrupt_ID (Interrupt),
         User_Handlers (Interrupt).PO_Priority);
   end Install_Handler;

   ---------------------------------
   -- Install_Restricted_Handlers --
   ---------------------------------

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : Handler_Array)
   is
      use System.Tasking.Restricted.Stages;

   begin
      for J in Handlers'Range loop

         --  Copy the handler in the table that contains the user handlers

         User_Handlers (Handlers (J).Interrupt) :=
           (Handlers (J).Handler, Prio);

         --  Install the handler now, unless attachment is deferred because of
         --  sequential partition elaboration policy.

         if Partition_Elaboration_Policy /= 'S' then
            Install_Handler (Handlers (J).Interrupt);
         end if;
      end loop;
   end Install_Restricted_Handlers;

   --------------------------------------------
   -- Install_Restricted_Handlers_Sequential --
   --------------------------------------------

   procedure Install_Restricted_Handlers_Sequential is
   begin
      for J in User_Handlers'Range loop
         if User_Handlers (J).Handler /= null then
            Install_Handler (J);
         end if;
      end loop;
   end Install_Restricted_Handlers_Sequential;

end System.Interrupts;
