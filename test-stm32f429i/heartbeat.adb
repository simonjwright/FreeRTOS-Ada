--  Copyright (C) 2016-2021 Free Software Foundation, Inc.

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
with STM32.Device;
with STM32.GPIO;

package body Heartbeat is

   type LED is (Green, Red);
   for LED use (Green  => 13,
                Red    => 14);

   LEDs : STM32.GPIO.GPIO_Points
     := (Green'Enum_Rep  => (Periph => STM32.Device.GPIO_G'Access,
                             Pin => STM32.GPIO.Pin_13),
         Red'Enum_Rep    => (Periph => STM32.Device.GPIO_G'Access,
                             Pin => STM32.GPIO.Pin_14));

   task Beat
   with Storage_Size => 1024;

   task body Beat is
      use type Ada.Real_Time.Time;
   begin
      for J in 1 .. 5 loop
         STM32.GPIO.Set (LEDs (Green'Enum_Rep));
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         STM32.GPIO.Clear (LEDs (Green'Enum_Rep));
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end loop;
      loop
         for P of LEDs loop
            STM32.GPIO.Set (P);
            delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
            STM32.GPIO.Clear (P);
            delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (900);
         end loop;
      end loop;
   end Beat;

   procedure Initialize;
   procedure Initialize is
      use STM32.Device;
      use STM32.GPIO;
   begin
      Enable_Clock (GPIO_G);
      Configure_IO (LEDs,
                    Config => (Mode      => Mode_Out,
                               Resistors => Pull_Up,
                               others    => <>));
      Clear (LEDs);
   end Initialize;

begin
   Initialize;
end Heartbeat;
