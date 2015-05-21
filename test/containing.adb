--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

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

   task Vectors
   with
     Storage_Size => 2048;
   task body Vectors is
      use Ada.Real_Time;
   begin
      loop
         Vectored_Lines.Clear;

         for J in Index loop
            Vectored_Lines.Append ((others => '*'));
         end loop;

         for J in Index loop
            Vectored_Lines (J) :=
              (others => Character'Val (Character'Pos ('a') + J));
         end loop;

         pragma Assert
           ((for some L of Vectored_Lines => L = Line'(others => 's')),
              "line 's' missing");

         pragma Assert
           ((for all L of Vectored_Lines => L /= Line'(others => 'u')),
              "line 'u' present");

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
      loop
         Mapped_Lines.Clear;

         for J in Index loop
            Mapped_Lines.Insert
              (Key      => J,
               New_Item => (others =>
                              Character'Val (Character'Pos ('a') + J)));
         end loop;

         for J in Index loop
            declare
               L : Line
                 with
                   Volatile,
                   Unreferenced;
            begin
               L := Mapped_Lines (J);
               Mapped_Lines (J) :=
                 (others => Character'Val (Character'Pos ('a') + 19 - J));
            end;
         end loop;

         delay until Clock + Milliseconds (1_000);
      end loop;
   end Maps;

end Containing;
