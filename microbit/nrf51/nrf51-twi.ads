--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.TWI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between BB event and the SUSPEND task.
   type BB_SUSPEND_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for BB_SUSPEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between BB event and the STOP task.
   type BB_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for BB_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for TWI.
   type SHORTS_Register is record
      --  Shortcut between BB event and the SUSPEND task.
      BB_SUSPEND    : BB_SUSPEND_Field := Disabled;
      --  Shortcut between BB event and the STOP task.
      BB_STOP       : BB_STOP_Field := Disabled;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      BB_SUSPEND    at 0 range 0 .. 0;
      BB_STOP       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

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

   --  Enable interrupt on READY event.
   type RXDREADY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for RXDREADY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on READY event.
   type RXDREADY_Field_1 is
     (
      --  Reset value for the field
      Rxdready_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for RXDREADY_Field_1 use
     (Rxdready_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on TXDSENT event.
   type TXDSENT_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for TXDSENT_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on TXDSENT event.
   type TXDSENT_Field_1 is
     (
      --  Reset value for the field
      Txdsent_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for TXDSENT_Field_1 use
     (Txdsent_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ERROR event.
   type ERROR_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ERROR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ERROR event.
   type ERROR_Field_1 is
     (
      --  Reset value for the field
      Error_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ERROR_Field_1 use
     (Error_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on BB event.
   type BB_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for BB_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on BB event.
   type BB_Field_1 is
     (
      --  Reset value for the field
      Bb_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for BB_Field_1 use
     (Bb_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on SUSPENDED event.
   type SUSPENDED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for SUSPENDED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on SUSPENDED event.
   type SUSPENDED_Field_1 is
     (
      --  Reset value for the field
      Suspended_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for SUSPENDED_Field_1 use
     (Suspended_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  unspecified
      Reserved_0_0   : nrf51.Bit := 16#0#;
      --  Enable interrupt on STOPPED event.
      STOPPED        : STOPPED_Field_1 := Stopped_Field_Reset;
      --  Enable interrupt on READY event.
      RXDREADY       : RXDREADY_Field_1 := Rxdready_Field_Reset;
      --  unspecified
      Reserved_3_6   : nrf51.UInt4 := 16#0#;
      --  Enable interrupt on TXDSENT event.
      TXDSENT        : TXDSENT_Field_1 := Txdsent_Field_Reset;
      --  unspecified
      Reserved_8_8   : nrf51.Bit := 16#0#;
      --  Enable interrupt on ERROR event.
      ERROR          : ERROR_Field_1 := Error_Field_Reset;
      --  unspecified
      Reserved_10_13 : nrf51.UInt4 := 16#0#;
      --  Enable interrupt on BB event.
      BB             : BB_Field_1 := Bb_Field_Reset;
      --  unspecified
      Reserved_15_17 : nrf51.UInt3 := 16#0#;
      --  Enable interrupt on SUSPENDED event.
      SUSPENDED      : SUSPENDED_Field_1 := Suspended_Field_Reset;
      --  unspecified
      Reserved_19_31 : nrf51.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      STOPPED        at 0 range 1 .. 1;
      RXDREADY       at 0 range 2 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      TXDSENT        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      ERROR          at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      BB             at 0 range 14 .. 14;
      Reserved_15_17 at 0 range 15 .. 17;
      SUSPENDED      at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
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

   --  Disable interrupt on RXDREADY event.
   type RXDREADY_Field_2 is
     (
      --  Reset value for the field
      Rxdready_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for RXDREADY_Field_2 use
     (Rxdready_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on TXDSENT event.
   type TXDSENT_Field_2 is
     (
      --  Reset value for the field
      Txdsent_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for TXDSENT_Field_2 use
     (Txdsent_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ERROR event.
   type ERROR_Field_2 is
     (
      --  Reset value for the field
      Error_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ERROR_Field_2 use
     (Error_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on BB event.
   type BB_Field_2 is
     (
      --  Reset value for the field
      Bb_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for BB_Field_2 use
     (Bb_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on SUSPENDED event.
   type SUSPENDED_Field_2 is
     (
      --  Reset value for the field
      Suspended_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for SUSPENDED_Field_2 use
     (Suspended_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  unspecified
      Reserved_0_0   : nrf51.Bit := 16#0#;
      --  Disable interrupt on STOPPED event.
      STOPPED        : STOPPED_Field_2 := Stopped_Field_Reset;
      --  Disable interrupt on RXDREADY event.
      RXDREADY       : RXDREADY_Field_2 := Rxdready_Field_Reset;
      --  unspecified
      Reserved_3_6   : nrf51.UInt4 := 16#0#;
      --  Disable interrupt on TXDSENT event.
      TXDSENT        : TXDSENT_Field_2 := Txdsent_Field_Reset;
      --  unspecified
      Reserved_8_8   : nrf51.Bit := 16#0#;
      --  Disable interrupt on ERROR event.
      ERROR          : ERROR_Field_2 := Error_Field_Reset;
      --  unspecified
      Reserved_10_13 : nrf51.UInt4 := 16#0#;
      --  Disable interrupt on BB event.
      BB             : BB_Field_2 := Bb_Field_Reset;
      --  unspecified
      Reserved_15_17 : nrf51.UInt3 := 16#0#;
      --  Disable interrupt on SUSPENDED event.
      SUSPENDED      : SUSPENDED_Field_2 := Suspended_Field_Reset;
      --  unspecified
      Reserved_19_31 : nrf51.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      STOPPED        at 0 range 1 .. 1;
      RXDREADY       at 0 range 2 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      TXDSENT        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      ERROR          at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      BB             at 0 range 14 .. 14;
      Reserved_15_17 at 0 range 15 .. 17;
      SUSPENDED      at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -----------------------
   -- ERRORSRC_Register --
   -----------------------

   --  Byte received in RXD register before read of the last received byte
   --  (data loss).
   type OVERRUN_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for OVERRUN_Field use
     (Notpresent => 0,
      Present => 1);

   --  Byte received in RXD register before read of the last received byte
   --  (data loss).
   type OVERRUN_Field_1 is
     (
      --  Reset value for the field
      Overrun_Field_Reset,
      --  Clear error on write.
      Clear)
     with Size => 1;
   for OVERRUN_Field_1 use
     (Overrun_Field_Reset => 0,
      Clear => 1);

   --  NACK received after sending the address.
   type ANACK_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for ANACK_Field use
     (Notpresent => 0,
      Present => 1);

   --  NACK received after sending the address.
   type ANACK_Field_1 is
     (
      --  Reset value for the field
      Anack_Field_Reset,
      --  Clear error on write.
      Clear)
     with Size => 1;
   for ANACK_Field_1 use
     (Anack_Field_Reset => 0,
      Clear => 1);

   --  NACK received after sending a data byte.
   type DNACK_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for DNACK_Field use
     (Notpresent => 0,
      Present => 1);

   --  NACK received after sending a data byte.
   type DNACK_Field_1 is
     (
      --  Reset value for the field
      Dnack_Field_Reset,
      --  Clear error on write.
      Clear)
     with Size => 1;
   for DNACK_Field_1 use
     (Dnack_Field_Reset => 0,
      Clear => 1);

   --  Two-wire error source. Write error field to 1 to clear error.
   type ERRORSRC_Register is record
      --  Byte received in RXD register before read of the last received byte
      --  (data loss).
      OVERRUN       : OVERRUN_Field_1 := Overrun_Field_Reset;
      --  NACK received after sending the address.
      ANACK         : ANACK_Field_1 := Anack_Field_Reset;
      --  NACK received after sending a data byte.
      DNACK         : DNACK_Field_1 := Dnack_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ERRORSRC_Register use record
      OVERRUN       at 0 range 0 .. 0;
      ANACK         at 0 range 1 .. 1;
      DNACK         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable W2M
   type ENABLE_Field is
     (
      --  Disabled.
      Disabled,
      --  Enabled.
      Enabled)
     with Size => 3;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 5);

   --  Enable two-wire master.
   type ENABLE_Register is record
      --  Enable or disable W2M
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

   --  RX data register.
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

   --  TX data register.
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

   ----------------------
   -- ADDRESS_Register --
   ----------------------

   subtype ADDRESS_ADDRESS_Field is nrf51.UInt7;

   --  Address used in the two-wire transfer.
   type ADDRESS_Register is record
      --  Two-wire address.
      ADDRESS       : ADDRESS_ADDRESS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : nrf51.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ADDRESS_Register use record
      ADDRESS       at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
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

   --  Two-wire interface master 0.
   type TWI_Peripheral is record
      --  Start 2-Wire master receive sequence.
      TASKS_STARTRX    : nrf51.Word;
      --  Start 2-Wire master transmit sequence.
      TASKS_STARTTX    : nrf51.Word;
      --  Stop 2-Wire transaction.
      TASKS_STOP       : nrf51.Word;
      --  Suspend 2-Wire transaction.
      TASKS_SUSPEND    : nrf51.Word;
      --  Resume 2-Wire transaction.
      TASKS_RESUME     : nrf51.Word;
      --  Two-wire stopped.
      EVENTS_STOPPED   : nrf51.Word;
      --  Two-wire ready to deliver new RXD byte received.
      EVENTS_RXDREADY  : nrf51.Word;
      --  Two-wire finished sending last TXD byte.
      EVENTS_TXDSENT   : nrf51.Word;
      --  Two-wire error detected.
      EVENTS_ERROR     : nrf51.Word;
      --  Two-wire byte boundary.
      EVENTS_BB        : nrf51.Word;
      --  Two-wire suspended.
      EVENTS_SUSPENDED : nrf51.Word;
      --  Shortcuts for TWI.
      SHORTS           : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET         : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR         : INTENCLR_Register;
      --  Two-wire error source. Write error field to 1 to clear error.
      ERRORSRC         : ERRORSRC_Register;
      --  Enable two-wire master.
      ENABLE           : ENABLE_Register;
      --  Pin select for SCL.
      PSELSCL          : nrf51.Word;
      --  Pin select for SDA.
      PSELSDA          : nrf51.Word;
      --  RX data register.
      RXD              : RXD_Register;
      --  TX data register.
      TXD              : TXD_Register;
      --  Two-wire frequency.
      FREQUENCY        : nrf51.Word;
      --  Address used in the two-wire transfer.
      ADDRESS          : ADDRESS_Register;
      --  Peripheral power control.
      POWER            : POWER_Register;
   end record
     with Volatile;

   for TWI_Peripheral use record
      TASKS_STARTRX    at 0 range 0 .. 31;
      TASKS_STARTTX    at 8 range 0 .. 31;
      TASKS_STOP       at 20 range 0 .. 31;
      TASKS_SUSPEND    at 28 range 0 .. 31;
      TASKS_RESUME     at 32 range 0 .. 31;
      EVENTS_STOPPED   at 260 range 0 .. 31;
      EVENTS_RXDREADY  at 264 range 0 .. 31;
      EVENTS_TXDSENT   at 284 range 0 .. 31;
      EVENTS_ERROR     at 292 range 0 .. 31;
      EVENTS_BB        at 312 range 0 .. 31;
      EVENTS_SUSPENDED at 328 range 0 .. 31;
      SHORTS           at 512 range 0 .. 31;
      INTENSET         at 772 range 0 .. 31;
      INTENCLR         at 776 range 0 .. 31;
      ERRORSRC         at 1220 range 0 .. 31;
      ENABLE           at 1280 range 0 .. 31;
      PSELSCL          at 1288 range 0 .. 31;
      PSELSDA          at 1292 range 0 .. 31;
      RXD              at 1304 range 0 .. 31;
      TXD              at 1308 range 0 .. 31;
      FREQUENCY        at 1316 range 0 .. 31;
      ADDRESS          at 1416 range 0 .. 31;
      POWER            at 4092 range 0 .. 31;
   end record;

   --  Two-wire interface master 0.
   TWI0_Periph : aliased TWI_Peripheral
     with Import, Address => TWI0_Base;

   --  Two-wire interface master 1.
   TWI1_Periph : aliased TWI_Peripheral
     with Import, Address => TWI1_Base;

end nrf51.TWI;
