--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

pragma Restrictions (No_Implicit_Heap_Allocations);
--  Without this, GNAT GPL 2014 & GCC 4.9.1 think that this unit
--  violates the restriction (which isn't allowed in Ravenscar).

with Ada.Containers.Bounded_Vectors;

package body Containing is

   subtype Index is Natural range 0 .. 19;
   subtype Line is String (1 .. 20);

   package Line_Vectors
     is new Ada.Containers.Bounded_Vectors (Index_Type   => Index,
                                            Element_Type => Line);

   Lines : Line_Vectors.Vector (20);

   task T;
   task body T is
   begin
      for J in Index loop
         Lines.Append ((others => '*'));
      end loop;
      for J in Index loop
         Lines (J) := (others => Character'Val (Character'Pos ('a') + J));
      end loop;
   end T;

end Containing;
