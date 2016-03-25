--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.EBI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- CFG_Register --
   ------------------

   type PAGESIZE_Field is
     (
      --  Main area 512 Bytes + Spare area 16 Bytes = 528 Bytes
      Ps512_16,
      --  Main area 1024 Bytes + Spare area 32 Bytes = 1056 Bytes
      Ps1024_32,
      --  Main area 2048 Bytes + Spare area 64 Bytes = 2112 Bytes
      Ps2048_64,
      --  Main area 4096 Bytes + Spare area 128 Bytes = 4224 Bytes
      Ps4096_128)
     with Size => 2;
   for PAGESIZE_Field use
     (Ps512_16 => 0,
      Ps1024_32 => 1,
      Ps2048_64 => 2,
      Ps4096_128 => 3);

   subtype CFG_WSPARE_Field is ATSAM3X8E.Bit;
   subtype CFG_RSPARE_Field is ATSAM3X8E.Bit;
   subtype CFG_EDGECTRL_Field is ATSAM3X8E.Bit;
   subtype CFG_RBEDGE_Field is ATSAM3X8E.Bit;
   subtype CFG_DTOCYC_Field is ATSAM3X8E.UInt4;

   --  Data Timeout Multiplier
   type DTOMUL_Field is
     (
      --  DTOCYC
      X1,
      --  DTOCYC x 16
      X16,
      --  DTOCYC x 128
      X128,
      --  DTOCYC x 256
      X256,
      --  DTOCYC x 1024
      X1024,
      --  DTOCYC x 4096
      X4096,
      --  DTOCYC x 65536
      X65536,
      --  DTOCYC x 1048576
      X1048576)
     with Size => 3;
   for DTOMUL_Field use
     (X1 => 0,
      X16 => 1,
      X128 => 2,
      X256 => 3,
      X1024 => 4,
      X4096 => 5,
      X65536 => 6,
      X1048576 => 7);

   --  SMC NFC Configuration Register
   type CFG_Register is record
      PAGESIZE       : PAGESIZE_Field := Ps512_16;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write Spare Area
      WSPARE         : CFG_WSPARE_Field := 16#0#;
      --  Read Spare Area
      RSPARE         : CFG_RSPARE_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2 := 16#0#;
      --  Rising/Falling Edge Detection Control
      EDGECTRL       : CFG_EDGECTRL_Field := 16#0#;
      --  Ready/Busy Signal Edge Detection
      RBEDGE         : CFG_RBEDGE_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Data Timeout Cycle Number
      DTOCYC         : CFG_DTOCYC_Field := 16#0#;
      --  Data Timeout Multiplier
      DTOMUL         : DTOMUL_Field := X1;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CFG_Register use record
      PAGESIZE       at 0 range 0 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      WSPARE         at 0 range 8 .. 8;
      RSPARE         at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      EDGECTRL       at 0 range 12 .. 12;
      RBEDGE         at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      DTOCYC         at 0 range 16 .. 19;
      DTOMUL         at 0 range 20 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   -------------------
   -- CTRL_Register --
   -------------------

   subtype CTRL_NFCEN_Field is ATSAM3X8E.Bit;
   subtype CTRL_NFCDIS_Field is ATSAM3X8E.Bit;

   --  SMC NFC Control Register
   type CTRL_Register is record
      --  Write-only. NAND Flash Controller Enable
      NFCEN         : CTRL_NFCEN_Field := 16#0#;
      --  Write-only. NAND Flash Controller Disable
      NFCDIS        : CTRL_NFCDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      NFCEN         at 0 range 0 .. 0;
      NFCDIS        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_SMCSTS_Field is ATSAM3X8E.Bit;
   subtype SR_RB_RISE_Field is ATSAM3X8E.Bit;
   subtype SR_RB_FALL_Field is ATSAM3X8E.Bit;
   subtype SR_NFCBUSY_Field is ATSAM3X8E.Bit;
   subtype SR_NFCWR_Field is ATSAM3X8E.Bit;
   subtype SR_NFCSID_Field is ATSAM3X8E.UInt3;
   subtype SR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype SR_CMDDONE_Field is ATSAM3X8E.Bit;
   subtype SR_DTOE_Field is ATSAM3X8E.Bit;
   subtype SR_UNDEF_Field is ATSAM3X8E.Bit;
   subtype SR_AWB_Field is ATSAM3X8E.Bit;
   subtype SR_NFCASE_Field is ATSAM3X8E.Bit;
   subtype SR_RB_EDGE0_Field is ATSAM3X8E.Bit;

   --  SMC NFC Status Register
   type SR_Register is record
      --  Read-only. NAND Flash Controller status (this field cannot be reset)
      SMCSTS         : SR_SMCSTS_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3;
      --  Read-only. Selected Ready Busy Rising Edge Detected
      RB_RISE        : SR_RB_RISE_Field := 16#0#;
      --  Read-only. Selected Ready Busy Falling Edge Detected
      RB_FALL        : SR_RB_FALL_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. NFC Busy (this field cannot be reset)
      NFCBUSY        : SR_NFCBUSY_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : ATSAM3X8E.UInt2;
      --  Read-only. NFC Write/Read Operation (this field cannot be reset)
      NFCWR          : SR_NFCWR_Field := 16#0#;
      --  Read-only. NFC Chip Select ID (this field cannot be reset)
      NFCSID         : SR_NFCSID_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit;
      --  Read-only. NFC Data Transfer Terminated
      XFRDONE        : SR_XFRDONE_Field := 16#0#;
      --  Read-only. Command Done
      CMDDONE        : SR_CMDDONE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2;
      --  Read-only. Data Timeout Error
      DTOE           : SR_DTOE_Field := 16#0#;
      --  Read-only. Undefined Area Error
      UNDEF          : SR_UNDEF_Field := 16#0#;
      --  Read-only. Accessing While Busy
      AWB            : SR_AWB_Field := 16#0#;
      --  Read-only. NFC Access Size Error
      NFCASE         : SR_NFCASE_Field := 16#0#;
      --  Read-only. Ready/Busy Line 0 Edge Detected
      RB_EDGE0       : SR_RB_EDGE0_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      SMCSTS         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      RB_RISE        at 0 range 4 .. 4;
      RB_FALL        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      NFCBUSY        at 0 range 8 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      NFCWR          at 0 range 11 .. 11;
      NFCSID         at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      XFRDONE        at 0 range 16 .. 16;
      CMDDONE        at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DTOE           at 0 range 20 .. 20;
      UNDEF          at 0 range 21 .. 21;
      AWB            at 0 range 22 .. 22;
      NFCASE         at 0 range 23 .. 23;
      RB_EDGE0       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_RB_RISE_Field is ATSAM3X8E.Bit;
   subtype IER_RB_FALL_Field is ATSAM3X8E.Bit;
   subtype IER_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype IER_CMDDONE_Field is ATSAM3X8E.Bit;
   subtype IER_DTOE_Field is ATSAM3X8E.Bit;
   subtype IER_UNDEF_Field is ATSAM3X8E.Bit;
   subtype IER_AWB_Field is ATSAM3X8E.Bit;
   subtype IER_NFCASE_Field is ATSAM3X8E.Bit;
   subtype IER_RB_EDGE0_Field is ATSAM3X8E.Bit;

   --  SMC NFC Interrupt Enable Register
   type IER_Register is record
      --  unspecified
      Reserved_0_3   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Ready Busy Rising Edge Detection Interrupt Enable
      RB_RISE        : IER_RB_RISE_Field := 16#0#;
      --  Write-only. Ready Busy Falling Edge Detection Interrupt Enable
      RB_FALL        : IER_RB_FALL_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : ATSAM3X8E.UInt10 := 16#0#;
      --  Write-only. Transfer Done Interrupt Enable
      XFRDONE        : IER_XFRDONE_Field := 16#0#;
      --  Write-only. Command Done Interrupt Enable
      CMDDONE        : IER_CMDDONE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Data Timeout Error Interrupt Enable
      DTOE           : IER_DTOE_Field := 16#0#;
      --  Write-only. Undefined Area Access Interrupt Enable
      UNDEF          : IER_UNDEF_Field := 16#0#;
      --  Write-only. Accessing While Busy Interrupt Enable
      AWB            : IER_AWB_Field := 16#0#;
      --  Write-only. NFC Access Size Error Interrupt Enable
      NFCASE         : IER_NFCASE_Field := 16#0#;
      --  Write-only. Ready/Busy Line 0 Interrupt Enable
      RB_EDGE0       : IER_RB_EDGE0_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      RB_RISE        at 0 range 4 .. 4;
      RB_FALL        at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      XFRDONE        at 0 range 16 .. 16;
      CMDDONE        at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DTOE           at 0 range 20 .. 20;
      UNDEF          at 0 range 21 .. 21;
      AWB            at 0 range 22 .. 22;
      NFCASE         at 0 range 23 .. 23;
      RB_EDGE0       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_RB_RISE_Field is ATSAM3X8E.Bit;
   subtype IDR_RB_FALL_Field is ATSAM3X8E.Bit;
   subtype IDR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype IDR_CMDDONE_Field is ATSAM3X8E.Bit;
   subtype IDR_DTOE_Field is ATSAM3X8E.Bit;
   subtype IDR_UNDEF_Field is ATSAM3X8E.Bit;
   subtype IDR_AWB_Field is ATSAM3X8E.Bit;
   subtype IDR_NFCASE_Field is ATSAM3X8E.Bit;
   subtype IDR_RB_EDGE0_Field is ATSAM3X8E.Bit;

   --  SMC NFC Interrupt Disable Register
   type IDR_Register is record
      --  unspecified
      Reserved_0_3   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Ready Busy Rising Edge Detection Interrupt Disable
      RB_RISE        : IDR_RB_RISE_Field := 16#0#;
      --  Write-only. Ready Busy Falling Edge Detection Interrupt Disable
      RB_FALL        : IDR_RB_FALL_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : ATSAM3X8E.UInt10 := 16#0#;
      --  Write-only. Transfer Done Interrupt Disable
      XFRDONE        : IDR_XFRDONE_Field := 16#0#;
      --  Write-only. Command Done Interrupt Disable
      CMDDONE        : IDR_CMDDONE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Data Timeout Error Interrupt Disable
      DTOE           : IDR_DTOE_Field := 16#0#;
      --  Write-only. Undefined Area Access Interrupt Disable
      UNDEF          : IDR_UNDEF_Field := 16#0#;
      --  Write-only. Accessing While Busy Interrupt Disable
      AWB            : IDR_AWB_Field := 16#0#;
      --  Write-only. NFC Access Size Error Interrupt Disable
      NFCASE         : IDR_NFCASE_Field := 16#0#;
      --  Write-only. Ready/Busy Line 0 Interrupt Disable
      RB_EDGE0       : IDR_RB_EDGE0_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      RB_RISE        at 0 range 4 .. 4;
      RB_FALL        at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      XFRDONE        at 0 range 16 .. 16;
      CMDDONE        at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DTOE           at 0 range 20 .. 20;
      UNDEF          at 0 range 21 .. 21;
      AWB            at 0 range 22 .. 22;
      NFCASE         at 0 range 23 .. 23;
      RB_EDGE0       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_RB_RISE_Field is ATSAM3X8E.Bit;
   subtype IMR_RB_FALL_Field is ATSAM3X8E.Bit;
   subtype IMR_XFRDONE_Field is ATSAM3X8E.Bit;
   subtype IMR_CMDDONE_Field is ATSAM3X8E.Bit;
   subtype IMR_DTOE_Field is ATSAM3X8E.Bit;
   subtype IMR_UNDEF_Field is ATSAM3X8E.Bit;
   subtype IMR_AWB_Field is ATSAM3X8E.Bit;
   subtype IMR_NFCASE_Field is ATSAM3X8E.Bit;
   subtype IMR_RB_EDGE0_Field is ATSAM3X8E.Bit;

   --  SMC NFC Interrupt Mask Register
   type IMR_Register is record
      --  unspecified
      Reserved_0_3   : ATSAM3X8E.UInt4;
      --  Read-only. Ready Busy Rising Edge Detection Interrupt Mask
      RB_RISE        : IMR_RB_RISE_Field := 16#0#;
      --  Read-only. Ready Busy Falling Edge Detection Interrupt Mask
      RB_FALL        : IMR_RB_FALL_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : ATSAM3X8E.UInt10;
      --  Read-only. Transfer Done Interrupt Mask
      XFRDONE        : IMR_XFRDONE_Field := 16#0#;
      --  Read-only. Command Done Interrupt Mask
      CMDDONE        : IMR_CMDDONE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2;
      --  Read-only. Data Timeout Error Interrupt Mask
      DTOE           : IMR_DTOE_Field := 16#0#;
      --  Read-only. Undefined Area Access Interrupt Mask5
      UNDEF          : IMR_UNDEF_Field := 16#0#;
      --  Read-only. Accessing While Busy Interrupt Mask
      AWB            : IMR_AWB_Field := 16#0#;
      --  Read-only. NFC Access Size Error Interrupt Mask
      NFCASE         : IMR_NFCASE_Field := 16#0#;
      --  Read-only. Ready/Busy Line 0 Interrupt Mask
      RB_EDGE0       : IMR_RB_EDGE0_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      RB_RISE        at 0 range 4 .. 4;
      RB_FALL        at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      XFRDONE        at 0 range 16 .. 16;
      CMDDONE        at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DTOE           at 0 range 20 .. 20;
      UNDEF          at 0 range 21 .. 21;
      AWB            at 0 range 22 .. 22;
      NFCASE         at 0 range 23 .. 23;
      RB_EDGE0       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -------------------
   -- ADDR_Register --
   -------------------

   subtype ADDR_ADDR_CYCLE0_Field is ATSAM3X8E.Byte;

   --  SMC NFC Address Cycle Zero Register
   type ADDR_Register is record
      --  NAND Flash Array Address cycle 0
      ADDR_CYCLE0   : ADDR_ADDR_CYCLE0_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ADDR_Register use record
      ADDR_CYCLE0   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- BANK_Register --
   -------------------

   subtype BANK_BANK_Field is ATSAM3X8E.UInt3;

   --  SMC Bank Address Register
   type BANK_Register is record
      --  Bank Identifier
      BANK          : BANK_BANK_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BANK_Register use record
      BANK          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- ECC_CTRL_Register --
   -----------------------

   subtype ECC_CTRL_RST_Field is ATSAM3X8E.Bit;
   subtype ECC_CTRL_SWRST_Field is ATSAM3X8E.Bit;

   --  SMC ECC Control Register
   type ECC_CTRL_Register is record
      --  Write-only. Reset ECC
      RST           : ECC_CTRL_RST_Field := 16#0#;
      --  Write-only. Software Reset
      SWRST         : ECC_CTRL_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_CTRL_Register use record
      RST           at 0 range 0 .. 0;
      SWRST         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ---------------------
   -- ECC_MD_Register --
   ---------------------

   --  ECC Page Size
   type ECC_PAGESIZE_Field is
     (
      --  Main area 512 Bytes + Spare area 16 Bytes = 528 Bytes
      Ps512_16,
      --  Main area 1024 Bytes + Spare area 32 Bytes = 1056 Bytes
      Ps1024_32,
      --  Main area 2048 Bytes + Spare area 64 Bytes = 2112 Bytes
      Ps2048_64,
      --  Main area 4096 Bytes + Spare area 128 Bytes = 4224 Bytes
      Ps4096_128)
     with Size => 2;
   for ECC_PAGESIZE_Field use
     (Ps512_16 => 0,
      Ps1024_32 => 1,
      Ps2048_64 => 2,
      Ps4096_128 => 3);

   --  Type of Correction
   type TYPCORREC_Field is
     (
      --  1 bit correction for a page of 512/1024/2048/4096 Bytes (for 8 or
      --  16-bit NAND Flash)
      Cpage,
      --  1 bit correction for 256 Bytes of data for a page of 512/2048/4096
      --  bytes (for 8-bit NAND Flash only)
      C256B,
      --  1 bit correction for 512 Bytes of data for a page of 512/2048/4096
      --  bytes (for 8-bit NAND Flash only)
      C512B)
     with Size => 2;
   for TYPCORREC_Field use
     (Cpage => 0,
      C256B => 1,
      C512B => 2);

   --  SMC ECC Mode Register
   type ECC_MD_Register is record
      --  ECC Page Size
      ECC_PAGESIZE  : ECC_PAGESIZE_Field := Ps512_16;
      --  unspecified
      Reserved_2_3  : ATSAM3X8E.UInt2 := 16#0#;
      --  Type of Correction
      TYPCORREC     : TYPCORREC_Field := Cpage;
      --  unspecified
      Reserved_6_31 : ATSAM3X8E.UInt26 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_MD_Register use record
      ECC_PAGESIZE  at 0 range 0 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      TYPCORREC     at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   ---------------------
   -- ECC_SR_Register --
   ---------------------

   subtype ECC_SR1_RECERR0_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR0_Field is ATSAM3X8E.UInt2;
   subtype ECC_SR1_RECERR1_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR1_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_MULERR1_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_RECERR2_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR2_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_MULERR2_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_RECERR3_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR3_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_MULERR3_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_RECERR4_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR4_Field is ATSAM3X8E.UInt2;
   subtype ECC_SR1_RECERR5_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR5_Field is ATSAM3X8E.UInt2;
   subtype ECC_SR1_RECERR6_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR6_Field is ATSAM3X8E.UInt2;
   subtype ECC_SR1_RECERR7_Field is ATSAM3X8E.Bit;
   subtype ECC_SR1_ECCERR7_Field is ATSAM3X8E.UInt2;

   --  SMC ECC Status 1 Register
   type ECC_SR_Register is record
      --  Read-only. Recoverable Error
      RECERR0        : ECC_SR1_RECERR0_Field := 16#0#;
      --  Read-only. ECC Error
      ECCERR0        : ECC_SR1_ECCERR0_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 256th and the
      --  511th bytes or the 512nd and the 1023rd bytes
      RECERR1        : ECC_SR1_RECERR1_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 256th and the 511th
      --  bytes or between the 512nd and the 1023rd bytes
      ECCERR1        : ECC_SR1_ECCERR1_Field := 16#0#;
      --  Read-only. Multiple Error in the page between the 256th and the 511th
      --  bytes or between the 512nd and the 1023rd bytes
      MULERR1        : ECC_SR1_MULERR1_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 512nd and the
      --  767th bytes or between the 1024th and the 1535th bytes
      RECERR2        : ECC_SR1_RECERR2_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 512nd and the 767th
      --  bytes or between the 1024th and the 1535th bytes
      ECCERR2        : ECC_SR1_ECCERR2_Field := 16#0#;
      --  Read-only. Multiple Error in the page between the 512nd and the 767th
      --  bytes or between the 1024th and the 1535th bytes
      MULERR2        : ECC_SR1_MULERR2_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 768th and the
      --  1023rd bytes or between the 1536th and the 2047th bytes
      RECERR3        : ECC_SR1_RECERR3_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 768th and the 1023rd
      --  bytes or between the 1536th and the 2047th bytes
      ECCERR3        : ECC_SR1_ECCERR3_Field := 16#0#;
      --  Read-only. Multiple Error in the page between the 768th and the
      --  1023rd bytes or between the 1536th and the 2047th bytes
      MULERR3        : ECC_SR1_MULERR3_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 1024th and the
      --  1279th bytes or between the 2048th and the 2559th bytes
      RECERR4        : ECC_SR1_RECERR4_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 1024th and the 1279th
      --  bytes or between the 2048th and the 2559th bytes
      ECCERR4        : ECC_SR1_ECCERR4_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 1280th and the
      --  1535th bytes or between the 2560th and the 3071st bytes
      RECERR5        : ECC_SR1_RECERR5_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 1280th and the 1535th
      --  bytes or between the 2560th and the 3071st bytes
      ECCERR5        : ECC_SR1_ECCERR5_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 1536th and the
      --  1791st bytes or between the 3072nd and the 3583rd bytes
      RECERR6        : ECC_SR1_RECERR6_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 1536th and the 1791st
      --  bytes or between the 3072nd and the 3583rd bytes
      ECCERR6        : ECC_SR1_ECCERR6_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : ATSAM3X8E.Bit;
      --  Read-only. Recoverable Error in the page between the 1792nd and the
      --  2047th bytes or between the 3584th and the 4095th bytes
      RECERR7        : ECC_SR1_RECERR7_Field := 16#0#;
      --  Read-only. ECC Error in the page between the 1792nd and the 2047th
      --  bytes or between the 3584th and the 4095th bytes
      ECCERR7        : ECC_SR1_ECCERR7_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_SR_Register use record
      RECERR0        at 0 range 0 .. 0;
      ECCERR0        at 0 range 1 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      RECERR1        at 0 range 4 .. 4;
      ECCERR1        at 0 range 5 .. 5;
      MULERR1        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      RECERR2        at 0 range 8 .. 8;
      ECCERR2        at 0 range 9 .. 9;
      MULERR2        at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      RECERR3        at 0 range 12 .. 12;
      ECCERR3        at 0 range 13 .. 13;
      MULERR3        at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      RECERR4        at 0 range 16 .. 16;
      ECCERR4        at 0 range 17 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      RECERR5        at 0 range 20 .. 20;
      ECCERR5        at 0 range 21 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      RECERR6        at 0 range 24 .. 24;
      ECCERR6        at 0 range 25 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      RECERR7        at 0 range 28 .. 28;
      ECCERR7        at 0 range 29 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ----------------------
   -- ECC_PR0_Register --
   ----------------------

   subtype ECC_PR0_BITADDR_Field is ATSAM3X8E.UInt4;
   subtype ECC_PR0_WORDADDR_Field is ATSAM3X8E.UInt12;

   --  SMC ECC Parity 0 Register
   type ECC_PR0_Register is record
      --  Read-only. Bit Address
      BITADDR        : ECC_PR0_BITADDR_Field := 16#0#;
      --  Read-only. Word Address
      WORDADDR       : ECC_PR0_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR0_Register use record
      BITADDR        at 0 range 0 .. 3;
      WORDADDR       at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ----------------------------
   -- ECC_PR0_W9BIT_Register --
   ----------------------------

   subtype ECC_PR0_W9BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR0_W9BIT_WORDADDR_Field is ATSAM3X8E.UInt9;
   subtype ECC_PR0_W9BIT_NPARITY_Field is ATSAM3X8E.UInt12;

   --  SMC ECC Parity 0 Register
   type ECC_PR0_W9BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 512) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR0_W9BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 512) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR0_W9BIT_WORDADDR_Field := 16#0#;
      --  Read-only. Parity N
      NPARITY        : ECC_PR0_W9BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR0_W9BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 11;
      NPARITY        at 0 range 12 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------------
   -- ECC_PR0_W8BIT_Register --
   ----------------------------

   subtype ECC_PR0_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR0_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR0_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC Parity 0 Register
   type ECC_PR0_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR0_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR0_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR0_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR0_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ----------------------
   -- ECC_PR1_Register --
   ----------------------

   subtype ECC_PR1_NPARITY_Field is ATSAM3X8E.Short;

   --  SMC ECC parity 1 Register
   type ECC_PR1_Register is record
      --  Read-only. Parity N
      NPARITY        : ECC_PR1_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR1_Register use record
      NPARITY        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ----------------------------
   -- ECC_PR1_W9BIT_Register --
   ----------------------------

   subtype ECC_PR1_W9BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR1_W9BIT_WORDADDR_Field is ATSAM3X8E.UInt9;
   subtype ECC_PR1_W9BIT_NPARITY_Field is ATSAM3X8E.UInt12;

   --  SMC ECC parity 1 Register
   type ECC_PR1_W9BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 512) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR1_W9BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 512) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR1_W9BIT_WORDADDR_Field := 16#0#;
      --  Read-only. Parity N
      NPARITY        : ECC_PR1_W9BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR1_W9BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 11;
      NPARITY        at 0 range 12 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------------
   -- ECC_PR1_W8BIT_Register --
   ----------------------------

   subtype ECC_PR1_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR1_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR1_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 1 Register
   type ECC_PR1_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR1_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR1_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR1_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR1_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ---------------------
   -- ECC_PR_Register --
   ---------------------

   subtype ECC_PR2_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR2_WORDADDR_Field is ATSAM3X8E.UInt9;
   subtype ECC_PR2_NPARITY_Field is ATSAM3X8E.UInt12;

   --  SMC ECC parity 2 Register
   type ECC_PR_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 512) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR2_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 512) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR2_WORDADDR_Field := 16#0#;
      --  Read-only. Parity N
      NPARITY        : ECC_PR2_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 11;
      NPARITY        at 0 range 12 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------------
   -- ECC_PR2_W8BIT_Register --
   ----------------------------

   subtype ECC_PR2_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR2_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR2_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 2 Register
   type ECC_PR2_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR2_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR2_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR2_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR2_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ----------------------------
   -- ECC_PR3_W8BIT_Register --
   ----------------------------

   subtype ECC_PR3_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR3_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR3_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 3 Register
   type ECC_PR3_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR3_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR3_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR3_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR3_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ----------------------------
   -- ECC_PR4_W8BIT_Register --
   ----------------------------

   subtype ECC_PR4_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR4_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR4_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 4 Register
   type ECC_PR4_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR4_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR4_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR4_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR4_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ----------------------------
   -- ECC_PR5_W8BIT_Register --
   ----------------------------

   subtype ECC_PR5_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR5_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR5_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 5 Register
   type ECC_PR5_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR5_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR5_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR5_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR5_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ----------------------------
   -- ECC_PR6_W8BIT_Register --
   ----------------------------

   subtype ECC_PR6_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR6_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR6_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 6 Register
   type ECC_PR6_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR6_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR6_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR6_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR6_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ----------------------------
   -- ECC_PR7_W8BIT_Register --
   ----------------------------

   subtype ECC_PR7_W8BIT_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR7_W8BIT_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR7_W8BIT_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 7 Register
   type ECC_PR7_W8BIT_Register is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR7_W8BIT_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR7_W8BIT_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR7_W8BIT_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR7_W8BIT_Register use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   ---------------------
   -- ECC_PR_Register --
   ---------------------

   subtype ECC_PR8_BITADDR_Field is ATSAM3X8E.UInt3;
   subtype ECC_PR8_WORDADDR_Field is ATSAM3X8E.Byte;
   subtype ECC_PR8_NPARITY_Field is ATSAM3X8E.UInt11;

   --  SMC ECC parity 8 Register
   type ECC_PR_Register_1 is record
      --  Read-only. Corrupted Bit Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      BITADDR        : ECC_PR8_BITADDR_Field := 16#0#;
      --  Read-only. Corrupted Word Address in the Page between (i x 256) and
      --  ((i + 1) x 512) - 1) Bytes
      WORDADDR       : ECC_PR8_WORDADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit;
      --  Read-only. Parity N
      NPARITY        : ECC_PR8_NPARITY_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECC_PR_Register_1 use record
      BITADDR        at 0 range 0 .. 2;
      WORDADDR       at 0 range 3 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      NPARITY        at 0 range 12 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --------------------
   -- SETUP_Register --
   --------------------

   subtype SETUP0_NWE_SETUP_Field is ATSAM3X8E.UInt6;
   subtype SETUP0_NCS_WR_SETUP_Field is ATSAM3X8E.UInt6;
   subtype SETUP0_NRD_SETUP_Field is ATSAM3X8E.UInt6;
   subtype SETUP0_NCS_RD_SETUP_Field is ATSAM3X8E.UInt6;

   --  SMC Setup Register (CS_number = 0)
   type SETUP_Register is record
      --  NWE Setup Length
      NWE_SETUP      : SETUP0_NWE_SETUP_Field := 16#1#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  NCS Setup Length in Write Access
      NCS_WR_SETUP   : SETUP0_NCS_WR_SETUP_Field := 16#1#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  NRD Setup Length
      NRD_SETUP      : SETUP0_NRD_SETUP_Field := 16#1#;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2 := 16#0#;
      --  NCS Setup Length in Read Access
      NCS_RD_SETUP   : SETUP0_NCS_RD_SETUP_Field := 16#1#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SETUP_Register use record
      NWE_SETUP      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      NCS_WR_SETUP   at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      NRD_SETUP      at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      NCS_RD_SETUP   at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --------------------
   -- PULSE_Register --
   --------------------

   subtype PULSE0_NWE_PULSE_Field is ATSAM3X8E.UInt6;
   subtype PULSE0_NCS_WR_PULSE_Field is ATSAM3X8E.UInt6;
   subtype PULSE0_NRD_PULSE_Field is ATSAM3X8E.UInt6;
   subtype PULSE0_NCS_RD_PULSE_Field is ATSAM3X8E.UInt6;

   --  SMC Pulse Register (CS_number = 0)
   type PULSE_Register is record
      --  NWE Pulse Length
      NWE_PULSE      : PULSE0_NWE_PULSE_Field := 16#1#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  NCS Pulse Length in WRITE Access
      NCS_WR_PULSE   : PULSE0_NCS_WR_PULSE_Field := 16#1#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  NRD Pulse Length
      NRD_PULSE      : PULSE0_NRD_PULSE_Field := 16#1#;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2 := 16#0#;
      --  NCS Pulse Length in READ Access
      NCS_RD_PULSE   : PULSE0_NCS_RD_PULSE_Field := 16#1#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PULSE_Register use record
      NWE_PULSE      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      NCS_WR_PULSE   at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      NRD_PULSE      at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      NCS_RD_PULSE   at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --------------------
   -- CYCLE_Register --
   --------------------

   subtype CYCLE0_NWE_CYCLE_Field is ATSAM3X8E.UInt9;
   subtype CYCLE0_NRD_CYCLE_Field is ATSAM3X8E.UInt9;

   --  SMC Cycle Register (CS_number = 0)
   type CYCLE_Register is record
      --  Total Write Cycle Length
      NWE_CYCLE      : CYCLE0_NWE_CYCLE_Field := 16#3#;
      --  unspecified
      Reserved_9_15  : ATSAM3X8E.UInt7 := 16#0#;
      --  Total Read Cycle Length
      NRD_CYCLE      : CYCLE0_NRD_CYCLE_Field := 16#3#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CYCLE_Register use record
      NWE_CYCLE      at 0 range 0 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      NRD_CYCLE      at 0 range 16 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ----------------------
   -- TIMINGS_Register --
   ----------------------

   subtype TIMINGS0_TCLR_Field is ATSAM3X8E.UInt4;
   subtype TIMINGS0_TADL_Field is ATSAM3X8E.UInt4;
   subtype TIMINGS0_TAR_Field is ATSAM3X8E.UInt4;
   subtype TIMINGS0_OCMS_Field is ATSAM3X8E.Bit;
   subtype TIMINGS0_TRR_Field is ATSAM3X8E.UInt4;
   subtype TIMINGS0_TWB_Field is ATSAM3X8E.UInt4;
   subtype TIMINGS0_RBNSEL_Field is ATSAM3X8E.UInt3;
   subtype TIMINGS0_NFSEL_Field is ATSAM3X8E.Bit;

   --  SMC Timings Register (CS_number = 0)
   type TIMINGS_Register is record
      --  CLE to REN Low Delay
      TCLR           : TIMINGS0_TCLR_Field := 16#0#;
      --  ALE to Data Start
      TADL           : TIMINGS0_TADL_Field := 16#0#;
      --  ALE to REN Low Delay
      TAR            : TIMINGS0_TAR_Field := 16#0#;
      --  Off Chip Memory Scrambling Enable
      OCMS           : TIMINGS0_OCMS_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Ready to REN Low Delay
      TRR            : TIMINGS0_TRR_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  WEN High to REN to Busy
      TWB            : TIMINGS0_TWB_Field := 16#0#;
      --  Ready/Busy Line Selection
      RBNSEL         : TIMINGS0_RBNSEL_Field := 16#0#;
      --  NAND Flash Selection
      NFSEL          : TIMINGS0_NFSEL_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TIMINGS_Register use record
      TCLR           at 0 range 0 .. 3;
      TADL           at 0 range 4 .. 7;
      TAR            at 0 range 8 .. 11;
      OCMS           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TRR            at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      TWB            at 0 range 24 .. 27;
      RBNSEL         at 0 range 28 .. 30;
      NFSEL          at 0 range 31 .. 31;
   end record;

   -------------------
   -- MODE_Register --
   -------------------

   type READ_MODE_Field is
     (
      --  The Read operation is controlled by the NCS signal.
      Ncs_Ctrl,
      --  The Read operation is controlled by the NRD signal.
      Nrd_Ctrl)
     with Size => 1;
   for READ_MODE_Field use
     (Ncs_Ctrl => 0,
      Nrd_Ctrl => 1);

   type WRITE_MODE_Field is
     (
      --  The Write operation is controller by the NCS signal.
      Ncs_Ctrl,
      --  The Write operation is controlled by the NWE signal.
      Nwe_Ctrl)
     with Size => 1;
   for WRITE_MODE_Field use
     (Ncs_Ctrl => 0,
      Nwe_Ctrl => 1);

   --  NWAIT Mode
   type EXNW_MODE_Field is
     (
      --  Disabled
      Disabled,
      --  Frozen Mode
      Frozen,
      --  Ready Mode
      Ready)
     with Size => 2;
   for EXNW_MODE_Field use
     (Disabled => 0,
      Frozen => 2,
      Ready => 3);

   subtype MODE0_BAT_Field is ATSAM3X8E.Bit;

   --  Data Bus Width
   type DBW_Field is
     (
      --  8-bit bus
      Bit_8,
      --  16-bit bus
      Bit_16)
     with Size => 1;
   for DBW_Field use
     (Bit_8 => 0,
      Bit_16 => 1);

   subtype MODE0_TDF_CYCLES_Field is ATSAM3X8E.UInt4;
   subtype MODE0_TDF_MODE_Field is ATSAM3X8E.Bit;

   --  SMC Mode Register (CS_number = 0)
   type MODE_Register is record
      READ_MODE      : READ_MODE_Field := Nrd_Ctrl;
      WRITE_MODE     : WRITE_MODE_Field := Nwe_Ctrl;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  NWAIT Mode
      EXNW_MODE      : EXNW_MODE_Field := Disabled;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Byte Access Type
      BAT            : MODE0_BAT_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : ATSAM3X8E.UInt3 := 16#0#;
      --  Data Bus Width
      DBW            : DBW_Field := Bit_8;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Data Float Time
      TDF_CYCLES     : MODE0_TDF_CYCLES_Field := 16#0#;
      --  TDF Optimization
      TDF_MODE       : MODE0_TDF_MODE_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : ATSAM3X8E.UInt11 := 16#80#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MODE_Register use record
      READ_MODE      at 0 range 0 .. 0;
      WRITE_MODE     at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      EXNW_MODE      at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      BAT            at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      DBW            at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TDF_CYCLES     at 0 range 16 .. 19;
      TDF_MODE       at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   -------------------
   -- OCMS_Register --
   -------------------

   subtype OCMS_SMSE_Field is ATSAM3X8E.Bit;
   subtype OCMS_SRSE_Field is ATSAM3X8E.Bit;

   --  SMC OCMS Register
   type OCMS_Register is record
      --  Static Memory Controller Scrambling Enable
      SMSE          : OCMS_SMSE_Field := 16#0#;
      --  SRAM Scrambling Enable
      SRSE          : OCMS_SRSE_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OCMS_Register use record
      SMSE          at 0 range 0 .. 0;
      SRSE          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -------------------
   -- WPCR_Register --
   -------------------

   subtype WPCR_WP_EN_Field is ATSAM3X8E.Bit;
   subtype WPCR_WP_KEY_Field is ATSAM3X8E.UInt24;

   --  Write Protection Control Register
   type WPCR_Register is record
      --  Write-only. Write Protection Enable
      WP_EN        : WPCR_WP_EN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write-only. Write Protection KEY password
      WP_KEY       : WPCR_WP_KEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPCR_Register use record
      WP_EN        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WP_KEY       at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPSR_Register --
   -------------------

   subtype WPSR_WP_VS_Field is ATSAM3X8E.UInt4;
   subtype WPSR_WP_VSRC_Field is ATSAM3X8E.Short;

   --  Write Protection Status Register
   type WPSR_Register is record
      --  Read-only. Write Protection Violation Status
      WP_VS          : WPSR_WP_VS_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Write Protection Violation Source
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

   -----------------
   -- Peripherals --
   -----------------

   --  Static Memory Controller
   type SMC_Peripheral is record
      --  SMC NFC Configuration Register
      CFG      : CFG_Register;
      --  SMC NFC Control Register
      CTRL     : CTRL_Register;
      --  SMC NFC Status Register
      SR       : SR_Register;
      --  SMC NFC Interrupt Enable Register
      IER      : IER_Register;
      --  SMC NFC Interrupt Disable Register
      IDR      : IDR_Register;
      --  SMC NFC Interrupt Mask Register
      IMR      : IMR_Register;
      --  SMC NFC Address Cycle Zero Register
      ADDR     : ADDR_Register;
      --  SMC Bank Address Register
      BANK     : BANK_Register;
      --  SMC ECC Control Register
      ECC_CTRL : ECC_CTRL_Register;
      --  SMC ECC Mode Register
      ECC_MD   : ECC_MD_Register;
      --  SMC ECC Status 1 Register
      ECC_SR1  : ECC_SR_Register;
      --  SMC ECC Parity 0 Register
      ECC_PR0  : ECC_PR0_Register;
      --  SMC ECC parity 1 Register
      ECC_PR1  : ECC_PR1_Register;
      --  SMC ECC status 2 Register
      ECC_SR2  : ECC_SR_Register;
      --  SMC ECC parity 2 Register
      ECC_PR2  : ECC_PR_Register;
      --  SMC ECC parity 3 Register
      ECC_PR3  : ECC_PR_Register;
      --  SMC ECC parity 4 Register
      ECC_PR4  : ECC_PR_Register;
      --  SMC ECC parity 5 Register
      ECC_PR5  : ECC_PR_Register;
      --  SMC ECC parity 6 Register
      ECC_PR6  : ECC_PR_Register;
      --  SMC ECC parity 7 Register
      ECC_PR7  : ECC_PR_Register;
      --  SMC ECC parity 8 Register
      ECC_PR8  : ECC_PR_Register_1;
      --  SMC ECC parity 9 Register
      ECC_PR9  : ECC_PR_Register_1;
      --  SMC ECC parity 10 Register
      ECC_PR10 : ECC_PR_Register_1;
      --  SMC ECC parity 11 Register
      ECC_PR11 : ECC_PR_Register_1;
      --  SMC ECC parity 12 Register
      ECC_PR12 : ECC_PR_Register_1;
      --  SMC ECC parity 13 Register
      ECC_PR13 : ECC_PR_Register_1;
      --  SMC ECC parity 14 Register
      ECC_PR14 : ECC_PR_Register_1;
      --  SMC ECC parity 15 Register
      ECC_PR15 : ECC_PR_Register_1;
      --  SMC Setup Register (CS_number = 0)
      SETUP0   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 0)
      PULSE0   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 0)
      CYCLE0   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 0)
      TIMINGS0 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 0)
      MODE0    : MODE_Register;
      --  SMC Setup Register (CS_number = 1)
      SETUP1   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 1)
      PULSE1   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 1)
      CYCLE1   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 1)
      TIMINGS1 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 1)
      MODE1    : MODE_Register;
      --  SMC Setup Register (CS_number = 2)
      SETUP2   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 2)
      PULSE2   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 2)
      CYCLE2   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 2)
      TIMINGS2 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 2)
      MODE2    : MODE_Register;
      --  SMC Setup Register (CS_number = 3)
      SETUP3   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 3)
      PULSE3   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 3)
      CYCLE3   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 3)
      TIMINGS3 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 3)
      MODE3    : MODE_Register;
      --  SMC Setup Register (CS_number = 4)
      SETUP4   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 4)
      PULSE4   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 4)
      CYCLE4   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 4)
      TIMINGS4 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 4)
      MODE4    : MODE_Register;
      --  SMC Setup Register (CS_number = 5)
      SETUP5   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 5)
      PULSE5   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 5)
      CYCLE5   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 5)
      TIMINGS5 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 5)
      MODE5    : MODE_Register;
      --  SMC Setup Register (CS_number = 6)
      SETUP6   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 6)
      PULSE6   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 6)
      CYCLE6   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 6)
      TIMINGS6 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 6)
      MODE6    : MODE_Register;
      --  SMC Setup Register (CS_number = 7)
      SETUP7   : SETUP_Register;
      --  SMC Pulse Register (CS_number = 7)
      PULSE7   : PULSE_Register;
      --  SMC Cycle Register (CS_number = 7)
      CYCLE7   : CYCLE_Register;
      --  SMC Timings Register (CS_number = 7)
      TIMINGS7 : TIMINGS_Register;
      --  SMC Mode Register (CS_number = 7)
      MODE7    : MODE_Register;
      --  SMC OCMS Register
      OCMS     : OCMS_Register;
      --  SMC OCMS KEY1 Register
      KEY1     : ATSAM3X8E.Word;
      --  SMC OCMS KEY2 Register
      KEY2     : ATSAM3X8E.Word;
      --  Write Protection Control Register
      WPCR     : WPCR_Register;
      --  Write Protection Status Register
      WPSR     : WPSR_Register;
   end record
     with Volatile;

   for SMC_Peripheral use record
      CFG      at 0 range 0 .. 31;
      CTRL     at 4 range 0 .. 31;
      SR       at 8 range 0 .. 31;
      IER      at 12 range 0 .. 31;
      IDR      at 16 range 0 .. 31;
      IMR      at 20 range 0 .. 31;
      ADDR     at 24 range 0 .. 31;
      BANK     at 28 range 0 .. 31;
      ECC_CTRL at 32 range 0 .. 31;
      ECC_MD   at 36 range 0 .. 31;
      ECC_SR1  at 40 range 0 .. 31;
      ECC_PR0  at 44 range 0 .. 31;
      ECC_PR1  at 48 range 0 .. 31;
      ECC_SR2  at 52 range 0 .. 31;
      ECC_PR2  at 56 range 0 .. 31;
      ECC_PR3  at 60 range 0 .. 31;
      ECC_PR4  at 64 range 0 .. 31;
      ECC_PR5  at 68 range 0 .. 31;
      ECC_PR6  at 72 range 0 .. 31;
      ECC_PR7  at 76 range 0 .. 31;
      ECC_PR8  at 80 range 0 .. 31;
      ECC_PR9  at 84 range 0 .. 31;
      ECC_PR10 at 88 range 0 .. 31;
      ECC_PR11 at 92 range 0 .. 31;
      ECC_PR12 at 96 range 0 .. 31;
      ECC_PR13 at 100 range 0 .. 31;
      ECC_PR14 at 104 range 0 .. 31;
      ECC_PR15 at 108 range 0 .. 31;
      SETUP0   at 112 range 0 .. 31;
      PULSE0   at 116 range 0 .. 31;
      CYCLE0   at 120 range 0 .. 31;
      TIMINGS0 at 124 range 0 .. 31;
      MODE0    at 128 range 0 .. 31;
      SETUP1   at 132 range 0 .. 31;
      PULSE1   at 136 range 0 .. 31;
      CYCLE1   at 140 range 0 .. 31;
      TIMINGS1 at 144 range 0 .. 31;
      MODE1    at 148 range 0 .. 31;
      SETUP2   at 152 range 0 .. 31;
      PULSE2   at 156 range 0 .. 31;
      CYCLE2   at 160 range 0 .. 31;
      TIMINGS2 at 164 range 0 .. 31;
      MODE2    at 168 range 0 .. 31;
      SETUP3   at 172 range 0 .. 31;
      PULSE3   at 176 range 0 .. 31;
      CYCLE3   at 180 range 0 .. 31;
      TIMINGS3 at 184 range 0 .. 31;
      MODE3    at 188 range 0 .. 31;
      SETUP4   at 192 range 0 .. 31;
      PULSE4   at 196 range 0 .. 31;
      CYCLE4   at 200 range 0 .. 31;
      TIMINGS4 at 204 range 0 .. 31;
      MODE4    at 208 range 0 .. 31;
      SETUP5   at 212 range 0 .. 31;
      PULSE5   at 216 range 0 .. 31;
      CYCLE5   at 220 range 0 .. 31;
      TIMINGS5 at 224 range 0 .. 31;
      MODE5    at 228 range 0 .. 31;
      SETUP6   at 232 range 0 .. 31;
      PULSE6   at 236 range 0 .. 31;
      CYCLE6   at 240 range 0 .. 31;
      TIMINGS6 at 244 range 0 .. 31;
      MODE6    at 248 range 0 .. 31;
      SETUP7   at 252 range 0 .. 31;
      PULSE7   at 256 range 0 .. 31;
      CYCLE7   at 260 range 0 .. 31;
      TIMINGS7 at 264 range 0 .. 31;
      MODE7    at 268 range 0 .. 31;
      OCMS     at 272 range 0 .. 31;
      KEY1     at 276 range 0 .. 31;
      KEY2     at 280 range 0 .. 31;
      WPCR     at 484 range 0 .. 31;
      WPSR     at 488 range 0 .. 31;
   end record;

   --  Static Memory Controller
   SMC_Periph : aliased SMC_Peripheral
     with Import, Address => SMC_Base;

end ATSAM3X8E.EBI;
