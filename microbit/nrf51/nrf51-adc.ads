--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on END event.
   type END_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for END_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on END event.
   type END_Field_1 is
     (
      --  Reset value for the field
      End_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for END_Field_1 use
     (End_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on END event.
      END_k         : END_Field_1 := End_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      END_k         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on END event.
   type END_Field_2 is
     (
      --  Reset value for the field
      End_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for END_Field_2 use
     (End_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on END event.
      END_k         : END_Field_2 := End_Field_Reset;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      END_k         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -------------------
   -- BUSY_Register --
   -------------------

   --  ADC busy register.
   type BUSY_Field is
     (
      --  No ongoing ADC conversion is taking place. ADC is ready.
      Ready,
      --  An ADC conversion is taking place. ADC is busy.
      Busy)
     with Size => 1;
   for BUSY_Field use
     (Ready => 0,
      Busy => 1);

   --  ADC busy register.
   type BUSY_Register is record
      --  Read-only. ADC busy register.
      BUSY          : BUSY_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BUSY_Register use record
      BUSY          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  ADC enable.
   type ENABLE_Field is
     (
      --  ADC is disabled.
      Disabled,
      --  ADC is enabled. If an analog input pin is selected as source of the
      --  conversion, the selected pin is configured as an analog input.
      Enabled)
     with Size => 2;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  ADC enable.
   type ENABLE_Register is record
      --  ADC enable.
      ENABLE        : ENABLE_Field := Disabled;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ---------------------
   -- CONFIG_Register --
   ---------------------

   --  ADC resolution.
   type RES_Field is
     (
      --  8bit ADC resolution.
      RES_Field_8BIT,
      --  9bit ADC resolution.
      RES_Field_9BIT,
      --  10bit ADC resolution.
      RES_Field_10BIT)
     with Size => 2;
   for RES_Field use
     (RES_Field_8BIT => 0,
      RES_Field_9BIT => 1,
      RES_Field_10BIT => 2);

   --  ADC input selection.
   type INPSEL_Field is
     (
      --  Analog input specified by PSEL with no prescaling used as input for
      --  the conversion.
      Analoginputnoprescaling,
      --  Analog input specified by PSEL with 2/3 prescaling used as input for
      --  the conversion.
      Analoginputtwothirdsprescaling,
      --  Analog input specified by PSEL with 1/3 prescaling used as input for
      --  the conversion.
      Analoginputonethirdprescaling,
      --  Supply voltage with 2/3 prescaling used as input for the conversion.
      Supplytwothirdsprescaling,
      --  Supply voltage with 1/3 prescaling used as input for the conversion.
      Supplyonethirdprescaling)
     with Size => 3;
   for INPSEL_Field use
     (Analoginputnoprescaling => 0,
      Analoginputtwothirdsprescaling => 1,
      Analoginputonethirdprescaling => 2,
      Supplytwothirdsprescaling => 5,
      Supplyonethirdprescaling => 6);

   --  ADC reference selection.
   type REFSEL_Field is
     (
      --  Use internal 1.2V bandgap voltage as reference for conversion.
      Vbg,
      --  Use external source configured by EXTREFSEL as reference for
      --  conversion.
      External,
      --  Use supply voltage with 1/2 prescaling as reference for conversion.
      --  Only usable when supply voltage is between 1.7V and 2.6V.
      Supplyonehalfprescaling,
      --  Use supply voltage with 1/3 prescaling as reference for conversion.
      --  Only usable when supply voltage is between 2.5V and 3.6V.
      Supplyonethirdprescaling)
     with Size => 2;
   for REFSEL_Field use
     (Vbg => 0,
      External => 1,
      Supplyonehalfprescaling => 2,
      Supplyonethirdprescaling => 3);

   --  ADC analog pin selection.
   type PSEL_Field is
     (
      --  Analog input pins disabled.
      Disabled,
      --  Use analog input 0 as analog input.
      Analoginput0,
      --  Use analog input 1 as analog input.
      Analoginput1,
      --  Use analog input 2 as analog input.
      Analoginput2,
      --  Use analog input 3 as analog input.
      Analoginput3,
      --  Use analog input 4 as analog input.
      Analoginput4,
      --  Use analog input 5 as analog input.
      Analoginput5,
      --  Use analog input 6 as analog input.
      Analoginput6,
      --  Use analog input 7 as analog input.
      Analoginput7)
     with Size => 8;
   for PSEL_Field use
     (Disabled => 0,
      Analoginput0 => 1,
      Analoginput1 => 2,
      Analoginput2 => 4,
      Analoginput3 => 8,
      Analoginput4 => 16,
      Analoginput5 => 32,
      Analoginput6 => 64,
      Analoginput7 => 128);

   --  ADC external reference pin selection.
   type EXTREFSEL_Field is
     (
      --  Analog external reference inputs disabled.
      None,
      --  Use analog reference 0 as reference.
      Analogreference0,
      --  Use analog reference 1 as reference.
      Analogreference1)
     with Size => 2;
   for EXTREFSEL_Field use
     (None => 0,
      Analogreference0 => 1,
      Analogreference1 => 2);

   --  ADC configuration register.
   type CONFIG_Register is record
      --  ADC resolution.
      RES            : RES_Field := RES_Field_8BIT;
      --  ADC input selection.
      INPSEL         : INPSEL_Field := Supplyonethirdprescaling;
      --  ADC reference selection.
      REFSEL         : REFSEL_Field := Vbg;
      --  unspecified
      Reserved_7_7   : nrf51.Bit := 16#0#;
      --  ADC analog pin selection.
      PSEL           : PSEL_Field := Disabled;
      --  ADC external reference pin selection.
      EXTREFSEL      : EXTREFSEL_Field := None;
      --  unspecified
      Reserved_18_31 : nrf51.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      RES            at 0 range 0 .. 1;
      INPSEL         at 0 range 2 .. 4;
      REFSEL         at 0 range 5 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PSEL           at 0 range 8 .. 15;
      EXTREFSEL      at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   ---------------------
   -- RESULT_Register --
   ---------------------

   subtype RESULT_RESULT_Field is nrf51.UInt10;

   --  Result of ADC conversion.
   type RESULT_Register is record
      --  Read-only. Result of ADC conversion.
      RESULT         : RESULT_RESULT_Field;
      --  unspecified
      Reserved_10_31 : nrf51.UInt22;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESULT_Register use record
      RESULT         at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
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

   --  Analog to digital converter.
   type ADC_Peripheral is record
      --  Start an ADC conversion.
      TASKS_START : nrf51.Word;
      --  Stop ADC.
      TASKS_STOP  : nrf51.Word;
      --  ADC conversion complete.
      EVENTS_END  : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET    : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR    : INTENCLR_Register;
      --  ADC busy register.
      BUSY        : BUSY_Register;
      --  ADC enable.
      ENABLE      : ENABLE_Register;
      --  ADC configuration register.
      CONFIG      : CONFIG_Register;
      --  Result of ADC conversion.
      RESULT      : RESULT_Register;
      --  Peripheral power control.
      POWER       : POWER_Register;
   end record
     with Volatile;

   for ADC_Peripheral use record
      TASKS_START at 0 range 0 .. 31;
      TASKS_STOP  at 4 range 0 .. 31;
      EVENTS_END  at 256 range 0 .. 31;
      INTENSET    at 772 range 0 .. 31;
      INTENCLR    at 776 range 0 .. 31;
      BUSY        at 1024 range 0 .. 31;
      ENABLE      at 1280 range 0 .. 31;
      CONFIG      at 1284 range 0 .. 31;
      RESULT      at 1288 range 0 .. 31;
      POWER       at 4092 range 0 .. 31;
   end record;

   --  Analog to digital converter.
   ADC_Periph : aliased ADC_Peripheral
     with Import, Address => ADC_Base;

end nrf51.ADC;
