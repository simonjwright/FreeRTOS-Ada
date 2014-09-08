------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--     S Y S T E M . T A S K I N G . P R O T E C T E D _ O B J E C T S .    --
--                          S I N G L E _ E N T R Y                         --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                     Copyright (C) 1998-2013, AdaCore                     --
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
------------------------------------------------------------------------------

pragma Style_Checks (All_Checks);
--  Turn off subprogram ordering check, since restricted GNARLI
--  subprograms are gathered together at end.

--  This package provides an optimized version of Protected_Objects.Operations
--  and Protected_Objects.Entries making the following assumptions:
--
--  PO have only one entry
--  There is only one caller at a time (No_Entry_Queue)
--  There is no dynamic priority support (No_Dynamic_Priorities)
--  No Abort Statements
--    (No_Abort_Statements, Max_Asynchronous_Select_Nesting => 0)
--  PO are at library level
--  No Requeue
--  None of the tasks will terminate (no need for finalization)
--
--  This interface is intended to be used in the ravenscar and restricted
--  profiles, the compiler is responsible for ensuring that the conditions
--  mentioned above are respected, except for the No_Entry_Queue restriction
--  that is checked dynamically in this package, since the check cannot be
--  performed at compile time (see Protected_Single_Entry_Call, Service_Entry).

pragma Polling (Off);
--  Turn off polling, we do not want polling to take place during tasking
--  operations. It can cause  infinite loops and other problems.

pragma Suppress (All_Checks);

with System.Multiprocessors;

with System.Task_Primitives.Operations;
--  used for Self
--           Get_Priority
--           Set_Priority

with System.Tasking.Protected_Objects.Multiprocessors;

