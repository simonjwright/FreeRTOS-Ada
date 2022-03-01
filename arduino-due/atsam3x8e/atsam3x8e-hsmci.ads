pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  High Speed MultiMedia Card Interface
package ATSAM3X8E.HSMCI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype HSMCI_CR_MCIEN_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CR_MCIDIS_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CR_PWSEN_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CR_PWSDIS_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type HSMCI_CR_Register is record
      --  Write-only. Multi-Media Interface Enable
      MCIEN         : HSMCI_CR_MCIEN_Field := 16#0#;
      --  Write-only. Multi-Media Interface Disable
      MCIDIS        : HSMCI_CR_MCIDIS_Field := 16#0#;
      --  Write-only. Power Save Mode Enable
      PWSEN         : HSMCI_CR_PWSEN_Field := 16#0#;
      --  Write-only. Power Save Mode Disable
      PWSDIS        : HSMCI_CR_PWSDIS_Field := 16#0#;
      --  unspecified
      Reserved_4_6  : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Software Reset
      SWRST         : HSMCI_CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_CR_Register use record
      MCIEN         at 0 range 0 .. 0;
      MCIDIS        at 0 range 1 .. 1;
      PWSEN         at 0 range 2 .. 2;
      PWSDIS        at 0 range 3 .. 3;
      Reserved_4_6  at 0 range 4 .. 6;
      SWRST         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype HSMCI_MR_CLKDIV_Field is ATSAM3X8E.Byte;
   subtype HSMCI_MR_PWSDIV_Field is ATSAM3X8E.UInt3;
   subtype HSMCI_MR_RDPROOF_Field is ATSAM3X8E.Bit;
   subtype HSMCI_MR_WRPROOF_Field is ATSAM3X8E.Bit;
   subtype HSMCI_MR_FBYTE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_MR_PADV_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type HSMCI_MR_Register is record
      --  Clock Divider
      CLKDIV         : HSMCI_MR_CLKDIV_Field := 16#0#;
      --  Power Saving Divider
      PWSDIV         : HSMCI_MR_PWSDIV_Field := 16#0#;
      RDPROOF        : HSMCI_MR_RDPROOF_Field := 16#0#;
      WRPROOF        : HSMCI_MR_WRPROOF_Field := 16#0#;
      --  Force Byte Transfer
      FBYTE          : HSMCI_MR_FBYTE_Field := 16#0#;
      --  Padding Value
      PADV           : HSMCI_MR_PADV_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_MR_Register use record
      CLKDIV         at 0 range 0 .. 7;
      PWSDIV         at 0 range 8 .. 10;
      RDPROOF        at 0 range 11 .. 11;
      WRPROOF        at 0 range 12 .. 12;
      FBYTE          at 0 range 13 .. 13;
      PADV           at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype HSMCI_DTOR_DTOCYC_Field is ATSAM3X8E.UInt4;

   --  Data Timeout Multiplier
   type DTOR_DTOMUL_Field is
     (--  DTOCYC
      Val_1,
      --  DTOCYC x 16
      Val_16,
      --  DTOCYC x 128
      Val_128,
      --  DTOCYC x 256
      Val_256,
      --  DTOCYC x 1024
      Val_1024,
      --  DTOCYC x 4096
      Val_4096,
      --  DTOCYC x 65536
      Val_65536,
      --  DTOCYC x 1048576
      Val_1048576)
     with Size => 3;
   for DTOR_DTOMUL_Field use
     (Val_1 => 0,
      Val_16 => 1,
      Val_128 => 2,
      Val_256 => 3,
      Val_1024 => 4,
      Val_4096 => 5,
      Val_65536 => 6,
      Val_1048576 => 7);

   --  Data Timeout Register
   type HSMCI_DTOR_Register is record
      --  Data Timeout Cycle Number
      DTOCYC        : HSMCI_DTOR_DTOCYC_Field := 16#0#;
      --  Data Timeout Multiplier
      DTOMUL        : DTOR_DTOMUL_Field := ATSAM3X8E.HSMCI.Val_1;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_DTOR_Register use record
      DTOCYC        at 0 range 0 .. 3;
      DTOMUL        at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  SDCard/SDIO Slot
   type SDCR_SDCSEL_Field is
     (--  Slot A is selected.
      SLOTA,
      --  SDCARD/SDIO Slot B selected
      SLOTB,
      --  -
      SLOTC,
      --  -
      SLOTD)
     with Size => 2;
   for SDCR_SDCSEL_Field use
     (SLOTA => 0,
      SLOTB => 1,
      SLOTC => 2,
      SLOTD => 3);

   --  SDCard/SDIO Bus Width
   type SDCR_SDCBUS_Field is
     (--  1 bit
      Val_1,
      --  4 bit
      Val_4,
      --  8 bit
      Val_8)
     with Size => 2;
   for SDCR_SDCBUS_Field use
     (Val_1 => 0,
      Val_4 => 2,
      Val_8 => 3);

   --  SD/SDIO Card Register
   type HSMCI_SDCR_Register is record
      --  SDCard/SDIO Slot
      SDCSEL        : SDCR_SDCSEL_Field := ATSAM3X8E.HSMCI.SLOTA;
      --  unspecified
      Reserved_2_5  : ATSAM3X8E.UInt4 := 16#0#;
      --  SDCard/SDIO Bus Width
      SDCBUS        : SDCR_SDCBUS_Field := ATSAM3X8E.HSMCI.Val_1;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_SDCR_Register use record
      SDCSEL        at 0 range 0 .. 1;
      Reserved_2_5  at 0 range 2 .. 5;
      SDCBUS        at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype HSMCI_CMDR_CMDNB_Field is ATSAM3X8E.UInt6;

   --  Response Type
   type CMDR_RSPTYP_Field is
     (--  No response.
      NORESP,
      --  48-bit response.
      Val_48_BIT,
      --  136-bit response.
      Val_136_BIT,
      --  R1b response type
      R1B)
     with Size => 2;
   for CMDR_RSPTYP_Field use
     (NORESP => 0,
      Val_48_BIT => 1,
      Val_136_BIT => 2,
      R1B => 3);

   --  Special Command
   type CMDR_SPCMD_Field is
     (--  Not a special CMD.
      STD,
      --  Initialization CMD: 74 clock cycles for initialization sequence.
      INIT,
      --  Synchronized CMD: Wait for the end of the current data block transfer
--  before sending the pending command.
      SYNC,
      --  CE-ATA Completion Signal disable Command. The host cancels the ability for
--  the device to return a command completion signal on the command line.
      CE_ATA,
      --  Interrupt command: Corresponds to the Interrupt Mode (CMD40).
      IT_CMD,
      --  Interrupt response: Corresponds to the Interrupt Mode (CMD40).
      IT_RESP,
      --  Boot Operation Request. Start a boot operation mode, the host processor can
--  read boot data from the MMC device directly.
      BOR,
      --  End Boot Operation. This command allows the host processor to terminate the
--  boot operation mode.
      EBO)
     with Size => 3;
   for CMDR_SPCMD_Field use
     (STD => 0,
      INIT => 1,
      SYNC => 2,
      CE_ATA => 3,
      IT_CMD => 4,
      IT_RESP => 5,
      BOR => 6,
      EBO => 7);

   --  Open Drain Command
   type CMDR_OPDCMD_Field is
     (--  Push pull command.
      PUSHPULL,
      --  Open drain command.
      OPENDRAIN)
     with Size => 1;
   for CMDR_OPDCMD_Field use
     (PUSHPULL => 0,
      OPENDRAIN => 1);

   --  Max Latency for Command to Response
   type CMDR_MAXLAT_Field is
     (--  5-cycle max latency.
      Val_5,
      --  64-cycle max latency.
      Val_64)
     with Size => 1;
   for CMDR_MAXLAT_Field use
     (Val_5 => 0,
      Val_64 => 1);

   --  Transfer Command
   type CMDR_TRCMD_Field is
     (--  No data transfer
      NO_DATA,
      --  Start data transfer
      START_DATA,
      --  Stop data transfer
      STOP_DATA)
     with Size => 2;
   for CMDR_TRCMD_Field use
     (NO_DATA => 0,
      START_DATA => 1,
      STOP_DATA => 2);

   --  Transfer Direction
   type CMDR_TRDIR_Field is
     (--  Write.
      WRITE,
      --  Read.
      READ)
     with Size => 1;
   for CMDR_TRDIR_Field use
     (WRITE => 0,
      READ => 1);

   --  Transfer Type
   type CMDR_TRTYP_Field is
     (--  MMC/SDCard Single Block
      SINGLE,
      --  MMC/SDCard Multiple Block
      MULTIPLE,
      --  MMC Stream
      STREAM,
      --  SDIO Byte
      BYTE,
      --  SDIO Block
      BLOCK)
     with Size => 3;
   for CMDR_TRTYP_Field use
     (SINGLE => 0,
      MULTIPLE => 1,
      STREAM => 2,
      BYTE => 4,
      BLOCK => 5);

   --  SDIO Special Command
   type CMDR_IOSPCMD_Field is
     (--  Not an SDIO Special Command
      STD,
      --  SDIO Suspend Command
      SUSPEND,
      --  SDIO Resume Command
      RESUME)
     with Size => 2;
   for CMDR_IOSPCMD_Field use
     (STD => 0,
      SUSPEND => 1,
      RESUME => 2);

   --  ATA with Command Completion Signal
   type CMDR_ATACS_Field is
     (--  Normal operation mode.
      NORMAL,
      --  This bit indicates that a completion signal is expected within a programmed
--  amount of time (HSMCI_CSTOR).
      COMPLETION)
     with Size => 1;
   for CMDR_ATACS_Field use
     (NORMAL => 0,
      COMPLETION => 1);

   subtype HSMCI_CMDR_BOOT_ACK_Field is ATSAM3X8E.Bit;

   --  Command Register
   type HSMCI_CMDR_Register is record
      --  Write-only. Command Number
      CMDNB          : HSMCI_CMDR_CMDNB_Field := 16#0#;
      --  Write-only. Response Type
      RSPTYP         : CMDR_RSPTYP_Field := ATSAM3X8E.HSMCI.NORESP;
      --  Write-only. Special Command
      SPCMD          : CMDR_SPCMD_Field := ATSAM3X8E.HSMCI.STD;
      --  Write-only. Open Drain Command
      OPDCMD         : CMDR_OPDCMD_Field := ATSAM3X8E.HSMCI.PUSHPULL;
      --  Write-only. Max Latency for Command to Response
      MAXLAT         : CMDR_MAXLAT_Field := ATSAM3X8E.HSMCI.Val_5;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Transfer Command
      TRCMD          : CMDR_TRCMD_Field := ATSAM3X8E.HSMCI.NO_DATA;
      --  Write-only. Transfer Direction
      TRDIR          : CMDR_TRDIR_Field := ATSAM3X8E.HSMCI.WRITE;
      --  Write-only. Transfer Type
      TRTYP          : CMDR_TRTYP_Field := ATSAM3X8E.HSMCI.SINGLE;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. SDIO Special Command
      IOSPCMD        : CMDR_IOSPCMD_Field := ATSAM3X8E.HSMCI.STD;
      --  Write-only. ATA with Command Completion Signal
      ATACS          : CMDR_ATACS_Field := ATSAM3X8E.HSMCI.NORMAL;
      --  Write-only. Boot Operation Acknowledge.
      BOOT_ACK       : HSMCI_CMDR_BOOT_ACK_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : ATSAM3X8E.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_CMDR_Register use record
      CMDNB          at 0 range 0 .. 5;
      RSPTYP         at 0 range 6 .. 7;
      SPCMD          at 0 range 8 .. 10;
      OPDCMD         at 0 range 11 .. 11;
      MAXLAT         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TRCMD          at 0 range 16 .. 17;
      TRDIR          at 0 range 18 .. 18;
      TRTYP          at 0 range 19 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      IOSPCMD        at 0 range 24 .. 25;
      ATACS          at 0 range 26 .. 26;
      BOOT_ACK       at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  MMC/SDIO Block Count - SDIO Byte Count
   type BLKR_BCNT_Field is
     (--  MMC/SDCARD Multiple BlockFrom 1 to 65635: Value 0 corresponds to an
--  infinite block transfer.
      MULTIPLE,
      --  SDIO ByteFrom 1 to 512 bytes: Value 0 corresponds to a 512-byte
--  transfer.Values from 0x200 to 0xFFFF are forbidden.
      BYTE,
      --  SDIO BlockFrom 1 to 511 blocks: Value 0 corresponds to an infinite block
--  transfer.Values from 0x200 to 0xFFFF are forbidden.
      BLOCK)
     with Size => 16;
   for BLKR_BCNT_Field use
     (MULTIPLE => 0,
      BYTE => 4,
      BLOCK => 5);

   subtype HSMCI_BLKR_BLKLEN_Field is ATSAM3X8E.UInt16;

   --  Block Register
   type HSMCI_BLKR_Register is record
      --  MMC/SDIO Block Count - SDIO Byte Count
      BCNT   : BLKR_BCNT_Field := ATSAM3X8E.HSMCI.MULTIPLE;
      --  Data Block Length
      BLKLEN : HSMCI_BLKR_BLKLEN_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_BLKR_Register use record
      BCNT   at 0 range 0 .. 15;
      BLKLEN at 0 range 16 .. 31;
   end record;

   subtype HSMCI_CSTOR_CSTOCYC_Field is ATSAM3X8E.UInt4;

   --  Completion Signal Timeout Multiplier
   type CSTOR_CSTOMUL_Field is
     (--  CSTOCYC x 1
      Val_1,
      --  CSTOCYC x 16
      Val_16,
      --  CSTOCYC x 128
      Val_128,
      --  CSTOCYC x 256
      Val_256,
      --  CSTOCYC x 1024
      Val_1024,
      --  CSTOCYC x 4096
      Val_4096,
      --  CSTOCYC x 65536
      Val_65536,
      --  CSTOCYC x 1048576
      Val_1048576)
     with Size => 3;
   for CSTOR_CSTOMUL_Field use
     (Val_1 => 0,
      Val_16 => 1,
      Val_128 => 2,
      Val_256 => 3,
      Val_1024 => 4,
      Val_4096 => 5,
      Val_65536 => 6,
      Val_1048576 => 7);

   --  Completion Signal Timeout Register
   type HSMCI_CSTOR_Register is record
      --  Completion Signal Timeout Cycle Number
      CSTOCYC       : HSMCI_CSTOR_CSTOCYC_Field := 16#0#;
      --  Completion Signal Timeout Multiplier
      CSTOMUL       : CSTOR_CSTOMUL_Field := ATSAM3X8E.HSMCI.Val_1;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_CSTOR_Register use record
      CSTOCYC       at 0 range 0 .. 3;
      CSTOMUL       at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Response Register
   subtype HSMCI_SR_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_BLKE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_DTIP_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_CSRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_RINDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_RDIRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_RCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_RENDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_RTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_DCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_DTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_CSTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_DMADONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_OVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_SR_UNRE_Field is ATSAM3X8E.Bit;

   --  Status Register
   type HSMCI_SR_Register is record
      --  Read-only. Command Ready
      CMDRDY          : HSMCI_SR_CMDRDY_Field;
      --  Read-only. Receiver Ready
      RXRDY           : HSMCI_SR_RXRDY_Field;
      --  Read-only. Transmit Ready
      TXRDY           : HSMCI_SR_TXRDY_Field;
      --  Read-only. Data Block Ended
      BLKE            : HSMCI_SR_BLKE_Field;
      --  Read-only. Data Transfer in Progress
      DTIP            : HSMCI_SR_DTIP_Field;
      --  Read-only. HSMCI Not Busy
      NOTBUSY         : HSMCI_SR_NOTBUSY_Field;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2;
      --  Read-only.
      SDIOIRQforSlotA : HSMCI_SR_SDIOIRQforSlotA_Field;
      --  Read-only.
      SDIOIRQforSlotB : HSMCI_SR_SDIOIRQforSlotB_Field;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2;
      --  Read-only. SDIO Read Wait Operation Status
      SDIOWAIT        : HSMCI_SR_SDIOWAIT_Field;
      --  Read-only. CE-ATA Completion Signal Received
      CSRCV           : HSMCI_SR_CSRCV_Field;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2;
      --  Read-only. Response Index Error
      RINDE           : HSMCI_SR_RINDE_Field;
      --  Read-only. Response Direction Error
      RDIRE           : HSMCI_SR_RDIRE_Field;
      --  Read-only. Response CRC Error
      RCRCE           : HSMCI_SR_RCRCE_Field;
      --  Read-only. Response End Bit Error
      RENDE           : HSMCI_SR_RENDE_Field;
      --  Read-only. Response Time-out Error
      RTOE            : HSMCI_SR_RTOE_Field;
      --  Read-only. Data CRC Error
      DCRCE           : HSMCI_SR_DCRCE_Field;
      --  Read-only. Data Time-out Error
      DTOE            : HSMCI_SR_DTOE_Field;
      --  Read-only. Completion Signal Time-out Error
      CSTOE           : HSMCI_SR_CSTOE_Field;
      --  Read-only. DMA Block Overrun Error
      BLKOVRE         : HSMCI_SR_BLKOVRE_Field;
      --  Read-only. DMA Transfer done
      DMADONE         : HSMCI_SR_DMADONE_Field;
      --  Read-only. FIFO empty flag
      FIFOEMPTY       : HSMCI_SR_FIFOEMPTY_Field;
      --  Read-only. Transfer Done flag
      XFRDONE         : HSMCI_SR_XFRDONE_Field;
      --  Read-only. Boot Operation Acknowledge Received
      ACKRCV          : HSMCI_SR_ACKRCV_Field;
      --  Read-only. Boot Operation Acknowledge Error
      ACKRCVE         : HSMCI_SR_ACKRCVE_Field;
      --  Read-only. Overrun
      OVRE            : HSMCI_SR_OVRE_Field;
      --  Read-only. Underrun
      UNRE            : HSMCI_SR_UNRE_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_SR_Register use record
      CMDRDY          at 0 range 0 .. 0;
      RXRDY           at 0 range 1 .. 1;
      TXRDY           at 0 range 2 .. 2;
      BLKE            at 0 range 3 .. 3;
      DTIP            at 0 range 4 .. 4;
      NOTBUSY         at 0 range 5 .. 5;
      Reserved_6_7    at 0 range 6 .. 7;
      SDIOIRQforSlotA at 0 range 8 .. 8;
      SDIOIRQforSlotB at 0 range 9 .. 9;
      Reserved_10_11  at 0 range 10 .. 11;
      SDIOWAIT        at 0 range 12 .. 12;
      CSRCV           at 0 range 13 .. 13;
      Reserved_14_15  at 0 range 14 .. 15;
      RINDE           at 0 range 16 .. 16;
      RDIRE           at 0 range 17 .. 17;
      RCRCE           at 0 range 18 .. 18;
      RENDE           at 0 range 19 .. 19;
      RTOE            at 0 range 20 .. 20;
      DCRCE           at 0 range 21 .. 21;
      DTOE            at 0 range 22 .. 22;
      CSTOE           at 0 range 23 .. 23;
      BLKOVRE         at 0 range 24 .. 24;
      DMADONE         at 0 range 25 .. 25;
      FIFOEMPTY       at 0 range 26 .. 26;
      XFRDONE         at 0 range 27 .. 27;
      ACKRCV          at 0 range 28 .. 28;
      ACKRCVE         at 0 range 29 .. 29;
      OVRE            at 0 range 30 .. 30;
      UNRE            at 0 range 31 .. 31;
   end record;

   subtype HSMCI_IER_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_BLKE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_DTIP_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_CSRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_RINDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_RDIRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_RCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_RENDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_RTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_DCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_DTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_CSTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_DMADONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IER_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type HSMCI_IER_Register is record
      --  Write-only. Command Ready Interrupt Enable
      CMDRDY          : HSMCI_IER_CMDRDY_Field := 16#0#;
      --  Write-only. Receiver Ready Interrupt Enable
      RXRDY           : HSMCI_IER_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Ready Interrupt Enable
      TXRDY           : HSMCI_IER_TXRDY_Field := 16#0#;
      --  Write-only. Data Block Ended Interrupt Enable
      BLKE            : HSMCI_IER_BLKE_Field := 16#0#;
      --  Write-only. Data Transfer in Progress Interrupt Enable
      DTIP            : HSMCI_IER_DTIP_Field := 16#0#;
      --  Write-only. Data Not Busy Interrupt Enable
      NOTBUSY         : HSMCI_IER_NOTBUSY_Field := 16#0#;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only.
      SDIOIRQforSlotA : HSMCI_IER_SDIOIRQforSlotA_Field := 16#0#;
      --  Write-only.
      SDIOIRQforSlotB : HSMCI_IER_SDIOIRQforSlotB_Field := 16#0#;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. SDIO Read Wait Operation Status Interrupt Enable
      SDIOWAIT        : HSMCI_IER_SDIOWAIT_Field := 16#0#;
      --  Write-only. Completion Signal Received Interrupt Enable
      CSRCV           : HSMCI_IER_CSRCV_Field := 16#0#;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Response Index Error Interrupt Enable
      RINDE           : HSMCI_IER_RINDE_Field := 16#0#;
      --  Write-only. Response Direction Error Interrupt Enable
      RDIRE           : HSMCI_IER_RDIRE_Field := 16#0#;
      --  Write-only. Response CRC Error Interrupt Enable
      RCRCE           : HSMCI_IER_RCRCE_Field := 16#0#;
      --  Write-only. Response End Bit Error Interrupt Enable
      RENDE           : HSMCI_IER_RENDE_Field := 16#0#;
      --  Write-only. Response Time-out Error Interrupt Enable
      RTOE            : HSMCI_IER_RTOE_Field := 16#0#;
      --  Write-only. Data CRC Error Interrupt Enable
      DCRCE           : HSMCI_IER_DCRCE_Field := 16#0#;
      --  Write-only. Data Time-out Error Interrupt Enable
      DTOE            : HSMCI_IER_DTOE_Field := 16#0#;
      --  Write-only. Completion Signal Timeout Error Interrupt Enable
      CSTOE           : HSMCI_IER_CSTOE_Field := 16#0#;
      --  Write-only. DMA Block Overrun Error Interrupt Enable
      BLKOVRE         : HSMCI_IER_BLKOVRE_Field := 16#0#;
      --  Write-only. DMA Transfer completed Interrupt Enable
      DMADONE         : HSMCI_IER_DMADONE_Field := 16#0#;
      --  Write-only. FIFO empty Interrupt enable
      FIFOEMPTY       : HSMCI_IER_FIFOEMPTY_Field := 16#0#;
      --  Write-only. Transfer Done Interrupt enable
      XFRDONE         : HSMCI_IER_XFRDONE_Field := 16#0#;
      --  Write-only. Boot Acknowledge Interrupt Enable
      ACKRCV          : HSMCI_IER_ACKRCV_Field := 16#0#;
      --  Write-only. Boot Acknowledge Error Interrupt Enable
      ACKRCVE         : HSMCI_IER_ACKRCVE_Field := 16#0#;
      --  Write-only. Overrun Interrupt Enable
      OVRE            : HSMCI_IER_OVRE_Field := 16#0#;
      --  Write-only. Underrun Interrupt Enable
      UNRE            : HSMCI_IER_UNRE_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_IER_Register use record
      CMDRDY          at 0 range 0 .. 0;
      RXRDY           at 0 range 1 .. 1;
      TXRDY           at 0 range 2 .. 2;
      BLKE            at 0 range 3 .. 3;
      DTIP            at 0 range 4 .. 4;
      NOTBUSY         at 0 range 5 .. 5;
      Reserved_6_7    at 0 range 6 .. 7;
      SDIOIRQforSlotA at 0 range 8 .. 8;
      SDIOIRQforSlotB at 0 range 9 .. 9;
      Reserved_10_11  at 0 range 10 .. 11;
      SDIOWAIT        at 0 range 12 .. 12;
      CSRCV           at 0 range 13 .. 13;
      Reserved_14_15  at 0 range 14 .. 15;
      RINDE           at 0 range 16 .. 16;
      RDIRE           at 0 range 17 .. 17;
      RCRCE           at 0 range 18 .. 18;
      RENDE           at 0 range 19 .. 19;
      RTOE            at 0 range 20 .. 20;
      DCRCE           at 0 range 21 .. 21;
      DTOE            at 0 range 22 .. 22;
      CSTOE           at 0 range 23 .. 23;
      BLKOVRE         at 0 range 24 .. 24;
      DMADONE         at 0 range 25 .. 25;
      FIFOEMPTY       at 0 range 26 .. 26;
      XFRDONE         at 0 range 27 .. 27;
      ACKRCV          at 0 range 28 .. 28;
      ACKRCVE         at 0 range 29 .. 29;
      OVRE            at 0 range 30 .. 30;
      UNRE            at 0 range 31 .. 31;
   end record;

   subtype HSMCI_IDR_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_BLKE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_DTIP_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_CSRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_RINDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_RDIRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_RCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_RENDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_RTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_DCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_DTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_CSTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_DMADONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IDR_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type HSMCI_IDR_Register is record
      --  Write-only. Command Ready Interrupt Disable
      CMDRDY          : HSMCI_IDR_CMDRDY_Field := 16#0#;
      --  Write-only. Receiver Ready Interrupt Disable
      RXRDY           : HSMCI_IDR_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Ready Interrupt Disable
      TXRDY           : HSMCI_IDR_TXRDY_Field := 16#0#;
      --  Write-only. Data Block Ended Interrupt Disable
      BLKE            : HSMCI_IDR_BLKE_Field := 16#0#;
      --  Write-only. Data Transfer in Progress Interrupt Disable
      DTIP            : HSMCI_IDR_DTIP_Field := 16#0#;
      --  Write-only. Data Not Busy Interrupt Disable
      NOTBUSY         : HSMCI_IDR_NOTBUSY_Field := 16#0#;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only.
      SDIOIRQforSlotA : HSMCI_IDR_SDIOIRQforSlotA_Field := 16#0#;
      --  Write-only.
      SDIOIRQforSlotB : HSMCI_IDR_SDIOIRQforSlotB_Field := 16#0#;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. SDIO Read Wait Operation Status Interrupt Disable
      SDIOWAIT        : HSMCI_IDR_SDIOWAIT_Field := 16#0#;
      --  Write-only. Completion Signal received interrupt Disable
      CSRCV           : HSMCI_IDR_CSRCV_Field := 16#0#;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Response Index Error Interrupt Disable
      RINDE           : HSMCI_IDR_RINDE_Field := 16#0#;
      --  Write-only. Response Direction Error Interrupt Disable
      RDIRE           : HSMCI_IDR_RDIRE_Field := 16#0#;
      --  Write-only. Response CRC Error Interrupt Disable
      RCRCE           : HSMCI_IDR_RCRCE_Field := 16#0#;
      --  Write-only. Response End Bit Error Interrupt Disable
      RENDE           : HSMCI_IDR_RENDE_Field := 16#0#;
      --  Write-only. Response Time-out Error Interrupt Disable
      RTOE            : HSMCI_IDR_RTOE_Field := 16#0#;
      --  Write-only. Data CRC Error Interrupt Disable
      DCRCE           : HSMCI_IDR_DCRCE_Field := 16#0#;
      --  Write-only. Data Time-out Error Interrupt Disable
      DTOE            : HSMCI_IDR_DTOE_Field := 16#0#;
      --  Write-only. Completion Signal Time out Error Interrupt Disable
      CSTOE           : HSMCI_IDR_CSTOE_Field := 16#0#;
      --  Write-only. DMA Block Overrun Error Interrupt Disable
      BLKOVRE         : HSMCI_IDR_BLKOVRE_Field := 16#0#;
      --  Write-only. DMA Transfer completed Interrupt Disable
      DMADONE         : HSMCI_IDR_DMADONE_Field := 16#0#;
      --  Write-only. FIFO empty Interrupt Disable
      FIFOEMPTY       : HSMCI_IDR_FIFOEMPTY_Field := 16#0#;
      --  Write-only. Transfer Done Interrupt Disable
      XFRDONE         : HSMCI_IDR_XFRDONE_Field := 16#0#;
      --  Write-only. Boot Acknowledge Interrupt Disable
      ACKRCV          : HSMCI_IDR_ACKRCV_Field := 16#0#;
      --  Write-only. Boot Acknowledge Error Interrupt Disable
      ACKRCVE         : HSMCI_IDR_ACKRCVE_Field := 16#0#;
      --  Write-only. Overrun Interrupt Disable
      OVRE            : HSMCI_IDR_OVRE_Field := 16#0#;
      --  Write-only. Underrun Interrupt Disable
      UNRE            : HSMCI_IDR_UNRE_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_IDR_Register use record
      CMDRDY          at 0 range 0 .. 0;
      RXRDY           at 0 range 1 .. 1;
      TXRDY           at 0 range 2 .. 2;
      BLKE            at 0 range 3 .. 3;
      DTIP            at 0 range 4 .. 4;
      NOTBUSY         at 0 range 5 .. 5;
      Reserved_6_7    at 0 range 6 .. 7;
      SDIOIRQforSlotA at 0 range 8 .. 8;
      SDIOIRQforSlotB at 0 range 9 .. 9;
      Reserved_10_11  at 0 range 10 .. 11;
      SDIOWAIT        at 0 range 12 .. 12;
      CSRCV           at 0 range 13 .. 13;
      Reserved_14_15  at 0 range 14 .. 15;
      RINDE           at 0 range 16 .. 16;
      RDIRE           at 0 range 17 .. 17;
      RCRCE           at 0 range 18 .. 18;
      RENDE           at 0 range 19 .. 19;
      RTOE            at 0 range 20 .. 20;
      DCRCE           at 0 range 21 .. 21;
      DTOE            at 0 range 22 .. 22;
      CSTOE           at 0 range 23 .. 23;
      BLKOVRE         at 0 range 24 .. 24;
      DMADONE         at 0 range 25 .. 25;
      FIFOEMPTY       at 0 range 26 .. 26;
      XFRDONE         at 0 range 27 .. 27;
      ACKRCV          at 0 range 28 .. 28;
      ACKRCVE         at 0 range 29 .. 29;
      OVRE            at 0 range 30 .. 30;
      UNRE            at 0 range 31 .. 31;
   end record;

   subtype HSMCI_IMR_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_BLKE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_DTIP_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_CSRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_RINDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_RDIRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_RCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_RENDE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_RTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_DCRCE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_DTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_CSTOE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_DMADONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_IMR_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type HSMCI_IMR_Register is record
      --  Read-only. Command Ready Interrupt Mask
      CMDRDY          : HSMCI_IMR_CMDRDY_Field;
      --  Read-only. Receiver Ready Interrupt Mask
      RXRDY           : HSMCI_IMR_RXRDY_Field;
      --  Read-only. Transmit Ready Interrupt Mask
      TXRDY           : HSMCI_IMR_TXRDY_Field;
      --  Read-only. Data Block Ended Interrupt Mask
      BLKE            : HSMCI_IMR_BLKE_Field;
      --  Read-only. Data Transfer in Progress Interrupt Mask
      DTIP            : HSMCI_IMR_DTIP_Field;
      --  Read-only. Data Not Busy Interrupt Mask
      NOTBUSY         : HSMCI_IMR_NOTBUSY_Field;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2;
      --  Read-only.
      SDIOIRQforSlotA : HSMCI_IMR_SDIOIRQforSlotA_Field;
      --  Read-only.
      SDIOIRQforSlotB : HSMCI_IMR_SDIOIRQforSlotB_Field;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2;
      --  Read-only. SDIO Read Wait Operation Status Interrupt Mask
      SDIOWAIT        : HSMCI_IMR_SDIOWAIT_Field;
      --  Read-only. Completion Signal Received Interrupt Mask
      CSRCV           : HSMCI_IMR_CSRCV_Field;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2;
      --  Read-only. Response Index Error Interrupt Mask
      RINDE           : HSMCI_IMR_RINDE_Field;
      --  Read-only. Response Direction Error Interrupt Mask
      RDIRE           : HSMCI_IMR_RDIRE_Field;
      --  Read-only. Response CRC Error Interrupt Mask
      RCRCE           : HSMCI_IMR_RCRCE_Field;
      --  Read-only. Response End Bit Error Interrupt Mask
      RENDE           : HSMCI_IMR_RENDE_Field;
      --  Read-only. Response Time-out Error Interrupt Mask
      RTOE            : HSMCI_IMR_RTOE_Field;
      --  Read-only. Data CRC Error Interrupt Mask
      DCRCE           : HSMCI_IMR_DCRCE_Field;
      --  Read-only. Data Time-out Error Interrupt Mask
      DTOE            : HSMCI_IMR_DTOE_Field;
      --  Read-only. Completion Signal Time-out Error Interrupt Mask
      CSTOE           : HSMCI_IMR_CSTOE_Field;
      --  Read-only. DMA Block Overrun Error Interrupt Mask
      BLKOVRE         : HSMCI_IMR_BLKOVRE_Field;
      --  Read-only. DMA Transfer Completed Interrupt Mask
      DMADONE         : HSMCI_IMR_DMADONE_Field;
      --  Read-only. FIFO Empty Interrupt Mask
      FIFOEMPTY       : HSMCI_IMR_FIFOEMPTY_Field;
      --  Read-only. Transfer Done Interrupt Mask
      XFRDONE         : HSMCI_IMR_XFRDONE_Field;
      --  Read-only. Boot Operation Acknowledge Received Interrupt Mask
      ACKRCV          : HSMCI_IMR_ACKRCV_Field;
      --  Read-only. Boot Operation Acknowledge Error Interrupt Mask
      ACKRCVE         : HSMCI_IMR_ACKRCVE_Field;
      --  Read-only. Overrun Interrupt Mask
      OVRE            : HSMCI_IMR_OVRE_Field;
      --  Read-only. Underrun Interrupt Mask
      UNRE            : HSMCI_IMR_UNRE_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_IMR_Register use record
      CMDRDY          at 0 range 0 .. 0;
      RXRDY           at 0 range 1 .. 1;
      TXRDY           at 0 range 2 .. 2;
      BLKE            at 0 range 3 .. 3;
      DTIP            at 0 range 4 .. 4;
      NOTBUSY         at 0 range 5 .. 5;
      Reserved_6_7    at 0 range 6 .. 7;
      SDIOIRQforSlotA at 0 range 8 .. 8;
      SDIOIRQforSlotB at 0 range 9 .. 9;
      Reserved_10_11  at 0 range 10 .. 11;
      SDIOWAIT        at 0 range 12 .. 12;
      CSRCV           at 0 range 13 .. 13;
      Reserved_14_15  at 0 range 14 .. 15;
      RINDE           at 0 range 16 .. 16;
      RDIRE           at 0 range 17 .. 17;
      RCRCE           at 0 range 18 .. 18;
      RENDE           at 0 range 19 .. 19;
      RTOE            at 0 range 20 .. 20;
      DCRCE           at 0 range 21 .. 21;
      DTOE            at 0 range 22 .. 22;
      CSTOE           at 0 range 23 .. 23;
      BLKOVRE         at 0 range 24 .. 24;
      DMADONE         at 0 range 25 .. 25;
      FIFOEMPTY       at 0 range 26 .. 26;
      XFRDONE         at 0 range 27 .. 27;
      ACKRCV          at 0 range 28 .. 28;
      ACKRCVE         at 0 range 29 .. 29;
      OVRE            at 0 range 30 .. 30;
      UNRE            at 0 range 31 .. 31;
   end record;

   subtype HSMCI_DMA_OFFSET_Field is ATSAM3X8E.UInt2;

   --  DMA Channel Read and Write Chunk Size
   type DMA_CHKSIZE_Field is
     (--  1 data available
      Val_1,
      --  4 data available
      Val_4)
     with Size => 1;
   for DMA_CHKSIZE_Field use
     (Val_1 => 0,
      Val_4 => 1);

   subtype HSMCI_DMA_DMAEN_Field is ATSAM3X8E.Bit;
   subtype HSMCI_DMA_ROPT_Field is ATSAM3X8E.Bit;

   --  DMA Configuration Register
   type HSMCI_DMA_Register is record
      --  DMA Write Buffer Offset
      OFFSET         : HSMCI_DMA_OFFSET_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  DMA Channel Read and Write Chunk Size
      CHKSIZE        : DMA_CHKSIZE_Field := ATSAM3X8E.HSMCI.Val_1;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  DMA Hardware Handshaking Enable
      DMAEN          : HSMCI_DMA_DMAEN_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : ATSAM3X8E.UInt3 := 16#0#;
      --  Read Optimization with padding
      ROPT           : HSMCI_DMA_ROPT_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_DMA_Register use record
      OFFSET         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      CHKSIZE        at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DMAEN          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      ROPT           at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype HSMCI_CFG_FIFOMODE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CFG_FERRCTRL_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CFG_HSMODE_Field is ATSAM3X8E.Bit;
   subtype HSMCI_CFG_LSYNC_Field is ATSAM3X8E.Bit;

   --  Configuration Register
   type HSMCI_CFG_Register is record
      --  HSMCI Internal FIFO control mode
      FIFOMODE       : HSMCI_CFG_FIFOMODE_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  Flow Error flag reset control mode
      FERRCTRL       : HSMCI_CFG_FERRCTRL_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  High Speed Mode
      HSMODE         : HSMCI_CFG_HSMODE_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : ATSAM3X8E.UInt3 := 16#0#;
      --  Synchronize on the last block
      LSYNC          : HSMCI_CFG_LSYNC_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_CFG_Register use record
      FIFOMODE       at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      FERRCTRL       at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      HSMODE         at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      LSYNC          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype HSMCI_WPMR_WP_EN_Field is ATSAM3X8E.Bit;
   subtype HSMCI_WPMR_WP_KEY_Field is ATSAM3X8E.UInt24;

   --  Write Protection Mode Register
   type HSMCI_WPMR_Register is record
      --  Write Protection Enable
      WP_EN        : HSMCI_WPMR_WP_EN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protection Key password
      WP_KEY       : HSMCI_WPMR_WP_KEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_WPMR_Register use record
      WP_EN        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WP_KEY       at 0 range 8 .. 31;
   end record;

   --  Write Protection Violation Status
   type WPSR_WP_VS_Field is
     (--  No Write Protection Violation occurred since the last read of this register
--  (WP_SR)
      NONE,
      --  Write Protection detected unauthorized attempt to write a control register
--  had occurred (since the last read.)
      WRITE,
      --  Software reset had been performed while Write Protection was enabled (since
--  the last read).
      RESET,
      --  Both Write Protection violation and software reset with Write Protection
--  enabled have occurred since the last read.
      BOTH)
     with Size => 4;
   for WPSR_WP_VS_Field use
     (NONE => 0,
      WRITE => 1,
      RESET => 2,
      BOTH => 3);

   subtype HSMCI_WPSR_WP_VSRC_Field is ATSAM3X8E.UInt16;

   --  Write Protection Status Register
   type HSMCI_WPSR_Register is record
      --  Read-only. Write Protection Violation Status
      WP_VS          : WPSR_WP_VS_Field;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Write Protection Violation SouRCe
      WP_VSRC        : HSMCI_WPSR_WP_VSRC_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HSMCI_WPSR_Register use record
      WP_VS          at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      WP_VSRC        at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  FIFO Memory Aperture0

   -----------------
   -- Peripherals --
   -----------------

   --  High Speed MultiMedia Card Interface
   type HSMCI_Peripheral is record
      --  Control Register
      CR       : aliased HSMCI_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Mode Register
      MR       : aliased HSMCI_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Data Timeout Register
      DTOR     : aliased HSMCI_DTOR_Register;
      pragma Volatile_Full_Access (DTOR);
      --  SD/SDIO Card Register
      SDCR     : aliased HSMCI_SDCR_Register;
      pragma Volatile_Full_Access (SDCR);
      --  Argument Register
      ARGR     : aliased ATSAM3X8E.UInt32;
      --  Command Register
      CMDR     : aliased HSMCI_CMDR_Register;
      pragma Volatile_Full_Access (CMDR);
      --  Block Register
      BLKR     : aliased HSMCI_BLKR_Register;
      pragma Volatile_Full_Access (BLKR);
      --  Completion Signal Timeout Register
      CSTOR    : aliased HSMCI_CSTOR_Register;
      pragma Volatile_Full_Access (CSTOR);
      --  Response Register
      RSPR_0   : aliased ATSAM3X8E.UInt32;
      --  Response Register
      RSPR_1   : aliased ATSAM3X8E.UInt32;
      --  Response Register
      RSPR_2   : aliased ATSAM3X8E.UInt32;
      --  Response Register
      RSPR_3   : aliased ATSAM3X8E.UInt32;
      --  Receive Data Register
      RDR      : aliased ATSAM3X8E.UInt32;
      --  Transmit Data Register
      TDR      : aliased ATSAM3X8E.UInt32;
      --  Status Register
      SR       : aliased HSMCI_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Interrupt Enable Register
      IER      : aliased HSMCI_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR      : aliased HSMCI_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR      : aliased HSMCI_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  DMA Configuration Register
      DMA      : aliased HSMCI_DMA_Register;
      pragma Volatile_Full_Access (DMA);
      --  Configuration Register
      CFG      : aliased HSMCI_CFG_Register;
      pragma Volatile_Full_Access (CFG);
      --  Write Protection Mode Register
      WPMR     : aliased HSMCI_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  Write Protection Status Register
      WPSR     : aliased HSMCI_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
      --  FIFO Memory Aperture0
      FIFO_0   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_1   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_2   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_3   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_4   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_5   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_6   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_7   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_8   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_9   : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_10  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_11  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_12  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_13  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_14  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_15  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_16  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_17  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_18  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_19  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_20  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_21  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_22  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_23  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_24  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_25  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_26  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_27  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_28  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_29  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_30  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_31  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_32  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_33  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_34  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_35  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_36  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_37  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_38  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_39  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_40  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_41  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_42  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_43  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_44  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_45  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_46  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_47  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_48  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_49  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_50  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_51  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_52  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_53  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_54  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_55  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_56  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_57  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_58  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_59  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_60  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_61  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_62  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_63  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_64  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_65  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_66  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_67  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_68  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_69  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_70  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_71  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_72  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_73  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_74  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_75  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_76  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_77  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_78  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_79  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_80  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_81  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_82  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_83  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_84  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_85  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_86  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_87  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_88  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_89  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_90  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_91  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_92  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_93  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_94  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_95  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_96  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_97  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_98  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_99  : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_100 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_101 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_102 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_103 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_104 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_105 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_106 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_107 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_108 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_109 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_110 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_111 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_112 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_113 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_114 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_115 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_116 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_117 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_118 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_119 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_120 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_121 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_122 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_123 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_124 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_125 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_126 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_127 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_128 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_129 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_130 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_131 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_132 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_133 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_134 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_135 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_136 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_137 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_138 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_139 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_140 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_141 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_142 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_143 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_144 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_145 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_146 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_147 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_148 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_149 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_150 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_151 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_152 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_153 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_154 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_155 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_156 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_157 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_158 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_159 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_160 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_161 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_162 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_163 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_164 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_165 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_166 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_167 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_168 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_169 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_170 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_171 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_172 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_173 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_174 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_175 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_176 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_177 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_178 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_179 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_180 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_181 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_182 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_183 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_184 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_185 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_186 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_187 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_188 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_189 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_190 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_191 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_192 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_193 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_194 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_195 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_196 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_197 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_198 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_199 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_200 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_201 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_202 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_203 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_204 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_205 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_206 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_207 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_208 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_209 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_210 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_211 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_212 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_213 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_214 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_215 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_216 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_217 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_218 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_219 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_220 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_221 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_222 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_223 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_224 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_225 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_226 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_227 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_228 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_229 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_230 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_231 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_232 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_233 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_234 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_235 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_236 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_237 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_238 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_239 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_240 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_241 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_242 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_243 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_244 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_245 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_246 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_247 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_248 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_249 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_250 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_251 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_252 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_253 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_254 : aliased ATSAM3X8E.UInt32;
      --  FIFO Memory Aperture0
      FIFO_255 : aliased ATSAM3X8E.UInt32;
   end record
     with Volatile;

   for HSMCI_Peripheral use record
      CR       at 16#0# range 0 .. 31;
      MR       at 16#4# range 0 .. 31;
      DTOR     at 16#8# range 0 .. 31;
      SDCR     at 16#C# range 0 .. 31;
      ARGR     at 16#10# range 0 .. 31;
      CMDR     at 16#14# range 0 .. 31;
      BLKR     at 16#18# range 0 .. 31;
      CSTOR    at 16#1C# range 0 .. 31;
      RSPR_0   at 16#20# range 0 .. 31;
      RSPR_1   at 16#24# range 0 .. 31;
      RSPR_2   at 16#28# range 0 .. 31;
      RSPR_3   at 16#2C# range 0 .. 31;
      RDR      at 16#30# range 0 .. 31;
      TDR      at 16#34# range 0 .. 31;
      SR       at 16#40# range 0 .. 31;
      IER      at 16#44# range 0 .. 31;
      IDR      at 16#48# range 0 .. 31;
      IMR      at 16#4C# range 0 .. 31;
      DMA      at 16#50# range 0 .. 31;
      CFG      at 16#54# range 0 .. 31;
      WPMR     at 16#E4# range 0 .. 31;
      WPSR     at 16#E8# range 0 .. 31;
      FIFO_0   at 16#200# range 0 .. 31;
      FIFO_1   at 16#204# range 0 .. 31;
      FIFO_2   at 16#208# range 0 .. 31;
      FIFO_3   at 16#20C# range 0 .. 31;
      FIFO_4   at 16#210# range 0 .. 31;
      FIFO_5   at 16#214# range 0 .. 31;
      FIFO_6   at 16#218# range 0 .. 31;
      FIFO_7   at 16#21C# range 0 .. 31;
      FIFO_8   at 16#220# range 0 .. 31;
      FIFO_9   at 16#224# range 0 .. 31;
      FIFO_10  at 16#228# range 0 .. 31;
      FIFO_11  at 16#22C# range 0 .. 31;
      FIFO_12  at 16#230# range 0 .. 31;
      FIFO_13  at 16#234# range 0 .. 31;
      FIFO_14  at 16#238# range 0 .. 31;
      FIFO_15  at 16#23C# range 0 .. 31;
      FIFO_16  at 16#240# range 0 .. 31;
      FIFO_17  at 16#244# range 0 .. 31;
      FIFO_18  at 16#248# range 0 .. 31;
      FIFO_19  at 16#24C# range 0 .. 31;
      FIFO_20  at 16#250# range 0 .. 31;
      FIFO_21  at 16#254# range 0 .. 31;
      FIFO_22  at 16#258# range 0 .. 31;
      FIFO_23  at 16#25C# range 0 .. 31;
      FIFO_24  at 16#260# range 0 .. 31;
      FIFO_25  at 16#264# range 0 .. 31;
      FIFO_26  at 16#268# range 0 .. 31;
      FIFO_27  at 16#26C# range 0 .. 31;
      FIFO_28  at 16#270# range 0 .. 31;
      FIFO_29  at 16#274# range 0 .. 31;
      FIFO_30  at 16#278# range 0 .. 31;
      FIFO_31  at 16#27C# range 0 .. 31;
      FIFO_32  at 16#280# range 0 .. 31;
      FIFO_33  at 16#284# range 0 .. 31;
      FIFO_34  at 16#288# range 0 .. 31;
      FIFO_35  at 16#28C# range 0 .. 31;
      FIFO_36  at 16#290# range 0 .. 31;
      FIFO_37  at 16#294# range 0 .. 31;
      FIFO_38  at 16#298# range 0 .. 31;
      FIFO_39  at 16#29C# range 0 .. 31;
      FIFO_40  at 16#2A0# range 0 .. 31;
      FIFO_41  at 16#2A4# range 0 .. 31;
      FIFO_42  at 16#2A8# range 0 .. 31;
      FIFO_43  at 16#2AC# range 0 .. 31;
      FIFO_44  at 16#2B0# range 0 .. 31;
      FIFO_45  at 16#2B4# range 0 .. 31;
      FIFO_46  at 16#2B8# range 0 .. 31;
      FIFO_47  at 16#2BC# range 0 .. 31;
      FIFO_48  at 16#2C0# range 0 .. 31;
      FIFO_49  at 16#2C4# range 0 .. 31;
      FIFO_50  at 16#2C8# range 0 .. 31;
      FIFO_51  at 16#2CC# range 0 .. 31;
      FIFO_52  at 16#2D0# range 0 .. 31;
      FIFO_53  at 16#2D4# range 0 .. 31;
      FIFO_54  at 16#2D8# range 0 .. 31;
      FIFO_55  at 16#2DC# range 0 .. 31;
      FIFO_56  at 16#2E0# range 0 .. 31;
      FIFO_57  at 16#2E4# range 0 .. 31;
      FIFO_58  at 16#2E8# range 0 .. 31;
      FIFO_59  at 16#2EC# range 0 .. 31;
      FIFO_60  at 16#2F0# range 0 .. 31;
      FIFO_61  at 16#2F4# range 0 .. 31;
      FIFO_62  at 16#2F8# range 0 .. 31;
      FIFO_63  at 16#2FC# range 0 .. 31;
      FIFO_64  at 16#300# range 0 .. 31;
      FIFO_65  at 16#304# range 0 .. 31;
      FIFO_66  at 16#308# range 0 .. 31;
      FIFO_67  at 16#30C# range 0 .. 31;
      FIFO_68  at 16#310# range 0 .. 31;
      FIFO_69  at 16#314# range 0 .. 31;
      FIFO_70  at 16#318# range 0 .. 31;
      FIFO_71  at 16#31C# range 0 .. 31;
      FIFO_72  at 16#320# range 0 .. 31;
      FIFO_73  at 16#324# range 0 .. 31;
      FIFO_74  at 16#328# range 0 .. 31;
      FIFO_75  at 16#32C# range 0 .. 31;
      FIFO_76  at 16#330# range 0 .. 31;
      FIFO_77  at 16#334# range 0 .. 31;
      FIFO_78  at 16#338# range 0 .. 31;
      FIFO_79  at 16#33C# range 0 .. 31;
      FIFO_80  at 16#340# range 0 .. 31;
      FIFO_81  at 16#344# range 0 .. 31;
      FIFO_82  at 16#348# range 0 .. 31;
      FIFO_83  at 16#34C# range 0 .. 31;
      FIFO_84  at 16#350# range 0 .. 31;
      FIFO_85  at 16#354# range 0 .. 31;
      FIFO_86  at 16#358# range 0 .. 31;
      FIFO_87  at 16#35C# range 0 .. 31;
      FIFO_88  at 16#360# range 0 .. 31;
      FIFO_89  at 16#364# range 0 .. 31;
      FIFO_90  at 16#368# range 0 .. 31;
      FIFO_91  at 16#36C# range 0 .. 31;
      FIFO_92  at 16#370# range 0 .. 31;
      FIFO_93  at 16#374# range 0 .. 31;
      FIFO_94  at 16#378# range 0 .. 31;
      FIFO_95  at 16#37C# range 0 .. 31;
      FIFO_96  at 16#380# range 0 .. 31;
      FIFO_97  at 16#384# range 0 .. 31;
      FIFO_98  at 16#388# range 0 .. 31;
      FIFO_99  at 16#38C# range 0 .. 31;
      FIFO_100 at 16#390# range 0 .. 31;
      FIFO_101 at 16#394# range 0 .. 31;
      FIFO_102 at 16#398# range 0 .. 31;
      FIFO_103 at 16#39C# range 0 .. 31;
      FIFO_104 at 16#3A0# range 0 .. 31;
      FIFO_105 at 16#3A4# range 0 .. 31;
      FIFO_106 at 16#3A8# range 0 .. 31;
      FIFO_107 at 16#3AC# range 0 .. 31;
      FIFO_108 at 16#3B0# range 0 .. 31;
      FIFO_109 at 16#3B4# range 0 .. 31;
      FIFO_110 at 16#3B8# range 0 .. 31;
      FIFO_111 at 16#3BC# range 0 .. 31;
      FIFO_112 at 16#3C0# range 0 .. 31;
      FIFO_113 at 16#3C4# range 0 .. 31;
      FIFO_114 at 16#3C8# range 0 .. 31;
      FIFO_115 at 16#3CC# range 0 .. 31;
      FIFO_116 at 16#3D0# range 0 .. 31;
      FIFO_117 at 16#3D4# range 0 .. 31;
      FIFO_118 at 16#3D8# range 0 .. 31;
      FIFO_119 at 16#3DC# range 0 .. 31;
      FIFO_120 at 16#3E0# range 0 .. 31;
      FIFO_121 at 16#3E4# range 0 .. 31;
      FIFO_122 at 16#3E8# range 0 .. 31;
      FIFO_123 at 16#3EC# range 0 .. 31;
      FIFO_124 at 16#3F0# range 0 .. 31;
      FIFO_125 at 16#3F4# range 0 .. 31;
      FIFO_126 at 16#3F8# range 0 .. 31;
      FIFO_127 at 16#3FC# range 0 .. 31;
      FIFO_128 at 16#400# range 0 .. 31;
      FIFO_129 at 16#404# range 0 .. 31;
      FIFO_130 at 16#408# range 0 .. 31;
      FIFO_131 at 16#40C# range 0 .. 31;
      FIFO_132 at 16#410# range 0 .. 31;
      FIFO_133 at 16#414# range 0 .. 31;
      FIFO_134 at 16#418# range 0 .. 31;
      FIFO_135 at 16#41C# range 0 .. 31;
      FIFO_136 at 16#420# range 0 .. 31;
      FIFO_137 at 16#424# range 0 .. 31;
      FIFO_138 at 16#428# range 0 .. 31;
      FIFO_139 at 16#42C# range 0 .. 31;
      FIFO_140 at 16#430# range 0 .. 31;
      FIFO_141 at 16#434# range 0 .. 31;
      FIFO_142 at 16#438# range 0 .. 31;
      FIFO_143 at 16#43C# range 0 .. 31;
      FIFO_144 at 16#440# range 0 .. 31;
      FIFO_145 at 16#444# range 0 .. 31;
      FIFO_146 at 16#448# range 0 .. 31;
      FIFO_147 at 16#44C# range 0 .. 31;
      FIFO_148 at 16#450# range 0 .. 31;
      FIFO_149 at 16#454# range 0 .. 31;
      FIFO_150 at 16#458# range 0 .. 31;
      FIFO_151 at 16#45C# range 0 .. 31;
      FIFO_152 at 16#460# range 0 .. 31;
      FIFO_153 at 16#464# range 0 .. 31;
      FIFO_154 at 16#468# range 0 .. 31;
      FIFO_155 at 16#46C# range 0 .. 31;
      FIFO_156 at 16#470# range 0 .. 31;
      FIFO_157 at 16#474# range 0 .. 31;
      FIFO_158 at 16#478# range 0 .. 31;
      FIFO_159 at 16#47C# range 0 .. 31;
      FIFO_160 at 16#480# range 0 .. 31;
      FIFO_161 at 16#484# range 0 .. 31;
      FIFO_162 at 16#488# range 0 .. 31;
      FIFO_163 at 16#48C# range 0 .. 31;
      FIFO_164 at 16#490# range 0 .. 31;
      FIFO_165 at 16#494# range 0 .. 31;
      FIFO_166 at 16#498# range 0 .. 31;
      FIFO_167 at 16#49C# range 0 .. 31;
      FIFO_168 at 16#4A0# range 0 .. 31;
      FIFO_169 at 16#4A4# range 0 .. 31;
      FIFO_170 at 16#4A8# range 0 .. 31;
      FIFO_171 at 16#4AC# range 0 .. 31;
      FIFO_172 at 16#4B0# range 0 .. 31;
      FIFO_173 at 16#4B4# range 0 .. 31;
      FIFO_174 at 16#4B8# range 0 .. 31;
      FIFO_175 at 16#4BC# range 0 .. 31;
      FIFO_176 at 16#4C0# range 0 .. 31;
      FIFO_177 at 16#4C4# range 0 .. 31;
      FIFO_178 at 16#4C8# range 0 .. 31;
      FIFO_179 at 16#4CC# range 0 .. 31;
      FIFO_180 at 16#4D0# range 0 .. 31;
      FIFO_181 at 16#4D4# range 0 .. 31;
      FIFO_182 at 16#4D8# range 0 .. 31;
      FIFO_183 at 16#4DC# range 0 .. 31;
      FIFO_184 at 16#4E0# range 0 .. 31;
      FIFO_185 at 16#4E4# range 0 .. 31;
      FIFO_186 at 16#4E8# range 0 .. 31;
      FIFO_187 at 16#4EC# range 0 .. 31;
      FIFO_188 at 16#4F0# range 0 .. 31;
      FIFO_189 at 16#4F4# range 0 .. 31;
      FIFO_190 at 16#4F8# range 0 .. 31;
      FIFO_191 at 16#4FC# range 0 .. 31;
      FIFO_192 at 16#500# range 0 .. 31;
      FIFO_193 at 16#504# range 0 .. 31;
      FIFO_194 at 16#508# range 0 .. 31;
      FIFO_195 at 16#50C# range 0 .. 31;
      FIFO_196 at 16#510# range 0 .. 31;
      FIFO_197 at 16#514# range 0 .. 31;
      FIFO_198 at 16#518# range 0 .. 31;
      FIFO_199 at 16#51C# range 0 .. 31;
      FIFO_200 at 16#520# range 0 .. 31;
      FIFO_201 at 16#524# range 0 .. 31;
      FIFO_202 at 16#528# range 0 .. 31;
      FIFO_203 at 16#52C# range 0 .. 31;
      FIFO_204 at 16#530# range 0 .. 31;
      FIFO_205 at 16#534# range 0 .. 31;
      FIFO_206 at 16#538# range 0 .. 31;
      FIFO_207 at 16#53C# range 0 .. 31;
      FIFO_208 at 16#540# range 0 .. 31;
      FIFO_209 at 16#544# range 0 .. 31;
      FIFO_210 at 16#548# range 0 .. 31;
      FIFO_211 at 16#54C# range 0 .. 31;
      FIFO_212 at 16#550# range 0 .. 31;
      FIFO_213 at 16#554# range 0 .. 31;
      FIFO_214 at 16#558# range 0 .. 31;
      FIFO_215 at 16#55C# range 0 .. 31;
      FIFO_216 at 16#560# range 0 .. 31;
      FIFO_217 at 16#564# range 0 .. 31;
      FIFO_218 at 16#568# range 0 .. 31;
      FIFO_219 at 16#56C# range 0 .. 31;
      FIFO_220 at 16#570# range 0 .. 31;
      FIFO_221 at 16#574# range 0 .. 31;
      FIFO_222 at 16#578# range 0 .. 31;
      FIFO_223 at 16#57C# range 0 .. 31;
      FIFO_224 at 16#580# range 0 .. 31;
      FIFO_225 at 16#584# range 0 .. 31;
      FIFO_226 at 16#588# range 0 .. 31;
      FIFO_227 at 16#58C# range 0 .. 31;
      FIFO_228 at 16#590# range 0 .. 31;
      FIFO_229 at 16#594# range 0 .. 31;
      FIFO_230 at 16#598# range 0 .. 31;
      FIFO_231 at 16#59C# range 0 .. 31;
      FIFO_232 at 16#5A0# range 0 .. 31;
      FIFO_233 at 16#5A4# range 0 .. 31;
      FIFO_234 at 16#5A8# range 0 .. 31;
      FIFO_235 at 16#5AC# range 0 .. 31;
      FIFO_236 at 16#5B0# range 0 .. 31;
      FIFO_237 at 16#5B4# range 0 .. 31;
      FIFO_238 at 16#5B8# range 0 .. 31;
      FIFO_239 at 16#5BC# range 0 .. 31;
      FIFO_240 at 16#5C0# range 0 .. 31;
      FIFO_241 at 16#5C4# range 0 .. 31;
      FIFO_242 at 16#5C8# range 0 .. 31;
      FIFO_243 at 16#5CC# range 0 .. 31;
      FIFO_244 at 16#5D0# range 0 .. 31;
      FIFO_245 at 16#5D4# range 0 .. 31;
      FIFO_246 at 16#5D8# range 0 .. 31;
      FIFO_247 at 16#5DC# range 0 .. 31;
      FIFO_248 at 16#5E0# range 0 .. 31;
      FIFO_249 at 16#5E4# range 0 .. 31;
      FIFO_250 at 16#5E8# range 0 .. 31;
      FIFO_251 at 16#5EC# range 0 .. 31;
      FIFO_252 at 16#5F0# range 0 .. 31;
      FIFO_253 at 16#5F4# range 0 .. 31;
      FIFO_254 at 16#5F8# range 0 .. 31;
      FIFO_255 at 16#5FC# range 0 .. 31;
   end record;

   --  High Speed MultiMedia Card Interface
   HSMCI_Periph : aliased HSMCI_Peripheral
     with Import, Address => HSMCI_Base;

end ATSAM3X8E.HSMCI;
