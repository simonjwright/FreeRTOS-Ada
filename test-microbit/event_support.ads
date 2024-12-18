--  Copyright (C) 2020 Free Software Foundation, Inc.

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
with Ada.Real_Time.Timing_Events;
package Event_Support is

   subtype Milliseconds is Natural;

   type LED_Event is new Ada.Real_Time.Timing_Events.Timing_Event
      with record
         Row    : LEDs.Coord;
         Col    : LEDs.Coord;
         Period : Milliseconds;
         State  : Boolean;
      end record;

   Slow : LED_Event :=
     (Ada.Real_Time.Timing_Events.Timing_Event
      with 4, 5, 5000, True);
   Quick : LED_Event :=
     (Ada.Real_Time.Timing_Events.Timing_Event
      with 1, 1, 2000, True);

   type LEDs_Status is array (LEDs.Coord, LEDs.Coord) of Boolean;
   --  (Row, Col)

   protected LED_Event_Handling is
      pragma Interrupt_Priority;
      procedure Handle
        (Event : in out Ada.Real_Time.Timing_Events.Timing_Event);
   private
      Set_LEDs : LEDs_Status := (others => (others => False));
   end LED_Event_Handling;

   Handler : constant Ada.Real_Time.Timing_Events.Timing_Event_Handler
     := LED_Event_Handling.Handle'Access;

end Event_Support;
