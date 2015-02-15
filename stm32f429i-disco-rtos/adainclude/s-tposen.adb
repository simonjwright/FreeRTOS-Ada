------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--     S Y S T E M . T A S K I N G . P R O T E C T E D _ O B J E C T S .    --
--                          S I N G L E _ E N T R Y                         --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--          Copyright (C) 1992-2013, Free Software Foundation, Inc.         --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
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

--  Note: the compiler generates direct calls to this interface, via Rtsfind.
--  Any changes to this interface may require corresponding compiler changes.

with System.FreeRTOS.Tasks;

package body System.Tasking.Protected_Objects.Single_Entry is

   --------------------
   -- Local packages --
   --------------------

   type Queue_Item is null record;
   package Barrier_Queues is new FreeRTOS.Queues.Generic_Queues (Queue_Item);

   package Task_Operations is
      procedure Sleep (Object : Protection_Entry_Access);
      procedure Wakeup (Object : Protection_Entry_Access);
   end Task_Operations;

   ------------------------
   -- Spec'd subprograms --
   ------------------------

   procedure Initialize_Protection_Entry
     (Object            : Protection_Entry_Access;
      Ceiling_Priority  : Integer;
      Compiler_Info     : System.Address;
      Entry_Body        : Entry_Body_Access)
   is
   begin
      Initialize_Protection (Object.Common'Access, Ceiling_Priority);

      Object.Compiler_Info := Compiler_Info;
      Object.Call_In_Progress := null;
      Object.Entry_Body := Entry_Body;
      Object.Entry_Queue := null;
      Object.Barrier_Queue := Barrier_Queues.Create (Length => 1);
   end Initialize_Protection_Entry;

   procedure Lock_Entry (Object : Protection_Entry_Access) is
   begin
      Lock (Object.Common'Access);
   end Lock_Entry;

   procedure Lock_Read_Only_Entry (Object : Protection_Entry_Access) is
   begin
      Lock_Read_Only (Object.Common'Access);
   end Lock_Read_Only_Entry;

   function Protected_Count_Entry (Object : Protection_Entry) return Natural is
   begin
      return (if Object.Entry_Queue /= null then 1 else 0);
   end Protected_Count_Entry;

   procedure Protected_Single_Entry_Call
     (Object              : Protection_Entry_Access;
      Uninterpreted_Data  : System.Address) is
      Self_Id    : constant Task_Id := Self;
      Entry_Call : Entry_Call_Record renames Self_Id.Entry_Call;
   begin
      --  Program_Error must be raised if this potentially blocking
      --  operation is called from a protected action.

      if Self_Id.Common.Protected_Action_Nesting > 0 then
         raise Program_Error with "potentially blocking operation";
      end if;

      Lock_Entry (Object);
      --  No need to set Entry_Call.Self, it was initialized when the
      --  ATCB was created.
      Entry_Call.Uninterpreted_Data := Uninterpreted_Data;

      --  inline PO_Do_Or_Queue (Object, Entry_Call'Access);
      if Object.Entry_Body.Barrier (Object.Compiler_Info, 1) then

         if Object.Call_In_Progress /= null then
            --  This violates the No_Entry_Queue restriction, send
            --  Program_Error to the caller.

            raise Program_Error with "entry call already in progress";
         end if;

         Object.Call_In_Progress := Entry_Call'Access;
         Object.Entry_Body.Action
           (Object.Compiler_Info, Entry_Call.Uninterpreted_Data, 1);
         Object.Call_In_Progress := null;

         Unlock_Entry (Object);
      else
         if Object.Entry_Queue /= null then
            --  This violates the No_Entry_Queue restriction, send
            --  Program_Error to the caller.

            raise Program_Error with "entry call already queued";
         end if;

         Object.Entry_Queue := Entry_Call'Access;
         Unlock_Entry (Object);

         Task_Operations.Sleep (Object);
      end if;

      --  The call is either `Done' or not. It cannot be cancelled since there
      --  is no ATC construct.

      --  pragma Assert (Entry_Call.State /= Cancelled);

      --  if Entry_Call.State /= Done then
      --     if Single_Lock then
      --        STPO.Lock_RTS;
      --     end if;

      --     STPO.Write_Lock (Self_Id);
      --     Wait_For_Completion (Entry_Call'Access);
      --     STPO.Unlock (Self_Id);

      --     if Single_Lock then
      --        STPO.Unlock_RTS;
      --     end if;
      --  end if;

      --  Check_Exception (Self_Id, Entry_Call'Access);
   end Protected_Single_Entry_Call;

   function Protected_Single_Entry_Caller
     (Object : Protection_Entry) return Task_Id is
   begin
      return Object.Call_In_Progress.Self;
   end Protected_Single_Entry_Caller;

   procedure Service_Entry (Object : Protection_Entry_Access) is
      Entry_Call : constant Entry_Call_Link := Object.Entry_Queue;
   begin
      if Entry_Call /= null then
         if Object.Entry_Body.Barrier (Object.Compiler_Info, 1) then
            Object.Entry_Queue := null;

            if Object.Call_In_Progress /= null then
               --  Violation of No_Entry_Queue restriction, raise exception

               raise Program_Error with "entry call already in progress";
            end if;

            Object.Call_In_Progress := Entry_Call;
            Object.Entry_Body.Action
              (Object.Compiler_Info, Entry_Call.Uninterpreted_Data, 1);
            Object.Call_In_Progress := null;
            Unlock_Entry (Object);

            Task_Operations.Wakeup (Object);
         else
            --  Just unlock the entry

            Unlock_Entry (Object);
         end if;
      else
            --  Just unlock the entry

            Unlock_Entry (Object);
      end if;
   end Service_Entry;

   procedure Unlock_Entry (Object : Protection_Entry_Access) is
   begin
      Unlock (Object.Common'Access);
   end Unlock_Entry;

   --------------------
   -- Local packages --
   --------------------

   package body Task_Operations is

      procedure Sleep (Object : Protection_Entry_Access) is
         Dummy : Queue_Item with Unreferenced;
      begin
         Dummy := Barrier_Queues.Read (Object.Barrier_Queue);
      end Sleep;

      procedure Wakeup (Object : Protection_Entry_Access) is
      begin
         if FreeRTOS.Tasks.In_ISR then
            Barrier_Queues.Send_From_ISR (To => Object.Barrier_Queue,
                                          The_Item => (null record));
         else
            Barrier_Queues.Send (To => Object.Barrier_Queue,
                                 The_Item => (null record));
         end if;
      end Wakeup;

   end Task_Operations;

end System.Tasking.Protected_Objects.Single_Entry;
