--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.SPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on READY event.
   type READY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for READY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on READY event.
   type READY_Field_1 is
     (
      --  Reset value for the field
      Ready_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for READY_Field_1 use
     (Ready_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  unspecified
      Reserved_0_1  : nrf51.UInt2 := 16#0#;
      --  Enable interrupt on READY event.
      READY         : READY_Field_1 := Ready_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      READY         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on READY event.
   type READY_Field_2 is
     (
      --  Reset value for the field
      Ready_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for READY_Field_2 use
     (Ready_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  unspecified
      Reserved_0_1  : nrf51.UInt2 := 16#0#;
      --  Disable interrupt on READY event.
      READY         : READY_Field_2 := Ready_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      READY         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable SPI.
   type ENABLE_Field is
     (
      --  Disabled SPI.
      Disabled,
      --  Enable SPI.
      Enabled)
     with Size => 3;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable SPI.
   type ENABLE_Register is record
      --  Enable or disable SPI.
      ENABLE        : ENABLE_Field := Disabled;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------
   -- RXD_Register --
   ------------------

   subtype RXD_RXD_Field is nrf51.Byte;

   --  RX data.
   type RXD_Register is record
      --  Read-only. *** Reading this field has side effects on other resources
      --  ***. RX data from last transfer.
      RXD           : RXD_RXD_Field;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXD_Register use record
      RXD           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- TXD_Register --
   ------------------

   subtype TXD_TXD_Field is nrf51.Byte;

   --  TX data.
   type TXD_Register is record
      --  TX data for next transfer.
      TXD           : TXD_TXD_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXD_Register use record
      TXD           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ---------------------
   -- CONFIG_Register --
   ---------------------

   --  Bit order.
   type ORDER_Field is
     (
      --  Most significant bit transmitted out first.
      Msbfirst,
      --  Least significant bit transmitted out first.
      Lsbfirst)
     with Size => 1;
   for ORDER_Field use
     (Msbfirst => 0,
      Lsbfirst => 1);

   --  Serial clock (SCK) phase.
   type CPHA_Field is
     (
      --  Sample on leading edge of the clock. Shift serial data on trailing
      --  edge.
      Leading,
      --  Sample on trailing edge of the clock. Shift serial data on leading
      --  edge.
      Trailing)
     with Size => 1;
   for CPHA_Field use
     (Leading => 0,
      Trailing => 1);

   --  Serial clock (SCK) polarity.
   type CPOL_Field is
     (
      --  Active high.
      Activehigh,
      --  Active low.
      Activelow)
     with Size => 1;
   for CPOL_Field use
     (Activehigh => 0,
      Activelow => 1);

   --  Configuration register.
   type CONFIG_Register is record
      --  Bit order.
      ORDER         : ORDER_Field := Msbfirst;
      --  Serial clock (SCK) phase.
      CPHA          : CPHA_Field := Leading;
      --  Serial clock (SCK) polarity.
      CPOL          : CPOL_Field := Activehigh;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      ORDER         at 0 range 0 .. 0;
      CPHA          at 0 range 1 .. 1;
      CPOL          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
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

   --  SPI master 0.
   type SPI_Peripheral is record
      --  TXD byte sent and RXD byte received.
      EVENTS_READY : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET     : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR     : INTENCLR_Register;
      --  Enable SPI.
      ENABLE       : ENABLE_Register;
      --  Pin select for SCK.
      PSELSCK      : nrf51.Word;
      --  Pin select for MOSI.
      PSELMOSI     : nrf51.Word;
      --  Pin select for MISO.
      PSELMISO     : nrf51.Word;
      --  RX data.
      RXD          : RXD_Register;
      --  TX data.
      TXD          : TXD_Register;
      --  SPI frequency
      FREQUENCY    : nrf51.Word;
      --  Configuration register.
      CONFIG       : CONFIG_Register;
      --  Peripheral power control.
      POWER        : POWER_Register;
   end record
     with Volatile;

   for SPI_Peripheral use record
      EVENTS_READY at 264 range 0 .. 31;
      INTENSET     at 772 range 0 .. 31;
      INTENCLR     at 776 range 0 .. 31;
      ENABLE       at 1280 range 0 .. 31;
      PSELSCK      at 1288 range 0 .. 31;
      PSELMOSI     at 1292 range 0 .. 31;
      PSELMISO     at 1296 range 0 .. 31;
      RXD          at 1304 range 0 .. 31;
      TXD          at 1308 range 0 .. 31;
      FREQUENCY    at 1316 range 0 .. 31;
      CONFIG       at 1364 range 0 .. 31;
      POWER        at 4092 range 0 .. 31;
   end record;

   --  SPI master 0.
   SPI0_Periph : aliased SPI_Peripheral
     with Import, Address => SPI0_Base;

   --  SPI master 1.
   SPI1_Periph : aliased SPI_Peripheral
     with Import, Address => SPI1_Base;

end nrf51.SPI;
