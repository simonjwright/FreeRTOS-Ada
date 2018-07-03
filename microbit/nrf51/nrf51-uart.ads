--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.UART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between CTS event and STARTRX task.
   type CTS_STARTRX_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for CTS_STARTRX_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between NCTS event and STOPRX task.
   type NCTS_STOPRX_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for NCTS_STOPRX_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for UART.
   type SHORTS_Register is record
      --  unspecified
      Reserved_0_2  : nrf51.UInt3 := 16#0#;
      --  Shortcut between CTS event and STARTRX task.
      CTS_STARTRX   : CTS_STARTRX_Field := Disabled;
      --  Shortcut between NCTS event and STOPRX task.
      NCTS_STOPRX   : NCTS_STOPRX_Field := Disabled;
      --  unspecified
      Reserved_5_31 : nrf51.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      CTS_STARTRX   at 0 range 3 .. 3;
      NCTS_STOPRX   at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on CTS event.
   type CTS_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for CTS_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on CTS event.
   type CTS_Field_1 is
     (
      --  Reset value for the field
      Cts_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for CTS_Field_1 use
     (Cts_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on NCTS event.
   type NCTS_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for NCTS_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on NCTS event.
   type NCTS_Field_1 is
     (
      --  Reset value for the field
      Ncts_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for NCTS_Field_1 use
     (Ncts_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on RXRDY event.
   type RXDRDY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for RXDRDY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on RXRDY event.
   type RXDRDY_Field_1 is
     (
      --  Reset value for the field
      Rxdrdy_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for RXDRDY_Field_1 use
     (Rxdrdy_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on TXRDY event.
   type TXDRDY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for TXDRDY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on TXRDY event.
   type TXDRDY_Field_1 is
     (
      --  Reset value for the field
      Txdrdy_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for TXDRDY_Field_1 use
     (Txdrdy_Field_Reset => 0,
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

   --  Enable interrupt on RXTO event.
   type RXTO_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for RXTO_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on RXTO event.
   type RXTO_Field_1 is
     (
      --  Reset value for the field
      Rxto_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for RXTO_Field_1 use
     (Rxto_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on CTS event.
      CTS            : CTS_Field_1 := Cts_Field_Reset;
      --  Enable interrupt on NCTS event.
      NCTS           : NCTS_Field_1 := Ncts_Field_Reset;
      --  Enable interrupt on RXRDY event.
      RXDRDY         : RXDRDY_Field_1 := Rxdrdy_Field_Reset;
      --  unspecified
      Reserved_3_6   : nrf51.UInt4 := 16#0#;
      --  Enable interrupt on TXRDY event.
      TXDRDY         : TXDRDY_Field_1 := Txdrdy_Field_Reset;
      --  unspecified
      Reserved_8_8   : nrf51.Bit := 16#0#;
      --  Enable interrupt on ERROR event.
      ERROR          : ERROR_Field_1 := Error_Field_Reset;
      --  unspecified
      Reserved_10_16 : nrf51.UInt7 := 16#0#;
      --  Enable interrupt on RXTO event.
      RXTO           : RXTO_Field_1 := Rxto_Field_Reset;
      --  unspecified
      Reserved_18_31 : nrf51.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      CTS            at 0 range 0 .. 0;
      NCTS           at 0 range 1 .. 1;
      RXDRDY         at 0 range 2 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      TXDRDY         at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      ERROR          at 0 range 9 .. 9;
      Reserved_10_16 at 0 range 10 .. 16;
      RXTO           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on CTS event.
   type CTS_Field_2 is
     (
      --  Reset value for the field
      Cts_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for CTS_Field_2 use
     (Cts_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on NCTS event.
   type NCTS_Field_2 is
     (
      --  Reset value for the field
      Ncts_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for NCTS_Field_2 use
     (Ncts_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on RXRDY event.
   type RXDRDY_Field_2 is
     (
      --  Reset value for the field
      Rxdrdy_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for RXDRDY_Field_2 use
     (Rxdrdy_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on TXRDY event.
   type TXDRDY_Field_2 is
     (
      --  Reset value for the field
      Txdrdy_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for TXDRDY_Field_2 use
     (Txdrdy_Field_Reset => 0,
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

   --  Disable interrupt on RXTO event.
   type RXTO_Field_2 is
     (
      --  Reset value for the field
      Rxto_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for RXTO_Field_2 use
     (Rxto_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on CTS event.
      CTS            : CTS_Field_2 := Cts_Field_Reset;
      --  Disable interrupt on NCTS event.
      NCTS           : NCTS_Field_2 := Ncts_Field_Reset;
      --  Disable interrupt on RXRDY event.
      RXDRDY         : RXDRDY_Field_2 := Rxdrdy_Field_Reset;
      --  unspecified
      Reserved_3_6   : nrf51.UInt4 := 16#0#;
      --  Disable interrupt on TXRDY event.
      TXDRDY         : TXDRDY_Field_2 := Txdrdy_Field_Reset;
      --  unspecified
      Reserved_8_8   : nrf51.Bit := 16#0#;
      --  Disable interrupt on ERROR event.
      ERROR          : ERROR_Field_2 := Error_Field_Reset;
      --  unspecified
      Reserved_10_16 : nrf51.UInt7 := 16#0#;
      --  Disable interrupt on RXTO event.
      RXTO           : RXTO_Field_2 := Rxto_Field_Reset;
      --  unspecified
      Reserved_18_31 : nrf51.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      CTS            at 0 range 0 .. 0;
      NCTS           at 0 range 1 .. 1;
      RXDRDY         at 0 range 2 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      TXDRDY         at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      ERROR          at 0 range 9 .. 9;
      Reserved_10_16 at 0 range 10 .. 16;
      RXTO           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   -----------------------
   -- ERRORSRC_Register --
   -----------------------

   --  A start bit is received while the previous data still lies in RXD. (Data
   --  loss).
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

   --  A start bit is received while the previous data still lies in RXD. (Data
   --  loss).
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

   --  A character with bad parity is received. Only checked if HW parity
   --  control is enabled.
   type PARITY_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for PARITY_Field use
     (Notpresent => 0,
      Present => 1);

   --  A character with bad parity is received. Only checked if HW parity
   --  control is enabled.
   type PARITY_Field_1 is
     (
      --  Reset value for the field
      Parity_Field_Reset,
      --  Clear error on write.
      Clear)
     with Size => 1;
   for PARITY_Field_1 use
     (Parity_Field_Reset => 0,
      Clear => 1);

   --  A valid stop bit is not detected on the serial data input after all bits
   --  in a character have been received.
   type FRAMING_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for FRAMING_Field use
     (Notpresent => 0,
      Present => 1);

   --  A valid stop bit is not detected on the serial data input after all bits
   --  in a character have been received.
   type FRAMING_Field_1 is
     (
      --  Reset value for the field
      Framing_Field_Reset,
      --  Clear error on write.
      Clear)
     with Size => 1;
   for FRAMING_Field_1 use
     (Framing_Field_Reset => 0,
      Clear => 1);

   --  The serial data input is '0' for longer than the length of a data frame.
   type BREAK_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for BREAK_Field use
     (Notpresent => 0,
      Present => 1);

   --  The serial data input is '0' for longer than the length of a data frame.
   type BREAK_Field_1 is
     (
      --  Reset value for the field
      Break_Field_Reset,
      --  Clear error on write.
      Clear)
     with Size => 1;
   for BREAK_Field_1 use
     (Break_Field_Reset => 0,
      Clear => 1);

   --  Error source. Write error field to 1 to clear error.
   type ERRORSRC_Register is record
      --  A start bit is received while the previous data still lies in RXD.
      --  (Data loss).
      OVERRUN       : OVERRUN_Field_1 := Overrun_Field_Reset;
      --  A character with bad parity is received. Only checked if HW parity
      --  control is enabled.
      PARITY        : PARITY_Field_1 := Parity_Field_Reset;
      --  A valid stop bit is not detected on the serial data input after all
      --  bits in a character have been received.
      FRAMING       : FRAMING_Field_1 := Framing_Field_Reset;
      --  The serial data input is '0' for longer than the length of a data
      --  frame.
      BREAK         : BREAK_Field_1 := Break_Field_Reset;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ERRORSRC_Register use record
      OVERRUN       at 0 range 0 .. 0;
      PARITY        at 0 range 1 .. 1;
      FRAMING       at 0 range 2 .. 2;
      BREAK         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable UART and acquire IOs.
   type ENABLE_Field is
     (
      --  UART disabled.
      Disabled,
      --  UART enabled.
      Enabled)
     with Size => 3;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 4);

   --  Enable UART and acquire IOs.
   type ENABLE_Register is record
      --  Enable or disable UART and acquire IOs.
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

   --  RXD register. On read action the buffer pointer is displaced. Once read
   --  the character is consumed. If read when no character available, the UART
   --  will stop working.
   type RXD_Register is record
      --  Read-only. *** Reading this field has side effects on other resources
      --  ***. RX data from previous transfer. Double buffered.
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

   --  TXD register.
   type TXD_Register is record
      --  Write-only. TX data for transfer.
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

   --  Hardware flow control.
   type HWFC_Field is
     (
      --  Hardware flow control disabled.
      Disabled,
      --  Hardware flow control enabled.
      Enabled)
     with Size => 1;
   for HWFC_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Include parity bit.
   type PARITY_Field_2 is
     (
      --  Parity bit excluded.
      Excluded,
      --  Parity bit included.
      Included)
     with Size => 3;
   for PARITY_Field_2 use
     (Excluded => 0,
      Included => 7);

   --  Configuration of parity and hardware flow control register.
   type CONFIG_Register is record
      --  Hardware flow control.
      HWFC          : HWFC_Field := Disabled;
      --  Include parity bit.
      PARITY        : PARITY_Field_2 := Excluded;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      HWFC          at 0 range 0 .. 0;
      PARITY        at 0 range 1 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
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

   --  Universal Asynchronous Receiver/Transmitter.
   type UART0_Peripheral is record
      --  Start UART receiver.
      TASKS_STARTRX : nrf51.Word;
      --  Stop UART receiver.
      TASKS_STOPRX  : nrf51.Word;
      --  Start UART transmitter.
      TASKS_STARTTX : nrf51.Word;
      --  Stop UART transmitter.
      TASKS_STOPTX  : nrf51.Word;
      --  Suspend UART.
      TASKS_SUSPEND : nrf51.Word;
      --  CTS activated.
      EVENTS_CTS    : nrf51.Word;
      --  CTS deactivated.
      EVENTS_NCTS   : nrf51.Word;
      --  Data received in RXD.
      EVENTS_RXDRDY : nrf51.Word;
      --  Data sent from TXD.
      EVENTS_TXDRDY : nrf51.Word;
      --  Error detected.
      EVENTS_ERROR  : nrf51.Word;
      --  Receiver timeout.
      EVENTS_RXTO   : nrf51.Word;
      --  Shortcuts for UART.
      SHORTS        : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET      : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR      : INTENCLR_Register;
      --  Error source. Write error field to 1 to clear error.
      ERRORSRC      : ERRORSRC_Register;
      --  Enable UART and acquire IOs.
      ENABLE        : ENABLE_Register;
      --  Pin select for RTS.
      PSELRTS       : nrf51.Word;
      --  Pin select for TXD.
      PSELTXD       : nrf51.Word;
      --  Pin select for CTS.
      PSELCTS       : nrf51.Word;
      --  Pin select for RXD.
      PSELRXD       : nrf51.Word;
      --  RXD register. On read action the buffer pointer is displaced. Once
      --  read the character is consumed. If read when no character available,
      --  the UART will stop working.
      RXD           : RXD_Register;
      --  TXD register.
      TXD           : TXD_Register;
      --  UART Baudrate.
      BAUDRATE      : nrf51.Word;
      --  Configuration of parity and hardware flow control register.
      CONFIG        : CONFIG_Register;
      --  Peripheral power control.
      POWER         : POWER_Register;
   end record
     with Volatile;

   for UART0_Peripheral use record
      TASKS_STARTRX at 0 range 0 .. 31;
      TASKS_STOPRX  at 4 range 0 .. 31;
      TASKS_STARTTX at 8 range 0 .. 31;
      TASKS_STOPTX  at 12 range 0 .. 31;
      TASKS_SUSPEND at 28 range 0 .. 31;
      EVENTS_CTS    at 256 range 0 .. 31;
      EVENTS_NCTS   at 260 range 0 .. 31;
      EVENTS_RXDRDY at 264 range 0 .. 31;
      EVENTS_TXDRDY at 284 range 0 .. 31;
      EVENTS_ERROR  at 292 range 0 .. 31;
      EVENTS_RXTO   at 324 range 0 .. 31;
      SHORTS        at 512 range 0 .. 31;
      INTENSET      at 772 range 0 .. 31;
      INTENCLR      at 776 range 0 .. 31;
      ERRORSRC      at 1152 range 0 .. 31;
      ENABLE        at 1280 range 0 .. 31;
      PSELRTS       at 1288 range 0 .. 31;
      PSELTXD       at 1292 range 0 .. 31;
      PSELCTS       at 1296 range 0 .. 31;
      PSELRXD       at 1300 range 0 .. 31;
      RXD           at 1304 range 0 .. 31;
      TXD           at 1308 range 0 .. 31;
      BAUDRATE      at 1316 range 0 .. 31;
      CONFIG        at 1388 range 0 .. 31;
      POWER         at 4092 range 0 .. 31;
   end record;

   --  Universal Asynchronous Receiver/Transmitter.
   UART0_Periph : aliased UART0_Peripheral
     with Import, Address => UART0_Base;

end nrf51.UART;
