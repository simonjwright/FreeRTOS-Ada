--  Copyright (C) 2018 Free Software Foundation, Inc.

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
with Buttons;
with LEDs;

package body Lights is

   task Twinkle
   with
     Storage_Size         => 1024,
     Secondary_Stack_Size => 0;

   task body Twinkle is

      use LEDs;

      type Coord_Pair is record
         R : Coord;
         C : Coord;
         Scaling : Positive; -- multiplies basic interval
      end record;
      type LED_Sequence is array (Positive range <>) of Coord_Pair;
      Spiral_Clockwise : constant LED_Sequence :=
        ((1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1),
         (2, 5, 1), (3, 5, 1), (4, 5, 1), (5, 5, 1),
         (5, 4, 1), (5, 3, 1), (5, 2, 1), (5, 1, 1),
         (4, 1, 1), (3, 1, 1), (2, 1, 1),
         (2, 2, 2), (2, 3, 2), (2, 4, 2),
         (3, 4, 2), (4, 4, 2),
         (4, 3, 2), (4, 2, 2),
         (3, 2, 3),
         (3, 3, 4));

      function Interval return Ada.Real_Time.Time_Span is
        (case Buttons.Button_State (Buttons.A) is
            when Buttons.Off => Ada.Real_Time.Milliseconds (150),
            when Buttons.On => Ada.Real_Time.Milliseconds (50));

      use type Buttons.Toggle;
      use type Ada.Real_Time.Time;
      use type Ada.Real_Time.Time_Span;
   begin
      loop
         case Buttons.Button_State (Buttons.B) is
            when Buttons.Off =>
               for S of Spiral_Clockwise loop
                  exit when Buttons.Button_State (Buttons.B) = Buttons.On;
                  Clear_All_LEDs;
                  Set_One_LED (S.R, S.C);
                  delay until Ada.Real_Time.Clock + Interval * S.Scaling;
               end loop;
            when Buttons.On =>
               for S of reverse Spiral_Clockwise loop
                  exit when Buttons.Button_State (Buttons.B) = Buttons.Off;
                  Clear_All_LEDs;
                  Set_One_LED (S.R, S.C);
                  delay until Ada.Real_Time.Clock + Interval * S.Scaling;
               end loop;
         end case;
      end loop;
   end Twinkle;

end Lights;
