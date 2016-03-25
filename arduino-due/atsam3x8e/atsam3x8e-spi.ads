--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.SPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_SPIEN_Field is ATSAM3X8E.Bit;
   subtype CR_SPIDIS_Field is ATSAM3X8E.Bit;
   subtype CR_SWRST_Field is ATSAM3X8E.Bit;
   subtype CR_LASTXFER_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  Write-only. SPI Enable
      SPIEN          : CR_SPIEN_Field := 16#0#;
      --  Write-only. SPI Disable
      SPIDIS         : CR_SPIDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_6   : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. SPI Software Reset
      SWRST          : CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_8_23  : ATSAM3X8E.Short := 16#0#;
      --  Write-only. Last Transfer
      LASTXFER       : CR_LASTXFER_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      SPIEN          at 0 range 0 .. 0;
      SPIDIS         at 0 range 1 .. 1;
      Reserved_2_6   at 0 range 2 .. 6;
      SWRST          at 0 range 7 .. 7;
      Reserved_8_23  at 0 range 8 .. 23;
      LASTXFER       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   subtype MR_MSTR_Field is ATSAM3X8E.Bit;
   subtype MR_PS_Field is ATSAM3X8E.Bit;
   subtype MR_PCSDEC_Field is ATSAM3X8E.Bit;
   subtype MR_MODFDIS_Field is ATSAM3X8E.Bit;
   subtype MR_WDRBT_Field is ATSAM3X8E.Bit;
   subtype MR_LLB_Field is ATSAM3X8E.Bit;
   subtype MR_PCS_Field is ATSAM3X8E.UInt4;
   subtype MR_DLYBCS_Field is ATSAM3X8E.Byte;

   --  Mode Register
   type MR_Register is record
      --  Master/Slave Mode
      MSTR           : MR_MSTR_Field := 16#0#;
      --  Peripheral Select
      PS             : MR_PS_Field := 16#0#;
      --  Chip Select Decode
      PCSDEC         : MR_PCSDEC_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Mode Fault Detection
      MODFDIS        : MR_MODFDIS_Field := 16#0#;
      --  Wait Data Read Before Transfer
      WDRBT          : MR_WDRBT_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit := 16#0#;
      --  Local Loopback Enable
      LLB            : MR_LLB_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Peripheral Chip Select
      PCS            : MR_PCS_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Delay Between Chip Selects
      DLYBCS         : MR_DLYBCS_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      MSTR           at 0 range 0 .. 0;
      PS             at 0 range 1 .. 1;
      PCSDEC         at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      MODFDIS        at 0 range 4 .. 4;
      WDRBT          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      LLB            at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      PCS            at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      DLYBCS         at 0 range 24 .. 31;
   end record;

   ------------------
   -- RDR_Register --
   ------------------

   subtype RDR_RD_Field is ATSAM3X8E.Short;
   subtype RDR_PCS_Field is ATSAM3X8E.UInt4;

   --  Receive Data Register
   type RDR_Register is record
      --  Read-only. Receive Data
      RD             : RDR_RD_Field := 16#0#;
      --  Read-only. Peripheral Chip Select
      PCS            : RDR_PCS_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RDR_Register use record
      RD             at 0 range 0 .. 15;
      PCS            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   ------------------
   -- TDR_Register --
   ------------------

   subtype TDR_TD_Field is ATSAM3X8E.Short;
   subtype TDR_PCS_Field is ATSAM3X8E.UInt4;
   subtype TDR_LASTXFER_Field is ATSAM3X8E.Bit;

   --  Transmit Data Register
   type TDR_Register is record
      --  Write-only. Transmit Data
      TD             : TDR_TD_Field := 16#0#;
      --  Write-only. Peripheral Chip Select
      PCS            : TDR_PCS_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Last Transfer
      LASTXFER       : TDR_LASTXFER_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TDR_Register use record
      TD             at 0 range 0 .. 15;
      PCS            at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      LASTXFER       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_RDRF_Field is ATSAM3X8E.Bit;
   subtype SR_TDRE_Field is ATSAM3X8E.Bit;
   subtype SR_MODF_Field is ATSAM3X8E.Bit;
   subtype SR_OVRES_Field is ATSAM3X8E.Bit;
   subtype SR_NSSR_Field is ATSAM3X8E.Bit;
   subtype SR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SR_UNDES_Field is ATSAM3X8E.Bit;
   subtype SR_SPIENS_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. Receive Data Register Full
      RDRF           : SR_RDRF_Field := 16#0#;
      --  Read-only. Transmit Data Register Empty
      TDRE           : SR_TDRE_Field := 16#0#;
      --  Read-only. Mode Fault Error
      MODF           : SR_MODF_Field := 16#0#;
      --  Read-only. Overrun Error Status
      OVRES          : SR_OVRES_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. NSS Rising
      NSSR           : SR_NSSR_Field := 16#0#;
      --  Read-only. Transmission Registers Empty
      TXEMPTY        : SR_TXEMPTY_Field := 16#0#;
      --  Read-only. Underrun Error Status (Slave Mode Only)
      UNDES          : SR_UNDES_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5;
      --  Read-only. SPI Enable Status
      SPIENS         : SR_SPIENS_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      RDRF           at 0 range 0 .. 0;
      TDRE           at 0 range 1 .. 1;
      MODF           at 0 range 2 .. 2;
      OVRES          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      NSSR           at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNDES          at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      SPIENS         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_RDRF_Field is ATSAM3X8E.Bit;
   subtype IER_TDRE_Field is ATSAM3X8E.Bit;
   subtype IER_MODF_Field is ATSAM3X8E.Bit;
   subtype IER_OVRES_Field is ATSAM3X8E.Bit;
   subtype IER_NSSR_Field is ATSAM3X8E.Bit;
   subtype IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_UNDES_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Receive Data Register Full Interrupt Enable
      RDRF           : IER_RDRF_Field := 16#0#;
      --  Write-only. SPI Transmit Data Register Empty Interrupt Enable
      TDRE           : IER_TDRE_Field := 16#0#;
      --  Write-only. Mode Fault Error Interrupt Enable
      MODF           : IER_MODF_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRES          : IER_OVRES_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. NSS Rising Interrupt Enable
      NSSR           : IER_NSSR_Field := 16#0#;
      --  Write-only. Transmission Registers Empty Enable
      TXEMPTY        : IER_TXEMPTY_Field := 16#0#;
      --  Write-only. Underrun Error Interrupt Enable
      UNDES          : IER_UNDES_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      RDRF           at 0 range 0 .. 0;
      TDRE           at 0 range 1 .. 1;
      MODF           at 0 range 2 .. 2;
      OVRES          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      NSSR           at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNDES          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_RDRF_Field is ATSAM3X8E.Bit;
   subtype IDR_TDRE_Field is ATSAM3X8E.Bit;
   subtype IDR_MODF_Field is ATSAM3X8E.Bit;
   subtype IDR_OVRES_Field is ATSAM3X8E.Bit;
   subtype IDR_NSSR_Field is ATSAM3X8E.Bit;
   subtype IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_UNDES_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Receive Data Register Full Interrupt Disable
      RDRF           : IDR_RDRF_Field := 16#0#;
      --  Write-only. SPI Transmit Data Register Empty Interrupt Disable
      TDRE           : IDR_TDRE_Field := 16#0#;
      --  Write-only. Mode Fault Error Interrupt Disable
      MODF           : IDR_MODF_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRES          : IDR_OVRES_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. NSS Rising Interrupt Disable
      NSSR           : IDR_NSSR_Field := 16#0#;
      --  Write-only. Transmission Registers Empty Disable
      TXEMPTY        : IDR_TXEMPTY_Field := 16#0#;
      --  Write-only. Underrun Error Interrupt Disable
      UNDES          : IDR_UNDES_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      RDRF           at 0 range 0 .. 0;
      TDRE           at 0 range 1 .. 1;
      MODF           at 0 range 2 .. 2;
      OVRES          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      NSSR           at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNDES          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_RDRF_Field is ATSAM3X8E.Bit;
   subtype IMR_TDRE_Field is ATSAM3X8E.Bit;
   subtype IMR_MODF_Field is ATSAM3X8E.Bit;
   subtype IMR_OVRES_Field is ATSAM3X8E.Bit;
   subtype IMR_NSSR_Field is ATSAM3X8E.Bit;
   subtype IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_UNDES_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Receive Data Register Full Interrupt Mask
      RDRF           : IMR_RDRF_Field := 16#0#;
      --  Read-only. SPI Transmit Data Register Empty Interrupt Mask
      TDRE           : IMR_TDRE_Field := 16#0#;
      --  Read-only. Mode Fault Error Interrupt Mask
      MODF           : IMR_MODF_Field := 16#0#;
      --  Read-only. Overrun Error Interrupt Mask
      OVRES          : IMR_OVRES_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. NSS Rising Interrupt Mask
      NSSR           : IMR_NSSR_Field := 16#0#;
      --  Read-only. Transmission Registers Empty Mask
      TXEMPTY        : IMR_TXEMPTY_Field := 16#0#;
      --  Read-only. Underrun Error Interrupt Mask
      UNDES          : IMR_UNDES_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      RDRF           at 0 range 0 .. 0;
      TDRE           at 0 range 1 .. 1;
      MODF           at 0 range 2 .. 2;
      OVRES          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      NSSR           at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNDES          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ------------------
   -- CSR_Register --
   ------------------

   subtype CSR_CPOL_Field is ATSAM3X8E.Bit;
   subtype CSR_NCPHA_Field is ATSAM3X8E.Bit;
   subtype CSR_CSNAAT_Field is ATSAM3X8E.Bit;
   subtype CSR_CSAAT_Field is ATSAM3X8E.Bit;

   --  Bits Per Transfer
   type BITS_Field is
     (
      --  8 bits for transfer
      BITS_Field_8_Bit,
      --  9 bits for transfer
      BITS_Field_9_Bit,
      --  10 bits for transfer
      BITS_Field_10_Bit,
      --  11 bits for transfer
      BITS_Field_11_Bit,
      --  12 bits for transfer
      BITS_Field_12_Bit,
      --  13 bits for transfer
      BITS_Field_13_Bit,
      --  14 bits for transfer
      BITS_Field_14_Bit,
      --  15 bits for transfer
      BITS_Field_15_Bit,
      --  16 bits for transfer
      BITS_Field_16_Bit)
     with Size => 4;
   for BITS_Field use
     (BITS_Field_8_Bit => 0,
      BITS_Field_9_Bit => 1,
      BITS_Field_10_Bit => 2,
      BITS_Field_11_Bit => 3,
      BITS_Field_12_Bit => 4,
      BITS_Field_13_Bit => 5,
      BITS_Field_14_Bit => 6,
      BITS_Field_15_Bit => 7,
      BITS_Field_16_Bit => 8);

   subtype CSR_SCBR_Field is ATSAM3X8E.Byte;
   subtype CSR_DLYBS_Field is ATSAM3X8E.Byte;
   subtype CSR_DLYBCT_Field is ATSAM3X8E.Byte;

   --  Chip Select Register
   type CSR_Register is record
      --  Clock Polarity
      CPOL   : CSR_CPOL_Field := 16#0#;
      --  Clock Phase
      NCPHA  : CSR_NCPHA_Field := 16#0#;
      --  Chip Select Not Active After Transfer (Ignored if CSAAT = 1)
      CSNAAT : CSR_CSNAAT_Field := 16#0#;
      --  Chip Select Active After Transfer
      CSAAT  : CSR_CSAAT_Field := 16#0#;
      --  Bits Per Transfer
      BITS   : BITS_Field := BITS_Field_8_Bit;
      --  Serial Clock Baud Rate
      SCBR   : CSR_SCBR_Field := 16#0#;
      --  Delay Before SPCK
      DLYBS  : CSR_DLYBS_Field := 16#0#;
      --  Delay Between Consecutive Transfers
      DLYBCT : CSR_DLYBCT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      CPOL   at 0 range 0 .. 0;
      NCPHA  at 0 range 1 .. 1;
      CSNAAT at 0 range 2 .. 2;
      CSAAT  at 0 range 3 .. 3;
      BITS   at 0 range 4 .. 7;
      SCBR   at 0 range 8 .. 15;
      DLYBS  at 0 range 16 .. 23;
      DLYBCT at 0 range 24 .. 31;
   end record;

   --  Chip Select Register
   type CSR_Registers is array (0 .. 3) of CSR_Register;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protection Control Register
   type WPMR_Register is record
      --  Write Protection Enable
      WPEN         : WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protection Key Password
      WPKEY        : WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPSR_Register --
   -------------------

   subtype WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype WPSR_WPVSRC_Field is ATSAM3X8E.Byte;

   --  Write Protection Status Register
   type WPSR_Register is record
      --  Read-only. Write Protection Violation Status
      WPVS           : WPSR_WPVS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protection Violation Source
      WPVSRC         : WPSR_WPVSRC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Serial Peripheral Interface 0
   type SPI0_Peripheral is record
      --  Control Register
      CR   : CR_Register;
      --  Mode Register
      MR   : MR_Register;
      --  Receive Data Register
      RDR  : RDR_Register;
      --  Transmit Data Register
      TDR  : TDR_Register;
      --  Status Register
      SR   : SR_Register;
      --  Interrupt Enable Register
      IER  : IER_Register;
      --  Interrupt Disable Register
      IDR  : IDR_Register;
      --  Interrupt Mask Register
      IMR  : IMR_Register;
      --  Chip Select Register
      CSR  : CSR_Registers;
      --  Write Protection Control Register
      WPMR : WPMR_Register;
      --  Write Protection Status Register
      WPSR : WPSR_Register;
   end record
     with Volatile;

   for SPI0_Peripheral use record
      CR   at 0 range 0 .. 31;
      MR   at 4 range 0 .. 31;
      RDR  at 8 range 0 .. 31;
      TDR  at 12 range 0 .. 31;
      SR   at 16 range 0 .. 31;
      IER  at 20 range 0 .. 31;
      IDR  at 24 range 0 .. 31;
      IMR  at 28 range 0 .. 31;
      CSR  at 48 range 0 .. 127;
      WPMR at 228 range 0 .. 31;
      WPSR at 232 range 0 .. 31;
   end record;

   --  Serial Peripheral Interface 0
   SPI0_Periph : aliased SPI0_Peripheral
     with Import, Address => SPI0_Base;

end ATSAM3X8E.SPI;
