--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.POWER is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on POFWARN event.
   type POFWARN_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for POFWARN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on POFWARN event.
   type POFWARN_Field_1 is
     (
      --  Reset value for the field
      Pofwarn_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for POFWARN_Field_1 use
     (Pofwarn_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  unspecified
      Reserved_0_1  : nrf51.UInt2 := 16#0#;
      --  Enable interrupt on POFWARN event.
      POFWARN       : POFWARN_Field_1 := Pofwarn_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      POFWARN       at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on POFWARN event.
   type POFWARN_Field_2 is
     (
      --  Reset value for the field
      Pofwarn_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for POFWARN_Field_2 use
     (Pofwarn_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  unspecified
      Reserved_0_1  : nrf51.UInt2 := 16#0#;
      --  Disable interrupt on POFWARN event.
      POFWARN       : POFWARN_Field_2 := Pofwarn_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      POFWARN       at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------------
   -- RESETREAS_Register --
   ------------------------

   --  Reset from pin-reset detected.
   type RESETPIN_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for RESETPIN_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset from watchdog detected.
   type DOG_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for DOG_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset from AIRCR.SYSRESETREQ detected.
   type SREQ_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for SREQ_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset from CPU lock-up detected.
   type LOCKUP_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for LOCKUP_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset from wake-up from OFF mode detected by the use of DETECT signal
   --  from GPIO.
   type OFF_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for OFF_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset from wake-up from OFF mode detected by the use of ANADETECT signal
   --  from LPCOMP.
   type LPCOMP_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for LPCOMP_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset from wake-up from OFF mode detected by entering into debug
   --  interface mode.
   type DIF_Field is
     (
      --  Reset not detected.
      Notdetected,
      --  Reset detected.
      Detected)
     with Size => 1;
   for DIF_Field use
     (Notdetected => 0,
      Detected => 1);

   --  Reset reason.
   type RESETREAS_Register is record
      --  Reset from pin-reset detected.
      RESETPIN       : RESETPIN_Field := Notdetected;
      --  Reset from watchdog detected.
      DOG            : DOG_Field := Notdetected;
      --  Reset from AIRCR.SYSRESETREQ detected.
      SREQ           : SREQ_Field := Notdetected;
      --  Reset from CPU lock-up detected.
      LOCKUP         : LOCKUP_Field := Notdetected;
      --  unspecified
      Reserved_4_15  : nrf51.UInt12 := 16#0#;
      --  Reset from wake-up from OFF mode detected by the use of DETECT signal
      --  from GPIO.
      OFF            : OFF_Field := Notdetected;
      --  Reset from wake-up from OFF mode detected by the use of ANADETECT
      --  signal from LPCOMP.
      LPCOMP         : LPCOMP_Field := Notdetected;
      --  Reset from wake-up from OFF mode detected by entering into debug
      --  interface mode.
      DIF            : DIF_Field := Notdetected;
      --  unspecified
      Reserved_19_31 : nrf51.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESETREAS_Register use record
      RESETPIN       at 0 range 0 .. 0;
      DOG            at 0 range 1 .. 1;
      SREQ           at 0 range 2 .. 2;
      LOCKUP         at 0 range 3 .. 3;
      Reserved_4_15  at 0 range 4 .. 15;
      OFF            at 0 range 16 .. 16;
      LPCOMP         at 0 range 17 .. 17;
      DIF            at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   ------------------------
   -- RAMSTATUS_Register --
   ------------------------

   --  RAM block 0 status.
   type RAMBLOCK0_Field is
     (
      --  RAM block 0 is off or powering up.
      Off,
      --  RAM block 0 is on.
      On)
     with Size => 1;
   for RAMBLOCK0_Field use
     (Off => 0,
      On => 1);

   --  RAM block 1 status.
   type RAMBLOCK1_Field is
     (
      --  RAM block 1 is off or powering up.
      Off,
      --  RAM block 1 is on.
      On)
     with Size => 1;
   for RAMBLOCK1_Field use
     (Off => 0,
      On => 1);

   --  RAM block 2 status.
   type RAMBLOCK2_Field is
     (
      --  RAM block 2 is off or powering up.
      Off,
      --  RAM block 2 is on.
      On)
     with Size => 1;
   for RAMBLOCK2_Field use
     (Off => 0,
      On => 1);

   --  RAM block 3 status.
   type RAMBLOCK3_Field is
     (
      --  RAM block 3 is off or powering up.
      Off,
      --  RAM block 3 is on.
      On)
     with Size => 1;
   for RAMBLOCK3_Field use
     (Off => 0,
      On => 1);

   --  Ram status register.
   type RAMSTATUS_Register is record
      --  Read-only. RAM block 0 status.
      RAMBLOCK0     : RAMBLOCK0_Field;
      --  Read-only. RAM block 1 status.
      RAMBLOCK1     : RAMBLOCK1_Field;
      --  Read-only. RAM block 2 status.
      RAMBLOCK2     : RAMBLOCK2_Field;
      --  Read-only. RAM block 3 status.
      RAMBLOCK3     : RAMBLOCK3_Field;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAMSTATUS_Register use record
      RAMBLOCK0     at 0 range 0 .. 0;
      RAMBLOCK1     at 0 range 1 .. 1;
      RAMBLOCK2     at 0 range 2 .. 2;
      RAMBLOCK3     at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ------------------------
   -- SYSTEMOFF_Register --
   ------------------------

   --  Enter system off mode.
   type SYSTEMOFF_Field is
     (
      --  Reset value for the field
      Systemoff_Field_Reset,
      --  Enter system off mode.
      Enter)
     with Size => 1;
   for SYSTEMOFF_Field use
     (Systemoff_Field_Reset => 0,
      Enter => 1);

   --  System off register.
   type SYSTEMOFF_Register is record
      --  Write-only. Enter system off mode.
      SYSTEMOFF     : SYSTEMOFF_Field := Systemoff_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYSTEMOFF_Register use record
      SYSTEMOFF     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- POFCON_Register --
   ---------------------

   --  Power failure comparator enable.
   type POF_Field is
     (
      --  Disabled.
      Disabled,
      --  Enabled.
      Enabled)
     with Size => 1;
   for POF_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Set threshold level.
   type THRESHOLD_Field is
     (
      --  Set threshold to 2.1Volts.
      V21,
      --  Set threshold to 2.3Volts.
      V23,
      --  Set threshold to 2.5Volts.
      V25,
      --  Set threshold to 2.7Volts.
      V27)
     with Size => 2;
   for THRESHOLD_Field use
     (V21 => 0,
      V23 => 1,
      V25 => 2,
      V27 => 3);

   --  Power failure configuration.
   type POFCON_Register is record
      --  Power failure comparator enable.
      POF           : POF_Field := Disabled;
      --  Set threshold level.
      THRESHOLD     : THRESHOLD_Field := V21;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POFCON_Register use record
      POF           at 0 range 0 .. 0;
      THRESHOLD     at 0 range 1 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- GPREGRET_Register --
   -----------------------

   subtype GPREGRET_GPREGRET_Field is nrf51.Byte;

   --  General purpose retention register. This register is a retained
   --  register.
   type GPREGRET_Register is record
      --  General purpose retention register.
      GPREGRET      : GPREGRET_GPREGRET_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPREGRET_Register use record
      GPREGRET      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --------------------
   -- RAMON_Register --
   --------------------

   --  RAM block 0 behaviour in ON mode.
   type ONRAM0_Field is
     (
      --  RAM block 0 OFF in ON mode.
      Ram0Off,
      --  RAM block 0 ON in ON mode.
      Ram0On)
     with Size => 1;
   for ONRAM0_Field use
     (Ram0Off => 0,
      Ram0On => 1);

   --  RAM block 1 behaviour in ON mode.
   type ONRAM1_Field is
     (
      --  RAM block 1 OFF in ON mode.
      Ram1Off,
      --  RAM block 1 ON in ON mode.
      Ram1On)
     with Size => 1;
   for ONRAM1_Field use
     (Ram1Off => 0,
      Ram1On => 1);

   --  RAM block 0 behaviour in OFF mode.
   type OFFRAM0_Field is
     (
      --  RAM block 0 OFF in OFF mode.
      Ram0Off,
      --  RAM block 0 ON in OFF mode.
      Ram0On)
     with Size => 1;
   for OFFRAM0_Field use
     (Ram0Off => 0,
      Ram0On => 1);

   --  RAM block 1 behaviour in OFF mode.
   type OFFRAM1_Field is
     (
      --  RAM block 1 OFF in OFF mode.
      Ram1Off,
      --  RAM block 1 ON in OFF mode.
      Ram1On)
     with Size => 1;
   for OFFRAM1_Field use
     (Ram1Off => 0,
      Ram1On => 1);

   --  Ram on/off.
   type RAMON_Register is record
      --  RAM block 0 behaviour in ON mode.
      ONRAM0         : ONRAM0_Field := Ram0On;
      --  RAM block 1 behaviour in ON mode.
      ONRAM1         : ONRAM1_Field := Ram1On;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  RAM block 0 behaviour in OFF mode.
      OFFRAM0        : OFFRAM0_Field := Ram0Off;
      --  RAM block 1 behaviour in OFF mode.
      OFFRAM1        : OFFRAM1_Field := Ram1Off;
      --  unspecified
      Reserved_18_31 : nrf51.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAMON_Register use record
      ONRAM0         at 0 range 0 .. 0;
      ONRAM1         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      OFFRAM0        at 0 range 16 .. 16;
      OFFRAM1        at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --------------------
   -- RESET_Register --
   --------------------

   --  Enable or disable pin reset in debug interface mode.
   type RESET_Field is
     (
      --  Pin reset in debug interface mode disabled.
      Disabled,
      --  Pin reset in debug interface mode enabled.
      Enabled)
     with Size => 1;
   for RESET_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Pin reset functionality configuration register. This register is a
   --  retained register.
   type RESET_Register is record
      --  Enable or disable pin reset in debug interface mode.
      RESET         : RESET_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESET_Register use record
      RESET         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- RAMONB_Register --
   ---------------------

   --  RAM block 2 behaviour in ON mode.
   type ONRAM2_Field is
     (
      --  RAM block 2 OFF in ON mode.
      Ram2Off,
      --  RAM block 2 ON in ON mode.
      Ram2On)
     with Size => 1;
   for ONRAM2_Field use
     (Ram2Off => 0,
      Ram2On => 1);

   --  RAM block 3 behaviour in ON mode.
   type ONRAM3_Field is
     (
      --  RAM block 33 OFF in ON mode.
      Ram3Off,
      --  RAM block 3 ON in ON mode.
      Ram3On)
     with Size => 1;
   for ONRAM3_Field use
     (Ram3Off => 0,
      Ram3On => 1);

   --  RAM block 2 behaviour in OFF mode.
   type OFFRAM2_Field is
     (
      --  RAM block 2 OFF in OFF mode.
      Ram2Off,
      --  RAM block 2 ON in OFF mode.
      Ram2On)
     with Size => 1;
   for OFFRAM2_Field use
     (Ram2Off => 0,
      Ram2On => 1);

   --  RAM block 3 behaviour in OFF mode.
   type OFFRAM3_Field is
     (
      --  RAM block 3 OFF in OFF mode.
      Ram3Off,
      --  RAM block 3 ON in OFF mode.
      Ram3On)
     with Size => 1;
   for OFFRAM3_Field use
     (Ram3Off => 0,
      Ram3On => 1);

   --  Ram on/off.
   type RAMONB_Register is record
      --  RAM block 2 behaviour in ON mode.
      ONRAM2         : ONRAM2_Field := Ram2On;
      --  RAM block 3 behaviour in ON mode.
      ONRAM3         : ONRAM3_Field := Ram3On;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  RAM block 2 behaviour in OFF mode.
      OFFRAM2        : OFFRAM2_Field := Ram2Off;
      --  RAM block 3 behaviour in OFF mode.
      OFFRAM3        : OFFRAM3_Field := Ram3Off;
      --  unspecified
      Reserved_18_31 : nrf51.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAMONB_Register use record
      ONRAM2         at 0 range 0 .. 0;
      ONRAM3         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      OFFRAM2        at 0 range 16 .. 16;
      OFFRAM3        at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   ---------------------
   -- DCDCEN_Register --
   ---------------------

   --  Enable DCDC converter.
   type DCDCEN_Field is
     (
      --  DCDC converter disabled.
      Disabled,
      --  DCDC converter enabled.
      Enabled)
     with Size => 1;
   for DCDCEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  DCDC converter enable configuration register.
   type DCDCEN_Register is record
      --  Enable DCDC converter.
      DCDCEN        : DCDCEN_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCDCEN_Register use record
      DCDCEN        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- DCDCFORCE_Register --
   ------------------------

   --  DCDC power-up force off.
   type FORCEOFF_Field is
     (
      --  No force.
      Noforce,
      --  Force.
      Force)
     with Size => 1;
   for FORCEOFF_Field use
     (Noforce => 0,
      Force => 1);

   --  DCDC power-up force on.
   type FORCEON_Field is
     (
      --  No force.
      Noforce,
      --  Force.
      Force)
     with Size => 1;
   for FORCEON_Field use
     (Noforce => 0,
      Force => 1);

   --  DCDC power-up force register.
   type DCDCFORCE_Register is record
      --  DCDC power-up force off.
      FORCEOFF      : FORCEOFF_Field := Noforce;
      --  DCDC power-up force on.
      FORCEON       : FORCEON_Field := Noforce;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCDCFORCE_Register use record
      FORCEOFF      at 0 range 0 .. 0;
      FORCEON       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power Control.
   type POWER_Peripheral is record
      --  Enable constant latency mode.
      TASKS_CONSTLAT : nrf51.Word;
      --  Enable low power mode (variable latency).
      TASKS_LOWPWR   : nrf51.Word;
      --  Power failure warning.
      EVENTS_POFWARN : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET       : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR       : INTENCLR_Register;
      --  Reset reason.
      RESETREAS      : RESETREAS_Register;
      --  Ram status register.
      RAMSTATUS      : RAMSTATUS_Register;
      --  System off register.
      SYSTEMOFF      : SYSTEMOFF_Register;
      --  Power failure configuration.
      POFCON         : POFCON_Register;
      --  General purpose retention register. This register is a retained
      --  register.
      GPREGRET       : GPREGRET_Register;
      --  Ram on/off.
      RAMON          : RAMON_Register;
      --  Pin reset functionality configuration register. This register is a
      --  retained register.
      RESET          : RESET_Register;
      --  Ram on/off.
      RAMONB         : RAMONB_Register;
      --  DCDC converter enable configuration register.
      DCDCEN         : DCDCEN_Register;
      --  DCDC power-up force register.
      DCDCFORCE      : DCDCFORCE_Register;
   end record
     with Volatile;

   for POWER_Peripheral use record
      TASKS_CONSTLAT at 120 range 0 .. 31;
      TASKS_LOWPWR   at 124 range 0 .. 31;
      EVENTS_POFWARN at 264 range 0 .. 31;
      INTENSET       at 772 range 0 .. 31;
      INTENCLR       at 776 range 0 .. 31;
      RESETREAS      at 1024 range 0 .. 31;
      RAMSTATUS      at 1064 range 0 .. 31;
      SYSTEMOFF      at 1280 range 0 .. 31;
      POFCON         at 1296 range 0 .. 31;
      GPREGRET       at 1308 range 0 .. 31;
      RAMON          at 1316 range 0 .. 31;
      RESET          at 1348 range 0 .. 31;
      RAMONB         at 1364 range 0 .. 31;
      DCDCEN         at 1400 range 0 .. 31;
      DCDCFORCE      at 2568 range 0 .. 31;
   end record;

   --  Power Control.
   POWER_Periph : aliased POWER_Peripheral
     with Import, Address => POWER_Base;

end nrf51.POWER;
