------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--         A D A . E X E C U T I O N _ T I M E . I N T E R R U P T S        --
--                                                                          --
--                                 B o d y                                  --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This is the Bare Board version of this package

with Ada.Unchecked_Conversion;

with System.BB.Execution_Time;
with System.BB.Interrupts;
with System.BB.Time;

package body Ada.Execution_Time.Interrupts is

   package SBET renames System.BB.Execution_Time;
   package SBI  renames System.BB.Interrupts;

   function To_CPU_Time is new Ada.Unchecked_Conversion
     (System.BB.Time.Time, CPU_Time);
   --  Function to change the view from System.BB.Time.Time (unsigned 64-bit)
   --  to CPU_Time (unsigned 64-bit).
   --
   --  CPU_Time is derived from Ada.Real_Time.Time which is derived from
   --  System.BB.Time.Time. So CPU_Time and System.BB.Time.Time are the same
   --  type, but Ada.Real_Time.Time is private so we don't have visibility.

   function Clock (Interrupt : Ada.Interrupts.Interrupt_ID) return CPU_Time is
      Execution_Time : constant System.BB.Time.Time :=
        SBET.Interrupt_Clock (SBI.Interrupt_ID (Interrupt));
   begin
      return To_CPU_Time (Execution_Time);
   end Clock;

   function Supported
     (Interrupt : Ada.Interrupts.Interrupt_ID) return Boolean is
      pragma Unreferenced (Interrupt);
   begin
      return True;
   end Supported;

end Ada.Execution_Time.Interrupts;
