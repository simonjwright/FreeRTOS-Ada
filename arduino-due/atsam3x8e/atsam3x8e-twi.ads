pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package ATSAM3X8E.TWI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TWI0_CR_START_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_STOP_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_MSEN_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_MSDIS_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_SVEN_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_SVDIS_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_QUICK_Field is ATSAM3X8E.Bit;
   subtype TWI0_CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type TWI0_CR_Register is record
      --  Write-only. Send a START Condition
      START         : TWI0_CR_START_Field := 16#0#;
      --  Write-only. Send a STOP Condition
      STOP          : TWI0_CR_STOP_Field := 16#0#;
      --  Write-only. TWI Master Mode Enabled
      MSEN          : TWI0_CR_MSEN_Field := 16#0#;
      --  Write-only. TWI Master Mode Disabled
      MSDIS         : TWI0_CR_MSDIS_Field := 16#0#;
      --  Write-only. TWI Slave Mode Enabled
      SVEN          : TWI0_CR_SVEN_Field := 16#0#;
      --  Write-only. TWI Slave Mode Disabled
      SVDIS         : TWI0_CR_SVDIS_Field := 16#0#;
      --  Write-only. SMBUS Quick Command
      QUICK         : TWI0_CR_QUICK_Field := 16#0#;
      --  Write-only. Software Reset
      SWRST         : TWI0_CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_CR_Register use record
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

   --  Internal Device Address Size
   type MMR_IADRSZ_Field is
     (--  No internal device address
      None,
      --  One-byte internal device address
      Val_1_Byte,
      --  Two-byte internal device address
      Val_2_Byte,
      --  Three-byte internal device address
      Val_3_Byte)
     with Size => 2;
   for MMR_IADRSZ_Field use
     (None => 0,
      Val_1_Byte => 1,
      Val_2_Byte => 2,
      Val_3_Byte => 3);

   subtype TWI0_MMR_MREAD_Field is ATSAM3X8E.Bit;
   subtype TWI0_MMR_DADR_Field is ATSAM3X8E.UInt7;

   --  Master Mode Register
   type TWI0_MMR_Register is record
      --  unspecified
      Reserved_0_7   : ATSAM3X8E.Byte := 16#0#;
      --  Internal Device Address Size
      IADRSZ         : MMR_IADRSZ_Field := ATSAM3X8E.TWI.None;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2 := 16#0#;
      --  Master Read Direction
      MREAD          : TWI0_MMR_MREAD_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Device Address
      DADR           : TWI0_MMR_DADR_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_MMR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      IADRSZ         at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      MREAD          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DADR           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TWI0_SMR_SADR_Field is ATSAM3X8E.UInt7;

   --  Slave Mode Register
   type TWI0_SMR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.UInt16 := 16#0#;
      --  Slave Address
      SADR           : TWI0_SMR_SADR_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_SMR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      SADR           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TWI0_IADR_IADR_Field is ATSAM3X8E.UInt24;

   --  Internal Address Register
   type TWI0_IADR_Register is record
      --  Internal Address
      IADR           : TWI0_IADR_IADR_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_IADR_Register use record
      IADR           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TWI0_CWGR_CLDIV_Field is ATSAM3X8E.Byte;
   subtype TWI0_CWGR_CHDIV_Field is ATSAM3X8E.Byte;
   subtype TWI0_CWGR_CKDIV_Field is ATSAM3X8E.UInt3;

   --  Clock Waveform Generator Register
   type TWI0_CWGR_Register is record
      --  Clock Low Divider
      CLDIV          : TWI0_CWGR_CLDIV_Field := 16#0#;
      --  Clock High Divider
      CHDIV          : TWI0_CWGR_CHDIV_Field := 16#0#;
      --  Clock Divider
      CKDIV          : TWI0_CWGR_CKDIV_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_CWGR_Register use record
      CLDIV          at 0 range 0 .. 7;
      CHDIV          at 0 range 8 .. 15;
      CKDIV          at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype TWI0_SR_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_SVREAD_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_SVACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_GACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_OVRE_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_NACK_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_ARBLST_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_SCLWS_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_EOSACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype TWI0_SR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Status Register
   type TWI0_SR_Register is record
      --  Read-only. Transmission Completed (automatically set / reset)
      TXCOMP         : TWI0_SR_TXCOMP_Field;
      --  Read-only. Receive Holding Register Ready (automatically set / reset)
      RXRDY          : TWI0_SR_RXRDY_Field;
      --  Read-only. Transmit Holding Register Ready (automatically set /
      --  reset)
      TXRDY          : TWI0_SR_TXRDY_Field;
      --  Read-only. Slave Read (automatically set / reset)
      SVREAD         : TWI0_SR_SVREAD_Field;
      --  Read-only. Slave Access (automatically set / reset)
      SVACC          : TWI0_SR_SVACC_Field;
      --  Read-only. General Call Access (clear on read)
      GACC           : TWI0_SR_GACC_Field;
      --  Read-only. Overrun Error (clear on read)
      OVRE           : TWI0_SR_OVRE_Field;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Not Acknowledged (clear on read)
      NACK           : TWI0_SR_NACK_Field;
      --  Read-only. Arbitration Lost (clear on read)
      ARBLST         : TWI0_SR_ARBLST_Field;
      --  Read-only. Clock Wait State (automatically set / reset)
      SCLWS          : TWI0_SR_SCLWS_Field;
      --  Read-only. End Of Slave Access (clear on read)
      EOSACC         : TWI0_SR_EOSACC_Field;
      --  Read-only. End of RX buffer
      ENDRX          : TWI0_SR_ENDRX_Field;
      --  Read-only. End of TX buffer
      ENDTX          : TWI0_SR_ENDTX_Field;
      --  Read-only. RX Buffer Full
      RXBUFF         : TWI0_SR_RXBUFF_Field;
      --  Read-only. TX Buffer Empty
      TXBUFE         : TWI0_SR_TXBUFE_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_SR_Register use record
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

   subtype TWI0_IER_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_SVACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_GACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_NACK_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_ARBLST_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_SCL_WS_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_EOSACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype TWI0_IER_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type TWI0_IER_Register is record
      --  Write-only. Transmission Completed Interrupt Enable
      TXCOMP         : TWI0_IER_TXCOMP_Field := 16#0#;
      --  Write-only. Receive Holding Register Ready Interrupt Enable
      RXRDY          : TWI0_IER_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Holding Register Ready Interrupt Enable
      TXRDY          : TWI0_IER_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Slave Access Interrupt Enable
      SVACC          : TWI0_IER_SVACC_Field := 16#0#;
      --  Write-only. General Call Access Interrupt Enable
      GACC           : TWI0_IER_GACC_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : TWI0_IER_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Not Acknowledge Interrupt Enable
      NACK           : TWI0_IER_NACK_Field := 16#0#;
      --  Write-only. Arbitration Lost Interrupt Enable
      ARBLST         : TWI0_IER_ARBLST_Field := 16#0#;
      --  Write-only. Clock Wait State Interrupt Enable
      SCL_WS         : TWI0_IER_SCL_WS_Field := 16#0#;
      --  Write-only. End Of Slave Access Interrupt Enable
      EOSACC         : TWI0_IER_EOSACC_Field := 16#0#;
      --  Write-only. End of Receive Buffer Interrupt Enable
      ENDRX          : TWI0_IER_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Enable
      ENDTX          : TWI0_IER_ENDTX_Field := 16#0#;
      --  Write-only. Receive Buffer Full Interrupt Enable
      RXBUFF         : TWI0_IER_RXBUFF_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Enable
      TXBUFE         : TWI0_IER_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_IER_Register use record
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

   subtype TWI0_IDR_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_SVACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_GACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_NACK_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_ARBLST_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_SCL_WS_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_EOSACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype TWI0_IDR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type TWI0_IDR_Register is record
      --  Write-only. Transmission Completed Interrupt Disable
      TXCOMP         : TWI0_IDR_TXCOMP_Field := 16#0#;
      --  Write-only. Receive Holding Register Ready Interrupt Disable
      RXRDY          : TWI0_IDR_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Holding Register Ready Interrupt Disable
      TXRDY          : TWI0_IDR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Slave Access Interrupt Disable
      SVACC          : TWI0_IDR_SVACC_Field := 16#0#;
      --  Write-only. General Call Access Interrupt Disable
      GACC           : TWI0_IDR_GACC_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE           : TWI0_IDR_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Not Acknowledge Interrupt Disable
      NACK           : TWI0_IDR_NACK_Field := 16#0#;
      --  Write-only. Arbitration Lost Interrupt Disable
      ARBLST         : TWI0_IDR_ARBLST_Field := 16#0#;
      --  Write-only. Clock Wait State Interrupt Disable
      SCL_WS         : TWI0_IDR_SCL_WS_Field := 16#0#;
      --  Write-only. End Of Slave Access Interrupt Disable
      EOSACC         : TWI0_IDR_EOSACC_Field := 16#0#;
      --  Write-only. End of Receive Buffer Interrupt Disable
      ENDRX          : TWI0_IDR_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Disable
      ENDTX          : TWI0_IDR_ENDTX_Field := 16#0#;
      --  Write-only. Receive Buffer Full Interrupt Disable
      RXBUFF         : TWI0_IDR_RXBUFF_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Disable
      TXBUFE         : TWI0_IDR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_IDR_Register use record
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

   subtype TWI0_IMR_TXCOMP_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_SVACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_GACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_NACK_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_ARBLST_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_SCL_WS_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_EOSACC_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype TWI0_IMR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type TWI0_IMR_Register is record
      --  Read-only. Transmission Completed Interrupt Mask
      TXCOMP         : TWI0_IMR_TXCOMP_Field;
      --  Read-only. Receive Holding Register Ready Interrupt Mask
      RXRDY          : TWI0_IMR_RXRDY_Field;
      --  Read-only. Transmit Holding Register Ready Interrupt Mask
      TXRDY          : TWI0_IMR_TXRDY_Field;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit;
      --  Read-only. Slave Access Interrupt Mask
      SVACC          : TWI0_IMR_SVACC_Field;
      --  Read-only. General Call Access Interrupt Mask
      GACC           : TWI0_IMR_GACC_Field;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : TWI0_IMR_OVRE_Field;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Not Acknowledge Interrupt Mask
      NACK           : TWI0_IMR_NACK_Field;
      --  Read-only. Arbitration Lost Interrupt Mask
      ARBLST         : TWI0_IMR_ARBLST_Field;
      --  Read-only. Clock Wait State Interrupt Mask
      SCL_WS         : TWI0_IMR_SCL_WS_Field;
      --  Read-only. End Of Slave Access Interrupt Mask
      EOSACC         : TWI0_IMR_EOSACC_Field;
      --  Read-only. End of Receive Buffer Interrupt Mask
      ENDRX          : TWI0_IMR_ENDRX_Field;
      --  Read-only. End of Transmit Buffer Interrupt Mask
      ENDTX          : TWI0_IMR_ENDTX_Field;
      --  Read-only. Receive Buffer Full Interrupt Mask
      RXBUFF         : TWI0_IMR_RXBUFF_Field;
      --  Read-only. Transmit Buffer Empty Interrupt Mask
      TXBUFE         : TWI0_IMR_TXBUFE_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_IMR_Register use record
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

   subtype TWI0_RHR_RXDATA_Field is ATSAM3X8E.Byte;

   --  Receive Holding Register
   type TWI0_RHR_Register is record
      --  Read-only. Master or Slave Receive Holding Data
      RXDATA        : TWI0_RHR_RXDATA_Field;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_RHR_Register use record
      RXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TWI0_THR_TXDATA_Field is ATSAM3X8E.Byte;

   --  Transmit Holding Register
   type TWI0_THR_Register is record
      --  Write-only. Master or Slave Transmit Holding Data
      TXDATA        : TWI0_THR_TXDATA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_THR_Register use record
      TXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TWI0_RCR_RXCTR_Field is ATSAM3X8E.UInt16;

   --  Receive Counter Register
   type TWI0_RCR_Register is record
      --  Receive Counter Register
      RXCTR          : TWI0_RCR_RXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_RCR_Register use record
      RXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TWI0_TCR_TXCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Counter Register
   type TWI0_TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : TWI0_TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TWI0_RNCR_RXNCTR_Field is ATSAM3X8E.UInt16;

   --  Receive Next Counter Register
   type TWI0_RNCR_Register is record
      --  Receive Next Counter
      RXNCTR         : TWI0_RNCR_RXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_RNCR_Register use record
      RXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TWI0_TNCR_TXNCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Next Counter Register
   type TWI0_TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : TWI0_TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TWI0_PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype TWI0_PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype TWI0_PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype TWI0_PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type TWI0_PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : TWI0_PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : TWI0_PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : TWI0_PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : TWI0_PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype TWI0_PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype TWI0_PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type TWI0_PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : TWI0_PTSR_RXTEN_Field;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : TWI0_PTSR_TXTEN_Field;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWI0_PTSR_Register use record
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
      CR   : aliased TWI0_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Master Mode Register
      MMR  : aliased TWI0_MMR_Register;
      pragma Volatile_Full_Access (MMR);
      --  Slave Mode Register
      SMR  : aliased TWI0_SMR_Register;
      pragma Volatile_Full_Access (SMR);
      --  Internal Address Register
      IADR : aliased TWI0_IADR_Register;
      pragma Volatile_Full_Access (IADR);
      --  Clock Waveform Generator Register
      CWGR : aliased TWI0_CWGR_Register;
      pragma Volatile_Full_Access (CWGR);
      --  Status Register
      SR   : aliased TWI0_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Interrupt Enable Register
      IER  : aliased TWI0_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR  : aliased TWI0_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR  : aliased TWI0_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Receive Holding Register
      RHR  : aliased TWI0_RHR_Register;
      pragma Volatile_Full_Access (RHR);
      --  Transmit Holding Register
      THR  : aliased TWI0_THR_Register;
      pragma Volatile_Full_Access (THR);
      --  Receive Pointer Register
      RPR  : aliased ATSAM3X8E.UInt32;
      --  Receive Counter Register
      RCR  : aliased TWI0_RCR_Register;
      pragma Volatile_Full_Access (RCR);
      --  Transmit Pointer Register
      TPR  : aliased ATSAM3X8E.UInt32;
      --  Transmit Counter Register
      TCR  : aliased TWI0_TCR_Register;
      pragma Volatile_Full_Access (TCR);
      --  Receive Next Pointer Register
      RNPR : aliased ATSAM3X8E.UInt32;
      --  Receive Next Counter Register
      RNCR : aliased TWI0_RNCR_Register;
      pragma Volatile_Full_Access (RNCR);
      --  Transmit Next Pointer Register
      TNPR : aliased ATSAM3X8E.UInt32;
      --  Transmit Next Counter Register
      TNCR : aliased TWI0_TNCR_Register;
      pragma Volatile_Full_Access (TNCR);
      --  Transfer Control Register
      PTCR : aliased TWI0_PTCR_Register;
      pragma Volatile_Full_Access (PTCR);
      --  Transfer Status Register
      PTSR : aliased TWI0_PTSR_Register;
      pragma Volatile_Full_Access (PTSR);
   end record
     with Volatile;

   for TWI_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      MMR  at 16#4# range 0 .. 31;
      SMR  at 16#8# range 0 .. 31;
      IADR at 16#C# range 0 .. 31;
      CWGR at 16#10# range 0 .. 31;
      SR   at 16#20# range 0 .. 31;
      IER  at 16#24# range 0 .. 31;
      IDR  at 16#28# range 0 .. 31;
      IMR  at 16#2C# range 0 .. 31;
      RHR  at 16#30# range 0 .. 31;
      THR  at 16#34# range 0 .. 31;
      RPR  at 16#100# range 0 .. 31;
      RCR  at 16#104# range 0 .. 31;
      TPR  at 16#108# range 0 .. 31;
      TCR  at 16#10C# range 0 .. 31;
      RNPR at 16#110# range 0 .. 31;
      RNCR at 16#114# range 0 .. 31;
      TNPR at 16#118# range 0 .. 31;
      TNCR at 16#11C# range 0 .. 31;
      PTCR at 16#120# range 0 .. 31;
      PTSR at 16#124# range 0 .. 31;
   end record;

   --  Two-wire Interface 0
   TWI0_Periph : aliased TWI_Peripheral
     with Import, Address => TWI0_Base;

   --  Two-wire Interface 1
   TWI1_Periph : aliased TWI_Peripheral
     with Import, Address => TWI1_Base;

end ATSAM3X8E.TWI;
