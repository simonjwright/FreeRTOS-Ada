--  Copyright (C) 2020 Free Software Foundation, Inc.

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

package body Event_Support is

   protected body LED_Event_Handling is

      procedure Handle
        (Event : in out Ada.Real_Time.Timing_Events.Timing_Event)
      is
         Our_Event : LED_Event
           renames LED_Event
             (Ada.Real_Time.Timing_Events.Timing_Event'Class (Event));
         New_State : constant Boolean := Our_Event.State;
         Flash : constant Milliseconds := 250;
         use type Ada.Real_Time.Time;
      begin
         Set_LEDs (Our_Event.Row, Our_Event.Col) := New_State;
         Our_Event.State := not New_State;
         LEDs.Clear_All_LEDs;
         for R in LEDs.Coord loop
            for C in LEDs.Coord loop
               if Set_LEDs (R, C) then
                  LEDs.Set_One_LED (R, C);
               end if;
            end loop;
         end loop;
         --  turn off after Flash, turn on after the event's Period
         --  minus Flash
         Event.Set_Handler
           (Handler => Handler,
            At_Time => Ada.Real_Time.Clock
              + Ada.Real_Time.Milliseconds (if New_State
                                            then Flash
                                            else Our_Event.Period - Flash));
      end Handle;

   end LED_Event_Handling;

end Event_Support;
