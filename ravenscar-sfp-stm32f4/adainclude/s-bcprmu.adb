------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--                 SYSTEM.BB.CPU_PRIMITIVES.MULTIPROCESSORS                 --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                     Copyright (C) 2010-2013, AdaCore                     --
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
------------------------------------------------------------------------------

pragma Restrictions (No_Elaboration_Code);

package body System.BB.CPU_Primitives.Multiprocessors is

   -----------------
   -- Current_CPU --
   -----------------

   function Current_CPU return System.Multiprocessors.CPU is
   begin
      return System.Multiprocessors.CPU'First;
   end Current_CPU;

   --------------
   -- Poke_CPU --
   --------------

   procedure Poke_CPU (CPU_Id : System.Multiprocessors.CPU) is
   begin
      null;
   end Poke_CPU;

   ---------------
   -- Start_CPU --
   ---------------

   procedure Start_CPU (CPU_Id : System.Multiprocessors.CPU) is
   begin
      null;
   end Start_CPU;

   --------------------
   -- Start_All_CPUs --
   --------------------

   procedure Start_All_CPUs is
   begin
      null;
   end Start_All_CPUs;

end System.BB.CPU_Primitives.Multiprocessors;
