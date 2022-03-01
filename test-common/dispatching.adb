--  Copyright (C) 2016, 2017, 2020 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

with Ada.Real_Time;

package body Dispatching is

   function Basis (B : Base) return Character is ('a');

   function Value (D : Derived) return Integer is (42);

   task T is
      pragma Task_Name ("dispatching.t");
   end T;

   task body T is
      type Base_P is access Base'Class;
      D : constant Base_P := new Derived;
   begin
      loop
         declare
            C : constant Character := D.Basis;
            V : constant Integer := D.Value;
         begin
            pragma Assert (C = 'a', "wrong C");
            pragma Assert (V = 42, "wrong V");
            null;
         end;
         declare
            Next : Ada.Real_Time.Time := Ada.Real_Time.Clock;
            use type Ada.Real_Time.Time;
         begin
            Next := Next + Ada.Real_Time.Milliseconds (500);
            delay until Next;
         end;
      end loop;
   end T;

end Dispatching;
