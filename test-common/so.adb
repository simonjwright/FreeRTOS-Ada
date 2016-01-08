--  Copyright (C) 2016 Free Software Foundation, Inc.

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
with Ada.Synchronous_Task_Control;

package body SO is

   The_SO : Ada.Synchronous_Task_Control.Suspension_Object;

   task T;
   task body T is
   begin
      loop
         Ada.Synchronous_Task_Control.Suspend_Until_True (The_SO);
      end loop;
   end T;

   task Tick;
   task body Tick is
      use type Ada.Real_Time.Time;
   begin
      loop
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
         Ada.Synchronous_Task_Control.Set_True (The_SO);
      end loop;
   end Tick;

end SO;
