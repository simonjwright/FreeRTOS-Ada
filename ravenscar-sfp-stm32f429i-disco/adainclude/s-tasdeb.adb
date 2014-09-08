------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                  S Y S T E M . T A S K I N G . D E B U G                 --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--            Copyright (C) 2011, Free Software Foundation, Inc.            --
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

--  This package encapsulates all direct interfaces to task debugging services
--  that are needed by gdb with gnat mode.

--  Note : This file *must* be compiled with debugging information

--  Do not add any dependency to GNARL packages since this package is used
--  in both normal and restricted (ravenscar) environments.

package body System.Tasking.Debug is

   First_Task : Task_Id := null;
   pragma Unreferenced (First_Task);
   --  Head of known tasks list

   Last_Task  : Task_Id := null;
   --  Simply linked list of known tasks visible from GDB.  Tasks are always
   --  appended. The link is made with the Activation_Link component.

   -----------------
   -- Add_Task_Id --
   -----------------

   procedure Add_Task_Id (T : Task_Id) is
   begin
      pragma Assert (T.Common.Activation_Link = null);

      if Last_Task /= null then
         Last_Task.Common.Activation_Link := T;
      else
         First_Task := T;
      end if;

      Last_Task := T;
   end Add_Task_Id;

end System.Tasking.Debug;
