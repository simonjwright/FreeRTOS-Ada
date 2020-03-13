pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F429x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F429x.LTDC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SSCR_VSH_Field is STM32F429x.UInt11;
   subtype SSCR_HSW_Field is STM32F429x.UInt12;

   --  Synchronization Size Configuration Register
   type SSCR_Register is record
      --  Vertical Synchronization Height (in units of horizontal scan line)
      VSH            : SSCR_VSH_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F429x.UInt5 := 16#0#;
      --  Horizontal Synchronization Width (in units of pixel clock period)
      HSW            : SSCR_HSW_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSCR_Register use record
      VSH            at 0 range 0 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      HSW            at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype BPCR_AVBP_Field is STM32F429x.UInt11;
   subtype BPCR_AHBP_Field is STM32F429x.UInt12;

   --  Back Porch Configuration Register
   type BPCR_Register is record
      --  Accumulated Vertical back porch (in units of horizontal scan line)
      AVBP           : BPCR_AVBP_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F429x.UInt5 := 16#0#;
      --  Accumulated Horizontal back porch (in units of pixel clock period)
      AHBP           : BPCR_AHBP_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BPCR_Register use record
      AVBP           at 0 range 0 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      AHBP           at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype AWCR_AAH_Field is STM32F429x.UInt11;
   subtype AWCR_AAW_Field is STM32F429x.UInt12;

   --  Active Width Configuration Register
   type AWCR_Register is record
      --  Accumulated Active Height (in units of horizontal scan line)
      AAH            : AWCR_AAH_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F429x.UInt5 := 16#0#;
      --  Accumulated Active Width (in units of pixel clock period)
      AAW            : AWCR_AAW_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for AWCR_Register use record
      AAH            at 0 range 0 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      AAW            at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype TWCR_TOTALH_Field is STM32F429x.UInt11;
   subtype TWCR_TOTALW_Field is STM32F429x.UInt12;

   --  Total Width Configuration Register
   type TWCR_Register is record
      --  Total Height (in units of horizontal scan line)
      TOTALH         : TWCR_TOTALH_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F429x.UInt5 := 16#0#;
      --  Total Width (in units of pixel clock period)
      TOTALW         : TWCR_TOTALW_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TWCR_Register use record
      TOTALH         at 0 range 0 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      TOTALW         at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype GCR_LTDCEN_Field is STM32F429x.Bit;
   subtype GCR_DBW_Field is STM32F429x.UInt3;
   subtype GCR_DGW_Field is STM32F429x.UInt3;
   subtype GCR_DRW_Field is STM32F429x.UInt3;
   subtype GCR_DEN_Field is STM32F429x.Bit;
   subtype GCR_PCPOL_Field is STM32F429x.Bit;
   subtype GCR_DEPOL_Field is STM32F429x.Bit;
   subtype GCR_VSPOL_Field is STM32F429x.Bit;
   subtype GCR_HSPOL_Field is STM32F429x.Bit;

   --  Global Control Register
   type GCR_Register is record
      --  LCD-TFT controller enable bit
      LTDCEN         : GCR_LTDCEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : STM32F429x.UInt3 := 16#0#;
      --  Read-only. Dither Blue Width
      DBW            : GCR_DBW_Field := 16#2#;
      --  unspecified
      Reserved_7_7   : STM32F429x.Bit := 16#0#;
      --  Read-only. Dither Green Width
      DGW            : GCR_DGW_Field := 16#2#;
      --  unspecified
      Reserved_11_11 : STM32F429x.Bit := 16#0#;
      --  Read-only. Dither Red Width
      DRW            : GCR_DRW_Field := 16#2#;
      --  unspecified
      Reserved_15_15 : STM32F429x.Bit := 16#0#;
      --  Dither Enable
      DEN            : GCR_DEN_Field := 16#0#;
      --  unspecified
      Reserved_17_27 : STM32F429x.UInt11 := 16#0#;
      --  Pixel Clock Polarity
      PCPOL          : GCR_PCPOL_Field := 16#0#;
      --  Data Enable Polarity
      DEPOL          : GCR_DEPOL_Field := 16#0#;
      --  Vertical Synchronization Polarity
      VSPOL          : GCR_VSPOL_Field := 16#0#;
      --  Horizontal Synchronization Polarity
      HSPOL          : GCR_HSPOL_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for GCR_Register use record
      LTDCEN         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DBW            at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      DGW            at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      DRW            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DEN            at 0 range 16 .. 16;
      Reserved_17_27 at 0 range 17 .. 27;
      PCPOL          at 0 range 28 .. 28;
      DEPOL          at 0 range 29 .. 29;
      VSPOL          at 0 range 30 .. 30;
      HSPOL          at 0 range 31 .. 31;
   end record;

   subtype SRCR_IMR_Field is STM32F429x.Bit;
   subtype SRCR_VBR_Field is STM32F429x.Bit;

   --  Shadow Reload Configuration Register
   type SRCR_Register is record
      --  Immediate Reload
      IMR           : SRCR_IMR_Field := 16#0#;
      --  Vertical Blanking Reload
      VBR           : SRCR_VBR_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32F429x.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SRCR_Register use record
      IMR           at 0 range 0 .. 0;
      VBR           at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype BCCR_BC_Field is STM32F429x.UInt24;

   --  Background Color Configuration Register
   type BCCR_Register is record
      --  Background Color Red value
      BC             : BCCR_BC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F429x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BCCR_Register use record
      BC             at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype IER_LIE_Field is STM32F429x.Bit;
   subtype IER_FUIE_Field is STM32F429x.Bit;
   subtype IER_TERRIE_Field is STM32F429x.Bit;
   subtype IER_RRIE_Field is STM32F429x.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Line Interrupt Enable
      LIE           : IER_LIE_Field := 16#0#;
      --  FIFO Underrun Interrupt Enable
      FUIE          : IER_FUIE_Field := 16#0#;
      --  Transfer Error Interrupt Enable
      TERRIE        : IER_TERRIE_Field := 16#0#;
      --  Register Reload interrupt enable
      RRIE          : IER_RRIE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32F429x.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      LIE           at 0 range 0 .. 0;
      FUIE          at 0 range 1 .. 1;
      TERRIE        at 0 range 2 .. 2;
      RRIE          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ISR_LIF_Field is STM32F429x.Bit;
   subtype ISR_FUIF_Field is STM32F429x.Bit;
   subtype ISR_TERRIF_Field is STM32F429x.Bit;
   subtype ISR_RRIF_Field is STM32F429x.Bit;

   --  Interrupt Status Register
   type ISR_Register is record
      --  Read-only. Line Interrupt flag
      LIF           : ISR_LIF_Field;
      --  Read-only. FIFO Underrun Interrupt flag
      FUIF          : ISR_FUIF_Field;
      --  Read-only. Transfer Error interrupt flag
      TERRIF        : ISR_TERRIF_Field;
      --  Read-only. Register Reload Interrupt Flag
      RRIF          : ISR_RRIF_Field;
      --  unspecified
      Reserved_4_31 : STM32F429x.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      LIF           at 0 range 0 .. 0;
      FUIF          at 0 range 1 .. 1;
      TERRIF        at 0 range 2 .. 2;
      RRIF          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ICR_CLIF_Field is STM32F429x.Bit;
   subtype ICR_CFUIF_Field is STM32F429x.Bit;
   subtype ICR_CTERRIF_Field is STM32F429x.Bit;
   subtype ICR_CRRIF_Field is STM32F429x.Bit;

   --  Interrupt Clear Register
   type ICR_Register is record
      --  Write-only. Clears the Line Interrupt Flag
      CLIF          : ICR_CLIF_Field := 16#0#;
      --  Write-only. Clears the FIFO Underrun Interrupt flag
      CFUIF         : ICR_CFUIF_Field := 16#0#;
      --  Write-only. Clears the Transfer Error Interrupt Flag
      CTERRIF       : ICR_CTERRIF_Field := 16#0#;
      --  Write-only. Clears Register Reload Interrupt Flag
      CRRIF         : ICR_CRRIF_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32F429x.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      CLIF          at 0 range 0 .. 0;
      CFUIF         at 0 range 1 .. 1;
      CTERRIF       at 0 range 2 .. 2;
      CRRIF         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype LIPCR_LIPOS_Field is STM32F429x.UInt11;

   --  Line Interrupt Position Configuration Register
   type LIPCR_Register is record
      --  Line Interrupt Position
      LIPOS          : LIPCR_LIPOS_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32F429x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for LIPCR_Register use record
      LIPOS          at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype CPSR_CYPOS_Field is STM32F429x.UInt16;
   subtype CPSR_CXPOS_Field is STM32F429x.UInt16;

   --  Current Position Status Register
   type CPSR_Register is record
      --  Read-only. Current Y Position
      CYPOS : CPSR_CYPOS_Field;
      --  Read-only. Current X Position
      CXPOS : CPSR_CXPOS_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CPSR_Register use record
      CYPOS at 0 range 0 .. 15;
      CXPOS at 0 range 16 .. 31;
   end record;

   subtype CDSR_VDES_Field is STM32F429x.Bit;
   subtype CDSR_HDES_Field is STM32F429x.Bit;
   subtype CDSR_VSYNCS_Field is STM32F429x.Bit;
   subtype CDSR_HSYNCS_Field is STM32F429x.Bit;

   --  Current Display Status Register
   type CDSR_Register is record
      --  Read-only. Vertical Data Enable display Status
      VDES          : CDSR_VDES_Field;
      --  Read-only. Horizontal Data Enable display Status
      HDES          : CDSR_HDES_Field;
      --  Read-only. Vertical Synchronization display Status
      VSYNCS        : CDSR_VSYNCS_Field;
      --  Read-only. Horizontal Synchronization display Status
      HSYNCS        : CDSR_HSYNCS_Field;
      --  unspecified
      Reserved_4_31 : STM32F429x.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CDSR_Register use record
      VDES          at 0 range 0 .. 0;
      HDES          at 0 range 1 .. 1;
      VSYNCS        at 0 range 2 .. 2;
      HSYNCS        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype L1CR_LEN_Field is STM32F429x.Bit;
   subtype L1CR_COLKEN_Field is STM32F429x.Bit;
   subtype L1CR_CLUTEN_Field is STM32F429x.Bit;

   --  Layerx Control Register
   type L1CR_Register is record
      --  Layer Enable
      LEN           : L1CR_LEN_Field := 16#0#;
      --  Color Keying Enable
      COLKEN        : L1CR_COLKEN_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : STM32F429x.UInt2 := 16#0#;
      --  Color Look-Up Table Enable
      CLUTEN        : L1CR_CLUTEN_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : STM32F429x.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1CR_Register use record
      LEN           at 0 range 0 .. 0;
      COLKEN        at 0 range 1 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      CLUTEN        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype L1WHPCR_WHSTPOS_Field is STM32F429x.UInt12;
   subtype L1WHPCR_WHSPPOS_Field is STM32F429x.UInt12;

   --  Layerx Window Horizontal Position Configuration Register
   type L1WHPCR_Register is record
      --  Window Horizontal Start Position
      WHSTPOS        : L1WHPCR_WHSTPOS_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : STM32F429x.UInt4 := 16#0#;
      --  Window Horizontal Stop Position
      WHSPPOS        : L1WHPCR_WHSPPOS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1WHPCR_Register use record
      WHSTPOS        at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      WHSPPOS        at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype L1WVPCR_WVSTPOS_Field is STM32F429x.UInt11;
   subtype L1WVPCR_WVSPPOS_Field is STM32F429x.UInt11;

   --  Layerx Window Vertical Position Configuration Register
   type L1WVPCR_Register is record
      --  Window Vertical Start Position
      WVSTPOS        : L1WVPCR_WVSTPOS_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F429x.UInt5 := 16#0#;
      --  Window Vertical Stop Position
      WVSPPOS        : L1WVPCR_WVSPPOS_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : STM32F429x.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1WVPCR_Register use record
      WVSTPOS        at 0 range 0 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      WVSPPOS        at 0 range 16 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype L1CKCR_CKBLUE_Field is STM32F429x.Byte;
   subtype L1CKCR_CKGREEN_Field is STM32F429x.Byte;
   subtype L1CKCR_CKRED_Field is STM32F429x.Byte;

   --  Layerx Color Keying Configuration Register
   type L1CKCR_Register is record
      --  Color Key Blue value
      CKBLUE         : L1CKCR_CKBLUE_Field := 16#0#;
      --  Color Key Green value
      CKGREEN        : L1CKCR_CKGREEN_Field := 16#0#;
      --  Color Key Red value
      CKRED          : L1CKCR_CKRED_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F429x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1CKCR_Register use record
      CKBLUE         at 0 range 0 .. 7;
      CKGREEN        at 0 range 8 .. 15;
      CKRED          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype L1PFCR_PF_Field is STM32F429x.UInt3;

   --  Layerx Pixel Format Configuration Register
   type L1PFCR_Register is record
      --  Pixel Format
      PF            : L1PFCR_PF_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32F429x.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1PFCR_Register use record
      PF            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype L1CACR_CONSTA_Field is STM32F429x.Byte;

   --  Layerx Constant Alpha Configuration Register
   type L1CACR_Register is record
      --  Constant Alpha
      CONSTA        : L1CACR_CONSTA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32F429x.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1CACR_Register use record
      CONSTA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype L1DCCR_DCBLUE_Field is STM32F429x.Byte;
   subtype L1DCCR_DCGREEN_Field is STM32F429x.Byte;
   subtype L1DCCR_DCRED_Field is STM32F429x.Byte;
   subtype L1DCCR_DCALPHA_Field is STM32F429x.Byte;

   --  Layerx Default Color Configuration Register
   type L1DCCR_Register is record
      --  Default Color Blue
      DCBLUE  : L1DCCR_DCBLUE_Field := 16#0#;
      --  Default Color Green
      DCGREEN : L1DCCR_DCGREEN_Field := 16#0#;
      --  Default Color Red
      DCRED   : L1DCCR_DCRED_Field := 16#0#;
      --  Default Color Alpha
      DCALPHA : L1DCCR_DCALPHA_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1DCCR_Register use record
      DCBLUE  at 0 range 0 .. 7;
      DCGREEN at 0 range 8 .. 15;
      DCRED   at 0 range 16 .. 23;
      DCALPHA at 0 range 24 .. 31;
   end record;

   subtype L1BFCR_BF2_Field is STM32F429x.UInt3;
   subtype L1BFCR_BF1_Field is STM32F429x.UInt3;

   --  Layerx Blending Factors Configuration Register
   type L1BFCR_Register is record
      --  Blending Factor 2
      BF2            : L1BFCR_BF2_Field := 16#7#;
      --  unspecified
      Reserved_3_7   : STM32F429x.UInt5 := 16#0#;
      --  Blending Factor 1
      BF1            : L1BFCR_BF1_Field := 16#6#;
      --  unspecified
      Reserved_11_31 : STM32F429x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1BFCR_Register use record
      BF2            at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      BF1            at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype L1CFBLR_CFBLL_Field is STM32F429x.UInt13;
   subtype L1CFBLR_CFBP_Field is STM32F429x.UInt13;

   --  Layerx Color Frame Buffer Length Register
   type L1CFBLR_Register is record
      --  Color Frame Buffer Line Length
      CFBLL          : L1CFBLR_CFBLL_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : STM32F429x.UInt3 := 16#0#;
      --  Color Frame Buffer Pitch in bytes
      CFBP           : L1CFBLR_CFBP_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : STM32F429x.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1CFBLR_Register use record
      CFBLL          at 0 range 0 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      CFBP           at 0 range 16 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype L1CFBLNR_CFBLNBR_Field is STM32F429x.UInt11;

   --  Layerx ColorFrame Buffer Line Number Register
   type L1CFBLNR_Register is record
      --  Frame Buffer Line Number
      CFBLNBR        : L1CFBLNR_CFBLNBR_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32F429x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1CFBLNR_Register use record
      CFBLNBR        at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype L1CLUTWR_BLUE_Field is STM32F429x.Byte;
   subtype L1CLUTWR_GREEN_Field is STM32F429x.Byte;
   subtype L1CLUTWR_RED_Field is STM32F429x.Byte;
   subtype L1CLUTWR_CLUTADD_Field is STM32F429x.Byte;

   --  Layerx CLUT Write Register
   type L1CLUTWR_Register is record
      --  Write-only. Blue value
      BLUE    : L1CLUTWR_BLUE_Field := 16#0#;
      --  Write-only. Green value
      GREEN   : L1CLUTWR_GREEN_Field := 16#0#;
      --  Write-only. Red value
      RED     : L1CLUTWR_RED_Field := 16#0#;
      --  Write-only. CLUT Address
      CLUTADD : L1CLUTWR_CLUTADD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L1CLUTWR_Register use record
      BLUE    at 0 range 0 .. 7;
      GREEN   at 0 range 8 .. 15;
      RED     at 0 range 16 .. 23;
      CLUTADD at 0 range 24 .. 31;
   end record;

   subtype L2CR_LEN_Field is STM32F429x.Bit;
   subtype L2CR_COLKEN_Field is STM32F429x.Bit;
   subtype L2CR_CLUTEN_Field is STM32F429x.Bit;

   --  Layerx Control Register
   type L2CR_Register is record
      --  Layer Enable
      LEN           : L2CR_LEN_Field := 16#0#;
      --  Color Keying Enable
      COLKEN        : L2CR_COLKEN_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : STM32F429x.UInt2 := 16#0#;
      --  Color Look-Up Table Enable
      CLUTEN        : L2CR_CLUTEN_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : STM32F429x.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2CR_Register use record
      LEN           at 0 range 0 .. 0;
      COLKEN        at 0 range 1 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      CLUTEN        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype L2WHPCR_WHSTPOS_Field is STM32F429x.UInt12;
   subtype L2WHPCR_WHSPPOS_Field is STM32F429x.UInt12;

   --  Layerx Window Horizontal Position Configuration Register
   type L2WHPCR_Register is record
      --  Window Horizontal Start Position
      WHSTPOS        : L2WHPCR_WHSTPOS_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : STM32F429x.UInt4 := 16#0#;
      --  Window Horizontal Stop Position
      WHSPPOS        : L2WHPCR_WHSPPOS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2WHPCR_Register use record
      WHSTPOS        at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      WHSPPOS        at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype L2WVPCR_WVSTPOS_Field is STM32F429x.UInt11;
   subtype L2WVPCR_WVSPPOS_Field is STM32F429x.UInt11;

   --  Layerx Window Vertical Position Configuration Register
   type L2WVPCR_Register is record
      --  Window Vertical Start Position
      WVSTPOS        : L2WVPCR_WVSTPOS_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F429x.UInt5 := 16#0#;
      --  Window Vertical Stop Position
      WVSPPOS        : L2WVPCR_WVSPPOS_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : STM32F429x.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2WVPCR_Register use record
      WVSTPOS        at 0 range 0 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      WVSPPOS        at 0 range 16 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype L2CKCR_CKBLUE_Field is STM32F429x.Byte;
   subtype L2CKCR_CKGREEN_Field is STM32F429x.UInt7;
   subtype L2CKCR_CKRED_Field is STM32F429x.UInt9;

   --  Layerx Color Keying Configuration Register
   type L2CKCR_Register is record
      --  Color Key Blue value
      CKBLUE         : L2CKCR_CKBLUE_Field := 16#0#;
      --  Color Key Green value
      CKGREEN        : L2CKCR_CKGREEN_Field := 16#0#;
      --  Color Key Red value
      CKRED          : L2CKCR_CKRED_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F429x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2CKCR_Register use record
      CKBLUE         at 0 range 0 .. 7;
      CKGREEN        at 0 range 8 .. 14;
      CKRED          at 0 range 15 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype L2PFCR_PF_Field is STM32F429x.UInt3;

   --  Layerx Pixel Format Configuration Register
   type L2PFCR_Register is record
      --  Pixel Format
      PF            : L2PFCR_PF_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32F429x.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2PFCR_Register use record
      PF            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype L2CACR_CONSTA_Field is STM32F429x.Byte;

   --  Layerx Constant Alpha Configuration Register
   type L2CACR_Register is record
      --  Constant Alpha
      CONSTA        : L2CACR_CONSTA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32F429x.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2CACR_Register use record
      CONSTA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype L2DCCR_DCBLUE_Field is STM32F429x.Byte;
   subtype L2DCCR_DCGREEN_Field is STM32F429x.Byte;
   subtype L2DCCR_DCRED_Field is STM32F429x.Byte;
   subtype L2DCCR_DCALPHA_Field is STM32F429x.Byte;

   --  Layerx Default Color Configuration Register
   type L2DCCR_Register is record
      --  Default Color Blue
      DCBLUE  : L2DCCR_DCBLUE_Field := 16#0#;
      --  Default Color Green
      DCGREEN : L2DCCR_DCGREEN_Field := 16#0#;
      --  Default Color Red
      DCRED   : L2DCCR_DCRED_Field := 16#0#;
      --  Default Color Alpha
      DCALPHA : L2DCCR_DCALPHA_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2DCCR_Register use record
      DCBLUE  at 0 range 0 .. 7;
      DCGREEN at 0 range 8 .. 15;
      DCRED   at 0 range 16 .. 23;
      DCALPHA at 0 range 24 .. 31;
   end record;

   subtype L2BFCR_BF2_Field is STM32F429x.UInt3;
   subtype L2BFCR_BF1_Field is STM32F429x.UInt3;

   --  Layerx Blending Factors Configuration Register
   type L2BFCR_Register is record
      --  Blending Factor 2
      BF2            : L2BFCR_BF2_Field := 16#7#;
      --  unspecified
      Reserved_3_7   : STM32F429x.UInt5 := 16#0#;
      --  Blending Factor 1
      BF1            : L2BFCR_BF1_Field := 16#6#;
      --  unspecified
      Reserved_11_31 : STM32F429x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2BFCR_Register use record
      BF2            at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      BF1            at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype L2CFBLR_CFBLL_Field is STM32F429x.UInt13;
   subtype L2CFBLR_CFBP_Field is STM32F429x.UInt13;

   --  Layerx Color Frame Buffer Length Register
   type L2CFBLR_Register is record
      --  Color Frame Buffer Line Length
      CFBLL          : L2CFBLR_CFBLL_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : STM32F429x.UInt3 := 16#0#;
      --  Color Frame Buffer Pitch in bytes
      CFBP           : L2CFBLR_CFBP_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : STM32F429x.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2CFBLR_Register use record
      CFBLL          at 0 range 0 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      CFBP           at 0 range 16 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype L2CFBLNR_CFBLNBR_Field is STM32F429x.UInt11;

   --  Layerx ColorFrame Buffer Line Number Register
   type L2CFBLNR_Register is record
      --  Frame Buffer Line Number
      CFBLNBR        : L2CFBLNR_CFBLNBR_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32F429x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2CFBLNR_Register use record
      CFBLNBR        at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype L2CLUTWR_BLUE_Field is STM32F429x.Byte;
   subtype L2CLUTWR_GREEN_Field is STM32F429x.Byte;
   subtype L2CLUTWR_RED_Field is STM32F429x.Byte;
   subtype L2CLUTWR_CLUTADD_Field is STM32F429x.Byte;

   --  Layerx CLUT Write Register
   type L2CLUTWR_Register is record
      --  Write-only. Blue value
      BLUE    : L2CLUTWR_BLUE_Field := 16#0#;
      --  Write-only. Green value
      GREEN   : L2CLUTWR_GREEN_Field := 16#0#;
      --  Write-only. Red value
      RED     : L2CLUTWR_RED_Field := 16#0#;
      --  Write-only. CLUT Address
      CLUTADD : L2CLUTWR_CLUTADD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for L2CLUTWR_Register use record
      BLUE    at 0 range 0 .. 7;
      GREEN   at 0 range 8 .. 15;
      RED     at 0 range 16 .. 23;
      CLUTADD at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  LCD-TFT Controller
   type LTDC_Peripheral is record
      --  Synchronization Size Configuration Register
      SSCR     : aliased SSCR_Register;
      pragma Volatile_Full_Access (SSCR);
      --  Back Porch Configuration Register
      BPCR     : aliased BPCR_Register;
      pragma Volatile_Full_Access (BPCR);
      --  Active Width Configuration Register
      AWCR     : aliased AWCR_Register;
      pragma Volatile_Full_Access (AWCR);
      --  Total Width Configuration Register
      TWCR     : aliased TWCR_Register;
      pragma Volatile_Full_Access (TWCR);
      --  Global Control Register
      GCR      : aliased GCR_Register;
      pragma Volatile_Full_Access (GCR);
      --  Shadow Reload Configuration Register
      SRCR     : aliased SRCR_Register;
      pragma Volatile_Full_Access (SRCR);
      --  Background Color Configuration Register
      BCCR     : aliased BCCR_Register;
      pragma Volatile_Full_Access (BCCR);
      --  Interrupt Enable Register
      IER      : aliased IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Status Register
      ISR      : aliased ISR_Register;
      pragma Volatile_Full_Access (ISR);
      --  Interrupt Clear Register
      ICR      : aliased ICR_Register;
      pragma Volatile_Full_Access (ICR);
      --  Line Interrupt Position Configuration Register
      LIPCR    : aliased LIPCR_Register;
      pragma Volatile_Full_Access (LIPCR);
      --  Current Position Status Register
      CPSR     : aliased CPSR_Register;
      pragma Volatile_Full_Access (CPSR);
      --  Current Display Status Register
      CDSR     : aliased CDSR_Register;
      pragma Volatile_Full_Access (CDSR);
      --  Layerx Control Register
      L1CR     : aliased L1CR_Register;
      pragma Volatile_Full_Access (L1CR);
      --  Layerx Window Horizontal Position Configuration Register
      L1WHPCR  : aliased L1WHPCR_Register;
      pragma Volatile_Full_Access (L1WHPCR);
      --  Layerx Window Vertical Position Configuration Register
      L1WVPCR  : aliased L1WVPCR_Register;
      pragma Volatile_Full_Access (L1WVPCR);
      --  Layerx Color Keying Configuration Register
      L1CKCR   : aliased L1CKCR_Register;
      pragma Volatile_Full_Access (L1CKCR);
      --  Layerx Pixel Format Configuration Register
      L1PFCR   : aliased L1PFCR_Register;
      pragma Volatile_Full_Access (L1PFCR);
      --  Layerx Constant Alpha Configuration Register
      L1CACR   : aliased L1CACR_Register;
      pragma Volatile_Full_Access (L1CACR);
      --  Layerx Default Color Configuration Register
      L1DCCR   : aliased L1DCCR_Register;
      pragma Volatile_Full_Access (L1DCCR);
      --  Layerx Blending Factors Configuration Register
      L1BFCR   : aliased L1BFCR_Register;
      pragma Volatile_Full_Access (L1BFCR);
      --  Layerx Color Frame Buffer Address Register
      L1CFBAR  : aliased STM32F429x.UInt32;
      --  Layerx Color Frame Buffer Length Register
      L1CFBLR  : aliased L1CFBLR_Register;
      pragma Volatile_Full_Access (L1CFBLR);
      --  Layerx ColorFrame Buffer Line Number Register
      L1CFBLNR : aliased L1CFBLNR_Register;
      pragma Volatile_Full_Access (L1CFBLNR);
      --  Layerx CLUT Write Register
      L1CLUTWR : aliased L1CLUTWR_Register;
      pragma Volatile_Full_Access (L1CLUTWR);
      --  Layerx Control Register
      L2CR     : aliased L2CR_Register;
      pragma Volatile_Full_Access (L2CR);
      --  Layerx Window Horizontal Position Configuration Register
      L2WHPCR  : aliased L2WHPCR_Register;
      pragma Volatile_Full_Access (L2WHPCR);
      --  Layerx Window Vertical Position Configuration Register
      L2WVPCR  : aliased L2WVPCR_Register;
      pragma Volatile_Full_Access (L2WVPCR);
      --  Layerx Color Keying Configuration Register
      L2CKCR   : aliased L2CKCR_Register;
      pragma Volatile_Full_Access (L2CKCR);
      --  Layerx Pixel Format Configuration Register
      L2PFCR   : aliased L2PFCR_Register;
      pragma Volatile_Full_Access (L2PFCR);
      --  Layerx Constant Alpha Configuration Register
      L2CACR   : aliased L2CACR_Register;
      pragma Volatile_Full_Access (L2CACR);
      --  Layerx Default Color Configuration Register
      L2DCCR   : aliased L2DCCR_Register;
      pragma Volatile_Full_Access (L2DCCR);
      --  Layerx Blending Factors Configuration Register
      L2BFCR   : aliased L2BFCR_Register;
      pragma Volatile_Full_Access (L2BFCR);
      --  Layerx Color Frame Buffer Address Register
      L2CFBAR  : aliased STM32F429x.UInt32;
      --  Layerx Color Frame Buffer Length Register
      L2CFBLR  : aliased L2CFBLR_Register;
      pragma Volatile_Full_Access (L2CFBLR);
      --  Layerx ColorFrame Buffer Line Number Register
      L2CFBLNR : aliased L2CFBLNR_Register;
      pragma Volatile_Full_Access (L2CFBLNR);
      --  Layerx CLUT Write Register
      L2CLUTWR : aliased L2CLUTWR_Register;
      pragma Volatile_Full_Access (L2CLUTWR);
   end record
     with Volatile;

   for LTDC_Peripheral use record
      SSCR     at 16#8# range 0 .. 31;
      BPCR     at 16#C# range 0 .. 31;
      AWCR     at 16#10# range 0 .. 31;
      TWCR     at 16#14# range 0 .. 31;
      GCR      at 16#18# range 0 .. 31;
      SRCR     at 16#24# range 0 .. 31;
      BCCR     at 16#2C# range 0 .. 31;
      IER      at 16#34# range 0 .. 31;
      ISR      at 16#38# range 0 .. 31;
      ICR      at 16#3C# range 0 .. 31;
      LIPCR    at 16#40# range 0 .. 31;
      CPSR     at 16#44# range 0 .. 31;
      CDSR     at 16#48# range 0 .. 31;
      L1CR     at 16#84# range 0 .. 31;
      L1WHPCR  at 16#88# range 0 .. 31;
      L1WVPCR  at 16#8C# range 0 .. 31;
      L1CKCR   at 16#90# range 0 .. 31;
      L1PFCR   at 16#94# range 0 .. 31;
      L1CACR   at 16#98# range 0 .. 31;
      L1DCCR   at 16#9C# range 0 .. 31;
      L1BFCR   at 16#A0# range 0 .. 31;
      L1CFBAR  at 16#AC# range 0 .. 31;
      L1CFBLR  at 16#B0# range 0 .. 31;
      L1CFBLNR at 16#B4# range 0 .. 31;
      L1CLUTWR at 16#C4# range 0 .. 31;
      L2CR     at 16#104# range 0 .. 31;
      L2WHPCR  at 16#108# range 0 .. 31;
      L2WVPCR  at 16#10C# range 0 .. 31;
      L2CKCR   at 16#110# range 0 .. 31;
      L2PFCR   at 16#114# range 0 .. 31;
      L2CACR   at 16#118# range 0 .. 31;
      L2DCCR   at 16#11C# range 0 .. 31;
      L2BFCR   at 16#120# range 0 .. 31;
      L2CFBAR  at 16#12C# range 0 .. 31;
      L2CFBLR  at 16#130# range 0 .. 31;
      L2CFBLNR at 16#134# range 0 .. 31;
      L2CLUTWR at 16#144# range 0 .. 31;
   end record;

   --  LCD-TFT Controller
   LTDC_Periph : aliased LTDC_Peripheral
     with Import, Address => LTDC_Base;

end STM32F429x.LTDC;
