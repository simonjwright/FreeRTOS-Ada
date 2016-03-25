--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Analog-to-Digital Converter
package ATSAM3X8E.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_SWRST_Field is ATSAM3X8E.Bit;
   subtype CR_START_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  Write-only. Software Reset
      SWRST         : CR_SWRST_Field := 16#0#;
      --  Write-only. Start Conversion
      START         : CR_START_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      SWRST         at 0 range 0 .. 0;
      START         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   --  Trigger Enable
   type TRGEN_Field is
     (
      --  Hardware triggers are disabled. Starting a conversion is only
      --  possible by software.
      Dis,
      --  Hardware trigger selected by TRGSEL field is enabled.
      En)
     with Size => 1;
   for TRGEN_Field use
     (Dis => 0,
      En => 1);

   --  Trigger Selection
   type TRGSEL_Field is
     (
      --  External : ADCTRG
      Adc_Trig0,
      --  TIOA Output of the Timer Counter Channel 0
      Adc_Trig1,
      --  TIOA Output of the Timer Counter Channel 1
      Adc_Trig2,
      --  TIOA Output of the Timer Counter Channel 2
      Adc_Trig3,
      --  PWM Event Line 0
      Adc_Trig4,
      --  PWM Event Line 0
      Adc_Trig5)
     with Size => 3;
   for TRGSEL_Field use
     (Adc_Trig0 => 0,
      Adc_Trig1 => 1,
      Adc_Trig2 => 2,
      Adc_Trig3 => 3,
      Adc_Trig4 => 4,
      Adc_Trig5 => 5);

   --  Resolution
   type LOWRES_Field is
     (
      --  12-bit resolution
      Bits_12,
      --  10-bit resolution
      Bits_10)
     with Size => 1;
   for LOWRES_Field use
     (Bits_12 => 0,
      Bits_10 => 1);

   --  Sleep Mode
   type SLEEP_Field is
     (
      --  Normal Mode: The ADC Core and reference voltage circuitry are kept ON
      --  between conversions
      Normal,
      --  Sleep Mode: The ADC Core and reference voltage circuitry are OFF
      --  between conversions
      Sleep)
     with Size => 1;
   for SLEEP_Field use
     (Normal => 0,
      Sleep => 1);

   --  Fast Wake Up
   type FWUP_Field is
     (
      --  Normal Sleep Mode: The sleep mode is defined by the SLEEP bit
      Off,
      --  Fast Wake Up Sleep Mode: The Voltage reference is ON between
      --  conversions and ADC Core is OFF
      On)
     with Size => 1;
   for FWUP_Field use
     (Off => 0,
      On => 1);

   --  Free Run Mode
   type FREERUN_Field is
     (
      --  Normal Mode
      Off,
      --  Free Run Mode: Never wait for any trigger.
      On)
     with Size => 1;
   for FREERUN_Field use
     (Off => 0,
      On => 1);

   subtype MR_PRESCAL_Field is ATSAM3X8E.Byte;

   --  Start Up Time
   type STARTUP_Field is
     (
      --  0 periods of ADCClock
      Sut0,
      --  8 periods of ADCClock
      Sut8,
      --  16 periods of ADCClock
      Sut16,
      --  24 periods of ADCClock
      Sut24,
      --  64 periods of ADCClock
      Sut64,
      --  80 periods of ADCClock
      Sut80,
      --  96 periods of ADCClock
      Sut96,
      --  112 periods of ADCClock
      Sut112,
      --  512 periods of ADCClock
      Sut512,
      --  576 periods of ADCClock
      Sut576,
      --  640 periods of ADCClock
      Sut640,
      --  704 periods of ADCClock
      Sut704,
      --  768 periods of ADCClock
      Sut768,
      --  832 periods of ADCClock
      Sut832,
      --  896 periods of ADCClock
      Sut896,
      --  960 periods of ADCClock
      Sut960)
     with Size => 4;
   for STARTUP_Field use
     (Sut0 => 0,
      Sut8 => 1,
      Sut16 => 2,
      Sut24 => 3,
      Sut64 => 4,
      Sut80 => 5,
      Sut96 => 6,
      Sut112 => 7,
      Sut512 => 8,
      Sut576 => 9,
      Sut640 => 10,
      Sut704 => 11,
      Sut768 => 12,
      Sut832 => 13,
      Sut896 => 14,
      Sut960 => 15);

   --  Analog Settling Time
   type SETTLING_Field is
     (
      --  3 periods of ADCClock
      Ast3,
      --  5 periods of ADCClock
      Ast5,
      --  9 periods of ADCClock
      Ast9,
      --  17 periods of ADCClock
      Ast17)
     with Size => 2;
   for SETTLING_Field use
     (Ast3 => 0,
      Ast5 => 1,
      Ast9 => 2,
      Ast17 => 3);

   --  Analog Change
   type ANACH_Field is
     (
      --  No analog change on channel switching: DIFF0, GAIN0 and OFF0 are used
      --  for all channels
      None,
      --  Allows different analog settings for each channel. See ADC_CGR and
      --  ADC_COR Registers
      Allowed)
     with Size => 1;
   for ANACH_Field use
     (None => 0,
      Allowed => 1);

   subtype MR_TRACKTIM_Field is ATSAM3X8E.UInt4;
   subtype MR_TRANSFER_Field is ATSAM3X8E.UInt2;

   --  Use Sequence Enable
   type USEQ_Field is
     (
      --  Normal Mode: The controller converts channels in a simple numeric
      --  order.
      Num_Order,
      --  User Sequence Mode: The sequence respects what is defined in
      --  ADC_SEQR1 and ADC_SEQR2 registers.
      Reg_Order)
     with Size => 1;
   for USEQ_Field use
     (Num_Order => 0,
      Reg_Order => 1);

   --  Mode Register
   type MR_Register is record
      --  Trigger Enable
      TRGEN          : TRGEN_Field := Dis;
      --  Trigger Selection
      TRGSEL         : TRGSEL_Field := Adc_Trig0;
      --  Resolution
      LOWRES         : LOWRES_Field := Bits_12;
      --  Sleep Mode
      SLEEP          : SLEEP_Field := Normal;
      --  Fast Wake Up
      FWUP           : FWUP_Field := Off;
      --  Free Run Mode
      FREERUN        : FREERUN_Field := Off;
      --  Prescaler Rate Selection
      PRESCAL        : MR_PRESCAL_Field := 16#0#;
      --  Start Up Time
      STARTUP        : STARTUP_Field := Sut0;
      --  Analog Settling Time
      SETTLING       : SETTLING_Field := Ast3;
      --  unspecified
      Reserved_22_22 : ATSAM3X8E.Bit := 16#0#;
      --  Analog Change
      ANACH          : ANACH_Field := None;
      --  Tracking Time
      TRACKTIM       : MR_TRACKTIM_Field := 16#0#;
      --  Transfer Period
      TRANSFER       : MR_TRANSFER_Field := 16#0#;
      --  unspecified
      Reserved_30_30 : ATSAM3X8E.Bit := 16#0#;
      --  Use Sequence Enable
      USEQ           : USEQ_Field := Num_Order;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      TRGEN          at 0 range 0 .. 0;
      TRGSEL         at 0 range 1 .. 3;
      LOWRES         at 0 range 4 .. 4;
      SLEEP          at 0 range 5 .. 5;
      FWUP           at 0 range 6 .. 6;
      FREERUN        at 0 range 7 .. 7;
      PRESCAL        at 0 range 8 .. 15;
      STARTUP        at 0 range 16 .. 19;
      SETTLING       at 0 range 20 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      ANACH          at 0 range 23 .. 23;
      TRACKTIM       at 0 range 24 .. 27;
      TRANSFER       at 0 range 28 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      USEQ           at 0 range 31 .. 31;
   end record;

   -------------------
   -- SEQR_Register --
   -------------------

   --  SEQR1_USCH array element
   subtype SEQR1_USCH_Element is ATSAM3X8E.UInt4;

   --  SEQR1_USCH array
   type SEQR1_USCH_Field_Array is array (0 .. 7) of SEQR1_USCH_Element
     with Component_Size => 4, Size => 32;

   --  Channel Sequence Register 1
   type SEQR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USCH as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  USCH as an array
            Arr : SEQR1_USCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for SEQR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
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
   type CHER_CH_Field_Array is array (0 .. 15) of CHER_CH_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for CHER_CH
   type CHER_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  CH as an array
            Arr : CHER_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CHER_CH_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Channel Enable Register
   type CHER_Register is record
      --  Write-only. Channel 0 Enable
      CH             : CHER_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHER_Register use record
      CH             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
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
   type CHDR_CH_Field_Array is array (0 .. 15) of CHDR_CH_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for CHDR_CH
   type CHDR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  CH as an array
            Arr : CHDR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CHDR_CH_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Channel Disable Register
   type CHDR_Register is record
      --  Write-only. Channel 0 Disable
      CH             : CHDR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHDR_Register use record
      CH             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
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
   type CHSR_CH_Field_Array is array (0 .. 15) of CHSR_CH_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for CHSR_CH
   type CHSR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  CH as an array
            Arr : CHSR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CHSR_CH_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Channel Status Register
   type CHSR_Register is record
      --  Read-only. Channel 0 Status
      CH             : CHSR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHSR_Register use record
      CH             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- LCDR_Register --
   -------------------

   subtype LCDR_LDATA_Field is ATSAM3X8E.UInt12;
   subtype LCDR_CHNB_Field is ATSAM3X8E.UInt4;

   --  Last Converted Data Register
   type LCDR_Register is record
      --  Read-only. Last Data Converted
      LDATA          : LCDR_LDATA_Field := 16#0#;
      --  Read-only. Channel Number
      CHNB           : LCDR_CHNB_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for LCDR_Register use record
      LDATA          at 0 range 0 .. 11;
      CHNB           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   -------------
   -- IER.EOC --
   -------------

   --  IER_EOC array element
   subtype IER_EOC_Element is ATSAM3X8E.Bit;

   --  IER_EOC array
   type IER_EOC_Field_Array is array (0 .. 15) of IER_EOC_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for IER_EOC
   type IER_EOC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EOC as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  EOC as an array
            Arr : IER_EOC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IER_EOC_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype IER_DRDY_Field is ATSAM3X8E.Bit;
   subtype IER_GOVRE_Field is ATSAM3X8E.Bit;
   subtype IER_COMPE_Field is ATSAM3X8E.Bit;
   subtype IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IER_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. End of Conversion Interrupt Enable 0
      EOC            : IER_EOC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_23 : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Data Ready Interrupt Enable
      DRDY           : IER_DRDY_Field := 16#0#;
      --  Write-only. General Overrun Error Interrupt Enable
      GOVRE          : IER_GOVRE_Field := 16#0#;
      --  Write-only. Comparison Event Interrupt Enable
      COMPE          : IER_COMPE_Field := 16#0#;
      --  Write-only. End of Receive Buffer Interrupt Enable
      ENDRX          : IER_ENDRX_Field := 16#0#;
      --  Write-only. Receive Buffer Full Interrupt Enable
      RXBUFF         : IER_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      EOC            at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      DRDY           at 0 range 24 .. 24;
      GOVRE          at 0 range 25 .. 25;
      COMPE          at 0 range 26 .. 26;
      ENDRX          at 0 range 27 .. 27;
      RXBUFF         at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   -------------
   -- IDR.EOC --
   -------------

   --  IDR_EOC array element
   subtype IDR_EOC_Element is ATSAM3X8E.Bit;

   --  IDR_EOC array
   type IDR_EOC_Field_Array is array (0 .. 15) of IDR_EOC_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for IDR_EOC
   type IDR_EOC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EOC as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  EOC as an array
            Arr : IDR_EOC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IDR_EOC_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype IDR_DRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_GOVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_COMPE_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IDR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. End of Conversion Interrupt Disable 0
      EOC            : IDR_EOC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_23 : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Data Ready Interrupt Disable
      DRDY           : IDR_DRDY_Field := 16#0#;
      --  Write-only. General Overrun Error Interrupt Disable
      GOVRE          : IDR_GOVRE_Field := 16#0#;
      --  Write-only. Comparison Event Interrupt Disable
      COMPE          : IDR_COMPE_Field := 16#0#;
      --  Write-only. End of Receive Buffer Interrupt Disable
      ENDRX          : IDR_ENDRX_Field := 16#0#;
      --  Write-only. Receive Buffer Full Interrupt Disable
      RXBUFF         : IDR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      EOC            at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      DRDY           at 0 range 24 .. 24;
      GOVRE          at 0 range 25 .. 25;
      COMPE          at 0 range 26 .. 26;
      ENDRX          at 0 range 27 .. 27;
      RXBUFF         at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   -------------
   -- IMR.EOC --
   -------------

   --  IMR_EOC array element
   subtype IMR_EOC_Element is ATSAM3X8E.Bit;

   --  IMR_EOC array
   type IMR_EOC_Field_Array is array (0 .. 15) of IMR_EOC_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for IMR_EOC
   type IMR_EOC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EOC as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  EOC as an array
            Arr : IMR_EOC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IMR_EOC_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype IMR_DRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_GOVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_COMPE_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IMR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. End of Conversion Interrupt Mask 0
      EOC            : IMR_EOC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_23 : ATSAM3X8E.Byte;
      --  Read-only. Data Ready Interrupt Mask
      DRDY           : IMR_DRDY_Field := 16#0#;
      --  Read-only. General Overrun Error Interrupt Mask
      GOVRE          : IMR_GOVRE_Field := 16#0#;
      --  Read-only. Comparison Event Interrupt Mask
      COMPE          : IMR_COMPE_Field := 16#0#;
      --  Read-only. End of Receive Buffer Interrupt Mask
      ENDRX          : IMR_ENDRX_Field := 16#0#;
      --  Read-only. Receive Buffer Full Interrupt Mask
      RXBUFF         : IMR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      EOC            at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      DRDY           at 0 range 24 .. 24;
      GOVRE          at 0 range 25 .. 25;
      COMPE          at 0 range 26 .. 26;
      ENDRX          at 0 range 27 .. 27;
      RXBUFF         at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   ------------------
   -- ISR_Register --
   ------------------

   -------------
   -- ISR.EOC --
   -------------

   --  ISR_EOC array element
   subtype ISR_EOC_Element is ATSAM3X8E.Bit;

   --  ISR_EOC array
   type ISR_EOC_Field_Array is array (0 .. 15) of ISR_EOC_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for ISR_EOC
   type ISR_EOC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EOC as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  EOC as an array
            Arr : ISR_EOC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for ISR_EOC_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype ISR_DRDY_Field is ATSAM3X8E.Bit;
   subtype ISR_GOVRE_Field is ATSAM3X8E.Bit;
   subtype ISR_COMPE_Field is ATSAM3X8E.Bit;
   subtype ISR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype ISR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Status Register
   type ISR_Register is record
      --  Read-only. End of Conversion 0
      EOC            : ISR_EOC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_23 : ATSAM3X8E.Byte;
      --  Read-only. Data Ready
      DRDY           : ISR_DRDY_Field := 16#0#;
      --  Read-only. General Overrun Error
      GOVRE          : ISR_GOVRE_Field := 16#0#;
      --  Read-only. Comparison Error
      COMPE          : ISR_COMPE_Field := 16#0#;
      --  Read-only. End of RX Buffer
      ENDRX          : ISR_ENDRX_Field := 16#0#;
      --  Read-only. RX Buffer Full
      RXBUFF         : ISR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      EOC            at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      DRDY           at 0 range 24 .. 24;
      GOVRE          at 0 range 25 .. 25;
      COMPE          at 0 range 26 .. 26;
      ENDRX          at 0 range 27 .. 27;
      RXBUFF         at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -------------------
   -- OVER_Register --
   -------------------

   ---------------
   -- OVER.OVRE --
   ---------------

   --  OVER_OVRE array element
   subtype OVER_OVRE_Element is ATSAM3X8E.Bit;

   --  OVER_OVRE array
   type OVER_OVRE_Field_Array is array (0 .. 15) of OVER_OVRE_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for OVER_OVRE
   type OVER_OVRE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OVRE as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  OVRE as an array
            Arr : OVER_OVRE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for OVER_OVRE_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Overrun Status Register
   type OVER_Register is record
      --  Read-only. Overrun Error 0
      OVRE           : OVER_OVRE_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OVER_Register use record
      OVRE           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- EMR_Register --
   ------------------

   --  Comparison Mode
   type CMPMODE_Field is
     (
      --  Generates an event when the converted data is lower than the low
      --  threshold of the window.
      Low,
      --  Generates an event when the converted data is higher than the high
      --  threshold of the window.
      High,
      --  Generates an event when the converted data is in the comparison
      --  window.
      In_k,
      --  Generates an event when the converted data is out of the comparison
      --  window.
      Out_k)
     with Size => 2;
   for CMPMODE_Field use
     (Low => 0,
      High => 1,
      In_k => 2,
      Out_k => 3);

   subtype EMR_CMPSEL_Field is ATSAM3X8E.UInt4;
   subtype EMR_CMPALL_Field is ATSAM3X8E.Bit;
   subtype EMR_CMPFILTER_Field is ATSAM3X8E.UInt2;
   subtype EMR_TAG_Field is ATSAM3X8E.Bit;

   --  Extended Mode Register
   type EMR_Register is record
      --  Comparison Mode
      CMPMODE        : CMPMODE_Field := Low;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  Comparison Selected Channel
      CMPSEL         : EMR_CMPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Compare All Channels
      CMPALL         : EMR_CMPALL_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2 := 16#0#;
      --  Compare Event Filtering
      CMPFILTER      : EMR_CMPFILTER_Field := 16#0#;
      --  unspecified
      Reserved_14_23 : ATSAM3X8E.UInt10 := 16#0#;
      --  TAG of ADC_LDCR register
      TAG            : EMR_TAG_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for EMR_Register use record
      CMPMODE        at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      CMPSEL         at 0 range 4 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CMPALL         at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CMPFILTER      at 0 range 12 .. 13;
      Reserved_14_23 at 0 range 14 .. 23;
      TAG            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ------------------
   -- CWR_Register --
   ------------------

   subtype CWR_LOWTHRES_Field is ATSAM3X8E.UInt12;
   subtype CWR_HIGHTHRES_Field is ATSAM3X8E.UInt12;

   --  Compare Window Register
   type CWR_Register is record
      --  Low Threshold
      LOWTHRES       : CWR_LOWTHRES_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  High Threshold
      HIGHTHRES      : CWR_HIGHTHRES_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : ATSAM3X8E.UInt4 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CWR_Register use record
      LOWTHRES       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      HIGHTHRES      at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   ------------------
   -- CGR_Register --
   ------------------

   --  CGR_GAIN array element
   subtype CGR_GAIN_Element is ATSAM3X8E.UInt2;

   --  CGR_GAIN array
   type CGR_GAIN_Field_Array is array (0 .. 15) of CGR_GAIN_Element
     with Component_Size => 2, Size => 32;

   --  Channel Gain Register
   type CGR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GAIN as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  GAIN as an array
            Arr : CGR_GAIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for CGR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- COR_Register --
   ------------------

   -------------
   -- COR.OFF --
   -------------

   --  COR_OFF array element
   subtype COR_OFF_Element is ATSAM3X8E.Bit;

   --  COR_OFF array
   type COR_OFF_Field_Array is array (0 .. 15) of COR_OFF_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for COR_OFF
   type COR_OFF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OFF as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  OFF as an array
            Arr : COR_OFF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for COR_OFF_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --------------
   -- COR.DIFF --
   --------------

   --  COR_DIFF array element
   subtype COR_DIFF_Element is ATSAM3X8E.Bit;

   --  COR_DIFF array
   type COR_DIFF_Field_Array is array (0 .. 15) of COR_DIFF_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for COR_DIFF
   type COR_DIFF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DIFF as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  DIFF as an array
            Arr : COR_DIFF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for COR_DIFF_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Channel Offset Register
   type COR_Register is record
      --  Offset for channel 0
      OFF  : COR_OFF_Field := (As_Array => False, Val => 16#0#);
      --  Differential inputs for channel 0
      DIFF : COR_DIFF_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for COR_Register use record
      OFF  at 0 range 0 .. 15;
      DIFF at 0 range 16 .. 31;
   end record;

   ------------------
   -- CDR_Register --
   ------------------

   subtype CDR_DATA_Field is ATSAM3X8E.UInt12;

   --  Channel Data Register
   type CDR_Register is record
      --  Read-only. Converted Data
      DATA           : CDR_DATA_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CDR_Register use record
      DATA           at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  Channel Data Register
   type CDR_Registers is array (0 .. 15) of CDR_Register;

   ------------------
   -- ACR_Register --
   ------------------

   subtype ACR_TSON_Field is ATSAM3X8E.Bit;
   subtype ACR_IBCTL_Field is ATSAM3X8E.UInt2;

   --  Analog Control Register
   type ACR_Register is record
      --  unspecified
      Reserved_0_3   : ATSAM3X8E.UInt4 := 16#0#;
      --  Temperature Sensor On
      TSON           : ACR_TSON_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  ADC Bias Current Control
      IBCTL          : ACR_IBCTL_Field := 16#1#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      TSON           at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      IBCTL          at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
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

   subtype WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype WPSR_WPVSRC_Field is ATSAM3X8E.Short;

   --  Write Protect Status Register
   type WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : WPSR_WPVS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : WPSR_WPVSRC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
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

   --  Analog-to-Digital Converter
   type ADC_Peripheral is record
      --  Control Register
      CR    : CR_Register;
      --  Mode Register
      MR    : MR_Register;
      --  Channel Sequence Register 1
      SEQR1 : SEQR_Register;
      --  Channel Sequence Register 2
      SEQR2 : SEQR_Register;
      --  Channel Enable Register
      CHER  : CHER_Register;
      --  Channel Disable Register
      CHDR  : CHDR_Register;
      --  Channel Status Register
      CHSR  : CHSR_Register;
      --  Last Converted Data Register
      LCDR  : LCDR_Register;
      --  Interrupt Enable Register
      IER   : IER_Register;
      --  Interrupt Disable Register
      IDR   : IDR_Register;
      --  Interrupt Mask Register
      IMR   : IMR_Register;
      --  Interrupt Status Register
      ISR   : ISR_Register;
      --  Overrun Status Register
      OVER  : OVER_Register;
      --  Extended Mode Register
      EMR   : EMR_Register;
      --  Compare Window Register
      CWR   : CWR_Register;
      --  Channel Gain Register
      CGR   : CGR_Register;
      --  Channel Offset Register
      COR   : COR_Register;
      --  Channel Data Register
      CDR   : CDR_Registers;
      --  Analog Control Register
      ACR   : ACR_Register;
      --  Write Protect Mode Register
      WPMR  : WPMR_Register;
      --  Write Protect Status Register
      WPSR  : WPSR_Register;
      --  Receive Pointer Register
      RPR   : ATSAM3X8E.Word;
      --  Receive Counter Register
      RCR   : RCR_Register;
      --  Receive Next Pointer Register
      RNPR  : ATSAM3X8E.Word;
      --  Receive Next Counter Register
      RNCR  : RNCR_Register;
      --  Transfer Control Register
      PTCR  : PTCR_Register;
      --  Transfer Status Register
      PTSR  : PTSR_Register;
   end record
     with Volatile;

   for ADC_Peripheral use record
      CR    at 0 range 0 .. 31;
      MR    at 4 range 0 .. 31;
      SEQR1 at 8 range 0 .. 31;
      SEQR2 at 12 range 0 .. 31;
      CHER  at 16 range 0 .. 31;
      CHDR  at 20 range 0 .. 31;
      CHSR  at 24 range 0 .. 31;
      LCDR  at 32 range 0 .. 31;
      IER   at 36 range 0 .. 31;
      IDR   at 40 range 0 .. 31;
      IMR   at 44 range 0 .. 31;
      ISR   at 48 range 0 .. 31;
      OVER  at 60 range 0 .. 31;
      EMR   at 64 range 0 .. 31;
      CWR   at 68 range 0 .. 31;
      CGR   at 72 range 0 .. 31;
      COR   at 76 range 0 .. 31;
      CDR   at 80 range 0 .. 511;
      ACR   at 148 range 0 .. 31;
      WPMR  at 228 range 0 .. 31;
      WPSR  at 232 range 0 .. 31;
      RPR   at 256 range 0 .. 31;
      RCR   at 260 range 0 .. 31;
      RNPR  at 272 range 0 .. 31;
      RNCR  at 276 range 0 .. 31;
      PTCR  at 288 range 0 .. 31;
      PTSR  at 292 range 0 .. 31;
   end record;

   --  Analog-to-Digital Converter
   ADC_Periph : aliased ADC_Peripheral
     with Import, Address => ADC_Base;

end ATSAM3X8E.ADC;
