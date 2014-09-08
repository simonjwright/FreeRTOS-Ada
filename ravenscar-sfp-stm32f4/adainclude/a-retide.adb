------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                   A D A . R E A L _ T I M E . D E L A Y S                --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                     Copyright (C) 2001-2010, AdaCore                     --
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

with System.Task_Primitives.Operations;
--  Used for Timed_Delay
--           Self

package body Ada.Real_Time.Delays is

   package STPO renames System.Task_Primitives.Operations;

   -----------------
   -- Delay_Until --
   -----------------

   procedure Delay_Until (T : Time) is
   begin
      --  pragma Detect_Blocking is mandatory in this run time, so that
      --  Program_Error must be raised if this delay (potentially blocking
      --  operation) is called from a protected operation.

      if STPO.Self.Common.Protected_Action_Nesting > 0 then
         raise Program_Error;
      else
         STPO.Delay_Until (STPO.Time (T));
      end if;
   end Delay_Until;

   -----------------
   -- To_Duration --
   -----------------

   --  This function is not supposed to be used by the Ravenscar run time and
   --  it is not supposed to be with'ed by the user either (because it is an
   --  internal GNAT unit). It is kept here (returning a junk value) just for
   --  sharing the same package specification with the regular run time.

   function To_Duration (T : Time) return Duration is
      pragma Unreferenced (T);
   begin
      return 0.0;
   end To_Duration;

end Ada.Real_Time.Delays;
