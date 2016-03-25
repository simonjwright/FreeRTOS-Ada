--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Pulse Width Modulation Controller
package ATSAM3X8E.PWM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- CLK_Register --
   ------------------

   subtype CLK_DIVA_Field is ATSAM3X8E.Byte;
   subtype CLK_PREA_Field is ATSAM3X8E.UInt4;
   subtype CLK_DIVB_Field is ATSAM3X8E.Byte;
   subtype CLK_PREB_Field is ATSAM3X8E.UInt4;

   --  PWM Clock Register
   type CLK_Register is record
      --  CLKA, CLKB Divide Factor
      DIVA           : CLK_DIVA_Field := 16#0#;
      --  CLKA, CLKB Source Clock Selection
      PREA           : CLK_PREA_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  CLKA, CLKB Divide Factor
      DIVB           : CLK_DIVB_Field := 16#0#;
      --  CLKA, CLKB Source Clock Selection
      PREB           : CLK_PREB_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : ATSAM3X8E.UInt4 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CLK_Register use record
      DIVA           at 0 range 0 .. 7;
      PREA           at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DIVB           at 0 range 16 .. 23;
      PREB           at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   ------------------
   -- ENA_Register --
   ------------------

   --------------
   -- ENA.CHID --
   --------------

   --  ENA_CHID array element
   subtype ENA_CHID_Element is ATSAM3X8E.Bit;

   --  ENA_CHID array
   type ENA_CHID_Field_Array is array (0 .. 7) of ENA_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ENA_CHID
   type ENA_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : ENA_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ENA_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Enable Register
   type ENA_Register is record
      --  Write-only. Channel ID
      CHID          : ENA_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ENA_Register use record
      CHID          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- DIS_Register --
   ------------------

   --------------
   -- DIS.CHID --
   --------------

   --  DIS_CHID array element
   subtype DIS_CHID_Element is ATSAM3X8E.Bit;

   --  DIS_CHID array
   type DIS_CHID_Field_Array is array (0 .. 7) of DIS_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for DIS_CHID
   type DIS_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : DIS_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for DIS_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Disable Register
   type DIS_Register is record
      --  Write-only. Channel ID
      CHID          : DIS_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DIS_Register use record
      CHID          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   -------------
   -- SR.CHID --
   -------------

   --  SR_CHID array element
   subtype SR_CHID_Element is ATSAM3X8E.Bit;

   --  SR_CHID array
   type SR_CHID_Field_Array is array (0 .. 7) of SR_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for SR_CHID
   type SR_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : SR_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for SR_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Status Register
   type SR_Register is record
      --  Read-only. Channel ID
      CHID          : SR_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      CHID          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- IER1_Register --
   -------------------

   ---------------
   -- IER1.CHID --
   ---------------

   --  IER1_CHID array element
   subtype IER1_CHID_Element is ATSAM3X8E.Bit;

   --  IER1_CHID array
   type IER1_CHID_Field_Array is array (0 .. 7) of IER1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IER1_CHID
   type IER1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : IER1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IER1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ----------------
   -- IER1.FCHID --
   ----------------

   --  IER1_FCHID array element
   subtype IER1_FCHID_Element is ATSAM3X8E.Bit;

   --  IER1_FCHID array
   type IER1_FCHID_Field_Array is array (0 .. 7) of IER1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IER1_FCHID
   type IER1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : IER1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IER1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Enable Register 1
   type IER1_Register is record
      --  Write-only. Counter Event on Channel 0 Interrupt Enable
      CHID           : IER1_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Fault Protection Trigger on Channel 0 Interrupt Enable
      FCHID          : IER1_FCHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- IDR1_Register --
   -------------------

   ---------------
   -- IDR1.CHID --
   ---------------

   --  IDR1_CHID array element
   subtype IDR1_CHID_Element is ATSAM3X8E.Bit;

   --  IDR1_CHID array
   type IDR1_CHID_Field_Array is array (0 .. 7) of IDR1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IDR1_CHID
   type IDR1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : IDR1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IDR1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ----------------
   -- IDR1.FCHID --
   ----------------

   --  IDR1_FCHID array element
   subtype IDR1_FCHID_Element is ATSAM3X8E.Bit;

   --  IDR1_FCHID array
   type IDR1_FCHID_Field_Array is array (0 .. 7) of IDR1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IDR1_FCHID
   type IDR1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : IDR1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IDR1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Disable Register 1
   type IDR1_Register is record
      --  Write-only. Counter Event on Channel 0 Interrupt Disable
      CHID           : IDR1_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Fault Protection Trigger on Channel 0 Interrupt Disable
      FCHID          : IDR1_FCHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- IMR1_Register --
   -------------------

   ---------------
   -- IMR1.CHID --
   ---------------

   --  IMR1_CHID array element
   subtype IMR1_CHID_Element is ATSAM3X8E.Bit;

   --  IMR1_CHID array
   type IMR1_CHID_Field_Array is array (0 .. 7) of IMR1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IMR1_CHID
   type IMR1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : IMR1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IMR1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ----------------
   -- IMR1.FCHID --
   ----------------

   --  IMR1_FCHID array element
   subtype IMR1_FCHID_Element is ATSAM3X8E.Bit;

   --  IMR1_FCHID array
   type IMR1_FCHID_Field_Array is array (0 .. 7) of IMR1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IMR1_FCHID
   type IMR1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : IMR1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IMR1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Mask Register 1
   type IMR1_Register is record
      --  Read-only. Counter Event on Channel 0 Interrupt Mask
      CHID           : IMR1_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Fault Protection Trigger on Channel 0 Interrupt Mask
      FCHID          : IMR1_FCHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- ISR1_Register --
   -------------------

   ---------------
   -- ISR1.CHID --
   ---------------

   --  ISR1_CHID array element
   subtype ISR1_CHID_Element is ATSAM3X8E.Bit;

   --  ISR1_CHID array
   type ISR1_CHID_Field_Array is array (0 .. 7) of ISR1_CHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ISR1_CHID
   type ISR1_CHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CHID as an array
            Arr : ISR1_CHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ISR1_CHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ----------------
   -- ISR1.FCHID --
   ----------------

   --  ISR1_FCHID array element
   subtype ISR1_FCHID_Element is ATSAM3X8E.Bit;

   --  ISR1_FCHID array
   type ISR1_FCHID_Field_Array is array (0 .. 7) of ISR1_FCHID_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ISR1_FCHID
   type ISR1_FCHID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FCHID as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FCHID as an array
            Arr : ISR1_FCHID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ISR1_FCHID_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Status Register 1
   type ISR1_Register is record
      --  Read-only. Counter Event on Channel 0
      CHID           : ISR1_CHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Fault Protection Trigger on Channel 0
      FCHID          : ISR1_FCHID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ISR1_Register use record
      CHID           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FCHID          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- SCM_Register --
   ------------------

   --------------
   -- SCM.SYNC --
   --------------

   --  SCM_SYNC array element
   subtype SCM_SYNC_Element is ATSAM3X8E.Bit;

   --  SCM_SYNC array
   type SCM_SYNC_Field_Array is array (0 .. 7) of SCM_SYNC_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for SCM_SYNC
   type SCM_SYNC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SYNC as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  SYNC as an array
            Arr : SCM_SYNC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for SCM_SYNC_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Synchronous Channels Update Mode
   type UPDM_Field is
     (
      --  Manual write of double buffer registers and manual update of
      --  synchronous channels
      Mode0,
      --  Manual write of double buffer registers and automatic update of
      --  synchronous channels
      Mode1,
      --  Automatic write of duty-cycle update registers by the PDC and
      --  automatic update of synchronous channels
      Mode2)
     with Size => 2;
   for UPDM_Field use
     (Mode0 => 0,
      Mode1 => 1,
      Mode2 => 2);

   subtype SCM_PTRM_Field is ATSAM3X8E.Bit;
   subtype SCM_PTRCS_Field is ATSAM3X8E.UInt3;

   --  PWM Sync Channels Mode Register
   type SCM_Register is record
      --  Synchronous Channel 0
      SYNC           : SCM_SYNC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Synchronous Channels Update Mode
      UPDM           : UPDM_Field := Mode0;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  PDC Transfer Request Mode
      PTRM           : SCM_PTRM_Field := 16#0#;
      --  PDC Transfer Request Comparison Selection
      PTRCS          : SCM_PTRCS_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCM_Register use record
      SYNC           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      UPDM           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      PTRM           at 0 range 20 .. 20;
      PTRCS          at 0 range 21 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- SCUC_Register --
   -------------------

   subtype SCUC_UPDULOCK_Field is ATSAM3X8E.Bit;

   --  PWM Sync Channels Update Control Register
   type SCUC_Register is record
      --  Synchronous Channels Update Unlock
      UPDULOCK      : SCUC_UPDULOCK_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCUC_Register use record
      UPDULOCK      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -------------------
   -- SCUP_Register --
   -------------------

   subtype SCUP_UPR_Field is ATSAM3X8E.UInt4;
   subtype SCUP_UPRCNT_Field is ATSAM3X8E.UInt4;

   --  PWM Sync Channels Update Period Register
   type SCUP_Register is record
      --  Update Period
      UPR           : SCUP_UPR_Field := 16#0#;
      --  Update Period Counter
      UPRCNT        : SCUP_UPRCNT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCUP_Register use record
      UPR           at 0 range 0 .. 3;
      UPRCNT        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ----------------------
   -- SCUPUPD_Register --
   ----------------------

   subtype SCUPUPD_UPRUPD_Field is ATSAM3X8E.UInt4;

   --  PWM Sync Channels Update Period Update Register
   type SCUPUPD_Register is record
      --  Write-only. Update Period Update
      UPRUPD        : SCUPUPD_UPRUPD_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCUPUPD_Register use record
      UPRUPD        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -------------------
   -- IER2_Register --
   -------------------

   subtype IER2_WRDY_Field is ATSAM3X8E.Bit;
   subtype IER2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IER2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IER2_UNRE_Field is ATSAM3X8E.Bit;

   ---------------
   -- IER2.CMPM --
   ---------------

   --  IER2_CMPM array element
   subtype IER2_CMPM_Element is ATSAM3X8E.Bit;

   --  IER2_CMPM array
   type IER2_CMPM_Field_Array is array (0 .. 7) of IER2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IER2_CMPM
   type IER2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : IER2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IER2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ---------------
   -- IER2.CMPU --
   ---------------

   --  IER2_CMPU array element
   subtype IER2_CMPU_Element is ATSAM3X8E.Bit;

   --  IER2_CMPU array
   type IER2_CMPU_Field_Array is array (0 .. 7) of IER2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IER2_CMPU
   type IER2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : IER2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IER2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Enable Register 2
   type IER2_Register is record
      --  Write-only. Write Ready for Synchronous Channels Update Interrupt
      --  Enable
      WRDY           : IER2_WRDY_Field := 16#0#;
      --  Write-only. PDC End of TX Buffer Interrupt Enable
      ENDTX          : IER2_ENDTX_Field := 16#0#;
      --  Write-only. PDC TX Buffer Empty Interrupt Enable
      TXBUFE         : IER2_TXBUFE_Field := 16#0#;
      --  Write-only. Synchronous Channels Update Underrun Error Interrupt
      --  Enable
      UNRE           : IER2_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Comparison 0 Match Interrupt Enable
      CMPM           : IER2_CMPM_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Comparison 0 Update Interrupt Enable
      CMPU           : IER2_CMPU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- IDR2_Register --
   -------------------

   subtype IDR2_WRDY_Field is ATSAM3X8E.Bit;
   subtype IDR2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IDR2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IDR2_UNRE_Field is ATSAM3X8E.Bit;

   ---------------
   -- IDR2.CMPM --
   ---------------

   --  IDR2_CMPM array element
   subtype IDR2_CMPM_Element is ATSAM3X8E.Bit;

   --  IDR2_CMPM array
   type IDR2_CMPM_Field_Array is array (0 .. 7) of IDR2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IDR2_CMPM
   type IDR2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : IDR2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IDR2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ---------------
   -- IDR2.CMPU --
   ---------------

   --  IDR2_CMPU array element
   subtype IDR2_CMPU_Element is ATSAM3X8E.Bit;

   --  IDR2_CMPU array
   type IDR2_CMPU_Field_Array is array (0 .. 7) of IDR2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IDR2_CMPU
   type IDR2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : IDR2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IDR2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Disable Register 2
   type IDR2_Register is record
      --  Write-only. Write Ready for Synchronous Channels Update Interrupt
      --  Disable
      WRDY           : IDR2_WRDY_Field := 16#0#;
      --  Write-only. PDC End of TX Buffer Interrupt Disable
      ENDTX          : IDR2_ENDTX_Field := 16#0#;
      --  Write-only. PDC TX Buffer Empty Interrupt Disable
      TXBUFE         : IDR2_TXBUFE_Field := 16#0#;
      --  Write-only. Synchronous Channels Update Underrun Error Interrupt
      --  Disable
      UNRE           : IDR2_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Comparison 0 Match Interrupt Disable
      CMPM           : IDR2_CMPM_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Comparison 0 Update Interrupt Disable
      CMPU           : IDR2_CMPU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- IMR2_Register --
   -------------------

   subtype IMR2_WRDY_Field is ATSAM3X8E.Bit;
   subtype IMR2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IMR2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IMR2_UNRE_Field is ATSAM3X8E.Bit;

   ---------------
   -- IMR2.CMPM --
   ---------------

   --  IMR2_CMPM array element
   subtype IMR2_CMPM_Element is ATSAM3X8E.Bit;

   --  IMR2_CMPM array
   type IMR2_CMPM_Field_Array is array (0 .. 7) of IMR2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IMR2_CMPM
   type IMR2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : IMR2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IMR2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ---------------
   -- IMR2.CMPU --
   ---------------

   --  IMR2_CMPU array element
   subtype IMR2_CMPU_Element is ATSAM3X8E.Bit;

   --  IMR2_CMPU array
   type IMR2_CMPU_Field_Array is array (0 .. 7) of IMR2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IMR2_CMPU
   type IMR2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : IMR2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IMR2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Mask Register 2
   type IMR2_Register is record
      --  Read-only. Write Ready for Synchronous Channels Update Interrupt Mask
      WRDY           : IMR2_WRDY_Field := 16#0#;
      --  Read-only. PDC End of TX Buffer Interrupt Mask
      ENDTX          : IMR2_ENDTX_Field := 16#0#;
      --  Read-only. PDC TX Buffer Empty Interrupt Mask
      TXBUFE         : IMR2_TXBUFE_Field := 16#0#;
      --  Read-only. Synchronous Channels Update Underrun Error Interrupt Mask
      UNRE           : IMR2_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Comparison 0 Match Interrupt Mask
      CMPM           : IMR2_CMPM_Field := (As_Array => False, Val => 16#0#);
      --  Read-only. Comparison 0 Update Interrupt Mask
      CMPU           : IMR2_CMPU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- ISR2_Register --
   -------------------

   subtype ISR2_WRDY_Field is ATSAM3X8E.Bit;
   subtype ISR2_ENDTX_Field is ATSAM3X8E.Bit;
   subtype ISR2_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype ISR2_UNRE_Field is ATSAM3X8E.Bit;

   ---------------
   -- ISR2.CMPM --
   ---------------

   --  ISR2_CMPM array element
   subtype ISR2_CMPM_Element is ATSAM3X8E.Bit;

   --  ISR2_CMPM array
   type ISR2_CMPM_Field_Array is array (0 .. 7) of ISR2_CMPM_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ISR2_CMPM
   type ISR2_CMPM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPM as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPM as an array
            Arr : ISR2_CMPM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ISR2_CMPM_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ---------------
   -- ISR2.CMPU --
   ---------------

   --  ISR2_CMPU array element
   subtype ISR2_CMPU_Element is ATSAM3X8E.Bit;

   --  ISR2_CMPU array
   type ISR2_CMPU_Field_Array is array (0 .. 7) of ISR2_CMPU_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ISR2_CMPU
   type ISR2_CMPU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPU as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CMPU as an array
            Arr : ISR2_CMPU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ISR2_CMPU_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Interrupt Status Register 2
   type ISR2_Register is record
      --  Read-only. Write Ready for Synchronous Channels Update
      WRDY           : ISR2_WRDY_Field := 16#0#;
      --  Read-only. PDC End of TX Buffer
      ENDTX          : ISR2_ENDTX_Field := 16#0#;
      --  Read-only. PDC TX Buffer Empty
      TXBUFE         : ISR2_TXBUFE_Field := 16#0#;
      --  Read-only. Synchronous Channels Update Underrun Error
      UNRE           : ISR2_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4;
      --  Read-only. Comparison 0 Match
      CMPM           : ISR2_CMPM_Field := (As_Array => False, Val => 16#0#);
      --  Read-only. Comparison 0 Update
      CMPU           : ISR2_CMPU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ISR2_Register use record
      WRDY           at 0 range 0 .. 0;
      ENDTX          at 0 range 1 .. 1;
      TXBUFE         at 0 range 2 .. 2;
      UNRE           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CMPM           at 0 range 8 .. 15;
      CMPU           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- OOV_Register --
   ------------------

   --------------
   -- OOV.OOVH --
   --------------

   --  OOV_OOVH array element
   subtype OOV_OOVH_Element is ATSAM3X8E.Bit;

   --  OOV_OOVH array
   type OOV_OOVH_Field_Array is array (0 .. 7) of OOV_OOVH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OOV_OOVH
   type OOV_OOVH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OOVH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OOVH as an array
            Arr : OOV_OOVH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OOV_OOVH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --------------
   -- OOV.OOVL --
   --------------

   --  OOV_OOVL array element
   subtype OOV_OOVL_Element is ATSAM3X8E.Bit;

   --  OOV_OOVL array
   type OOV_OOVL_Field_Array is array (0 .. 7) of OOV_OOVL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OOV_OOVL
   type OOV_OOVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OOVL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OOVL as an array
            Arr : OOV_OOVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OOV_OOVL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Override Value Register
   type OOV_Register is record
      --  Output Override Value for PWMH output of the channel 0
      OOVH           : OOV_OOVH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Output Override Value for PWML output of the channel 0
      OOVL           : OOV_OOVL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OOV_Register use record
      OOVH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OOVL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- OS_Register --
   -----------------

   ------------
   -- OS.OSH --
   ------------

   --  OS_OSH array element
   subtype OS_OSH_Element is ATSAM3X8E.Bit;

   --  OS_OSH array
   type OS_OSH_Field_Array is array (0 .. 7) of OS_OSH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OS_OSH
   type OS_OSH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSH as an array
            Arr : OS_OSH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OS_OSH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   ------------
   -- OS.OSL --
   ------------

   --  OS_OSL array element
   subtype OS_OSL_Element is ATSAM3X8E.Bit;

   --  OS_OSL array
   type OS_OSL_Field_Array is array (0 .. 7) of OS_OSL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OS_OSL
   type OS_OSL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSL as an array
            Arr : OS_OSL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OS_OSL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Register
   type OS_Register is record
      --  Output Selection for PWMH output of the channel 0
      OSH            : OS_OSH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Output Selection for PWML output of the channel 0
      OSL            : OS_OSL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OS_Register use record
      OSH            at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSL            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- OSS_Register --
   ------------------

   --------------
   -- OSS.OSSH --
   --------------

   --  OSS_OSSH array element
   subtype OSS_OSSH_Element is ATSAM3X8E.Bit;

   --  OSS_OSSH array
   type OSS_OSSH_Field_Array is array (0 .. 7) of OSS_OSSH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSS_OSSH
   type OSS_OSSH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSH as an array
            Arr : OSS_OSSH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSS_OSSH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --------------
   -- OSS.OSSL --
   --------------

   --  OSS_OSSL array element
   subtype OSS_OSSL_Element is ATSAM3X8E.Bit;

   --  OSS_OSSL array
   type OSS_OSSL_Field_Array is array (0 .. 7) of OSS_OSSL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSS_OSSL
   type OSS_OSSL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSL as an array
            Arr : OSS_OSSL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSS_OSSL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Set Register
   type OSS_Register is record
      --  Write-only. Output Selection Set for PWMH output of the channel 0
      OSSH           : OSS_OSSH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Set for PWML output of the channel 0
      OSSL           : OSS_OSSL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OSS_Register use record
      OSSH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSSL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- OSC_Register --
   ------------------

   --------------
   -- OSC.OSCH --
   --------------

   --  OSC_OSCH array element
   subtype OSC_OSCH_Element is ATSAM3X8E.Bit;

   --  OSC_OSCH array
   type OSC_OSCH_Field_Array is array (0 .. 7) of OSC_OSCH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSC_OSCH
   type OSC_OSCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSCH as an array
            Arr : OSC_OSCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSC_OSCH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --------------
   -- OSC.OSCL --
   --------------

   --  OSC_OSCL array element
   subtype OSC_OSCL_Element is ATSAM3X8E.Bit;

   --  OSC_OSCL array
   type OSC_OSCL_Field_Array is array (0 .. 7) of OSC_OSCL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSC_OSCL
   type OSC_OSCL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSCL as an array
            Arr : OSC_OSCL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSC_OSCL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Clear Register
   type OSC_Register is record
      --  Write-only. Output Selection Clear for PWMH output of the channel 0
      OSCH           : OSC_OSCH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Clear for PWML output of the channel 0
      OSCL           : OSC_OSCL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OSC_Register use record
      OSCH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSCL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ---------------------
   -- OSSUPD_Register --
   ---------------------

   -------------------
   -- OSSUPD.OSSUPH --
   -------------------

   --  OSSUPD_OSSUPH array element
   subtype OSSUPD_OSSUPH_Element is ATSAM3X8E.Bit;

   --  OSSUPD_OSSUPH array
   type OSSUPD_OSSUPH_Field_Array is array (0 .. 7) of OSSUPD_OSSUPH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSSUPD_OSSUPH
   type OSSUPD_OSSUPH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSUPH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSUPH as an array
            Arr : OSSUPD_OSSUPH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSSUPD_OSSUPH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   -------------------
   -- OSSUPD.OSSUPL --
   -------------------

   --  OSSUPD_OSSUPL array element
   subtype OSSUPD_OSSUPL_Element is ATSAM3X8E.Bit;

   --  OSSUPD_OSSUPL array
   type OSSUPD_OSSUPL_Field_Array is array (0 .. 7) of OSSUPD_OSSUPL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSSUPD_OSSUPL
   type OSSUPD_OSSUPL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSSUPL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSSUPL as an array
            Arr : OSSUPD_OSSUPL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSSUPD_OSSUPL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Output Selection Set Update Register
   type OSSUPD_Register is record
      --  Write-only. Output Selection Set for PWMH output of the channel 0
      OSSUPH         : OSSUPD_OSSUPH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Set for PWML output of the channel 0
      OSSUPL         : OSSUPD_OSSUPL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OSSUPD_Register use record
      OSSUPH         at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSSUPL         at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ---------------------
   -- OSCUPD_Register --
   ---------------------

   -------------------
   -- OSCUPD.OSCUPH --
   -------------------

   --  OSCUPD_OSCUPH array element
   subtype OSCUPD_OSCUPH_Element is ATSAM3X8E.Bit;

   --  OSCUPD_OSCUPH array
   type OSCUPD_OSCUPH_Field_Array is array (0 .. 7) of OSCUPD_OSCUPH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for OSCUPD_OSCUPH
   type OSCUPD_OSCUPH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCUPH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  OSCUPH as an array
            Arr : OSCUPD_OSCUPH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for OSCUPD_OSCUPH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   -------------------
   -- OSCUPD.OSCUPL --
   -------------------

   --  OSCUPD_OSCUPL array element
   subtype OSCUPD_OSCUPL_Element is ATSAM3X8E.Bit;

   --  OSCUPD_OSCUPL array
   type OSCUPD_OSCUPL_Field_Array is array (0 .. 5) of OSCUPD_OSCUPL_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for OSCUPD_OSCUPL
   type OSCUPD_OSCUPL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSCUPL as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  OSCUPL as an array
            Arr : OSCUPD_OSCUPL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for OSCUPD_OSCUPL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype OSCUPD_OSCUPDL6_Field is ATSAM3X8E.Bit;
   subtype OSCUPD_OSCUPL7_Field is ATSAM3X8E.Bit;

   --  PWM Output Selection Clear Update Register
   type OSCUPD_Register is record
      --  Write-only. Output Selection Clear for PWMH output of the channel 0
      OSCUPH         : OSCUPD_OSCUPH_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Output Selection Clear for PWML output of the channel 0
      OSCUPL         : OSCUPD_OSCUPL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Write-only.
      OSCUPDL6       : OSCUPD_OSCUPDL6_Field := 16#0#;
      --  Write-only. Output Selection Clear for PWML output of the channel 7
      OSCUPL7        : OSCUPD_OSCUPL7_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for OSCUPD_Register use record
      OSCUPH         at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OSCUPL         at 0 range 16 .. 21;
      OSCUPDL6       at 0 range 22 .. 22;
      OSCUPL7        at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- FMR_Register --
   ------------------

   subtype FMR_FPOL_Field is ATSAM3X8E.Byte;
   subtype FMR_FMOD_Field is ATSAM3X8E.Byte;
   subtype FMR_FFIL_Field is ATSAM3X8E.Byte;

   --  PWM Fault Mode Register
   type FMR_Register is record
      --  Fault Polarity (fault input bit varies from 0 to 5)
      FPOL           : FMR_FPOL_Field := 16#0#;
      --  Fault Activation Mode (fault input bit varies from 0 to 5)
      FMOD           : FMR_FMOD_Field := 16#0#;
      --  Fault Filtering (fault input bit varies from 0 to 5)
      FFIL           : FMR_FFIL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FMR_Register use record
      FPOL           at 0 range 0 .. 7;
      FMOD           at 0 range 8 .. 15;
      FFIL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- FSR_Register --
   ------------------

   subtype FSR_FIV_Field is ATSAM3X8E.Byte;
   subtype FSR_FS_Field is ATSAM3X8E.Byte;

   --  PWM Fault Status Register
   type FSR_Register is record
      --  Read-only. Fault Input Value (fault input bit varies from 0 to 5)
      FIV            : FSR_FIV_Field := 16#0#;
      --  Read-only. Fault Status (fault input bit varies from 0 to 5)
      FS             : FSR_FS_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FSR_Register use record
      FIV            at 0 range 0 .. 7;
      FS             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- FCR_Register --
   ------------------

   subtype FCR_FCLR_Field is ATSAM3X8E.Byte;

   --  PWM Fault Clear Register
   type FCR_Register is record
      --  Write-only. Fault Clear (fault input bit varies from 0 to 5)
      FCLR          : FCR_FCLR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FCR_Register use record
      FCLR          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- FPV_Register --
   ------------------

   --------------
   -- FPV.FPVH --
   --------------

   --  FPV_FPVH array element
   subtype FPV_FPVH_Element is ATSAM3X8E.Bit;

   --  FPV_FPVH array
   type FPV_FPVH_Field_Array is array (0 .. 7) of FPV_FPVH_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for FPV_FPVH
   type FPV_FPVH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPVH as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FPVH as an array
            Arr : FPV_FPVH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for FPV_FPVH_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --------------
   -- FPV.FPVL --
   --------------

   --  FPV_FPVL array element
   subtype FPV_FPVL_Element is ATSAM3X8E.Bit;

   --  FPV_FPVL array
   type FPV_FPVL_Field_Array is array (0 .. 7) of FPV_FPVL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for FPV_FPVL
   type FPV_FPVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPVL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  FPVL as an array
            Arr : FPV_FPVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for FPV_FPVL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Fault Protection Value Register
   type FPV_Register is record
      --  Fault Protection Value for PWMH output on channel 0
      FPVH           : FPV_FPVH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Fault Protection Value for PWML output on channel 0
      FPVL           : FPV_FPVL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FPV_Register use record
      FPVH           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      FPVL           at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- FPE_Register --
   ------------------

   --  FPE1_FPE array element
   subtype FPE1_FPE_Element is ATSAM3X8E.Byte;

   --  FPE1_FPE array
   type FPE1_FPE_Field_Array is array (0 .. 3) of FPE1_FPE_Element
     with Component_Size => 8, Size => 32;

   --  PWM Fault Protection Enable Register 1
   type FPE_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FPE as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  FPE as an array
            Arr : FPE1_FPE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for FPE_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- ELMR_Register --
   -------------------

   ---------------
   -- ELMR.CSEL --
   ---------------

   --  ELMR_CSEL array element
   subtype ELMR_CSEL_Element is ATSAM3X8E.Bit;

   --  ELMR_CSEL array
   type ELMR_CSEL_Field_Array is array (0 .. 7) of ELMR_CSEL_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ELMR_CSEL
   type ELMR_CSEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CSEL as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  CSEL as an array
            Arr : ELMR_CSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ELMR_CSEL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  PWM Event Line 0 Mode Register
   type ELMR_Register is record
      --  Comparison 0 Selection
      CSEL          : ELMR_CSEL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ELMR_Register use record
      CSEL          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  PWM Event Line 0 Mode Register
   type ELMR_Registers is array (0 .. 1) of ELMR_Register;

   -------------------
   -- SMMR_Register --
   -------------------

   ---------------
   -- SMMR.GCEN --
   ---------------

   --  SMMR_GCEN array element
   subtype SMMR_GCEN_Element is ATSAM3X8E.Bit;

   --  SMMR_GCEN array
   type SMMR_GCEN_Field_Array is array (0 .. 3) of SMMR_GCEN_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for SMMR_GCEN
   type SMMR_GCEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GCEN as a value
            Val : ATSAM3X8E.UInt4;
         when True =>
            --  GCEN as an array
            Arr : SMMR_GCEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for SMMR_GCEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   ---------------
   -- SMMR.DOWN --
   ---------------

   --  SMMR_DOWN array element
   subtype SMMR_DOWN_Element is ATSAM3X8E.Bit;

   --  SMMR_DOWN array
   type SMMR_DOWN_Field_Array is array (0 .. 3) of SMMR_DOWN_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for SMMR_DOWN
   type SMMR_DOWN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DOWN as a value
            Val : ATSAM3X8E.UInt4;
         when True =>
            --  DOWN as an array
            Arr : SMMR_DOWN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for SMMR_DOWN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  PWM Stepper Motor Mode Register
   type SMMR_Register is record
      --  Gray Count ENable
      GCEN           : SMMR_GCEN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_15  : ATSAM3X8E.UInt12 := 16#0#;
      --  DOWN Count
      DOWN           : SMMR_DOWN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SMMR_Register use record
      GCEN           at 0 range 0 .. 3;
      Reserved_4_15  at 0 range 4 .. 15;
      DOWN           at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -------------------
   -- WPCR_Register --
   -------------------

   subtype WPCR_WPCMD_Field is ATSAM3X8E.UInt2;

   ---------------
   -- WPCR.WPRG --
   ---------------

   --  WPCR_WPRG array element
   subtype WPCR_WPRG_Element is ATSAM3X8E.Bit;

   --  WPCR_WPRG array
   type WPCR_WPRG_Field_Array is array (0 .. 5) of WPCR_WPRG_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for WPCR_WPRG
   type WPCR_WPRG_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WPRG as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  WPRG as an array
            Arr : WPCR_WPRG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for WPCR_WPRG_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype WPCR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  PWM Write Protect Control Register
   type WPCR_Register is record
      --  Write-only. Write Protect Command
      WPCMD : WPCR_WPCMD_Field := 16#0#;
      --  Write-only. Write Protect Register Group 0
      WPRG  : WPCR_WPRG_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Write Protect Key
      WPKEY : WPCR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPCR_Register use record
      WPCMD at 0 range 0 .. 1;
      WPRG  at 0 range 2 .. 7;
      WPKEY at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPSR_Register --
   -------------------

   ----------------
   -- WPSR.WPSWS --
   ----------------

   --  WPSR_WPSWS array element
   subtype WPSR_WPSWS_Element is ATSAM3X8E.Bit;

   --  WPSR_WPSWS array
   type WPSR_WPSWS_Field_Array is array (0 .. 5) of WPSR_WPSWS_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for WPSR_WPSWS
   type WPSR_WPSWS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WPSWS as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  WPSWS as an array
            Arr : WPSR_WPSWS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for WPSR_WPSWS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype WPSR_WPVS_Field is ATSAM3X8E.Bit;

   ----------------
   -- WPSR.WPHWS --
   ----------------

   --  WPSR_WPHWS array element
   subtype WPSR_WPHWS_Element is ATSAM3X8E.Bit;

   --  WPSR_WPHWS array
   type WPSR_WPHWS_Field_Array is array (0 .. 5) of WPSR_WPHWS_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for WPSR_WPHWS
   type WPSR_WPHWS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WPHWS as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  WPHWS as an array
            Arr : WPSR_WPHWS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for WPSR_WPHWS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype WPSR_WPVSRC_Field is ATSAM3X8E.Short;

   --  PWM Write Protect Status Register
   type WPSR_Register is record
      --  Read-only. Write Protect SW Status
      WPSWS          : WPSR_WPSWS_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit;
      --  Read-only. Write Protect Violation Status
      WPVS           : WPSR_WPVS_Field := 16#0#;
      --  Read-only. Write Protect HW Status
      WPHWS          : WPSR_WPHWS_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : WPSR_WPVSRC_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WPSWS          at 0 range 0 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      WPVS           at 0 range 7 .. 7;
      WPHWS          at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      WPVSRC         at 0 range 16 .. 31;
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

   -------------------
   -- CMPV_Register --
   -------------------

   subtype CMPV0_CV_Field is ATSAM3X8E.UInt24;
   subtype CMPV0_CVM_Field is ATSAM3X8E.Bit;

   --  PWM Comparison 0 Value Register
   type CMPV_Register is record
      --  Comparison x Value
      CV             : CMPV0_CV_Field := 16#0#;
      --  Comparison x Value Mode
      CVM            : CMPV0_CVM_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMPV_Register use record
      CV             at 0 range 0 .. 23;
      CVM            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ----------------------
   -- CMPVUPD_Register --
   ----------------------

   subtype CMPVUPD0_CVUPD_Field is ATSAM3X8E.UInt24;
   subtype CMPVUPD0_CVMUPD_Field is ATSAM3X8E.Bit;

   --  PWM Comparison 0 Value Update Register
   type CMPVUPD_Register is record
      --  Write-only. Comparison x Value Update
      CVUPD          : CMPVUPD0_CVUPD_Field := 16#0#;
      --  Write-only. Comparison x Value Mode Update
      CVMUPD         : CMPVUPD0_CVMUPD_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMPVUPD_Register use record
      CVUPD          at 0 range 0 .. 23;
      CVMUPD         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -------------------
   -- CMPM_Register --
   -------------------

   subtype CMPM0_CEN_Field is ATSAM3X8E.Bit;
   subtype CMPM0_CTR_Field is ATSAM3X8E.UInt4;
   subtype CMPM0_CPR_Field is ATSAM3X8E.UInt4;
   subtype CMPM0_CPRCNT_Field is ATSAM3X8E.UInt4;
   subtype CMPM0_CUPR_Field is ATSAM3X8E.UInt4;
   subtype CMPM0_CUPRCNT_Field is ATSAM3X8E.UInt4;

   --  PWM Comparison 0 Mode Register
   type CMPM_Register is record
      --  Comparison x Enable
      CEN            : CMPM0_CEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  Comparison x Trigger
      CTR            : CMPM0_CTR_Field := 16#0#;
      --  Comparison x Period
      CPR            : CMPM0_CPR_Field := 16#0#;
      --  Comparison x Period Counter
      CPRCNT         : CMPM0_CPRCNT_Field := 16#0#;
      --  Comparison x Update Period
      CUPR           : CMPM0_CUPR_Field := 16#0#;
      --  Comparison x Update Period Counter
      CUPRCNT        : CMPM0_CUPRCNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   ----------------------
   -- CMPMUPD_Register --
   ----------------------

   subtype CMPMUPD0_CENUPD_Field is ATSAM3X8E.Bit;
   subtype CMPMUPD0_CTRUPD_Field is ATSAM3X8E.UInt4;
   subtype CMPMUPD0_CPRUPD_Field is ATSAM3X8E.UInt4;
   subtype CMPMUPD0_CUPRUPD_Field is ATSAM3X8E.UInt4;

   --  PWM Comparison 0 Mode Update Register
   type CMPMUPD_Register is record
      --  Write-only. Comparison x Enable Update
      CENUPD         : CMPMUPD0_CENUPD_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Comparison x Trigger Update
      CTRUPD         : CMPMUPD0_CTRUPD_Field := 16#0#;
      --  Write-only. Comparison x Period Update
      CPRUPD         : CMPMUPD0_CPRUPD_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Comparison x Update Period Update
      CUPRUPD        : CMPMUPD0_CUPRUPD_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMPMUPD_Register use record
      CENUPD         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CTRUPD         at 0 range 4 .. 7;
      CPRUPD         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CUPRUPD        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   ------------------
   -- CMR_Register --
   ------------------

   --  Channel Pre-scaler
   type CPRE_Field is
     (
      --  Master clock
      Mck,
      --  Master clock/2
      Mck_Div_2,
      --  Master clock/4
      Mck_Div_4,
      --  Master clock/8
      Mck_Div_8,
      --  Master clock/16
      Mck_Div_16,
      --  Master clock/32
      Mck_Div_32,
      --  Master clock/64
      Mck_Div_64,
      --  Master clock/128
      Mck_Div_128,
      --  Master clock/256
      Mck_Div_256,
      --  Master clock/512
      Mck_Div_512,
      --  Master clock/1024
      Mck_Div_1024,
      --  Clock A
      Clka,
      --  Clock B
      Clkb)
     with Size => 4;
   for CPRE_Field use
     (Mck => 0,
      Mck_Div_2 => 1,
      Mck_Div_4 => 2,
      Mck_Div_8 => 3,
      Mck_Div_16 => 4,
      Mck_Div_32 => 5,
      Mck_Div_64 => 6,
      Mck_Div_128 => 7,
      Mck_Div_256 => 8,
      Mck_Div_512 => 9,
      Mck_Div_1024 => 10,
      Clka => 11,
      Clkb => 12);

   subtype CMR0_CALG_Field is ATSAM3X8E.Bit;
   subtype CMR0_CPOL_Field is ATSAM3X8E.Bit;
   subtype CMR0_CES_Field is ATSAM3X8E.Bit;
   subtype CMR0_DTE_Field is ATSAM3X8E.Bit;
   subtype CMR0_DTHI_Field is ATSAM3X8E.Bit;
   subtype CMR0_DTLI_Field is ATSAM3X8E.Bit;

   --  PWM Channel Mode Register (ch_num = 0)
   type CMR_Register is record
      --  Channel Pre-scaler
      CPRE           : CPRE_Field := Mck;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Channel Alignment
      CALG           : CMR0_CALG_Field := 16#0#;
      --  Channel Polarity
      CPOL           : CMR0_CPOL_Field := 16#0#;
      --  Counter Event Selection
      CES            : CMR0_CES_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5 := 16#0#;
      --  Dead-Time Generator Enable
      DTE            : CMR0_DTE_Field := 16#0#;
      --  Dead-Time PWMHx Output Inverted
      DTHI           : CMR0_DTHI_Field := 16#0#;
      --  Dead-Time PWMLx Output Inverted
      DTLI           : CMR0_DTLI_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   -------------------
   -- CDTY_Register --
   -------------------

   subtype CDTY0_CDTY_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Duty Cycle Register (ch_num = 0)
   type CDTY_Register is record
      --  Channel Duty-Cycle
      CDTY           : CDTY0_CDTY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CDTY_Register use record
      CDTY           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------
   -- CDTYUPD_Register --
   ----------------------

   subtype CDTYUPD0_CDTYUPD_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Duty Cycle Update Register (ch_num = 0)
   type CDTYUPD_Register is record
      --  Write-only. Channel Duty-Cycle Update
      CDTYUPD        : CDTYUPD0_CDTYUPD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CDTYUPD_Register use record
      CDTYUPD        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- CPRD_Register --
   -------------------

   subtype CPRD0_CPRD_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Period Register (ch_num = 0)
   type CPRD_Register is record
      --  Channel Period
      CPRD           : CPRD0_CPRD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CPRD_Register use record
      CPRD           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------
   -- CPRDUPD_Register --
   ----------------------

   subtype CPRDUPD0_CPRDUPD_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Period Update Register (ch_num = 0)
   type CPRDUPD_Register is record
      --  Write-only. Channel Period Update
      CPRDUPD        : CPRDUPD0_CPRDUPD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CPRDUPD_Register use record
      CPRDUPD        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- CCNT_Register --
   -------------------

   subtype CCNT0_CNT_Field is ATSAM3X8E.UInt24;

   --  PWM Channel Counter Register (ch_num = 0)
   type CCNT_Register is record
      --  Read-only. Channel Counter Register
      CNT            : CCNT0_CNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CCNT_Register use record
      CNT            at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- DT_Register --
   -----------------

   subtype DT0_DTH_Field is ATSAM3X8E.Short;
   subtype DT0_DTL_Field is ATSAM3X8E.Short;

   --  PWM Channel Dead Time Register (ch_num = 0)
   type DT_Register is record
      --  Dead-Time Value for PWMHx Output
      DTH : DT0_DTH_Field := 16#0#;
      --  Dead-Time Value for PWMLx Output
      DTL : DT0_DTL_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DT_Register use record
      DTH at 0 range 0 .. 15;
      DTL at 0 range 16 .. 31;
   end record;

   --------------------
   -- DTUPD_Register --
   --------------------

   subtype DTUPD0_DTHUPD_Field is ATSAM3X8E.Short;
   subtype DTUPD0_DTLUPD_Field is ATSAM3X8E.Short;

   --  PWM Channel Dead Time Update Register (ch_num = 0)
   type DTUPD_Register is record
      --  Write-only. Dead-Time Value Update for PWMHx Output
      DTHUPD : DTUPD0_DTHUPD_Field := 16#0#;
      --  Write-only. Dead-Time Value Update for PWMLx Output
      DTLUPD : DTUPD0_DTLUPD_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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
      CLK      : CLK_Register;
      --  PWM Enable Register
      ENA      : ENA_Register;
      --  PWM Disable Register
      DIS      : DIS_Register;
      --  PWM Status Register
      SR       : SR_Register;
      --  PWM Interrupt Enable Register 1
      IER1     : IER1_Register;
      --  PWM Interrupt Disable Register 1
      IDR1     : IDR1_Register;
      --  PWM Interrupt Mask Register 1
      IMR1     : IMR1_Register;
      --  PWM Interrupt Status Register 1
      ISR1     : ISR1_Register;
      --  PWM Sync Channels Mode Register
      SCM      : SCM_Register;
      --  PWM Sync Channels Update Control Register
      SCUC     : SCUC_Register;
      --  PWM Sync Channels Update Period Register
      SCUP     : SCUP_Register;
      --  PWM Sync Channels Update Period Update Register
      SCUPUPD  : SCUPUPD_Register;
      --  PWM Interrupt Enable Register 2
      IER2     : IER2_Register;
      --  PWM Interrupt Disable Register 2
      IDR2     : IDR2_Register;
      --  PWM Interrupt Mask Register 2
      IMR2     : IMR2_Register;
      --  PWM Interrupt Status Register 2
      ISR2     : ISR2_Register;
      --  PWM Output Override Value Register
      OOV      : OOV_Register;
      --  PWM Output Selection Register
      OS       : OS_Register;
      --  PWM Output Selection Set Register
      OSS      : OSS_Register;
      --  PWM Output Selection Clear Register
      OSC      : OSC_Register;
      --  PWM Output Selection Set Update Register
      OSSUPD   : OSSUPD_Register;
      --  PWM Output Selection Clear Update Register
      OSCUPD   : OSCUPD_Register;
      --  PWM Fault Mode Register
      FMR      : FMR_Register;
      --  PWM Fault Status Register
      FSR      : FSR_Register;
      --  PWM Fault Clear Register
      FCR      : FCR_Register;
      --  PWM Fault Protection Value Register
      FPV      : FPV_Register;
      --  PWM Fault Protection Enable Register 1
      FPE1     : FPE_Register;
      --  PWM Fault Protection Enable Register 2
      FPE2     : FPE_Register;
      --  PWM Event Line 0 Mode Register
      ELMR     : ELMR_Registers;
      --  PWM Stepper Motor Mode Register
      SMMR     : SMMR_Register;
      --  PWM Write Protect Control Register
      WPCR     : WPCR_Register;
      --  PWM Write Protect Status Register
      WPSR     : WPSR_Register;
      --  Transmit Pointer Register
      TPR      : ATSAM3X8E.Word;
      --  Transmit Counter Register
      TCR      : TCR_Register;
      --  Transmit Next Pointer Register
      TNPR     : ATSAM3X8E.Word;
      --  Transmit Next Counter Register
      TNCR     : TNCR_Register;
      --  Transfer Control Register
      PTCR     : PTCR_Register;
      --  Transfer Status Register
      PTSR     : PTSR_Register;
      --  PWM Comparison 0 Value Register
      CMPV0    : CMPV_Register;
      --  PWM Comparison 0 Value Update Register
      CMPVUPD0 : CMPVUPD_Register;
      --  PWM Comparison 0 Mode Register
      CMPM0    : CMPM_Register;
      --  PWM Comparison 0 Mode Update Register
      CMPMUPD0 : CMPMUPD_Register;
      --  PWM Comparison 1 Value Register
      CMPV1    : CMPV_Register;
      --  PWM Comparison 1 Value Update Register
      CMPVUPD1 : CMPVUPD_Register;
      --  PWM Comparison 1 Mode Register
      CMPM1    : CMPM_Register;
      --  PWM Comparison 1 Mode Update Register
      CMPMUPD1 : CMPMUPD_Register;
      --  PWM Comparison 2 Value Register
      CMPV2    : CMPV_Register;
      --  PWM Comparison 2 Value Update Register
      CMPVUPD2 : CMPVUPD_Register;
      --  PWM Comparison 2 Mode Register
      CMPM2    : CMPM_Register;
      --  PWM Comparison 2 Mode Update Register
      CMPMUPD2 : CMPMUPD_Register;
      --  PWM Comparison 3 Value Register
      CMPV3    : CMPV_Register;
      --  PWM Comparison 3 Value Update Register
      CMPVUPD3 : CMPVUPD_Register;
      --  PWM Comparison 3 Mode Register
      CMPM3    : CMPM_Register;
      --  PWM Comparison 3 Mode Update Register
      CMPMUPD3 : CMPMUPD_Register;
      --  PWM Comparison 4 Value Register
      CMPV4    : CMPV_Register;
      --  PWM Comparison 4 Value Update Register
      CMPVUPD4 : CMPVUPD_Register;
      --  PWM Comparison 4 Mode Register
      CMPM4    : CMPM_Register;
      --  PWM Comparison 4 Mode Update Register
      CMPMUPD4 : CMPMUPD_Register;
      --  PWM Comparison 5 Value Register
      CMPV5    : CMPV_Register;
      --  PWM Comparison 5 Value Update Register
      CMPVUPD5 : CMPVUPD_Register;
      --  PWM Comparison 5 Mode Register
      CMPM5    : CMPM_Register;
      --  PWM Comparison 5 Mode Update Register
      CMPMUPD5 : CMPMUPD_Register;
      --  PWM Comparison 6 Value Register
      CMPV6    : CMPV_Register;
      --  PWM Comparison 6 Value Update Register
      CMPVUPD6 : CMPVUPD_Register;
      --  PWM Comparison 6 Mode Register
      CMPM6    : CMPM_Register;
      --  PWM Comparison 6 Mode Update Register
      CMPMUPD6 : CMPMUPD_Register;
      --  PWM Comparison 7 Value Register
      CMPV7    : CMPV_Register;
      --  PWM Comparison 7 Value Update Register
      CMPVUPD7 : CMPVUPD_Register;
      --  PWM Comparison 7 Mode Register
      CMPM7    : CMPM_Register;
      --  PWM Comparison 7 Mode Update Register
      CMPMUPD7 : CMPMUPD_Register;
      --  PWM Channel Mode Register (ch_num = 0)
      CMR0     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 0)
      CDTY0    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 0)
      CDTYUPD0 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 0)
      CPRD0    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 0)
      CPRDUPD0 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 0)
      CCNT0    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 0)
      DT0      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 0)
      DTUPD0   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 1)
      CMR1     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 1)
      CDTY1    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 1)
      CDTYUPD1 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 1)
      CPRD1    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 1)
      CPRDUPD1 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 1)
      CCNT1    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 1)
      DT1      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 1)
      DTUPD1   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 2)
      CMR2     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 2)
      CDTY2    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 2)
      CDTYUPD2 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 2)
      CPRD2    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 2)
      CPRDUPD2 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 2)
      CCNT2    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 2)
      DT2      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 2)
      DTUPD2   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 3)
      CMR3     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 3)
      CDTY3    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 3)
      CDTYUPD3 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 3)
      CPRD3    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 3)
      CPRDUPD3 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 3)
      CCNT3    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 3)
      DT3      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 3)
      DTUPD3   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 4)
      CMR4     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 4)
      CDTY4    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 4)
      CDTYUPD4 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 4)
      CPRD4    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 4)
      CPRDUPD4 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 4)
      CCNT4    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 4)
      DT4      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 4)
      DTUPD4   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 5)
      CMR5     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 5)
      CDTY5    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 5)
      CDTYUPD5 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 5)
      CPRD5    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 5)
      CPRDUPD5 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 5)
      CCNT5    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 5)
      DT5      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 5)
      DTUPD5   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 6)
      CMR6     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 6)
      CDTY6    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 6)
      CDTYUPD6 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 6)
      CPRD6    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 6)
      CPRDUPD6 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 6)
      CCNT6    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 6)
      DT6      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 6)
      DTUPD6   : DTUPD_Register;
      --  PWM Channel Mode Register (ch_num = 7)
      CMR7     : CMR_Register;
      --  PWM Channel Duty Cycle Register (ch_num = 7)
      CDTY7    : CDTY_Register;
      --  PWM Channel Duty Cycle Update Register (ch_num = 7)
      CDTYUPD7 : CDTYUPD_Register;
      --  PWM Channel Period Register (ch_num = 7)
      CPRD7    : CPRD_Register;
      --  PWM Channel Period Update Register (ch_num = 7)
      CPRDUPD7 : CPRDUPD_Register;
      --  PWM Channel Counter Register (ch_num = 7)
      CCNT7    : CCNT_Register;
      --  PWM Channel Dead Time Register (ch_num = 7)
      DT7      : DT_Register;
      --  PWM Channel Dead Time Update Register (ch_num = 7)
      DTUPD7   : DTUPD_Register;
   end record
     with Volatile;

   for PWM_Peripheral use record
      CLK      at 0 range 0 .. 31;
      ENA      at 4 range 0 .. 31;
      DIS      at 8 range 0 .. 31;
      SR       at 12 range 0 .. 31;
      IER1     at 16 range 0 .. 31;
      IDR1     at 20 range 0 .. 31;
      IMR1     at 24 range 0 .. 31;
      ISR1     at 28 range 0 .. 31;
      SCM      at 32 range 0 .. 31;
      SCUC     at 40 range 0 .. 31;
      SCUP     at 44 range 0 .. 31;
      SCUPUPD  at 48 range 0 .. 31;
      IER2     at 52 range 0 .. 31;
      IDR2     at 56 range 0 .. 31;
      IMR2     at 60 range 0 .. 31;
      ISR2     at 64 range 0 .. 31;
      OOV      at 68 range 0 .. 31;
      OS       at 72 range 0 .. 31;
      OSS      at 76 range 0 .. 31;
      OSC      at 80 range 0 .. 31;
      OSSUPD   at 84 range 0 .. 31;
      OSCUPD   at 88 range 0 .. 31;
      FMR      at 92 range 0 .. 31;
      FSR      at 96 range 0 .. 31;
      FCR      at 100 range 0 .. 31;
      FPV      at 104 range 0 .. 31;
      FPE1     at 108 range 0 .. 31;
      FPE2     at 112 range 0 .. 31;
      ELMR     at 124 range 0 .. 63;
      SMMR     at 176 range 0 .. 31;
      WPCR     at 228 range 0 .. 31;
      WPSR     at 232 range 0 .. 31;
      TPR      at 264 range 0 .. 31;
      TCR      at 268 range 0 .. 31;
      TNPR     at 280 range 0 .. 31;
      TNCR     at 284 range 0 .. 31;
      PTCR     at 288 range 0 .. 31;
      PTSR     at 292 range 0 .. 31;
      CMPV0    at 304 range 0 .. 31;
      CMPVUPD0 at 308 range 0 .. 31;
      CMPM0    at 312 range 0 .. 31;
      CMPMUPD0 at 316 range 0 .. 31;
      CMPV1    at 320 range 0 .. 31;
      CMPVUPD1 at 324 range 0 .. 31;
      CMPM1    at 328 range 0 .. 31;
      CMPMUPD1 at 332 range 0 .. 31;
      CMPV2    at 336 range 0 .. 31;
      CMPVUPD2 at 340 range 0 .. 31;
      CMPM2    at 344 range 0 .. 31;
      CMPMUPD2 at 348 range 0 .. 31;
      CMPV3    at 352 range 0 .. 31;
      CMPVUPD3 at 356 range 0 .. 31;
      CMPM3    at 360 range 0 .. 31;
      CMPMUPD3 at 364 range 0 .. 31;
      CMPV4    at 368 range 0 .. 31;
      CMPVUPD4 at 372 range 0 .. 31;
      CMPM4    at 376 range 0 .. 31;
      CMPMUPD4 at 380 range 0 .. 31;
      CMPV5    at 384 range 0 .. 31;
      CMPVUPD5 at 388 range 0 .. 31;
      CMPM5    at 392 range 0 .. 31;
      CMPMUPD5 at 396 range 0 .. 31;
      CMPV6    at 400 range 0 .. 31;
      CMPVUPD6 at 404 range 0 .. 31;
      CMPM6    at 408 range 0 .. 31;
      CMPMUPD6 at 412 range 0 .. 31;
      CMPV7    at 416 range 0 .. 31;
      CMPVUPD7 at 420 range 0 .. 31;
      CMPM7    at 424 range 0 .. 31;
      CMPMUPD7 at 428 range 0 .. 31;
      CMR0     at 512 range 0 .. 31;
      CDTY0    at 516 range 0 .. 31;
      CDTYUPD0 at 520 range 0 .. 31;
      CPRD0    at 524 range 0 .. 31;
      CPRDUPD0 at 528 range 0 .. 31;
      CCNT0    at 532 range 0 .. 31;
      DT0      at 536 range 0 .. 31;
      DTUPD0   at 540 range 0 .. 31;
      CMR1     at 544 range 0 .. 31;
      CDTY1    at 548 range 0 .. 31;
      CDTYUPD1 at 552 range 0 .. 31;
      CPRD1    at 556 range 0 .. 31;
      CPRDUPD1 at 560 range 0 .. 31;
      CCNT1    at 564 range 0 .. 31;
      DT1      at 568 range 0 .. 31;
      DTUPD1   at 572 range 0 .. 31;
      CMR2     at 576 range 0 .. 31;
      CDTY2    at 580 range 0 .. 31;
      CDTYUPD2 at 584 range 0 .. 31;
      CPRD2    at 588 range 0 .. 31;
      CPRDUPD2 at 592 range 0 .. 31;
      CCNT2    at 596 range 0 .. 31;
      DT2      at 600 range 0 .. 31;
      DTUPD2   at 604 range 0 .. 31;
      CMR3     at 608 range 0 .. 31;
      CDTY3    at 612 range 0 .. 31;
      CDTYUPD3 at 616 range 0 .. 31;
      CPRD3    at 620 range 0 .. 31;
      CPRDUPD3 at 624 range 0 .. 31;
      CCNT3    at 628 range 0 .. 31;
      DT3      at 632 range 0 .. 31;
      DTUPD3   at 636 range 0 .. 31;
      CMR4     at 640 range 0 .. 31;
      CDTY4    at 644 range 0 .. 31;
      CDTYUPD4 at 648 range 0 .. 31;
      CPRD4    at 652 range 0 .. 31;
      CPRDUPD4 at 656 range 0 .. 31;
      CCNT4    at 660 range 0 .. 31;
      DT4      at 664 range 0 .. 31;
      DTUPD4   at 668 range 0 .. 31;
      CMR5     at 672 range 0 .. 31;
      CDTY5    at 676 range 0 .. 31;
      CDTYUPD5 at 680 range 0 .. 31;
      CPRD5    at 684 range 0 .. 31;
      CPRDUPD5 at 688 range 0 .. 31;
      CCNT5    at 692 range 0 .. 31;
      DT5      at 696 range 0 .. 31;
      DTUPD5   at 700 range 0 .. 31;
      CMR6     at 704 range 0 .. 31;
      CDTY6    at 708 range 0 .. 31;
      CDTYUPD6 at 712 range 0 .. 31;
      CPRD6    at 716 range 0 .. 31;
      CPRDUPD6 at 720 range 0 .. 31;
      CCNT6    at 724 range 0 .. 31;
      DT6      at 728 range 0 .. 31;
      DTUPD6   at 732 range 0 .. 31;
      CMR7     at 736 range 0 .. 31;
      CDTY7    at 740 range 0 .. 31;
      CDTYUPD7 at 744 range 0 .. 31;
      CPRD7    at 748 range 0 .. 31;
      CPRDUPD7 at 752 range 0 .. 31;
      CCNT7    at 756 range 0 .. 31;
      DT7      at 760 range 0 .. 31;
      DTUPD7   at 764 range 0 .. 31;
   end record;

   --  Pulse Width Modulation Controller
   PWM_Periph : aliased PWM_Peripheral
     with Import, Address => PWM_Base;

end ATSAM3X8E.PWM;
