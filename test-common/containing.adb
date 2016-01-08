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

pragma Restrictions (No_Implicit_Heap_Allocations);
--  Without this, GNAT GPL 2014 & GCC 4.9.1 think that this unit
--  violates the restriction (which isn't allowed in Ravenscar).

with Ada.Containers.Bounded_Vectors;
with Ada.Containers.Bounded_Hashed_Maps;
with Ada.Real_Time;

package body Containing is

   subtype Index is Natural range 0 .. 19;
   subtype Line is String (1 .. 20);

   package Line_Vectors
     is new Ada.Containers.Bounded_Vectors (Index_Type   => Index,
                                            Element_Type => Line);

   Vectored_Lines : Line_Vectors.Vector (20);

   task Vectors;
   task body Vectors is
      use Ada.Real_Time;
   begin
      for J in Index loop
         Vectored_Lines.Append ((others => '*'));
      end loop;

      for J in Index loop
         Vectored_Lines (J) :=
           (others => Character'Val (Character'Pos ('a') + J));
      end loop;

      loop
         delay until Clock + Milliseconds (1_000);
      end loop;
   end Vectors;

   function Index_Hash (Key : Index) return Ada.Containers.Hash_Type is
     (Ada.Containers.Hash_Type (Key));

   package Line_Maps
     is new Ada.Containers.Bounded_Hashed_Maps (Element_Type    => Line,
                                                Key_Type        => Index,
                                                Hash            => Index_Hash,
                                                Equivalent_Keys => "=");

   Mapped_Lines : Line_Maps.Map (Capacity => 20,
                                 Modulus  => 20);

   task Maps;
   task body Maps is
      use Ada.Real_Time;
   begin
      for J in Index loop
         Mapped_Lines.Insert
           (Key      => J,
            New_Item => (others => Character'Val (Character'Pos ('a') + J)));
      end loop;

      for J in Index loop
         declare
            L : Line with Volatile, Unreferenced;
         begin
            L := Mapped_Lines (J);
            Mapped_Lines (J) :=
              (others => Character'Val (Character'Pos ('a') + 19 - J));
         end;
      end loop;

      loop
         delay until Clock + Milliseconds (1_000);
      end loop;
   end Maps;

end Containing;
