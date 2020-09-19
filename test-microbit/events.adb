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

with Event_Support;
with Ada.Real_Time.Timing_Events;
--  with Hardfault_Handling;
--  pragma Unreferenced (Hardfault_Handling);
procedure Events is
   --  Environment_Task_Storage_Size : constant Natural := 1536
   --  with
   --    Export,
   --    Convention => Ada,
   --    External_Name => "_environment_task_storage_size";
   --  Default_Initial_Stack : constant Natural := 4096
   --  with
   --    Export,
   --    Convention => Ada,
   --    External_Name => "_default_initial_stack";
begin
   Event_Support.LED_Event_Handling.Handle
     (Ada.Real_Time.Timing_Events.Timing_Event (Event_Support.Slow));
   Event_Support.Handler
     (Ada.Real_Time.Timing_Events.Timing_Event (Event_Support.Quick));
   delay until Ada.Real_Time.Time_Last;
end Events;
