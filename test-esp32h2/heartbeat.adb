--  Copyright (C) 2024 Free Software Foundation, Inc.

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

--  This is for the ESP32-H2 Risc-V chip.
--
--  It would have been great to use the on-board RGB LED, but its
--  access is apparently quite complex, so we use an ordinary LED
--  accessed via GPIO0.

with Ada.Real_Time;
with ESP32_H2.GPIO; use ESP32_H2.GPIO;

package body Heartbeat is

   task Beat
   is
      pragma Task_Name ("heartbeat.beat");
   end Beat;

   task body Beat is
      use type Ada.Real_Time.Time;
      procedure Turn_On;
      procedure Turn_Off;
      procedure Turn_On is
      begin
         GPIO_Periph.OUT_W1TS := 2#1#; --  Set GPIO0.
      end Turn_On;
      procedure Turn_Off is
      begin
         GPIO_Periph.OUT_W1TC := 2#1#; --  Clear GPIO0.
      end Turn_Off;
   begin
      --  flash for 1 second at startup
      for J in 1 .. 5 loop
         Turn_On;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         Turn_Off;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end loop;

      --  flash every second while running
      loop
         Turn_On;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         Turn_Off;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (900);
      end loop;
   end Beat;

begin

   GPIO_Periph.ENABLE_W1TS := 2#1#; --  Enable GPIO0 output.

end Heartbeat;
