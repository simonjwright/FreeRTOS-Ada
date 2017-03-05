--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  High Speed MultiMedia Card Interface
package ATSAM3X8E.HSMCI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_MCIEN_Field is ATSAM3X8E.Bit;
   subtype CR_MCIDIS_Field is ATSAM3X8E.Bit;
   subtype CR_PWSEN_Field is ATSAM3X8E.Bit;
   subtype CR_PWSDIS_Field is ATSAM3X8E.Bit;
   subtype CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  Write-only. Multi-Media Interface Enable
      MCIEN         : CR_MCIEN_Field := 16#0#;
      --  Write-only. Multi-Media Interface Disable
      MCIDIS        : CR_MCIDIS_Field := 16#0#;
      --  Write-only. Power Save Mode Enable
      PWSEN         : CR_PWSEN_Field := 16#0#;
      --  Write-only. Power Save Mode Disable
      PWSDIS        : CR_PWSDIS_Field := 16#0#;
      --  unspecified
      Reserved_4_6  : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Software Reset
      SWRST         : CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      MCIEN         at 0 range 0 .. 0;
      MCIDIS        at 0 range 1 .. 1;
      PWSEN         at 0 range 2 .. 2;
      PWSDIS        at 0 range 3 .. 3;
      Reserved_4_6  at 0 range 4 .. 6;
      SWRST         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   subtype MR_CLKDIV_Field is ATSAM3X8E.Byte;
   subtype MR_PWSDIV_Field is ATSAM3X8E.UInt3;
   subtype MR_RDPROOF_Field is ATSAM3X8E.Bit;
   subtype MR_WRPROOF_Field is ATSAM3X8E.Bit;
   subtype MR_FBYTE_Field is ATSAM3X8E.Bit;
   subtype MR_PADV_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type MR_Register is record
      --  Clock Divider
      CLKDIV         : MR_CLKDIV_Field := 16#0#;
      --  Power Saving Divider
      PWSDIV         : MR_PWSDIV_Field := 16#0#;
      RDPROOF        : MR_RDPROOF_Field := 16#0#;
      WRPROOF        : MR_WRPROOF_Field := 16#0#;
      --  Force Byte Transfer
      FBYTE          : MR_FBYTE_Field := 16#0#;
      --  Padding Value
      PADV           : MR_PADV_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      CLKDIV         at 0 range 0 .. 7;
      PWSDIV         at 0 range 8 .. 10;
      RDPROOF        at 0 range 11 .. 11;
      WRPROOF        at 0 range 12 .. 12;
      FBYTE          at 0 range 13 .. 13;
      PADV           at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   -------------------
   -- DTOR_Register --
   -------------------

   subtype DTOR_DTOCYC_Field is ATSAM3X8E.UInt4;

   --  Data Timeout Multiplier
   type DTOMUL_Field is
     (
      --  DTOCYC
      DTOMUL_Field_1,
      --  DTOCYC x 16
      DTOMUL_Field_16,
      --  DTOCYC x 128
      DTOMUL_Field_128,
      --  DTOCYC x 256
      DTOMUL_Field_256,
      --  DTOCYC x 1024
      DTOMUL_Field_1024,
      --  DTOCYC x 4096
      DTOMUL_Field_4096,
      --  DTOCYC x 65536
      DTOMUL_Field_65536,
      --  DTOCYC x 1048576
      DTOMUL_Field_1048576)
     with Size => 3;
   for DTOMUL_Field use
     (DTOMUL_Field_1 => 0,
      DTOMUL_Field_16 => 1,
      DTOMUL_Field_128 => 2,
      DTOMUL_Field_256 => 3,
      DTOMUL_Field_1024 => 4,
      DTOMUL_Field_4096 => 5,
      DTOMUL_Field_65536 => 6,
      DTOMUL_Field_1048576 => 7);

   --  Data Timeout Register
   type DTOR_Register is record
      --  Data Timeout Cycle Number
      DTOCYC        : DTOR_DTOCYC_Field := 16#0#;
      --  Data Timeout Multiplier
      DTOMUL        : DTOMUL_Field := DTOMUL_Field_1;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DTOR_Register use record
      DTOCYC        at 0 range 0 .. 3;
      DTOMUL        at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -------------------
   -- SDCR_Register --
   -------------------

   --  SDCard/SDIO Slot
   type SDCSEL_Field is
     (
      --  Slot A is selected.
      Slota,
      --  SDCARD/SDIO Slot B selected
      Slotb,
      --  -
      Slotc,
      --  -
      Slotd)
     with Size => 2;
   for SDCSEL_Field use
     (Slota => 0,
      Slotb => 1,
      Slotc => 2,
      Slotd => 3);

   --  SDCard/SDIO Bus Width
   type SDCBUS_Field is
     (
      --  1 bit
      SDCBUS_Field_1,
      --  4 bit
      SDCBUS_Field_4,
      --  8 bit
      SDCBUS_Field_8)
     with Size => 2;
   for SDCBUS_Field use
     (SDCBUS_Field_1 => 0,
      SDCBUS_Field_4 => 2,
      SDCBUS_Field_8 => 3);

   --  SD/SDIO Card Register
   type SDCR_Register is record
      --  SDCard/SDIO Slot
      SDCSEL        : SDCSEL_Field := Slota;
      --  unspecified
      Reserved_2_5  : ATSAM3X8E.UInt4 := 16#0#;
      --  SDCard/SDIO Bus Width
      SDCBUS        : SDCBUS_Field := SDCBUS_Field_1;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SDCR_Register use record
      SDCSEL        at 0 range 0 .. 1;
      Reserved_2_5  at 0 range 2 .. 5;
      SDCBUS        at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- CMDR_Register --
   -------------------

   subtype CMDR_CMDNB_Field is ATSAM3X8E.UInt6;

   --  Response Type
   type RSPTYP_Field is
     (
      --  No response.
      Noresp,
      --  48-bit response.
      RSPTYP_Field_48_Bit,
      --  136-bit response.
      RSPTYP_Field_136_Bit,
      --  R1b response type
      R1B)
     with Size => 2;
   for RSPTYP_Field use
     (Noresp => 0,
      RSPTYP_Field_48_Bit => 1,
      RSPTYP_Field_136_Bit => 2,
      R1B => 3);

   --  Special Command
   type SPCMD_Field is
     (
      --  Not a special CMD.
      Std,
      --  Initialization CMD: 74 clock cycles for initialization sequence.
      Init,
      --  Synchronized CMD: Wait for the end of the current data block transfer
      --  before sending the pending command.
      Sync,
      --  CE-ATA Completion Signal disable Command. The host cancels the
      --  ability for the device to return a command completion signal on the
      --  command line.
      Ce_Ata,
      --  Interrupt command: Corresponds to the Interrupt Mode (CMD40).
      It_Cmd,
      --  Interrupt response: Corresponds to the Interrupt Mode (CMD40).
      It_Resp,
      --  Boot Operation Request. Start a boot operation mode, the host
      --  processor can read boot data from the MMC device directly.
      Bor,
      --  End Boot Operation. This command allows the host processor to
      --  terminate the boot operation mode.
      Ebo)
     with Size => 3;
   for SPCMD_Field use
     (Std => 0,
      Init => 1,
      Sync => 2,
      Ce_Ata => 3,
      It_Cmd => 4,
      It_Resp => 5,
      Bor => 6,
      Ebo => 7);

   --  Open Drain Command
   type OPDCMD_Field is
     (
      --  Push pull command.
      Pushpull,
      --  Open drain command.
      Opendrain)
     with Size => 1;
   for OPDCMD_Field use
     (Pushpull => 0,
      Opendrain => 1);

   --  Max Latency for Command to Response
   type MAXLAT_Field is
     (
      --  5-cycle max latency.
      MAXLAT_Field_5,
      --  64-cycle max latency.
      MAXLAT_Field_64)
     with Size => 1;
   for MAXLAT_Field use
     (MAXLAT_Field_5 => 0,
      MAXLAT_Field_64 => 1);

   --  Transfer Command
   type TRCMD_Field is
     (
      --  No data transfer
      No_Data,
      --  Start data transfer
      Start_Data,
      --  Stop data transfer
      Stop_Data)
     with Size => 2;
   for TRCMD_Field use
     (No_Data => 0,
      Start_Data => 1,
      Stop_Data => 2);

   --  Transfer Direction
   type TRDIR_Field is
     (
      --  Write.
      Write,
      --  Read.
      Read)
     with Size => 1;
   for TRDIR_Field use
     (Write => 0,
      Read => 1);

   --  Transfer Type
   type TRTYP_Field is
     (
      --  MMC/SDCard Single Block
      Single,
      --  MMC/SDCard Multiple Block
      Multiple,
      --  MMC Stream
      Stream,
      --  SDIO Byte
      Byte,
      --  SDIO Block
      Block)
     with Size => 3;
   for TRTYP_Field use
     (Single => 0,
      Multiple => 1,
      Stream => 2,
      Byte => 4,
      Block => 5);

   --  SDIO Special Command
   type IOSPCMD_Field is
     (
      --  Not an SDIO Special Command
      Std,
      --  SDIO Suspend Command
      Suspend,
      --  SDIO Resume Command
      Resume)
     with Size => 2;
   for IOSPCMD_Field use
     (Std => 0,
      Suspend => 1,
      Resume => 2);

   --  ATA with Command Completion Signal
   type ATACS_Field is
     (
      --  Normal operation mode.
      Normal,
      --  This bit indicates that a completion signal is expected within a
      --  programmed amount of time (HSMCI_CSTOR).
      Completion)
     with Size => 1;
   for ATACS_Field use
     (Normal => 0,
      Completion => 1);

   subtype CMDR_BOOT_ACK_Field is ATSAM3X8E.Bit;

   --  Command Register
   type CMDR_Register is record
      --  Write-only. Command Number
      CMDNB          : CMDR_CMDNB_Field := 16#0#;
      --  Write-only. Response Type
      RSPTYP         : RSPTYP_Field := Noresp;
      --  Write-only. Special Command
      SPCMD          : SPCMD_Field := Std;
      --  Write-only. Open Drain Command
      OPDCMD         : OPDCMD_Field := Pushpull;
      --  Write-only. Max Latency for Command to Response
      MAXLAT         : MAXLAT_Field := MAXLAT_Field_5;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Transfer Command
      TRCMD          : TRCMD_Field := No_Data;
      --  Write-only. Transfer Direction
      TRDIR          : TRDIR_Field := Write;
      --  Write-only. Transfer Type
      TRTYP          : TRTYP_Field := Single;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. SDIO Special Command
      IOSPCMD        : IOSPCMD_Field := Std;
      --  Write-only. ATA with Command Completion Signal
      ATACS          : ATACS_Field := Normal;
      --  Write-only. Boot Operation Acknowledge.
      BOOT_ACK       : CMDR_BOOT_ACK_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : ATSAM3X8E.UInt4 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMDR_Register use record
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

   -------------------
   -- BLKR_Register --
   -------------------

   --  MMC/SDIO Block Count - SDIO Byte Count
   type BCNT_Field is
     (
      --  MMC/SDCARD Multiple BlockFrom 1 to 65635: Value 0 corresponds to an
      --  infinite block transfer.
      Multiple,
      --  SDIO ByteFrom 1 to 512 bytes: Value 0 corresponds to a 512-byte
      --  transfer.Values from 0x200 to 0xFFFF are forbidden.
      Byte,
      --  SDIO BlockFrom 1 to 511 blocks: Value 0 corresponds to an infinite
      --  block transfer.Values from 0x200 to 0xFFFF are forbidden.
      Block)
     with Size => 16;
   for BCNT_Field use
     (Multiple => 0,
      Byte => 4,
      Block => 5);

   subtype BLKR_BLKLEN_Field is ATSAM3X8E.Short;

   --  Block Register
   type BLKR_Register is record
      --  MMC/SDIO Block Count - SDIO Byte Count
      BCNT   : BCNT_Field := Multiple;
      --  Data Block Length
      BLKLEN : BLKR_BLKLEN_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BLKR_Register use record
      BCNT   at 0 range 0 .. 15;
      BLKLEN at 0 range 16 .. 31;
   end record;

   --------------------
   -- CSTOR_Register --
   --------------------

   subtype CSTOR_CSTOCYC_Field is ATSAM3X8E.UInt4;

   --  Completion Signal Timeout Multiplier
   type CSTOMUL_Field is
     (
      --  CSTOCYC x 1
      CSTOMUL_Field_1,
      --  CSTOCYC x 16
      CSTOMUL_Field_16,
      --  CSTOCYC x 128
      CSTOMUL_Field_128,
      --  CSTOCYC x 256
      CSTOMUL_Field_256,
      --  CSTOCYC x 1024
      CSTOMUL_Field_1024,
      --  CSTOCYC x 4096
      CSTOMUL_Field_4096,
      --  CSTOCYC x 65536
      CSTOMUL_Field_65536,
      --  CSTOCYC x 1048576
      CSTOMUL_Field_1048576)
     with Size => 3;
   for CSTOMUL_Field use
     (CSTOMUL_Field_1 => 0,
      CSTOMUL_Field_16 => 1,
      CSTOMUL_Field_128 => 2,
      CSTOMUL_Field_256 => 3,
      CSTOMUL_Field_1024 => 4,
      CSTOMUL_Field_4096 => 5,
      CSTOMUL_Field_65536 => 6,
      CSTOMUL_Field_1048576 => 7);

   --  Completion Signal Timeout Register
   type CSTOR_Register is record
      --  Completion Signal Timeout Cycle Number
      CSTOCYC       : CSTOR_CSTOCYC_Field := 16#0#;
      --  Completion Signal Timeout Multiplier
      CSTOMUL       : CSTOMUL_Field := CSTOMUL_Field_1;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CSTOR_Register use record
      CSTOCYC       at 0 range 0 .. 3;
      CSTOMUL       at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Response Register

   --  Response Register
   type RSPR_Registers is array (0 .. 3) of ATSAM3X8E.Word;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_BLKE_Field is ATSAM3X8E.Bit;
   subtype SR_DTIP_Field is ATSAM3X8E.Bit;
   subtype SR_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype SR_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype SR_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype SR_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype SR_CSRCV_Field is ATSAM3X8E.Bit;
   subtype SR_RINDE_Field is ATSAM3X8E.Bit;
   subtype SR_RDIRE_Field is ATSAM3X8E.Bit;
   subtype SR_RCRCE_Field is ATSAM3X8E.Bit;
   subtype SR_RENDE_Field is ATSAM3X8E.Bit;
   subtype SR_RTOE_Field is ATSAM3X8E.Bit;
   subtype SR_DCRCE_Field is ATSAM3X8E.Bit;
   subtype SR_DTOE_Field is ATSAM3X8E.Bit;
   subtype SR_CSTOE_Field is ATSAM3X8E.Bit;
   subtype SR_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype SR_DMADONE_Field is ATSAM3X8E.Bit;
   subtype SR_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype SR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype SR_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype SR_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype SR_OVRE_Field is ATSAM3X8E.Bit;
   subtype SR_UNRE_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. Command Ready
      CMDRDY          : SR_CMDRDY_Field := 16#1#;
      --  Read-only. Receiver Ready
      RXRDY           : SR_RXRDY_Field := 16#0#;
      --  Read-only. Transmit Ready
      TXRDY           : SR_TXRDY_Field := 16#1#;
      --  Read-only. Data Block Ended
      BLKE            : SR_BLKE_Field := 16#0#;
      --  Read-only. Data Transfer in Progress
      DTIP            : SR_DTIP_Field := 16#0#;
      --  Read-only. HSMCI Not Busy
      NOTBUSY         : SR_NOTBUSY_Field := 16#1#;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2;
      --  Read-only.
      SDIOIRQforSlotA : SR_SDIOIRQforSlotA_Field := 16#0#;
      --  Read-only.
      SDIOIRQforSlotB : SR_SDIOIRQforSlotB_Field := 16#0#;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2;
      --  Read-only. SDIO Read Wait Operation Status
      SDIOWAIT        : SR_SDIOWAIT_Field := 16#0#;
      --  Read-only. CE-ATA Completion Signal Received
      CSRCV           : SR_CSRCV_Field := 16#0#;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2;
      --  Read-only. Response Index Error
      RINDE           : SR_RINDE_Field := 16#0#;
      --  Read-only. Response Direction Error
      RDIRE           : SR_RDIRE_Field := 16#0#;
      --  Read-only. Response CRC Error
      RCRCE           : SR_RCRCE_Field := 16#0#;
      --  Read-only. Response End Bit Error
      RENDE           : SR_RENDE_Field := 16#0#;
      --  Read-only. Response Time-out Error
      RTOE            : SR_RTOE_Field := 16#0#;
      --  Read-only. Data CRC Error
      DCRCE           : SR_DCRCE_Field := 16#0#;
      --  Read-only. Data Time-out Error
      DTOE            : SR_DTOE_Field := 16#0#;
      --  Read-only. Completion Signal Time-out Error
      CSTOE           : SR_CSTOE_Field := 16#0#;
      --  Read-only. DMA Block Overrun Error
      BLKOVRE         : SR_BLKOVRE_Field := 16#0#;
      --  Read-only. DMA Transfer done
      DMADONE         : SR_DMADONE_Field := 16#0#;
      --  Read-only. FIFO empty flag
      FIFOEMPTY       : SR_FIFOEMPTY_Field := 16#0#;
      --  Read-only. Transfer Done flag
      XFRDONE         : SR_XFRDONE_Field := 16#0#;
      --  Read-only. Boot Operation Acknowledge Received
      ACKRCV          : SR_ACKRCV_Field := 16#0#;
      --  Read-only. Boot Operation Acknowledge Error
      ACKRCVE         : SR_ACKRCVE_Field := 16#0#;
      --  Read-only. Overrun
      OVRE            : SR_OVRE_Field := 16#0#;
      --  Read-only. Underrun
      UNRE            : SR_UNRE_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
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

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_BLKE_Field is ATSAM3X8E.Bit;
   subtype IER_DTIP_Field is ATSAM3X8E.Bit;
   subtype IER_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype IER_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype IER_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype IER_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype IER_CSRCV_Field is ATSAM3X8E.Bit;
   subtype IER_RINDE_Field is ATSAM3X8E.Bit;
   subtype IER_RDIRE_Field is ATSAM3X8E.Bit;
   subtype IER_RCRCE_Field is ATSAM3X8E.Bit;
   subtype IER_RENDE_Field is ATSAM3X8E.Bit;
   subtype IER_RTOE_Field is ATSAM3X8E.Bit;
   subtype IER_DCRCE_Field is ATSAM3X8E.Bit;
   subtype IER_DTOE_Field is ATSAM3X8E.Bit;
   subtype IER_CSTOE_Field is ATSAM3X8E.Bit;
   subtype IER_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype IER_DMADONE_Field is ATSAM3X8E.Bit;
   subtype IER_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype IER_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype IER_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype IER_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Command Ready Interrupt Enable
      CMDRDY          : IER_CMDRDY_Field := 16#0#;
      --  Write-only. Receiver Ready Interrupt Enable
      RXRDY           : IER_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Ready Interrupt Enable
      TXRDY           : IER_TXRDY_Field := 16#0#;
      --  Write-only. Data Block Ended Interrupt Enable
      BLKE            : IER_BLKE_Field := 16#0#;
      --  Write-only. Data Transfer in Progress Interrupt Enable
      DTIP            : IER_DTIP_Field := 16#0#;
      --  Write-only. Data Not Busy Interrupt Enable
      NOTBUSY         : IER_NOTBUSY_Field := 16#0#;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only.
      SDIOIRQforSlotA : IER_SDIOIRQforSlotA_Field := 16#0#;
      --  Write-only.
      SDIOIRQforSlotB : IER_SDIOIRQforSlotB_Field := 16#0#;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. SDIO Read Wait Operation Status Interrupt Enable
      SDIOWAIT        : IER_SDIOWAIT_Field := 16#0#;
      --  Write-only. Completion Signal Received Interrupt Enable
      CSRCV           : IER_CSRCV_Field := 16#0#;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Response Index Error Interrupt Enable
      RINDE           : IER_RINDE_Field := 16#0#;
      --  Write-only. Response Direction Error Interrupt Enable
      RDIRE           : IER_RDIRE_Field := 16#0#;
      --  Write-only. Response CRC Error Interrupt Enable
      RCRCE           : IER_RCRCE_Field := 16#0#;
      --  Write-only. Response End Bit Error Interrupt Enable
      RENDE           : IER_RENDE_Field := 16#0#;
      --  Write-only. Response Time-out Error Interrupt Enable
      RTOE            : IER_RTOE_Field := 16#0#;
      --  Write-only. Data CRC Error Interrupt Enable
      DCRCE           : IER_DCRCE_Field := 16#0#;
      --  Write-only. Data Time-out Error Interrupt Enable
      DTOE            : IER_DTOE_Field := 16#0#;
      --  Write-only. Completion Signal Timeout Error Interrupt Enable
      CSTOE           : IER_CSTOE_Field := 16#0#;
      --  Write-only. DMA Block Overrun Error Interrupt Enable
      BLKOVRE         : IER_BLKOVRE_Field := 16#0#;
      --  Write-only. DMA Transfer completed Interrupt Enable
      DMADONE         : IER_DMADONE_Field := 16#0#;
      --  Write-only. FIFO empty Interrupt enable
      FIFOEMPTY       : IER_FIFOEMPTY_Field := 16#0#;
      --  Write-only. Transfer Done Interrupt enable
      XFRDONE         : IER_XFRDONE_Field := 16#0#;
      --  Write-only. Boot Acknowledge Interrupt Enable
      ACKRCV          : IER_ACKRCV_Field := 16#0#;
      --  Write-only. Boot Acknowledge Error Interrupt Enable
      ACKRCVE         : IER_ACKRCVE_Field := 16#0#;
      --  Write-only. Overrun Interrupt Enable
      OVRE            : IER_OVRE_Field := 16#0#;
      --  Write-only. Underrun Interrupt Enable
      UNRE            : IER_UNRE_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
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

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_BLKE_Field is ATSAM3X8E.Bit;
   subtype IDR_DTIP_Field is ATSAM3X8E.Bit;
   subtype IDR_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype IDR_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype IDR_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype IDR_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype IDR_CSRCV_Field is ATSAM3X8E.Bit;
   subtype IDR_RINDE_Field is ATSAM3X8E.Bit;
   subtype IDR_RDIRE_Field is ATSAM3X8E.Bit;
   subtype IDR_RCRCE_Field is ATSAM3X8E.Bit;
   subtype IDR_RENDE_Field is ATSAM3X8E.Bit;
   subtype IDR_RTOE_Field is ATSAM3X8E.Bit;
   subtype IDR_DCRCE_Field is ATSAM3X8E.Bit;
   subtype IDR_DTOE_Field is ATSAM3X8E.Bit;
   subtype IDR_CSTOE_Field is ATSAM3X8E.Bit;
   subtype IDR_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_DMADONE_Field is ATSAM3X8E.Bit;
   subtype IDR_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype IDR_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype IDR_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Command Ready Interrupt Disable
      CMDRDY          : IDR_CMDRDY_Field := 16#0#;
      --  Write-only. Receiver Ready Interrupt Disable
      RXRDY           : IDR_RXRDY_Field := 16#0#;
      --  Write-only. Transmit Ready Interrupt Disable
      TXRDY           : IDR_TXRDY_Field := 16#0#;
      --  Write-only. Data Block Ended Interrupt Disable
      BLKE            : IDR_BLKE_Field := 16#0#;
      --  Write-only. Data Transfer in Progress Interrupt Disable
      DTIP            : IDR_DTIP_Field := 16#0#;
      --  Write-only. Data Not Busy Interrupt Disable
      NOTBUSY         : IDR_NOTBUSY_Field := 16#0#;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only.
      SDIOIRQforSlotA : IDR_SDIOIRQforSlotA_Field := 16#0#;
      --  Write-only.
      SDIOIRQforSlotB : IDR_SDIOIRQforSlotB_Field := 16#0#;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. SDIO Read Wait Operation Status Interrupt Disable
      SDIOWAIT        : IDR_SDIOWAIT_Field := 16#0#;
      --  Write-only. Completion Signal received interrupt Disable
      CSRCV           : IDR_CSRCV_Field := 16#0#;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Response Index Error Interrupt Disable
      RINDE           : IDR_RINDE_Field := 16#0#;
      --  Write-only. Response Direction Error Interrupt Disable
      RDIRE           : IDR_RDIRE_Field := 16#0#;
      --  Write-only. Response CRC Error Interrupt Disable
      RCRCE           : IDR_RCRCE_Field := 16#0#;
      --  Write-only. Response End Bit Error Interrupt Disable
      RENDE           : IDR_RENDE_Field := 16#0#;
      --  Write-only. Response Time-out Error Interrupt Disable
      RTOE            : IDR_RTOE_Field := 16#0#;
      --  Write-only. Data CRC Error Interrupt Disable
      DCRCE           : IDR_DCRCE_Field := 16#0#;
      --  Write-only. Data Time-out Error Interrupt Disable
      DTOE            : IDR_DTOE_Field := 16#0#;
      --  Write-only. Completion Signal Time out Error Interrupt Disable
      CSTOE           : IDR_CSTOE_Field := 16#0#;
      --  Write-only. DMA Block Overrun Error Interrupt Disable
      BLKOVRE         : IDR_BLKOVRE_Field := 16#0#;
      --  Write-only. DMA Transfer completed Interrupt Disable
      DMADONE         : IDR_DMADONE_Field := 16#0#;
      --  Write-only. FIFO empty Interrupt Disable
      FIFOEMPTY       : IDR_FIFOEMPTY_Field := 16#0#;
      --  Write-only. Transfer Done Interrupt Disable
      XFRDONE         : IDR_XFRDONE_Field := 16#0#;
      --  Write-only. Boot Acknowledge Interrupt Disable
      ACKRCV          : IDR_ACKRCV_Field := 16#0#;
      --  Write-only. Boot Acknowledge Error Interrupt Disable
      ACKRCVE         : IDR_ACKRCVE_Field := 16#0#;
      --  Write-only. Overrun Interrupt Disable
      OVRE            : IDR_OVRE_Field := 16#0#;
      --  Write-only. Underrun Interrupt Disable
      UNRE            : IDR_UNRE_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
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

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_CMDRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_BLKE_Field is ATSAM3X8E.Bit;
   subtype IMR_DTIP_Field is ATSAM3X8E.Bit;
   subtype IMR_NOTBUSY_Field is ATSAM3X8E.Bit;
   subtype IMR_SDIOIRQforSlotA_Field is ATSAM3X8E.Bit;
   subtype IMR_SDIOIRQforSlotB_Field is ATSAM3X8E.Bit;
   subtype IMR_SDIOWAIT_Field is ATSAM3X8E.Bit;
   subtype IMR_CSRCV_Field is ATSAM3X8E.Bit;
   subtype IMR_RINDE_Field is ATSAM3X8E.Bit;
   subtype IMR_RDIRE_Field is ATSAM3X8E.Bit;
   subtype IMR_RCRCE_Field is ATSAM3X8E.Bit;
   subtype IMR_RENDE_Field is ATSAM3X8E.Bit;
   subtype IMR_RTOE_Field is ATSAM3X8E.Bit;
   subtype IMR_DCRCE_Field is ATSAM3X8E.Bit;
   subtype IMR_DTOE_Field is ATSAM3X8E.Bit;
   subtype IMR_CSTOE_Field is ATSAM3X8E.Bit;
   subtype IMR_BLKOVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_DMADONE_Field is ATSAM3X8E.Bit;
   subtype IMR_FIFOEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype IMR_ACKRCV_Field is ATSAM3X8E.Bit;
   subtype IMR_ACKRCVE_Field is ATSAM3X8E.Bit;
   subtype IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Command Ready Interrupt Mask
      CMDRDY          : IMR_CMDRDY_Field := 16#0#;
      --  Read-only. Receiver Ready Interrupt Mask
      RXRDY           : IMR_RXRDY_Field := 16#0#;
      --  Read-only. Transmit Ready Interrupt Mask
      TXRDY           : IMR_TXRDY_Field := 16#0#;
      --  Read-only. Data Block Ended Interrupt Mask
      BLKE            : IMR_BLKE_Field := 16#0#;
      --  Read-only. Data Transfer in Progress Interrupt Mask
      DTIP            : IMR_DTIP_Field := 16#0#;
      --  Read-only. Data Not Busy Interrupt Mask
      NOTBUSY         : IMR_NOTBUSY_Field := 16#0#;
      --  unspecified
      Reserved_6_7    : ATSAM3X8E.UInt2;
      --  Read-only.
      SDIOIRQforSlotA : IMR_SDIOIRQforSlotA_Field := 16#0#;
      --  Read-only.
      SDIOIRQforSlotB : IMR_SDIOIRQforSlotB_Field := 16#0#;
      --  unspecified
      Reserved_10_11  : ATSAM3X8E.UInt2;
      --  Read-only. SDIO Read Wait Operation Status Interrupt Mask
      SDIOWAIT        : IMR_SDIOWAIT_Field := 16#0#;
      --  Read-only. Completion Signal Received Interrupt Mask
      CSRCV           : IMR_CSRCV_Field := 16#0#;
      --  unspecified
      Reserved_14_15  : ATSAM3X8E.UInt2;
      --  Read-only. Response Index Error Interrupt Mask
      RINDE           : IMR_RINDE_Field := 16#0#;
      --  Read-only. Response Direction Error Interrupt Mask
      RDIRE           : IMR_RDIRE_Field := 16#0#;
      --  Read-only. Response CRC Error Interrupt Mask
      RCRCE           : IMR_RCRCE_Field := 16#0#;
      --  Read-only. Response End Bit Error Interrupt Mask
      RENDE           : IMR_RENDE_Field := 16#0#;
      --  Read-only. Response Time-out Error Interrupt Mask
      RTOE            : IMR_RTOE_Field := 16#0#;
      --  Read-only. Data CRC Error Interrupt Mask
      DCRCE           : IMR_DCRCE_Field := 16#0#;
      --  Read-only. Data Time-out Error Interrupt Mask
      DTOE            : IMR_DTOE_Field := 16#0#;
      --  Read-only. Completion Signal Time-out Error Interrupt Mask
      CSTOE           : IMR_CSTOE_Field := 16#0#;
      --  Read-only. DMA Block Overrun Error Interrupt Mask
      BLKOVRE         : IMR_BLKOVRE_Field := 16#0#;
      --  Read-only. DMA Transfer Completed Interrupt Mask
      DMADONE         : IMR_DMADONE_Field := 16#0#;
      --  Read-only. FIFO Empty Interrupt Mask
      FIFOEMPTY       : IMR_FIFOEMPTY_Field := 16#0#;
      --  Read-only. Transfer Done Interrupt Mask
      XFRDONE         : IMR_XFRDONE_Field := 16#0#;
      --  Read-only. Boot Operation Acknowledge Received Interrupt Mask
      ACKRCV          : IMR_ACKRCV_Field := 16#0#;
      --  Read-only. Boot Operation Acknowledge Error Interrupt Mask
      ACKRCVE         : IMR_ACKRCVE_Field := 16#0#;
      --  Read-only. Overrun Interrupt Mask
      OVRE            : IMR_OVRE_Field := 16#0#;
      --  Read-only. Underrun Interrupt Mask
      UNRE            : IMR_UNRE_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
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

   ------------------
   -- DMA_Register --
   ------------------

   subtype DMA_OFFSET_Field is ATSAM3X8E.UInt2;

   --  DMA Channel Read and Write Chunk Size
   type CHKSIZE_Field is
     (
      --  1 data available
      CHKSIZE_Field_1,
      --  4 data available
      CHKSIZE_Field_4)
     with Size => 1;
   for CHKSIZE_Field use
     (CHKSIZE_Field_1 => 0,
      CHKSIZE_Field_4 => 1);

   subtype DMA_DMAEN_Field is ATSAM3X8E.Bit;
   subtype DMA_ROPT_Field is ATSAM3X8E.Bit;

   --  DMA Configuration Register
   type DMA_Register is record
      --  DMA Write Buffer Offset
      OFFSET         : DMA_OFFSET_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  DMA Channel Read and Write Chunk Size
      CHKSIZE        : CHKSIZE_Field := CHKSIZE_Field_1;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  DMA Hardware Handshaking Enable
      DMAEN          : DMA_DMAEN_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : ATSAM3X8E.UInt3 := 16#0#;
      --  Read Optimization with padding
      ROPT           : DMA_ROPT_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DMA_Register use record
      OFFSET         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      CHKSIZE        at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DMAEN          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      ROPT           at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   ------------------
   -- CFG_Register --
   ------------------

   subtype CFG_FIFOMODE_Field is ATSAM3X8E.Bit;
   subtype CFG_FERRCTRL_Field is ATSAM3X8E.Bit;
   subtype CFG_HSMODE_Field is ATSAM3X8E.Bit;
   subtype CFG_LSYNC_Field is ATSAM3X8E.Bit;

   --  Configuration Register
   type CFG_Register is record
      --  HSMCI Internal FIFO control mode
      FIFOMODE       : CFG_FIFOMODE_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  Flow Error flag reset control mode
      FERRCTRL       : CFG_FERRCTRL_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  High Speed Mode
      HSMODE         : CFG_HSMODE_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : ATSAM3X8E.UInt3 := 16#0#;
      --  Synchronize on the last block
      LSYNC          : CFG_LSYNC_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CFG_Register use record
      FIFOMODE       at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      FERRCTRL       at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      HSMODE         at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      LSYNC          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WP_EN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WP_KEY_Field is ATSAM3X8E.UInt24;

   --  Write Protection Mode Register
   type WPMR_Register is record
      --  Write Protection Enable
      WP_EN        : WPMR_WP_EN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protection Key password
      WP_KEY       : WPMR_WP_KEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPMR_Register use record
      WP_EN        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WP_KEY       at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPSR_Register --
   -------------------

   --  Write Protection Violation Status
   type WP_VS_Field is
     (
      --  No Write Protection Violation occurred since the last read of this
      --  register (WP_SR)
      None,
      --  Write Protection detected unauthorized attempt to write a control
      --  register had occurred (since the last read.)
      Write,
      --  Software reset had been performed while Write Protection was enabled
      --  (since the last read).
      Reset,
      --  Both Write Protection violation and software reset with Write
      --  Protection enabled have occurred since the last read.
      Both)
     with Size => 4;
   for WP_VS_Field use
     (None => 0,
      Write => 1,
      Reset => 2,
      Both => 3);

   subtype WPSR_WP_VSRC_Field is ATSAM3X8E.Short;

   --  Write Protection Status Register
   type WPSR_Register is record
      --  Read-only. Write Protection Violation Status
      WP_VS          : WP_VS_Field := None;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Write Protection Violation SouRCe
      WP_VSRC        : WPSR_WP_VSRC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WP_VS          at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      WP_VSRC        at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  FIFO Memory Aperture0

   --  FIFO Memory Aperture0
   type FIFO_Registers is array (0 .. 255) of ATSAM3X8E.Word;

   -----------------
   -- Peripherals --
   -----------------

   --  High Speed MultiMedia Card Interface
   type HSMCI_Peripheral is record
      --  Control Register
      CR    : CR_Register;
      --  Mode Register
      MR    : MR_Register;
      --  Data Timeout Register
      DTOR  : DTOR_Register;
      --  SD/SDIO Card Register
      SDCR  : SDCR_Register;
      --  Argument Register
      ARGR  : ATSAM3X8E.Word;
      --  Command Register
      CMDR  : CMDR_Register;
      --  Block Register
      BLKR  : BLKR_Register;
      --  Completion Signal Timeout Register
      CSTOR : CSTOR_Register;
      --  Response Register
      RSPR  : RSPR_Registers;
      --  Receive Data Register
      RDR   : ATSAM3X8E.Word;
      --  Transmit Data Register
      TDR   : ATSAM3X8E.Word;
      --  Status Register
      SR    : SR_Register;
      --  Interrupt Enable Register
      IER   : IER_Register;
      --  Interrupt Disable Register
      IDR   : IDR_Register;
      --  Interrupt Mask Register
      IMR   : IMR_Register;
      --  DMA Configuration Register
      DMA   : DMA_Register;
      --  Configuration Register
      CFG   : CFG_Register;
      --  Write Protection Mode Register
      WPMR  : WPMR_Register;
      --  Write Protection Status Register
      WPSR  : WPSR_Register;
      --  FIFO Memory Aperture0
      FIFO  : FIFO_Registers;
   end record
     with Volatile;

   for HSMCI_Peripheral use record
      CR    at 0 range 0 .. 31;
      MR    at 4 range 0 .. 31;
      DTOR  at 8 range 0 .. 31;
      SDCR  at 12 range 0 .. 31;
      ARGR  at 16 range 0 .. 31;
      CMDR  at 20 range 0 .. 31;
      BLKR  at 24 range 0 .. 31;
      CSTOR at 28 range 0 .. 31;
      RSPR  at 32 range 0 .. 127;
      RDR   at 48 range 0 .. 31;
      TDR   at 52 range 0 .. 31;
      SR    at 64 range 0 .. 31;
      IER   at 68 range 0 .. 31;
      IDR   at 72 range 0 .. 31;
      IMR   at 76 range 0 .. 31;
      DMA   at 80 range 0 .. 31;
      CFG   at 84 range 0 .. 31;
      WPMR  at 228 range 0 .. 31;
      WPSR  at 232 range 0 .. 31;
      FIFO  at 512 range 0 .. 8191;
   end record;

   --  High Speed MultiMedia Card Interface
   HSMCI_Periph : aliased HSMCI_Peripheral
     with Import, Address => HSMCI_Base;

end ATSAM3X8E.HSMCI;
