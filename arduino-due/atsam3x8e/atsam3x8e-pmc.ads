--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Power Management Controller
package ATSAM3X8E.PMC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- PMC_SCER_Register --
   -----------------------

   subtype PMC_SCER_UOTGCLK_Field is ATSAM3X8E.Bit;

   ------------------
   -- PMC_SCER.PCK --
   ------------------

   --  PMC_SCER_PCK array element
   subtype PMC_SCER_PCK_Element is ATSAM3X8E.Bit;

   --  PMC_SCER_PCK array
   type PMC_SCER_PCK_Field_Array is array (0 .. 2) of PMC_SCER_PCK_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_SCER_PCK
   type PMC_SCER_PCK_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCK as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCK as an array
            Arr : PMC_SCER_PCK_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_SCER_PCK_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  System Clock Enable Register
   type PMC_SCER_Register is record
      --  unspecified
      Reserved_0_4   : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Enable USB OTG Clock (48 MHz, USB_48M) for UTMI
      UOTGCLK        : PMC_SCER_UOTGCLK_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Programmable Clock 0 Output Enable
      PCK            : PMC_SCER_PCK_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_SCER_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      UOTGCLK        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      PCK            at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   -----------------------
   -- PMC_SCDR_Register --
   -----------------------

   subtype PMC_SCDR_UOTGCLK_Field is ATSAM3X8E.Bit;

   ------------------
   -- PMC_SCDR.PCK --
   ------------------

   --  PMC_SCDR_PCK array element
   subtype PMC_SCDR_PCK_Element is ATSAM3X8E.Bit;

   --  PMC_SCDR_PCK array
   type PMC_SCDR_PCK_Field_Array is array (0 .. 2) of PMC_SCDR_PCK_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_SCDR_PCK
   type PMC_SCDR_PCK_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCK as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCK as an array
            Arr : PMC_SCDR_PCK_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_SCDR_PCK_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  System Clock Disable Register
   type PMC_SCDR_Register is record
      --  unspecified
      Reserved_0_4   : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Disable USB OTG Clock (48 MHz, USB_48M) for UTMI
      UOTGCLK        : PMC_SCDR_UOTGCLK_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Programmable Clock 0 Output Disable
      PCK            : PMC_SCDR_PCK_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_SCDR_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      UOTGCLK        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      PCK            at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   -----------------------
   -- PMC_SCSR_Register --
   -----------------------

   subtype PMC_SCSR_UOTGCLK_Field is ATSAM3X8E.Bit;

   ------------------
   -- PMC_SCSR.PCK --
   ------------------

   --  PMC_SCSR_PCK array element
   subtype PMC_SCSR_PCK_Element is ATSAM3X8E.Bit;

   --  PMC_SCSR_PCK array
   type PMC_SCSR_PCK_Field_Array is array (0 .. 2) of PMC_SCSR_PCK_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_SCSR_PCK
   type PMC_SCSR_PCK_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCK as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCK as an array
            Arr : PMC_SCSR_PCK_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_SCSR_PCK_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  System Clock Status Register
   type PMC_SCSR_Register is record
      --  unspecified
      Reserved_0_4   : ATSAM3X8E.UInt5;
      --  Read-only. USB OTG Clock (48 MHz, USB_48M) Clock Status
      UOTGCLK        : PMC_SCSR_UOTGCLK_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Programmable Clock 0 Output Status
      PCK            : PMC_SCSR_PCK_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_SCSR_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      UOTGCLK        at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      PCK            at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ------------------------
   -- PMC_PCER0_Register --
   ------------------------

   -------------------
   -- PMC_PCER0.PID --
   -------------------

   --  PMC_PCER0_PID array element
   subtype PMC_PCER0_PID_Element is ATSAM3X8E.Bit;

   --  PMC_PCER0_PID array
   type PMC_PCER0_PID_Field_Array is array (2 .. 31) of PMC_PCER0_PID_Element
     with Component_Size => 1, Size => 30;

   --  Type definition for PMC_PCER0_PID
   type PMC_PCER0_PID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PID as a value
            Val : ATSAM3X8E.UInt30;
         when True =>
            --  PID as an array
            Arr : PMC_PCER0_PID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for PMC_PCER0_PID_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   --  Peripheral Clock Enable Register 0
   type PMC_PCER0_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Peripheral Clock 2 Enable
      PID          : PMC_PCER0_PID_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCER0_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      PID          at 0 range 2 .. 31;
   end record;

   ------------------------
   -- PMC_PCDR0_Register --
   ------------------------

   -------------------
   -- PMC_PCDR0.PID --
   -------------------

   --  PMC_PCDR0_PID array element
   subtype PMC_PCDR0_PID_Element is ATSAM3X8E.Bit;

   --  PMC_PCDR0_PID array
   type PMC_PCDR0_PID_Field_Array is array (2 .. 31) of PMC_PCDR0_PID_Element
     with Component_Size => 1, Size => 30;

   --  Type definition for PMC_PCDR0_PID
   type PMC_PCDR0_PID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PID as a value
            Val : ATSAM3X8E.UInt30;
         when True =>
            --  PID as an array
            Arr : PMC_PCDR0_PID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for PMC_PCDR0_PID_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   --  Peripheral Clock Disable Register 0
   type PMC_PCDR0_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Peripheral Clock 2 Disable
      PID          : PMC_PCDR0_PID_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCDR0_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      PID          at 0 range 2 .. 31;
   end record;

   ------------------------
   -- PMC_PCSR0_Register --
   ------------------------

   -------------------
   -- PMC_PCSR0.PID --
   -------------------

   --  PMC_PCSR0_PID array element
   subtype PMC_PCSR0_PID_Element is ATSAM3X8E.Bit;

   --  PMC_PCSR0_PID array
   type PMC_PCSR0_PID_Field_Array is array (2 .. 31) of PMC_PCSR0_PID_Element
     with Component_Size => 1, Size => 30;

   --  Type definition for PMC_PCSR0_PID
   type PMC_PCSR0_PID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PID as a value
            Val : ATSAM3X8E.UInt30;
         when True =>
            --  PID as an array
            Arr : PMC_PCSR0_PID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for PMC_PCSR0_PID_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   --  Peripheral Clock Status Register 0
   type PMC_PCSR0_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2;
      --  Read-only. Peripheral Clock 2 Status
      PID          : PMC_PCSR0_PID_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCSR0_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      PID          at 0 range 2 .. 31;
   end record;

   ------------------------
   -- CKGR_UCKR_Register --
   ------------------------

   subtype CKGR_UCKR_UPLLEN_Field is ATSAM3X8E.Bit;
   subtype CKGR_UCKR_UPLLCOUNT_Field is ATSAM3X8E.UInt4;

   --  UTMI Clock Register
   type CKGR_UCKR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.Short := 16#800#;
      --  UTMI PLL Enable
      UPLLEN         : CKGR_UCKR_UPLLEN_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  UTMI PLL Start-up Time
      UPLLCOUNT      : CKGR_UCKR_UPLLCOUNT_Field := 16#2#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#10#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CKGR_UCKR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      UPLLEN         at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      UPLLCOUNT      at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------------
   -- CKGR_MOR_Register --
   -----------------------

   subtype CKGR_MOR_MOSCXTEN_Field is ATSAM3X8E.Bit;
   subtype CKGR_MOR_MOSCXTBY_Field is ATSAM3X8E.Bit;
   subtype CKGR_MOR_MOSCRCEN_Field is ATSAM3X8E.Bit;

   --  Main On-Chip RC Oscillator Frequency Selection
   type MOSCRCF_Field is
     (
      --  The Fast RC Oscillator Frequency is at 4 MHz (default)
      MOSCRCF_Field_4_Mhz,
      --  The Fast RC Oscillator Frequency is at 8 MHz
      MOSCRCF_Field_8_Mhz,
      --  The Fast RC Oscillator Frequency is at 12 MHz
      MOSCRCF_Field_12_Mhz)
     with Size => 3;
   for MOSCRCF_Field use
     (MOSCRCF_Field_4_Mhz => 0,
      MOSCRCF_Field_8_Mhz => 1,
      MOSCRCF_Field_12_Mhz => 2);

   subtype CKGR_MOR_MOSCXTST_Field is ATSAM3X8E.Byte;
   subtype CKGR_MOR_KEY_Field is ATSAM3X8E.Byte;
   subtype CKGR_MOR_MOSCSEL_Field is ATSAM3X8E.Bit;
   subtype CKGR_MOR_CFDEN_Field is ATSAM3X8E.Bit;

   --  Main Oscillator Register
   type CKGR_MOR_Register is record
      --  Main Crystal Oscillator Enable
      MOSCXTEN       : CKGR_MOR_MOSCXTEN_Field := 16#1#;
      --  Main Crystal Oscillator Bypass
      MOSCXTBY       : CKGR_MOR_MOSCXTBY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Main On-Chip RC Oscillator Enable
      MOSCRCEN       : CKGR_MOR_MOSCRCEN_Field := 16#0#;
      --  Main On-Chip RC Oscillator Frequency Selection
      MOSCRCF        : MOSCRCF_Field := MOSCRCF_Field_4_Mhz;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Main Crystal Oscillator Start-up Time
      MOSCXTST       : CKGR_MOR_MOSCXTST_Field := 16#0#;
      --  Password
      KEY            : CKGR_MOR_KEY_Field := 16#0#;
      --  Main Oscillator Selection
      MOSCSEL        : CKGR_MOR_MOSCSEL_Field := 16#0#;
      --  Clock Failure Detector Enable
      CFDEN          : CKGR_MOR_CFDEN_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : ATSAM3X8E.UInt6 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CKGR_MOR_Register use record
      MOSCXTEN       at 0 range 0 .. 0;
      MOSCXTBY       at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MOSCRCEN       at 0 range 3 .. 3;
      MOSCRCF        at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MOSCXTST       at 0 range 8 .. 15;
      KEY            at 0 range 16 .. 23;
      MOSCSEL        at 0 range 24 .. 24;
      CFDEN          at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   ------------------------
   -- CKGR_MCFR_Register --
   ------------------------

   subtype CKGR_MCFR_MAINF_Field is ATSAM3X8E.Short;
   subtype CKGR_MCFR_MAINFRDY_Field is ATSAM3X8E.Bit;

   --  Main Clock Frequency Register
   type CKGR_MCFR_Register is record
      --  Read-only. Main Clock Frequency
      MAINF          : CKGR_MCFR_MAINF_Field := 16#0#;
      --  Read-only. Main Clock Ready
      MAINFRDY       : CKGR_MCFR_MAINFRDY_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CKGR_MCFR_Register use record
      MAINF          at 0 range 0 .. 15;
      MAINFRDY       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   -------------------------
   -- CKGR_PLLAR_Register --
   -------------------------

   subtype CKGR_PLLAR_DIVA_Field is ATSAM3X8E.Byte;
   subtype CKGR_PLLAR_PLLACOUNT_Field is ATSAM3X8E.UInt6;
   subtype CKGR_PLLAR_MULA_Field is ATSAM3X8E.UInt11;
   subtype CKGR_PLLAR_ONE_Field is ATSAM3X8E.Bit;

   --  PLLA Register
   type CKGR_PLLAR_Register is record
      --  Divider
      DIVA           : CKGR_PLLAR_DIVA_Field := 16#0#;
      --  PLLA Counter
      PLLACOUNT      : CKGR_PLLAR_PLLACOUNT_Field := 16#3F#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  PLLA Multiplier
      MULA           : CKGR_PLLAR_MULA_Field := 16#0#;
      --  unspecified
      Reserved_27_28 : ATSAM3X8E.UInt2 := 16#0#;
      --  Must Be Set to 1
      ONE            : CKGR_PLLAR_ONE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CKGR_PLLAR_Register use record
      DIVA           at 0 range 0 .. 7;
      PLLACOUNT      at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      MULA           at 0 range 16 .. 26;
      Reserved_27_28 at 0 range 27 .. 28;
      ONE            at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -----------------------
   -- PMC_MCKR_Register --
   -----------------------

   --  Master Clock Source Selection
   type CSS_Field is
     (
      --  Slow Clock is selected
      Slow_Clk,
      --  Main Clock is selected
      Main_Clk,
      --  PLLA Clock is selected
      Plla_Clk,
      --  UPLL Clock is selected
      Upll_Clk)
     with Size => 2;
   for CSS_Field use
     (Slow_Clk => 0,
      Main_Clk => 1,
      Plla_Clk => 2,
      Upll_Clk => 3);

   --  Processor Clock Prescaler
   type PRES_Field is
     (
      --  Selected clock
      Clk_1,
      --  Selected clock divided by 2
      Clk_2,
      --  Selected clock divided by 4
      Clk_4,
      --  Selected clock divided by 8
      Clk_8,
      --  Selected clock divided by 16
      Clk_16,
      --  Selected clock divided by 32
      Clk_32,
      --  Selected clock divided by 64
      Clk_64,
      --  Selected clock divided by 3
      Clk_3)
     with Size => 3;
   for PRES_Field use
     (Clk_1 => 0,
      Clk_2 => 1,
      Clk_4 => 2,
      Clk_8 => 3,
      Clk_16 => 4,
      Clk_32 => 5,
      Clk_64 => 6,
      Clk_3 => 7);

   subtype PMC_MCKR_PLLADIV2_Field is ATSAM3X8E.Bit;
   subtype PMC_MCKR_UPLLDIV2_Field is ATSAM3X8E.Bit;

   --  Master Clock Register
   type PMC_MCKR_Register is record
      --  Master Clock Source Selection
      CSS            : CSS_Field := Main_Clk;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  Processor Clock Prescaler
      PRES           : PRES_Field := Clk_1;
      --  unspecified
      Reserved_7_11  : ATSAM3X8E.UInt5 := 16#0#;
      --  PLLA Divisor by 2
      PLLADIV2       : PMC_MCKR_PLLADIV2_Field := 16#0#;
      UPLLDIV2       : PMC_MCKR_UPLLDIV2_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_MCKR_Register use record
      CSS            at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      PRES           at 0 range 4 .. 6;
      Reserved_7_11  at 0 range 7 .. 11;
      PLLADIV2       at 0 range 12 .. 12;
      UPLLDIV2       at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   ----------------------
   -- PMC_USB_Register --
   ----------------------

   subtype PMC_USB_USBS_Field is ATSAM3X8E.Bit;
   subtype PMC_USB_USBDIV_Field is ATSAM3X8E.UInt4;

   --  USB Clock Register
   type PMC_USB_Register is record
      --  USB Input Clock Selection
      USBS           : PMC_USB_USBS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7 := 16#0#;
      --  Divider for USB Clock.
      USBDIV         : PMC_USB_USBDIV_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_USB_Register use record
      USBS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      USBDIV         at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   ----------------------
   -- PMC_PCK_Register --
   ----------------------

   --  Master Clock Source Selection
   type CSS_Field_1 is
     (
      --  Slow Clock is selected
      Slow_Clk,
      --  Main Clock is selected
      Main_Clk,
      --  PLLA Clock is selected
      Plla_Clk,
      --  UPLL Clock is selected
      Upll_Clk,
      --  Master Clock is selected
      Mck)
     with Size => 3;
   for CSS_Field_1 use
     (Slow_Clk => 0,
      Main_Clk => 1,
      Plla_Clk => 2,
      Upll_Clk => 3,
      Mck => 4);

   --  Programmable Clock Prescaler
   type PRES_Field_1 is
     (
      --  Selected clock
      Clk_1,
      --  Selected clock divided by 2
      Clk_2,
      --  Selected clock divided by 4
      Clk_4,
      --  Selected clock divided by 8
      Clk_8,
      --  Selected clock divided by 16
      Clk_16,
      --  Selected clock divided by 32
      Clk_32,
      --  Selected clock divided by 64
      Clk_64)
     with Size => 3;
   for PRES_Field_1 use
     (Clk_1 => 0,
      Clk_2 => 1,
      Clk_4 => 2,
      Clk_8 => 3,
      Clk_16 => 4,
      Clk_32 => 5,
      Clk_64 => 6);

   --  Programmable Clock 0 Register
   type PMC_PCK_Register is record
      --  Master Clock Source Selection
      CSS           : CSS_Field_1 := Slow_Clk;
      --  unspecified
      Reserved_3_3  : ATSAM3X8E.Bit := 16#0#;
      --  Programmable Clock Prescaler
      PRES          : PRES_Field_1 := Clk_1;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCK_Register use record
      CSS           at 0 range 0 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      PRES          at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Programmable Clock 0 Register
   type PMC_PCK_Registers is array (0 .. 2) of PMC_PCK_Register;

   ----------------------
   -- PMC_IER_Register --
   ----------------------

   subtype PMC_IER_MOSCXTS_Field is ATSAM3X8E.Bit;
   subtype PMC_IER_LOCKA_Field is ATSAM3X8E.Bit;
   subtype PMC_IER_MCKRDY_Field is ATSAM3X8E.Bit;
   subtype PMC_IER_LOCKU_Field is ATSAM3X8E.Bit;

   --------------------
   -- PMC_IER.PCKRDY --
   --------------------

   --  PMC_IER_PCKRDY array element
   subtype PMC_IER_PCKRDY_Element is ATSAM3X8E.Bit;

   --  PMC_IER_PCKRDY array
   type PMC_IER_PCKRDY_Field_Array is array (0 .. 2)
     of PMC_IER_PCKRDY_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_IER_PCKRDY
   type PMC_IER_PCKRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCKRDY as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCKRDY as an array
            Arr : PMC_IER_PCKRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_IER_PCKRDY_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype PMC_IER_MOSCSELS_Field is ATSAM3X8E.Bit;
   subtype PMC_IER_MOSCRCS_Field is ATSAM3X8E.Bit;
   subtype PMC_IER_CFDEV_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type PMC_IER_Register is record
      --  Write-only. Main Crystal Oscillator Status Interrupt Enable
      MOSCXTS        : PMC_IER_MOSCXTS_Field := 16#0#;
      --  Write-only. PLLA Lock Interrupt Enable
      LOCKA          : PMC_IER_LOCKA_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Master Clock Ready Interrupt Enable
      MCKRDY         : PMC_IER_MCKRDY_Field := 16#0#;
      --  unspecified
      Reserved_4_5   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. UTMI PLL Lock Interrupt Enable
      LOCKU          : PMC_IER_LOCKU_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Programmable Clock Ready 0 Interrupt Enable
      PCKRDY         : PMC_IER_PCKRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Main Oscillator Selection Status Interrupt Enable
      MOSCSELS       : PMC_IER_MOSCSELS_Field := 16#0#;
      --  Write-only. Main On-Chip RC Status Interrupt Enable
      MOSCRCS        : PMC_IER_MOSCRCS_Field := 16#0#;
      --  Write-only. Clock Failure Detector Event Interrupt Enable
      CFDEV          : PMC_IER_CFDEV_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_IER_Register use record
      MOSCXTS        at 0 range 0 .. 0;
      LOCKA          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MCKRDY         at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      LOCKU          at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PCKRDY         at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      MOSCSELS       at 0 range 16 .. 16;
      MOSCRCS        at 0 range 17 .. 17;
      CFDEV          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   ----------------------
   -- PMC_IDR_Register --
   ----------------------

   subtype PMC_IDR_MOSCXTS_Field is ATSAM3X8E.Bit;
   subtype PMC_IDR_LOCKA_Field is ATSAM3X8E.Bit;
   subtype PMC_IDR_MCKRDY_Field is ATSAM3X8E.Bit;
   subtype PMC_IDR_LOCKU_Field is ATSAM3X8E.Bit;

   --------------------
   -- PMC_IDR.PCKRDY --
   --------------------

   --  PMC_IDR_PCKRDY array element
   subtype PMC_IDR_PCKRDY_Element is ATSAM3X8E.Bit;

   --  PMC_IDR_PCKRDY array
   type PMC_IDR_PCKRDY_Field_Array is array (0 .. 2)
     of PMC_IDR_PCKRDY_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_IDR_PCKRDY
   type PMC_IDR_PCKRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCKRDY as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCKRDY as an array
            Arr : PMC_IDR_PCKRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_IDR_PCKRDY_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype PMC_IDR_MOSCSELS_Field is ATSAM3X8E.Bit;
   subtype PMC_IDR_MOSCRCS_Field is ATSAM3X8E.Bit;
   subtype PMC_IDR_CFDEV_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type PMC_IDR_Register is record
      --  Write-only. Main Crystal Oscillator Status Interrupt Disable
      MOSCXTS        : PMC_IDR_MOSCXTS_Field := 16#0#;
      --  Write-only. PLLA Lock Interrupt Disable
      LOCKA          : PMC_IDR_LOCKA_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Master Clock Ready Interrupt Disable
      MCKRDY         : PMC_IDR_MCKRDY_Field := 16#0#;
      --  unspecified
      Reserved_4_5   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. UTMI PLL Lock Interrupt Disable
      LOCKU          : PMC_IDR_LOCKU_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Programmable Clock Ready 0 Interrupt Disable
      PCKRDY         : PMC_IDR_PCKRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Main Oscillator Selection Status Interrupt Disable
      MOSCSELS       : PMC_IDR_MOSCSELS_Field := 16#0#;
      --  Write-only. Main On-Chip RC Status Interrupt Disable
      MOSCRCS        : PMC_IDR_MOSCRCS_Field := 16#0#;
      --  Write-only. Clock Failure Detector Event Interrupt Disable
      CFDEV          : PMC_IDR_CFDEV_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_IDR_Register use record
      MOSCXTS        at 0 range 0 .. 0;
      LOCKA          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MCKRDY         at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      LOCKU          at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PCKRDY         at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      MOSCSELS       at 0 range 16 .. 16;
      MOSCRCS        at 0 range 17 .. 17;
      CFDEV          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   ---------------------
   -- PMC_SR_Register --
   ---------------------

   subtype PMC_SR_MOSCXTS_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_LOCKA_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_MCKRDY_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_LOCKU_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_OSCSELS_Field is ATSAM3X8E.Bit;

   -------------------
   -- PMC_SR.PCKRDY --
   -------------------

   --  PMC_SR_PCKRDY array element
   subtype PMC_SR_PCKRDY_Element is ATSAM3X8E.Bit;

   --  PMC_SR_PCKRDY array
   type PMC_SR_PCKRDY_Field_Array is array (0 .. 2) of PMC_SR_PCKRDY_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_SR_PCKRDY
   type PMC_SR_PCKRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCKRDY as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCKRDY as an array
            Arr : PMC_SR_PCKRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_SR_PCKRDY_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype PMC_SR_MOSCSELS_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_MOSCRCS_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_CFDEV_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_CFDS_Field is ATSAM3X8E.Bit;
   subtype PMC_SR_FOS_Field is ATSAM3X8E.Bit;

   --  Status Register
   type PMC_SR_Register is record
      --  Read-only. Main XTAL Oscillator Status
      MOSCXTS        : PMC_SR_MOSCXTS_Field := 16#0#;
      --  Read-only. PLLA Lock Status
      LOCKA          : PMC_SR_LOCKA_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit;
      --  Read-only. Master Clock Status
      MCKRDY         : PMC_SR_MCKRDY_Field := 16#1#;
      --  unspecified
      Reserved_4_5   : ATSAM3X8E.UInt2;
      --  Read-only. UTMI PLL Lock Status
      LOCKU          : PMC_SR_LOCKU_Field := 16#0#;
      --  Read-only. Slow Clock Oscillator Selection
      OSCSELS        : PMC_SR_OSCSELS_Field := 16#0#;
      --  Read-only. Programmable Clock Ready Status
      PCKRDY         : PMC_SR_PCKRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5;
      --  Read-only. Main Oscillator Selection Status
      MOSCSELS       : PMC_SR_MOSCSELS_Field := 16#1#;
      --  Read-only. Main On-Chip RC Oscillator Status
      MOSCRCS        : PMC_SR_MOSCRCS_Field := 16#0#;
      --  Read-only. Clock Failure Detector Event
      CFDEV          : PMC_SR_CFDEV_Field := 16#0#;
      --  Read-only. Clock Failure Detector Status
      CFDS           : PMC_SR_CFDS_Field := 16#0#;
      --  Read-only. Clock Failure Detector Fault Output Status
      FOS            : PMC_SR_FOS_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : ATSAM3X8E.UInt11;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_SR_Register use record
      MOSCXTS        at 0 range 0 .. 0;
      LOCKA          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MCKRDY         at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      LOCKU          at 0 range 6 .. 6;
      OSCSELS        at 0 range 7 .. 7;
      PCKRDY         at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      MOSCSELS       at 0 range 16 .. 16;
      MOSCRCS        at 0 range 17 .. 17;
      CFDEV          at 0 range 18 .. 18;
      CFDS           at 0 range 19 .. 19;
      FOS            at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   ----------------------
   -- PMC_IMR_Register --
   ----------------------

   subtype PMC_IMR_MOSCXTS_Field is ATSAM3X8E.Bit;
   subtype PMC_IMR_LOCKA_Field is ATSAM3X8E.Bit;
   subtype PMC_IMR_MCKRDY_Field is ATSAM3X8E.Bit;
   subtype PMC_IMR_LOCKU_Field is ATSAM3X8E.Bit;

   --------------------
   -- PMC_IMR.PCKRDY --
   --------------------

   --  PMC_IMR_PCKRDY array element
   subtype PMC_IMR_PCKRDY_Element is ATSAM3X8E.Bit;

   --  PMC_IMR_PCKRDY array
   type PMC_IMR_PCKRDY_Field_Array is array (0 .. 2)
     of PMC_IMR_PCKRDY_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PMC_IMR_PCKRDY
   type PMC_IMR_PCKRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PCKRDY as a value
            Val : ATSAM3X8E.UInt3;
         when True =>
            --  PCKRDY as an array
            Arr : PMC_IMR_PCKRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PMC_IMR_PCKRDY_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype PMC_IMR_MOSCSELS_Field is ATSAM3X8E.Bit;
   subtype PMC_IMR_MOSCRCS_Field is ATSAM3X8E.Bit;
   subtype PMC_IMR_CFDEV_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type PMC_IMR_Register is record
      --  Read-only. Main Crystal Oscillator Status Interrupt Mask
      MOSCXTS        : PMC_IMR_MOSCXTS_Field := 16#0#;
      --  Read-only. PLLA Lock Interrupt Mask
      LOCKA          : PMC_IMR_LOCKA_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit;
      --  Read-only. Master Clock Ready Interrupt Mask
      MCKRDY         : PMC_IMR_MCKRDY_Field := 16#0#;
      --  unspecified
      Reserved_4_5   : ATSAM3X8E.UInt2;
      --  Read-only. UTMI PLL Lock Interrupt Mask
      LOCKU          : PMC_IMR_LOCKU_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Programmable Clock Ready 0 Interrupt Mask
      PCKRDY         : PMC_IMR_PCKRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5;
      --  Read-only. Main Oscillator Selection Status Interrupt Mask
      MOSCSELS       : PMC_IMR_MOSCSELS_Field := 16#0#;
      --  Read-only. Main On-Chip RC Status Interrupt Mask
      MOSCRCS        : PMC_IMR_MOSCRCS_Field := 16#0#;
      --  Read-only. Clock Failure Detector Event Interrupt Mask
      CFDEV          : PMC_IMR_CFDEV_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_IMR_Register use record
      MOSCXTS        at 0 range 0 .. 0;
      LOCKA          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MCKRDY         at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      LOCKU          at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PCKRDY         at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      MOSCSELS       at 0 range 16 .. 16;
      MOSCRCS        at 0 range 17 .. 17;
      CFDEV          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -----------------------
   -- PMC_FSMR_Register --
   -----------------------

   -------------------
   -- PMC_FSMR.FSTT --
   -------------------

   --  PMC_FSMR_FSTT array element
   subtype PMC_FSMR_FSTT_Element is ATSAM3X8E.Bit;

   --  PMC_FSMR_FSTT array
   type PMC_FSMR_FSTT_Field_Array is array (0 .. 15) of PMC_FSMR_FSTT_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PMC_FSMR_FSTT
   type PMC_FSMR_FSTT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FSTT as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  FSTT as an array
            Arr : PMC_FSMR_FSTT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PMC_FSMR_FSTT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   subtype PMC_FSMR_RTTAL_Field is ATSAM3X8E.Bit;
   subtype PMC_FSMR_RTCAL_Field is ATSAM3X8E.Bit;
   subtype PMC_FSMR_USBAL_Field is ATSAM3X8E.Bit;
   subtype PMC_FSMR_LPM_Field is ATSAM3X8E.Bit;

   --  Fast Startup Mode Register
   type PMC_FSMR_Register is record
      --  Fast Startup Input Enable 0
      FSTT           : PMC_FSMR_FSTT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  RTT Alarm Enable
      RTTAL          : PMC_FSMR_RTTAL_Field := 16#0#;
      --  RTC Alarm Enable
      RTCAL          : PMC_FSMR_RTCAL_Field := 16#0#;
      --  USB Alarm Enable
      USBAL          : PMC_FSMR_USBAL_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : ATSAM3X8E.Bit := 16#0#;
      --  Low Power Mode
      LPM            : PMC_FSMR_LPM_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : ATSAM3X8E.UInt11 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_FSMR_Register use record
      FSTT           at 0 range 0 .. 15;
      RTTAL          at 0 range 16 .. 16;
      RTCAL          at 0 range 17 .. 17;
      USBAL          at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      LPM            at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   -----------------------
   -- PMC_FSPR_Register --
   -----------------------

   -------------------
   -- PMC_FSPR.FSTP --
   -------------------

   --  PMC_FSPR_FSTP array element
   subtype PMC_FSPR_FSTP_Element is ATSAM3X8E.Bit;

   --  PMC_FSPR_FSTP array
   type PMC_FSPR_FSTP_Field_Array is array (0 .. 15) of PMC_FSPR_FSTP_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PMC_FSPR_FSTP
   type PMC_FSPR_FSTP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FSTP as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  FSTP as an array
            Arr : PMC_FSPR_FSTP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PMC_FSPR_FSTP_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Fast Startup Polarity Register
   type PMC_FSPR_Register is record
      --  Fast Startup Input Polarityx
      FSTP           : PMC_FSPR_FSTP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_FSPR_Register use record
      FSTP           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------------
   -- PMC_FOCR_Register --
   -----------------------

   subtype PMC_FOCR_FOCLR_Field is ATSAM3X8E.Bit;

   --  Fault Output Clear Register
   type PMC_FOCR_Register is record
      --  Write-only. Fault Output Clear
      FOCLR         : PMC_FOCR_FOCLR_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_FOCR_Register use record
      FOCLR         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------------
   -- PMC_WPMR_Register --
   -----------------------

   subtype PMC_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype PMC_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type PMC_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : PMC_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : PMC_WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   -----------------------
   -- PMC_WPSR_Register --
   -----------------------

   subtype PMC_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype PMC_WPSR_WPVSRC_Field is ATSAM3X8E.Short;

   --  Write Protect Status Register
   type PMC_WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : PMC_WPSR_WPVS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : PMC_WPSR_WPVSRC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------------
   -- PMC_PCER1_Register --
   ------------------------

   -------------------
   -- PMC_PCER1.PID --
   -------------------

   --  PMC_PCER1_PID array element
   subtype PMC_PCER1_PID_Element is ATSAM3X8E.Bit;

   --  PMC_PCER1_PID array
   type PMC_PCER1_PID_Field_Array is array (0 .. 12) of PMC_PCER1_PID_Element
     with Component_Size => 1, Size => 13;

   --  Type definition for PMC_PCER1_PID
   type PMC_PCER1_PID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PID as a value
            Val : ATSAM3X8E.UInt13;
         when True =>
            --  PID as an array
            Arr : PMC_PCER1_PID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 13;

   for PMC_PCER1_PID_Field use record
      Val at 0 range 0 .. 12;
      Arr at 0 range 0 .. 12;
   end record;

   --  Peripheral Clock Enable Register 1
   type PMC_PCER1_Register is record
      --  Write-only. Peripheral Clock 32 Enable
      PID            : PMC_PCER1_PID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCER1_Register use record
      PID            at 0 range 0 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   ------------------------
   -- PMC_PCDR1_Register --
   ------------------------

   -------------------
   -- PMC_PCDR1.PID --
   -------------------

   --  PMC_PCDR1_PID array element
   subtype PMC_PCDR1_PID_Element is ATSAM3X8E.Bit;

   --  PMC_PCDR1_PID array
   type PMC_PCDR1_PID_Field_Array is array (0 .. 12) of PMC_PCDR1_PID_Element
     with Component_Size => 1, Size => 13;

   --  Type definition for PMC_PCDR1_PID
   type PMC_PCDR1_PID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PID as a value
            Val : ATSAM3X8E.UInt13;
         when True =>
            --  PID as an array
            Arr : PMC_PCDR1_PID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 13;

   for PMC_PCDR1_PID_Field use record
      Val at 0 range 0 .. 12;
      Arr at 0 range 0 .. 12;
   end record;

   --  Peripheral Clock Disable Register 1
   type PMC_PCDR1_Register is record
      --  Write-only. Peripheral Clock 32 Disable
      PID            : PMC_PCDR1_PID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCDR1_Register use record
      PID            at 0 range 0 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   ------------------------
   -- PMC_PCSR1_Register --
   ------------------------

   -------------------
   -- PMC_PCSR1.PID --
   -------------------

   --  PMC_PCSR1_PID array element
   subtype PMC_PCSR1_PID_Element is ATSAM3X8E.Bit;

   --  PMC_PCSR1_PID array
   type PMC_PCSR1_PID_Field_Array is array (0 .. 12) of PMC_PCSR1_PID_Element
     with Component_Size => 1, Size => 13;

   --  Type definition for PMC_PCSR1_PID
   type PMC_PCSR1_PID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PID as a value
            Val : ATSAM3X8E.UInt13;
         when True =>
            --  PID as an array
            Arr : PMC_PCSR1_PID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 13;

   for PMC_PCSR1_PID_Field use record
      Val at 0 range 0 .. 12;
      Arr at 0 range 0 .. 12;
   end record;

   --  Peripheral Clock Status Register 1
   type PMC_PCSR1_Register is record
      --  Read-only. Peripheral Clock 32 Status
      PID            : PMC_PCSR1_PID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCSR1_Register use record
      PID            at 0 range 0 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   ----------------------
   -- PMC_PCR_Register --
   ----------------------

   subtype PMC_PCR_PID_Field is ATSAM3X8E.UInt6;
   subtype PMC_PCR_CMD_Field is ATSAM3X8E.Bit;

   --  Divisor Value
   type DIV_Field is
     (
      --  Peripheral clock is MCK
      Periph_Div_Mck,
      --  Peripheral clock is MCK/2
      Periph_Div2_Mck,
      --  Peripheral clock is MCK/4
      Periph_Div4_Mck)
     with Size => 2;
   for DIV_Field use
     (Periph_Div_Mck => 0,
      Periph_Div2_Mck => 1,
      Periph_Div4_Mck => 2);

   subtype PMC_PCR_EN_Field is ATSAM3X8E.Bit;

   --  Peripheral Control Register
   type PMC_PCR_Register is record
      --  Peripheral ID
      PID            : PMC_PCR_PID_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : ATSAM3X8E.UInt6 := 16#0#;
      --  Command
      CMD            : PMC_PCR_CMD_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Divisor Value
      DIV            : DIV_Field := Periph_Div_Mck;
      --  unspecified
      Reserved_18_27 : ATSAM3X8E.UInt10 := 16#0#;
      --  Enable
      EN             : PMC_PCR_EN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_PCR_Register use record
      PID            at 0 range 0 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      CMD            at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DIV            at 0 range 16 .. 17;
      Reserved_18_27 at 0 range 18 .. 27;
      EN             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power Management Controller
   type PMC_Peripheral is record
      --  System Clock Enable Register
      PMC_SCER   : PMC_SCER_Register;
      --  System Clock Disable Register
      PMC_SCDR   : PMC_SCDR_Register;
      --  System Clock Status Register
      PMC_SCSR   : PMC_SCSR_Register;
      --  Peripheral Clock Enable Register 0
      PMC_PCER0  : PMC_PCER0_Register;
      --  Peripheral Clock Disable Register 0
      PMC_PCDR0  : PMC_PCDR0_Register;
      --  Peripheral Clock Status Register 0
      PMC_PCSR0  : PMC_PCSR0_Register;
      --  UTMI Clock Register
      CKGR_UCKR  : CKGR_UCKR_Register;
      --  Main Oscillator Register
      CKGR_MOR   : CKGR_MOR_Register;
      --  Main Clock Frequency Register
      CKGR_MCFR  : CKGR_MCFR_Register;
      --  PLLA Register
      CKGR_PLLAR : CKGR_PLLAR_Register;
      --  Master Clock Register
      PMC_MCKR   : PMC_MCKR_Register;
      --  USB Clock Register
      PMC_USB    : PMC_USB_Register;
      --  Programmable Clock 0 Register
      PMC_PCK    : PMC_PCK_Registers;
      --  Interrupt Enable Register
      PMC_IER    : PMC_IER_Register;
      --  Interrupt Disable Register
      PMC_IDR    : PMC_IDR_Register;
      --  Status Register
      PMC_SR     : PMC_SR_Register;
      --  Interrupt Mask Register
      PMC_IMR    : PMC_IMR_Register;
      --  Fast Startup Mode Register
      PMC_FSMR   : PMC_FSMR_Register;
      --  Fast Startup Polarity Register
      PMC_FSPR   : PMC_FSPR_Register;
      --  Fault Output Clear Register
      PMC_FOCR   : PMC_FOCR_Register;
      --  Write Protect Mode Register
      PMC_WPMR   : PMC_WPMR_Register;
      --  Write Protect Status Register
      PMC_WPSR   : PMC_WPSR_Register;
      --  Peripheral Clock Enable Register 1
      PMC_PCER1  : PMC_PCER1_Register;
      --  Peripheral Clock Disable Register 1
      PMC_PCDR1  : PMC_PCDR1_Register;
      --  Peripheral Clock Status Register 1
      PMC_PCSR1  : PMC_PCSR1_Register;
      --  Peripheral Control Register
      PMC_PCR    : PMC_PCR_Register;
   end record
     with Volatile;

   for PMC_Peripheral use record
      PMC_SCER   at 0 range 0 .. 31;
      PMC_SCDR   at 4 range 0 .. 31;
      PMC_SCSR   at 8 range 0 .. 31;
      PMC_PCER0  at 16 range 0 .. 31;
      PMC_PCDR0  at 20 range 0 .. 31;
      PMC_PCSR0  at 24 range 0 .. 31;
      CKGR_UCKR  at 28 range 0 .. 31;
      CKGR_MOR   at 32 range 0 .. 31;
      CKGR_MCFR  at 36 range 0 .. 31;
      CKGR_PLLAR at 40 range 0 .. 31;
      PMC_MCKR   at 48 range 0 .. 31;
      PMC_USB    at 56 range 0 .. 31;
      PMC_PCK    at 64 range 0 .. 95;
      PMC_IER    at 96 range 0 .. 31;
      PMC_IDR    at 100 range 0 .. 31;
      PMC_SR     at 104 range 0 .. 31;
      PMC_IMR    at 108 range 0 .. 31;
      PMC_FSMR   at 112 range 0 .. 31;
      PMC_FSPR   at 116 range 0 .. 31;
      PMC_FOCR   at 120 range 0 .. 31;
      PMC_WPMR   at 228 range 0 .. 31;
      PMC_WPSR   at 232 range 0 .. 31;
      PMC_PCER1  at 256 range 0 .. 31;
      PMC_PCDR1  at 260 range 0 .. 31;
      PMC_PCSR1  at 264 range 0 .. 31;
      PMC_PCR    at 268 range 0 .. 31;
   end record;

   --  Power Management Controller
   PMC_Periph : aliased PMC_Peripheral
     with Import, Address => PMC_Base;

end ATSAM3X8E.PMC;
