------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--               S Y S T E M . S E C O N D A R Y _ S T A C K                --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--       Copyright (C) 1992-2013, 2016, Free Software Foundation, Inc.      --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

pragma Restrictions (No_Elaboration_Code);
pragma Compiler_Unit_Warning;

with System.Parameters;
with System.Storage_Elements;

package System.Secondary_Stack is
   pragma Preelaborate;

   --  The secondary stack for a task is an area in the task's stack
   --  reserved for managing objects of indefinite type
   --  (e.g. Strings).
   --
   --  The secondary stack is created as an object in the
   --  System.Tasking.Restricted.Stages Wrapper procedure.

   type Stack (Size : System.Parameters.Size_Type) is private;
   type Stack_Ptr is access all Stack with Storage_Size => 0;

   --  procedure SS_Init
   --    (Stk : in out System.Address;
   --     Size : Natural);
   --  Initialize a secondary stack at the given address to the given
   --  Size.

   procedure SS_Allocate
     (Addr         : out System.Address;
      Storage_Size : System.Storage_Elements.Storage_Count);
   --  Allocate enough space for a 'Storage_Size' bytes object with
   --  maximum alignment from the current task's stack. The address of
   --  the allocated space is returned in Addr.

   --  procedure SS_Free (Stk : in out Address);
   --  Release the memory allocated for the Secondary Stack. That is
   --  to say, all the allocated chunks. Upon return, Stk will be set
   --  to System.Null_Address.

   type Mark_Id is private;
   --  Type used to mark the stack for mark/release processing

   function SS_Mark return Mark_Id;
   --  Return the Mark corresponding to the current state of the stack

   procedure SS_Release (M : Mark_Id);
   --  Restore the state of the stack corresponding to the mark M.

   --  function SS_Get_Max return Long_Long_Integer;
   --  Return maximum used space in storage units for the current secondary
   --  stack. For a dynamically allocated secondary stack, the returned
   --  result is always -1. For a statically allocated secondary stack,
   --  the returned value shows the largest amount of space allocated so
   --  far during execution of the program to the current secondary stack,
   --  i.e. the secondary stack for the current task.

   --  generic
   --     with procedure Put_Line (S : String);
   --  procedure SS_Info;
   --  Debugging procedure used to print out secondary Stack allocation
   --  information. This procedure is generic in order to avoid a direct
   --  dependance on a particular IO package.

private
   SS_Pool : Integer;
   --  Unused entity that is just present to ease the sharing of the
   --  pool mechanism for specific allocation/deallocation in the
   --  compiler (???)

   type Memory_Array
     is array (System.Parameters.Size_Type range <>)
     of System.Storage_Elements.Storage_Element
   with
     Alignment => Standard'Maximum_Alignment;

   --  This stack grows up.
   type Stack (Size : System.Parameters.Size_Type) is record
      Top : System.Parameters.Size_Type := 1;
      Mem : Memory_Array (1 .. Size);
   end record;

   type Mark_Id is new System.Parameters.Size_Type;
   --  A mark value contains a stack pointer value corresponding to
   --  the point of the mark call.

end System.Secondary_Stack;
