pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  Digital-to-Analog Converter Controller
package ATSAM3X8E.DACC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype DACC_CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type DACC_CR_Register is record
      --  Write-only. Software Reset
      SWRST         : DACC_CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_CR_Register use record
      SWRST         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Trigger Enable
   type MR_TRGEN_Field is
     (--  External trigger mode disabled. DACC in free running mode.
      Dis,
      --  External trigger mode enabled.
      En)
     with Size => 1;
   for MR_TRGEN_Field use
     (Dis => 0,
      En => 1);

   subtype DACC_MR_TRGSEL_Field is ATSAM3X8E.UInt3;

   --  Word Transfer
   type MR_WORD_Field is
     (--  Half-Word transfer
      Half,
      --  Word Transfer
      Word)
     with Size => 1;
   for MR_WORD_Field use
     (Half => 0,
      Word => 1);

   subtype DACC_MR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype DACC_MR_FASTWKUP_Field is ATSAM3X8E.Bit;
   subtype DACC_MR_REFRESH_Field is ATSAM3X8E.Byte;

   --  User Channel Selection
   type MR_USER_SEL_Field is
     (--  Channel 0
      Channel0,
      --  Channel 1
      Channel1)
     with Size => 2;
   for MR_USER_SEL_Field use
     (Channel0 => 0,
      Channel1 => 1);

   --  Tag Selection Mode
   type MR_TAG_Field is
     (--  Tag selection mode disabled. Using USER_SEL to select the channel for the
--  conversion.
      Dis,
      --  Tag selection mode enabled
      En)
     with Size => 1;
   for MR_TAG_Field use
     (Dis => 0,
      En => 1);

   --  Max Speed Mode
   type MR_MAXS_Field is
     (--  Normal Mode
      Normal,
      --  Max Speed Mode enabled
      Maximum)
     with Size => 1;
   for MR_MAXS_Field use
     (Normal => 0,
      Maximum => 1);

   --  Startup Time Selection
   type MR_STARTUP_Field is
     (--  0 periods of DACClock
      Val_0,
      --  8 periods of DACClock
      Val_8,
      --  16 periods of DACClock
      Val_16,
      --  24 periods of DACClock
      Val_24,
      --  64 periods of DACClock
      Val_64,
      --  80 periods of DACClock
      Val_80,
      --  96 periods of DACClock
      Val_96,
      --  112 periods of DACClock
      Val_112,
      --  512 periods of DACClock
      Val_512,
      --  576 periods of DACClock
      Val_576,
      --  640 periods of DACClock
      Val_640,
      --  704 periods of DACClock
      Val_704,
      --  768 periods of DACClock
      Val_768,
      --  832 periods of DACClock
      Val_832,
      --  896 periods of DACClock
      Val_896,
      --  960 periods of DACClock
      Val_960,
      --  1024 periods of DACClock
      Val_1024,
      --  1088 periods of DACClock
      Val_1088,
      --  1152 periods of DACClock
      Val_1152,
      --  1216 periods of DACClock
      Val_1216,
      --  1280 periods of DACClock
      Val_1280,
      --  1344 periods of DACClock
      Val_1344,
      --  1408 periods of DACClock
      Val_1408,
      --  1472 periods of DACClock
      Val_1472,
      --  1536 periods of DACClock
      Val_1536,
      --  1600 periods of DACClock
      Val_1600,
      --  1664 periods of DACClock
      Val_1664,
      --  1728 periods of DACClock
      Val_1728,
      --  1792 periods of DACClock
      Val_1792,
      --  1856 periods of DACClock
      Val_1856,
      --  1920 periods of DACClock
      Val_1920,
      --  1984 periods of DACClock
      Val_1984)
     with Size => 6;
   for MR_STARTUP_Field use
     (Val_0 => 0,
      Val_8 => 1,
      Val_16 => 2,
      Val_24 => 3,
      Val_64 => 4,
      Val_80 => 5,
      Val_96 => 6,
      Val_112 => 7,
      Val_512 => 8,
      Val_576 => 9,
      Val_640 => 10,
      Val_704 => 11,
      Val_768 => 12,
      Val_832 => 13,
      Val_896 => 14,
      Val_960 => 15,
      Val_1024 => 16,
      Val_1088 => 17,
      Val_1152 => 18,
      Val_1216 => 19,
      Val_1280 => 20,
      Val_1344 => 21,
      Val_1408 => 22,
      Val_1472 => 23,
      Val_1536 => 24,
      Val_1600 => 25,
      Val_1664 => 26,
      Val_1728 => 27,
      Val_1792 => 28,
      Val_1856 => 29,
      Val_1920 => 30,
      Val_1984 => 31);

   --  Mode Register
   type DACC_MR_Register is record
      --  Trigger Enable
      TRGEN          : MR_TRGEN_Field := ATSAM3X8E.DACC.Dis;
      --  Trigger Selection
      TRGSEL         : DACC_MR_TRGSEL_Field := 16#0#;
      --  Word Transfer
      WORD           : MR_WORD_Field := ATSAM3X8E.DACC.Half;
      --  Sleep Mode
      SLEEP          : DACC_MR_SLEEP_Field := 16#0#;
      --  Fast Wake up Mode
      FASTWKUP       : DACC_MR_FASTWKUP_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Refresh Period
      REFRESH        : DACC_MR_REFRESH_Field := 16#0#;
      --  User Channel Selection
      USER_SEL       : MR_USER_SEL_Field := ATSAM3X8E.DACC.Channel0;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  Tag Selection Mode
      TAG            : MR_TAG_Field := ATSAM3X8E.DACC.Dis;
      --  Max Speed Mode
      MAXS           : MR_MAXS_Field := ATSAM3X8E.DACC.Normal;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2 := 16#0#;
      --  Startup Time Selection
      STARTUP        : MR_STARTUP_Field := ATSAM3X8E.DACC.Val_0;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_MR_Register use record
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

   --  DACC_CHER_CH array element
   subtype DACC_CHER_CH_Element is ATSAM3X8E.Bit;

   --  DACC_CHER_CH array
   type DACC_CHER_CH_Field_Array is array (0 .. 1) of DACC_CHER_CH_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DACC_CHER_CH
   type DACC_CHER_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CH as an array
            Arr : DACC_CHER_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DACC_CHER_CH_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Channel Enable Register
   type DACC_CHER_Register is record
      --  Write-only. Channel 0 Enable
      CH            : DACC_CHER_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_CHER_Register use record
      CH            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  DACC_CHDR_CH array element
   subtype DACC_CHDR_CH_Element is ATSAM3X8E.Bit;

   --  DACC_CHDR_CH array
   type DACC_CHDR_CH_Field_Array is array (0 .. 1) of DACC_CHDR_CH_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DACC_CHDR_CH
   type DACC_CHDR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CH as an array
            Arr : DACC_CHDR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DACC_CHDR_CH_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Channel Disable Register
   type DACC_CHDR_Register is record
      --  Write-only. Channel 0 Disable
      CH            : DACC_CHDR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_CHDR_Register use record
      CH            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  DACC_CHSR_CH array element
   subtype DACC_CHSR_CH_Element is ATSAM3X8E.Bit;

   --  DACC_CHSR_CH array
   type DACC_CHSR_CH_Field_Array is array (0 .. 1) of DACC_CHSR_CH_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DACC_CHSR_CH
   type DACC_CHSR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CH as an array
            Arr : DACC_CHSR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DACC_CHSR_CH_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Channel Status Register
   type DACC_CHSR_Register is record
      --  Read-only. Channel 0 Status
      CH            : DACC_CHSR_CH_Field;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_CHSR_Register use record
      CH            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype DACC_IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype DACC_IER_EOC_Field is ATSAM3X8E.Bit;
   subtype DACC_IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype DACC_IER_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type DACC_IER_Register is record
      --  Write-only. Transmit Ready Interrupt Enable
      TXRDY         : DACC_IER_TXRDY_Field := 16#0#;
      --  Write-only. End of Conversion Interrupt Enable
      EOC           : DACC_IER_EOC_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Enable
      ENDTX         : DACC_IER_ENDTX_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Enable
      TXBUFE        : DACC_IER_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_IER_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype DACC_IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype DACC_IDR_EOC_Field is ATSAM3X8E.Bit;
   subtype DACC_IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype DACC_IDR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type DACC_IDR_Register is record
      --  Write-only. Transmit Ready Interrupt Disable.
      TXRDY         : DACC_IDR_TXRDY_Field := 16#0#;
      --  Write-only. End of Conversion Interrupt Disable
      EOC           : DACC_IDR_EOC_Field := 16#0#;
      --  Write-only. End of Transmit Buffer Interrupt Disable
      ENDTX         : DACC_IDR_ENDTX_Field := 16#0#;
      --  Write-only. Transmit Buffer Empty Interrupt Disable
      TXBUFE        : DACC_IDR_TXBUFE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_IDR_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype DACC_IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype DACC_IMR_EOC_Field is ATSAM3X8E.Bit;
   subtype DACC_IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype DACC_IMR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type DACC_IMR_Register is record
      --  Read-only. Transmit Ready Interrupt Mask
      TXRDY         : DACC_IMR_TXRDY_Field;
      --  Read-only. End of Conversion Interrupt Mask
      EOC           : DACC_IMR_EOC_Field;
      --  Read-only. End of Transmit Buffer Interrupt Mask
      ENDTX         : DACC_IMR_ENDTX_Field;
      --  Read-only. Transmit Buffer Empty Interrupt Mask
      TXBUFE        : DACC_IMR_TXBUFE_Field;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_IMR_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype DACC_ISR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype DACC_ISR_EOC_Field is ATSAM3X8E.Bit;
   subtype DACC_ISR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype DACC_ISR_TXBUFE_Field is ATSAM3X8E.Bit;

   --  Interrupt Status Register
   type DACC_ISR_Register is record
      --  Read-only. Transmit Ready Interrupt Flag
      TXRDY         : DACC_ISR_TXRDY_Field;
      --  Read-only. End of Conversion Interrupt Flag
      EOC           : DACC_ISR_EOC_Field;
      --  Read-only. End of DMA Interrupt Flag
      ENDTX         : DACC_ISR_ENDTX_Field;
      --  Read-only. Transmit Buffer Empty
      TXBUFE        : DACC_ISR_TXBUFE_Field;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_ISR_Register use record
      TXRDY         at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      ENDTX         at 0 range 2 .. 2;
      TXBUFE        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  DACC_ACR_IBCTLCH array element
   subtype DACC_ACR_IBCTLCH_Element is ATSAM3X8E.UInt2;

   --  DACC_ACR_IBCTLCH array
   type DACC_ACR_IBCTLCH_Field_Array is array (0 .. 1)
     of DACC_ACR_IBCTLCH_Element
     with Component_Size => 2, Size => 4;

   --  Type definition for DACC_ACR_IBCTLCH
   type DACC_ACR_IBCTLCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IBCTLCH as a value
            Val : ATSAM3X8E.UInt4;
         when True =>
            --  IBCTLCH as an array
            Arr : DACC_ACR_IBCTLCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for DACC_ACR_IBCTLCH_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype DACC_ACR_IBCTLDACCORE_Field is ATSAM3X8E.UInt2;

   --  Analog Current Register
   type DACC_ACR_Register is record
      --  Analog Output Current Control
      IBCTLCH        : DACC_ACR_IBCTLCH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Bias Current Control for DAC Core
      IBCTLDACCORE   : DACC_ACR_IBCTLDACCORE_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_ACR_Register use record
      IBCTLCH        at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      IBCTLDACCORE   at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype DACC_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype DACC_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode register
   type DACC_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : DACC_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : DACC_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype DACC_WPSR_WPROTERR_Field is ATSAM3X8E.Bit;
   subtype DACC_WPSR_WPROTADDR_Field is ATSAM3X8E.Byte;

   --  Write Protect Status register
   type DACC_WPSR_Register is record
      --  Read-only. Write protection error
      WPROTERR       : DACC_WPSR_WPROTERR_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write protection error address
      WPROTADDR      : DACC_WPSR_WPROTADDR_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_WPSR_Register use record
      WPROTERR       at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPROTADDR      at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DACC_TCR_TXCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Counter Register
   type DACC_TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : DACC_TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DACC_TNCR_TXNCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Next Counter Register
   type DACC_TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : DACC_TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DACC_PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype DACC_PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype DACC_PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype DACC_PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type DACC_PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : DACC_PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : DACC_PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : DACC_PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : DACC_PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype DACC_PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype DACC_PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type DACC_PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : DACC_PTSR_RXTEN_Field;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : DACC_PTSR_TXTEN_Field;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DACC_PTSR_Register use record
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
      CR   : aliased DACC_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Mode Register
      MR   : aliased DACC_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Channel Enable Register
      CHER : aliased DACC_CHER_Register;
      pragma Volatile_Full_Access (CHER);
      --  Channel Disable Register
      CHDR : aliased DACC_CHDR_Register;
      pragma Volatile_Full_Access (CHDR);
      --  Channel Status Register
      CHSR : aliased DACC_CHSR_Register;
      pragma Volatile_Full_Access (CHSR);
      --  Conversion Data Register
      CDR  : aliased ATSAM3X8E.UInt32;
      --  Interrupt Enable Register
      IER  : aliased DACC_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR  : aliased DACC_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR  : aliased DACC_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Interrupt Status Register
      ISR  : aliased DACC_ISR_Register;
      pragma Volatile_Full_Access (ISR);
      --  Analog Current Register
      ACR  : aliased DACC_ACR_Register;
      pragma Volatile_Full_Access (ACR);
      --  Write Protect Mode register
      WPMR : aliased DACC_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  Write Protect Status register
      WPSR : aliased DACC_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
      --  Transmit Pointer Register
      TPR  : aliased ATSAM3X8E.UInt32;
      --  Transmit Counter Register
      TCR  : aliased DACC_TCR_Register;
      pragma Volatile_Full_Access (TCR);
      --  Transmit Next Pointer Register
      TNPR : aliased ATSAM3X8E.UInt32;
      --  Transmit Next Counter Register
      TNCR : aliased DACC_TNCR_Register;
      pragma Volatile_Full_Access (TNCR);
      --  Transfer Control Register
      PTCR : aliased DACC_PTCR_Register;
      pragma Volatile_Full_Access (PTCR);
      --  Transfer Status Register
      PTSR : aliased DACC_PTSR_Register;
      pragma Volatile_Full_Access (PTSR);
   end record
     with Volatile;

   for DACC_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      MR   at 16#4# range 0 .. 31;
      CHER at 16#10# range 0 .. 31;
      CHDR at 16#14# range 0 .. 31;
      CHSR at 16#18# range 0 .. 31;
      CDR  at 16#20# range 0 .. 31;
      IER  at 16#24# range 0 .. 31;
      IDR  at 16#28# range 0 .. 31;
      IMR  at 16#2C# range 0 .. 31;
      ISR  at 16#30# range 0 .. 31;
      ACR  at 16#94# range 0 .. 31;
      WPMR at 16#E4# range 0 .. 31;
      WPSR at 16#E8# range 0 .. 31;
      TPR  at 16#108# range 0 .. 31;
      TCR  at 16#10C# range 0 .. 31;
      TNPR at 16#118# range 0 .. 31;
      TNCR at 16#11C# range 0 .. 31;
      PTCR at 16#120# range 0 .. 31;
      PTSR at 16#124# range 0 .. 31;
   end record;

   --  Digital-to-Analog Converter Controller
   DACC_Periph : aliased DACC_Peripheral
     with Import, Address => DACC_Base;

end ATSAM3X8E.DACC;
