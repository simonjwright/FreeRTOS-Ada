pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  Synchronous Serial Controller
package ATSAM3X8E.SSC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SSC_CR_RXEN_Field is ATSAM3X8E.Bit;
   subtype SSC_CR_RXDIS_Field is ATSAM3X8E.Bit;
   subtype SSC_CR_TXEN_Field is ATSAM3X8E.Bit;
   subtype SSC_CR_TXDIS_Field is ATSAM3X8E.Bit;
   subtype SSC_CR_SWRST_Field is ATSAM3X8E.Bit;

   --  Control Register
   type SSC_CR_Register is record
      --  Write-only. Receive Enable
      RXEN           : SSC_CR_RXEN_Field := 16#0#;
      --  Write-only. Receive Disable
      RXDIS          : SSC_CR_RXDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmit Enable
      TXEN           : SSC_CR_TXEN_Field := 16#0#;
      --  Write-only. Transmit Disable
      TXDIS          : SSC_CR_TXDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Software Reset
      SWRST          : SSC_CR_SWRST_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_CR_Register use record
      RXEN           at 0 range 0 .. 0;
      RXDIS          at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXEN           at 0 range 8 .. 8;
      TXDIS          at 0 range 9 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      SWRST          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SSC_CMR_DIV_Field is ATSAM3X8E.UInt12;

   --  Clock Mode Register
   type SSC_CMR_Register is record
      --  Clock Divider
      DIV            : SSC_CMR_DIV_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_CMR_Register use record
      DIV            at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  Receive Clock Selection
   type RCMR_CKS_Field is
     (--  Divided Clock
      MCK,
      --  TK Clock signal
      TK,
      --  RK pin
      RK)
     with Size => 2;
   for RCMR_CKS_Field use
     (MCK => 0,
      TK => 1,
      RK => 2);

   --  Receive Clock Output Mode Selection
   type RCMR_CKO_Field is
     (--  None
      NONE,
      --  Continuous Receive Clock
      CONTINUOUS,
      --  Receive Clock only during data transfers
      TRANSFER)
     with Size => 3;
   for RCMR_CKO_Field use
     (NONE => 0,
      CONTINUOUS => 1,
      TRANSFER => 2);

   subtype SSC_RCMR_CKI_Field is ATSAM3X8E.Bit;

   --  Receive Clock Gating Selection
   type RCMR_CKG_Field is
     (--  None
      NONE,
      --  Continuous Receive Clock
      CONTINUOUS,
      --  Receive Clock only during data transfers
      TRANSFER)
     with Size => 2;
   for RCMR_CKG_Field use
     (NONE => 0,
      CONTINUOUS => 1,
      TRANSFER => 2);

   --  Receive Start Selection
   type RCMR_START_Field is
     (--  Continuous, as soon as the receiver is enabled, and immediately after the
--  end of transfer of the previous data.
      CONTINUOUS,
      --  Transmit start
      TRANSMIT,
      --  Detection of a low level on RF signal
      RF_LOW,
      --  Detection of a high level on RF signal
      RF_HIGH,
      --  Detection of a falling edge on RF signal
      RF_FALLING,
      --  Detection of a rising edge on RF signal
      RF_RISING,
      --  Detection of any level change on RF signal
      RF_LEVEL,
      --  Detection of any edge on RF signal
      RF_EDGE,
      --  Compare 0
      CMP_0)
     with Size => 4;
   for RCMR_START_Field use
     (CONTINUOUS => 0,
      TRANSMIT => 1,
      RF_LOW => 2,
      RF_HIGH => 3,
      RF_FALLING => 4,
      RF_RISING => 5,
      RF_LEVEL => 6,
      RF_EDGE => 7,
      CMP_0 => 8);

   subtype SSC_RCMR_STOP_Field is ATSAM3X8E.Bit;
   subtype SSC_RCMR_STTDLY_Field is ATSAM3X8E.Byte;
   subtype SSC_RCMR_PERIOD_Field is ATSAM3X8E.Byte;

   --  Receive Clock Mode Register
   type SSC_RCMR_Register is record
      --  Receive Clock Selection
      CKS            : RCMR_CKS_Field := ATSAM3X8E.SSC.MCK;
      --  Receive Clock Output Mode Selection
      CKO            : RCMR_CKO_Field := ATSAM3X8E.SSC.NONE;
      --  Receive Clock Inversion
      CKI            : SSC_RCMR_CKI_Field := 16#0#;
      --  Receive Clock Gating Selection
      CKG            : RCMR_CKG_Field := ATSAM3X8E.SSC.NONE;
      --  Receive Start Selection
      START          : RCMR_START_Field := ATSAM3X8E.SSC.CONTINUOUS;
      --  Receive Stop Selection
      STOP           : SSC_RCMR_STOP_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Receive Start Delay
      STTDLY         : SSC_RCMR_STTDLY_Field := 16#0#;
      --  Receive Period Divider Selection
      PERIOD         : SSC_RCMR_PERIOD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_RCMR_Register use record
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

   subtype SSC_RFMR_DATLEN_Field is ATSAM3X8E.UInt5;
   subtype SSC_RFMR_LOOP_Field is ATSAM3X8E.Bit;
   subtype SSC_RFMR_MSBF_Field is ATSAM3X8E.Bit;
   subtype SSC_RFMR_DATNB_Field is ATSAM3X8E.UInt4;
   subtype SSC_RFMR_FSLEN_Field is ATSAM3X8E.UInt4;

   --  Receive Frame Sync Output Selection
   type RFMR_FSOS_Field is
     (--  None
      NONE,
      --  Negative Pulse
      NEGATIVE,
      --  Positive Pulse
      POSITIVE,
      --  Driven Low during data transfer
      LOW,
      --  Driven High during data transfer
      HIGH,
      --  Toggling at each start of data transfer
      TOGGLING)
     with Size => 3;
   for RFMR_FSOS_Field use
     (NONE => 0,
      NEGATIVE => 1,
      POSITIVE => 2,
      LOW => 3,
      HIGH => 4,
      TOGGLING => 5);

   --  Frame Sync Edge Detection
   type RFMR_FSEDGE_Field is
     (--  Positive Edge Detection
      POSITIVE,
      --  Negative Edge Detection
      NEGATIVE)
     with Size => 1;
   for RFMR_FSEDGE_Field use
     (POSITIVE => 0,
      NEGATIVE => 1);

   subtype SSC_RFMR_FSLEN_EXT_Field is ATSAM3X8E.UInt4;

   --  Receive Frame Mode Register
   type SSC_RFMR_Register is record
      --  Data Length
      DATLEN         : SSC_RFMR_DATLEN_Field := 16#0#;
      --  Loop Mode
      LOOP_k         : SSC_RFMR_LOOP_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit := 16#0#;
      --  Most Significant Bit First
      MSBF           : SSC_RFMR_MSBF_Field := 16#0#;
      --  Data Number per Frame
      DATNB          : SSC_RFMR_DATNB_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Receive Frame Sync Length
      FSLEN          : SSC_RFMR_FSLEN_Field := 16#0#;
      --  Receive Frame Sync Output Selection
      FSOS           : RFMR_FSOS_Field := ATSAM3X8E.SSC.NONE;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  Frame Sync Edge Detection
      FSEDGE         : RFMR_FSEDGE_Field := ATSAM3X8E.SSC.POSITIVE;
      --  unspecified
      Reserved_25_27 : ATSAM3X8E.UInt3 := 16#0#;
      --  FSLEN Field Extension
      FSLEN_EXT      : SSC_RFMR_FSLEN_EXT_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_RFMR_Register use record
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

   --  Transmit Clock Selection
   type TCMR_CKS_Field is
     (--  Divided Clock
      MCK,
      --  TK Clock signal
      TK,
      --  RK pin
      RK)
     with Size => 2;
   for TCMR_CKS_Field use
     (MCK => 0,
      TK => 1,
      RK => 2);

   --  Transmit Clock Output Mode Selection
   type TCMR_CKO_Field is
     (--  None
      NONE,
      --  Continuous Receive Clock
      CONTINUOUS,
      --  Transmit Clock only during data transfers
      TRANSFER)
     with Size => 3;
   for TCMR_CKO_Field use
     (NONE => 0,
      CONTINUOUS => 1,
      TRANSFER => 2);

   subtype SSC_TCMR_CKI_Field is ATSAM3X8E.Bit;

   --  Transmit Clock Gating Selection
   type TCMR_CKG_Field is
     (--  None
      NONE,
      --  Transmit Clock enabled only if TF Low
      CONTINUOUS,
      --  Transmit Clock enabled only if TF High
      TRANSFER)
     with Size => 2;
   for TCMR_CKG_Field use
     (NONE => 0,
      CONTINUOUS => 1,
      TRANSFER => 2);

   --  Transmit Start Selection
   type TCMR_START_Field is
     (--  Continuous, as soon as a word is written in the SSC_THR Register (if
--  Transmit is enabled), and immediately after the end of transfer of the
--  previous data.
      CONTINUOUS,
      --  Receive start
      RECEIVE,
      --  Detection of a low level on TF signal
      RF_LOW,
      --  Detection of a high level on TF signal
      RF_HIGH,
      --  Detection of a falling edge on TF signal
      RF_FALLING,
      --  Detection of a rising edge on TF signal
      RF_RISING,
      --  Detection of any level change on TF signal
      RF_LEVEL,
      --  Detection of any edge on TF signal
      RF_EDGE,
      --  Compare 0
      CMP_0)
     with Size => 4;
   for TCMR_START_Field use
     (CONTINUOUS => 0,
      RECEIVE => 1,
      RF_LOW => 2,
      RF_HIGH => 3,
      RF_FALLING => 4,
      RF_RISING => 5,
      RF_LEVEL => 6,
      RF_EDGE => 7,
      CMP_0 => 8);

   subtype SSC_TCMR_STTDLY_Field is ATSAM3X8E.Byte;
   subtype SSC_TCMR_PERIOD_Field is ATSAM3X8E.Byte;

   --  Transmit Clock Mode Register
   type SSC_TCMR_Register is record
      --  Transmit Clock Selection
      CKS            : TCMR_CKS_Field := ATSAM3X8E.SSC.MCK;
      --  Transmit Clock Output Mode Selection
      CKO            : TCMR_CKO_Field := ATSAM3X8E.SSC.NONE;
      --  Transmit Clock Inversion
      CKI            : SSC_TCMR_CKI_Field := 16#0#;
      --  Transmit Clock Gating Selection
      CKG            : TCMR_CKG_Field := ATSAM3X8E.SSC.NONE;
      --  Transmit Start Selection
      START          : TCMR_START_Field := ATSAM3X8E.SSC.CONTINUOUS;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Transmit Start Delay
      STTDLY         : SSC_TCMR_STTDLY_Field := 16#0#;
      --  Transmit Period Divider Selection
      PERIOD         : SSC_TCMR_PERIOD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_TCMR_Register use record
      CKS            at 0 range 0 .. 1;
      CKO            at 0 range 2 .. 4;
      CKI            at 0 range 5 .. 5;
      CKG            at 0 range 6 .. 7;
      START          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      STTDLY         at 0 range 16 .. 23;
      PERIOD         at 0 range 24 .. 31;
   end record;

   subtype SSC_TFMR_DATLEN_Field is ATSAM3X8E.UInt5;
   subtype SSC_TFMR_DATDEF_Field is ATSAM3X8E.Bit;
   subtype SSC_TFMR_MSBF_Field is ATSAM3X8E.Bit;
   subtype SSC_TFMR_DATNB_Field is ATSAM3X8E.UInt4;
   subtype SSC_TFMR_FSLEN_Field is ATSAM3X8E.UInt4;

   --  Transmit Frame Sync Output Selection
   type TFMR_FSOS_Field is
     (--  None
      NONE,
      --  Negative Pulse
      NEGATIVE,
      --  Positive Pulse
      POSITIVE,
      --  Driven Low during data transfer
      LOW,
      --  Driven High during data transfer
      HIGH,
      --  Toggling at each start of data transfer
      TOGGLING)
     with Size => 3;
   for TFMR_FSOS_Field use
     (NONE => 0,
      NEGATIVE => 1,
      POSITIVE => 2,
      LOW => 3,
      HIGH => 4,
      TOGGLING => 5);

   subtype SSC_TFMR_FSDEN_Field is ATSAM3X8E.Bit;

   --  Frame Sync Edge Detection
   type TFMR_FSEDGE_Field is
     (--  Positive Edge Detection
      POSITIVE,
      --  Negative Edge Detection
      NEGATIVE)
     with Size => 1;
   for TFMR_FSEDGE_Field use
     (POSITIVE => 0,
      NEGATIVE => 1);

   subtype SSC_TFMR_FSLEN_EXT_Field is ATSAM3X8E.UInt4;

   --  Transmit Frame Mode Register
   type SSC_TFMR_Register is record
      --  Data Length
      DATLEN         : SSC_TFMR_DATLEN_Field := 16#0#;
      --  Data Default Value
      DATDEF         : SSC_TFMR_DATDEF_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : ATSAM3X8E.Bit := 16#0#;
      --  Most Significant Bit First
      MSBF           : SSC_TFMR_MSBF_Field := 16#0#;
      --  Data Number per frame
      DATNB          : SSC_TFMR_DATNB_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4 := 16#0#;
      --  Transmit Frame Sync Length
      FSLEN          : SSC_TFMR_FSLEN_Field := 16#0#;
      --  Transmit Frame Sync Output Selection
      FSOS           : TFMR_FSOS_Field := ATSAM3X8E.SSC.NONE;
      --  Frame Sync Data Enable
      FSDEN          : SSC_TFMR_FSDEN_Field := 16#0#;
      --  Frame Sync Edge Detection
      FSEDGE         : TFMR_FSEDGE_Field := ATSAM3X8E.SSC.POSITIVE;
      --  unspecified
      Reserved_25_27 : ATSAM3X8E.UInt3 := 16#0#;
      --  FSLEN Field Extension
      FSLEN_EXT      : SSC_TFMR_FSLEN_EXT_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_TFMR_Register use record
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

   subtype SSC_RSHR_RSDAT_Field is ATSAM3X8E.UInt16;

   --  Receive Sync. Holding Register
   type SSC_RSHR_Register is record
      --  Read-only. Receive Synchronization Data
      RSDAT          : SSC_RSHR_RSDAT_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_RSHR_Register use record
      RSDAT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SSC_TSHR_TSDAT_Field is ATSAM3X8E.UInt16;

   --  Transmit Sync. Holding Register
   type SSC_TSHR_Register is record
      --  Transmit Synchronization Data
      TSDAT          : SSC_TSHR_TSDAT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_TSHR_Register use record
      TSDAT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SSC_RC0R_CP0_Field is ATSAM3X8E.UInt16;

   --  Receive Compare 0 Register
   type SSC_RC0R_Register is record
      --  Receive Compare Data 0
      CP0            : SSC_RC0R_CP0_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_RC0R_Register use record
      CP0            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SSC_RC1R_CP1_Field is ATSAM3X8E.UInt16;

   --  Receive Compare 1 Register
   type SSC_RC1R_Register is record
      --  Receive Compare Data 1
      CP1            : SSC_RC1R_CP1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_RC1R_Register use record
      CP1            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SSC_SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_SR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SSC_SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_SR_OVRUN_Field is ATSAM3X8E.Bit;
   --  SSC_SR_CP array element
   subtype SSC_SR_CP_Element is ATSAM3X8E.Bit;

   --  SSC_SR_CP array
   type SSC_SR_CP_Field_Array is array (0 .. 1) of SSC_SR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SSC_SR_CP
   type SSC_SR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : SSC_SR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SSC_SR_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SSC_SR_TXSYN_Field is ATSAM3X8E.Bit;
   subtype SSC_SR_RXSYN_Field is ATSAM3X8E.Bit;
   subtype SSC_SR_TXEN_Field is ATSAM3X8E.Bit;
   subtype SSC_SR_RXEN_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SSC_SR_Register is record
      --  Read-only. Transmit Ready
      TXRDY          : SSC_SR_TXRDY_Field;
      --  Read-only. Transmit Empty
      TXEMPTY        : SSC_SR_TXEMPTY_Field;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2;
      --  Read-only. Receive Ready
      RXRDY          : SSC_SR_RXRDY_Field;
      --  Read-only. Receive Overrun
      OVRUN          : SSC_SR_OVRUN_Field;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Compare 0
      CP             : SSC_SR_CP_Field;
      --  Read-only. Transmit Sync
      TXSYN          : SSC_SR_TXSYN_Field;
      --  Read-only. Receive Sync
      RXSYN          : SSC_SR_RXSYN_Field;
      --  unspecified
      Reserved_12_15 : ATSAM3X8E.UInt4;
      --  Read-only. Transmit Enable
      TXEN           : SSC_SR_TXEN_Field;
      --  Read-only. Receive Enable
      RXEN           : SSC_SR_RXEN_Field;
      --  unspecified
      Reserved_18_31 : ATSAM3X8E.UInt14;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_SR_Register use record
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

   subtype SSC_IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SSC_IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_IER_OVRUN_Field is ATSAM3X8E.Bit;
   --  SSC_IER_CP array element
   subtype SSC_IER_CP_Element is ATSAM3X8E.Bit;

   --  SSC_IER_CP array
   type SSC_IER_CP_Field_Array is array (0 .. 1) of SSC_IER_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SSC_IER_CP
   type SSC_IER_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : SSC_IER_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SSC_IER_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SSC_IER_TXSYN_Field is ATSAM3X8E.Bit;
   subtype SSC_IER_RXSYN_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type SSC_IER_Register is record
      --  Write-only. Transmit Ready Interrupt Enable
      TXRDY          : SSC_IER_TXRDY_Field := 16#0#;
      --  Write-only. Transmit Empty Interrupt Enable
      TXEMPTY        : SSC_IER_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Receive Ready Interrupt Enable
      RXRDY          : SSC_IER_RXRDY_Field := 16#0#;
      --  Write-only. Receive Overrun Interrupt Enable
      OVRUN          : SSC_IER_OVRUN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Compare 0 Interrupt Enable
      CP             : SSC_IER_CP_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Tx Sync Interrupt Enable
      TXSYN          : SSC_IER_TXSYN_Field := 16#0#;
      --  Write-only. Rx Sync Interrupt Enable
      RXSYN          : SSC_IER_RXSYN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_IER_Register use record
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

   subtype SSC_IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SSC_IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_IDR_OVRUN_Field is ATSAM3X8E.Bit;
   --  SSC_IDR_CP array element
   subtype SSC_IDR_CP_Element is ATSAM3X8E.Bit;

   --  SSC_IDR_CP array
   type SSC_IDR_CP_Field_Array is array (0 .. 1) of SSC_IDR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SSC_IDR_CP
   type SSC_IDR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : SSC_IDR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SSC_IDR_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SSC_IDR_TXSYN_Field is ATSAM3X8E.Bit;
   subtype SSC_IDR_RXSYN_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type SSC_IDR_Register is record
      --  Write-only. Transmit Ready Interrupt Disable
      TXRDY          : SSC_IDR_TXRDY_Field := 16#0#;
      --  Write-only. Transmit Empty Interrupt Disable
      TXEMPTY        : SSC_IDR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Receive Ready Interrupt Disable
      RXRDY          : SSC_IDR_RXRDY_Field := 16#0#;
      --  Write-only. Receive Overrun Interrupt Disable
      OVRUN          : SSC_IDR_OVRUN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Compare 0 Interrupt Disable
      CP             : SSC_IDR_CP_Field := (As_Array => False, Val => 16#0#);
      --  Write-only. Tx Sync Interrupt Enable
      TXSYN          : SSC_IDR_TXSYN_Field := 16#0#;
      --  Write-only. Rx Sync Interrupt Enable
      RXSYN          : SSC_IDR_RXSYN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_IDR_Register use record
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

   subtype SSC_IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SSC_IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SSC_IMR_OVRUN_Field is ATSAM3X8E.Bit;
   --  SSC_IMR_CP array element
   subtype SSC_IMR_CP_Element is ATSAM3X8E.Bit;

   --  SSC_IMR_CP array
   type SSC_IMR_CP_Field_Array is array (0 .. 1) of SSC_IMR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SSC_IMR_CP
   type SSC_IMR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  CP as an array
            Arr : SSC_IMR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SSC_IMR_CP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SSC_IMR_TXSYN_Field is ATSAM3X8E.Bit;
   subtype SSC_IMR_RXSYN_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type SSC_IMR_Register is record
      --  Read-only. Transmit Ready Interrupt Mask
      TXRDY          : SSC_IMR_TXRDY_Field;
      --  Read-only. Transmit Empty Interrupt Mask
      TXEMPTY        : SSC_IMR_TXEMPTY_Field;
      --  unspecified
      Reserved_2_3   : ATSAM3X8E.UInt2;
      --  Read-only. Receive Ready Interrupt Mask
      RXRDY          : SSC_IMR_RXRDY_Field;
      --  Read-only. Receive Overrun Interrupt Mask
      OVRUN          : SSC_IMR_OVRUN_Field;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2;
      --  Read-only. Compare 0 Interrupt Mask
      CP             : SSC_IMR_CP_Field;
      --  Read-only. Tx Sync Interrupt Mask
      TXSYN          : SSC_IMR_TXSYN_Field;
      --  Read-only. Rx Sync Interrupt Mask
      RXSYN          : SSC_IMR_RXSYN_Field;
      --  unspecified
      Reserved_12_31 : ATSAM3X8E.UInt20;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_IMR_Register use record
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

   subtype SSC_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype SSC_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type SSC_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : SSC_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : SSC_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype SSC_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype SSC_WPSR_WPVSRC_Field is ATSAM3X8E.UInt16;

   --  Write Protect Status Register
   type SSC_WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : SSC_WPSR_WPVS_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : SSC_WPSR_WPVSRC_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSC_WPSR_Register use record
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
      CR   : aliased SSC_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Clock Mode Register
      CMR  : aliased SSC_CMR_Register;
      pragma Volatile_Full_Access (CMR);
      --  Receive Clock Mode Register
      RCMR : aliased SSC_RCMR_Register;
      pragma Volatile_Full_Access (RCMR);
      --  Receive Frame Mode Register
      RFMR : aliased SSC_RFMR_Register;
      pragma Volatile_Full_Access (RFMR);
      --  Transmit Clock Mode Register
      TCMR : aliased SSC_TCMR_Register;
      pragma Volatile_Full_Access (TCMR);
      --  Transmit Frame Mode Register
      TFMR : aliased SSC_TFMR_Register;
      pragma Volatile_Full_Access (TFMR);
      --  Receive Holding Register
      RHR  : aliased ATSAM3X8E.UInt32;
      --  Transmit Holding Register
      THR  : aliased ATSAM3X8E.UInt32;
      --  Receive Sync. Holding Register
      RSHR : aliased SSC_RSHR_Register;
      pragma Volatile_Full_Access (RSHR);
      --  Transmit Sync. Holding Register
      TSHR : aliased SSC_TSHR_Register;
      pragma Volatile_Full_Access (TSHR);
      --  Receive Compare 0 Register
      RC0R : aliased SSC_RC0R_Register;
      pragma Volatile_Full_Access (RC0R);
      --  Receive Compare 1 Register
      RC1R : aliased SSC_RC1R_Register;
      pragma Volatile_Full_Access (RC1R);
      --  Status Register
      SR   : aliased SSC_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Interrupt Enable Register
      IER  : aliased SSC_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR  : aliased SSC_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR  : aliased SSC_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Write Protect Mode Register
      WPMR : aliased SSC_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  Write Protect Status Register
      WPSR : aliased SSC_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
   end record
     with Volatile;

   for SSC_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      CMR  at 16#4# range 0 .. 31;
      RCMR at 16#10# range 0 .. 31;
      RFMR at 16#14# range 0 .. 31;
      TCMR at 16#18# range 0 .. 31;
      TFMR at 16#1C# range 0 .. 31;
      RHR  at 16#20# range 0 .. 31;
      THR  at 16#24# range 0 .. 31;
      RSHR at 16#30# range 0 .. 31;
      TSHR at 16#34# range 0 .. 31;
      RC0R at 16#38# range 0 .. 31;
      RC1R at 16#3C# range 0 .. 31;
      SR   at 16#40# range 0 .. 31;
      IER  at 16#44# range 0 .. 31;
      IDR  at 16#48# range 0 .. 31;
      IMR  at 16#4C# range 0 .. 31;
      WPMR at 16#E4# range 0 .. 31;
      WPSR at 16#E8# range 0 .. 31;
   end record;

   --  Synchronous Serial Controller
   SSC_Periph : aliased SSC_Peripheral
     with Import, Address => SSC_Base;

end ATSAM3X8E.SSC;
