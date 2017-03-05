--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Synchronous Serial Controller
package ATSAM3X8E.SSC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_RXEN_Field is ATSAM3X8E.Bit;
   subtype CR_RXDIS_Field is ATSAM3X8E.Bit;
   subtype CR_TXEN_Field is ATSAM3X8E.Bit;
   subtype CR_TXDIS_Field is ATSAM3X8E.Bit;
   subtype CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  Write-only. Receive Enable
      RXEN           : CR_RXEN_Field := 16#0#;
      --  Write-only. Receive Disable
      RXDIS          : CR_RXDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmit Enable
      TXEN           : CR_TXEN_Field := 16#0#;
      --  Write-only. Transmit Disable
      TXDIS          : CR_TXDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Software Reset
      SWRST          : CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RXEN           at 0 range 0 .. 0;
      RXDIS          at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXEN           at 0 range 8 .. 8;
      TXDIS          at 0 range 9 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      SWRST          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- CMR_Register --
   ------------------

   subtype CMR_DIV_Field is ATSAM3X8E.UInt12;

   --  Clock Mode Register
   type CMR_Register is record
      --  Clock Divider
      DIV            : CMR_DIV_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMR_Register use record
      DIV            at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -------------------
   -- RCMR_Register --
   -------------------

   --  Receive Clock Selection
   type CKS_Field is
     (
      --  Divided Clock
      Mck,
      --  TK Clock signal
      Tk,
      --  RK pin
      Rk)
     with Size => 2;
   for CKS_Field use
     (Mck => 0,
      Tk => 1,
      Rk => 2);

   --  Receive Clock Output Mode Selection
   type CKO_Field is
     (
      --  None
      None,
      --  Continuous Receive Clock
      Continuous,
      --  Receive Clock only during data transfers
      Transfer)
     with Size => 3;
   for CKO_Field use
     (None => 0,
      Continuous => 1,
      Transfer => 2);

   subtype RCMR_CKI_Field is ATSAM3X8E.Bit;

   --  Receive Clock Gating Selection
   type CKG_Field is
     (
      --  None
      None,
      --  Continuous Receive Clock
      Continuous,
      --  Receive Clock only during data transfers
      Transfer)
     with Size => 2;
   for CKG_Field use
     (None => 0,
      Continuous => 1,
      Transfer => 2);

   --  Receive Start Selection
   type START_Field is
     (
      --  Continuous, as soon as the receiver is enabled, and immediately after
      --  the end of transfer of the previous data.
      Continuous,
      --  Transmit start
      Transmit,
      --  Detection of a low level on RF signal
      Rf_Low,
      --  Detection of a high level on RF signal
      Rf_High,
      --  Detection of a falling edge on RF signal
      Rf_Falling,
      --  Detection of a rising edge on RF signal
      Rf_Rising,
      --  Detection of any level change on RF signal
      Rf_Level,
      --  Detection of any edge on RF signal
      Rf_Edge,
      --  Compare 0
      Cmp_0)
     with Size => 4;
   for START_Field use
     (Continuous => 0,
      Transmit => 1,
      Rf_Low => 2,
      Rf_High => 3,
      Rf_Falling => 4,
      Rf_Rising => 5,
      Rf_Level => 6,
      Rf_Edge => 7,
      Cmp_0 => 8);

   subtype RCMR_STOP_Field is ATSAM3X8E.Bit;
   subtype RCMR_STTDLY_Field is ATSAM3X8E.Byte;
   subtype RCMR_PERIOD_Field is ATSAM3X8E.Byte;

   --  Receive Clock Mode Register
   type RCMR_Register is record
      --  Receive Clock Selection
      CKS            : CKS_Field := Mck;
      --  Receive Clock Output Mode Selection
      CKO            : CKO_Field := None;
      --  Receive Clock Inversion
      CKI            : RCMR_CKI_Field := 16#0#;
      --  Receive Clock Gating Selection
      CKG            : CKG_Field := None;
      --  Receive Start Selection
      START          : START_Field := Continuous;
      --  Receive Stop Selection
      STOP           : RCMR_STOP_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Receive Start Delay
      STTDLY         : RCMR_STTDLY_Field := 16#0#;
      --  Receive Period Divider Selection
      PERIOD         : RCMR_PERIOD_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RCMR_Register use record
      CKS            at 0 range 0 .. 1;
      CKO            at 0 range 2 .. 4;
      CKI            at 0 range 5 .. 5;
      CKG            at 0 range 6 .. 7;
      START          at 0 range 8 .. 11;
      STOP           at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      STTDLY         at 0 range 16 .. 23;
      PERIOD         at 0 range 24 .. 31;
   end record;

   -------------------
   -- RFMR_Register --
   -------------------

   subtype RFMR_DATLEN_Field is ATSAM3X8E.UInt5;
   subtype RFMR_LOOP_Field is ATSAM3X8E.Bit;
   subtype RFMR_MSBF_Field is ATSAM3X8E.Bit;
   subtype RFMR_DATNB_Field is ATSAM3X8E.UInt4;
   subtype RFMR_FSLEN_Field is ATSAM3X8E.UInt4;

   --  Receive Frame Sync Output Selection
   type FSOS_Field is
     (
      --  None
      None,
      --  Negative Pulse
      Negative,
      --  Positive Pulse
      Positive,
      --  Driven Low during data transfer
      Low,
      --  Driven High during data transfer
      High,
      --  Toggling at each start of data transfer
      Toggling)
     with Size => 3;
   for FSOS_Field use
     (None => 0,
      Negative => 1,
      Positive => 2,
      Low => 3,
      High => 4,
      Toggling => 5);

   --  Frame Sync Edge Detection
   type FSEDGE_Field is
     (
      --  Positive Edge Detection
      Positive,
      --  Negative Edge Detection
      Negative)
     with Size => 1;
   for FSEDGE_Field use
     (Positive => 0,
      Negative => 1);

   subtype RFMR_FSLEN_EXT_Field is ATSAM3X8E.UInt4;

   --  Receive Frame Mode Register
   type RFMR_Register is record
      --  Data Length
      DATLEN         : RFMR_DATLEN_Field := 16#0#;
      --  Loop Mode
      LOOP_k         : RFMR_LOOP_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit := 16#0#;
      --  Most Significant Bit First
      MSBF           : RFMR_MSBF_Field := 16#0#;
      --  Data Number per Frame
      DATNB          : RFMR_DATNB_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Receive Frame Sync Length
      FSLEN          : RFMR_FSLEN_Field := 16#0#;
      --  Receive Frame Sync Output Selection
      FSOS           : FSOS_Field := None;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  Frame Sync Edge Detection
      FSEDGE         : FSEDGE_Field := Positive;
      --  unspecified
      Reserved_25_27 : ATSAM3X8E.UInt3 := 16#0#;
      --  FSLEN Field Extension
      FSLEN_EXT      : RFMR_FSLEN_EXT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RFMR_Register use record
      DATLEN         at 0 range 0 .. 4;
      LOOP_k         at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      MSBF           at 0 range 7 .. 7;
      DATNB          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      FSLEN          at 0 range 16 .. 19;
      FSOS           at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      FSEDGE         at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      FSLEN_EXT      at 0 range 28 .. 31;
   end record;

   -------------------
   -- TCMR_Register --
   -------------------

   subtype TCMR_CKI_Field is ATSAM3X8E.Bit;

   --  Transmit Start Selection
   type START_Field_1 is
     (
      --  Continuous, as soon as a word is written in the SSC_THR Register (if
      --  Transmit is enabled), and immediately after the end of transfer of
      --  the previous data.
      Continuous,
      --  Receive start
      Receive,
      --  Detection of a low level on TF signal
      Rf_Low,
      --  Detection of a high level on TF signal
      Rf_High,
      --  Detection of a falling edge on TF signal
      Rf_Falling,
      --  Detection of a rising edge on TF signal
      Rf_Rising,
      --  Detection of any level change on TF signal
      Rf_Level,
      --  Detection of any edge on TF signal
      Rf_Edge,
      --  Compare 0
      Cmp_0)
     with Size => 4;
   for START_Field_1 use
     (Continuous => 0,
      Receive => 1,
      Rf_Low => 2,
      Rf_High => 3,
      Rf_Falling => 4,
      Rf_Rising => 5,
      Rf_Level => 6,
      Rf_Edge => 7,
      Cmp_0 => 8);

   subtype TCMR_STTDLY_Field is ATSAM3X8E.Byte;
   subtype TCMR_PERIOD_Field is ATSAM3X8E.Byte;

   --  Transmit Clock Mode Register
   type TCMR_Register is record
      --  Transmit Clock Selection
      CKS            : CKS_Field := Mck;
      --  Transmit Clock Output Mode Selection
      CKO            : CKO_Field := None;
      --  Transmit Clock Inversion
      CKI            : TCMR_CKI_Field := 16#0#;
      --  Transmit Clock Gating Selection
      CKG            : CKG_Field := None;
      --  Transmit Start Selection
      START          : START_Field_1 := Continuous;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Transmit Start Delay
      STTDLY         : TCMR_STTDLY_Field := 16#0#;
      --  Transmit Period Divider Selection
      PERIOD         : TCMR_PERIOD_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TCMR_Register use record
      CKS            at 0 range 0 .. 1;
      CKO            at 0 range 2 .. 4;
      CKI            at 0 range 5 .. 5;
      CKG            at 0 range 6 .. 7;
      START          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      STTDLY         at 0 range 16 .. 23;
      PERIOD         at 0 range 24 .. 31;
   end record;

   -------------------
   -- TFMR_Register --
   -------------------

   subtype TFMR_DATLEN_Field is ATSAM3X8E.UInt5;
   subtype TFMR_DATDEF_Field is ATSAM3X8E.Bit;
   subtype TFMR_MSBF_Field is ATSAM3X8E.Bit;
   subtype TFMR_DATNB_Field is ATSAM3X8E.UInt4;
   subtype TFMR_FSLEN_Field is ATSAM3X8E.UInt4;
   subtype TFMR_FSDEN_Field is ATSAM3X8E.Bit;
   subtype TFMR_FSLEN_EXT_Field is ATSAM3X8E.UInt4;

   --  Transmit Frame Mode Register
   type TFMR_Register is record
      --  Data Length
      DATLEN         : TFMR_DATLEN_Field := 16#0#;
      --  Data Default Value
      DATDEF         : TFMR_DATDEF_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit := 16#0#;
      --  Most Significant Bit First
      MSBF           : TFMR_MSBF_Field := 16#0#;
      --  Data Number per frame
      DATNB          : TFMR_DATNB_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Transmit Frame Sync Length
      FSLEN          : TFMR_FSLEN_Field := 16#0#;
      --  Transmit Frame Sync Output Selection
      FSOS           : FSOS_Field := None;
      --  Frame Sync Data Enable
      FSDEN          : TFMR_FSDEN_Field := 16#0#;
      --  Frame Sync Edge Detection
      FSEDGE         : FSEDGE_Field := Positive;
      --  unspecified
      Reserved_25_27 : ATSAM3X8E.UInt3 := 16#0#;
      --  FSLEN Field Extension
      FSLEN_EXT      : TFMR_FSLEN_EXT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TFMR_Register use record
      DATLEN         at 0 range 0 .. 4;
      DATDEF         at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      MSBF           at 0 range 7 .. 7;
      DATNB          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      FSLEN          at 0 range 16 .. 19;
      FSOS           at 0 range 20 .. 22;
      FSDEN          at 0 range 23 .. 23;
      FSEDGE         at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      FSLEN_EXT      at 0 range 28 .. 31;
   end record;

   -------------------
   -- RSHR_Register --
   -------------------

   subtype RSHR_RSDAT_Field is ATSAM3X8E.Short;

   --  Receive Sync. Holding Register
   type RSHR_Register is record
      --  Read-only. Receive Synchronization Data
      RSDAT          : RSHR_RSDAT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RSHR_Register use record
      RSDAT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- TSHR_Register --
   -------------------

   subtype TSHR_TSDAT_Field is ATSAM3X8E.Short;

   --  Transmit Sync. Holding Register
   type TSHR_Register is record
      --  Transmit Synchronization Data
      TSDAT          : TSHR_TSDAT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TSHR_Register use record
      TSDAT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- RC0R_Register --
   -------------------

   subtype RC0R_CP0_Field is ATSAM3X8E.Short;

   --  Receive Compare 0 Register
   type RC0R_Register is record
      --  Receive Compare Data 0
      CP0            : RC0R_CP0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RC0R_Register use record
      CP0            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- RC1R_Register --
   -------------------

   subtype RC1R_CP1_Field is ATSAM3X8E.Short;

   --  Receive Compare 1 Register
   type RC1R_Register is record
      --  Receive Compare Data 1
      CP1            : RC1R_CP1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RC1R_Register use record
      CP1            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_OVRUN_Field is ATSAM3X8E.Bit;

   -----------
   -- SR.CP --
   -----------

   --  SR_CP array element
   subtype SR_CP_Element is ATSAM3X8E.Bit;

   --  SR_CP array
   type SR_CP_Field_Array is array (0 .. 1) of SR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SR_CP
   type SR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : SR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SR_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SR_TXSYN_Field is ATSAM3X8E.Bit;
   subtype SR_RXSYN_Field is ATSAM3X8E.Bit;
   subtype SR_TXEN_Field is ATSAM3X8E.Bit;
   subtype SR_RXEN_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. Transmit Ready
      TXRDY          : SR_TXRDY_Field := 16#0#;
      --  Read-only. Transmit Empty
      TXEMPTY        : SR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2;
      --  Read-only. Receive Ready
      RXRDY          : SR_RXRDY_Field := 16#0#;
      --  Read-only. Receive Overrun
      OVRUN          : SR_OVRUN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Compare 0
      CP             : SR_CP_Field := (As_Array => False, Val => 16#0#);
      --  Read-only. Transmit Sync
      TXSYN          : SR_TXSYN_Field := 16#0#;
      --  Read-only. Receive Sync
      RXSYN          : SR_RXSYN_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4;
      --  Read-only. Transmit Enable
      TXEN           : SR_TXEN_Field := 16#0#;
      --  Read-only. Receive Enable
      RXEN           : SR_RXEN_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : ATSAM3X8E.UInt14;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      TXRDY          at 0 range 0 .. 0;
      TXEMPTY        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXRDY          at 0 range 4 .. 4;
      OVRUN          at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CP             at 0 range 8 .. 9;
      TXSYN          at 0 range 10 .. 10;
      RXSYN          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TXEN           at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_OVRUN_Field is ATSAM3X8E.Bit;

   ------------
   -- IER.CP --
   ------------

   --  IER_CP array element
   subtype IER_CP_Element is ATSAM3X8E.Bit;

   --  IER_CP array
   type IER_CP_Field_Array is array (0 .. 1) of IER_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for IER_CP
   type IER_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : IER_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for IER_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype IER_TXSYN_Field is ATSAM3X8E.Bit;
   subtype IER_RXSYN_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Transmit Ready Interrupt Enable
      TXRDY          : IER_TXRDY_Field := 16#0#;
      --  Write-only. Transmit Empty Interrupt Enable
      TXEMPTY        : IER_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Receive Ready Interrupt Enable
      RXRDY          : IER_RXRDY_Field := 16#0#;
      --  Write-only. Receive Overrun Interrupt Enable
      OVRUN          : IER_OVRUN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Compare 0 Interrupt Enable
      CP             : IER_CP_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Tx Sync Interrupt Enable
      TXSYN          : IER_TXSYN_Field := 16#0#;
      --  Write-only. Rx Sync Interrupt Enable
      RXSYN          : IER_RXSYN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      TXRDY          at 0 range 0 .. 0;
      TXEMPTY        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXRDY          at 0 range 4 .. 4;
      OVRUN          at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CP             at 0 range 8 .. 9;
      TXSYN          at 0 range 10 .. 10;
      RXSYN          at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_OVRUN_Field is ATSAM3X8E.Bit;

   ------------
   -- IDR.CP --
   ------------

   --  IDR_CP array element
   subtype IDR_CP_Element is ATSAM3X8E.Bit;

   --  IDR_CP array
   type IDR_CP_Field_Array is array (0 .. 1) of IDR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for IDR_CP
   type IDR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : IDR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for IDR_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype IDR_TXSYN_Field is ATSAM3X8E.Bit;
   subtype IDR_RXSYN_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Transmit Ready Interrupt Disable
      TXRDY          : IDR_TXRDY_Field := 16#0#;
      --  Write-only. Transmit Empty Interrupt Disable
      TXEMPTY        : IDR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Receive Ready Interrupt Disable
      RXRDY          : IDR_RXRDY_Field := 16#0#;
      --  Write-only. Receive Overrun Interrupt Disable
      OVRUN          : IDR_OVRUN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Compare 0 Interrupt Disable
      CP             : IDR_CP_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Tx Sync Interrupt Enable
      TXSYN          : IDR_TXSYN_Field := 16#0#;
      --  Write-only. Rx Sync Interrupt Enable
      RXSYN          : IDR_RXSYN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      TXRDY          at 0 range 0 .. 0;
      TXEMPTY        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXRDY          at 0 range 4 .. 4;
      OVRUN          at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CP             at 0 range 8 .. 9;
      TXSYN          at 0 range 10 .. 10;
      RXSYN          at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_OVRUN_Field is ATSAM3X8E.Bit;

   ------------
   -- IMR.CP --
   ------------

   --  IMR_CP array element
   subtype IMR_CP_Element is ATSAM3X8E.Bit;

   --  IMR_CP array
   type IMR_CP_Field_Array is array (0 .. 1) of IMR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for IMR_CP
   type IMR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : IMR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for IMR_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype IMR_TXSYN_Field is ATSAM3X8E.Bit;
   subtype IMR_RXSYN_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Transmit Ready Interrupt Mask
      TXRDY          : IMR_TXRDY_Field := 16#0#;
      --  Read-only. Transmit Empty Interrupt Mask
      TXEMPTY        : IMR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2;
      --  Read-only. Receive Ready Interrupt Mask
      RXRDY          : IMR_RXRDY_Field := 16#0#;
      --  Read-only. Receive Overrun Interrupt Mask
      OVRUN          : IMR_OVRUN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Compare 0 Interrupt Mask
      CP             : IMR_CP_Field := (As_Array => False, Val => 16#0#);
      --  Read-only. Tx Sync Interrupt Mask
      TXSYN          : IMR_TXSYN_Field := 16#0#;
      --  Read-only. Rx Sync Interrupt Mask
      RXSYN          : IMR_RXSYN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      TXRDY          at 0 range 0 .. 0;
      TXEMPTY        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RXRDY          at 0 range 4 .. 4;
      OVRUN          at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CP             at 0 range 8 .. 9;
      TXSYN          at 0 range 10 .. 10;
      RXSYN          at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
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

   -----------------
   -- Peripherals --
   -----------------

   --  Synchronous Serial Controller
   type SSC_Peripheral is record
      --  Control Register
      CR   : CR_Register;
      --  Clock Mode Register
      CMR  : CMR_Register;
      --  Receive Clock Mode Register
      RCMR : RCMR_Register;
      --  Receive Frame Mode Register
      RFMR : RFMR_Register;
      --  Transmit Clock Mode Register
      TCMR : TCMR_Register;
      --  Transmit Frame Mode Register
      TFMR : TFMR_Register;
      --  Receive Holding Register
      RHR  : ATSAM3X8E.Word;
      --  Transmit Holding Register
      THR  : ATSAM3X8E.Word;
      --  Receive Sync. Holding Register
      RSHR : RSHR_Register;
      --  Transmit Sync. Holding Register
      TSHR : TSHR_Register;
      --  Receive Compare 0 Register
      RC0R : RC0R_Register;
      --  Receive Compare 1 Register
      RC1R : RC1R_Register;
      --  Status Register
      SR   : SR_Register;
      --  Interrupt Enable Register
      IER  : IER_Register;
      --  Interrupt Disable Register
      IDR  : IDR_Register;
      --  Interrupt Mask Register
      IMR  : IMR_Register;
      --  Write Protect Mode Register
      WPMR : WPMR_Register;
      --  Write Protect Status Register
      WPSR : WPSR_Register;
   end record
     with Volatile;

   for SSC_Peripheral use record
      CR   at 0 range 0 .. 31;
      CMR  at 4 range 0 .. 31;
      RCMR at 16 range 0 .. 31;
      RFMR at 20 range 0 .. 31;
      TCMR at 24 range 0 .. 31;
      TFMR at 28 range 0 .. 31;
      RHR  at 32 range 0 .. 31;
      THR  at 36 range 0 .. 31;
      RSHR at 48 range 0 .. 31;
      TSHR at 52 range 0 .. 31;
      RC0R at 56 range 0 .. 31;
      RC1R at 60 range 0 .. 31;
      SR   at 64 range 0 .. 31;
      IER  at 68 range 0 .. 31;
      IDR  at 72 range 0 .. 31;
      IMR  at 76 range 0 .. 31;
      WPMR at 228 range 0 .. 31;
      WPSR at 232 range 0 .. 31;
   end record;

   --  Synchronous Serial Controller
   SSC_Periph : aliased SSC_Peripheral
     with Import, Address => SSC_Base;

end ATSAM3X8E.SSC;
