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

with ESP32_H2.LP_WDT; use ESP32_H2.LP_WDT;
with ESP32_H2.TIMG; use ESP32_H2.TIMG;

separate (Startup)
procedure Initialize_Watchdog is
   --  use type ESP32_H2.Bit;
begin

   --  Disable write protection on the SWD configuration register.
   --  See TRM 13.2.2.3, 13.3.2.2.
   LP_WDT_Periph.SWD_WPROTECT := 16#50D83AA1#;

   --  Disable SWD watchdos.
   LP_WDT_Periph.SWD_CONF := (SWD_DISABLE => 1,
                              others      => <>);

   --  Re-enable write protection on the SWD configuration register.
   LP_WDT_Periph.SWD_WPROTECT := 16#0#;

   --  Disable write protection on the RTC configuration registers.
   --  See TRM 13.2.2.3.
   LP_WDT_Periph.WDTWPROTECT := 16#50D83AA1#;

   --  Disable RTC watchdogs.
   LP_WDT_Periph.WDTCONFIG0 := (WDT_PROCPU_RESET_EN  => 0,
                                WDT_FLASHBOOT_MOD_EN => 0,
                                WDT_EN               => 0,
                                others               => <>);

   --  Re-enable write protection on the RTC configuration registers.
   LP_WDT_Periph.WDTWPROTECT := 16#0#;

   --  The default state of the WDTWPROTECT register is 0x50d83aa1,
   --  which disables write protection.
   TIMG0_Periph.WDTCONFIG0 := (WDT_APPCPU_RESET_EN => 0,
                               WDT_PROCPU_RESET_EN => 0,
                               WDT_FLASHBOOT_MOD_EN => 0,
                               WDT_EN => 0,
                               others => <>);
   TIMG1_Periph.WDTCONFIG0 := (WDT_APPCPU_RESET_EN => 0,
                               WDT_PROCPU_RESET_EN => 0,
                               WDT_FLASHBOOT_MOD_EN => 0,
                               WDT_EN => 0,
                               others => <>);
end Initialize_Watchdog;
