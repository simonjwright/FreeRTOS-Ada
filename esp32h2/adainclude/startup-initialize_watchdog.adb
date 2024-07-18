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
