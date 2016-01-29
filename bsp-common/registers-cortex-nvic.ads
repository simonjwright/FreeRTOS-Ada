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

--  Nested Vectored Interrupt Controller, 11057 23-Mar-15, Chapter 10.20;
--  more detail at http://infocenter.arm.com/

with System;

package Registers.Cortex.NVIC with Preelaborate is

   type Bits_32x1_Array is array (Natural range <>) of Bits_32x1;
   type Bits_32x4_Array is array (Natural range <>) of Bits_32x4;

   type NVIC_T is record
      ISER : Bits_32x1_Array (0 .. 7);
      ICER : Bits_32x1_Array (0 .. 7);
      ISPR : Bits_32x1_Array (0 .. 7);
      ICPR : Bits_32x1_Array (0 .. 7);
      IABR : Bits_32x1_Array (0 .. 7);
      IPRO : Bits_32x4_Array (0 .. 59);
      STIR : Interfaces.Unsigned_32;
   end record
   with Convention => Ada, Volatile, Size => 8 * (16#0E00# + 4);

   for NVIC_T use record
      ISER at 16#0000# range 0 .. 255;
      ICER at 16#0080# range 0 .. 255;
      ISPR at 16#0100# range 0 .. 255;
      ICPR at 16#0180# range 0 .. 255;
      IABR at 16#0200# range 0 .. 255;
      IPRO at 16#0300# range 0 .. 1919;
      STIR at 16#0E00# range 0 .. 31;
   end record;

   NVIC : NVIC_T
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#E000E100#);

end Registers.Cortex.NVIC;
