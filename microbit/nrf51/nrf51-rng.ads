--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.RNG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between VALRDY event and STOP task.
   type VALRDY_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for VALRDY_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for the RNG.
   type SHORTS_Register is record
      --  Shortcut between VALRDY event and STOP task.
      VALRDY_STOP   : VALRDY_STOP_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      VALRDY_STOP   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on VALRDY event.
   type VALRDY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for VALRDY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on VALRDY event.
   type VALRDY_Field_1 is
     (
      --  Reset value for the field
      Valrdy_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for VALRDY_Field_1 use
     (Valrdy_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register
   type INTENSET_Register is record
      --  Enable interrupt on VALRDY event.
      VALRDY        : VALRDY_Field_1 := Valrdy_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      VALRDY        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on VALRDY event.
   type VALRDY_Field_2 is
     (
      --  Reset value for the field
      Valrdy_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for VALRDY_Field_2 use
     (Valrdy_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register
   type INTENCLR_Register is record
      --  Disable interrupt on VALRDY event.
      VALRDY        : VALRDY_Field_2 := Valrdy_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      VALRDY        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- CONFIG_Register --
   ---------------------

   --  Digital error correction enable.
   type DERCEN_Field is
     (
      --  Digital error correction disabled.
      Disabled,
      --  Digital error correction enabled.
      Enabled)
     with Size => 1;
   for DERCEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Configuration register.
   type CONFIG_Register is record
      --  Digital error correction enable.
      DERCEN        : DERCEN_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      DERCEN        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --------------------
   -- VALUE_Register --
   --------------------

   subtype VALUE_VALUE_Field is nrf51.Byte;

   --  RNG random number.
   type VALUE_Register is record
      --  Read-only. Generated random number.
      VALUE         : VALUE_VALUE_Field;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for VALUE_Register use record
      VALUE         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

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

   --  Random Number Generator.
   type RNG_Peripheral is record
      --  Start the random number generator.
      TASKS_START   : nrf51.Word;
      --  Stop the random number generator.
      TASKS_STOP    : nrf51.Word;
      --  New random number generated and written to VALUE register.
      EVENTS_VALRDY : nrf51.Word;
      --  Shortcuts for the RNG.
      SHORTS        : SHORTS_Register;
      --  Interrupt enable set register
      INTENSET      : INTENSET_Register;
      --  Interrupt enable clear register
      INTENCLR      : INTENCLR_Register;
      --  Configuration register.
      CONFIG        : CONFIG_Register;
      --  RNG random number.
      VALUE         : VALUE_Register;
      --  Peripheral power control.
      POWER         : POWER_Register;
   end record
     with Volatile;

   for RNG_Peripheral use record
      TASKS_START   at 0 range 0 .. 31;
      TASKS_STOP    at 4 range 0 .. 31;
      EVENTS_VALRDY at 256 range 0 .. 31;
      SHORTS        at 512 range 0 .. 31;
      INTENSET      at 772 range 0 .. 31;
      INTENCLR      at 776 range 0 .. 31;
      CONFIG        at 1284 range 0 .. 31;
      VALUE         at 1288 range 0 .. 31;
      POWER         at 4092 range 0 .. 31;
   end record;

   --  Random Number Generator.
   RNG_Periph : aliased RNG_Peripheral
     with Import, Address => RNG_Base;

end nrf51.RNG;
