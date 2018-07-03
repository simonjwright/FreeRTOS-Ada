--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.TEMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on DATARDY event.
   type DATARDY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for DATARDY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on DATARDY event.
   type DATARDY_Field_1 is
     (
      --  Reset value for the field
      Datardy_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for DATARDY_Field_1 use
     (Datardy_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on DATARDY event.
      DATARDY       : DATARDY_Field_1 := Datardy_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      DATARDY       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on DATARDY event.
   type DATARDY_Field_2 is
     (
      --  Reset value for the field
      Datardy_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for DATARDY_Field_2 use
     (Datardy_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on DATARDY event.
      DATARDY       : DATARDY_Field_2 := Datardy_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      DATARDY       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
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

   --  Temperature Sensor.
   type TEMP_Peripheral is record
      --  Start temperature measurement.
      TASKS_START    : nrf51.Word;
      --  Stop temperature measurement.
      TASKS_STOP     : nrf51.Word;
      --  Temperature measurement complete, data ready event.
      EVENTS_DATARDY : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET       : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR       : INTENCLR_Register;
      --  Die temperature in degC, 2's complement format, 0.25 degC pecision.
      TEMP           : nrf51.Word;
      --  Peripheral power control.
      POWER          : POWER_Register;
   end record
     with Volatile;

   for TEMP_Peripheral use record
      TASKS_START    at 0 range 0 .. 31;
      TASKS_STOP     at 4 range 0 .. 31;
      EVENTS_DATARDY at 256 range 0 .. 31;
      INTENSET       at 772 range 0 .. 31;
      INTENCLR       at 776 range 0 .. 31;
      TEMP           at 1288 range 0 .. 31;
      POWER          at 4092 range 0 .. 31;
   end record;

   --  Temperature Sensor.
   TEMP_Periph : aliased TEMP_Peripheral
     with Import, Address => TEMP_Base;

end nrf51.TEMP;
