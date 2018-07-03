--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.SPIS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between END event and the ACQUIRE task.
   type END_ACQUIRE_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for END_ACQUIRE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for SPIS.
   type SHORTS_Register is record
      --  unspecified
      Reserved_0_1  : nrf51.UInt2 := 16#0#;
      --  Shortcut between END event and the ACQUIRE task.
      END_ACQUIRE   : END_ACQUIRE_Field := Disabled;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      END_ACQUIRE   at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

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

   --  enable interrupt on ENDRX event.
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

   --  enable interrupt on ENDRX event.
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

   --  Enable interrupt on ACQUIRED event.
   type ACQUIRED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ACQUIRED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ACQUIRED event.
   type ACQUIRED_Field_1 is
     (
      --  Reset value for the field
      Acquired_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ACQUIRED_Field_1 use
     (Acquired_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  unspecified
      Reserved_0_0   : nrf51.Bit := 16#0#;
      --  Enable interrupt on END event.
      END_k          : END_Field_1 := End_Field_Reset;
      --  unspecified
      Reserved_2_3   : nrf51.UInt2 := 16#0#;
      --  enable interrupt on ENDRX event.
      ENDRX          : ENDRX_Field_1 := Endrx_Field_Reset;
      --  unspecified
      Reserved_5_9   : nrf51.UInt5 := 16#0#;
      --  Enable interrupt on ACQUIRED event.
      ACQUIRED       : ACQUIRED_Field_1 := Acquired_Field_Reset;
      --  unspecified
      Reserved_11_31 : nrf51.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      END_k          at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      ENDRX          at 0 range 4 .. 4;
      Reserved_5_9   at 0 range 5 .. 9;
      ACQUIRED       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
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

   --  Disable interrupt on ACQUIRED event.
   type ACQUIRED_Field_2 is
     (
      --  Reset value for the field
      Acquired_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ACQUIRED_Field_2 use
     (Acquired_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  unspecified
      Reserved_0_0   : nrf51.Bit := 16#0#;
      --  Disable interrupt on END event.
      END_k          : END_Field_2 := End_Field_Reset;
      --  unspecified
      Reserved_2_3   : nrf51.UInt2 := 16#0#;
      --  Disable interrupt on ENDRX event.
      ENDRX          : ENDRX_Field_2 := Endrx_Field_Reset;
      --  unspecified
      Reserved_5_9   : nrf51.UInt5 := 16#0#;
      --  Disable interrupt on ACQUIRED event.
      ACQUIRED       : ACQUIRED_Field_2 := Acquired_Field_Reset;
      --  unspecified
      Reserved_11_31 : nrf51.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      END_k          at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      ENDRX          at 0 range 4 .. 4;
      Reserved_5_9   at 0 range 5 .. 9;
      ACQUIRED       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ----------------------
   -- SEMSTAT_Register --
   ----------------------

   --  Semaphore status.
   type SEMSTAT_Field is
     (
      --  Semaphore is free.
      Free,
      --  Semaphore is assigned to the CPU.
      Cpu,
      --  Semaphore is assigned to the SPIS.
      Spis,
      --  Semaphore is assigned to the SPIS, but a handover to the CPU is
      --  pending.
      Cpupending)
     with Size => 2;
   for SEMSTAT_Field use
     (Free => 0,
      Cpu => 1,
      Spis => 2,
      Cpupending => 3);

   --  Semaphore status.
   type SEMSTAT_Register is record
      --  Read-only. Semaphore status.
      SEMSTAT       : SEMSTAT_Field;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SEMSTAT_Register use record
      SEMSTAT       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ---------------------
   -- STATUS_Register --
   ---------------------

   --  TX buffer overread detected, and prevented.
   type OVERREAD_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for OVERREAD_Field use
     (Notpresent => 0,
      Present => 1);

   --  TX buffer overread detected, and prevented.
   type OVERREAD_Field_1 is
     (
      --  Reset value for the field
      Overread_Field_Reset,
      --  Clear on write.
      Clear)
     with Size => 1;
   for OVERREAD_Field_1 use
     (Overread_Field_Reset => 0,
      Clear => 1);

   --  RX buffer overflow detected, and prevented.
   type OVERFLOW_Field is
     (
      --  Error not present.
      Notpresent,
      --  Error present.
      Present)
     with Size => 1;
   for OVERFLOW_Field use
     (Notpresent => 0,
      Present => 1);

   --  RX buffer overflow detected, and prevented.
   type OVERFLOW_Field_1 is
     (
      --  Reset value for the field
      Overflow_Field_Reset,
      --  Clear on write.
      Clear)
     with Size => 1;
   for OVERFLOW_Field_1 use
     (Overflow_Field_Reset => 0,
      Clear => 1);

   --  Status from last transaction.
   type STATUS_Register is record
      --  TX buffer overread detected, and prevented.
      OVERREAD      : OVERREAD_Field_1 := Overread_Field_Reset;
      --  RX buffer overflow detected, and prevented.
      OVERFLOW      : OVERFLOW_Field_1 := Overflow_Field_Reset;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS_Register use record
      OVERREAD      at 0 range 0 .. 0;
      OVERFLOW      at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable SPIS.
   type ENABLE_Field is
     (
      --  Disabled SPIS.
      Disabled,
      --  Enable SPIS.
      Enabled)
     with Size => 3;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 2);

   --  Enable SPIS.
   type ENABLE_Register is record
      --  Enable or disable SPIS.
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

   --------------------
   -- MAXRX_Register --
   --------------------

   subtype MAXRX_MAXRX_Field is nrf51.Byte;

   --  Maximum number of bytes in the receive buffer.
   type MAXRX_Register is record
      --  Maximum number of bytes in the receive buffer.
      MAXRX         : MAXRX_MAXRX_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MAXRX_Register use record
      MAXRX         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------------
   -- AMOUNTRX_Register --
   -----------------------

   subtype AMOUNTRX_AMOUNTRX_Field is nrf51.Byte;

   --  Number of bytes received in last granted transaction.
   type AMOUNTRX_Register is record
      --  Read-only. Number of bytes received in last granted transaction.
      AMOUNTRX      : AMOUNTRX_AMOUNTRX_Field;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AMOUNTRX_Register use record
      AMOUNTRX      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --------------------
   -- MAXTX_Register --
   --------------------

   subtype MAXTX_MAXTX_Field is nrf51.Byte;

   --  Maximum number of bytes in the transmit buffer.
   type MAXTX_Register is record
      --  Maximum number of bytes in the transmit buffer.
      MAXTX         : MAXTX_MAXTX_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MAXTX_Register use record
      MAXTX         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------------
   -- AMOUNTTX_Register --
   -----------------------

   subtype AMOUNTTX_AMOUNTTX_Field is nrf51.Byte;

   --  Number of bytes transmitted in last granted transaction.
   type AMOUNTTX_Register is record
      --  Read-only. Number of bytes transmitted in last granted transaction.
      AMOUNTTX      : AMOUNTTX_AMOUNTTX_Field;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AMOUNTTX_Register use record
      AMOUNTTX      at 0 range 0 .. 7;
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

   ------------------
   -- DEF_Register --
   ------------------

   subtype DEF_DEF_Field is nrf51.Byte;

   --  Default character.
   type DEF_Register is record
      --  Default character.
      DEF           : DEF_DEF_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEF_Register use record
      DEF           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
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

   --  SPI slave 1.
   type SPIS1_Peripheral is record
      --  Acquire SPI semaphore.
      TASKS_ACQUIRE   : nrf51.Word;
      --  Release SPI semaphore.
      TASKS_RELEASE   : nrf51.Word;
      --  Granted transaction completed.
      EVENTS_END      : nrf51.Word;
      --  End of RXD buffer reached
      EVENTS_ENDRX    : nrf51.Word;
      --  Semaphore acquired.
      EVENTS_ACQUIRED : nrf51.Word;
      --  Shortcuts for SPIS.
      SHORTS          : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET        : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR        : INTENCLR_Register;
      --  Semaphore status.
      SEMSTAT         : SEMSTAT_Register;
      --  Status from last transaction.
      STATUS          : STATUS_Register;
      --  Enable SPIS.
      ENABLE          : ENABLE_Register;
      --  Pin select for SCK.
      PSELSCK         : nrf51.Word;
      --  Pin select for MISO.
      PSELMISO        : nrf51.Word;
      --  Pin select for MOSI.
      PSELMOSI        : nrf51.Word;
      --  Pin select for CSN.
      PSELCSN         : nrf51.Word;
      --  RX data pointer.
      RXDPTR          : nrf51.Word;
      --  Maximum number of bytes in the receive buffer.
      MAXRX           : MAXRX_Register;
      --  Number of bytes received in last granted transaction.
      AMOUNTRX        : AMOUNTRX_Register;
      --  TX data pointer.
      TXDPTR          : nrf51.Word;
      --  Maximum number of bytes in the transmit buffer.
      MAXTX           : MAXTX_Register;
      --  Number of bytes transmitted in last granted transaction.
      AMOUNTTX        : AMOUNTTX_Register;
      --  Configuration register.
      CONFIG          : CONFIG_Register;
      --  Default character.
      DEF             : DEF_Register;
      --  Over-read character.
      ORC             : ORC_Register;
      --  Peripheral power control.
      POWER           : POWER_Register;
   end record
     with Volatile;

   for SPIS1_Peripheral use record
      TASKS_ACQUIRE   at 36 range 0 .. 31;
      TASKS_RELEASE   at 40 range 0 .. 31;
      EVENTS_END      at 260 range 0 .. 31;
      EVENTS_ENDRX    at 272 range 0 .. 31;
      EVENTS_ACQUIRED at 296 range 0 .. 31;
      SHORTS          at 512 range 0 .. 31;
      INTENSET        at 772 range 0 .. 31;
      INTENCLR        at 776 range 0 .. 31;
      SEMSTAT         at 1024 range 0 .. 31;
      STATUS          at 1088 range 0 .. 31;
      ENABLE          at 1280 range 0 .. 31;
      PSELSCK         at 1288 range 0 .. 31;
      PSELMISO        at 1292 range 0 .. 31;
      PSELMOSI        at 1296 range 0 .. 31;
      PSELCSN         at 1300 range 0 .. 31;
      RXDPTR          at 1332 range 0 .. 31;
      MAXRX           at 1336 range 0 .. 31;
      AMOUNTRX        at 1340 range 0 .. 31;
      TXDPTR          at 1348 range 0 .. 31;
      MAXTX           at 1352 range 0 .. 31;
      AMOUNTTX        at 1356 range 0 .. 31;
      CONFIG          at 1364 range 0 .. 31;
      DEF             at 1372 range 0 .. 31;
      ORC             at 1472 range 0 .. 31;
      POWER           at 4092 range 0 .. 31;
   end record;

   --  SPI slave 1.
   SPIS1_Periph : aliased SPIS1_Peripheral
     with Import, Address => SPIS1_Base;

end nrf51.SPIS;
