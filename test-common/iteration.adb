--  Copyright (C) 2016 Free Software Foundation, Inc.

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

package body Iteration is

   task T;
   task body T is
      subtype Index is Positive range 1 .. 10;
      A : array (Index) of Integer;
      use type Ada.Real_Time.Time;
      use Ada.Real_Time;
   begin
      loop
         A := (others => 0);
         if (for some J of A => J = 42) then
            raise Constraint_Error with "existential quantifier succeeded";
         end if;
         A := (others => 42);
         if not (for all J of A => J = 42) then
            raise Constraint_Error with "universal quantifier failed";
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end T;

end Iteration;
