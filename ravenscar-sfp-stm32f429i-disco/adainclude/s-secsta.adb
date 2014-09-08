------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--               S Y S T E M . S E C O N D A R Y _ S T A C K                --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--          Copyright (C) 1992-2010, Free Software Foundation, Inc.         --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This is the HI-E version of this package

with Unchecked_Conversion;

package body System.Secondary_Stack is

   use type SSE.Storage_Offset;

   type Memory is array (Mark_Id range <>) of SSE.Storage_Element;

   type Stack_Id is record
      Top  : Mark_Id;
      Last : Mark_Id;
      Mem  : Memory (1 .. Mark_Id'Last);
   end record;
   pragma Suppress_Initialization (Stack_Id);

   type Stack_Ptr is access Stack_Id;

   function From_Addr is new Unchecked_Conversion (Address, Stack_Ptr);

   function Get_Sec_Stack return Stack_Ptr;
   pragma Import (C, Get_Sec_Stack, "__gnat_get_secondary_stack");
   --  Return the address of the secondary stack.
   --  In a multi-threaded environment, Sec_Stack should be a thread-local
   --  variable.
   --
   --  Possible separate implementation of Get_Sec_Stack in a single-threaded
   --  environment:
   --
   --  with System;

   --  package Secondary_Stack is
   --     function Get_Sec_Stack return System.Address;
   --     pragma Export (C, Get_Sec_Stack, "__gnat_get_secondary_stack");
   --  end Secondary_Stack;

   --  pragma Warnings (Off);
   --  with System.Secondary_Stack; use System.Secondary_Stack;
   --  pragma Warnings (On);

   --  package body Secondary_Stack is

   --     Chunk : aliased String (1 .. Default_Secondary_Stack_Size);
   --     for Chunk'Alignment use Standard'Maximum_Alignment;

   --     Initialized : Boolean := False;

   --     function Get_Sec_Stack return System.Address is
   --     begin
   --        if not Initialized then
   --           Initialized := True;
   --           SS_Init (Chunk'Address);
   --        end if;

   --        return Chunk'Address;
   --     end Get_Sec_Stack;

   --  end Secondary_Stack;

   -----------------
   -- SS_Allocate --
   -----------------

   procedure SS_Allocate
     (Address      : out System.Address;
      Storage_Size : SSE.Storage_Count)
   is
      Max_Align    : constant Mark_Id := Mark_Id (Standard'Maximum_Alignment);
      Max_Size     : constant Mark_Id :=
                       ((Mark_Id (Storage_Size) + Max_Align - 1) / Max_Align)
                         * Max_Align;
      Sec_Stack    : constant Stack_Ptr := Get_Sec_Stack;

   begin
      if Sec_Stack.Top + Max_Size > Sec_Stack.Last then
         raise Storage_Error;
      end if;

      Address := Sec_Stack.Mem (Sec_Stack.Top)'Address;
      Sec_Stack.Top := Sec_Stack.Top + Max_Size;
   end SS_Allocate;

   -------------
   -- SS_Init --
   -------------

   procedure SS_Init
     (Stk  : System.Address;
      Size : Natural := Default_Secondary_Stack_Size)
   is
      Stack : constant Stack_Ptr := From_Addr (Stk);
   begin
      pragma Assert (Size >= 2 * Mark_Id'Max_Size_In_Storage_Elements);
      Stack.Top := Stack.Mem'First;
      Stack.Last := Mark_Id (Size) - 2 * Mark_Id'Max_Size_In_Storage_Elements;
   end SS_Init;

   -------------
   -- SS_Mark --
   -------------

   function SS_Mark return Mark_Id is
   begin
      return Get_Sec_Stack.Top;
   end SS_Mark;

   ----------------
   -- SS_Release --
   ----------------

   procedure SS_Release (M : Mark_Id) is
   begin
      Get_Sec_Stack.Top := M;
   end SS_Release;

end System.Secondary_Stack;
