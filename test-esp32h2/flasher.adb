--  Copyright (C) 2020-2024 Free Software Foundation, Inc.

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

--  This program just calls in the Heartbeat package, to make an
--  executable easily small enough to fit in sram.

--  This program has no visible functionality; the idea is to use the
--  debugger to check that the expected effect has happened.

with Ada.Real_Time;

with Heartbeat;
pragma Unreferenced (Heartbeat);
--  Timing

procedure Flasher is

   --  It seems that Risc-V needs more than normal task storage size.
   Default_Storage_Size : constant Natural := 2048
   with
     Export,
     Convention => Ada,
     External_Name => "_default_storage_size";

begin
   delay until Ada.Real_Time.Time_Last;
end Flasher;
