--  Copyright (C) 2017 Free Software Foundation, Inc.

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

--  This program has no visible functionality; when run under the
--  debugger it will hit a breakpoint when Faulting_Task calls a C
--  function resulting in a divide-by-zero HardFault.

with Ada.Real_Time;

with Hardfault_Handling;
pragma Unreferenced (Hardfault_Handling);

with Faulting_Task;
pragma Unreferenced (Faulting_Task);

procedure Generate_Hard_Fault is
   use type Ada.Real_Time.Time;
begin
   loop
      delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
   end loop;
end Generate_Hard_Fault;
