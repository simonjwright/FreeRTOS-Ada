------------------------------------------------------------------------------
--                                                                          --
--                        GNAT RUN-TIME COMPONENTS                          --
--                                                                          --
--              A D A . T A S K _ I D E N T I F I C A T I O N               --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--           Copyright (C) 1992-2013, Free Software Foundation, Inc.        --
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

--  This is the Ravenscar version of this package

with System.Task_Primitives.Operations;
--  used for Self
--           Is_Task_Context

pragma Warnings (Off);
--  Allow withing of non-Preelaborated units in Ada 2005 mode where this
--  package will be categorized as Preelaborate. See AI-362 for details.
--  It is safe in the context of the run-time to violate the rules.

with System.Tasking.Restricted.Stages;
--  used for Restricted_Terminated

pragma Warnings (On);

package body Ada.Task_Identification is

   use System.Tasking.Restricted.Stages;

   -----------------------
   -- Local Subprograms --
   -----------------------

   function Convert_Ids (T : Task_Id) return System.Tasking.Task_Id;
   function Convert_Ids (T : System.Tasking.Task_Id) return Task_Id;
   pragma Inline (Convert_Ids);
   --  Conversion functions between different forms of Task_Id

   ---------
   -- "=" --
   ---------

   function  "=" (Left, Right : Task_Id) return Boolean is
   begin
      return System.Tasking."=" (Convert_Ids (Left), Convert_Ids (Right));
   end "=";

   -----------------
   -- Abort_Task --
   ----------------

   procedure Abort_Task (T : Task_Id) is
   begin
      raise Program_Error;
   end Abort_Task;

   ----------------------------
   -- Activation_Is_Complete --
   ----------------------------

   function Activation_Is_Complete (T : Task_Id) return Boolean is
   begin
      raise Program_Error;
      return False;
   end Activation_Is_Complete;

   -----------------
   -- Convert_Ids --
   -----------------

   function Convert_Ids (T : Task_Id) return System.Tasking.Task_Id is
   begin
      return System.Tasking.Task_Id (T);
   end Convert_Ids;

   function Convert_Ids (T : System.Tasking.Task_Id) return Task_Id is
   begin
      return Task_Id (T);
   end Convert_Ids;

   ------------------
   -- Current_Task --
   ------------------

   function Current_Task return Task_Id is
   begin
      --  It is a bounded error to call this function from an interrupt
      --  handler (ARM C.7.1, par. 17), so that we raise Program_Error
      --  in that case.

      if not System.Task_Primitives.Operations.Is_Task_Context then
         raise Program_Error;
      end if;

      return Convert_Ids (System.Task_Primitives.Operations.Self);
   end Current_Task;

   ----------------------
   -- Environment_Task --
   ----------------------

   function Environment_Task return Task_Id is
   begin
      raise Program_Error;
      return Null_Task_Id;
   end Environment_Task;

   -----------
   -- Image --
   -----------

   function Image (T : Task_Id) return String is
      pragma Unreferenced (T);
   begin
      return "";
   end Image;

   -----------------
   -- Is_Callable --
   -----------------

   function Is_Callable (T : Task_Id) return Boolean is
   begin
      if T = Null_Task_Id then
         raise Program_Error;
      else
         return False;
      end if;
   end Is_Callable;

   -------------------
   -- Is_Terminated --
   -------------------

   function Is_Terminated (T : Task_Id) return Boolean is
   begin
      if T = Null_Task_Id then
         raise Program_Error;
      else
         return Restricted_Terminated (Convert_Ids (T));
      end if;
   end Is_Terminated;

end Ada.Task_Identification;
