--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.WDT is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on TIMEOUT event.
   type TIMEOUT_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for TIMEOUT_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on TIMEOUT event.
   type TIMEOUT_Field_1 is
     (
      --  Reset value for the field
      Timeout_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for TIMEOUT_Field_1 use
     (Timeout_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on TIMEOUT event.
      TIMEOUT       : TIMEOUT_Field_1 := Timeout_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      TIMEOUT       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on TIMEOUT event.
   type TIMEOUT_Field_2 is
     (
      --  Reset value for the field
      Timeout_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for TIMEOUT_Field_2 use
     (Timeout_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on TIMEOUT event.
      TIMEOUT       : TIMEOUT_Field_2 := Timeout_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      TIMEOUT       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- RUNSTATUS_Register --
   ------------------------

   --  Watchdog running status.
   type RUNSTATUS_Field is
     (
      --  Watchdog timer is not running.
      Notrunning,
      --  Watchdog timer is running.
      Running)
     with Size => 1;
   for RUNSTATUS_Field use
     (Notrunning => 0,
      Running => 1);

   --  Watchdog running status.
   type RUNSTATUS_Register is record
      --  Read-only. Watchdog running status.
      RUNSTATUS     : RUNSTATUS_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RUNSTATUS_Register use record
      RUNSTATUS     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- REQSTATUS_Register --
   ------------------------

   --  Request status for RR[0].
   type RR0_Field is
     (
      --  RR[0] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[0] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR0_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[1].
   type RR1_Field is
     (
      --  RR[1] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[1] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR1_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[2].
   type RR2_Field is
     (
      --  RR[2] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[2] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR2_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[3].
   type RR3_Field is
     (
      --  RR[3] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[3] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR3_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[4].
   type RR4_Field is
     (
      --  RR[4] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[4] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR4_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[5].
   type RR5_Field is
     (
      --  RR[5] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[5] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR5_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[6].
   type RR6_Field is
     (
      --  RR[6] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[6] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR6_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status for RR[7].
   type RR7_Field is
     (
      --  RR[7] register is not enabled or has already requested reload.
      Disabledorrequested,
      --  RR[7] register is enabled and has not jet requested.
      Enabledandunrequested)
     with Size => 1;
   for RR7_Field use
     (Disabledorrequested => 0,
      Enabledandunrequested => 1);

   --  Request status.
   type REQSTATUS_Register is record
      --  Read-only. Request status for RR[0].
      RR0           : RR0_Field;
      --  Read-only. Request status for RR[1].
      RR1           : RR1_Field;
      --  Read-only. Request status for RR[2].
      RR2           : RR2_Field;
      --  Read-only. Request status for RR[3].
      RR3           : RR3_Field;
      --  Read-only. Request status for RR[4].
      RR4           : RR4_Field;
      --  Read-only. Request status for RR[5].
      RR5           : RR5_Field;
      --  Read-only. Request status for RR[6].
      RR6           : RR6_Field;
      --  Read-only. Request status for RR[7].
      RR7           : RR7_Field;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for REQSTATUS_Register use record
      RR0           at 0 range 0 .. 0;
      RR1           at 0 range 1 .. 1;
      RR2           at 0 range 2 .. 2;
      RR3           at 0 range 3 .. 3;
      RR4           at 0 range 4 .. 4;
      RR5           at 0 range 5 .. 5;
      RR6           at 0 range 6 .. 6;
      RR7           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- RREN_Register --
   -------------------

   --  Enable or disable RR[0] register.
   type RR0_Field_1 is
     (
      --  RR[0] register is disabled.
      Disabled,
      --  RR[0] register is enabled.
      Enabled)
     with Size => 1;
   for RR0_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[1] register.
   type RR1_Field_1 is
     (
      --  RR[1] register is disabled.
      Disabled,
      --  RR[1] register is enabled.
      Enabled)
     with Size => 1;
   for RR1_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[2] register.
   type RR2_Field_1 is
     (
      --  RR[2] register is disabled.
      Disabled,
      --  RR[2] register is enabled.
      Enabled)
     with Size => 1;
   for RR2_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[3] register.
   type RR3_Field_1 is
     (
      --  RR[3] register is disabled.
      Disabled,
      --  RR[3] register is enabled.
      Enabled)
     with Size => 1;
   for RR3_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[4] register.
   type RR4_Field_1 is
     (
      --  RR[4] register is disabled.
      Disabled,
      --  RR[4] register is enabled.
      Enabled)
     with Size => 1;
   for RR4_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[5] register.
   type RR5_Field_1 is
     (
      --  RR[5] register is disabled.
      Disabled,
      --  RR[5] register is enabled.
      Enabled)
     with Size => 1;
   for RR5_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[6] register.
   type RR6_Field_1 is
     (
      --  RR[6] register is disabled.
      Disabled,
      --  RR[6] register is enabled.
      Enabled)
     with Size => 1;
   for RR6_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Enable or disable RR[7] register.
   type RR7_Field_1 is
     (
      --  RR[7] register is disabled.
      Disabled,
      --  RR[7] register is enabled.
      Enabled)
     with Size => 1;
   for RR7_Field_1 use
     (Disabled => 0,
      Enabled => 1);

   --  Reload request enable.
   type RREN_Register is record
      --  Enable or disable RR[0] register.
      RR0           : RR0_Field_1 := Enabled;
      --  Enable or disable RR[1] register.
      RR1           : RR1_Field_1 := Disabled;
      --  Enable or disable RR[2] register.
      RR2           : RR2_Field_1 := Disabled;
      --  Enable or disable RR[3] register.
      RR3           : RR3_Field_1 := Disabled;
      --  Enable or disable RR[4] register.
      RR4           : RR4_Field_1 := Disabled;
      --  Enable or disable RR[5] register.
      RR5           : RR5_Field_1 := Disabled;
      --  Enable or disable RR[6] register.
      RR6           : RR6_Field_1 := Disabled;
      --  Enable or disable RR[7] register.
      RR7           : RR7_Field_1 := Disabled;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RREN_Register use record
      RR0           at 0 range 0 .. 0;
      RR1           at 0 range 1 .. 1;
      RR2           at 0 range 2 .. 2;
      RR3           at 0 range 3 .. 3;
      RR4           at 0 range 4 .. 4;
      RR5           at 0 range 5 .. 5;
      RR6           at 0 range 6 .. 6;
      RR7           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ---------------------
   -- CONFIG_Register --
   ---------------------

   --  Configure the watchdog to pause or not while the CPU is sleeping.
   type SLEEP_Field is
     (
      --  Pause watchdog while the CPU is asleep.
      Pause,
      --  Do not pause watchdog while the CPU is asleep.
      Run)
     with Size => 1;
   for SLEEP_Field use
     (Pause => 0,
      Run => 1);

   --  Configure the watchdog to pause or not while the CPU is halted by the
   --  debugger.
   type HALT_Field is
     (
      --  Pause watchdog while the CPU is halted by the debugger.
      Pause,
      --  Do not pause watchdog while the CPU is halted by the debugger.
      Run)
     with Size => 1;
   for HALT_Field use
     (Pause => 0,
      Run => 1);

   --  Configuration register.
   type CONFIG_Register is record
      --  Configure the watchdog to pause or not while the CPU is sleeping.
      SLEEP         : SLEEP_Field := Run;
      --  unspecified
      Reserved_1_2  : nrf51.UInt2 := 16#0#;
      --  Configure the watchdog to pause or not while the CPU is halted by the
      --  debugger.
      HALT          : HALT_Field := Pause;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      SLEEP         at 0 range 0 .. 0;
      Reserved_1_2  at 0 range 1 .. 2;
      HALT          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Reload requests registers.

   --  Reload requests registers.
   type RR_Registers is array (0 .. 7) of nrf51.Word;

   --------------------
   -- POWER_Register --
   --------------------

   --  Peripheral power control.
   type POWER_Field is
     (
      --  Module power disabled.
      Disabled,
      --  Module power enabled.
      Enabled)
     with Size => 1;
   for POWER_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Peripheral power control.
   type POWER_Register is record
      --  Peripheral power control.
      POWER         : POWER_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_Register use record
      POWER         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Watchdog Timer.
   type WDT_Peripheral is record
      --  Start the watchdog.
      TASKS_START    : nrf51.Word;
      --  Watchdog timeout.
      EVENTS_TIMEOUT : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET       : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR       : INTENCLR_Register;
      --  Watchdog running status.
      RUNSTATUS      : RUNSTATUS_Register;
      --  Request status.
      REQSTATUS      : REQSTATUS_Register;
      --  Counter reload value in number of 32kiHz clock cycles.
      CRV            : nrf51.Word;
      --  Reload request enable.
      RREN           : RREN_Register;
      --  Configuration register.
      CONFIG         : CONFIG_Register;
      --  Reload requests registers.
      RR             : RR_Registers;
      --  Peripheral power control.
      POWER          : POWER_Register;
   end record
     with Volatile;

   for WDT_Peripheral use record
      TASKS_START    at 0 range 0 .. 31;
      EVENTS_TIMEOUT at 256 range 0 .. 31;
      INTENSET       at 772 range 0 .. 31;
      INTENCLR       at 776 range 0 .. 31;
      RUNSTATUS      at 1024 range 0 .. 31;
      REQSTATUS      at 1028 range 0 .. 31;
      CRV            at 1284 range 0 .. 31;
      RREN           at 1288 range 0 .. 31;
      CONFIG         at 1292 range 0 .. 31;
      RR             at 1536 range 0 .. 255;
      POWER          at 4092 range 0 .. 31;
   end record;

   --  Watchdog Timer.
   WDT_Periph : aliased WDT_Peripheral
     with Import, Address => WDT_Base;

end nrf51.WDT;
