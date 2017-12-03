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

with Ada.Real_Time;
with Interfaces;
with System;

package body Faulting_Task is

   task T;
   task body T is

      --  Configuration and Control Register
      CCR : Interfaces.Unsigned_32
      with
        Import,
        Convention => Ada,
        Address => System'To_Address (16#E000ED14#),
        Volatile_Full_Access;

      use type Interfaces.Unsigned_32;

      --  This is written in C because GNAT resists all Ada attempts
      --  to actually divide by zero, instead raising CE (actually,
      --  calling Last_Chance_Handler).
      function Div (L, R : Integer) return Integer
      with
        Import,
        Convention => C,
        External_Name => "div";

      Result : Integer with Volatile, Warnings => Off;

      use type Ada.Real_Time.Time;
   begin
      CCR := CCR or 16#0000_0010#; -- DIV_0_TRP

      Result := Div (0, 10);  -- OK
      Result := Div (10, 0);  -- Fails

      --  Loop indefinitely, in case the fault doesn't actually happen
      loop
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end T;

end Faulting_Task;
