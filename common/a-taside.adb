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

package body Ada.Task_Identification is

   --  use System.Parameters;

   --  package STPO renames System.Task_Primitives.Operations;

   --  -----------------------
   --  -- Local Subprograms --
   --  -----------------------

   --  function Convert_Ids (T : Task_Id) return System.Tasking.Task_Id;
   --  function Convert_Ids (T : System.Tasking.Task_Id) return Task_Id;
   --  pragma Inline (Convert_Ids);
   --  --  Conversion functions between different forms of Task_Id

   ---------
   -- "=" --
   ---------

   function "=" (Left, Right : Task_Id) return Boolean is
   begin
      return System.Tasking."=" (System.Tasking.Task_Id (Left),
                                 System.Tasking.Task_Id (Right));
   end "=";

   procedure Abort_Task (T : Task_Id) is
   begin
      raise Program_Error with "Abort_Task not supported";
   end Abort_Task;

   function Activation_Is_Complete (T : Task_Id) return Boolean is
   begin
      raise Program_Error with "Activation_Is_Complete not supported";
      return False;
   end Activation_Is_Complete;

   --  -----------------
   --  -- Convert_Ids --
   --  -----------------

   --  function Convert_Ids (T : Task_Id) return System.Tasking.Task_Id is
   --  begin
   --     return System.Tasking.Task_Id (T);
   --  end Convert_Ids;

   --  function Convert_Ids (T : System.Tasking.Task_Id) return Task_Id is
   --  begin
   --     return Task_Id (T);
   --  end Convert_Ids;

   function Current_Task return Task_Id is
   begin
      return Task_Id (System.Tasking.Self);
   end Current_Task;

   function Environment_Task return Task_Id is
   begin
      --  There's no enviroment task in this port.
      return null;
   end Environment_Task;

   function Image (T : Task_Id) return String is
      pragma Unreferenced (T);
   begin
      return "";
   end Image;

   function Is_Callable (T : Task_Id) return Boolean is
   begin
      if T = Null_Task_Id then
         raise Program_Error;
         return False;
      else
         raise Program_Error with "Is_Callable not supported";
         return False;
      end if;
   end Is_Callable;

   function Is_Terminated (T : Task_Id) return Boolean is
   begin
      if T = Null_Task_Id then
         raise Program_Error;
      else
         return False;
      end if;
   end Is_Terminated;

end Ada.Task_Identification;
