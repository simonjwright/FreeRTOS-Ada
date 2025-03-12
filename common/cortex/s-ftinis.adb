--  Copyright (C) 2016-2024 Free Software Foundation, Inc.
--
--  This file is part of the Cortex GNAT RTS project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

--  This function returns True if it is executing in an Interrupt
--  Service Routine. This is the Cortex version.

with System.Machine_Code;

separate (System.FreeRTOS.Tasks)
function In_ISR return Boolean
is
   IPSR : Interfaces.Unsigned_32;
   use type Interfaces.Unsigned_32;
begin
   System.Machine_Code.Asm
     ("mrs %0, ipsr",
      Outputs => Interfaces.Unsigned_32'Asm_Output ("=r", IPSR),
      Volatile => True);
   return (IPSR and 16#ff#) /= 0;
end In_ISR;
