--  Copyright (C) 2024 Free Software Foundation, Inc.
--
--  This file is part of the FreeRTOS-Ada project. This file is
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

--  This is the ESP32-H2 (Risc-V) version.

with ESP32_H2; use ESP32_H2;
with System;

separate (Startup)
procedure Set_Up_Clock is
begin

   --  We can assume that machine interrupts are disabled at this point.

   --  First, adjust clock rate if needed (initally 32 MHz).

   --  Next, set up MTIMECTL. Refer TRM 1.7.5..6.
   MTIMECTL :
   declare
      type MTIMECTL_Register is record
         MTCE : Bit := 0;
         MTIE : Bit := 0;
         MTIP : Bit := 0;
         MTOF : Bit := 0;
         Reserved_1 : UInt28 := 0;
      end record
      with Object_Size => 32, Bit_Order => System.Low_Order_First;

      for MTIMECTL_Register use record
         MTCE at 0 range 0 .. 0;
         MTIE at 0 range 1 .. 1;
         MTIP at 0 range 2 .. 2;
         MTOF at 0 range 3 .. 3;
         Reserved_1 at 0 range 4 .. 31;
      end record;

      type CPU_Subsystem_Description is record
         MTIMECTL : aliased MTIMECTL_Register
           with Volatile_Full_Access;
      end record;

      for CPU_Subsystem_Description use record
         MTIMECTL at 16#1804# range 0 .. 31;
      end record;

      CPU_Subsystem_Base : constant System.Address
        := System'To_Address (16#2000_0000#);

      CPU_Subsystem : aliased CPU_Subsystem_Description
        with Import, Address => CPU_Subsystem_Base;
   begin
      CPU_Subsystem.MTIMECTL := (MTCE => 1,
                                 MTIE => 1,
                                 MTOF => 1,
                                 others => <>);
   end MTIMECTL;

   --  Next, set up MTIE (bit 7) in the mie CSR
   System.Machine_Code.Asm
     ("csrr t0, mie" & ASCII.LF &
        "ori t0, t0, 0x80" & ASCII.LF &
        "csrw mie, t0",
      Clobber => "t0",
      Volatile => True);

end Set_Up_Clock;
