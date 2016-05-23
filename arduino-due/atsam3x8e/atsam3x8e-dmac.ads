--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  DMA Controller
package ATSAM3X8E.DMAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -------------------
   -- GCFG_Register --
   -------------------

   --  Arbiter Configuration
   type ARB_CFG_Field is
     (
      --  Fixed priority arbiter.
      Fixed,
      --  Modified round robin arbiter.
      Round_Robin)
     with Size => 1;
   for ARB_CFG_Field use
     (Fixed => 0,
      Round_Robin => 1);

   --  DMAC Global Configuration Register
   type GCFG_Register is record
      --  unspecified
      Reserved_0_3  : ATSAM3X8E.UInt4 := 16#0#;
      --  Arbiter Configuration
      ARB_CFG       : ARB_CFG_Field := Round_Robin;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for GCFG_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      ARB_CFG       at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------
   -- EN_Register --
   -----------------

   subtype EN_ENABLE_Field is ATSAM3X8E.Bit;

   --  DMAC Enable Register
   type EN_Register is record
      ENABLE        : EN_ENABLE_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for EN_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -------------------
   -- SREQ_Register --
   -------------------

   subtype SREQ_SSREQ0_Field is ATSAM3X8E.Bit;
   subtype SREQ_DSREQ0_Field is ATSAM3X8E.Bit;
   subtype SREQ_SSREQ1_Field is ATSAM3X8E.Bit;
   subtype SREQ_DSREQ1_Field is ATSAM3X8E.Bit;
   subtype SREQ_SSREQ2_Field is ATSAM3X8E.Bit;
   subtype SREQ_DSREQ2_Field is ATSAM3X8E.Bit;
   subtype SREQ_SSREQ3_Field is ATSAM3X8E.Bit;
   subtype SREQ_DSREQ3_Field is ATSAM3X8E.Bit;
   subtype SREQ_SSREQ4_Field is ATSAM3X8E.Bit;
   subtype SREQ_DSREQ4_Field is ATSAM3X8E.Bit;
   subtype SREQ_SSREQ5_Field is ATSAM3X8E.Bit;
   subtype SREQ_DSREQ5_Field is ATSAM3X8E.Bit;

   --  DMAC Software Single Request Register
   type SREQ_Register is record
      --  Source Request
      SSREQ0         : SREQ_SSREQ0_Field := 16#0#;
      --  Destination Request
      DSREQ0         : SREQ_DSREQ0_Field := 16#0#;
      --  Source Request
      SSREQ1         : SREQ_SSREQ1_Field := 16#0#;
      --  Destination Request
      DSREQ1         : SREQ_DSREQ1_Field := 16#0#;
      --  Source Request
      SSREQ2         : SREQ_SSREQ2_Field := 16#0#;
      --  Destination Request
      DSREQ2         : SREQ_DSREQ2_Field := 16#0#;
      --  Source Request
      SSREQ3         : SREQ_SSREQ3_Field := 16#0#;
      --  Destination Request
      DSREQ3         : SREQ_DSREQ3_Field := 16#0#;
      --  Source Request
      SSREQ4         : SREQ_SSREQ4_Field := 16#0#;
      --  Destination Request
      DSREQ4         : SREQ_DSREQ4_Field := 16#0#;
      --  Source Request
      SSREQ5         : SREQ_SSREQ5_Field := 16#0#;
      --  Destination Request
      DSREQ5         : SREQ_DSREQ5_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SREQ_Register use record
      SSREQ0         at 0 range 0 .. 0;
      DSREQ0         at 0 range 1 .. 1;
      SSREQ1         at 0 range 2 .. 2;
      DSREQ1         at 0 range 3 .. 3;
      SSREQ2         at 0 range 4 .. 4;
      DSREQ2         at 0 range 5 .. 5;
      SSREQ3         at 0 range 6 .. 6;
      DSREQ3         at 0 range 7 .. 7;
      SSREQ4         at 0 range 8 .. 8;
      DSREQ4         at 0 range 9 .. 9;
      SSREQ5         at 0 range 10 .. 10;
      DSREQ5         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -------------------
   -- CREQ_Register --
   -------------------

   subtype CREQ_SCREQ0_Field is ATSAM3X8E.Bit;
   subtype CREQ_DCREQ0_Field is ATSAM3X8E.Bit;
   subtype CREQ_SCREQ1_Field is ATSAM3X8E.Bit;
   subtype CREQ_DCREQ1_Field is ATSAM3X8E.Bit;
   subtype CREQ_SCREQ2_Field is ATSAM3X8E.Bit;
   subtype CREQ_DCREQ2_Field is ATSAM3X8E.Bit;
   subtype CREQ_SCREQ3_Field is ATSAM3X8E.Bit;
   subtype CREQ_DCREQ3_Field is ATSAM3X8E.Bit;
   subtype CREQ_SCREQ4_Field is ATSAM3X8E.Bit;
   subtype CREQ_DCREQ4_Field is ATSAM3X8E.Bit;
   subtype CREQ_SCREQ5_Field is ATSAM3X8E.Bit;
   subtype CREQ_DCREQ5_Field is ATSAM3X8E.Bit;

   --  DMAC Software Chunk Transfer Request Register
   type CREQ_Register is record
      --  Source Chunk Request
      SCREQ0         : CREQ_SCREQ0_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ0         : CREQ_DCREQ0_Field := 16#0#;
      --  Source Chunk Request
      SCREQ1         : CREQ_SCREQ1_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ1         : CREQ_DCREQ1_Field := 16#0#;
      --  Source Chunk Request
      SCREQ2         : CREQ_SCREQ2_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ2         : CREQ_DCREQ2_Field := 16#0#;
      --  Source Chunk Request
      SCREQ3         : CREQ_SCREQ3_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ3         : CREQ_DCREQ3_Field := 16#0#;
      --  Source Chunk Request
      SCREQ4         : CREQ_SCREQ4_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ4         : CREQ_DCREQ4_Field := 16#0#;
      --  Source Chunk Request
      SCREQ5         : CREQ_SCREQ5_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ5         : CREQ_DCREQ5_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CREQ_Register use record
      SCREQ0         at 0 range 0 .. 0;
      DCREQ0         at 0 range 1 .. 1;
      SCREQ1         at 0 range 2 .. 2;
      DCREQ1         at 0 range 3 .. 3;
      SCREQ2         at 0 range 4 .. 4;
      DCREQ2         at 0 range 5 .. 5;
      SCREQ3         at 0 range 6 .. 6;
      DCREQ3         at 0 range 7 .. 7;
      SCREQ4         at 0 range 8 .. 8;
      DCREQ4         at 0 range 9 .. 9;
      SCREQ5         at 0 range 10 .. 10;
      DCREQ5         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -------------------
   -- LAST_Register --
   -------------------

   subtype LAST_SLAST0_Field is ATSAM3X8E.Bit;
   subtype LAST_DLAST0_Field is ATSAM3X8E.Bit;
   subtype LAST_SLAST1_Field is ATSAM3X8E.Bit;
   subtype LAST_DLAST1_Field is ATSAM3X8E.Bit;
   subtype LAST_SLAST2_Field is ATSAM3X8E.Bit;
   subtype LAST_DLAST2_Field is ATSAM3X8E.Bit;
   subtype LAST_SLAST3_Field is ATSAM3X8E.Bit;
   subtype LAST_DLAST3_Field is ATSAM3X8E.Bit;
   subtype LAST_SLAST4_Field is ATSAM3X8E.Bit;
   subtype LAST_DLAST4_Field is ATSAM3X8E.Bit;
   subtype LAST_SLAST5_Field is ATSAM3X8E.Bit;
   subtype LAST_DLAST5_Field is ATSAM3X8E.Bit;

   --  DMAC Software Last Transfer Flag Register
   type LAST_Register is record
      --  Source Last
      SLAST0         : LAST_SLAST0_Field := 16#0#;
      --  Destination Last
      DLAST0         : LAST_DLAST0_Field := 16#0#;
      --  Source Last
      SLAST1         : LAST_SLAST1_Field := 16#0#;
      --  Destination Last
      DLAST1         : LAST_DLAST1_Field := 16#0#;
      --  Source Last
      SLAST2         : LAST_SLAST2_Field := 16#0#;
      --  Destination Last
      DLAST2         : LAST_DLAST2_Field := 16#0#;
      --  Source Last
      SLAST3         : LAST_SLAST3_Field := 16#0#;
      --  Destination Last
      DLAST3         : LAST_DLAST3_Field := 16#0#;
      --  Source Last
      SLAST4         : LAST_SLAST4_Field := 16#0#;
      --  Destination Last
      DLAST4         : LAST_DLAST4_Field := 16#0#;
      --  Source Last
      SLAST5         : LAST_SLAST5_Field := 16#0#;
      --  Destination Last
      DLAST5         : LAST_DLAST5_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for LAST_Register use record
      SLAST0         at 0 range 0 .. 0;
      DLAST0         at 0 range 1 .. 1;
      SLAST1         at 0 range 2 .. 2;
      DLAST1         at 0 range 3 .. 3;
      SLAST2         at 0 range 4 .. 4;
      DLAST2         at 0 range 5 .. 5;
      SLAST3         at 0 range 6 .. 6;
      DLAST3         at 0 range 7 .. 7;
      SLAST4         at 0 range 8 .. 8;
      DLAST4         at 0 range 9 .. 9;
      SLAST5         at 0 range 10 .. 10;
      DLAST5         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   ---------------------
   -- EBCIER_Register --
   ---------------------

   ----------------
   -- EBCIER.BTC --
   ----------------

   --  EBCIER_BTC array element
   subtype EBCIER_BTC_Element is ATSAM3X8E.Bit;

   --  EBCIER_BTC array
   type EBCIER_BTC_Field_Array is array (0 .. 5) of EBCIER_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIER_BTC
   type EBCIER_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : EBCIER_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIER_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   -----------------
   -- EBCIER.CBTC --
   -----------------

   --  EBCIER_CBTC array element
   subtype EBCIER_CBTC_Element is ATSAM3X8E.Bit;

   --  EBCIER_CBTC array
   type EBCIER_CBTC_Field_Array is array (0 .. 5) of EBCIER_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIER_CBTC
   type EBCIER_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : EBCIER_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIER_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ----------------
   -- EBCIER.ERR --
   ----------------

   --  EBCIER_ERR array element
   subtype EBCIER_ERR_Element is ATSAM3X8E.Bit;

   --  EBCIER_ERR array
   type EBCIER_ERR_Field_Array is array (0 .. 5) of EBCIER_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIER_ERR
   type EBCIER_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : EBCIER_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIER_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  Transfer Completed Interrupt Enable register.
   type EBCIER_Register is record
      --  Write-only. Buffer Transfer Completed [5:0]
      BTC            : EBCIER_BTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : EBCIER_CBTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Access Error [5:0]
      ERR            : EBCIER_ERR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for EBCIER_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   ---------------------
   -- EBCIDR_Register --
   ---------------------

   ----------------
   -- EBCIDR.BTC --
   ----------------

   --  EBCIDR_BTC array element
   subtype EBCIDR_BTC_Element is ATSAM3X8E.Bit;

   --  EBCIDR_BTC array
   type EBCIDR_BTC_Field_Array is array (0 .. 5) of EBCIDR_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIDR_BTC
   type EBCIDR_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : EBCIDR_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIDR_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   -----------------
   -- EBCIDR.CBTC --
   -----------------

   --  EBCIDR_CBTC array element
   subtype EBCIDR_CBTC_Element is ATSAM3X8E.Bit;

   --  EBCIDR_CBTC array
   type EBCIDR_CBTC_Field_Array is array (0 .. 5) of EBCIDR_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIDR_CBTC
   type EBCIDR_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : EBCIDR_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIDR_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ----------------
   -- EBCIDR.ERR --
   ----------------

   --  EBCIDR_ERR array element
   subtype EBCIDR_ERR_Element is ATSAM3X8E.Bit;

   --  EBCIDR_ERR array
   type EBCIDR_ERR_Field_Array is array (0 .. 5) of EBCIDR_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIDR_ERR
   type EBCIDR_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : EBCIDR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIDR_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  Transfer Completed Interrupt Disable register.
   type EBCIDR_Register is record
      --  Write-only. Buffer Transfer Completed [5:0]
      BTC            : EBCIDR_BTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : EBCIDR_CBTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Access Error [5:0]
      ERR            : EBCIDR_ERR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for EBCIDR_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   ---------------------
   -- EBCIMR_Register --
   ---------------------

   ----------------
   -- EBCIMR.BTC --
   ----------------

   --  EBCIMR_BTC array element
   subtype EBCIMR_BTC_Element is ATSAM3X8E.Bit;

   --  EBCIMR_BTC array
   type EBCIMR_BTC_Field_Array is array (0 .. 5) of EBCIMR_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIMR_BTC
   type EBCIMR_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : EBCIMR_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIMR_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   -----------------
   -- EBCIMR.CBTC --
   -----------------

   --  EBCIMR_CBTC array element
   subtype EBCIMR_CBTC_Element is ATSAM3X8E.Bit;

   --  EBCIMR_CBTC array
   type EBCIMR_CBTC_Field_Array is array (0 .. 5) of EBCIMR_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIMR_CBTC
   type EBCIMR_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : EBCIMR_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIMR_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ----------------
   -- EBCIMR.ERR --
   ----------------

   --  EBCIMR_ERR array element
   subtype EBCIMR_ERR_Element is ATSAM3X8E.Bit;

   --  EBCIMR_ERR array
   type EBCIMR_ERR_Field_Array is array (0 .. 5) of EBCIMR_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCIMR_ERR
   type EBCIMR_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : EBCIMR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCIMR_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  transfer completed Mask Register.
   type EBCIMR_Register is record
      --  Read-only. Buffer Transfer Completed [5:0]
      BTC            : EBCIMR_BTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : EBCIMR_CBTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Access Error [5:0]
      ERR            : EBCIMR_ERR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for EBCIMR_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   ---------------------
   -- EBCISR_Register --
   ---------------------

   ----------------
   -- EBCISR.BTC --
   ----------------

   --  EBCISR_BTC array element
   subtype EBCISR_BTC_Element is ATSAM3X8E.Bit;

   --  EBCISR_BTC array
   type EBCISR_BTC_Field_Array is array (0 .. 5) of EBCISR_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCISR_BTC
   type EBCISR_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : EBCISR_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCISR_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   -----------------
   -- EBCISR.CBTC --
   -----------------

   --  EBCISR_CBTC array element
   subtype EBCISR_CBTC_Element is ATSAM3X8E.Bit;

   --  EBCISR_CBTC array
   type EBCISR_CBTC_Field_Array is array (0 .. 5) of EBCISR_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCISR_CBTC
   type EBCISR_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : EBCISR_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCISR_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ----------------
   -- EBCISR.ERR --
   ----------------

   --  EBCISR_ERR array element
   subtype EBCISR_ERR_Element is ATSAM3X8E.Bit;

   --  EBCISR_ERR array
   type EBCISR_ERR_Field_Array is array (0 .. 5) of EBCISR_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for EBCISR_ERR
   type EBCISR_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : EBCISR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for EBCISR_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  transfer completed Status Register.
   type EBCISR_Register is record
      --  Read-only. Buffer Transfer Completed [5:0]
      BTC            : EBCISR_BTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : EBCISR_CBTC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Access Error [5:0]
      ERR            : EBCISR_ERR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for EBCISR_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -------------------
   -- CHER_Register --
   -------------------

   --------------
   -- CHER.ENA --
   --------------

   --  CHER_ENA array element
   subtype CHER_ENA_Element is ATSAM3X8E.Bit;

   --  CHER_ENA array
   type CHER_ENA_Field_Array is array (0 .. 5) of CHER_ENA_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHER_ENA
   type CHER_ENA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENA as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ENA as an array
            Arr : CHER_ENA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHER_ENA_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ---------------
   -- CHER.SUSP --
   ---------------

   --  CHER_SUSP array element
   subtype CHER_SUSP_Element is ATSAM3X8E.Bit;

   --  CHER_SUSP array
   type CHER_SUSP_Field_Array is array (0 .. 5) of CHER_SUSP_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHER_SUSP
   type CHER_SUSP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SUSP as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  SUSP as an array
            Arr : CHER_SUSP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHER_SUSP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ---------------
   -- CHER.KEEP --
   ---------------

   --  CHER_KEEP array element
   subtype CHER_KEEP_Element is ATSAM3X8E.Bit;

   --  CHER_KEEP array
   type CHER_KEEP_Field_Array is array (0 .. 5) of CHER_KEEP_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHER_KEEP
   type CHER_KEEP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  KEEP as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  KEEP as an array
            Arr : CHER_KEEP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHER_KEEP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Channel Handler Enable Register
   type CHER_Register is record
      --  Write-only. Enable [5:0]
      ENA            : CHER_ENA_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Suspend [5:0]
      SUSP           : CHER_SUSP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_23 : ATSAM3X8E.UInt10 := 16#0#;
      --  Write-only. Keep on [5:0]
      KEEP           : CHER_KEEP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHER_Register use record
      ENA            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SUSP           at 0 range 8 .. 13;
      Reserved_14_23 at 0 range 14 .. 23;
      KEEP           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -------------------
   -- CHDR_Register --
   -------------------

   --------------
   -- CHDR.DIS --
   --------------

   --  CHDR_DIS array element
   subtype CHDR_DIS_Element is ATSAM3X8E.Bit;

   --  CHDR_DIS array
   type CHDR_DIS_Field_Array is array (0 .. 5) of CHDR_DIS_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHDR_DIS
   type CHDR_DIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DIS as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  DIS as an array
            Arr : CHDR_DIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHDR_DIS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --------------
   -- CHDR.RES --
   --------------

   --  CHDR_RES array element
   subtype CHDR_RES_Element is ATSAM3X8E.Bit;

   --  CHDR_RES array
   type CHDR_RES_Field_Array is array (0 .. 5) of CHDR_RES_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHDR_RES
   type CHDR_RES_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RES as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  RES as an array
            Arr : CHDR_RES_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHDR_RES_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Channel Handler Disable Register
   type CHDR_Register is record
      --  Write-only. Disable [5:0]
      DIS            : CHDR_DIS_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Resume [5:0]
      RES            : CHDR_RES_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHDR_Register use record
      DIS            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      RES            at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   -------------------
   -- CHSR_Register --
   -------------------

   --------------
   -- CHSR.ENA --
   --------------

   --  CHSR_ENA array element
   subtype CHSR_ENA_Element is ATSAM3X8E.Bit;

   --  CHSR_ENA array
   type CHSR_ENA_Field_Array is array (0 .. 5) of CHSR_ENA_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHSR_ENA
   type CHSR_ENA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENA as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ENA as an array
            Arr : CHSR_ENA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHSR_ENA_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ---------------
   -- CHSR.SUSP --
   ---------------

   --  CHSR_SUSP array element
   subtype CHSR_SUSP_Element is ATSAM3X8E.Bit;

   --  CHSR_SUSP array
   type CHSR_SUSP_Field_Array is array (0 .. 5) of CHSR_SUSP_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHSR_SUSP
   type CHSR_SUSP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SUSP as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  SUSP as an array
            Arr : CHSR_SUSP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHSR_SUSP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ---------------
   -- CHSR.EMPT --
   ---------------

   --  CHSR_EMPT array element
   subtype CHSR_EMPT_Element is ATSAM3X8E.Bit;

   --  CHSR_EMPT array
   type CHSR_EMPT_Field_Array is array (0 .. 5) of CHSR_EMPT_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHSR_EMPT
   type CHSR_EMPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EMPT as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  EMPT as an array
            Arr : CHSR_EMPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHSR_EMPT_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   ---------------
   -- CHSR.STAL --
   ---------------

   --  CHSR_STAL array element
   subtype CHSR_STAL_Element is ATSAM3X8E.Bit;

   --  CHSR_STAL array
   type CHSR_STAL_Field_Array is array (0 .. 5) of CHSR_STAL_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for CHSR_STAL
   type CHSR_STAL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STAL as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  STAL as an array
            Arr : CHSR_STAL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CHSR_STAL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Channel Handler Status Register
   type CHSR_Register is record
      --  Read-only. Enable [5:0]
      ENA            : CHSR_ENA_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Suspend [5:0]
      SUSP           : CHSR_SUSP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Empty [5:0]
      EMPT           : CHSR_EMPT_Field := (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2;
      --  Read-only. Stalled [5:0]
      STAL           : CHSR_STAL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CHSR_Register use record
      ENA            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SUSP           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      EMPT           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      STAL           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -------------------
   -- DSCR_Register --
   -------------------

   subtype DSCR0_DSCR_Field is ATSAM3X8E.UInt30;

   --  DMAC Channel Descriptor Address Register (ch_num = 0)
   type DSCR_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2 := 16#0#;
      --  Buffer Transfer Descriptor Address
      DSCR         : DSCR0_DSCR_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DSCR_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      DSCR         at 0 range 2 .. 31;
   end record;

   --------------------
   -- CTRLA_Register --
   --------------------

   subtype CTRLA0_BTSIZE_Field is ATSAM3X8E.Short;

   --  Source Chunk Transfer Size.
   type SCSIZE_Field is
     (
      --  1 data transferred
      Chk_1,
      --  4 data transferred
      Chk_4,
      --  8 data transferred
      Chk_8,
      --  16 data transferred
      Chk_16,
      --  32 data transferred
      Chk_32,
      --  64 data transferred
      Chk_64,
      --  128 data transferred
      Chk_128,
      --  256 data transferred
      Chk_256)
     with Size => 3;
   for SCSIZE_Field use
     (Chk_1 => 0,
      Chk_4 => 1,
      Chk_8 => 2,
      Chk_16 => 3,
      Chk_32 => 4,
      Chk_64 => 5,
      Chk_128 => 6,
      Chk_256 => 7);

   --  Destination Chunk Transfer Size
   type DCSIZE_Field is
     (
      --  1 data transferred
      Chk_1,
      --  4 data transferred
      Chk_4,
      --  8 data transferred
      Chk_8,
      --  16 data transferred
      Chk_16,
      --  32 data transferred
      Chk_32,
      --  64 data transferred
      Chk_64,
      --  128 data transferred
      Chk_128,
      --  256 data transferred
      Chk_256)
     with Size => 3;
   for DCSIZE_Field use
     (Chk_1 => 0,
      Chk_4 => 1,
      Chk_8 => 2,
      Chk_16 => 3,
      Chk_32 => 4,
      Chk_64 => 5,
      Chk_128 => 6,
      Chk_256 => 7);

   --  Transfer Width for the Source
   type SRC_WIDTH_Field is
     (
      --  the transfer size is set to 8-bit width
      Byte,
      --  the transfer size is set to 16-bit width
      Half_Word,
      --  the transfer size is set to 32-bit width
      Word)
     with Size => 2;
   for SRC_WIDTH_Field use
     (Byte => 0,
      Half_Word => 1,
      Word => 2);

   --  Transfer Width for the Destination
   type DST_WIDTH_Field is
     (
      --  the transfer size is set to 8-bit width
      Byte,
      --  the transfer size is set to 16-bit width
      Half_Word,
      --  the transfer size is set to 32-bit width
      Word)
     with Size => 2;
   for DST_WIDTH_Field use
     (Byte => 0,
      Half_Word => 1,
      Word => 2);

   subtype CTRLA0_DONE_Field is ATSAM3X8E.Bit;

   --  DMAC Channel Control A Register (ch_num = 0)
   type CTRLA_Register is record
      --  Buffer Transfer Size
      BTSIZE         : CTRLA0_BTSIZE_Field := 16#0#;
      --  Source Chunk Transfer Size.
      SCSIZE         : SCSIZE_Field := Chk_1;
      --  unspecified
      Reserved_19_19 : ATSAM3X8E.Bit := 16#0#;
      --  Destination Chunk Transfer Size
      DCSIZE         : DCSIZE_Field := Chk_1;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  Transfer Width for the Source
      SRC_WIDTH      : SRC_WIDTH_Field := Byte;
      --  unspecified
      Reserved_26_27 : ATSAM3X8E.UInt2 := 16#0#;
      --  Transfer Width for the Destination
      DST_WIDTH      : DST_WIDTH_Field := Byte;
      --  unspecified
      Reserved_30_30 : ATSAM3X8E.Bit := 16#0#;
      DONE           : CTRLA0_DONE_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CTRLA_Register use record
      BTSIZE         at 0 range 0 .. 15;
      SCSIZE         at 0 range 16 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      DCSIZE         at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      SRC_WIDTH      at 0 range 24 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      DST_WIDTH      at 0 range 28 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      DONE           at 0 range 31 .. 31;
   end record;

   --------------------
   -- CTRLB_Register --
   --------------------

   --  Source Address Descriptor
   type SRC_DSCR_Field is
     (
      --  Source address is updated when the descriptor is fetched from the
      --  memory.
      Fetch_From_Mem,
      --  Buffer Descriptor Fetch operation is disabled for the source.
      Fetch_Disable)
     with Size => 1;
   for SRC_DSCR_Field use
     (Fetch_From_Mem => 0,
      Fetch_Disable => 1);

   --  Destination Address Descriptor
   type DST_DSCR_Field is
     (
      --  Destination address is updated when the descriptor is fetched from
      --  the memory.
      Fetch_From_Mem,
      --  Buffer Descriptor Fetch operation is disabled for the destination.
      Fetch_Disable)
     with Size => 1;
   for DST_DSCR_Field use
     (Fetch_From_Mem => 0,
      Fetch_Disable => 1);

   --  Flow Control
   type FC_Field is
     (
      --  Memory-to-Memory Transfer DMAC is flow controller
      Mem2Mem_Dma_Fc,
      --  Memory-to-Peripheral Transfer DMAC is flow controller
      Mem2Per_Dma_Fc,
      --  Peripheral-to-Memory Transfer DMAC is flow controller
      Per2Mem_Dma_Fc,
      --  Peripheral-to-Peripheral Transfer DMAC is flow controller
      Per2Per_Dma_Fc)
     with Size => 3;
   for FC_Field use
     (Mem2Mem_Dma_Fc => 0,
      Mem2Per_Dma_Fc => 1,
      Per2Mem_Dma_Fc => 2,
      Per2Per_Dma_Fc => 3);

   --  Incrementing, Decrementing or Fixed Address for the Source
   type SRC_INCR_Field is
     (
      --  The source address is incremented
      Incrementing,
      --  The source address is decremented
      Decrementing,
      --  The source address remains unchanged
      Fixed)
     with Size => 2;
   for SRC_INCR_Field use
     (Incrementing => 0,
      Decrementing => 1,
      Fixed => 2);

   --  Incrementing, Decrementing or Fixed Address for the Destination
   type DST_INCR_Field is
     (
      --  The destination address is incremented
      Incrementing,
      --  The destination address is decremented
      Decrementing,
      --  The destination address remains unchanged
      Fixed)
     with Size => 2;
   for DST_INCR_Field use
     (Incrementing => 0,
      Decrementing => 1,
      Fixed => 2);

   subtype CTRLB0_IEN_Field is ATSAM3X8E.Bit;

   --  DMAC Channel Control B Register (ch_num = 0)
   type CTRLB_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.Short := 16#0#;
      --  Source Address Descriptor
      SRC_DSCR       : SRC_DSCR_Field := Fetch_From_Mem;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  Destination Address Descriptor
      DST_DSCR       : DST_DSCR_Field := Fetch_From_Mem;
      --  Flow Control
      FC             : FC_Field := Mem2Mem_Dma_Fc;
      --  Incrementing, Decrementing or Fixed Address for the Source
      SRC_INCR       : SRC_INCR_Field := Incrementing;
      --  unspecified
      Reserved_26_27 : ATSAM3X8E.UInt2 := 16#0#;
      --  Incrementing, Decrementing or Fixed Address for the Destination
      DST_INCR       : DST_INCR_Field := Incrementing;
      IEN            : CTRLB0_IEN_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CTRLB_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      SRC_DSCR       at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      DST_DSCR       at 0 range 20 .. 20;
      FC             at 0 range 21 .. 23;
      SRC_INCR       at 0 range 24 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      DST_INCR       at 0 range 28 .. 29;
      IEN            at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ------------------
   -- CFG_Register --
   ------------------

   subtype CFG0_SRC_PER_Field is ATSAM3X8E.UInt4;
   subtype CFG0_DST_PER_Field is ATSAM3X8E.UInt4;

   --  Software or Hardware Selection for the Source
   type SRC_H2SEL_Field is
     (
      --  Software handshaking interface is used to trigger a transfer request.
      Sw,
      --  Hardware handshaking interface is used to trigger a transfer request.
      Hw)
     with Size => 1;
   for SRC_H2SEL_Field use
     (Sw => 0,
      Hw => 1);

   --  Software or Hardware Selection for the Destination
   type DST_H2SEL_Field is
     (
      --  Software handshaking interface is used to trigger a transfer request.
      Sw,
      --  Hardware handshaking interface is used to trigger a transfer request.
      Hw)
     with Size => 1;
   for DST_H2SEL_Field use
     (Sw => 0,
      Hw => 1);

   --  Stop On Done
   type SOD_Field is
     (
      --  STOP ON DONE disabled, the descriptor fetch operation ignores DONE
      --  Field of CTRLA register.
      Disable,
      --  STOP ON DONE activated, the DMAC module is automatically disabled if
      --  DONE FIELD is set to 1.
      Enable)
     with Size => 1;
   for SOD_Field use
     (Disable => 0,
      Enable => 1);

   --  Interface Lock
   type LOCK_IF_Field is
     (
      --  Interface Lock capability is disabled
      Disable,
      --  Interface Lock capability is enabled
      Enable)
     with Size => 1;
   for LOCK_IF_Field use
     (Disable => 0,
      Enable => 1);

   --  Bus Lock
   type LOCK_B_Field is
     (
      --  AHB Bus Locking capability is disabled.
      Disable)
     with Size => 1;
   for LOCK_B_Field use
     (Disable => 0);

   --  Master Interface Arbiter Lock
   type LOCK_IF_L_Field is
     (
      --  The Master Interface Arbiter is locked by the channel x for a chunk
      --  transfer.
      Chunk,
      --  The Master Interface Arbiter is locked by the channel x for a buffer
      --  transfer.
      Buffer)
     with Size => 1;
   for LOCK_IF_L_Field use
     (Chunk => 0,
      Buffer => 1);

   subtype CFG0_AHB_PROT_Field is ATSAM3X8E.UInt3;

   --  FIFO Configuration
   type FIFOCFG_Field is
     (
      --  The largest defined length AHB burst is performed on the destination
      --  AHB interface.
      Alap_Cfg,
      --  When half FIFO size is available/filled, a source/destination request
      --  is serviced.
      Half_Cfg,
      --  When there is enough space/data available to perform a single AHB
      --  access, then the request is serviced.
      Asap_Cfg)
     with Size => 2;
   for FIFOCFG_Field use
     (Alap_Cfg => 0,
      Half_Cfg => 1,
      Asap_Cfg => 2);

   --  DMAC Channel Configuration Register (ch_num = 0)
   type CFG_Register is record
      --  Source with Peripheral identifier
      SRC_PER        : CFG0_SRC_PER_Field := 16#0#;
      --  Destination with Peripheral identifier
      DST_PER        : CFG0_DST_PER_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Software or Hardware Selection for the Source
      SRC_H2SEL      : SRC_H2SEL_Field := Sw;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3 := 16#0#;
      --  Software or Hardware Selection for the Destination
      DST_H2SEL      : DST_H2SEL_Field := Sw;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Stop On Done
      SOD            : SOD_Field := Disable;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  Interface Lock
      LOCK_IF        : LOCK_IF_Field := Disable;
      --  Bus Lock
      LOCK_B         : LOCK_B_Field := Disable;
      --  Master Interface Arbiter Lock
      LOCK_IF_L      : LOCK_IF_L_Field := Chunk;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  AHB Protection
      AHB_PROT       : CFG0_AHB_PROT_Field := 16#1#;
      --  unspecified
      Reserved_27_27 : ATSAM3X8E.Bit := 16#0#;
      --  FIFO Configuration
      FIFOCFG        : FIFOCFG_Field := Alap_Cfg;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CFG_Register use record
      SRC_PER        at 0 range 0 .. 3;
      DST_PER        at 0 range 4 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      SRC_H2SEL      at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      DST_H2SEL      at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      SOD            at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      LOCK_IF        at 0 range 20 .. 20;
      LOCK_B         at 0 range 21 .. 21;
      LOCK_IF_L      at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      AHB_PROT       at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      FIFOCFG        at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  DMAC Write Protect Mode Register
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

   --  DMAC Write Protect Status Register
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

   -----------------
   -- Peripherals --
   -----------------

   --  DMA Controller
   type DMAC_Peripheral is record
      --  DMAC Global Configuration Register
      GCFG   : GCFG_Register;
      --  DMAC Enable Register
      EN     : EN_Register;
      --  DMAC Software Single Request Register
      SREQ   : SREQ_Register;
      --  DMAC Software Chunk Transfer Request Register
      CREQ   : CREQ_Register;
      --  DMAC Software Last Transfer Flag Register
      LAST   : LAST_Register;
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  Transfer Completed Interrupt Enable register.
      EBCIER : EBCIER_Register;
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  Transfer Completed Interrupt Disable register.
      EBCIDR : EBCIDR_Register;
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  transfer completed Mask Register.
      EBCIMR : EBCIMR_Register;
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  transfer completed Status Register.
      EBCISR : EBCISR_Register;
      --  DMAC Channel Handler Enable Register
      CHER   : CHER_Register;
      --  DMAC Channel Handler Disable Register
      CHDR   : CHDR_Register;
      --  DMAC Channel Handler Status Register
      CHSR   : CHSR_Register;
      --  DMAC Channel Source Address Register (ch_num = 0)
      SADDR0 : ATSAM3X8E.Word;
      --  DMAC Channel Destination Address Register (ch_num = 0)
      DADDR0 : ATSAM3X8E.Word;
      --  DMAC Channel Descriptor Address Register (ch_num = 0)
      DSCR0  : DSCR_Register;
      --  DMAC Channel Control A Register (ch_num = 0)
      CTRLA0 : CTRLA_Register;
      --  DMAC Channel Control B Register (ch_num = 0)
      CTRLB0 : CTRLB_Register;
      --  DMAC Channel Configuration Register (ch_num = 0)
      CFG0   : CFG_Register;
      --  DMAC Channel Source Address Register (ch_num = 1)
      SADDR1 : ATSAM3X8E.Word;
      --  DMAC Channel Destination Address Register (ch_num = 1)
      DADDR1 : ATSAM3X8E.Word;
      --  DMAC Channel Descriptor Address Register (ch_num = 1)
      DSCR1  : DSCR_Register;
      --  DMAC Channel Control A Register (ch_num = 1)
      CTRLA1 : CTRLA_Register;
      --  DMAC Channel Control B Register (ch_num = 1)
      CTRLB1 : CTRLB_Register;
      --  DMAC Channel Configuration Register (ch_num = 1)
      CFG1   : CFG_Register;
      --  DMAC Channel Source Address Register (ch_num = 2)
      SADDR2 : ATSAM3X8E.Word;
      --  DMAC Channel Destination Address Register (ch_num = 2)
      DADDR2 : ATSAM3X8E.Word;
      --  DMAC Channel Descriptor Address Register (ch_num = 2)
      DSCR2  : DSCR_Register;
      --  DMAC Channel Control A Register (ch_num = 2)
      CTRLA2 : CTRLA_Register;
      --  DMAC Channel Control B Register (ch_num = 2)
      CTRLB2 : CTRLB_Register;
      --  DMAC Channel Configuration Register (ch_num = 2)
      CFG2   : CFG_Register;
      --  DMAC Channel Source Address Register (ch_num = 3)
      SADDR3 : ATSAM3X8E.Word;
      --  DMAC Channel Destination Address Register (ch_num = 3)
      DADDR3 : ATSAM3X8E.Word;
      --  DMAC Channel Descriptor Address Register (ch_num = 3)
      DSCR3  : DSCR_Register;
      --  DMAC Channel Control A Register (ch_num = 3)
      CTRLA3 : CTRLA_Register;
      --  DMAC Channel Control B Register (ch_num = 3)
      CTRLB3 : CTRLB_Register;
      --  DMAC Channel Configuration Register (ch_num = 3)
      CFG3   : CFG_Register;
      --  DMAC Channel Source Address Register (ch_num = 4)
      SADDR4 : ATSAM3X8E.Word;
      --  DMAC Channel Destination Address Register (ch_num = 4)
      DADDR4 : ATSAM3X8E.Word;
      --  DMAC Channel Descriptor Address Register (ch_num = 4)
      DSCR4  : DSCR_Register;
      --  DMAC Channel Control A Register (ch_num = 4)
      CTRLA4 : CTRLA_Register;
      --  DMAC Channel Control B Register (ch_num = 4)
      CTRLB4 : CTRLB_Register;
      --  DMAC Channel Configuration Register (ch_num = 4)
      CFG4   : CFG_Register;
      --  DMAC Channel Source Address Register (ch_num = 5)
      SADDR5 : ATSAM3X8E.Word;
      --  DMAC Channel Destination Address Register (ch_num = 5)
      DADDR5 : ATSAM3X8E.Word;
      --  DMAC Channel Descriptor Address Register (ch_num = 5)
      DSCR5  : DSCR_Register;
      --  DMAC Channel Control A Register (ch_num = 5)
      CTRLA5 : CTRLA_Register;
      --  DMAC Channel Control B Register (ch_num = 5)
      CTRLB5 : CTRLB_Register;
      --  DMAC Channel Configuration Register (ch_num = 5)
      CFG5   : CFG_Register;
      --  DMAC Write Protect Mode Register
      WPMR   : WPMR_Register;
      --  DMAC Write Protect Status Register
      WPSR   : WPSR_Register;
   end record
     with Volatile;

   for DMAC_Peripheral use record
      GCFG   at 0 range 0 .. 31;
      EN     at 4 range 0 .. 31;
      SREQ   at 8 range 0 .. 31;
      CREQ   at 12 range 0 .. 31;
      LAST   at 16 range 0 .. 31;
      EBCIER at 24 range 0 .. 31;
      EBCIDR at 28 range 0 .. 31;
      EBCIMR at 32 range 0 .. 31;
      EBCISR at 36 range 0 .. 31;
      CHER   at 40 range 0 .. 31;
      CHDR   at 44 range 0 .. 31;
      CHSR   at 48 range 0 .. 31;
      SADDR0 at 60 range 0 .. 31;
      DADDR0 at 64 range 0 .. 31;
      DSCR0  at 68 range 0 .. 31;
      CTRLA0 at 72 range 0 .. 31;
      CTRLB0 at 76 range 0 .. 31;
      CFG0   at 80 range 0 .. 31;
      SADDR1 at 100 range 0 .. 31;
      DADDR1 at 104 range 0 .. 31;
      DSCR1  at 108 range 0 .. 31;
      CTRLA1 at 112 range 0 .. 31;
      CTRLB1 at 116 range 0 .. 31;
      CFG1   at 120 range 0 .. 31;
      SADDR2 at 140 range 0 .. 31;
      DADDR2 at 144 range 0 .. 31;
      DSCR2  at 148 range 0 .. 31;
      CTRLA2 at 152 range 0 .. 31;
      CTRLB2 at 156 range 0 .. 31;
      CFG2   at 160 range 0 .. 31;
      SADDR3 at 180 range 0 .. 31;
      DADDR3 at 184 range 0 .. 31;
      DSCR3  at 188 range 0 .. 31;
      CTRLA3 at 192 range 0 .. 31;
      CTRLB3 at 196 range 0 .. 31;
      CFG3   at 200 range 0 .. 31;
      SADDR4 at 220 range 0 .. 31;
      DADDR4 at 224 range 0 .. 31;
      DSCR4  at 228 range 0 .. 31;
      CTRLA4 at 232 range 0 .. 31;
      CTRLB4 at 236 range 0 .. 31;
      CFG4   at 240 range 0 .. 31;
      SADDR5 at 260 range 0 .. 31;
      DADDR5 at 264 range 0 .. 31;
      DSCR5  at 268 range 0 .. 31;
      CTRLA5 at 272 range 0 .. 31;
      CTRLB5 at 276 range 0 .. 31;
      CFG5   at 280 range 0 .. 31;
      WPMR   at 484 range 0 .. 31;
      WPSR   at 488 range 0 .. 31;
   end record;

   --  DMA Controller
   DMAC_Periph : aliased DMAC_Peripheral
     with Import, Address => DMAC_Base;

end ATSAM3X8E.DMAC;
