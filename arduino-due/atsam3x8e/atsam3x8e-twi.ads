--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.TWI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_START_Field is ATSAM3X8E.Bit;
   subtype CR_STOP_Field is ATSAM3X8E.Bit;
   subtype CR_MSEN_Field is ATSAM3X8E.Bit;
   subtype CR_MSDIS_Field is ATSAM3X8E.Bit;
   subtype CR_SVEN_Field is ATSAM3X8E.Bit;
   subtype CR_SVDIS_Field is ATSAM3X8E.Bit;
   subtype CR_QUICK_Field is ATSAM3X8E.Bit;
   subtype CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  Write-only. Send a START Condition
      START         : CR_START_Field := 16#0#;
      --  Write-only. Send a STOP Condition
      STOP          : CR_STOP_Field := 16#0#;
      --  Write-only. TWI Master Mode Enabled
      MSEN          : CR_MSEN_Field := 16#0#;
      --  Write-only. TWI Master Mode Disabled
      MSDIS         : CR_MSDIS_Field := 16#0#;
      --  Write-only. TWI Slave Mode Enabled
      SVEN          : CR_SVEN_Field := 16#0#;
      --  Write-only. TWI Slave Mode Disabled
      SVDIS         : CR_SVDIS_Field := 16#0#;
      --  Write-only. SMBUS Quick Command
      QUICK         : CR_QUICK_Field := 16#0#;
      --  Write-only. Software Reset
      SWRST         : CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      START         at 0 range 0 .. 0;
      STOP          at 0 range 1 .. 1;
      MSEN          at 0 range 2 .. 2;
      MSDIS         at 0 range 3 .. 3;
      SVEN          at 0 range 4 .. 4;
      SVDIS         at 0 range 5 .. 5;
      QUICK         at 0 range 6 .. 6;
      SWRST         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- MMR_Register --
   ------------------

   --  Internal Device Address Size
   type IADRSZ_Field is
     (
      --  No internal device address
      None,
      --  One-byte internal device address
      IADRSZ_Field_1_Byte,
      --  Two-byte internal device address
      IADRSZ_Field_2_Byte,
      --  Three-byte internal device address
      IADRSZ_Field_3_Byte)
     with Size => 2;
   for IADRSZ_Field use
     (None => 0,
      IADRSZ_Field_1_Byte => 1,
      IADRSZ_Field_2_Byte => 2,
      IADRSZ_Field_3_Byte => 3);

   subtype MMR_MREAD_Field is ATSAM3X8E.Bit;
   subtype MMR_DADR_Field is ATSAM3X8E.UInt7;

   --  Master Mode Register
   type MMR_Register is record
      --  unspecified
      Reserved_0_7   : ATSAM3X8E.Byte := 16#0#;
      --  Internal Device Address Size
      IADRSZ         : IADRSZ_Field := None;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2 := 16#0#;
      --  Master Read Direction
      MREAD          : MMR_MREAD_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Device Address
      DADR           : MMR_DADR_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MMR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      IADRSZ         at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      MREAD          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DADR           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ------------------
   -- SMR_Register --
   ------------------

   subtype SMR_SADR_Field is ATSAM3X8E.UInt7;

   --  Slave Mode Register
   type SMR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.Short := 16#0#;
      --  Slave Address
      SADR           : SMR_SADR_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SMR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      SADR           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   -------------------
   -- IADR_Register --
   -------------------

   subtype IADR_IADR_Field is ATSAM3X8E.UInt24;

   --  Internal Address Register
   type IADR_Register is record
      --  Internal Address
      IADR           : IADR_IADR_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IADR_Register use record
      IADR           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- CWGR_Register --
   -------------------

   subtype CWGR_CLDIV_Field is ATSAM3X8E.Byte;
   subtype CWGR_CHDIV_Field is ATSAM3X8E.Byte;
   subtype CWGR_CKDIV_Field is ATSAM3X8E.UInt3;

   --  Clock Waveform Generator Register
   type CWGR_Register is record
      --  Clock Low Divider
      CLDIV          : CWGR_CLDIV_Field := 16#0#;
      --  Clock High Divider
      CHDIV          : CWGR_CHDIV_Field := 16#0#;
      --  Clock Divider
      CKDIV          : CWGR_CKDIV_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CWGR_Register use record
      CLDIV          at 0 range 0 .. 7;
      CHDIV          at 0 range 8 .. 15;
      CKDIV          at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_SVREAD_Field is ATSAM3X8E.Bit;
   subtype SR_SVACC_Field is ATSAM3X8E.Bit;
   subtype SR_GACC_Field is ATSAM3X8E.Bit;
   subtype SR_OVRE_Field is ATSAM3X8E.Bit;
   subtype SR_NACK_Field is ATSAM3X8E.Bit;
   subtype SR_ARBLST_Field is ATSAM3X8E.Bit;
   subtype SR_SCLWS_Field is ATSAM3X8E.Bit;
   subtype SR_EOSACC_Field is ATSAM3X8E.Bit;
   subtype SR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype SR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype SR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype SR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. Transmission Completed (automatically set / reset)
      TXCOMP         : SR_TXCOMP_Field := 16#1#;
      --  Read-only. Receive Holding Register Ready (automatically set / reset)
      RXRDY          : SR_RXRDY_Field := 16#0#;
      --  Read-only. Transmit Holding Register Ready (automatically set /
      --  reset)
      TXRDY          : SR_TXRDY_Field := 16#0#;
      --  Read-only. Slave Read (automatically set / reset)
      SVREAD         : SR_SVREAD_Field := 16#1#;
      --  Read-only. Slave Access (automatically set / reset)
      SVACC          : SR_SVACC_Field := 16#0#;
      --  Read-only. General Call Access (clear on read)
      GACC           : SR_GACC_Field := 16#0#;
      --  Read-only. Overrun Error (clear on read)
      OVRE           : SR_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Not Acknowledged (clear on read)
      NACK           : SR_NACK_Field := 16#0#;
      --  Read-only. Arbitration Lost (clear on read)
      ARBLST         : SR_ARBLST_Field := 16#0#;
      --  Read-only. Clock Wait State (automatically set / reset)
      SCLWS          : SR_SCLWS_Field := 16#0#;
      --  Read-only. End Of Slave Access (clear on read)
      EOSACC         : SR_EOSACC_Field := 16#0#;
      --  Read-only. End of RX buffer
      ENDRX          : SR_ENDRX_Field := 16#1#;
      --  Read-only. End of TX buffer
      ENDTX          : SR_ENDTX_Field := 16#1#;
      --  Read-only. RX Buffer Full
      RXBUFF         : SR_RXBUFF_Field := 16#1#;
      --  Read-only. TX Buffer Empty
      TXBUFE         : SR_TXBUFE_Field := 16#1#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      TXCOMP         at 0 range 0 .. 0;
      RXRDY          at 0 range 1 .. 1;
      TXRDY          at 0 range 2 .. 2;
      SVREAD         at 0 range 3 .. 3;
      SVACC          at 0 range 4 .. 4;
      GACC           at 0 range 5 .. 5;
      OVRE           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      NACK           at 0 range 8 .. 8;
      ARBLST         at 0 range 9 .. 9;
      SCLWS          at 0 range 10 .. 10;
      EOSACC         at 0 range 11 .. 11;
      ENDRX          at 0 range 12 .. 12;
      ENDTX          at 0 range 13 .. 13;
      RXBUFF         at 0 range 14 .. 14;
      TXBUFE         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_SVACC_Field is ATSAM3X8E.Bit;
   subtype IER_GACC_Field is ATSAM3X8E.Bit;
   subtype IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype IER_NACK_Field is ATSAM3X8E.Bit;
   subtype IER_ARBLST_Field is ATSAM3X8E.Bit;
   subtype IER_SCL_WS_Field is ATSAM3X8E.Bit;
   subtype IER_EOSACC_Field is ATSAM3X8E.Bit;
   subtype IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IER_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype IER_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Transmission Completed Interrupt Enable
      TXCOMP         : IER_TXCOMP_Field := 16#0#;
      --  Write-only. Receive Holding Register Ready Interrupt Enable
      RXRDY          : IER_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Holding Register Ready Interrupt Enable
      TXRDY          : IER_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Slave Access Interrupt Enable
      SVACC          : IER_SVACC_Field := 16#0#;
      --  Write-only. General Call Access Interrupt Enable
      GACC           : IER_GACC_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : IER_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Not Acknowledge Interrupt Enable
      NACK           : IER_NACK_Field := 16#0#;
      --  Write-only. Arbitration Lost Interrupt Enable
      ARBLST         : IER_ARBLST_Field := 16#0#;
      --  Write-only. Clock Wait State Interrupt Enable
      SCL_WS         : IER_SCL_WS_Field := 16#0#;
      --  Write-only. End Of Slave Access Interrupt Enable
      EOSACC         : IER_EOSACC_Field := 16#0#;
      --  Write-only. End of Receive Buffer Interrupt Enable
      ENDRX          : IER_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Enable
      ENDTX          : IER_ENDTX_Field := 16#0#;
      --  Write-only. Receive Buffer Full Interrupt Enable
      RXBUFF         : IER_RXBUFF_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Enable
      TXBUFE         : IER_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      TXCOMP         at 0 range 0 .. 0;
      RXRDY          at 0 range 1 .. 1;
      TXRDY          at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      SVACC          at 0 range 4 .. 4;
      GACC           at 0 range 5 .. 5;
      OVRE           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      NACK           at 0 range 8 .. 8;
      ARBLST         at 0 range 9 .. 9;
      SCL_WS         at 0 range 10 .. 10;
      EOSACC         at 0 range 11 .. 11;
      ENDRX          at 0 range 12 .. 12;
      ENDTX          at 0 range 13 .. 13;
      RXBUFF         at 0 range 14 .. 14;
      TXBUFE         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_SVACC_Field is ATSAM3X8E.Bit;
   subtype IDR_GACC_Field is ATSAM3X8E.Bit;
   subtype IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_NACK_Field is ATSAM3X8E.Bit;
   subtype IDR_ARBLST_Field is ATSAM3X8E.Bit;
   subtype IDR_SCL_WS_Field is ATSAM3X8E.Bit;
   subtype IDR_EOSACC_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IDR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype IDR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Transmission Completed Interrupt Disable
      TXCOMP         : IDR_TXCOMP_Field := 16#0#;
      --  Write-only. Receive Holding Register Ready Interrupt Disable
      RXRDY          : IDR_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Holding Register Ready Interrupt Disable
      TXRDY          : IDR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Slave Access Interrupt Disable
      SVACC          : IDR_SVACC_Field := 16#0#;
      --  Write-only. General Call Access Interrupt Disable
      GACC           : IDR_GACC_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE           : IDR_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Not Acknowledge Interrupt Disable
      NACK           : IDR_NACK_Field := 16#0#;
      --  Write-only. Arbitration Lost Interrupt Disable
      ARBLST         : IDR_ARBLST_Field := 16#0#;
      --  Write-only. Clock Wait State Interrupt Disable
      SCL_WS         : IDR_SCL_WS_Field := 16#0#;
      --  Write-only. End Of Slave Access Interrupt Disable
      EOSACC         : IDR_EOSACC_Field := 16#0#;
      --  Write-only. End of Receive Buffer Interrupt Disable
      ENDRX          : IDR_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Disable
      ENDTX          : IDR_ENDTX_Field := 16#0#;
      --  Write-only. Receive Buffer Full Interrupt Disable
      RXBUFF         : IDR_RXBUFF_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Disable
      TXBUFE         : IDR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      TXCOMP         at 0 range 0 .. 0;
      RXRDY          at 0 range 1 .. 1;
      TXRDY          at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      SVACC          at 0 range 4 .. 4;
      GACC           at 0 range 5 .. 5;
      OVRE           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      NACK           at 0 range 8 .. 8;
      ARBLST         at 0 range 9 .. 9;
      SCL_WS         at 0 range 10 .. 10;
      EOSACC         at 0 range 11 .. 11;
      ENDRX          at 0 range 12 .. 12;
      ENDTX          at 0 range 13 .. 13;
      RXBUFF         at 0 range 14 .. 14;
      TXBUFE         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_SVACC_Field is ATSAM3X8E.Bit;
   subtype IMR_GACC_Field is ATSAM3X8E.Bit;
   subtype IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_NACK_Field is ATSAM3X8E.Bit;
   subtype IMR_ARBLST_Field is ATSAM3X8E.Bit;
   subtype IMR_SCL_WS_Field is ATSAM3X8E.Bit;
   subtype IMR_EOSACC_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IMR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype IMR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Transmission Completed Interrupt Mask
      TXCOMP         : IMR_TXCOMP_Field := 16#0#;
      --  Read-only. Receive Holding Register Ready Interrupt Mask
      RXRDY          : IMR_RXRDY_Field := 16#0#;
      --  Read-only. Transmit Holding Register Ready Interrupt Mask
      TXRDY          : IMR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit;
      --  Read-only. Slave Access Interrupt Mask
      SVACC          : IMR_SVACC_Field := 16#0#;
      --  Read-only. General Call Access Interrupt Mask
      GACC           : IMR_GACC_Field := 16#0#;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : IMR_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Not Acknowledge Interrupt Mask
      NACK           : IMR_NACK_Field := 16#0#;
      --  Read-only. Arbitration Lost Interrupt Mask
      ARBLST         : IMR_ARBLST_Field := 16#0#;
      --  Read-only. Clock Wait State Interrupt Mask
      SCL_WS         : IMR_SCL_WS_Field := 16#0#;
      --  Read-only. End Of Slave Access Interrupt Mask
      EOSACC         : IMR_EOSACC_Field := 16#0#;
      --  Read-only. End of Receive Buffer Interrupt Mask
      ENDRX          : IMR_ENDRX_Field := 16#0#;
      --  Read-only. End of Transmit Buffer Interrupt Mask
      ENDTX          : IMR_ENDTX_Field := 16#0#;
      --  Read-only. Receive Buffer Full Interrupt Mask
      RXBUFF         : IMR_RXBUFF_Field := 16#0#;
      --  Read-only. Transmit Buffer Empty Interrupt Mask
      TXBUFE         : IMR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      TXCOMP         at 0 range 0 .. 0;
      RXRDY          at 0 range 1 .. 1;
      TXRDY          at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      SVACC          at 0 range 4 .. 4;
      GACC           at 0 range 5 .. 5;
      OVRE           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      NACK           at 0 range 8 .. 8;
      ARBLST         at 0 range 9 .. 9;
      SCL_WS         at 0 range 10 .. 10;
      EOSACC         at 0 range 11 .. 11;
      ENDRX          at 0 range 12 .. 12;
      ENDTX          at 0 range 13 .. 13;
      RXBUFF         at 0 range 14 .. 14;
      TXBUFE         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- RHR_Register --
   ------------------

   subtype RHR_RXDATA_Field is ATSAM3X8E.Byte;

   --  Receive Holding Register
   type RHR_Register is record
      --  Read-only. Master or Slave Receive Holding Data
      RXDATA        : RHR_RXDATA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RHR_Register use record
      RXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- THR_Register --
   ------------------

   subtype THR_TXDATA_Field is ATSAM3X8E.Byte;

   --  Transmit Holding Register
   type THR_Register is record
      --  Write-only. Master or Slave Transmit Holding Data
      TXDATA        : THR_TXDATA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for THR_Register use record
      TXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- RCR_Register --
   ------------------

   subtype RCR_RXCTR_Field is ATSAM3X8E.Short;

   --  Receive Counter Register
   type RCR_Register is record
      --  Receive Counter Register
      RXCTR          : RCR_RXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      RXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- TCR_Register --
   ------------------

   subtype TCR_TXCTR_Field is ATSAM3X8E.Short;

   --  Transmit Counter Register
   type TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- RNCR_Register --
   -------------------

   subtype RNCR_RXNCTR_Field is ATSAM3X8E.Short;

   --  Receive Next Counter Register
   type RNCR_Register is record
      --  Receive Next Counter
      RXNCTR         : RNCR_RXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RNCR_Register use record
      RXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- TNCR_Register --
   -------------------

   subtype TNCR_TXNCTR_Field is ATSAM3X8E.Short;

   --  Transmit Next Counter Register
   type TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- PTCR_Register --
   -------------------

   subtype PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -------------------
   -- PTSR_Register --
   -------------------

   subtype PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : PTSR_RXTEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : PTSR_TXTEN_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PTSR_Register use record
      RXTEN         at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      TXTEN         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Two-wire Interface 0
   type TWI_Peripheral is record
      --  Control Register
      CR   : CR_Register;
      --  Master Mode Register
      MMR  : MMR_Register;
      --  Slave Mode Register
      SMR  : SMR_Register;
      --  Internal Address Register
      IADR : IADR_Register;
      --  Clock Waveform Generator Register
      CWGR : CWGR_Register;
      --  Status Register
      SR   : SR_Register;
      --  Interrupt Enable Register
      IER  : IER_Register;
      --  Interrupt Disable Register
      IDR  : IDR_Register;
      --  Interrupt Mask Register
      IMR  : IMR_Register;
      --  Receive Holding Register
      RHR  : RHR_Register;
      --  Transmit Holding Register
      THR  : THR_Register;
      --  Receive Pointer Register
      RPR  : ATSAM3X8E.Word;
      --  Receive Counter Register
      RCR  : RCR_Register;
      --  Transmit Pointer Register
      TPR  : ATSAM3X8E.Word;
      --  Transmit Counter Register
      TCR  : TCR_Register;
      --  Receive Next Pointer Register
      RNPR : ATSAM3X8E.Word;
      --  Receive Next Counter Register
      RNCR : RNCR_Register;
      --  Transmit Next Pointer Register
      TNPR : ATSAM3X8E.Word;
      --  Transmit Next Counter Register
      TNCR : TNCR_Register;
      --  Transfer Control Register
      PTCR : PTCR_Register;
      --  Transfer Status Register
      PTSR : PTSR_Register;
   end record
     with Volatile;

   for TWI_Peripheral use record
      CR   at 0 range 0 .. 31;
      MMR  at 4 range 0 .. 31;
      SMR  at 8 range 0 .. 31;
      IADR at 12 range 0 .. 31;
      CWGR at 16 range 0 .. 31;
      SR   at 32 range 0 .. 31;
      IER  at 36 range 0 .. 31;
      IDR  at 40 range 0 .. 31;
      IMR  at 44 range 0 .. 31;
      RHR  at 48 range 0 .. 31;
      THR  at 52 range 0 .. 31;
      RPR  at 256 range 0 .. 31;
      RCR  at 260 range 0 .. 31;
      TPR  at 264 range 0 .. 31;
      TCR  at 268 range 0 .. 31;
      RNPR at 272 range 0 .. 31;
      RNCR at 276 range 0 .. 31;
      TNPR at 280 range 0 .. 31;
      TNCR at 284 range 0 .. 31;
      PTCR at 288 range 0 .. 31;
      PTSR at 292 range 0 .. 31;
   end record;

   --  Two-wire Interface 0
   TWI0_Periph : aliased TWI_Peripheral
     with Import, Address => TWI0_Base;

   --  Two-wire Interface 1
   TWI1_Periph : aliased TWI_Peripheral
     with Import, Address => TWI1_Base;

end ATSAM3X8E.TWI;
