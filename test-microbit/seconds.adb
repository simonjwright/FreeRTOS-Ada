--  Copyright (C) 2018 Free Software Foundation, Inc.

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

with LEDs;

with Ada.Real_Time;

procedure Seconds is
   Next : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   use type Ada.Real_Time.Time;
begin
   loop
      LEDs.Set_One_LED (3, 3);
      delay until Next + Ada.Real_Time.Milliseconds (100);
      Next := Next + Ada.Real_Time.Seconds (1);
      LEDs.Clear_All_LEDs;
      delay until Next;
   end loop;
end Seconds;
