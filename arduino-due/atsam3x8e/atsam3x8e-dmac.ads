pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  DMA Controller
package ATSAM3X8E.DMAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Arbiter Configuration
   type GCFG_ARB_CFG_Field is
     (--  Fixed priority arbiter.
      FIXED,
      --  Modified round robin arbiter.
      ROUND_ROBIN)
     with Size => 1;
   for GCFG_ARB_CFG_Field use
     (FIXED => 0,
      ROUND_ROBIN => 1);

   --  DMAC Global Configuration Register
   type DMAC_GCFG_Register is record
      --  unspecified
      Reserved_0_3  : ATSAM3X8E.UInt4 := 16#0#;
      --  Arbiter Configuration
      ARB_CFG       : GCFG_ARB_CFG_Field := ATSAM3X8E.DMAC.ROUND_ROBIN;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_GCFG_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      ARB_CFG       at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype DMAC_EN_ENABLE_Field is ATSAM3X8E.Bit;

   --  DMAC Enable Register
   type DMAC_EN_Register is record
      ENABLE        : DMAC_EN_ENABLE_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_EN_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype DMAC_SREQ_SSREQ0_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_DSREQ0_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_SSREQ1_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_DSREQ1_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_SSREQ2_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_DSREQ2_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_SSREQ3_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_DSREQ3_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_SSREQ4_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_DSREQ4_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_SSREQ5_Field is ATSAM3X8E.Bit;
   subtype DMAC_SREQ_DSREQ5_Field is ATSAM3X8E.Bit;

   --  DMAC Software Single Request Register
   type DMAC_SREQ_Register is record
      --  Source Request
      SSREQ0         : DMAC_SREQ_SSREQ0_Field := 16#0#;
      --  Destination Request
      DSREQ0         : DMAC_SREQ_DSREQ0_Field := 16#0#;
      --  Source Request
      SSREQ1         : DMAC_SREQ_SSREQ1_Field := 16#0#;
      --  Destination Request
      DSREQ1         : DMAC_SREQ_DSREQ1_Field := 16#0#;
      --  Source Request
      SSREQ2         : DMAC_SREQ_SSREQ2_Field := 16#0#;
      --  Destination Request
      DSREQ2         : DMAC_SREQ_DSREQ2_Field := 16#0#;
      --  Source Request
      SSREQ3         : DMAC_SREQ_SSREQ3_Field := 16#0#;
      --  Destination Request
      DSREQ3         : DMAC_SREQ_DSREQ3_Field := 16#0#;
      --  Source Request
      SSREQ4         : DMAC_SREQ_SSREQ4_Field := 16#0#;
      --  Destination Request
      DSREQ4         : DMAC_SREQ_DSREQ4_Field := 16#0#;
      --  Source Request
      SSREQ5         : DMAC_SREQ_SSREQ5_Field := 16#0#;
      --  Destination Request
      DSREQ5         : DMAC_SREQ_DSREQ5_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_SREQ_Register use record
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

   subtype DMAC_CREQ_SCREQ0_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_DCREQ0_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_SCREQ1_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_DCREQ1_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_SCREQ2_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_DCREQ2_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_SCREQ3_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_DCREQ3_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_SCREQ4_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_DCREQ4_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_SCREQ5_Field is ATSAM3X8E.Bit;
   subtype DMAC_CREQ_DCREQ5_Field is ATSAM3X8E.Bit;

   --  DMAC Software Chunk Transfer Request Register
   type DMAC_CREQ_Register is record
      --  Source Chunk Request
      SCREQ0         : DMAC_CREQ_SCREQ0_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ0         : DMAC_CREQ_DCREQ0_Field := 16#0#;
      --  Source Chunk Request
      SCREQ1         : DMAC_CREQ_SCREQ1_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ1         : DMAC_CREQ_DCREQ1_Field := 16#0#;
      --  Source Chunk Request
      SCREQ2         : DMAC_CREQ_SCREQ2_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ2         : DMAC_CREQ_DCREQ2_Field := 16#0#;
      --  Source Chunk Request
      SCREQ3         : DMAC_CREQ_SCREQ3_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ3         : DMAC_CREQ_DCREQ3_Field := 16#0#;
      --  Source Chunk Request
      SCREQ4         : DMAC_CREQ_SCREQ4_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ4         : DMAC_CREQ_DCREQ4_Field := 16#0#;
      --  Source Chunk Request
      SCREQ5         : DMAC_CREQ_SCREQ5_Field := 16#0#;
      --  Destination Chunk Request
      DCREQ5         : DMAC_CREQ_DCREQ5_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_CREQ_Register use record
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

   subtype DMAC_LAST_SLAST0_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_DLAST0_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_SLAST1_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_DLAST1_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_SLAST2_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_DLAST2_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_SLAST3_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_DLAST3_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_SLAST4_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_DLAST4_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_SLAST5_Field is ATSAM3X8E.Bit;
   subtype DMAC_LAST_DLAST5_Field is ATSAM3X8E.Bit;

   --  DMAC Software Last Transfer Flag Register
   type DMAC_LAST_Register is record
      --  Source Last
      SLAST0         : DMAC_LAST_SLAST0_Field := 16#0#;
      --  Destination Last
      DLAST0         : DMAC_LAST_DLAST0_Field := 16#0#;
      --  Source Last
      SLAST1         : DMAC_LAST_SLAST1_Field := 16#0#;
      --  Destination Last
      DLAST1         : DMAC_LAST_DLAST1_Field := 16#0#;
      --  Source Last
      SLAST2         : DMAC_LAST_SLAST2_Field := 16#0#;
      --  Destination Last
      DLAST2         : DMAC_LAST_DLAST2_Field := 16#0#;
      --  Source Last
      SLAST3         : DMAC_LAST_SLAST3_Field := 16#0#;
      --  Destination Last
      DLAST3         : DMAC_LAST_DLAST3_Field := 16#0#;
      --  Source Last
      SLAST4         : DMAC_LAST_SLAST4_Field := 16#0#;
      --  Destination Last
      DLAST4         : DMAC_LAST_DLAST4_Field := 16#0#;
      --  Source Last
      SLAST5         : DMAC_LAST_SLAST5_Field := 16#0#;
      --  Destination Last
      DLAST5         : DMAC_LAST_DLAST5_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_LAST_Register use record
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

   --  DMAC_EBCIER_BTC array element
   subtype DMAC_EBCIER_BTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIER_BTC array
   type DMAC_EBCIER_BTC_Field_Array is array (0 .. 5)
     of DMAC_EBCIER_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIER_BTC
   type DMAC_EBCIER_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : DMAC_EBCIER_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIER_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCIER_CBTC array element
   subtype DMAC_EBCIER_CBTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIER_CBTC array
   type DMAC_EBCIER_CBTC_Field_Array is array (0 .. 5)
     of DMAC_EBCIER_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIER_CBTC
   type DMAC_EBCIER_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : DMAC_EBCIER_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIER_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCIER_ERR array element
   subtype DMAC_EBCIER_ERR_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIER_ERR array
   type DMAC_EBCIER_ERR_Field_Array is array (0 .. 5)
     of DMAC_EBCIER_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIER_ERR
   type DMAC_EBCIER_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : DMAC_EBCIER_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIER_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  Transfer Completed Interrupt Enable register.
   type DMAC_EBCIER_Register is record
      --  Write-only. Buffer Transfer Completed [5:0]
      BTC            : DMAC_EBCIER_BTC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : DMAC_EBCIER_CBTC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Access Error [5:0]
      ERR            : DMAC_EBCIER_ERR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_EBCIER_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  DMAC_EBCIDR_BTC array element
   subtype DMAC_EBCIDR_BTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIDR_BTC array
   type DMAC_EBCIDR_BTC_Field_Array is array (0 .. 5)
     of DMAC_EBCIDR_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIDR_BTC
   type DMAC_EBCIDR_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : DMAC_EBCIDR_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIDR_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCIDR_CBTC array element
   subtype DMAC_EBCIDR_CBTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIDR_CBTC array
   type DMAC_EBCIDR_CBTC_Field_Array is array (0 .. 5)
     of DMAC_EBCIDR_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIDR_CBTC
   type DMAC_EBCIDR_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : DMAC_EBCIDR_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIDR_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCIDR_ERR array element
   subtype DMAC_EBCIDR_ERR_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIDR_ERR array
   type DMAC_EBCIDR_ERR_Field_Array is array (0 .. 5)
     of DMAC_EBCIDR_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIDR_ERR
   type DMAC_EBCIDR_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : DMAC_EBCIDR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIDR_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  Transfer Completed Interrupt Disable register.
   type DMAC_EBCIDR_Register is record
      --  Write-only. Buffer Transfer Completed [5:0]
      BTC            : DMAC_EBCIDR_BTC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : DMAC_EBCIDR_CBTC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Access Error [5:0]
      ERR            : DMAC_EBCIDR_ERR_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_EBCIDR_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  DMAC_EBCIMR_BTC array element
   subtype DMAC_EBCIMR_BTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIMR_BTC array
   type DMAC_EBCIMR_BTC_Field_Array is array (0 .. 5)
     of DMAC_EBCIMR_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIMR_BTC
   type DMAC_EBCIMR_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : DMAC_EBCIMR_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIMR_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCIMR_CBTC array element
   subtype DMAC_EBCIMR_CBTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIMR_CBTC array
   type DMAC_EBCIMR_CBTC_Field_Array is array (0 .. 5)
     of DMAC_EBCIMR_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIMR_CBTC
   type DMAC_EBCIMR_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : DMAC_EBCIMR_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIMR_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCIMR_ERR array element
   subtype DMAC_EBCIMR_ERR_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCIMR_ERR array
   type DMAC_EBCIMR_ERR_Field_Array is array (0 .. 5)
     of DMAC_EBCIMR_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCIMR_ERR
   type DMAC_EBCIMR_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : DMAC_EBCIMR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCIMR_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  transfer completed Mask Register.
   type DMAC_EBCIMR_Register is record
      --  Read-only. Buffer Transfer Completed [5:0]
      BTC            : DMAC_EBCIMR_BTC_Field;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : DMAC_EBCIMR_CBTC_Field;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Access Error [5:0]
      ERR            : DMAC_EBCIMR_ERR_Field;
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_EBCIMR_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  DMAC_EBCISR_BTC array element
   subtype DMAC_EBCISR_BTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCISR_BTC array
   type DMAC_EBCISR_BTC_Field_Array is array (0 .. 5)
     of DMAC_EBCISR_BTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCISR_BTC
   type DMAC_EBCISR_BTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  BTC as an array
            Arr : DMAC_EBCISR_BTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCISR_BTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCISR_CBTC array element
   subtype DMAC_EBCISR_CBTC_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCISR_CBTC array
   type DMAC_EBCISR_CBTC_Field_Array is array (0 .. 5)
     of DMAC_EBCISR_CBTC_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCISR_CBTC
   type DMAC_EBCISR_CBTC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CBTC as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  CBTC as an array
            Arr : DMAC_EBCISR_CBTC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCISR_CBTC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_EBCISR_ERR array element
   subtype DMAC_EBCISR_ERR_Element is ATSAM3X8E.Bit;

   --  DMAC_EBCISR_ERR array
   type DMAC_EBCISR_ERR_Field_Array is array (0 .. 5)
     of DMAC_EBCISR_ERR_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_EBCISR_ERR
   type DMAC_EBCISR_ERR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ERR as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ERR as an array
            Arr : DMAC_EBCISR_ERR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_EBCISR_ERR_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
   --  transfer completed Status Register.
   type DMAC_EBCISR_Register is record
      --  Read-only. Buffer Transfer Completed [5:0]
      BTC            : DMAC_EBCISR_BTC_Field;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Chained Buffer Transfer Completed [5:0]
      CBTC           : DMAC_EBCISR_CBTC_Field;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Access Error [5:0]
      ERR            : DMAC_EBCISR_ERR_Field;
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_EBCISR_Register use record
      BTC            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CBTC           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ERR            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  DMAC_CHER_ENA array element
   subtype DMAC_CHER_ENA_Element is ATSAM3X8E.Bit;

   --  DMAC_CHER_ENA array
   type DMAC_CHER_ENA_Field_Array is array (0 .. 5) of DMAC_CHER_ENA_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHER_ENA
   type DMAC_CHER_ENA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENA as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ENA as an array
            Arr : DMAC_CHER_ENA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHER_ENA_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_CHER_SUSP array element
   subtype DMAC_CHER_SUSP_Element is ATSAM3X8E.Bit;

   --  DMAC_CHER_SUSP array
   type DMAC_CHER_SUSP_Field_Array is array (0 .. 5)
     of DMAC_CHER_SUSP_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHER_SUSP
   type DMAC_CHER_SUSP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SUSP as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  SUSP as an array
            Arr : DMAC_CHER_SUSP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHER_SUSP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_CHER_KEEP array element
   subtype DMAC_CHER_KEEP_Element is ATSAM3X8E.Bit;

   --  DMAC_CHER_KEEP array
   type DMAC_CHER_KEEP_Field_Array is array (0 .. 5)
     of DMAC_CHER_KEEP_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHER_KEEP
   type DMAC_CHER_KEEP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  KEEP as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  KEEP as an array
            Arr : DMAC_CHER_KEEP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHER_KEEP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Channel Handler Enable Register
   type DMAC_CHER_Register is record
      --  Write-only. Enable [5:0]
      ENA            : DMAC_CHER_ENA_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Suspend [5:0]
      SUSP           : DMAC_CHER_SUSP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_23 : ATSAM3X8E.UInt10 := 16#0#;
      --  Write-only. Keep on [5:0]
      KEEP           : DMAC_CHER_KEEP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_CHER_Register use record
      ENA            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SUSP           at 0 range 8 .. 13;
      Reserved_14_23 at 0 range 14 .. 23;
      KEEP           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  DMAC_CHDR_DIS array element
   subtype DMAC_CHDR_DIS_Element is ATSAM3X8E.Bit;

   --  DMAC_CHDR_DIS array
   type DMAC_CHDR_DIS_Field_Array is array (0 .. 5) of DMAC_CHDR_DIS_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHDR_DIS
   type DMAC_CHDR_DIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DIS as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  DIS as an array
            Arr : DMAC_CHDR_DIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHDR_DIS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_CHDR_RES array element
   subtype DMAC_CHDR_RES_Element is ATSAM3X8E.Bit;

   --  DMAC_CHDR_RES array
   type DMAC_CHDR_RES_Field_Array is array (0 .. 5) of DMAC_CHDR_RES_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHDR_RES
   type DMAC_CHDR_RES_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RES as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  RES as an array
            Arr : DMAC_CHDR_RES_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHDR_RES_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Channel Handler Disable Register
   type DMAC_CHDR_Register is record
      --  Write-only. Disable [5:0]
      DIS            : DMAC_CHDR_DIS_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Resume [5:0]
      RES            : DMAC_CHDR_RES_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_CHDR_Register use record
      DIS            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      RES            at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  DMAC_CHSR_ENA array element
   subtype DMAC_CHSR_ENA_Element is ATSAM3X8E.Bit;

   --  DMAC_CHSR_ENA array
   type DMAC_CHSR_ENA_Field_Array is array (0 .. 5) of DMAC_CHSR_ENA_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHSR_ENA
   type DMAC_CHSR_ENA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENA as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  ENA as an array
            Arr : DMAC_CHSR_ENA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHSR_ENA_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_CHSR_SUSP array element
   subtype DMAC_CHSR_SUSP_Element is ATSAM3X8E.Bit;

   --  DMAC_CHSR_SUSP array
   type DMAC_CHSR_SUSP_Field_Array is array (0 .. 5)
     of DMAC_CHSR_SUSP_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHSR_SUSP
   type DMAC_CHSR_SUSP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SUSP as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  SUSP as an array
            Arr : DMAC_CHSR_SUSP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHSR_SUSP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_CHSR_EMPT array element
   subtype DMAC_CHSR_EMPT_Element is ATSAM3X8E.Bit;

   --  DMAC_CHSR_EMPT array
   type DMAC_CHSR_EMPT_Field_Array is array (0 .. 5)
     of DMAC_CHSR_EMPT_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHSR_EMPT
   type DMAC_CHSR_EMPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EMPT as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  EMPT as an array
            Arr : DMAC_CHSR_EMPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHSR_EMPT_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC_CHSR_STAL array element
   subtype DMAC_CHSR_STAL_Element is ATSAM3X8E.Bit;

   --  DMAC_CHSR_STAL array
   type DMAC_CHSR_STAL_Field_Array is array (0 .. 5)
     of DMAC_CHSR_STAL_Element
     with Component_Size => 1, Size => 6;

   --  Type definition for DMAC_CHSR_STAL
   type DMAC_CHSR_STAL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STAL as a value
            Val : ATSAM3X8E.UInt6;
         when True =>
            --  STAL as an array
            Arr : DMAC_CHSR_STAL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for DMAC_CHSR_STAL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  DMAC Channel Handler Status Register
   type DMAC_CHSR_Register is record
      --  Read-only. Enable [5:0]
      ENA            : DMAC_CHSR_ENA_Field;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Suspend [5:0]
      SUSP           : DMAC_CHSR_SUSP_Field;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2;
      --  Read-only. Empty [5:0]
      EMPT           : DMAC_CHSR_EMPT_Field;
      --  unspecified
      Reserved_22_23 : ATSAM3X8E.UInt2;
      --  Read-only. Stalled [5:0]
      STAL           : DMAC_CHSR_STAL_Field;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_CHSR_Register use record
      ENA            at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SUSP           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      EMPT           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      STAL           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype DSCR_DSCR_Field is ATSAM3X8E.UInt30;

   --  DMAC Channel Descriptor Address Register (ch_num = 0)
   type DSCR_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2 := 16#0#;
      --  Buffer Transfer Descriptor Address
      DSCR         : DSCR_DSCR_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DSCR_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      DSCR         at 0 range 2 .. 31;
   end record;

   subtype CTRLA_BTSIZE_Field is ATSAM3X8E.UInt16;

   --  Source Chunk Transfer Size.
   type CTRLA0_SCSIZE_Field is
     (--  1 data transferred
      CHK_1,
      --  4 data transferred
      CHK_4,
      --  8 data transferred
      CHK_8,
      --  16 data transferred
      CHK_16,
      --  32 data transferred
      CHK_32,
      --  64 data transferred
      CHK_64,
      --  128 data transferred
      CHK_128,
      --  256 data transferred
      CHK_256)
     with Size => 3;
   for CTRLA0_SCSIZE_Field use
     (CHK_1 => 0,
      CHK_4 => 1,
      CHK_8 => 2,
      CHK_16 => 3,
      CHK_32 => 4,
      CHK_64 => 5,
      CHK_128 => 6,
      CHK_256 => 7);

   --  Destination Chunk Transfer Size
   type CTRLA0_DCSIZE_Field is
     (--  1 data transferred
      CHK_1,
      --  4 data transferred
      CHK_4,
      --  8 data transferred
      CHK_8,
      --  16 data transferred
      CHK_16,
      --  32 data transferred
      CHK_32,
      --  64 data transferred
      CHK_64,
      --  128 data transferred
      CHK_128,
      --  256 data transferred
      CHK_256)
     with Size => 3;
   for CTRLA0_DCSIZE_Field use
     (CHK_1 => 0,
      CHK_4 => 1,
      CHK_8 => 2,
      CHK_16 => 3,
      CHK_32 => 4,
      CHK_64 => 5,
      CHK_128 => 6,
      CHK_256 => 7);

   --  Transfer Width for the Source
   type CTRLA0_SRC_WIDTH_Field is
     (--  the transfer size is set to 8-bit width
      BYTE,
      --  the transfer size is set to 16-bit width
      HALF_WORD,
      --  the transfer size is set to 32-bit width
      WORD)
     with Size => 2;
   for CTRLA0_SRC_WIDTH_Field use
     (BYTE => 0,
      HALF_WORD => 1,
      WORD => 2);

   --  Transfer Width for the Destination
   type CTRLA0_DST_WIDTH_Field is
     (--  the transfer size is set to 8-bit width
      BYTE,
      --  the transfer size is set to 16-bit width
      HALF_WORD,
      --  the transfer size is set to 32-bit width
      WORD)
     with Size => 2;
   for CTRLA0_DST_WIDTH_Field use
     (BYTE => 0,
      HALF_WORD => 1,
      WORD => 2);

   subtype CTRLA_DONE_Field is ATSAM3X8E.Bit;

   --  DMAC Channel Control A Register (ch_num = 0)
   type CTRLA_Register is record
      --  Buffer Transfer Size
      BTSIZE         : CTRLA_BTSIZE_Field := 16#0#;
      --  Source Chunk Transfer Size.
      SCSIZE         : CTRLA0_SCSIZE_Field := ATSAM3X8E.DMAC.CHK_1;
      --  unspecified
      Reserved_19_19 : ATSAM3X8E.Bit := 16#0#;
      --  Destination Chunk Transfer Size
      DCSIZE         : CTRLA0_DCSIZE_Field := ATSAM3X8E.DMAC.CHK_1;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  Transfer Width for the Source
      SRC_WIDTH      : CTRLA0_SRC_WIDTH_Field := ATSAM3X8E.DMAC.BYTE;
      --  unspecified
      Reserved_26_27 : ATSAM3X8E.UInt2 := 16#0#;
      --  Transfer Width for the Destination
      DST_WIDTH      : CTRLA0_DST_WIDTH_Field := ATSAM3X8E.DMAC.BYTE;
      --  unspecified
      Reserved_30_30 : ATSAM3X8E.Bit := 16#0#;
      DONE           : CTRLA_DONE_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

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

   --  Source Address Descriptor
   type CTRLB0_SRC_DSCR_Field is
     (--  Source address is updated when the descriptor is fetched from the memory.
      FETCH_FROM_MEM,
      --  Buffer Descriptor Fetch operation is disabled for the source.
      FETCH_DISABLE)
     with Size => 1;
   for CTRLB0_SRC_DSCR_Field use
     (FETCH_FROM_MEM => 0,
      FETCH_DISABLE => 1);

   --  Destination Address Descriptor
   type CTRLB0_DST_DSCR_Field is
     (--  Destination address is updated when the descriptor is fetched from the
--  memory.
      FETCH_FROM_MEM,
      --  Buffer Descriptor Fetch operation is disabled for the destination.
      FETCH_DISABLE)
     with Size => 1;
   for CTRLB0_DST_DSCR_Field use
     (FETCH_FROM_MEM => 0,
      FETCH_DISABLE => 1);

   --  Flow Control
   type CTRLB0_FC_Field is
     (--  Memory-to-Memory Transfer DMAC is flow controller
      MEM2MEM_DMA_FC,
      --  Memory-to-Peripheral Transfer DMAC is flow controller
      MEM2PER_DMA_FC,
      --  Peripheral-to-Memory Transfer DMAC is flow controller
      PER2MEM_DMA_FC,
      --  Peripheral-to-Peripheral Transfer DMAC is flow controller
      PER2PER_DMA_FC)
     with Size => 3;
   for CTRLB0_FC_Field use
     (MEM2MEM_DMA_FC => 0,
      MEM2PER_DMA_FC => 1,
      PER2MEM_DMA_FC => 2,
      PER2PER_DMA_FC => 3);

   --  Incrementing, Decrementing or Fixed Address for the Source
   type CTRLB0_SRC_INCR_Field is
     (--  The source address is incremented
      INCREMENTING,
      --  The source address is decremented
      DECREMENTING,
      --  The source address remains unchanged
      FIXED)
     with Size => 2;
   for CTRLB0_SRC_INCR_Field use
     (INCREMENTING => 0,
      DECREMENTING => 1,
      FIXED => 2);

   --  Incrementing, Decrementing or Fixed Address for the Destination
   type CTRLB0_DST_INCR_Field is
     (--  The destination address is incremented
      INCREMENTING,
      --  The destination address is decremented
      DECREMENTING,
      --  The destination address remains unchanged
      FIXED)
     with Size => 2;
   for CTRLB0_DST_INCR_Field use
     (INCREMENTING => 0,
      DECREMENTING => 1,
      FIXED => 2);

   subtype CTRLB_IEN_Field is ATSAM3X8E.Bit;

   --  DMAC Channel Control B Register (ch_num = 0)
   type CTRLB_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.UInt16 := 16#0#;
      --  Source Address Descriptor
      SRC_DSCR       : CTRLB0_SRC_DSCR_Field := ATSAM3X8E.DMAC.FETCH_FROM_MEM;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  Destination Address Descriptor
      DST_DSCR       : CTRLB0_DST_DSCR_Field := ATSAM3X8E.DMAC.FETCH_FROM_MEM;
      --  Flow Control
      FC             : CTRLB0_FC_Field := ATSAM3X8E.DMAC.MEM2MEM_DMA_FC;
      --  Incrementing, Decrementing or Fixed Address for the Source
      SRC_INCR       : CTRLB0_SRC_INCR_Field := ATSAM3X8E.DMAC.INCREMENTING;
      --  unspecified
      Reserved_26_27 : ATSAM3X8E.UInt2 := 16#0#;
      --  Incrementing, Decrementing or Fixed Address for the Destination
      DST_INCR       : CTRLB0_DST_INCR_Field := ATSAM3X8E.DMAC.INCREMENTING;
      IEN            : CTRLB_IEN_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

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

   subtype CFG_SRC_PER_Field is ATSAM3X8E.UInt4;
   subtype CFG_DST_PER_Field is ATSAM3X8E.UInt4;

   --  Software or Hardware Selection for the Source
   type CFG0_SRC_H2SEL_Field is
     (--  Software handshaking interface is used to trigger a transfer request.
      SW,
      --  Hardware handshaking interface is used to trigger a transfer request.
      HW)
     with Size => 1;
   for CFG0_SRC_H2SEL_Field use
     (SW => 0,
      HW => 1);

   --  Software or Hardware Selection for the Destination
   type CFG0_DST_H2SEL_Field is
     (--  Software handshaking interface is used to trigger a transfer request.
      SW,
      --  Hardware handshaking interface is used to trigger a transfer request.
      HW)
     with Size => 1;
   for CFG0_DST_H2SEL_Field use
     (SW => 0,
      HW => 1);

   --  Stop On Done
   type CFG0_SOD_Field is
     (--  STOP ON DONE disabled, the descriptor fetch operation ignores DONE Field of
--  CTRLA register.
      DISABLE,
      --  STOP ON DONE activated, the DMAC module is automatically disabled if DONE
--  FIELD is set to 1.
      ENABLE)
     with Size => 1;
   for CFG0_SOD_Field use
     (DISABLE => 0,
      ENABLE => 1);

   --  Interface Lock
   type CFG0_LOCK_IF_Field is
     (--  Interface Lock capability is disabled
      DISABLE,
      --  Interface Lock capability is enabled
      ENABLE)
     with Size => 1;
   for CFG0_LOCK_IF_Field use
     (DISABLE => 0,
      ENABLE => 1);

   --  Bus Lock
   type CFG0_LOCK_B_Field is
     (--  AHB Bus Locking capability is disabled.
      DISABLE)
     with Size => 1;
   for CFG0_LOCK_B_Field use
     (DISABLE => 0);

   --  Master Interface Arbiter Lock
   type CFG0_LOCK_IF_L_Field is
     (--  The Master Interface Arbiter is locked by the channel x for a chunk
--  transfer.
      CHUNK,
      --  The Master Interface Arbiter is locked by the channel x for a buffer
--  transfer.
      BUFFER)
     with Size => 1;
   for CFG0_LOCK_IF_L_Field use
     (CHUNK => 0,
      BUFFER => 1);

   subtype CFG_AHB_PROT_Field is ATSAM3X8E.UInt3;

   --  FIFO Configuration
   type CFG0_FIFOCFG_Field is
     (--  The largest defined length AHB burst is performed on the destination AHB
--  interface.
      ALAP_CFG,
      --  When half FIFO size is available/filled, a source/destination request is
--  serviced.
      HALF_CFG,
      --  When there is enough space/data available to perform a single AHB access,
--  then the request is serviced.
      ASAP_CFG)
     with Size => 2;
   for CFG0_FIFOCFG_Field use
     (ALAP_CFG => 0,
      HALF_CFG => 1,
      ASAP_CFG => 2);

   --  DMAC Channel Configuration Register (ch_num = 0)
   type CFG_Register is record
      --  Source with Peripheral identifier
      SRC_PER        : CFG_SRC_PER_Field := 16#0#;
      --  Destination with Peripheral identifier
      DST_PER        : CFG_DST_PER_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Software or Hardware Selection for the Source
      SRC_H2SEL      : CFG0_SRC_H2SEL_Field := ATSAM3X8E.DMAC.SW;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3 := 16#0#;
      --  Software or Hardware Selection for the Destination
      DST_H2SEL      : CFG0_DST_H2SEL_Field := ATSAM3X8E.DMAC.SW;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Stop On Done
      SOD            : CFG0_SOD_Field := ATSAM3X8E.DMAC.DISABLE;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  Interface Lock
      LOCK_IF        : CFG0_LOCK_IF_Field := ATSAM3X8E.DMAC.DISABLE;
      --  Bus Lock
      LOCK_B         : CFG0_LOCK_B_Field := ATSAM3X8E.DMAC.DISABLE;
      --  Master Interface Arbiter Lock
      LOCK_IF_L      : CFG0_LOCK_IF_L_Field := ATSAM3X8E.DMAC.CHUNK;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  AHB Protection
      AHB_PROT       : CFG_AHB_PROT_Field := 16#1#;
      --  unspecified
      Reserved_27_27 : ATSAM3X8E.Bit := 16#0#;
      --  FIFO Configuration
      FIFOCFG        : CFG0_FIFOCFG_Field := ATSAM3X8E.DMAC.ALAP_CFG;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

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

   subtype DMAC_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype DMAC_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  DMAC Write Protect Mode Register
   type DMAC_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : DMAC_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : DMAC_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype DMAC_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype DMAC_WPSR_WPVSRC_Field is ATSAM3X8E.UInt16;

   --  DMAC Write Protect Status Register
   type DMAC_WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : DMAC_WPSR_WPVS_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : DMAC_WPSR_WPVSRC_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DMAC_WPSR_Register use record
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
      GCFG   : aliased DMAC_GCFG_Register;
      pragma Volatile_Full_Access (GCFG);
      --  DMAC Enable Register
      EN     : aliased DMAC_EN_Register;
      pragma Volatile_Full_Access (EN);
      --  DMAC Software Single Request Register
      SREQ   : aliased DMAC_SREQ_Register;
      pragma Volatile_Full_Access (SREQ);
      --  DMAC Software Chunk Transfer Request Register
      CREQ   : aliased DMAC_CREQ_Register;
      pragma Volatile_Full_Access (CREQ);
      --  DMAC Software Last Transfer Flag Register
      LAST   : aliased DMAC_LAST_Register;
      pragma Volatile_Full_Access (LAST);
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  Transfer Completed Interrupt Enable register.
      EBCIER : aliased DMAC_EBCIER_Register;
      pragma Volatile_Full_Access (EBCIER);
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  Transfer Completed Interrupt Disable register.
      EBCIDR : aliased DMAC_EBCIDR_Register;
      pragma Volatile_Full_Access (EBCIDR);
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  transfer completed Mask Register.
      EBCIMR : aliased DMAC_EBCIMR_Register;
      pragma Volatile_Full_Access (EBCIMR);
      --  DMAC Error, Chained Buffer Transfer Completed Interrupt and Buffer
      --  transfer completed Status Register.
      EBCISR : aliased DMAC_EBCISR_Register;
      pragma Volatile_Full_Access (EBCISR);
      --  DMAC Channel Handler Enable Register
      CHER   : aliased DMAC_CHER_Register;
      pragma Volatile_Full_Access (CHER);
      --  DMAC Channel Handler Disable Register
      CHDR   : aliased DMAC_CHDR_Register;
      pragma Volatile_Full_Access (CHDR);
      --  DMAC Channel Handler Status Register
      CHSR   : aliased DMAC_CHSR_Register;
      pragma Volatile_Full_Access (CHSR);
      --  DMAC Channel Source Address Register (ch_num = 0)
      SADDR0 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Destination Address Register (ch_num = 0)
      DADDR0 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Descriptor Address Register (ch_num = 0)
      DSCR0  : aliased DSCR_Register;
      pragma Volatile_Full_Access (DSCR0);
      --  DMAC Channel Control A Register (ch_num = 0)
      CTRLA0 : aliased CTRLA_Register;
      pragma Volatile_Full_Access (CTRLA0);
      --  DMAC Channel Control B Register (ch_num = 0)
      CTRLB0 : aliased CTRLB_Register;
      pragma Volatile_Full_Access (CTRLB0);
      --  DMAC Channel Configuration Register (ch_num = 0)
      CFG0   : aliased CFG_Register;
      pragma Volatile_Full_Access (CFG0);
      --  DMAC Channel Source Address Register (ch_num = 1)
      SADDR1 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Destination Address Register (ch_num = 1)
      DADDR1 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Descriptor Address Register (ch_num = 1)
      DSCR1  : aliased DSCR_Register;
      pragma Volatile_Full_Access (DSCR1);
      --  DMAC Channel Control A Register (ch_num = 1)
      CTRLA1 : aliased CTRLA_Register;
      pragma Volatile_Full_Access (CTRLA1);
      --  DMAC Channel Control B Register (ch_num = 1)
      CTRLB1 : aliased CTRLB_Register;
      pragma Volatile_Full_Access (CTRLB1);
      --  DMAC Channel Configuration Register (ch_num = 1)
      CFG1   : aliased CFG_Register;
      pragma Volatile_Full_Access (CFG1);
      --  DMAC Channel Source Address Register (ch_num = 2)
      SADDR2 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Destination Address Register (ch_num = 2)
      DADDR2 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Descriptor Address Register (ch_num = 2)
      DSCR2  : aliased DSCR_Register;
      pragma Volatile_Full_Access (DSCR2);
      --  DMAC Channel Control A Register (ch_num = 2)
      CTRLA2 : aliased CTRLA_Register;
      pragma Volatile_Full_Access (CTRLA2);
      --  DMAC Channel Control B Register (ch_num = 2)
      CTRLB2 : aliased CTRLB_Register;
      pragma Volatile_Full_Access (CTRLB2);
      --  DMAC Channel Configuration Register (ch_num = 2)
      CFG2   : aliased CFG_Register;
      pragma Volatile_Full_Access (CFG2);
      --  DMAC Channel Source Address Register (ch_num = 3)
      SADDR3 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Destination Address Register (ch_num = 3)
      DADDR3 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Descriptor Address Register (ch_num = 3)
      DSCR3  : aliased DSCR_Register;
      pragma Volatile_Full_Access (DSCR3);
      --  DMAC Channel Control A Register (ch_num = 3)
      CTRLA3 : aliased CTRLA_Register;
      pragma Volatile_Full_Access (CTRLA3);
      --  DMAC Channel Control B Register (ch_num = 3)
      CTRLB3 : aliased CTRLB_Register;
      pragma Volatile_Full_Access (CTRLB3);
      --  DMAC Channel Configuration Register (ch_num = 3)
      CFG3   : aliased CFG_Register;
      pragma Volatile_Full_Access (CFG3);
      --  DMAC Channel Source Address Register (ch_num = 4)
      SADDR4 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Destination Address Register (ch_num = 4)
      DADDR4 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Descriptor Address Register (ch_num = 4)
      DSCR4  : aliased DSCR_Register;
      pragma Volatile_Full_Access (DSCR4);
      --  DMAC Channel Control A Register (ch_num = 4)
      CTRLA4 : aliased CTRLA_Register;
      pragma Volatile_Full_Access (CTRLA4);
      --  DMAC Channel Control B Register (ch_num = 4)
      CTRLB4 : aliased CTRLB_Register;
      pragma Volatile_Full_Access (CTRLB4);
      --  DMAC Channel Configuration Register (ch_num = 4)
      CFG4   : aliased CFG_Register;
      pragma Volatile_Full_Access (CFG4);
      --  DMAC Channel Source Address Register (ch_num = 5)
      SADDR5 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Destination Address Register (ch_num = 5)
      DADDR5 : aliased ATSAM3X8E.UInt32;
      --  DMAC Channel Descriptor Address Register (ch_num = 5)
      DSCR5  : aliased DSCR_Register;
      pragma Volatile_Full_Access (DSCR5);
      --  DMAC Channel Control A Register (ch_num = 5)
      CTRLA5 : aliased CTRLA_Register;
      pragma Volatile_Full_Access (CTRLA5);
      --  DMAC Channel Control B Register (ch_num = 5)
      CTRLB5 : aliased CTRLB_Register;
      pragma Volatile_Full_Access (CTRLB5);
      --  DMAC Channel Configuration Register (ch_num = 5)
      CFG5   : aliased CFG_Register;
      pragma Volatile_Full_Access (CFG5);
      --  DMAC Write Protect Mode Register
      WPMR   : aliased DMAC_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  DMAC Write Protect Status Register
      WPSR   : aliased DMAC_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
   end record
     with Volatile;

   for DMAC_Peripheral use record
      GCFG   at 16#0# range 0 .. 31;
      EN     at 16#4# range 0 .. 31;
      SREQ   at 16#8# range 0 .. 31;
      CREQ   at 16#C# range 0 .. 31;
      LAST   at 16#10# range 0 .. 31;
      EBCIER at 16#18# range 0 .. 31;
      EBCIDR at 16#1C# range 0 .. 31;
      EBCIMR at 16#20# range 0 .. 31;
      EBCISR at 16#24# range 0 .. 31;
      CHER   at 16#28# range 0 .. 31;
      CHDR   at 16#2C# range 0 .. 31;
      CHSR   at 16#30# range 0 .. 31;
      SADDR0 at 16#3C# range 0 .. 31;
      DADDR0 at 16#40# range 0 .. 31;
      DSCR0  at 16#44# range 0 .. 31;
      CTRLA0 at 16#48# range 0 .. 31;
      CTRLB0 at 16#4C# range 0 .. 31;
      CFG0   at 16#50# range 0 .. 31;
      SADDR1 at 16#64# range 0 .. 31;
      DADDR1 at 16#68# range 0 .. 31;
      DSCR1  at 16#6C# range 0 .. 31;
      CTRLA1 at 16#70# range 0 .. 31;
      CTRLB1 at 16#74# range 0 .. 31;
      CFG1   at 16#78# range 0 .. 31;
      SADDR2 at 16#8C# range 0 .. 31;
      DADDR2 at 16#90# range 0 .. 31;
      DSCR2  at 16#94# range 0 .. 31;
      CTRLA2 at 16#98# range 0 .. 31;
      CTRLB2 at 16#9C# range 0 .. 31;
      CFG2   at 16#A0# range 0 .. 31;
      SADDR3 at 16#B4# range 0 .. 31;
      DADDR3 at 16#B8# range 0 .. 31;
      DSCR3  at 16#BC# range 0 .. 31;
      CTRLA3 at 16#C0# range 0 .. 31;
      CTRLB3 at 16#C4# range 0 .. 31;
      CFG3   at 16#C8# range 0 .. 31;
      SADDR4 at 16#DC# range 0 .. 31;
      DADDR4 at 16#E0# range 0 .. 31;
      DSCR4  at 16#E4# range 0 .. 31;
      CTRLA4 at 16#E8# range 0 .. 31;
      CTRLB4 at 16#EC# range 0 .. 31;
      CFG4   at 16#F0# range 0 .. 31;
      SADDR5 at 16#104# range 0 .. 31;
      DADDR5 at 16#108# range 0 .. 31;
      DSCR5  at 16#10C# range 0 .. 31;
      CTRLA5 at 16#110# range 0 .. 31;
      CTRLB5 at 16#114# range 0 .. 31;
      CFG5   at 16#118# range 0 .. 31;
      WPMR   at 16#1E4# range 0 .. 31;
      WPSR   at 16#1E8# range 0 .. 31;
   end record;

   --  DMA Controller
   DMAC_Periph : aliased DMAC_Peripheral
     with Import, Address => DMAC_Base;

end ATSAM3X8E.DMAC;
