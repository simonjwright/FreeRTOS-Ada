--  Copyright (C) 2018, 2020 Free Software Foundation, Inc.

--  This file is part of the FreeRTOS-Ada package.
--
--  The FreeRTOS-Ada package is free software; you can redistribute
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
      end record;
      type LED_Sequence is array (Positive range <>) of Coord_Pair;
      Clockwise : constant LED_Sequence :=
        ((1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
         (2, 5), (3, 5), (4, 5), (5, 5),
         (5, 4), (5, 3), (5, 2), (5, 1),
         (4, 1), (3, 1), (2, 1));

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
               for S of Clockwise loop
                  exit when Buttons.Button_State (Buttons.B) = Buttons.On;
                  Clear_All_LEDs;
                  Set_One_LED (S.R, S.C);
                  delay until Ada.Real_Time.Clock + Interval;
               end loop;
            when Buttons.On =>
               for S of reverse Clockwise loop
                  exit when Buttons.Button_State (Buttons.B) = Buttons.Off;
                  Clear_All_LEDs;
                  Set_One_LED (S.R, S.C);
                  delay until Ada.Real_Time.Clock + Interval;
               end loop;
         end case;
      end loop;
   end Twinkle;

end Lights;
