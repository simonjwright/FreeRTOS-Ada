--  Copyright (C) 2017 Free Software Foundation, Inc.

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
with Interfaces;

package body Images is

   task Long_Integers with Storage_Size => 2048;
   task body Long_Integers is
      I : Long_Integer;
      use type Ada.Real_Time.Time;
   begin
      loop
         I := 1;
         for J in 1 .. 9 loop
            declare
               S1 : constant String := I'Img;
               S2 : constant String := Long_Integer'Image (I);
            begin
               pragma Assert (S1 = S2);
            end;
            declare
               K : constant Long_Integer := -I;
               S1 : constant String := K'Img;
               S2 : constant String := Long_Integer'Image (K);
            begin
               pragma Assert (S1 = S2);
            end;
            I := I * 10;
         end loop;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Long_Integers;

   task Long_Long_Integers with Storage_Size => 2048;
   task body Long_Long_Integers is
      I : Long_Long_Integer;
      use type Ada.Real_Time.Time;
   begin
      loop
         I := 1;
         for J in 1 .. 9 loop
            declare
               S1 : constant String := I'Img;
               S2 : constant String := Long_Long_Integer'Image (I);
            begin
               pragma Assert (S1 = S2);
            end;
            declare
               K : constant Long_Long_Integer := -I;
               S1 : constant String := K'Img;
               S2 : constant String := Long_Long_Integer'Image (K);
            begin
               pragma Assert (S1 = S2);
            end;
            I := I * 10;
         end loop;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Long_Long_Integers;

   task Unsigned_32s with Storage_Size => 2048;
   task body Unsigned_32s is
      use Interfaces;
      I : Unsigned_32;
      use type Ada.Real_Time.Time;
   begin
      loop
         I := 1;
         for J in 1 .. 10 loop
            declare
               S1 : constant String := I'Img;
               S2 : constant String := Unsigned_32'Image (I);
            begin
               pragma Assert (S1 = S2);
            end;
            I := I * 10;
         end loop;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Unsigned_32s;

   task Unsigned_64s with Storage_Size => 2048;
   task body Unsigned_64s is
      use Interfaces;
      I : Unsigned_64;
      use type Ada.Real_Time.Time;
   begin
      loop
         I := 1;
         for J in 1 .. 5 loop
            declare
               S1 : constant String := I'Img;
               S2 : constant String := Unsigned_64'Image (I);
            begin
               pragma Assert (S1 = S2);
            end;
            I := I * 10;
         end loop;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Unsigned_64s;

   task Floats with Storage_Size => 2048;
   task body Floats is
      F : Float;
      use type Ada.Real_Time.Time;
   begin
      loop
         declare
            F : Float := 12345.6789e+0 with Warnings => Off;
            S : String := F'Img;
         begin
            pragma Assert (S = " 1.23457E+04");
            F := -F;
            S := Float'Image (F);
            pragma Assert (S = "-1.23457E+04");
         end;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Floats;

   task Enumerations with Storage_Size => 2048;
   task body Enumerations is
      type Enum is (Alice, Bob, Carol, Dave);
      use type Ada.Real_Time.Time;
   begin
      pragma Assert (False'Img = "FALSE");
      pragma Assert (Boolean'Image (False) = "FALSE");
      pragma Assert (True'Img = "TRUE");
      pragma Assert (Boolean'Image (True) = "TRUE");
      loop
         for B in Boolean loop
            declare
               S1 : constant String := B'Img;
               S2 : constant String := Boolean'Image (B);
            begin
               pragma Assert (S1 = S2);
            end;
         end loop;
         for E in Enum loop
            declare
               S1 : constant String := E'Img;
               S2 : constant String := Enum'Image (E);
            begin
               pragma Assert (S1 = S2);
            end;
         end loop;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Enumerations;

end Images;
