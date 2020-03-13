pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F40x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F40x.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SR_AWD_Field is STM32F40x.Bit;
   subtype SR_EOC_Field is STM32F40x.Bit;
   subtype SR_JEOC_Field is STM32F40x.Bit;
   subtype SR_JSTRT_Field is STM32F40x.Bit;
   subtype SR_STRT_Field is STM32F40x.Bit;
   subtype SR_OVR_Field is STM32F40x.Bit;

   --  status register
   type SR_Register is record
      --  Analog watchdog flag
      AWD           : SR_AWD_Field := 16#0#;
      --  Regular channel end of conversion
      EOC           : SR_EOC_Field := 16#0#;
      --  Injected channel end of conversion
      JEOC          : SR_JEOC_Field := 16#0#;
      --  Injected channel start flag
      JSTRT         : SR_JSTRT_Field := 16#0#;
      --  Regular channel start flag
      STRT          : SR_STRT_Field := 16#0#;
      --  Overrun
      OVR           : SR_OVR_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : STM32F40x.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      AWD           at 0 range 0 .. 0;
      EOC           at 0 range 1 .. 1;
      JEOC          at 0 range 2 .. 2;
      JSTRT         at 0 range 3 .. 3;
      STRT          at 0 range 4 .. 4;
      OVR           at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype CR1_AWDCH_Field is STM32F40x.UInt5;
   subtype CR1_EOCIE_Field is STM32F40x.Bit;
   subtype CR1_AWDIE_Field is STM32F40x.Bit;
   subtype CR1_JEOCIE_Field is STM32F40x.Bit;
   subtype CR1_SCAN_Field is STM32F40x.Bit;
   subtype CR1_AWDSGL_Field is STM32F40x.Bit;
   subtype CR1_JAUTO_Field is STM32F40x.Bit;
   subtype CR1_DISCEN_Field is STM32F40x.Bit;
   subtype CR1_JDISCEN_Field is STM32F40x.Bit;
   subtype CR1_DISCNUM_Field is STM32F40x.UInt3;
   subtype CR1_JAWDEN_Field is STM32F40x.Bit;
   subtype CR1_AWDEN_Field is STM32F40x.Bit;
   subtype CR1_RES_Field is STM32F40x.UInt2;
   subtype CR1_OVRIE_Field is STM32F40x.Bit;

   --  control register 1
   type CR1_Register is record
      --  Analog watchdog channel select bits
      AWDCH          : CR1_AWDCH_Field := 16#0#;
      --  Interrupt enable for EOC
      EOCIE          : CR1_EOCIE_Field := 16#0#;
      --  Analog watchdog interrupt enable
      AWDIE          : CR1_AWDIE_Field := 16#0#;
      --  Interrupt enable for injected channels
      JEOCIE         : CR1_JEOCIE_Field := 16#0#;
      --  Scan mode
      SCAN           : CR1_SCAN_Field := 16#0#;
      --  Enable the watchdog on a single channel in scan mode
      AWDSGL         : CR1_AWDSGL_Field := 16#0#;
      --  Automatic injected group conversion
      JAUTO          : CR1_JAUTO_Field := 16#0#;
      --  Discontinuous mode on regular channels
      DISCEN         : CR1_DISCEN_Field := 16#0#;
      --  Discontinuous mode on injected channels
      JDISCEN        : CR1_JDISCEN_Field := 16#0#;
      --  Discontinuous mode channel count
      DISCNUM        : CR1_DISCNUM_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32F40x.UInt6 := 16#0#;
      --  Analog watchdog enable on injected channels
      JAWDEN         : CR1_JAWDEN_Field := 16#0#;
      --  Analog watchdog enable on regular channels
      AWDEN          : CR1_AWDEN_Field := 16#0#;
      --  Resolution
      RES            : CR1_RES_Field := 16#0#;
      --  Overrun interrupt enable
      OVRIE          : CR1_OVRIE_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : STM32F40x.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      AWDCH          at 0 range 0 .. 4;
      EOCIE          at 0 range 5 .. 5;
      AWDIE          at 0 range 6 .. 6;
      JEOCIE         at 0 range 7 .. 7;
      SCAN           at 0 range 8 .. 8;
      AWDSGL         at 0 range 9 .. 9;
      JAUTO          at 0 range 10 .. 10;
      DISCEN         at 0 range 11 .. 11;
      JDISCEN        at 0 range 12 .. 12;
      DISCNUM        at 0 range 13 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      JAWDEN         at 0 range 22 .. 22;
      AWDEN          at 0 range 23 .. 23;
      RES            at 0 range 24 .. 25;
      OVRIE          at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype CR2_ADON_Field is STM32F40x.Bit;
   subtype CR2_CONT_Field is STM32F40x.Bit;
   subtype CR2_DMA_Field is STM32F40x.Bit;
   subtype CR2_DDS_Field is STM32F40x.Bit;
   subtype CR2_EOCS_Field is STM32F40x.Bit;
   subtype CR2_ALIGN_Field is STM32F40x.Bit;
   subtype CR2_JEXTSEL_Field is STM32F40x.UInt4;
   subtype CR2_JEXTEN_Field is STM32F40x.UInt2;
   subtype CR2_JSWSTART_Field is STM32F40x.Bit;
   subtype CR2_EXTSEL_Field is STM32F40x.UInt4;
   subtype CR2_EXTEN_Field is STM32F40x.UInt2;
   subtype CR2_SWSTART_Field is STM32F40x.Bit;

   --  control register 2
   type CR2_Register is record
      --  A/D Converter ON / OFF
      ADON           : CR2_ADON_Field := 16#0#;
      --  Continuous conversion
      CONT           : CR2_CONT_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : STM32F40x.UInt6 := 16#0#;
      --  Direct memory access mode (for single ADC mode)
      DMA            : CR2_DMA_Field := 16#0#;
      --  DMA disable selection (for single ADC mode)
      DDS            : CR2_DDS_Field := 16#0#;
      --  End of conversion selection
      EOCS           : CR2_EOCS_Field := 16#0#;
      --  Data alignment
      ALIGN          : CR2_ALIGN_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : STM32F40x.UInt4 := 16#0#;
      --  External event select for injected group
      JEXTSEL        : CR2_JEXTSEL_Field := 16#0#;
      --  External trigger enable for injected channels
      JEXTEN         : CR2_JEXTEN_Field := 16#0#;
      --  Start conversion of injected channels
      JSWSTART       : CR2_JSWSTART_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : STM32F40x.Bit := 16#0#;
      --  External event select for regular group
      EXTSEL         : CR2_EXTSEL_Field := 16#0#;
      --  External trigger enable for regular channels
      EXTEN          : CR2_EXTEN_Field := 16#0#;
      --  Start conversion of regular channels
      SWSTART        : CR2_SWSTART_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32F40x.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      ADON           at 0 range 0 .. 0;
      CONT           at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      DMA            at 0 range 8 .. 8;
      DDS            at 0 range 9 .. 9;
      EOCS           at 0 range 10 .. 10;
      ALIGN          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      JEXTSEL        at 0 range 16 .. 19;
      JEXTEN         at 0 range 20 .. 21;
      JSWSTART       at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      EXTSEL         at 0 range 24 .. 27;
      EXTEN          at 0 range 28 .. 29;
      SWSTART        at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  SMPR1_SMP array element
   subtype SMPR1_SMP_Element is STM32F40x.UInt3;

   --  SMPR1_SMP array
   type SMPR1_SMP_Field_Array is array (10 .. 18) of SMPR1_SMP_Element
     with Component_Size => 3, Size => 27;

   --  Type definition for SMPR1_SMP
   type SMPR1_SMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SMP as a value
            Val : STM32F40x.UInt27;
         when True =>
            --  SMP as an array
            Arr : SMPR1_SMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 27;

   for SMPR1_SMP_Field use record
      Val at 0 range 0 .. 26;
      Arr at 0 range 0 .. 26;
   end record;

   --  sample time register 1
   type SMPR1_Register is record
      --  Sample time bits
      SMP            : SMPR1_SMP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_27_31 : STM32F40x.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SMPR1_Register use record
      SMP            at 0 range 0 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  SMPR2_SMP array element
   subtype SMPR2_SMP_Element is STM32F40x.UInt3;

   --  SMPR2_SMP array
   type SMPR2_SMP_Field_Array is array (0 .. 9) of SMPR2_SMP_Element
     with Component_Size => 3, Size => 30;

   --  Type definition for SMPR2_SMP
   type SMPR2_SMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SMP as a value
            Val : STM32F40x.UInt30;
         when True =>
            --  SMP as an array
            Arr : SMPR2_SMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for SMPR2_SMP_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   --  sample time register 2
   type SMPR2_Register is record
      --  Sample time bits
      SMP            : SMPR2_SMP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : STM32F40x.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SMPR2_Register use record
      SMP            at 0 range 0 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype JOFR1_JOFFSET1_Field is STM32F40x.UInt12;

   --  injected channel data offset register x
   type JOFR1_Register is record
      --  Data offset for injected channel x
      JOFFSET1       : JOFR1_JOFFSET1_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for JOFR1_Register use record
      JOFFSET1       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype JOFR2_JOFFSET2_Field is STM32F40x.UInt12;

   --  injected channel data offset register x
   type JOFR2_Register is record
      --  Data offset for injected channel x
      JOFFSET2       : JOFR2_JOFFSET2_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for JOFR2_Register use record
      JOFFSET2       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype JOFR3_JOFFSET3_Field is STM32F40x.UInt12;

   --  injected channel data offset register x
   type JOFR3_Register is record
      --  Data offset for injected channel x
      JOFFSET3       : JOFR3_JOFFSET3_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for JOFR3_Register use record
      JOFFSET3       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype JOFR4_JOFFSET4_Field is STM32F40x.UInt12;

   --  injected channel data offset register x
   type JOFR4_Register is record
      --  Data offset for injected channel x
      JOFFSET4       : JOFR4_JOFFSET4_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for JOFR4_Register use record
      JOFFSET4       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype HTR_HT_Field is STM32F40x.UInt12;

   --  watchdog higher threshold register
   type HTR_Register is record
      --  Analog watchdog higher threshold
      HT             : HTR_HT_Field := 16#FFF#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for HTR_Register use record
      HT             at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype LTR_LT_Field is STM32F40x.UInt12;

   --  watchdog lower threshold register
   type LTR_Register is record
      --  Analog watchdog lower threshold
      LT             : LTR_LT_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for LTR_Register use record
      LT             at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  SQR1_SQ array element
   subtype SQR1_SQ_Element is STM32F40x.UInt5;

   --  SQR1_SQ array
   type SQR1_SQ_Field_Array is array (13 .. 16) of SQR1_SQ_Element
     with Component_Size => 5, Size => 20;

   --  Type definition for SQR1_SQ
   type SQR1_SQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SQ as a value
            Val : STM32F40x.UInt20;
         when True =>
            --  SQ as an array
            Arr : SQR1_SQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 20;

   for SQR1_SQ_Field use record
      Val at 0 range 0 .. 19;
      Arr at 0 range 0 .. 19;
   end record;

   subtype SQR1_L_Field is STM32F40x.UInt4;

   --  regular sequence register 1
   type SQR1_Register is record
      --  13th conversion in regular sequence
      SQ             : SQR1_SQ_Field := (As_Array => False, Val => 16#0#);
      --  Regular channel sequence length
      L              : SQR1_L_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F40x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SQR1_Register use record
      SQ             at 0 range 0 .. 19;
      L              at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  SQR2_SQ array element
   subtype SQR2_SQ_Element is STM32F40x.UInt5;

   --  SQR2_SQ array
   type SQR2_SQ_Field_Array is array (7 .. 12) of SQR2_SQ_Element
     with Component_Size => 5, Size => 30;

   --  Type definition for SQR2_SQ
   type SQR2_SQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SQ as a value
            Val : STM32F40x.UInt30;
         when True =>
            --  SQ as an array
            Arr : SQR2_SQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for SQR2_SQ_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   --  regular sequence register 2
   type SQR2_Register is record
      --  7th conversion in regular sequence
      SQ             : SQR2_SQ_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : STM32F40x.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SQR2_Register use record
      SQ             at 0 range 0 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  SQR3_SQ array element
   subtype SQR3_SQ_Element is STM32F40x.UInt5;

   --  SQR3_SQ array
   type SQR3_SQ_Field_Array is array (1 .. 6) of SQR3_SQ_Element
     with Component_Size => 5, Size => 30;

   --  Type definition for SQR3_SQ
   type SQR3_SQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SQ as a value
            Val : STM32F40x.UInt30;
         when True =>
            --  SQ as an array
            Arr : SQR3_SQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for SQR3_SQ_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   --  regular sequence register 3
   type SQR3_Register is record
      --  1st conversion in regular sequence
      SQ             : SQR3_SQ_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : STM32F40x.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SQR3_Register use record
      SQ             at 0 range 0 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  JSQR_JSQ array element
   subtype JSQR_JSQ_Element is STM32F40x.UInt5;

   --  JSQR_JSQ array
   type JSQR_JSQ_Field_Array is array (1 .. 4) of JSQR_JSQ_Element
     with Component_Size => 5, Size => 20;

   --  Type definition for JSQR_JSQ
   type JSQR_JSQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  JSQ as a value
            Val : STM32F40x.UInt20;
         when True =>
            --  JSQ as an array
            Arr : JSQR_JSQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 20;

   for JSQR_JSQ_Field use record
      Val at 0 range 0 .. 19;
      Arr at 0 range 0 .. 19;
   end record;

   subtype JSQR_JL_Field is STM32F40x.UInt2;

   --  injected sequence register
   type JSQR_Register is record
      --  1st conversion in injected sequence
      JSQ            : JSQR_JSQ_Field := (As_Array => False, Val => 16#0#);
      --  Injected sequence length
      JL             : JSQR_JL_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : STM32F40x.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for JSQR_Register use record
      JSQ            at 0 range 0 .. 19;
      JL             at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype JDR_JDATA_Field is STM32F40x.UInt16;

   --  injected data register x
   type JDR_Register is record
      --  Read-only. Injected data
      JDATA          : JDR_JDATA_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for JDR_Register use record
      JDATA          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DR_DATA_Field is STM32F40x.UInt16;

   --  regular data register
   type DR_Register is record
      --  Read-only. Regular data
      DATA           : DR_DATA_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DATA           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CSR_AWD1_Field is STM32F40x.Bit;
   subtype CSR_EOC1_Field is STM32F40x.Bit;
   subtype CSR_JEOC1_Field is STM32F40x.Bit;
   subtype CSR_JSTRT1_Field is STM32F40x.Bit;
   subtype CSR_STRT1_Field is STM32F40x.Bit;
   subtype CSR_OVR1_Field is STM32F40x.Bit;
   subtype CSR_AWD2_Field is STM32F40x.Bit;
   subtype CSR_EOC2_Field is STM32F40x.Bit;
   subtype CSR_JEOC2_Field is STM32F40x.Bit;
   subtype CSR_JSTRT2_Field is STM32F40x.Bit;
   subtype CSR_STRT2_Field is STM32F40x.Bit;
   subtype CSR_OVR2_Field is STM32F40x.Bit;
   subtype CSR_AWD3_Field is STM32F40x.Bit;
   subtype CSR_EOC3_Field is STM32F40x.Bit;
   subtype CSR_JEOC3_Field is STM32F40x.Bit;
   subtype CSR_JSTRT3_Field is STM32F40x.Bit;
   subtype CSR_STRT3_Field is STM32F40x.Bit;
   subtype CSR_OVR3_Field is STM32F40x.Bit;

   --  ADC Common status register
   type CSR_Register is record
      --  Read-only. Analog watchdog flag of ADC 1
      AWD1           : CSR_AWD1_Field;
      --  Read-only. End of conversion of ADC 1
      EOC1           : CSR_EOC1_Field;
      --  Read-only. Injected channel end of conversion of ADC 1
      JEOC1          : CSR_JEOC1_Field;
      --  Read-only. Injected channel Start flag of ADC 1
      JSTRT1         : CSR_JSTRT1_Field;
      --  Read-only. Regular channel Start flag of ADC 1
      STRT1          : CSR_STRT1_Field;
      --  Read-only. Overrun flag of ADC 1
      OVR1           : CSR_OVR1_Field;
      --  unspecified
      Reserved_6_7   : STM32F40x.UInt2;
      --  Read-only. Analog watchdog flag of ADC 2
      AWD2           : CSR_AWD2_Field;
      --  Read-only. End of conversion of ADC 2
      EOC2           : CSR_EOC2_Field;
      --  Read-only. Injected channel end of conversion of ADC 2
      JEOC2          : CSR_JEOC2_Field;
      --  Read-only. Injected channel Start flag of ADC 2
      JSTRT2         : CSR_JSTRT2_Field;
      --  Read-only. Regular channel Start flag of ADC 2
      STRT2          : CSR_STRT2_Field;
      --  Read-only. Overrun flag of ADC 2
      OVR2           : CSR_OVR2_Field;
      --  unspecified
      Reserved_14_15 : STM32F40x.UInt2;
      --  Read-only. Analog watchdog flag of ADC 3
      AWD3           : CSR_AWD3_Field;
      --  Read-only. End of conversion of ADC 3
      EOC3           : CSR_EOC3_Field;
      --  Read-only. Injected channel end of conversion of ADC 3
      JEOC3          : CSR_JEOC3_Field;
      --  Read-only. Injected channel Start flag of ADC 3
      JSTRT3         : CSR_JSTRT3_Field;
      --  Read-only. Regular channel Start flag of ADC 3
      STRT3          : CSR_STRT3_Field;
      --  Read-only. Overrun flag of ADC3
      OVR3           : CSR_OVR3_Field;
      --  unspecified
      Reserved_22_31 : STM32F40x.UInt10;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      AWD1           at 0 range 0 .. 0;
      EOC1           at 0 range 1 .. 1;
      JEOC1          at 0 range 2 .. 2;
      JSTRT1         at 0 range 3 .. 3;
      STRT1          at 0 range 4 .. 4;
      OVR1           at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      AWD2           at 0 range 8 .. 8;
      EOC2           at 0 range 9 .. 9;
      JEOC2          at 0 range 10 .. 10;
      JSTRT2         at 0 range 11 .. 11;
      STRT2          at 0 range 12 .. 12;
      OVR2           at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      AWD3           at 0 range 16 .. 16;
      EOC3           at 0 range 17 .. 17;
      JEOC3          at 0 range 18 .. 18;
      JSTRT3         at 0 range 19 .. 19;
      STRT3          at 0 range 20 .. 20;
      OVR3           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype CCR_MULT_Field is STM32F40x.UInt5;
   subtype CCR_DELAY_Field is STM32F40x.UInt4;
   subtype CCR_DDS_Field is STM32F40x.Bit;
   subtype CCR_DMA_Field is STM32F40x.UInt2;
   subtype CCR_ADCPRE_Field is STM32F40x.UInt2;
   subtype CCR_VBATE_Field is STM32F40x.Bit;
   subtype CCR_TSVREFE_Field is STM32F40x.Bit;

   --  ADC common control register
   type CCR_Register is record
      --  Multi ADC mode selection
      MULT           : CCR_MULT_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : STM32F40x.UInt3 := 16#0#;
      --  Delay between 2 sampling phases
      DELAY_k        : CCR_DELAY_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : STM32F40x.Bit := 16#0#;
      --  DMA disable selection for multi-ADC mode
      DDS            : CCR_DDS_Field := 16#0#;
      --  Direct memory access mode for multi ADC mode
      DMA            : CCR_DMA_Field := 16#0#;
      --  ADC prescaler
      ADCPRE         : CCR_ADCPRE_Field := 16#0#;
      --  unspecified
      Reserved_18_21 : STM32F40x.UInt4 := 16#0#;
      --  VBAT enable
      VBATE          : CCR_VBATE_Field := 16#0#;
      --  Temperature sensor and VREFINT enable
      TSVREFE        : CCR_TSVREFE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F40x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      MULT           at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DELAY_k        at 0 range 8 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      DDS            at 0 range 13 .. 13;
      DMA            at 0 range 14 .. 15;
      ADCPRE         at 0 range 16 .. 17;
      Reserved_18_21 at 0 range 18 .. 21;
      VBATE          at 0 range 22 .. 22;
      TSVREFE        at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  CDR_DATA array element
   subtype CDR_DATA_Element is STM32F40x.UInt16;

   --  CDR_DATA array
   type CDR_DATA_Field_Array is array (1 .. 2) of CDR_DATA_Element
     with Component_Size => 16, Size => 32;

   --  ADC common regular data register for dual and triple modes
   type CDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DATA as a value
            Val : STM32F40x.UInt32;
         when True =>
            --  DATA as an array
            Arr : CDR_DATA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Analog-to-digital converter
   type ADC1_Peripheral is record
      --  status register
      SR    : aliased SR_Register;
      pragma Volatile_Full_Access (SR);
      --  control register 1
      CR1   : aliased CR1_Register;
      pragma Volatile_Full_Access (CR1);
      --  control register 2
      CR2   : aliased CR2_Register;
      pragma Volatile_Full_Access (CR2);
      --  sample time register 1
      SMPR1 : aliased SMPR1_Register;
      pragma Volatile_Full_Access (SMPR1);
      --  sample time register 2
      SMPR2 : aliased SMPR2_Register;
      pragma Volatile_Full_Access (SMPR2);
      --  injected channel data offset register x
      JOFR1 : aliased JOFR1_Register;
      pragma Volatile_Full_Access (JOFR1);
      --  injected channel data offset register x
      JOFR2 : aliased JOFR2_Register;
      pragma Volatile_Full_Access (JOFR2);
      --  injected channel data offset register x
      JOFR3 : aliased JOFR3_Register;
      pragma Volatile_Full_Access (JOFR3);
      --  injected channel data offset register x
      JOFR4 : aliased JOFR4_Register;
      pragma Volatile_Full_Access (JOFR4);
      --  watchdog higher threshold register
      HTR   : aliased HTR_Register;
      pragma Volatile_Full_Access (HTR);
      --  watchdog lower threshold register
      LTR   : aliased LTR_Register;
      pragma Volatile_Full_Access (LTR);
      --  regular sequence register 1
      SQR1  : aliased SQR1_Register;
      pragma Volatile_Full_Access (SQR1);
      --  regular sequence register 2
      SQR2  : aliased SQR2_Register;
      pragma Volatile_Full_Access (SQR2);
      --  regular sequence register 3
      SQR3  : aliased SQR3_Register;
      pragma Volatile_Full_Access (SQR3);
      --  injected sequence register
      JSQR  : aliased JSQR_Register;
      pragma Volatile_Full_Access (JSQR);
      --  injected data register x
      JDR1  : aliased JDR_Register;
      pragma Volatile_Full_Access (JDR1);
      --  injected data register x
      JDR2  : aliased JDR_Register;
      pragma Volatile_Full_Access (JDR2);
      --  injected data register x
      JDR3  : aliased JDR_Register;
      pragma Volatile_Full_Access (JDR3);
      --  injected data register x
      JDR4  : aliased JDR_Register;
      pragma Volatile_Full_Access (JDR4);
      --  regular data register
      DR    : aliased DR_Register;
      pragma Volatile_Full_Access (DR);
   end record
     with Volatile;

   for ADC1_Peripheral use record
      SR    at 16#0# range 0 .. 31;
      CR1   at 16#4# range 0 .. 31;
      CR2   at 16#8# range 0 .. 31;
      SMPR1 at 16#C# range 0 .. 31;
      SMPR2 at 16#10# range 0 .. 31;
      JOFR1 at 16#14# range 0 .. 31;
      JOFR2 at 16#18# range 0 .. 31;
      JOFR3 at 16#1C# range 0 .. 31;
      JOFR4 at 16#20# range 0 .. 31;
      HTR   at 16#24# range 0 .. 31;
      LTR   at 16#28# range 0 .. 31;
      SQR1  at 16#2C# range 0 .. 31;
      SQR2  at 16#30# range 0 .. 31;
      SQR3  at 16#34# range 0 .. 31;
      JSQR  at 16#38# range 0 .. 31;
      JDR1  at 16#3C# range 0 .. 31;
      JDR2  at 16#40# range 0 .. 31;
      JDR3  at 16#44# range 0 .. 31;
      JDR4  at 16#48# range 0 .. 31;
      DR    at 16#4C# range 0 .. 31;
   end record;

   --  Analog-to-digital converter
   ADC1_Periph : aliased ADC1_Peripheral
     with Import, Address => ADC1_Base;

   --  Analog-to-digital converter
   ADC2_Periph : aliased ADC1_Peripheral
     with Import, Address => ADC2_Base;

   --  Analog-to-digital converter
   ADC3_Periph : aliased ADC1_Peripheral
     with Import, Address => ADC3_Base;

   --  Common ADC registers
   type C_ADC_Peripheral is record
      --  ADC Common status register
      CSR : aliased CSR_Register;
      pragma Volatile_Full_Access (CSR);
      --  ADC common control register
      CCR : aliased CCR_Register;
      pragma Volatile_Full_Access (CCR);
      --  ADC common regular data register for dual and triple modes
      CDR : aliased CDR_Register;
      pragma Volatile_Full_Access (CDR);
   end record
     with Volatile;

   for C_ADC_Peripheral use record
      CSR at 16#0# range 0 .. 31;
      CCR at 16#4# range 0 .. 31;
      CDR at 16#8# range 0 .. 31;
   end record;

   --  Common ADC registers
   C_ADC_Periph : aliased C_ADC_Peripheral
     with Import, Address => C_ADC_Base;

end STM32F40x.ADC;
