--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.SPIM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on STOPPED event.
   type STOPPED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for STOPPED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on STOPPED event.
   type STOPPED_Field_1 is
     (
      --  Reset value for the field
      Stopped_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for STOPPED_Field_1 use
     (Stopped_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ENDRX event.
   type ENDRX_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ENDRX_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ENDRX event.
   type ENDRX_Field_1 is
     (
      --  Reset value for the field
      Endrx_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ENDRX_Field_1 use
     (Endrx_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ENDTX event.
   type ENDTX_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ENDTX_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ENDTX event.
   type ENDTX_Field_1 is
     (
      --  Reset value for the field
      Endtx_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ENDTX_Field_1 use
     (Endtx_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on STARTED event.
   type STARTED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for STARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on STARTED event.
   type STARTED_Field_1 is
     (
      --  Reset value for the field
      Started_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for STARTED_Field_1 use
     (Started_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  unspecified
      Reserved_0_0   : nrf51.Bit := 16#0#;
      --  Enable interrupt on STOPPED event.
      STOPPED        : STOPPED_Field_1 := Stopped_Field_Reset;
      --  unspecified
      Reserved_2_3   : nrf51.UInt2 := 16#0#;
      --  Enable interrupt on ENDRX event.
      ENDRX          : ENDRX_Field_1 := Endrx_Field_Reset;
      --  unspecified
      Reserved_5_7   : nrf51.UInt3 := 16#0#;
      --  Enable interrupt on ENDTX event.
      ENDTX          : ENDTX_Field_1 := Endtx_Field_Reset;
      --  unspecified
      Reserved_9_18  : nrf51.UInt10 := 16#0#;
      --  Enable interrupt on STARTED event.
      STARTED        : STARTED_Field_1 := Started_Field_Reset;
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      STOPPED        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      ENDRX          at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      ENDTX          at 0 range 8 .. 8;
      Reserved_9_18  at 0 range 9 .. 18;
      STARTED        at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on STOPPED event.
   type STOPPED_Field_2 is
     (
      --  Reset value for the field
      Stopped_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for STOPPED_Field_2 use
     (Stopped_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ENDRX event.
   type ENDRX_Field_2 is
     (
      --  Reset value for the field
      Endrx_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ENDRX_Field_2 use
     (Endrx_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ENDTX event.
   type ENDTX_Field_2 is
     (
      --  Reset value for the field
      Endtx_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ENDTX_Field_2 use
     (Endtx_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on STARTED event.
   type STARTED_Field_2 is
     (
      --  Reset value for the field
      Started_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for STARTED_Field_2 use
     (Started_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  unspecified
      Reserved_0_0   : nrf51.Bit := 16#0#;
      --  Disable interrupt on STOPPED event.
      STOPPED        : STOPPED_Field_2 := Stopped_Field_Reset;
      --  unspecified
      Reserved_2_3   : nrf51.UInt2 := 16#0#;
      --  Disable interrupt on ENDRX event.
      ENDRX          : ENDRX_Field_2 := Endrx_Field_Reset;
      --  unspecified
      Reserved_5_7   : nrf51.UInt3 := 16#0#;
      --  Disable interrupt on ENDTX event.
      ENDTX          : ENDTX_Field_2 := Endtx_Field_Reset;
      --  unspecified
      Reserved_9_18  : nrf51.UInt10 := 16#0#;
      --  Disable interrupt on STARTED event.
      STARTED        : STARTED_Field_2 := Started_Field_Reset;
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      STOPPED        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      ENDRX          at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      ENDTX          at 0 range 8 .. 8;
      Reserved_9_18  at 0 range 9 .. 18;
      STARTED        at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable SPIM.
   type ENABLE_Field is
     (
      --  Disabled SPIM.
      Disabled,
      --  Enable SPIM.
      Enabled)
     with Size => 4;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 7);

   --  Enable SPIM.
   type ENABLE_Register is record
      --  Enable or disable SPIM.
      ENABLE        : ENABLE_Field := Disabled;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
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

   ------------------
   -- ORC_Register --
   ------------------

   subtype ORC_ORC_Field is nrf51.Byte;

   --  Over-read character.
   type ORC_Register is record
      --  Over-read character.
      ORC           : ORC_ORC_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ORC_Register use record
      ORC           at 0 range 0 .. 7;
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

   --  SPI master with easyDMA 1.
   type SPIM1_Peripheral is record
      --  Start SPI transaction.
      TASKS_START    : nrf51.Word;
      --  Stop SPI transaction.
      TASKS_STOP     : nrf51.Word;
      --  Suspend SPI transaction.
      TASKS_SUSPEND  : nrf51.Word;
      --  Resume SPI transaction.
      TASKS_RESUME   : nrf51.Word;
      --  SPI transaction has stopped.
      EVENTS_STOPPED : nrf51.Word;
      --  End of RXD buffer reached.
      EVENTS_ENDRX   : nrf51.Word;
      --  End of TXD buffer reached.
      EVENTS_ENDTX   : nrf51.Word;
      --  Transaction started.
      EVENTS_STARTED : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET       : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR       : INTENCLR_Register;
      --  Enable SPIM.
      ENABLE         : ENABLE_Register;
      --  Pin select configuration.
      PSEL           : nrf51.Word;
      --  SPI frequency.
      FREQUENCY      : nrf51.Word;
      --  RXD EasyDMA configuration and status.
      RXD            : nrf51.Word;
      --  TXD EasyDMA configuration and status.
      TXD            : nrf51.Word;
      --  Configuration register.
      CONFIG         : CONFIG_Register;
      --  Over-read character.
      ORC            : ORC_Register;
      --  Peripheral power control.
      POWER          : POWER_Register;
   end record
     with Volatile;

   for SPIM1_Peripheral use record
      TASKS_START    at 16 range 0 .. 31;
      TASKS_STOP     at 20 range 0 .. 31;
      TASKS_SUSPEND  at 28 range 0 .. 31;
      TASKS_RESUME   at 32 range 0 .. 31;
      EVENTS_STOPPED at 260 range 0 .. 31;
      EVENTS_ENDRX   at 272 range 0 .. 31;
      EVENTS_ENDTX   at 288 range 0 .. 31;
      EVENTS_STARTED at 332 range 0 .. 31;
      INTENSET       at 772 range 0 .. 31;
      INTENCLR       at 776 range 0 .. 31;
      ENABLE         at 1280 range 0 .. 31;
      PSEL           at 1288 range 0 .. 31;
      FREQUENCY      at 1316 range 0 .. 31;
      RXD            at 1332 range 0 .. 31;
      TXD            at 1348 range 0 .. 31;
      CONFIG         at 1364 range 0 .. 31;
      ORC            at 1472 range 0 .. 31;
      POWER          at 4092 range 0 .. 31;
   end record;

   --  SPI master with easyDMA 1.
   SPIM1_Periph : aliased SPIM1_Peripheral
     with Import, Address => SPIM1_Base;

end nrf51.SPIM;
