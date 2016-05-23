--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Digital-to-Analog Converter Controller
package ATSAM3X8E.DACC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  Write-only. Software Reset
      SWRST         : CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      SWRST         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   --  Trigger Enable
   type TRGEN_Field is
     (
      --  External trigger mode disabled. DACC in free running mode.
      Dis,
      --  External trigger mode enabled.
      En)
     with Size => 1;
   for TRGEN_Field use
     (Dis => 0,
      En => 1);

   subtype MR_TRGSEL_Field is ATSAM3X8E.UInt3;

   --  Word Transfer
   type WORD_Field is
     (
      --  Half-Word transfer
      Half,
      --  Word Transfer
      Word)
     with Size => 1;
   for WORD_Field use
     (Half => 0,
      Word => 1);

   subtype MR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype MR_FASTWKUP_Field is ATSAM3X8E.Bit;
   subtype MR_REFRESH_Field is ATSAM3X8E.Byte;

   --  User Channel Selection
   type USER_SEL_Field is
     (
      --  Channel 0
      Channel0,
      --  Channel 1
      Channel1)
     with Size => 2;
   for USER_SEL_Field use
     (Channel0 => 0,
      Channel1 => 1);

   --  Tag Selection Mode
   type TAG_Field is
     (
      --  Tag selection mode disabled. Using USER_SEL to select the channel for
      --  the conversion.
      Dis,
      --  Tag selection mode enabled
      En)
     with Size => 1;
   for TAG_Field use
     (Dis => 0,
      En => 1);

   --  Max Speed Mode
   type MAXS_Field is
     (
      --  Normal Mode
      Normal,
      --  Max Speed Mode enabled
      Maximum)
     with Size => 1;
   for MAXS_Field use
     (Normal => 0,
      Maximum => 1);

   --  Startup Time Selection
   type STARTUP_Field is
     (
      --  0 periods of DACClock
      STARTUP_Field_0,
      --  8 periods of DACClock
      STARTUP_Field_8,
      --  16 periods of DACClock
      STARTUP_Field_16,
      --  24 periods of DACClock
      STARTUP_Field_24,
      --  64 periods of DACClock
      STARTUP_Field_64,
      --  80 periods of DACClock
      STARTUP_Field_80,
      --  96 periods of DACClock
      STARTUP_Field_96,
      --  112 periods of DACClock
      STARTUP_Field_112,
      --  512 periods of DACClock
      STARTUP_Field_512,
      --  576 periods of DACClock
      STARTUP_Field_576,
      --  640 periods of DACClock
      STARTUP_Field_640,
      --  704 periods of DACClock
      STARTUP_Field_704,
      --  768 periods of DACClock
      STARTUP_Field_768,
      --  832 periods of DACClock
      STARTUP_Field_832,
      --  896 periods of DACClock
      STARTUP_Field_896,
      --  960 periods of DACClock
      STARTUP_Field_960,
      --  1024 periods of DACClock
      STARTUP_Field_1024,
      --  1088 periods of DACClock
      STARTUP_Field_1088,
      --  1152 periods of DACClock
      STARTUP_Field_1152,
      --  1216 periods of DACClock
      STARTUP_Field_1216,
      --  1280 periods of DACClock
      STARTUP_Field_1280,
      --  1344 periods of DACClock
      STARTUP_Field_1344,
      --  1408 periods of DACClock
      STARTUP_Field_1408,
      --  1472 periods of DACClock
      STARTUP_Field_1472,
      --  1536 periods of DACClock
      STARTUP_Field_1536,
      --  1600 periods of DACClock
      STARTUP_Field_1600,
      --  1664 periods of DACClock
      STARTUP_Field_1664,
      --  1728 periods of DACClock
      STARTUP_Field_1728,
      --  1792 periods of DACClock
      STARTUP_Field_1792,
      --  1856 periods of DACClock
      STARTUP_Field_1856,
      --  1920 periods of DACClock
      STARTUP_Field_1920,
      --  1984 periods of DACClock
      STARTUP_Field_1984)
     with Size => 6;
   for STARTUP_Field use
     (STARTUP_Field_0 => 0,
      STARTUP_Field_8 => 1,
      STARTUP_Field_16 => 2,
      STARTUP_Field_24 => 3,
      STARTUP_Field_64 => 4,
      STARTUP_Field_80 => 5,
      STARTUP_Field_96 => 6,
      STARTUP_Field_112 => 7,
      STARTUP_Field_512 => 8,
      STARTUP_Field_576 => 9,
      STARTUP_Field_640 => 10,
      STARTUP_Field_704 => 11,
      STARTUP_Field_768 => 12,
      STARTUP_Field_832 => 13,
      STARTUP_Field_896 => 14,
      STARTUP_Field_960 => 15,
      STARTUP_Field_1024 => 16,
      STARTUP_Field_1088 => 17,
      STARTUP_Field_1152 => 18,
      STARTUP_Field_1216 => 19,
      STARTUP_Field_1280 => 20,
      STARTUP_Field_1344 => 21,
      STARTUP_Field_1408 => 22,
      STARTUP_Field_1472 => 23,
      STARTUP_Field_1536 => 24,
      STARTUP_Field_1600 => 25,
      STARTUP_Field_1664 => 26,
      STARTUP_Field_1728 => 27,
      STARTUP_Field_1792 => 28,
      STARTUP_Field_1856 => 29,
      STARTUP_Field_1920 => 30,
      STARTUP_Field_1984 => 31);

   --  Mode Register
   type MR_Register is record
      --  Trigger Enable
      TRGEN          : TRGEN_Field := Dis;
      --  Trigger Selection
      TRGSEL         : MR_TRGSEL_Field := 16#0#;
      --  Word Transfer
      WORD           : WORD_Field := Half;
      --  Sleep Mode
      SLEEP          : MR_SLEEP_Field := 16#0#;
      --  Fast Wake up Mode
      FASTWKUP       : MR_FASTWKUP_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Refresh Period
      REFRESH        : MR_REFRESH_Field := 16#0#;
      --  User Channel Selection
      USER_SEL       : USER_SEL_Field := Channel0;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  Tag Selection Mode
      TAG            : TAG_Field := Dis;
      --  Max Speed Mode
      MAXS           : MAXS_Field := Normal;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2 := 16#0#;
      --  Startup Time Selection
      STARTUP        : STARTUP_Field := STARTUP_Field_0;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      TRGEN          at 0 range 0 .. 0;
      TRGSEL         at 0 range 1 .. 3;
      WORD           at 0 range 4 .. 4;
      SLEEP          at 0 range 5 .. 5;
      FASTWKUP       at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      REFRESH        at 0 range 8 .. 15;
      USER_SEL       at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      TAG            at 0 range 20 .. 20;
      MAXS           at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      STARTUP        at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -------------------
   -- CHER_Register --
   -------------------

   -------------
   -- CHER.CH --
   -------------

   --  CHER_CH array element
   subtype CHER_CH_Element is ATSAM3X8E.Bit;

   --  CHER_CH array
   type CHER_CH_Field_Array is array (0 .. 1) of CHER_CH_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CHER_CH
   type CHER_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CH as an array
            Arr : CHER_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CHER_CH_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Channel Enable Register
   type CHER_Register is record
      --  Write-only. Channel 0 Enable
      CH            : CHER_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHER_Register use record
      CH            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -------------------
   -- CHDR_Register --
   -------------------

   -------------
   -- CHDR.CH --
   -------------

   --  CHDR_CH array element
   subtype CHDR_CH_Element is ATSAM3X8E.Bit;

   --  CHDR_CH array
   type CHDR_CH_Field_Array is array (0 .. 1) of CHDR_CH_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CHDR_CH
   type CHDR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CH as an array
            Arr : CHDR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CHDR_CH_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Channel Disable Register
   type CHDR_Register is record
      --  Write-only. Channel 0 Disable
      CH            : CHDR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHDR_Register use record
      CH            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -------------------
   -- CHSR_Register --
   -------------------

   -------------
   -- CHSR.CH --
   -------------

   --  CHSR_CH array element
   subtype CHSR_CH_Element is ATSAM3X8E.Bit;

   --  CHSR_CH array
   type CHSR_CH_Field_Array is array (0 .. 1) of CHSR_CH_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CHSR_CH
   type CHSR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CH as an array
            Arr : CHSR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CHSR_CH_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Channel Status Register
   type CHSR_Register is record
      --  Read-only. Channel 0 Status
      CH            : CHSR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHSR_Register use record
      CH            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_EOC_Field is ATSAM3X8E.Bit;
   subtype IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IER_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Transmit Ready Interrupt Enable
      TXRDY         : IER_TXRDY_Field := 16#0#;
      --  Write-only. End of Conversion Interrupt Enable
      EOC           : IER_EOC_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Enable
      ENDTX         : IER_ENDTX_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Enable
      TXBUFE        : IER_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_EOC_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IDR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Transmit Ready Interrupt Disable.
      TXRDY         : IDR_TXRDY_Field := 16#0#;
      --  Write-only. End of Conversion Interrupt Disable
      EOC           : IDR_EOC_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Disable
      ENDTX         : IDR_ENDTX_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Disable
      TXBUFE        : IDR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_EOC_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IMR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Transmit Ready Interrupt Mask
      TXRDY         : IMR_TXRDY_Field := 16#0#;
      --  Read-only. End of Conversion Interrupt Mask
      EOC           : IMR_EOC_Field := 16#0#;
      --  Read-only. End of Transmit Buffer Interrupt Mask
      ENDTX         : IMR_ENDTX_Field := 16#0#;
      --  Read-only. Transmit Buffer Empty Interrupt Mask
      TXBUFE        : IMR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ------------------
   -- ISR_Register --
   ------------------

   subtype ISR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype ISR_EOC_Field is ATSAM3X8E.Bit;
   subtype ISR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype ISR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Status Register
   type ISR_Register is record
      --  Read-only. Transmit Ready Interrupt Flag
      TXRDY         : ISR_TXRDY_Field := 16#0#;
      --  Read-only. End of Conversion Interrupt Flag
      EOC           : ISR_EOC_Field := 16#0#;
      --  Read-only. End of DMA Interrupt Flag
      ENDTX         : ISR_ENDTX_Field := 16#0#;
      --  Read-only. Transmit Buffer Empty
      TXBUFE        : ISR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ------------------
   -- ACR_Register --
   ------------------

   -----------------
   -- ACR.IBCTLCH --
   -----------------

   --  ACR_IBCTLCH array element
   subtype ACR_IBCTLCH_Element is ATSAM3X8E.UInt2;

   --  ACR_IBCTLCH array
   type ACR_IBCTLCH_Field_Array is array (0 .. 1) of ACR_IBCTLCH_Element
     with Component_Size => 2, Size => 4;

   --  Type definition for ACR_IBCTLCH
   type ACR_IBCTLCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IBCTLCH as a value
            Val : ATSAM3X8E.UInt4;
         when True =>
            --  IBCTLCH as an array
            Arr : ACR_IBCTLCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for ACR_IBCTLCH_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype ACR_IBCTLDACCORE_Field is ATSAM3X8E.UInt2;

   --  Analog Current Register
   type ACR_Register is record
      --  Analog Output Current Control
      IBCTLCH        : ACR_IBCTLCH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Bias Current Control for DAC Core
      IBCTLDACCORE   : ACR_IBCTLDACCORE_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      IBCTLCH        at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      IBCTLDACCORE   at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode register
   type WPMR_Register is record
      --  Write Protect Enable
      WPEN         : WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
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

   subtype WPSR_WPROTERR_Field is ATSAM3X8E.Bit;
   subtype WPSR_WPROTADDR_Field is ATSAM3X8E.Byte;

   --  Write Protect Status register
   type WPSR_Register is record
      --  Read-only. Write protection error
      WPROTERR       : WPSR_WPROTERR_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write protection error address
      WPROTADDR      : WPSR_WPROTADDR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WPROTERR       at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPROTADDR      at 0 range 8 .. 15;
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

   --  Digital-to-Analog Converter Controller
   type DACC_Peripheral is record
      --  Control Register
      CR   : CR_Register;
      --  Mode Register
      MR   : MR_Register;
      --  Channel Enable Register
      CHER : CHER_Register;
      --  Channel Disable Register
      CHDR : CHDR_Register;
      --  Channel Status Register
      CHSR : CHSR_Register;
      --  Conversion Data Register
      CDR  : ATSAM3X8E.Word;
      --  Interrupt Enable Register
      IER  : IER_Register;
      --  Interrupt Disable Register
      IDR  : IDR_Register;
      --  Interrupt Mask Register
      IMR  : IMR_Register;
      --  Interrupt Status Register
      ISR  : ISR_Register;
      --  Analog Current Register
      ACR  : ACR_Register;
      --  Write Protect Mode register
      WPMR : WPMR_Register;
      --  Write Protect Status register
      WPSR : WPSR_Register;
      --  Transmit Pointer Register
      TPR  : ATSAM3X8E.Word;
      --  Transmit Counter Register
      TCR  : TCR_Register;
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

   for DACC_Peripheral use record
      CR   at 0 range 0 .. 31;
      MR   at 4 range 0 .. 31;
      CHER at 16 range 0 .. 31;
      CHDR at 20 range 0 .. 31;
      CHSR at 24 range 0 .. 31;
      CDR  at 32 range 0 .. 31;
      IER  at 36 range 0 .. 31;
      IDR  at 40 range 0 .. 31;
      IMR  at 44 range 0 .. 31;
      ISR  at 48 range 0 .. 31;
      ACR  at 148 range 0 .. 31;
      WPMR at 228 range 0 .. 31;
      WPSR at 232 range 0 .. 31;
      TPR  at 264 range 0 .. 31;
      TCR  at 268 range 0 .. 31;
      TNPR at 280 range 0 .. 31;
      TNCR at 284 range 0 .. 31;
      PTCR at 288 range 0 .. 31;
      PTSR at 292 range 0 .. 31;
   end record;

   --  Digital-to-Analog Converter Controller
   DACC_Periph : aliased DACC_Peripheral
     with Import, Address => DACC_Base;

end ATSAM3X8E.DACC;
