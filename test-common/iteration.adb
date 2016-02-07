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

with Ada.Containers.Bounded_Vectors;
with Ada.Containers.Bounded_Hashed_Maps;
with Ada.Real_Time;

package body Iteration is

   task Arrays with Storage_Size => 1024;
   task body Arrays is
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
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (3);
      end loop;
   end Arrays;

   task Vectors with Storage_Size => 2048;
   task body Vectors is
      subtype Index is Positive range 1 .. 10;
      package Integer_Vectors
        is new Ada.Containers.Bounded_Vectors (Index_Type => Index,
                                               Element_Type => Natural);
      V : Integer_Vectors.Vector (Capacity => 10);
      use type Ada.Real_Time.Time;
   begin
      delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (1);
      loop
         V.Clear;
         V.Append (New_Item => 0, Count => 10);
         if (for some J of V => J = 42) then
            raise Constraint_Error with "existential quantifier succeeded";
         end if;
         V.Clear;
         V.Append (New_Item => 42, Count => 10);
         if not (for all J of V => J = 42) then
            raise Constraint_Error with "universal quantifier failed";
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (3);
      end loop;
   end Vectors;

   task Maps with Storage_Size => 2048;
   task body Maps is
      subtype Key_Type is Positive range 1 .. 10;
      function Hash (Key : Key_Type) return Ada.Containers.Hash_Type
        is (Ada.Containers.Hash_Type (Key));
      package Integer_Maps
        is new Ada.Containers.Bounded_Hashed_Maps (Key_Type => Key_Type,
                                                   Element_Type => Natural,
                                                   Hash => Hash,
                                                   Equivalent_Keys => "=");
      M : Integer_Maps.Map (Capacity => 10, Modulus => 7);
      use type Ada.Real_Time.Time;
   begin
      delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      loop
         M.Clear;
         for J in Key_Type loop
            M.Insert (Key => J, New_Item => 0);
         end loop;
         if (for some J of M => J = 42) then
            raise Constraint_Error with "existential quantifier succeeded";
         end if;
         M.Clear;
         for J in Key_Type loop
            M.Insert (Key => J, New_Item => 42);
         end loop;
         if not (for all J of M => J = 42) then
            raise Constraint_Error with "universal quantifier failed";
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (3);
      end loop;
   end Maps;

end Iteration;
