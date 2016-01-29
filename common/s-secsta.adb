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

with Ada.Unchecked_Conversion;
with System.FreeRTOS.Tasks;
with System.Tasking;

package body System.Secondary_Stack is

   Environment_Secondary_Stack : Stack_Ptr;

   function Get_Current_Stack return Stack_Ptr;

   --  procedure SS_Init
   --    (Stk  : in out Address;
   --     Size : Natural) is
   --  begin
   --     null;
   --  end SS_Init;

   procedure SS_Allocate
     (Addr         : out System.Address;
      Storage_Size : System.Storage_Elements.Storage_Count) is
      use type System.Parameters.Size_Type;

      Current_Stack : constant Stack_Ptr := Get_Current_Stack;

      Aligned_Size : constant System.Parameters.Size_Type :=
        ((System.Parameters.Size_Type (Storage_Size)
            + Standard'Maximum_Alignment - 1)
           / Standard'Maximum_Alignment)
        * Standard'Maximum_Alignment;
   begin
      if Current_Stack.Top + Aligned_Size > Current_Stack.Size + 1 then
         raise Storage_Error;
      end if;

      Addr := Current_Stack.Mem (Current_Stack.Top)'Address;
      Current_Stack.Top := Current_Stack.Top + Aligned_Size;
   end SS_Allocate;

   function SS_Mark return Mark_Id is
   begin
      return Mark_Id (Get_Current_Stack.Top);
   end SS_Mark;

   procedure SS_Release (M : Mark_Id) is
   begin
      Get_Current_Stack.Top := System.Parameters.Size_Type (M);
   end SS_Release;

   function Get_Current_Stack return Stack_Ptr is
   begin
      if FreeRTOS.Tasks.Scheduler_Is_Running then
         return System.Tasking.Self.Secondary_Stack;
      else
         --  In the "environment task", i.e. main program
         if Environment_Secondary_Stack = null then
            --  This is the first time we've been called, so we have
            --  to set up the stack. You would have thought we could
            --  just declare an aliased object at package level, but
            --  this package is declared Preelaborate, so (if the
            --  compiler doesn't notice) the stack will be
            --  uninitialized.
            --
            --  We have to retain Preelaborate, because other packages
            --  require it (e.g. System.Tasking).
            declare
               type SP is access Stack;
               function To_Stack_Ptr
                 is new Ada.Unchecked_Conversion (SP, Stack_Ptr);
            begin
               Environment_Secondary_Stack :=
                 To_Stack_Ptr (new Stack (256));
            end;
         end if;
         return Environment_Secondary_Stack;
      end if;
   end Get_Current_Stack;

end System.Secondary_Stack;
