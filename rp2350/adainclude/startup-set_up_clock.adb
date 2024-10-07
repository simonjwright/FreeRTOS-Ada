--  Copyright (C) 2024 Free Software Foundation, Inc.
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

--  This is the RP2350 (Risc-V) version.

with RP2350; use RP2350;

separate (Startup)
procedure Set_Up_Clock is

begin

   --  Set up MTIME_CTRL. Refer Datasheet Table 79.
   MTIME_CTRL :
   declare
      type MTIME_CTRL_Register is record
         EN             : Bit    := 1;
         FULLSPEED      : Bit    := 0;
         DBGPAUSE_CORE0 : Bit    := 1;
         DBGPAUSE_CORE1 : Bit    := 1;
         Reserved_1     : UInt28 := 0;
      end record
      with Object_Size => 32, Bit_Order => System.Low_Order_First;

      for MTIME_CTRL_Register use record
         EN             at 0 range 0 .. 0;
         FULLSPEED      at 0 range 1 .. 1;
         DBGPAUSE_CORE0 at 0 range 2 .. 2;
         DBGPAUSE_CORE1 at 0 range 3 .. 3;
         Reserved_1     at 0 range 4 .. 31;
      end record;

      type SIO_Subsystem_Description is record
         MTIME_CTRL : aliased MTIME_CTRL_Register
           with Volatile_Full_Access;
      end record;

      for SIO_Subsystem_Description use record
         MTIME_CTRL at 16#1a4# range 0 .. 31;
      end record;

      SIO_Subsystem_Base : constant System.Address
        := System'To_Address (16#d000_0000#);

      SIO_Subsystem : aliased SIO_Subsystem_Description
        with Import, Address => SIO_Subsystem_Base;
   begin
      SIO_Subsystem.MTIME_CTRL := (EN        => 1,
                                   FULLSPEED => 1,
                                   others    => <>);
   end MTIME_CTRL;

   System.Machine_Code.Asm
     ("fence.i",
      Volatile => True);

end Set_Up_Clock;
