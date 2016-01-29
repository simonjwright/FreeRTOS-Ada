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

--  System Timer, 11057 23-Mar-15, Chapter 10.22

with System;

package Registers.Cortex.SysTick with Preelaborate is

   type SysTick_T is record
      CTRL  : Interfaces.Unsigned_32;
      LOAD  : Interfaces.Unsigned_32;
      VAL   : Interfaces.Unsigned_32;
      CALIB : Interfaces.Unsigned_32;
   end record
   with Convention => Ada, Volatile, Size => 4 * 32;

   for SysTick_T use record
      CTRL  at 16#0000# range 0 .. 31;
      LOAD  at 16#0004# range 0 .. 31;
      VAL   at 16#0008# range 0 .. 31;
      CALIB at 16#000C# range 0 .. 31;
   end record;

   SysTick : SysTick_T
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#E000E010#);

end Registers.Cortex.SysTick;
