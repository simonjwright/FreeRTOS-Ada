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

--  This program has no visible functionality; the idea is to use the
--  debugger to check that the expected effect has happened.

with Hardfault_Handling;
pragma Unreferenced (Hardfault_Handling);

with Lights;
pragma Unreferenced (Lights);

with Ada.Real_Time;

procedure Testbed is

   --  These are the default values of the stack control parameters.

   --  For the environment task.
   --  Environment_Task_Storage_Size : constant Natural := 1536
   --  with
   --    Export,
   --    Convention => Ada,
   --    External_Name => "_environment_task_storage_size";

   --  For ordinary tasks.
   --  Default_Storage_Size : constant Natural := 1024
   --  with
   --    Export,
   --    Convention => Ada,
   --    External_Name => "_default_storage_size";

   --  For the initial stack (also used for interrupt programs).
   --  Default_Initial_Stack : constant Natural := 1024
   --  with
   --    Export,
   --    Convention => Ada,
   --    External_Name => "_default_initial_stack";

begin
   delay until Ada.Real_Time.Time_Last;
end Testbed;
