pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  Pulse Width Modulation Controller
package ATSAM3X8E.PWM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype PWM_CLK_DIVA_Field is ATSAM3X8E.Byte;
   subtype PWM_CLK_PREA_Field is ATSAM3X8E.UInt4;
   subtype PWM_CLK_DIVB_Field is ATSAM3X8E.Byte;
   subtype PWM_CLK_PREB_Field is ATSAM3X8E.UInt4;

   --  PWM Clock Register
   type PWM_CLK_Register is record
      --  CLKA, CLKB Divide Factor
      DIVA           : PWM_CLK_DIVA_Field := 16#0#;
      --  CLKA, CLKB Source Clock Selection
      PREA           : PWM_CLK_PREA_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  CLKA, CLKB Divide Factor
      DIVB           : PWM_CLK_DIVB_Field := 16#0#;
      --  CLKA, CLKB Source Clock Selection
      PREB           : PWM_CLK_PREB_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : ATSAM3X8E.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_CLK_Register use record
      DIVA           at 0 range 0 .. 7;
      PREA           at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DIVB           at 0 range 16 .. 23;
      PREB           at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  PWM_ENA_CHID array element
   subtype PWM_ENA_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_ENA_CHID array
   type PWM_ENA_CHID_Field_Array is array (0 .. 7) of PWM_ENA_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_ENA_CHID
   type PWM_ENA_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_ENA_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_ENA_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Enable Register
   type PWM_ENA_Register is record
      --  Write-only. Channel ID
      CHID          : PWM_ENA_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_ENA_Register use record
      CHID          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM_DIS_CHID array element
   subtype PWM_DIS_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_DIS_CHID array
   type PWM_DIS_CHID_Field_Array is array (0 .. 7) of PWM_DIS_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_DIS_CHID
   type PWM_DIS_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_DIS_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_DIS_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Disable Register
   type PWM_DIS_Register is record
      --  Write-only. Channel ID
      CHID          : PWM_DIS_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_DIS_Register use record
      CHID          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM_SR_CHID array element
   subtype PWM_SR_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_SR_CHID array
   type PWM_SR_CHID_Field_Array is array (0 .. 7) of PWM_SR_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_SR_CHID
   type PWM_SR_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_SR_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_SR_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Status Register
   type PWM_SR_Register is record
      --  Read-only. Channel ID
      CHID          : PWM_SR_CHID_Field;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_SR_Register use record
      CHID          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM_IER1_CHID array element
   subtype PWM_IER1_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_IER1_CHID array
   type PWM_IER1_CHID_Field_Array is array (0 .. 7) of PWM_IER1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IER1_CHID
   type PWM_IER1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_IER1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IER1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_IER1_FCHID array element
   subtype PWM_IER1_FCHID_Element is ATSAM3X8E.Bit;

   --  PWM_IER1_FCHID array
   type PWM_IER1_FCHID_Field_Array is array (0 .. 7)
     of PWM_IER1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IER1_FCHID
   type PWM_IER1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : PWM_IER1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IER1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Enable Register 1
   type PWM_IER1_Register is record
      --  Write-only. Counter Event on Channel 0 Interrupt Enable
      CHID           : PWM_IER1_CHID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Fault Protection Trigger on Channel 0 Interrupt Enable
      FCHID          : PWM_IER1_FCHID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_IER1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_IDR1_CHID array element
   subtype PWM_IDR1_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_IDR1_CHID array
   type PWM_IDR1_CHID_Field_Array is array (0 .. 7) of PWM_IDR1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IDR1_CHID
   type PWM_IDR1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_IDR1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IDR1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_IDR1_FCHID array element
   subtype PWM_IDR1_FCHID_Element is ATSAM3X8E.Bit;

   --  PWM_IDR1_FCHID array
   type PWM_IDR1_FCHID_Field_Array is array (0 .. 7)
     of PWM_IDR1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IDR1_FCHID
   type PWM_IDR1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : PWM_IDR1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IDR1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Disable Register 1
   type PWM_IDR1_Register is record
      --  Write-only. Counter Event on Channel 0 Interrupt Disable
      CHID           : PWM_IDR1_CHID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Fault Protection Trigger on Channel 0 Interrupt Disable
      FCHID          : PWM_IDR1_FCHID_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_IDR1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_IMR1_CHID array element
   subtype PWM_IMR1_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_IMR1_CHID array
   type PWM_IMR1_CHID_Field_Array is array (0 .. 7) of PWM_IMR1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IMR1_CHID
   type PWM_IMR1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_IMR1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IMR1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_IMR1_FCHID array element
   subtype PWM_IMR1_FCHID_Element is ATSAM3X8E.Bit;

   --  PWM_IMR1_FCHID array
   type PWM_IMR1_FCHID_Field_Array is array (0 .. 7)
     of PWM_IMR1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IMR1_FCHID
   type PWM_IMR1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : PWM_IMR1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IMR1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Mask Register 1
   type PWM_IMR1_Register is record
      --  Read-only. Counter Event on Channel 0 Interrupt Mask
      CHID           : PWM_IMR1_CHID_Field;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Fault Protection Trigger on Channel 0 Interrupt Mask
      FCHID          : PWM_IMR1_FCHID_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_IMR1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_ISR1_CHID array element
   subtype PWM_ISR1_CHID_Element is ATSAM3X8E.Bit;

   --  PWM_ISR1_CHID array
   type PWM_ISR1_CHID_Field_Array is array (0 .. 7) of PWM_ISR1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_ISR1_CHID
   type PWM_ISR1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : PWM_ISR1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_ISR1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_ISR1_FCHID array element
   subtype PWM_ISR1_FCHID_Element is ATSAM3X8E.Bit;

   --  PWM_ISR1_FCHID array
   type PWM_ISR1_FCHID_Field_Array is array (0 .. 7)
     of PWM_ISR1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_ISR1_FCHID
   type PWM_ISR1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : PWM_ISR1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_ISR1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Status Register 1
   type PWM_ISR1_Register is record
      --  Read-only. Counter Event on Channel 0
      CHID           : PWM_ISR1_CHID_Field;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Fault Protection Trigger on Channel 0
      FCHID          : PWM_ISR1_FCHID_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_ISR1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_SCM_SYNC array element
   subtype PWM_SCM_SYNC_Element is ATSAM3X8E.Bit;

   --  PWM_SCM_SYNC array
   type PWM_SCM_SYNC_Field_Array is array (0 .. 7) of PWM_SCM_SYNC_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_SCM_SYNC
   type PWM_SCM_SYNC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SYNC as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  SYNC as an array
            Arr : PWM_SCM_SYNC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_SCM_SYNC_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Synchronous Channels Update Mode
   type SCM_UPDM_Field is
     (--  Manual write of double buffer registers and manual update of synchronous
--  channels
      MODE0,
      --  Manual write of double buffer registers and automatic update of synchronous
--  channels
      MODE1,
      --  Automatic write of duty-cycle update registers by the PDC and automatic
--  update of synchronous channels
      MODE2)
     with Size => 2;
   for SCM_UPDM_Field use
     (MODE0 => 0,
      MODE1 => 1,
      MODE2 => 2);

   subtype PWM_SCM_PTRM_Field is ATSAM3X8E.Bit;
   subtype PWM_SCM_PTRCS_Field is ATSAM3X8E.UInt3;

   --  PWM Sync Channels Mode Register
   type PWM_SCM_Register is record
      --  Synchronous Channel 0
      SYNC           : PWM_SCM_SYNC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Synchronous Channels Update Mode
      UPDM           : SCM_UPDM_Field := ATSAM3X8E.PWM.MODE0;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  PDC Transfer Request Mode
      PTRM           : PWM_SCM_PTRM_Field := 16#0#;
      --  PDC Transfer Request Comparison Selection
      PTRCS          : PWM_SCM_PTRCS_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_SCM_Register use record
      SYNC           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      UPDM           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      PTRM           at 0 range 20 .. 20;
      PTRCS          at 0 range 21 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PWM_SCUC_UPDULOCK_Field is ATSAM3X8E.Bit;

   --  PWM Sync Channels Update Control Register
   type PWM_SCUC_Register is record
      --  Synchronous Channels Update Unlock
      UPDULOCK      : PWM_SCUC_UPDULOCK_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_SCUC_Register use record
      UPDULOCK      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype PWM_SCUP_UPR_Field is ATSAM3X8E.UInt4;
   subtype PWM_SCUP_UPRCNT_Field is ATSAM3X8E.UInt4;

   --  PWM Sync Channels Update Period Register
   type PWM_SCUP_Register is record
      --  Update Period
      UPR           : PWM_SCUP_UPR_Field := 16#0#;
      --  Update Period Counter
      UPRCNT        : PWM_SCUP_UPRCNT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_SCUP_Register use record
      UPR           at 0 range 0 .. 3;
      UPRCNT        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PWM_SCUPUPD_UPRUPD_Field is ATSAM3X8E.UInt4;

   --  PWM Sync Channels Update Period Update Register
   type PWM_SCUPUPD_Register is record
      --  Write-only. Update Period Update
      UPRUPD        : PWM_SCUPUPD_UPRUPD_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_SCUPUPD_Register use record
      UPRUPD        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype PWM_IER2_WRDY_Field is ATSAM3X8E.Bit;
   subtype PWM_IER2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype PWM_IER2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype PWM_IER2_UNRE_Field is ATSAM3X8E.Bit;
   --  PWM_IER2_CMPM array element
   subtype PWM_IER2_CMPM_Element is ATSAM3X8E.Bit;

   --  PWM_IER2_CMPM array
   type PWM_IER2_CMPM_Field_Array is array (0 .. 7) of PWM_IER2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IER2_CMPM
   type PWM_IER2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : PWM_IER2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IER2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_IER2_CMPU array element
   subtype PWM_IER2_CMPU_Element is ATSAM3X8E.Bit;

   --  PWM_IER2_CMPU array
   type PWM_IER2_CMPU_Field_Array is array (0 .. 7) of PWM_IER2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IER2_CMPU
   type PWM_IER2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : PWM_IER2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IER2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Enable Register 2
   type PWM_IER2_Register is record
      --  Write-only. Write Ready for Synchronous Channels Update Interrupt
      --  Enable
      WRDY           : PWM_IER2_WRDY_Field := 16#0#;
      --  Write-only. PDC End of TX Buffer Interrupt Enable
      ENDTX          : PWM_IER2_ENDTX_Field := 16#0#;
      --  Write-only. PDC TX Buffer Empty Interrupt Enable
      TXBUFE         : PWM_IER2_TXBUFE_Field := 16#0#;
      --  Write-only. Synchronous Channels Update Underrun Error Interrupt
      --  Enable
      UNRE           : PWM_IER2_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Comparison 0 Match Interrupt Enable
      CMPM           : PWM_IER2_CMPM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Write-only. Comparison 0 Update Interrupt Enable
      CMPU           : PWM_IER2_CMPU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_IER2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PWM_IDR2_WRDY_Field is ATSAM3X8E.Bit;
   subtype PWM_IDR2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype PWM_IDR2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype PWM_IDR2_UNRE_Field is ATSAM3X8E.Bit;
   --  PWM_IDR2_CMPM array element
   subtype PWM_IDR2_CMPM_Element is ATSAM3X8E.Bit;

   --  PWM_IDR2_CMPM array
   type PWM_IDR2_CMPM_Field_Array is array (0 .. 7) of PWM_IDR2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IDR2_CMPM
   type PWM_IDR2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : PWM_IDR2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IDR2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_IDR2_CMPU array element
   subtype PWM_IDR2_CMPU_Element is ATSAM3X8E.Bit;

   --  PWM_IDR2_CMPU array
   type PWM_IDR2_CMPU_Field_Array is array (0 .. 7) of PWM_IDR2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IDR2_CMPU
   type PWM_IDR2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : PWM_IDR2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IDR2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Disable Register 2
   type PWM_IDR2_Register is record
      --  Write-only. Write Ready for Synchronous Channels Update Interrupt
      --  Disable
      WRDY           : PWM_IDR2_WRDY_Field := 16#0#;
      --  Write-only. PDC End of TX Buffer Interrupt Disable
      ENDTX          : PWM_IDR2_ENDTX_Field := 16#0#;
      --  Write-only. PDC TX Buffer Empty Interrupt Disable
      TXBUFE         : PWM_IDR2_TXBUFE_Field := 16#0#;
      --  Write-only. Synchronous Channels Update Underrun Error Interrupt
      --  Disable
      UNRE           : PWM_IDR2_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Comparison 0 Match Interrupt Disable
      CMPM           : PWM_IDR2_CMPM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Write-only. Comparison 0 Update Interrupt Disable
      CMPU           : PWM_IDR2_CMPU_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_IDR2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PWM_IMR2_WRDY_Field is ATSAM3X8E.Bit;
   subtype PWM_IMR2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype PWM_IMR2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype PWM_IMR2_UNRE_Field is ATSAM3X8E.Bit;
   --  PWM_IMR2_CMPM array element
   subtype PWM_IMR2_CMPM_Element is ATSAM3X8E.Bit;

   --  PWM_IMR2_CMPM array
   type PWM_IMR2_CMPM_Field_Array is array (0 .. 7) of PWM_IMR2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IMR2_CMPM
   type PWM_IMR2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : PWM_IMR2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IMR2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_IMR2_CMPU array element
   subtype PWM_IMR2_CMPU_Element is ATSAM3X8E.Bit;

   --  PWM_IMR2_CMPU array
   type PWM_IMR2_CMPU_Field_Array is array (0 .. 7) of PWM_IMR2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_IMR2_CMPU
   type PWM_IMR2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : PWM_IMR2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_IMR2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Mask Register 2
   type PWM_IMR2_Register is record
      --  Read-only. Write Ready for Synchronous Channels Update Interrupt Mask
      WRDY           : PWM_IMR2_WRDY_Field;
      --  Read-only. PDC End of TX Buffer Interrupt Mask
      ENDTX          : PWM_IMR2_ENDTX_Field;
      --  Read-only. PDC TX Buffer Empty Interrupt Mask
      TXBUFE         : PWM_IMR2_TXBUFE_Field;
      --  Read-only. Synchronous Channels Update Underrun Error Interrupt Mask
      UNRE           : PWM_IMR2_UNRE_Field;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Comparison 0 Match Interrupt Mask
      CMPM           : PWM_IMR2_CMPM_Field;
      --  Read-only. Comparison 0 Update Interrupt Mask
      CMPU           : PWM_IMR2_CMPU_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_IMR2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PWM_ISR2_WRDY_Field is ATSAM3X8E.Bit;
   subtype PWM_ISR2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype PWM_ISR2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype PWM_ISR2_UNRE_Field is ATSAM3X8E.Bit;
   --  PWM_ISR2_CMPM array element
   subtype PWM_ISR2_CMPM_Element is ATSAM3X8E.Bit;

   --  PWM_ISR2_CMPM array
   type PWM_ISR2_CMPM_Field_Array is array (0 .. 7) of PWM_ISR2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_ISR2_CMPM
   type PWM_ISR2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : PWM_ISR2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_ISR2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_ISR2_CMPU array element
   subtype PWM_ISR2_CMPU_Element is ATSAM3X8E.Bit;

   --  PWM_ISR2_CMPU array
   type PWM_ISR2_CMPU_Field_Array is array (0 .. 7) of PWM_ISR2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_ISR2_CMPU
   type PWM_ISR2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : PWM_ISR2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_ISR2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Status Register 2
   type PWM_ISR2_Register is record
      --  Read-only. Write Ready for Synchronous Channels Update
      WRDY           : PWM_ISR2_WRDY_Field;
      --  Read-only. PDC End of TX Buffer
      ENDTX          : PWM_ISR2_ENDTX_Field;
      --  Read-only. PDC TX Buffer Empty
      TXBUFE         : PWM_ISR2_TXBUFE_Field;
      --  Read-only. Synchronous Channels Update Underrun Error
      UNRE           : PWM_ISR2_UNRE_Field;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Comparison 0 Match
      CMPM           : PWM_ISR2_CMPM_Field;
      --  Read-only. Comparison 0 Update
      CMPU           : PWM_ISR2_CMPU_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_ISR2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_OOV_OOVH array element
   subtype PWM_OOV_OOVH_Element is ATSAM3X8E.Bit;

   --  PWM_OOV_OOVH array
   type PWM_OOV_OOVH_Field_Array is array (0 .. 7) of PWM_OOV_OOVH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OOV_OOVH
   type PWM_OOV_OOVH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OOVH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OOVH as an array
            Arr : PWM_OOV_OOVH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OOV_OOVH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_OOV_OOVL array element
   subtype PWM_OOV_OOVL_Element is ATSAM3X8E.Bit;

   --  PWM_OOV_OOVL array
   type PWM_OOV_OOVL_Field_Array is array (0 .. 7) of PWM_OOV_OOVL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OOV_OOVL
   type PWM_OOV_OOVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OOVL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OOVL as an array
            Arr : PWM_OOV_OOVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OOV_OOVL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Override Value Register
   type PWM_OOV_Register is record
      --  Output Override Value for PWMH output of the channel 0
      OOVH           : PWM_OOV_OOVH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Output Override Value for PWML output of the channel 0
      OOVL           : PWM_OOV_OOVL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_OOV_Register use record
      OOVH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OOVL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_OS_OSH array element
   subtype PWM_OS_OSH_Element is ATSAM3X8E.Bit;

   --  PWM_OS_OSH array
   type PWM_OS_OSH_Field_Array is array (0 .. 7) of PWM_OS_OSH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OS_OSH
   type PWM_OS_OSH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSH as an array
            Arr : PWM_OS_OSH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OS_OSH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_OS_OSL array element
   subtype PWM_OS_OSL_Element is ATSAM3X8E.Bit;

   --  PWM_OS_OSL array
   type PWM_OS_OSL_Field_Array is array (0 .. 7) of PWM_OS_OSL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OS_OSL
   type PWM_OS_OSL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSL as an array
            Arr : PWM_OS_OSL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OS_OSL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Register
   type PWM_OS_Register is record
      --  Output Selection for PWMH output of the channel 0
      OSH            : PWM_OS_OSH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Output Selection for PWML output of the channel 0
      OSL            : PWM_OS_OSL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_OS_Register use record
      OSH            at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSL            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_OSS_OSSH array element
   subtype PWM_OSS_OSSH_Element is ATSAM3X8E.Bit;

   --  PWM_OSS_OSSH array
   type PWM_OSS_OSSH_Field_Array is array (0 .. 7) of PWM_OSS_OSSH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSS_OSSH
   type PWM_OSS_OSSH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSH as an array
            Arr : PWM_OSS_OSSH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSS_OSSH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_OSS_OSSL array element
   subtype PWM_OSS_OSSL_Element is ATSAM3X8E.Bit;

   --  PWM_OSS_OSSL array
   type PWM_OSS_OSSL_Field_Array is array (0 .. 7) of PWM_OSS_OSSL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSS_OSSL
   type PWM_OSS_OSSL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSL as an array
            Arr : PWM_OSS_OSSL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSS_OSSL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Set Register
   type PWM_OSS_Register is record
      --  Write-only. Output Selection Set for PWMH output of the channel 0
      OSSH           : PWM_OSS_OSSH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Set for PWML output of the channel 0
      OSSL           : PWM_OSS_OSSL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_OSS_Register use record
      OSSH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSSL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_OSC_OSCH array element
   subtype PWM_OSC_OSCH_Element is ATSAM3X8E.Bit;

   --  PWM_OSC_OSCH array
   type PWM_OSC_OSCH_Field_Array is array (0 .. 7) of PWM_OSC_OSCH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSC_OSCH
   type PWM_OSC_OSCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSCH as an array
            Arr : PWM_OSC_OSCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSC_OSCH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_OSC_OSCL array element
   subtype PWM_OSC_OSCL_Element is ATSAM3X8E.Bit;

   --  PWM_OSC_OSCL array
   type PWM_OSC_OSCL_Field_Array is array (0 .. 7) of PWM_OSC_OSCL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSC_OSCL
   type PWM_OSC_OSCL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSCL as an array
            Arr : PWM_OSC_OSCL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSC_OSCL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Clear Register
   type PWM_OSC_Register is record
      --  Write-only. Output Selection Clear for PWMH output of the channel 0
      OSCH           : PWM_OSC_OSCH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Clear for PWML output of the channel 0
      OSCL           : PWM_OSC_OSCL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_OSC_Register use record
      OSCH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSCL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_OSSUPD_OSSUPH array element
   subtype PWM_OSSUPD_OSSUPH_Element is ATSAM3X8E.Bit;

   --  PWM_OSSUPD_OSSUPH array
   type PWM_OSSUPD_OSSUPH_Field_Array is array (0 .. 7)
     of PWM_OSSUPD_OSSUPH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSSUPD_OSSUPH
   type PWM_OSSUPD_OSSUPH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSUPH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSUPH as an array
            Arr : PWM_OSSUPD_OSSUPH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSSUPD_OSSUPH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_OSSUPD_OSSUPL array element
   subtype PWM_OSSUPD_OSSUPL_Element is ATSAM3X8E.Bit;

   --  PWM_OSSUPD_OSSUPL array
   type PWM_OSSUPD_OSSUPL_Field_Array is array (0 .. 7)
     of PWM_OSSUPD_OSSUPL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSSUPD_OSSUPL
   type PWM_OSSUPD_OSSUPL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSUPL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSUPL as an array
            Arr : PWM_OSSUPD_OSSUPL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSSUPD_OSSUPL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Set Update Register
   type PWM_OSSUPD_Register is record
      --  Write-only. Output Selection Set for PWMH output of the channel 0
      OSSUPH         : PWM_OSSUPD_OSSUPH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Set for PWML output of the channel 0
      OSSUPL         : PWM_OSSUPD_OSSUPL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_OSSUPD_Register use record
      OSSUPH         at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSSUPL         at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_OSCUPD_OSCUPH array element
   subtype PWM_OSCUPD_OSCUPH_Element is ATSAM3X8E.Bit;

   --  PWM_OSCUPD_OSCUPH array
   type PWM_OSCUPD_OSCUPH_Field_Array is array (0 .. 7)
     of PWM_OSCUPD_OSCUPH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_OSCUPD_OSCUPH
   type PWM_OSCUPD_OSCUPH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCUPH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSCUPH as an array
            Arr : PWM_OSCUPD_OSCUPH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_OSCUPD_OSCUPH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_OSCUPD_OSCUPL array element
   subtype PWM_OSCUPD_OSCUPL_Element is ATSAM3X8E.Bit;

   --  PWM_OSCUPD_OSCUPL array
   type PWM_OSCUPD_OSCUPL_Field_Array is array (0 .. 5)
     of PWM_OSCUPD_OSCUPL_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for PWM_OSCUPD_OSCUPL
   type PWM_OSCUPD_OSCUPL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCUPL as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  OSCUPL as an array
            Arr : PWM_OSCUPD_OSCUPL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for PWM_OSCUPD_OSCUPL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype PWM_OSCUPD_OSCUPDL6_Field is ATSAM3X8E.Bit;
   subtype PWM_OSCUPD_OSCUPL7_Field is ATSAM3X8E.Bit;

   --  PWM Output Selection Clear Update Register
   type PWM_OSCUPD_Register is record
      --  Write-only. Output Selection Clear for PWMH output of the channel 0
      OSCUPH         : PWM_OSCUPD_OSCUPH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Clear for PWML output of the channel 0
      OSCUPL         : PWM_OSCUPD_OSCUPL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Write-only.
      OSCUPDL6       : PWM_OSCUPD_OSCUPDL6_Field := 16#0#;
      --  Write-only. Output Selection Clear for PWML output of the channel 7
      OSCUPL7        : PWM_OSCUPD_OSCUPL7_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_OSCUPD_Register use record
      OSCUPH         at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSCUPL         at 0 range 16 .. 21;
      OSCUPDL6       at 0 range 22 .. 22;
      OSCUPL7        at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PWM_FMR_FPOL_Field is ATSAM3X8E.Byte;
   subtype PWM_FMR_FMOD_Field is ATSAM3X8E.Byte;
   subtype PWM_FMR_FFIL_Field is ATSAM3X8E.Byte;

   --  PWM Fault Mode Register
   type PWM_FMR_Register is record
      --  Fault Polarity (fault input bit varies from 0 to 5)
      FPOL           : PWM_FMR_FPOL_Field := 16#0#;
      --  Fault Activation Mode (fault input bit varies from 0 to 5)
      FMOD           : PWM_FMR_FMOD_Field := 16#0#;
      --  Fault Filtering (fault input bit varies from 0 to 5)
      FFIL           : PWM_FMR_FFIL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_FMR_Register use record
      FPOL           at 0 range 0 .. 7;
      FMOD           at 0 range 8 .. 15;
      FFIL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PWM_FSR_FIV_Field is ATSAM3X8E.Byte;
   subtype PWM_FSR_FS_Field is ATSAM3X8E.Byte;

   --  PWM Fault Status Register
   type PWM_FSR_Register is record
      --  Read-only. Fault Input Value (fault input bit varies from 0 to 5)
      FIV            : PWM_FSR_FIV_Field;
      --  Read-only. Fault Status (fault input bit varies from 0 to 5)
      FS             : PWM_FSR_FS_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_FSR_Register use record
      FIV            at 0 range 0 .. 7;
      FS             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PWM_FCR_FCLR_Field is ATSAM3X8E.Byte;

   --  PWM Fault Clear Register
   type PWM_FCR_Register is record
      --  Write-only. Fault Clear (fault input bit varies from 0 to 5)
      FCLR          : PWM_FCR_FCLR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_FCR_Register use record
      FCLR          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM_FPV_FPVH array element
   subtype PWM_FPV_FPVH_Element is ATSAM3X8E.Bit;

   --  PWM_FPV_FPVH array
   type PWM_FPV_FPVH_Field_Array is array (0 .. 7) of PWM_FPV_FPVH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_FPV_FPVH
   type PWM_FPV_FPVH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPVH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FPVH as an array
            Arr : PWM_FPV_FPVH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_FPV_FPVH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM_FPV_FPVL array element
   subtype PWM_FPV_FPVL_Element is ATSAM3X8E.Bit;

   --  PWM_FPV_FPVL array
   type PWM_FPV_FPVL_Field_Array is array (0 .. 7) of PWM_FPV_FPVL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_FPV_FPVL
   type PWM_FPV_FPVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPVL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FPVL as an array
            Arr : PWM_FPV_FPVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_FPV_FPVL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Fault Protection Value Register
   type PWM_FPV_Register is record
      --  Fault Protection Value for PWMH output on channel 0
      FPVH           : PWM_FPV_FPVH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Fault Protection Value for PWML output on channel 0
      FPVL           : PWM_FPV_FPVL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_FPV_Register use record
      FPVH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FPVL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  PWM_FPE1_FPE array element
   subtype PWM_FPE1_FPE_Element is ATSAM3X8E.Byte;

   --  PWM_FPE1_FPE array
   type PWM_FPE1_FPE_Field_Array is array (0 .. 3) of PWM_FPE1_FPE_Element
     with Component_Size => 8, Size => 32;

   --  PWM Fault Protection Enable Register 1
   type PWM_FPE1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPE as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  FPE as an array
            Arr : PWM_FPE1_FPE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWM_FPE1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PWM_FPE2_FPE array element
   subtype PWM_FPE2_FPE_Element is ATSAM3X8E.Byte;

   --  PWM_FPE2_FPE array
   type PWM_FPE2_FPE_Field_Array is array (4 .. 7) of PWM_FPE2_FPE_Element
     with Component_Size => 8, Size => 32;

   --  PWM Fault Protection Enable Register 2
   type PWM_FPE2_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPE as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  FPE as an array
            Arr : PWM_FPE2_FPE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWM_FPE2_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PWM_ELMR_CSEL array element
   subtype PWM_ELMR_CSEL_Element is ATSAM3X8E.Bit;

   --  PWM_ELMR_CSEL array
   type PWM_ELMR_CSEL_Field_Array is array (0 .. 7) of PWM_ELMR_CSEL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for PWM_ELMR_CSEL
   type PWM_ELMR_CSEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CSEL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CSEL as an array
            Arr : PWM_ELMR_CSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for PWM_ELMR_CSEL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Event Line 0 Mode Register
   type PWM_ELMR_Register is record
      --  Comparison 0 Selection
      CSEL          : PWM_ELMR_CSEL_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_ELMR_Register use record
      CSEL          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM_SMMR_GCEN array element
   subtype PWM_SMMR_GCEN_Element is ATSAM3X8E.Bit;

   --  PWM_SMMR_GCEN array
   type PWM_SMMR_GCEN_Field_Array is array (0 .. 3) of PWM_SMMR_GCEN_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for PWM_SMMR_GCEN
   type PWM_SMMR_GCEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GCEN as a value
            Val : ATSAM3X8E.UInt4;
         when True =>
            --  GCEN as an array
            Arr : PWM_SMMR_GCEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PWM_SMMR_GCEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  PWM_SMMR_DOWN array element
   subtype PWM_SMMR_DOWN_Element is ATSAM3X8E.Bit;

   --  PWM_SMMR_DOWN array
   type PWM_SMMR_DOWN_Field_Array is array (0 .. 3) of PWM_SMMR_DOWN_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for PWM_SMMR_DOWN
   type PWM_SMMR_DOWN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DOWN as a value
            Val : ATSAM3X8E.UInt4;
         when True =>
            --  DOWN as an array
            Arr : PWM_SMMR_DOWN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PWM_SMMR_DOWN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  PWM Stepper Motor Mode Register
   type PWM_SMMR_Register is record
      --  Gray Count ENable
      GCEN           : PWM_SMMR_GCEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_15  : ATSAM3X8E.UInt12 := 16#0#;
      --  DOWN Count
      DOWN           : PWM_SMMR_DOWN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_SMMR_Register use record
      GCEN           at 0 range 0 .. 3;
      Reserved_4_15  at 0 range 4 .. 15;
      DOWN           at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype PWM_WPCR_WPCMD_Field is ATSAM3X8E.UInt2;
   --  PWM_WPCR_WPRG array element
   subtype PWM_WPCR_WPRG_Element is ATSAM3X8E.Bit;

   --  PWM_WPCR_WPRG array
   type PWM_WPCR_WPRG_Field_Array is array (0 .. 5) of PWM_WPCR_WPRG_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for PWM_WPCR_WPRG
   type PWM_WPCR_WPRG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WPRG as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  WPRG as an array
            Arr : PWM_WPCR_WPRG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for PWM_WPCR_WPRG_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype PWM_WPCR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  PWM Write Protect Control Register
   type PWM_WPCR_Register is record
      --  Write-only. Write Protect Command
      WPCMD : PWM_WPCR_WPCMD_Field := 16#0#;
      --  Write-only. Write Protect Register Group 0
      WPRG  : PWM_WPCR_WPRG_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Write Protect Key
      WPKEY : PWM_WPCR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_WPCR_Register use record
      WPCMD at 0 range 0 .. 1;
      WPRG  at 0 range 2 .. 7;
      WPKEY at 0 range 8 .. 31;
   end record;

   --  PWM_WPSR_WPSWS array element
   subtype PWM_WPSR_WPSWS_Element is ATSAM3X8E.Bit;

   --  PWM_WPSR_WPSWS array
   type PWM_WPSR_WPSWS_Field_Array is array (0 .. 5)
     of PWM_WPSR_WPSWS_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for PWM_WPSR_WPSWS
   type PWM_WPSR_WPSWS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WPSWS as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  WPSWS as an array
            Arr : PWM_WPSR_WPSWS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for PWM_WPSR_WPSWS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype PWM_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   --  PWM_WPSR_WPHWS array element
   subtype PWM_WPSR_WPHWS_Element is ATSAM3X8E.Bit;

   --  PWM_WPSR_WPHWS array
   type PWM_WPSR_WPHWS_Field_Array is array (0 .. 5)
     of PWM_WPSR_WPHWS_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for PWM_WPSR_WPHWS
   type PWM_WPSR_WPHWS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WPHWS as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  WPHWS as an array
            Arr : PWM_WPSR_WPHWS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for PWM_WPSR_WPHWS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype PWM_WPSR_WPVSRC_Field is ATSAM3X8E.UInt16;

   --  PWM Write Protect Status Register
   type PWM_WPSR_Register is record
      --  Read-only. Write Protect SW Status
      WPSWS          : PWM_WPSR_WPSWS_Field;
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit;
      --  Read-only. Write Protect Violation Status
      WPVS           : PWM_WPSR_WPVS_Field;
      --  Read-only. Write Protect HW Status
      WPHWS          : PWM_WPSR_WPHWS_Field;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : PWM_WPSR_WPVSRC_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_WPSR_Register use record
      WPSWS          at 0 range 0 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      WPVS           at 0 range 7 .. 7;
      WPHWS          at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      WPVSRC         at 0 range 16 .. 31;
   end record;

   subtype PWM_TCR_TXCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Counter Register
   type PWM_TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : PWM_TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PWM_TNCR_TXNCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Next Counter Register
   type PWM_TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : PWM_TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PWM_PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype PWM_PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype PWM_PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype PWM_PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type PWM_PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : PWM_PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : PWM_PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : PWM_PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : PWM_PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype PWM_PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype PWM_PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type PWM_PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : PWM_PTSR_RXTEN_Field;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : PWM_PTSR_TXTEN_Field;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PWM_PTSR_Register use record
      RXTEN         at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      TXTEN         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype CMPV_CV_Field is ATSAM3X8E.UInt24;
   subtype CMPV_CVM_Field is ATSAM3X8E.Bit;

   --  PWM Comparison 0 Value Register
   type CMPV_Register is record
      --  Comparison x Value
      CV             : CMPV_CV_Field := 16#0#;
      --  Comparison x Value Mode
      CVM            : CMPV_CVM_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMPV_Register use record
      CV             at 0 range 0 .. 23;
      CVM            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CMPVUPD_CVUPD_Field is ATSAM3X8E.UInt24;
   subtype CMPVUPD_CVMUPD_Field is ATSAM3X8E.Bit;

   --  PWM Comparison 0 Value Update Register
   type CMPVUPD_Register is record
      --  Write-only. Comparison x Value Update
      CVUPD          : CMPVUPD_CVUPD_Field := 16#0#;
      --  Write-only. Comparison x Value Mode Update
      CVMUPD         : CMPVUPD_CVMUPD_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMPVUPD_Register use record
      CVUPD          at 0 range 0 .. 23;
      CVMUPD         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CMPM_CEN_Field is ATSAM3X8E.Bit;
   subtype CMPM_CTR_Field is ATSAM3X8E.UInt4;
   subtype CMPM_CPR_Field is ATSAM3X8E.UInt4;
   subtype CMPM_CPRCNT_Field is ATSAM3X8E.UInt4;
   subtype CMPM_CUPR_Field is ATSAM3X8E.UInt4;
   subtype CMPM_CUPRCNT_Field is ATSAM3X8E.UInt4;

   --  PWM Comparison 0 Mode Register
   type CMPM_Register is record
      --  Comparison x Enable
      CEN            : CMPM_CEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  Comparison x Trigger
      CTR            : CMPM_CTR_Field := 16#0#;
      --  Comparison x Period
      CPR            : CMPM_CPR_Field := 16#0#;
      --  Comparison x Period Counter
      CPRCNT         : CMPM_CPRCNT_Field := 16#0#;
      --  Comparison x Update Period
      CUPR           : CMPM_CUPR_Field := 16#0#;
      --  Comparison x Update Period Counter
      CUPRCNT        : CMPM_CUPRCNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMPM_Register use record
      CEN            at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CTR            at 0 range 4 .. 7;
      CPR            at 0 range 8 .. 11;
      CPRCNT         at 0 range 12 .. 15;
      CUPR           at 0 range 16 .. 19;
      CUPRCNT        at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CMPMUPD_CENUPD_Field is ATSAM3X8E.Bit;
   subtype CMPMUPD_CTRUPD_Field is ATSAM3X8E.UInt4;
   subtype CMPMUPD_CPRUPD_Field is ATSAM3X8E.UInt4;
   subtype CMPMUPD_CUPRUPD_Field is ATSAM3X8E.UInt4;

   --  PWM Comparison 0 Mode Update Register
   type CMPMUPD_Register is record
      --  Write-only. Comparison x Enable Update
      CENUPD         : CMPMUPD_CENUPD_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Comparison x Trigger Update
      CTRUPD         : CMPMUPD_CTRUPD_Field := 16#0#;
      --  Write-only. Comparison x Period Update
      CPRUPD         : CMPMUPD_CPRUPD_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Comparison x Update Period Update
      CUPRUPD        : CMPMUPD_CUPRUPD_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMPMUPD_Register use record
      CENUPD         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CTRUPD         at 0 range 4 .. 7;
      CPRUPD         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CUPRUPD        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Channel Pre-scaler
   type CMR0_CPRE_Field is
     (--  Master clock
      MCK,
      --  Master clock/2
      MCK_DIV_2,
      --  Master clock/4
      MCK_DIV_4,
      --  Master clock/8
      MCK_DIV_8,
      --  Master clock/16
      MCK_DIV_16,
      --  Master clock/32
      MCK_DIV_32,
      --  Master clock/64
      MCK_DIV_64,
      --  Master clock/128
      MCK_DIV_128,
      --  Master clock/256
      MCK_DIV_256,
      --  Master clock/512
      MCK_DIV_512,
      --  Master clock/1024
      MCK_DIV_1024,
      --  Clock A
      CLKA,
      --  Clock B
      CLKB)
     with Size => 4;
   for CMR0_CPRE_Field use
     (MCK => 0,
      MCK_DIV_2 => 1,
      MCK_DIV_4 => 2,
      MCK_DIV_8 => 3,
      MCK_DIV_16 => 4,
      MCK_DIV_32 => 5,
      MCK_DIV_64 => 6,
      MCK_DIV_128 => 7,
      MCK_DIV_256 => 8,
      MCK_DIV_512 => 9,
      MCK_DIV_1024 => 10,
      CLKA => 11,
      CLKB => 12);

   subtype CMR_CALG_Field is ATSAM3X8E.Bit;
   subtype CMR_CPOL_Field is ATSAM3X8E.Bit;
   subtype CMR_CES_Field is ATSAM3X8E.Bit;
   subtype CMR_DTE_Field is ATSAM3X8E.Bit;
   subtype CMR_DTHI_Field is ATSAM3X8E.Bit;
   subtype CMR_DTLI_Field is ATSAM3X8E.Bit;

   --  PWM Channel Mode Register (ch_num = 0)
   type CMR_Register is record
      --  Channel Pre-scaler
      CPRE           : CMR0_CPRE_Field := ATSAM3X8E.PWM.MCK;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Channel Alignment
      CALG           : CMR_CALG_Field := 16#0#;
      --  Channel Polarity
      CPOL           : CMR_CPOL_Field := 16#0#;
      --  Counter Event Selection
      CES            : CMR_CES_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5 := 16#0#;
      --  Dead-Time Generator Enable
      DTE            : CMR_DTE_Field := 16#0#;
      --  Dead-Time PWMHx Output Inverted
      DTHI           : CMR_DTHI_Field := 16#0#;
      --  Dead-Time PWMLx Output Inverted
      DTLI           : CMR_DTLI_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMR_Register use record
      CPRE           at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CALG           at 0 range 8 .. 8;
      CPOL           at 0 range 9 .. 9;
      CES            at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      DTE            at 0 range 16 .. 16;
      DTHI           at 0 range 17 .. 17;
      DTLI           at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype CDTY_CDTY_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Duty Cycle Register (ch_num = 0)
   type CDTY_Register is record
      --  Channel Duty-Cycle
      CDTY           : CDTY_CDTY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CDTY_Register use record
      CDTY           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CDTYUPD_CDTYUPD_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Duty Cycle Update Register (ch_num = 0)
   type CDTYUPD_Register is record
      --  Write-only. Channel Duty-Cycle Update
      CDTYUPD        : CDTYUPD_CDTYUPD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CDTYUPD_Register use record
      CDTYUPD        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CPRD_CPRD_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Period Register (ch_num = 0)
   type CPRD_Register is record
      --  Channel Period
      CPRD           : CPRD_CPRD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CPRD_Register use record
      CPRD           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CPRDUPD_CPRDUPD_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Period Update Register (ch_num = 0)
   type CPRDUPD_Register is record
      --  Write-only. Channel Period Update
      CPRDUPD        : CPRDUPD_CPRDUPD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CPRDUPD_Register use record
      CPRDUPD        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CCNT_CNT_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Counter Register (ch_num = 0)
   type CCNT_Register is record
      --  Read-only. Channel Counter Register
      CNT            : CCNT_CNT_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCNT_Register use record
      CNT            at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype DT_DTH_Field is ATSAM3X8E.UInt16;
   subtype DT_DTL_Field is ATSAM3X8E.UInt16;

   --  PWM Channel Dead Time Register (ch_num = 0)
   type DT_Register is record
      --  Dead-Time Value for PWMHx Output
      DTH : DT_DTH_Field := 16#0#;
      --  Dead-Time Value for PWMLx Output
      DTL : DT_DTL_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DT_Register use record
      DTH at 0 range 0 .. 15;
      DTL at 0 range 16 .. 31;
   end record;

   subtype DTUPD_DTHUPD_Field is ATSAM3X8E.UInt16;
   subtype DTUPD_DTLUPD_Field is ATSAM3X8E.UInt16;

   --  PWM Channel Dead Time Update Register (ch_num = 0)
   type DTUPD_Register is record
      --  Write-only. Dead-Time Value Update for PWMHx Output
      DTHUPD : DTUPD_DTHUPD_Field := 16#0#;
      --  Write-only. Dead-Time Value Update for PWMLx Output
      DTLUPD : DTUPD_DTLUPD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DTUPD_Register use record
      DTHUPD at 0 range 0 .. 15;
      DTLUPD at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Pulse Width Modulation Controller
   type PWM_Peripheral is record
      --  PWM Clock Register
      CLK      : aliased PWM_CLK_Register;
      pragma Volatile_Full_Access (CLK);
      --  PWM Enable Register
      ENA      : aliased PWM_ENA_Register;
      pragma Volatile_Full_Access (ENA);
      --  PWM Disable Register
      DIS      : aliased PWM_DIS_Register;
      pragma Volatile_Full_Access (DIS);
      --  PWM Status Register
      SR       : aliased PWM_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  PWM Interrupt Enable Register 1
      IER1     : aliased PWM_IER1_Register;
      pragma Volatile_Full_Access (IER1);
      --  PWM Interrupt Disable Register 1
      IDR1     : aliased PWM_IDR1_Register;
      pragma Volatile_Full_Access (IDR1);
      --  PWM Interrupt Mask Register 1
      IMR1     : aliased PWM_IMR1_Register;
      pragma Volatile_Full_Access (IMR1);
      --  PWM Interrupt Status Register 1
      ISR1     : aliased PWM_ISR1_Register;
      pragma Volatile_Full_Access (ISR1);
      --  PWM Sync Channels Mode Register
      SCM      : aliased PWM_SCM_Register;
      pragma Volatile_Full_Access (SCM);
      --  PWM Sync Channels Update Control Register
      SCUC     : aliased PWM_SCUC_Register;
      pragma Volatile_Full_Access (SCUC);
      --  PWM Sync Channels Update Period Register
      SCUP     : aliased PWM_SCUP_Register;
      pragma Volatile_Full_Access (SCUP);
      --  PWM Sync Channels Update Period Update Register
      SCUPUPD  : aliased PWM_SCUPUPD_Register;
      pragma Volatile_Full_Access (SCUPUPD);
      --  PWM Interrupt Enable Register 2
      IER2     : aliased PWM_IER2_Register;
      pragma Volatile_Full_Access (IER2);
      --  PWM Interrupt Disable Register 2
      IDR2     : aliased PWM_IDR2_Register;
      pragma Volatile_Full_Access (IDR2);
      --  PWM Interrupt Mask Register 2
      IMR2     : aliased PWM_IMR2_Register;
      pragma Volatile_Full_Access (IMR2);
      --  PWM Interrupt Status Register 2
      ISR2     : aliased PWM_ISR2_Register;
      pragma Volatile_Full_Access (ISR2);
      --  PWM Output Override Value Register
      OOV      : aliased PWM_OOV_Register;
      pragma Volatile_Full_Access (OOV);
      --  PWM Output Selection Register
      OS       : aliased PWM_OS_Register;
      pragma Volatile_Full_Access (OS);
      --  PWM Output Selection Set Register
      OSS      : aliased PWM_OSS_Register;
      pragma Volatile_Full_Access (OSS);
      --  PWM Output Selection Clear Register
      OSC      : aliased PWM_OSC_Register;
      pragma Volatile_Full_Access (OSC);
      --  PWM Output Selection Set Update Register
      OSSUPD   : aliased PWM_OSSUPD_Register;
      pragma Volatile_Full_Access (OSSUPD);
      --  PWM Output Selection Clear Update Register
      OSCUPD   : aliased PWM_OSCUPD_Register;
      pragma Volatile_Full_Access (OSCUPD);
      --  PWM Fault Mode Register
      FMR      : aliased PWM_FMR_Register;
      pragma Volatile_Full_Access (FMR);
      --  PWM Fault Status Register
      FSR      : aliased PWM_FSR_Register;
      pragma Volatile_Full_Access (FSR);
      --  PWM Fault Clear Register
      FCR      : aliased PWM_FCR_Register;
      pragma Volatile_Full_Access (FCR);
      --  PWM Fault Protection Value Register
      FPV      : aliased PWM_FPV_Register;
      pragma Volatile_Full_Access (FPV);
      --  PWM Fault Protection Enable Register 1
      FPE1     : aliased PWM_FPE1_Register;
      pragma Volatile_Full_Access (FPE1);
      --  PWM Fault Protection Enable Register 2
      FPE2     : aliased PWM_FPE2_Register;
      pragma Volatile_Full_Access (FPE2);
      --  PWM Event Line 0 Mode Register
      ELMR_0   : aliased PWM_ELMR_Register;
      pragma Volatile_Full_Access (ELMR_0);
      --  PWM Event Line 0 Mode Register
      ELMR_1   : aliased PWM_ELMR_Register;
      pragma Volatile_Full_Access (ELMR_1);
      --  PWM Stepper Motor Mode Register
      SMMR     : aliased PWM_SMMR_Register;
      pragma Volatile_Full_Access (SMMR);
      --  PWM Write Protect Control Register
      WPCR     : aliased PWM_WPCR_Register;
      pragma Volatile_Full_Access (WPCR);
      --  PWM Write Protect Status Register
      WPSR     : aliased PWM_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
      --  Transmit Pointer Register
      TPR      : aliased ATSAM3X8E.UInt32;
      --  Transmit Counter Register
      TCR      : aliased PWM_TCR_Register;
      pragma Volatile_Full_Access (TCR);
      --  Transmit Next Pointer Register
      TNPR     : aliased ATSAM3X8E.UInt32;
      --  Transmit Next Counter Register
      TNCR     : aliased PWM_TNCR_Register;
      pragma Volatile_Full_Access (TNCR);
      --  Transfer Control Register
      PTCR     : aliased PWM_PTCR_Register;
      pragma Volatile_Full_Access (PTCR);
      --  Transfer Status Register
      PTSR     : aliased PWM_PTSR_Register;
      pragma Volatile_Full_Access (PTSR);
      --  PWM Comparison 0 Value Register
      CMPV0    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV0);
      --  PWM Comparison 0 Value Update Register
      CMPVUPD0 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD0);
      --  PWM Comparison 0 Mode Register
      CMPM0    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM0);
      --  PWM Comparison 0 Mode Update Register
      CMPMUPD0 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD0);
      --  PWM Comparison 1 Value Register
      CMPV1    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV1);
      --  PWM Comparison 1 Value Update Register
      CMPVUPD1 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD1);
      --  PWM Comparison 1 Mode Register
      CMPM1    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM1);
      --  PWM Comparison 1 Mode Update Register
      CMPMUPD1 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD1);
      --  PWM Comparison 2 Value Register
      CMPV2    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV2);
      --  PWM Comparison 2 Value Update Register
      CMPVUPD2 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD2);
      --  PWM Comparison 2 Mode Register
      CMPM2    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM2);
      --  PWM Comparison 2 Mode Update Register
      CMPMUPD2 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD2);
      --  PWM Comparison 3 Value Register
      CMPV3    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV3);
      --  PWM Comparison 3 Value Update Register
      CMPVUPD3 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD3);
      --  PWM Comparison 3 Mode Register
      CMPM3    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM3);
      --  PWM Comparison 3 Mode Update Register
      CMPMUPD3 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD3);
      --  PWM Comparison 4 Value Register
      CMPV4    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV4);
      --  PWM Comparison 4 Value Update Register
      CMPVUPD4 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD4);
      --  PWM Comparison 4 Mode Register
      CMPM4    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM4);
      --  PWM Comparison 4 Mode Update Register
      CMPMUPD4 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD4);
      --  PWM Comparison 5 Value Register
      CMPV5    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV5);
      --  PWM Comparison 5 Value Update Register
      CMPVUPD5 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD5);
      --  PWM Comparison 5 Mode Register
      CMPM5    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM5);
      --  PWM Comparison 5 Mode Update Register
      CMPMUPD5 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD5);
      --  PWM Comparison 6 Value Register
      CMPV6    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV6);
      --  PWM Comparison 6 Value Update Register
      CMPVUPD6 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD6);
      --  PWM Comparison 6 Mode Register
      CMPM6    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM6);
      --  PWM Comparison 6 Mode Update Register
      CMPMUPD6 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD6);
      --  PWM Comparison 7 Value Register
      CMPV7    : aliased CMPV_Register;
      pragma Volatile_Full_Access (CMPV7);
      --  PWM Comparison 7 Value Update Register
      CMPVUPD7 : aliased CMPVUPD_Register;
      pragma Volatile_Full_Access (CMPVUPD7);
      --  PWM Comparison 7 Mode Register
      CMPM7    : aliased CMPM_Register;
      pragma Volatile_Full_Access (CMPM7);
      --  PWM Comparison 7 Mode Update Register
      CMPMUPD7 : aliased CMPMUPD_Register;
      pragma Volatile_Full_Access (CMPMUPD7);
      --  PWM Channel Mode Register (ch_num = 0)
      CMR0     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR0);
      --  PWM Channel Duty Cycle Register (ch_num = 0)
      CDTY0    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY0);
      --  PWM Channel Duty Cycle Update Register (ch_num = 0)
      CDTYUPD0 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD0);
      --  PWM Channel Period Register (ch_num = 0)
      CPRD0    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD0);
      --  PWM Channel Period Update Register (ch_num = 0)
      CPRDUPD0 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD0);
      --  PWM Channel Counter Register (ch_num = 0)
      CCNT0    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT0);
      --  PWM Channel Dead Time Register (ch_num = 0)
      DT0      : aliased DT_Register;
      pragma Volatile_Full_Access (DT0);
      --  PWM Channel Dead Time Update Register (ch_num = 0)
      DTUPD0   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD0);
      --  PWM Channel Mode Register (ch_num = 1)
      CMR1     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR1);
      --  PWM Channel Duty Cycle Register (ch_num = 1)
      CDTY1    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY1);
      --  PWM Channel Duty Cycle Update Register (ch_num = 1)
      CDTYUPD1 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD1);
      --  PWM Channel Period Register (ch_num = 1)
      CPRD1    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD1);
      --  PWM Channel Period Update Register (ch_num = 1)
      CPRDUPD1 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD1);
      --  PWM Channel Counter Register (ch_num = 1)
      CCNT1    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT1);
      --  PWM Channel Dead Time Register (ch_num = 1)
      DT1      : aliased DT_Register;
      pragma Volatile_Full_Access (DT1);
      --  PWM Channel Dead Time Update Register (ch_num = 1)
      DTUPD1   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD1);
      --  PWM Channel Mode Register (ch_num = 2)
      CMR2     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR2);
      --  PWM Channel Duty Cycle Register (ch_num = 2)
      CDTY2    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY2);
      --  PWM Channel Duty Cycle Update Register (ch_num = 2)
      CDTYUPD2 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD2);
      --  PWM Channel Period Register (ch_num = 2)
      CPRD2    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD2);
      --  PWM Channel Period Update Register (ch_num = 2)
      CPRDUPD2 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD2);
      --  PWM Channel Counter Register (ch_num = 2)
      CCNT2    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT2);
      --  PWM Channel Dead Time Register (ch_num = 2)
      DT2      : aliased DT_Register;
      pragma Volatile_Full_Access (DT2);
      --  PWM Channel Dead Time Update Register (ch_num = 2)
      DTUPD2   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD2);
      --  PWM Channel Mode Register (ch_num = 3)
      CMR3     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR3);
      --  PWM Channel Duty Cycle Register (ch_num = 3)
      CDTY3    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY3);
      --  PWM Channel Duty Cycle Update Register (ch_num = 3)
      CDTYUPD3 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD3);
      --  PWM Channel Period Register (ch_num = 3)
      CPRD3    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD3);
      --  PWM Channel Period Update Register (ch_num = 3)
      CPRDUPD3 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD3);
      --  PWM Channel Counter Register (ch_num = 3)
      CCNT3    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT3);
      --  PWM Channel Dead Time Register (ch_num = 3)
      DT3      : aliased DT_Register;
      pragma Volatile_Full_Access (DT3);
      --  PWM Channel Dead Time Update Register (ch_num = 3)
      DTUPD3   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD3);
      --  PWM Channel Mode Register (ch_num = 4)
      CMR4     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR4);
      --  PWM Channel Duty Cycle Register (ch_num = 4)
      CDTY4    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY4);
      --  PWM Channel Duty Cycle Update Register (ch_num = 4)
      CDTYUPD4 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD4);
      --  PWM Channel Period Register (ch_num = 4)
      CPRD4    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD4);
      --  PWM Channel Period Update Register (ch_num = 4)
      CPRDUPD4 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD4);
      --  PWM Channel Counter Register (ch_num = 4)
      CCNT4    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT4);
      --  PWM Channel Dead Time Register (ch_num = 4)
      DT4      : aliased DT_Register;
      pragma Volatile_Full_Access (DT4);
      --  PWM Channel Dead Time Update Register (ch_num = 4)
      DTUPD4   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD4);
      --  PWM Channel Mode Register (ch_num = 5)
      CMR5     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR5);
      --  PWM Channel Duty Cycle Register (ch_num = 5)
      CDTY5    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY5);
      --  PWM Channel Duty Cycle Update Register (ch_num = 5)
      CDTYUPD5 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD5);
      --  PWM Channel Period Register (ch_num = 5)
      CPRD5    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD5);
      --  PWM Channel Period Update Register (ch_num = 5)
      CPRDUPD5 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD5);
      --  PWM Channel Counter Register (ch_num = 5)
      CCNT5    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT5);
      --  PWM Channel Dead Time Register (ch_num = 5)
      DT5      : aliased DT_Register;
      pragma Volatile_Full_Access (DT5);
      --  PWM Channel Dead Time Update Register (ch_num = 5)
      DTUPD5   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD5);
      --  PWM Channel Mode Register (ch_num = 6)
      CMR6     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR6);
      --  PWM Channel Duty Cycle Register (ch_num = 6)
      CDTY6    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY6);
      --  PWM Channel Duty Cycle Update Register (ch_num = 6)
      CDTYUPD6 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD6);
      --  PWM Channel Period Register (ch_num = 6)
      CPRD6    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD6);
      --  PWM Channel Period Update Register (ch_num = 6)
      CPRDUPD6 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD6);
      --  PWM Channel Counter Register (ch_num = 6)
      CCNT6    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT6);
      --  PWM Channel Dead Time Register (ch_num = 6)
      DT6      : aliased DT_Register;
      pragma Volatile_Full_Access (DT6);
      --  PWM Channel Dead Time Update Register (ch_num = 6)
      DTUPD6   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD6);
      --  PWM Channel Mode Register (ch_num = 7)
      CMR7     : aliased CMR_Register;
      pragma Volatile_Full_Access (CMR7);
      --  PWM Channel Duty Cycle Register (ch_num = 7)
      CDTY7    : aliased CDTY_Register;
      pragma Volatile_Full_Access (CDTY7);
      --  PWM Channel Duty Cycle Update Register (ch_num = 7)
      CDTYUPD7 : aliased CDTYUPD_Register;
      pragma Volatile_Full_Access (CDTYUPD7);
      --  PWM Channel Period Register (ch_num = 7)
      CPRD7    : aliased CPRD_Register;
      pragma Volatile_Full_Access (CPRD7);
      --  PWM Channel Period Update Register (ch_num = 7)
      CPRDUPD7 : aliased CPRDUPD_Register;
      pragma Volatile_Full_Access (CPRDUPD7);
      --  PWM Channel Counter Register (ch_num = 7)
      CCNT7    : aliased CCNT_Register;
      pragma Volatile_Full_Access (CCNT7);
      --  PWM Channel Dead Time Register (ch_num = 7)
      DT7      : aliased DT_Register;
      pragma Volatile_Full_Access (DT7);
      --  PWM Channel Dead Time Update Register (ch_num = 7)
      DTUPD7   : aliased DTUPD_Register;
      pragma Volatile_Full_Access (DTUPD7);
   end record
     with Volatile;

   for PWM_Peripheral use record
      CLK      at 16#0# range 0 .. 31;
      ENA      at 16#4# range 0 .. 31;
      DIS      at 16#8# range 0 .. 31;
      SR       at 16#C# range 0 .. 31;
      IER1     at 16#10# range 0 .. 31;
      IDR1     at 16#14# range 0 .. 31;
      IMR1     at 16#18# range 0 .. 31;
      ISR1     at 16#1C# range 0 .. 31;
      SCM      at 16#20# range 0 .. 31;
      SCUC     at 16#28# range 0 .. 31;
      SCUP     at 16#2C# range 0 .. 31;
      SCUPUPD  at 16#30# range 0 .. 31;
      IER2     at 16#34# range 0 .. 31;
      IDR2     at 16#38# range 0 .. 31;
      IMR2     at 16#3C# range 0 .. 31;
      ISR2     at 16#40# range 0 .. 31;
      OOV      at 16#44# range 0 .. 31;
      OS       at 16#48# range 0 .. 31;
      OSS      at 16#4C# range 0 .. 31;
      OSC      at 16#50# range 0 .. 31;
      OSSUPD   at 16#54# range 0 .. 31;
      OSCUPD   at 16#58# range 0 .. 31;
      FMR      at 16#5C# range 0 .. 31;
      FSR      at 16#60# range 0 .. 31;
      FCR      at 16#64# range 0 .. 31;
      FPV      at 16#68# range 0 .. 31;
      FPE1     at 16#6C# range 0 .. 31;
      FPE2     at 16#70# range 0 .. 31;
      ELMR_0   at 16#7C# range 0 .. 31;
      ELMR_1   at 16#80# range 0 .. 31;
      SMMR     at 16#B0# range 0 .. 31;
      WPCR     at 16#E4# range 0 .. 31;
      WPSR     at 16#E8# range 0 .. 31;
      TPR      at 16#108# range 0 .. 31;
      TCR      at 16#10C# range 0 .. 31;
      TNPR     at 16#118# range 0 .. 31;
      TNCR     at 16#11C# range 0 .. 31;
      PTCR     at 16#120# range 0 .. 31;
      PTSR     at 16#124# range 0 .. 31;
      CMPV0    at 16#130# range 0 .. 31;
      CMPVUPD0 at 16#134# range 0 .. 31;
      CMPM0    at 16#138# range 0 .. 31;
      CMPMUPD0 at 16#13C# range 0 .. 31;
      CMPV1    at 16#140# range 0 .. 31;
      CMPVUPD1 at 16#144# range 0 .. 31;
      CMPM1    at 16#148# range 0 .. 31;
      CMPMUPD1 at 16#14C# range 0 .. 31;
      CMPV2    at 16#150# range 0 .. 31;
      CMPVUPD2 at 16#154# range 0 .. 31;
      CMPM2    at 16#158# range 0 .. 31;
      CMPMUPD2 at 16#15C# range 0 .. 31;
      CMPV3    at 16#160# range 0 .. 31;
      CMPVUPD3 at 16#164# range 0 .. 31;
      CMPM3    at 16#168# range 0 .. 31;
      CMPMUPD3 at 16#16C# range 0 .. 31;
      CMPV4    at 16#170# range 0 .. 31;
      CMPVUPD4 at 16#174# range 0 .. 31;
      CMPM4    at 16#178# range 0 .. 31;
      CMPMUPD4 at 16#17C# range 0 .. 31;
      CMPV5    at 16#180# range 0 .. 31;
      CMPVUPD5 at 16#184# range 0 .. 31;
      CMPM5    at 16#188# range 0 .. 31;
      CMPMUPD5 at 16#18C# range 0 .. 31;
      CMPV6    at 16#190# range 0 .. 31;
      CMPVUPD6 at 16#194# range 0 .. 31;
      CMPM6    at 16#198# range 0 .. 31;
      CMPMUPD6 at 16#19C# range 0 .. 31;
      CMPV7    at 16#1A0# range 0 .. 31;
      CMPVUPD7 at 16#1A4# range 0 .. 31;
      CMPM7    at 16#1A8# range 0 .. 31;
      CMPMUPD7 at 16#1AC# range 0 .. 31;
      CMR0     at 16#200# range 0 .. 31;
      CDTY0    at 16#204# range 0 .. 31;
      CDTYUPD0 at 16#208# range 0 .. 31;
      CPRD0    at 16#20C# range 0 .. 31;
      CPRDUPD0 at 16#210# range 0 .. 31;
      CCNT0    at 16#214# range 0 .. 31;
      DT0      at 16#218# range 0 .. 31;
      DTUPD0   at 16#21C# range 0 .. 31;
      CMR1     at 16#220# range 0 .. 31;
      CDTY1    at 16#224# range 0 .. 31;
      CDTYUPD1 at 16#228# range 0 .. 31;
      CPRD1    at 16#22C# range 0 .. 31;
      CPRDUPD1 at 16#230# range 0 .. 31;
      CCNT1    at 16#234# range 0 .. 31;
      DT1      at 16#238# range 0 .. 31;
      DTUPD1   at 16#23C# range 0 .. 31;
      CMR2     at 16#240# range 0 .. 31;
      CDTY2    at 16#244# range 0 .. 31;
      CDTYUPD2 at 16#248# range 0 .. 31;
      CPRD2    at 16#24C# range 0 .. 31;
      CPRDUPD2 at 16#250# range 0 .. 31;
      CCNT2    at 16#254# range 0 .. 31;
      DT2      at 16#258# range 0 .. 31;
      DTUPD2   at 16#25C# range 0 .. 31;
      CMR3     at 16#260# range 0 .. 31;
      CDTY3    at 16#264# range 0 .. 31;
      CDTYUPD3 at 16#268# range 0 .. 31;
      CPRD3    at 16#26C# range 0 .. 31;
      CPRDUPD3 at 16#270# range 0 .. 31;
      CCNT3    at 16#274# range 0 .. 31;
      DT3      at 16#278# range 0 .. 31;
      DTUPD3   at 16#27C# range 0 .. 31;
      CMR4     at 16#280# range 0 .. 31;
      CDTY4    at 16#284# range 0 .. 31;
      CDTYUPD4 at 16#288# range 0 .. 31;
      CPRD4    at 16#28C# range 0 .. 31;
      CPRDUPD4 at 16#290# range 0 .. 31;
      CCNT4    at 16#294# range 0 .. 31;
      DT4      at 16#298# range 0 .. 31;
      DTUPD4   at 16#29C# range 0 .. 31;
      CMR5     at 16#2A0# range 0 .. 31;
      CDTY5    at 16#2A4# range 0 .. 31;
      CDTYUPD5 at 16#2A8# range 0 .. 31;
      CPRD5    at 16#2AC# range 0 .. 31;
      CPRDUPD5 at 16#2B0# range 0 .. 31;
      CCNT5    at 16#2B4# range 0 .. 31;
      DT5      at 16#2B8# range 0 .. 31;
      DTUPD5   at 16#2BC# range 0 .. 31;
      CMR6     at 16#2C0# range 0 .. 31;
      CDTY6    at 16#2C4# range 0 .. 31;
      CDTYUPD6 at 16#2C8# range 0 .. 31;
      CPRD6    at 16#2CC# range 0 .. 31;
      CPRDUPD6 at 16#2D0# range 0 .. 31;
      CCNT6    at 16#2D4# range 0 .. 31;
      DT6      at 16#2D8# range 0 .. 31;
      DTUPD6   at 16#2DC# range 0 .. 31;
      CMR7     at 16#2E0# range 0 .. 31;
      CDTY7    at 16#2E4# range 0 .. 31;
      CDTYUPD7 at 16#2E8# range 0 .. 31;
      CPRD7    at 16#2EC# range 0 .. 31;
      CPRDUPD7 at 16#2F0# range 0 .. 31;
      CCNT7    at 16#2F4# range 0 .. 31;
      DT7      at 16#2F8# range 0 .. 31;
      DTUPD7   at 16#2FC# range 0 .. 31;
   end record;

   --  Pulse Width Modulation Controller
   PWM_Periph : aliased PWM_Peripheral
     with Import, Address => PWM_Base;

end ATSAM3X8E.PWM;
