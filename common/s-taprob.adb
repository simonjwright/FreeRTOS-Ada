------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--      S Y S T E M . T A S K I N G . P R O T E C T E D _ O B J E C T S     --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--            Copyright (C) 1991-1994, Florida State University             --
--                     Copyright (C) 1995-2011, AdaCore                     --
--            Copyright (C) 2016, Free Software Foundation Inc.             --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
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

--  pragma Polling (Off);
--  Turn off polling, we do not want ATC polling to take place during
--  tasking operations. It causes infinite loops and other problems.

--  with System.Task_Primitives.Operations;
--  with System.Parameters;
--  with System.Traces;
--  with System.Soft_Links.Tasking;

package body System.Tasking.Protected_Objects is

   -----------------------
   -- Local subprograms --
   -----------------------

   --  use System.Task_Primitives.Operations;
   --  use System.Traces;

   ----------------
   -- Local Data --
   ----------------

   --  Locking_Policy : Character;
   --  pragma Import (C, Locking_Policy, "__gl_locking_policy");

   -------------------------
   -- Finalize_Protection --
   -------------------------

   --  procedure Finalize_Protection (Object : in out Protection) is
   --  begin
   --     Finalize_Lock (Object.L'Unrestricted_Access);
   --  end Finalize_Protection;

   ---------------------------
   -- Initialize_Protection --
   ---------------------------

   procedure Initialize_Protection
     (Object           : Protection_Access;
      Ceiling_Priority : Integer)
   is
      Init_Priority : Integer := Ceiling_Priority;

   begin
      if Init_Priority = Unspecified_Priority then
         Init_Priority  := System.Priority'Last;
      end if;

      Object.L := FreeRTOS.Semaphores.Create_Semaphore;
      FreeRTOS.Semaphores.Give (Object.L);
      Object.Ceiling := System.Any_Priority (Init_Priority);
      Object.Owner := Null_Task;
   end Initialize_Protection;

   -----------------
   -- Get_Ceiling --
   -----------------

   --  function Get_Ceiling
   --    (Object : Protection_Access) return System.Any_Priority is
   --  begin
   --     return Object.New_Ceiling;
   --  end Get_Ceiling;

   ----------
   -- Lock --
   ----------

   procedure Lock (Object : Protection_Access) is
   begin
      if FreeRTOS.Tasks.In_ISR then
         null;
      elsif Object.Ceiling in System.Interrupt_Priority then
         FreeRTOS.Tasks.Disable_Interrupts;
      else
         declare
            Self_Id : constant Task_Id := Self;
         begin
            --  If pragma Detect_Blocking is active (which it is, this
            --  is a restricted profile) then, as described in the ARM
            --  9.5.1, par. 15, we must check whether this is an
            --  external call on a protected subprogram with the same
            --  target object as that of the protected action that is
            --  currently in progress (i.e., if the caller is already
            --  the protected object's owner). If this is the case
            --  Program_Error must be raised.
            if Object.Owner = Self_Id then
               raise Program_Error with "external call on same object";
            end if;

            if Self_Id.Common.Base_Priority > Object.Ceiling then
               raise Program_Error with "ceiling violation";
            end if;

            FreeRTOS.Semaphores.Take (Object.L);

            --  We are entering in a protected action, so that we
            --  increase the protected object nesting level and update
            --  the protected object's owner.
            --
            --  In the non-restricted RTS, this is only done if pragma
            --  Detect_Blocking is active, but this is a restricted
            --  profile, so no need to check.

            --  Update the protected object's owner
            Object.Owner := Self_Id;

            --  Increase protected object nesting level
            Self_Id.Common.Protected_Action_Nesting :=
              Self_Id.Common.Protected_Action_Nesting + 1;

            --  Update the priority
            FreeRTOS.Tasks.Set_Priority
              (Self_Id.Common.Thread, To => Object.Ceiling);
         end;
      end if;
   end Lock;

   --------------------
   -- Lock_Read_Only --
   --------------------

   procedure Lock_Read_Only (Object : Protection_Access) is
   begin
      if FreeRTOS.Tasks.In_ISR then
         null;
      elsif Object.Ceiling in System.Interrupt_Priority then
         FreeRTOS.Tasks.Disable_Interrupts;
      else
         declare
            Self_Id : constant Task_Id := Self;
         begin
            --  If pragma Detect_Blocking is active (which it is, this
            --  is a restricted profile) then, as described in the ARM
            --  9.5.1, par. 15, we must check whether this is an
            --  external call on protected subprogram with the same
            --  target object as that of the protected action that is
            --  currently in progress (i.e., if the caller is already
            --  the protected object's owner). If this is the case
            --  hence Program_Error must be raised.
            --
            --  Note that in this case (getting read access), several
            --  tasks may have read ownership of the protected object,
            --  so that this method of storing the (single) protected
            --  object's owner does not work reliably for read
            --  locks. However, this is the approach taken for two
            --  major reasons: first, this function is not currently
            --  being used (it is provided for possible future use),
            --  and second, it largely simplifies the implementation.
            --
            --  ??? This function *is* being used! GCC 4.9.1

            if Object.Owner = Self_Id then
               raise Program_Error with "external call on same object";
            end if;

            FreeRTOS.Semaphores.Take (Object.L);

            if Self_Id.Common.Base_Priority > Object.Ceiling then
               raise Program_Error with "ceiling violation";
            end if;

            --  We are entering in a protected action, so we increase
            --  the protected object nesting level.
            --
            --  In the non-restricted RTS, this is only done if pragma
            --  Detect_Blocking is active, but this is a restricted
            --  profile, so no need to check.

            --  Update the protected object's owner
            Object.Owner := Self_Id;

            --  Increase protected object nesting level
            Self_Id.Common.Protected_Action_Nesting :=
              Self_Id.Common.Protected_Action_Nesting + 1;

            --  Update the priority
            FreeRTOS.Tasks.Set_Priority
              (Self_Id.Common.Thread, To => Object.Ceiling);
         end;
      end if;
   end Lock_Read_Only;

   -----------------
   -- Set_Ceiling --
   -----------------

   --  procedure Set_Ceiling
   --    (Object : Protection_Access;
   --     Prio   : System.Any_Priority) is
   --  begin
   --     Object.New_Ceiling := Prio;
   --  end Set_Ceiling;

   ------------
   -- Unlock --
   ------------

   procedure Unlock (Object : Protection_Access) is
   begin
      if FreeRTOS.Tasks.In_ISR then
         null;
      elsif Object.Ceiling in System.Interrupt_Priority then
         FreeRTOS.Tasks.Enable_Interrupts;
      else
         --  We are exiting from a non-interrupt protected action, so
         --  that we reset the priority, decrease the protected object
         --  nesting level and remove ownership of the protected
         --  object.
         --
         --  Calls to this section can only take place when being within
         --  a protected action and when the caller is the protected
         --  object's owner.
         declare
            Self_Id : constant Task_Id := Self;
         begin
            if Self_Id.Common.Protected_Action_Nesting = 0
              or else Object.Owner /= Self_Id
            then
               raise Program_Error with "improper call of Unlock";
            end if;

            --  Remove ownership of the protected object

            Object.Owner := Null_Task;

            --  We are exiting from a protected action, so we decrease the
            --  protected object nesting level.

            Self_Id.Common.Protected_Action_Nesting :=
              Self_Id.Common.Protected_Action_Nesting - 1;

            FreeRTOS.Tasks.Set_Priority
              (Self_Id.Common.Thread, To => Self_Id.Common.Base_Priority);

            FreeRTOS.Semaphores.Give (Object.L);
         end;
      end if;
   end Unlock;

--  begin
--     --  Ensure that tasking is initialized, as well as tasking soft links
--     --  when using protected objects.

--     Tasking.Initialize;
--     System.Soft_Links.Tasking.Init_Tasking_Soft_Links;
end System.Tasking.Protected_Objects;