package body System.Tasking.Protected_Objects.Single_Entry is

   use System.Multiprocessors;

   package STPO renames System.Task_Primitives.Operations;
   package STPOM renames System.Tasking.Protected_Objects.Multiprocessors;

   Multiprocessor : constant Boolean := CPU'Range_Length /= 1;

   ---------------------------------
   -- Initialize_Protection_Entry --
   ---------------------------------

   procedure Initialize_Protection_Entry
     (Object           : Protection_Entry_Access;
      Ceiling_Priority : Integer;
      Compiler_Info    : System.Address;
      Entry_Body       : Entry_Body_Access)
   is
   begin
      Initialize_Protection (Object.Common'Access, Ceiling_Priority);

      Object.Compiler_Info := Compiler_Info;
      Object.Call_In_Progress := null;
      Object.Entry_Body := Entry_Body;
      Object.Entry_Queue := null;
   end Initialize_Protection_Entry;

   ----------------
   -- Lock_Entry --
   ----------------

   procedure Lock_Entry (Object : Protection_Entry_Access) is
   begin
      Lock (Object.Common'Access);
   end Lock_Entry;

   ----------------------------
   -- Protected_Single_Count --
   ----------------------------

   function Protected_Count_Entry (Object : Protection_Entry) return Natural is
   begin
      return Boolean'Pos (Object.Entry_Queue /= null);
   end Protected_Count_Entry;

   ---------------------------------
   -- Protected_Single_Entry_Call --
   ---------------------------------

   procedure Protected_Single_Entry_Call
     (Object             : Protection_Entry_Access;
      Uninterpreted_Data : System.Address)
   is
      Self_Id : constant Task_Id := STPO.Self;

   begin
      --  For this run time, pragma Detect_Blocking is always active, so we
      --  must raise Program_Error if this potentially blocking operation is
      --  called from a protected action.

      if Self_Id.Common.Protected_Action_Nesting > 0 then
         raise Program_Error;
      end if;

      Lock_Entry (Object);
      Self_Id.Entry_Call.Uninterpreted_Data := Uninterpreted_Data;

      if Object.Entry_Body.Barrier (Object.Compiler_Info, 1) then

         --  No other task can be executing an entry within this protected
         --  object. On a single processor implementation (such as this one),
         --  the ceiling priority protocol and the strictly preemptive priority
         --  scheduling policy guarantee that protected objects are always
         --  available when any task tries to use them (otherwise, either the
         --  currently executing task would not have had a high enough priority
         --  to be executing, or a blocking operation would have been called
         --  from within the entry body).

         pragma Assert (Object.Call_In_Progress = null);

         Object.Call_In_Progress := Self_Id.Entry_Call'Access;
         Object.Entry_Body.Action
           (Object.Compiler_Info, Self_Id.Entry_Call.Uninterpreted_Data, 1);
         Object.Call_In_Progress := null;

         --  Entry call is over

         Unlock_Entry (Object);

      else
         if Object.Entry_Queue /= null then

            --  This violates the No_Entry_Queue restriction, raise
            --  Program_Error.

            Unlock_Entry (Object);
            raise Program_Error;
         end if;

         --  There is a potential race condition between the Unlock_Entry and
         --  the Sleep below (the Wakeup may be called before the Sleep). This
         --  case is explicitly handled in the Sleep and Wakeup procedures:
         --  Sleep won't block if Wakeup has been called before.

         Object.Entry_Queue := Self_Id.Entry_Call'Access;
         Unlock_Entry (Object);

         --  Suspend until entry call has been completed.
         --  On exit, the call will not be queued.

         Self_Id.Common.State := Entry_Caller_Sleep;
         STPO.Sleep (Self_Id, Entry_Caller_Sleep);
         Self_Id.Common.State := Runnable;
      end if;
   end Protected_Single_Entry_Call;

   -----------------------------------
   -- Protected_Single_Entry_Caller --
   -----------------------------------

   function Protected_Single_Entry_Caller
     (Object : Protection_Entry) return Task_Id
   is
   begin
      return Object.Call_In_Progress.Self;
   end Protected_Single_Entry_Caller;

   -------------------
   -- Service_Entry --
   -------------------

   procedure Service_Entry (Object : Protection_Entry_Access) is
      Entry_Call : constant Entry_Call_Link := Object.Entry_Queue;
      Caller     : Task_Id;

   begin
      if Entry_Call /= null
        and then Object.Entry_Body.Barrier (Object.Compiler_Info, 1)
      then
         Object.Entry_Queue := null;

         --  No other task can be executing an entry within this protected
         --  object. On a single processor implementation (such as this one),
         --  the ceiling priority protocol and the strictly preemptive
         --  priority scheduling policy guarantee that protected objects are
         --  always available when any task tries to use them (otherwise,
         --  either the currently executing task would not have had a high
         --  enough priority to be executing, or a blocking operation would
         --  have been called from within the entry body).

         pragma Assert (Object.Call_In_Progress = null);

         Object.Call_In_Progress := Entry_Call;
         Object.Entry_Body.Action
           (Object.Compiler_Info, Entry_Call.Uninterpreted_Data, 1);
         Object.Call_In_Progress := null;
         Caller := Entry_Call.Self;
         Unlock_Entry (Object);

         --  Signal the entry caller that the entry is completed

         if not Multiprocessor
           or else Caller.Common.Base_CPU = STPO.Self.Common.Base_CPU
         then
            --  Entry caller and servicing tasks are on the same CPU.
            --  We are allowed to directly wake up the task.

            STPO.Wakeup (Caller, Entry_Caller_Sleep);
         else
            --  The entry caller is on a different CPU.

            STPOM.Served (Entry_Call);
         end if;

      else
         --  Just unlock the entry

         Unlock_Entry (Object);
      end if;
   end Service_Entry;

   ------------------
   -- Unlock_Entry --
   ------------------

   procedure Unlock_Entry (Object : Protection_Entry_Access) is
   begin
      Unlock (Object.Common'Access);
   end Unlock_Entry;

end System.Tasking.Protected_Objects.Single_Entry;
