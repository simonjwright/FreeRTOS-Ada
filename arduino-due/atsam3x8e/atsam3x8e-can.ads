pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package ATSAM3X8E.CAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CAN0_MR_CANEN_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_LPM_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_ABM_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_OVL_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_TEOF_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_TTM_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_TIMFRZ_Field is ATSAM3X8E.Bit;
   subtype CAN0_MR_DRPT_Field is ATSAM3X8E.Bit;

   --  Reception Synchronization Stage (not readable)
   type MR_RXSYNC_Field is
     (--  Rx Signal with Double Synchro Stages (2 Positive Edges)
      Double_Pp,
      --  Rx Signal with Double Synchro Stages (One Positive Edge and One Negative
--  Edge)
      Double_Pn,
      --  Rx Signal with Single Synchro Stage (Positive Edge)
      Single_P,
      --  Rx Signal with No Synchro Stage
      None)
     with Size => 3;
   for MR_RXSYNC_Field use
     (Double_Pp => 0,
      Double_Pn => 1,
      Single_P => 2,
      None => 3);

   --  Mode Register
   type CAN0_MR_Register is record
      --  CAN Controller Enable
      CANEN          : CAN0_MR_CANEN_Field := 16#0#;
      --  Disable/Enable Low Power Mode
      LPM            : CAN0_MR_LPM_Field := 16#0#;
      --  Disable/Enable Autobaud/Listen mode
      ABM            : CAN0_MR_ABM_Field := 16#0#;
      --  Disable/Enable Overload Frame
      OVL            : CAN0_MR_OVL_Field := 16#0#;
      --  Timestamp messages at each end of Frame
      TEOF           : CAN0_MR_TEOF_Field := 16#0#;
      --  Disable/Enable Time Triggered Mode
      TTM            : CAN0_MR_TTM_Field := 16#0#;
      --  Enable Timer Freeze
      TIMFRZ         : CAN0_MR_TIMFRZ_Field := 16#0#;
      --  Disable Repeat
      DRPT           : CAN0_MR_DRPT_Field := 16#0#;
      --  unspecified
      Reserved_8_23  : ATSAM3X8E.UInt16 := 16#0#;
      --  Reception Synchronization Stage (not readable)
      RXSYNC         : MR_RXSYNC_Field := ATSAM3X8E.CAN.Double_Pp;
      --  unspecified
      Reserved_27_31 : ATSAM3X8E.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_MR_Register use record
      CANEN          at 0 range 0 .. 0;
      LPM            at 0 range 1 .. 1;
      ABM            at 0 range 2 .. 2;
      OVL            at 0 range 3 .. 3;
      TEOF           at 0 range 4 .. 4;
      TTM            at 0 range 5 .. 5;
      TIMFRZ         at 0 range 6 .. 6;
      DRPT           at 0 range 7 .. 7;
      Reserved_8_23  at 0 range 8 .. 23;
      RXSYNC         at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  CAN0_IER_MB array element
   subtype CAN0_IER_MB_Element is ATSAM3X8E.Bit;

   --  CAN0_IER_MB array
   type CAN0_IER_MB_Field_Array is array (0 .. 7) of CAN0_IER_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for CAN0_IER_MB
   type CAN0_IER_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : CAN0_IER_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CAN0_IER_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype CAN0_IER_ERRA_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_WARN_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_ERRP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_BOFF_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_SLEEP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_TOVF_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_TSTP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_CERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_SERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_AERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_FERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IER_BERR_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type CAN0_IER_Register is record
      --  Write-only. Mailbox 0 Interrupt Enable
      MB             : CAN0_IER_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Error Active Mode Interrupt Enable
      ERRA           : CAN0_IER_ERRA_Field := 16#0#;
      --  Write-only. Warning Limit Interrupt Enable
      WARN           : CAN0_IER_WARN_Field := 16#0#;
      --  Write-only. Error Passive Mode Interrupt Enable
      ERRP           : CAN0_IER_ERRP_Field := 16#0#;
      --  Write-only. Bus Off Mode Interrupt Enable
      BOFF           : CAN0_IER_BOFF_Field := 16#0#;
      --  Write-only. Sleep Interrupt Enable
      SLEEP          : CAN0_IER_SLEEP_Field := 16#0#;
      --  Write-only. Wakeup Interrupt Enable
      WAKEUP         : CAN0_IER_WAKEUP_Field := 16#0#;
      --  Write-only. Timer Overflow Interrupt Enable
      TOVF           : CAN0_IER_TOVF_Field := 16#0#;
      --  Write-only. TimeStamp Interrupt Enable
      TSTP           : CAN0_IER_TSTP_Field := 16#0#;
      --  Write-only. CRC Error Interrupt Enable
      CERR           : CAN0_IER_CERR_Field := 16#0#;
      --  Write-only. Stuffing Error Interrupt Enable
      SERR           : CAN0_IER_SERR_Field := 16#0#;
      --  Write-only. Acknowledgment Error Interrupt Enable
      AERR           : CAN0_IER_AERR_Field := 16#0#;
      --  Write-only. Form Error Interrupt Enable
      FERR           : CAN0_IER_FERR_Field := 16#0#;
      --  Write-only. Bit Error Interrupt Enable
      BERR           : CAN0_IER_BERR_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_IER_Register use record
      MB             at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ERRA           at 0 range 16 .. 16;
      WARN           at 0 range 17 .. 17;
      ERRP           at 0 range 18 .. 18;
      BOFF           at 0 range 19 .. 19;
      SLEEP          at 0 range 20 .. 20;
      WAKEUP         at 0 range 21 .. 21;
      TOVF           at 0 range 22 .. 22;
      TSTP           at 0 range 23 .. 23;
      CERR           at 0 range 24 .. 24;
      SERR           at 0 range 25 .. 25;
      AERR           at 0 range 26 .. 26;
      FERR           at 0 range 27 .. 27;
      BERR           at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  CAN0_IDR_MB array element
   subtype CAN0_IDR_MB_Element is ATSAM3X8E.Bit;

   --  CAN0_IDR_MB array
   type CAN0_IDR_MB_Field_Array is array (0 .. 7) of CAN0_IDR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for CAN0_IDR_MB
   type CAN0_IDR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : CAN0_IDR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CAN0_IDR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype CAN0_IDR_ERRA_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_WARN_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_ERRP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_BOFF_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_TOVF_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_TSTP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_CERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_SERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_AERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_FERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IDR_BERR_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type CAN0_IDR_Register is record
      --  Write-only. Mailbox 0 Interrupt Disable
      MB             : CAN0_IDR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Error Active Mode Interrupt Disable
      ERRA           : CAN0_IDR_ERRA_Field := 16#0#;
      --  Write-only. Warning Limit Interrupt Disable
      WARN           : CAN0_IDR_WARN_Field := 16#0#;
      --  Write-only. Error Passive Mode Interrupt Disable
      ERRP           : CAN0_IDR_ERRP_Field := 16#0#;
      --  Write-only. Bus Off Mode Interrupt Disable
      BOFF           : CAN0_IDR_BOFF_Field := 16#0#;
      --  Write-only. Sleep Interrupt Disable
      SLEEP          : CAN0_IDR_SLEEP_Field := 16#0#;
      --  Write-only. Wakeup Interrupt Disable
      WAKEUP         : CAN0_IDR_WAKEUP_Field := 16#0#;
      --  Write-only. Timer Overflow Interrupt
      TOVF           : CAN0_IDR_TOVF_Field := 16#0#;
      --  Write-only. TimeStamp Interrupt Disable
      TSTP           : CAN0_IDR_TSTP_Field := 16#0#;
      --  Write-only. CRC Error Interrupt Disable
      CERR           : CAN0_IDR_CERR_Field := 16#0#;
      --  Write-only. Stuffing Error Interrupt Disable
      SERR           : CAN0_IDR_SERR_Field := 16#0#;
      --  Write-only. Acknowledgment Error Interrupt Disable
      AERR           : CAN0_IDR_AERR_Field := 16#0#;
      --  Write-only. Form Error Interrupt Disable
      FERR           : CAN0_IDR_FERR_Field := 16#0#;
      --  Write-only. Bit Error Interrupt Disable
      BERR           : CAN0_IDR_BERR_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_IDR_Register use record
      MB             at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ERRA           at 0 range 16 .. 16;
      WARN           at 0 range 17 .. 17;
      ERRP           at 0 range 18 .. 18;
      BOFF           at 0 range 19 .. 19;
      SLEEP          at 0 range 20 .. 20;
      WAKEUP         at 0 range 21 .. 21;
      TOVF           at 0 range 22 .. 22;
      TSTP           at 0 range 23 .. 23;
      CERR           at 0 range 24 .. 24;
      SERR           at 0 range 25 .. 25;
      AERR           at 0 range 26 .. 26;
      FERR           at 0 range 27 .. 27;
      BERR           at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  CAN0_IMR_MB array element
   subtype CAN0_IMR_MB_Element is ATSAM3X8E.Bit;

   --  CAN0_IMR_MB array
   type CAN0_IMR_MB_Field_Array is array (0 .. 7) of CAN0_IMR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for CAN0_IMR_MB
   type CAN0_IMR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : CAN0_IMR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CAN0_IMR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype CAN0_IMR_ERRA_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_WARN_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_ERRP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_BOFF_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_TOVF_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_TSTP_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_CERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_SERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_AERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_FERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_IMR_BERR_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type CAN0_IMR_Register is record
      --  Read-only. Mailbox 0 Interrupt Mask
      MB             : CAN0_IMR_MB_Field;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Error Active Mode Interrupt Mask
      ERRA           : CAN0_IMR_ERRA_Field;
      --  Read-only. Warning Limit Interrupt Mask
      WARN           : CAN0_IMR_WARN_Field;
      --  Read-only. Error Passive Mode Interrupt Mask
      ERRP           : CAN0_IMR_ERRP_Field;
      --  Read-only. Bus Off Mode Interrupt Mask
      BOFF           : CAN0_IMR_BOFF_Field;
      --  Read-only. Sleep Interrupt Mask
      SLEEP          : CAN0_IMR_SLEEP_Field;
      --  Read-only. Wakeup Interrupt Mask
      WAKEUP         : CAN0_IMR_WAKEUP_Field;
      --  Read-only. Timer Overflow Interrupt Mask
      TOVF           : CAN0_IMR_TOVF_Field;
      --  Read-only. Timestamp Interrupt Mask
      TSTP           : CAN0_IMR_TSTP_Field;
      --  Read-only. CRC Error Interrupt Mask
      CERR           : CAN0_IMR_CERR_Field;
      --  Read-only. Stuffing Error Interrupt Mask
      SERR           : CAN0_IMR_SERR_Field;
      --  Read-only. Acknowledgment Error Interrupt Mask
      AERR           : CAN0_IMR_AERR_Field;
      --  Read-only. Form Error Interrupt Mask
      FERR           : CAN0_IMR_FERR_Field;
      --  Read-only. Bit Error Interrupt Mask
      BERR           : CAN0_IMR_BERR_Field;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_IMR_Register use record
      MB             at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ERRA           at 0 range 16 .. 16;
      WARN           at 0 range 17 .. 17;
      ERRP           at 0 range 18 .. 18;
      BOFF           at 0 range 19 .. 19;
      SLEEP          at 0 range 20 .. 20;
      WAKEUP         at 0 range 21 .. 21;
      TOVF           at 0 range 22 .. 22;
      TSTP           at 0 range 23 .. 23;
      CERR           at 0 range 24 .. 24;
      SERR           at 0 range 25 .. 25;
      AERR           at 0 range 26 .. 26;
      FERR           at 0 range 27 .. 27;
      BERR           at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  CAN0_SR_MB array element
   subtype CAN0_SR_MB_Element is ATSAM3X8E.Bit;

   --  CAN0_SR_MB array
   type CAN0_SR_MB_Field_Array is array (0 .. 7) of CAN0_SR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for CAN0_SR_MB
   type CAN0_SR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : CAN0_SR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CAN0_SR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype CAN0_SR_ERRA_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_WARN_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_ERRP_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_BOFF_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_TOVF_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_TSTP_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_CERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_SERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_AERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_FERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_BERR_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_RBSY_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_TBSY_Field is ATSAM3X8E.Bit;
   subtype CAN0_SR_OVLSY_Field is ATSAM3X8E.Bit;

   --  Status Register
   type CAN0_SR_Register is record
      --  Read-only. Mailbox 0 Event
      MB            : CAN0_SR_MB_Field;
      --  unspecified
      Reserved_8_15 : ATSAM3X8E.Byte;
      --  Read-only. Error Active Mode
      ERRA          : CAN0_SR_ERRA_Field;
      --  Read-only. Warning Limit
      WARN          : CAN0_SR_WARN_Field;
      --  Read-only. Error Passive Mode
      ERRP          : CAN0_SR_ERRP_Field;
      --  Read-only. Bus Off Mode
      BOFF          : CAN0_SR_BOFF_Field;
      --  Read-only. CAN controller in Low power Mode
      SLEEP         : CAN0_SR_SLEEP_Field;
      --  Read-only. CAN controller is not in Low power Mode
      WAKEUP        : CAN0_SR_WAKEUP_Field;
      --  Read-only. Timer Overflow
      TOVF          : CAN0_SR_TOVF_Field;
      --  Read-only.
      TSTP          : CAN0_SR_TSTP_Field;
      --  Read-only. Mailbox CRC Error
      CERR          : CAN0_SR_CERR_Field;
      --  Read-only. Mailbox Stuffing Error
      SERR          : CAN0_SR_SERR_Field;
      --  Read-only. Acknowledgment Error
      AERR          : CAN0_SR_AERR_Field;
      --  Read-only. Form Error
      FERR          : CAN0_SR_FERR_Field;
      --  Read-only. Bit Error
      BERR          : CAN0_SR_BERR_Field;
      --  Read-only. Receiver busy
      RBSY          : CAN0_SR_RBSY_Field;
      --  Read-only. Transmitter busy
      TBSY          : CAN0_SR_TBSY_Field;
      --  Read-only. Overload busy
      OVLSY         : CAN0_SR_OVLSY_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_SR_Register use record
      MB            at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
      ERRA          at 0 range 16 .. 16;
      WARN          at 0 range 17 .. 17;
      ERRP          at 0 range 18 .. 18;
      BOFF          at 0 range 19 .. 19;
      SLEEP         at 0 range 20 .. 20;
      WAKEUP        at 0 range 21 .. 21;
      TOVF          at 0 range 22 .. 22;
      TSTP          at 0 range 23 .. 23;
      CERR          at 0 range 24 .. 24;
      SERR          at 0 range 25 .. 25;
      AERR          at 0 range 26 .. 26;
      FERR          at 0 range 27 .. 27;
      BERR          at 0 range 28 .. 28;
      RBSY          at 0 range 29 .. 29;
      TBSY          at 0 range 30 .. 30;
      OVLSY         at 0 range 31 .. 31;
   end record;

   subtype CAN0_BR_PHASE2_Field is ATSAM3X8E.UInt3;
   subtype CAN0_BR_PHASE1_Field is ATSAM3X8E.UInt3;
   subtype CAN0_BR_PROPAG_Field is ATSAM3X8E.UInt3;
   subtype CAN0_BR_SJW_Field is ATSAM3X8E.UInt2;
   subtype CAN0_BR_BRP_Field is ATSAM3X8E.UInt7;

   --  Sampling Mode
   type BR_SMP_Field is
     (--  The incoming bit stream is sampled once at sample point.
      Once,
      --  The incoming bit stream is sampled three times with a period of a MCK clock
--  period, centered on sample point.
      Three)
     with Size => 1;
   for BR_SMP_Field use
     (Once => 0,
      Three => 1);

   --  Baudrate Register
   type CAN0_BR_Register is record
      --  Phase 2 segment
      PHASE2         : CAN0_BR_PHASE2_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Phase 1 segment
      PHASE1         : CAN0_BR_PHASE1_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Programming time segment
      PROPAG         : CAN0_BR_PROPAG_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Re-synchronization jump width
      SJW            : CAN0_BR_SJW_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Baudrate Prescaler.
      BRP            : CAN0_BR_BRP_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  Sampling Mode
      SMP            : BR_SMP_Field := ATSAM3X8E.CAN.Once;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_BR_Register use record
      PHASE2         at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      PHASE1         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PROPAG         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SJW            at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      BRP            at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      SMP            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CAN0_TIM_TIMER_Field is ATSAM3X8E.UInt16;

   --  Timer Register
   type CAN0_TIM_Register is record
      --  Read-only. Timer
      TIMER          : CAN0_TIM_TIMER_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_TIM_Register use record
      TIMER          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CAN0_TIMESTP_MTIMESTAMP_Field is ATSAM3X8E.UInt16;

   --  Timestamp Register
   type CAN0_TIMESTP_Register is record
      --  Read-only. Timestamp
      MTIMESTAMP     : CAN0_TIMESTP_MTIMESTAMP_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_TIMESTP_Register use record
      MTIMESTAMP     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CAN0_ECR_REC_Field is ATSAM3X8E.Byte;
   subtype CAN0_ECR_TEC_Field is ATSAM3X8E.Byte;

   --  Error Counter Register
   type CAN0_ECR_Register is record
      --  Read-only. Receive Error Counter
      REC            : CAN0_ECR_REC_Field;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Transmit Error Counter
      TEC            : CAN0_ECR_TEC_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_ECR_Register use record
      REC            at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      TEC            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  CAN0_TCR_MB array element
   subtype CAN0_TCR_MB_Element is ATSAM3X8E.Bit;

   --  CAN0_TCR_MB array
   type CAN0_TCR_MB_Field_Array is array (0 .. 7) of CAN0_TCR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for CAN0_TCR_MB
   type CAN0_TCR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : CAN0_TCR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CAN0_TCR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype CAN0_TCR_TIMRST_Field is ATSAM3X8E.Bit;

   --  Transfer Command Register
   type CAN0_TCR_Register is record
      --  Write-only. Transfer Request for Mailbox 0
      MB            : CAN0_TCR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_30 : ATSAM3X8E.UInt23 := 16#0#;
      --  Write-only. Timer Reset
      TIMRST        : CAN0_TCR_TIMRST_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_TCR_Register use record
      MB            at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      TIMRST        at 0 range 31 .. 31;
   end record;

   --  CAN0_ACR_MB array element
   subtype CAN0_ACR_MB_Element is ATSAM3X8E.Bit;

   --  CAN0_ACR_MB array
   type CAN0_ACR_MB_Field_Array is array (0 .. 7) of CAN0_ACR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for CAN0_ACR_MB
   type CAN0_ACR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : CAN0_ACR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CAN0_ACR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Abort Command Register
   type CAN0_ACR_Register is record
      --  Write-only. Abort Request for Mailbox 0
      MB            : CAN0_ACR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_ACR_Register use record
      MB            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CAN0_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype CAN0_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type CAN0_WPMR_Register is record
      --  Write Protection Enable
      WPEN         : CAN0_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  SPI Write Protection Key Password
      WPKEY        : CAN0_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype CAN0_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype CAN0_WPSR_WPVSRC_Field is ATSAM3X8E.Byte;

   --  Write Protect Status Register
   type CAN0_WPSR_Register is record
      --  Read-only. Write Protection Violation Status
      WPVS           : CAN0_WPSR_WPVS_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protection Violation Source
      WPVSRC         : CAN0_WPSR_WPVSRC_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CAN0_WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype MMR_MTIMEMARK_Field is ATSAM3X8E.UInt16;
   subtype MMR_PRIOR_Field is ATSAM3X8E.UInt4;

   --  Mailbox Object Type
   type MMR0_MOT_Field is
     (--  Mailbox is disabled. This prevents receiving or transmitting any messages
--  with this mailbox.
      Mb_Disabled,
      --  Reception Mailbox. Mailbox is configured for reception. If a message is
--  received while the mailbox data register is full, it is discarded.
      Mb_Rx,
      --  Reception mailbox with overwrite. Mailbox is configured for reception. If a
--  message is received while the mailbox is full, it overwrites the previous
--  message.
      Mb_Rx_Overwrite,
      --  Transmit mailbox. Mailbox is configured for transmission.
      Mb_Tx,
      --  Consumer Mailbox. Mailbox is configured in reception but behaves as a
--  Transmit Mailbox, i.e., it sends a remote frame and waits for an answer.
      Mb_Consumer,
      --  Producer Mailbox. Mailbox is configured in transmission but also behaves
--  like a reception mailbox, i.e., it waits to receive a Remote Frame before
--  sending its contents.
      Mb_Producer)
     with Size => 3;
   for MMR0_MOT_Field use
     (Mb_Disabled => 0,
      Mb_Rx => 1,
      Mb_Rx_Overwrite => 2,
      Mb_Tx => 3,
      Mb_Consumer => 4,
      Mb_Producer => 5);

   --  Mailbox Mode Register (MB = 0)
   type MMR_Register is record
      --  Mailbox Timemark
      MTIMEMARK      : MMR_MTIMEMARK_Field := 16#0#;
      --  Mailbox Priority
      PRIOR          : MMR_PRIOR_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Mailbox Object Type
      MOT            : MMR0_MOT_Field := ATSAM3X8E.CAN.Mb_Disabled;
      --  unspecified
      Reserved_27_31 : ATSAM3X8E.UInt5 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MMR_Register use record
      MTIMEMARK      at 0 range 0 .. 15;
      PRIOR          at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      MOT            at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype MAM_MIDvB_Field is ATSAM3X8E.UInt18;
   subtype MAM_MIDvA_Field is ATSAM3X8E.UInt11;
   subtype MAM_MIDE_Field is ATSAM3X8E.Bit;

   --  Mailbox Acceptance Mask Register (MB = 0)
   type MAM_Register is record
      --  Complementary bits for identifier in extended frame mode
      MIDvB          : MAM_MIDvB_Field := 16#0#;
      --  Identifier for standard frame mode
      MIDvA          : MAM_MIDvA_Field := 16#0#;
      --  Identifier Version
      MIDE           : MAM_MIDE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MAM_Register use record
      MIDvB          at 0 range 0 .. 17;
      MIDvA          at 0 range 18 .. 28;
      MIDE           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype MID_MIDvB_Field is ATSAM3X8E.UInt18;
   subtype MID_MIDvA_Field is ATSAM3X8E.UInt11;
   subtype MID_MIDE_Field is ATSAM3X8E.Bit;

   --  Mailbox ID Register (MB = 0)
   type MID_Register is record
      --  Complementary bits for identifier in extended frame mode
      MIDvB          : MID_MIDvB_Field := 16#0#;
      --  Identifier for standard frame mode
      MIDvA          : MID_MIDvA_Field := 16#0#;
      --  Identifier Version
      MIDE           : MID_MIDE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MID_Register use record
      MIDvB          at 0 range 0 .. 17;
      MIDvA          at 0 range 18 .. 28;
      MIDE           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype MFID_MFID_Field is ATSAM3X8E.UInt29;

   --  Mailbox Family ID Register (MB = 0)
   type MFID_Register is record
      --  Read-only. Family ID
      MFID           : MFID_MFID_Field;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MFID_Register use record
      MFID           at 0 range 0 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype MSR_MTIMESTAMP_Field is ATSAM3X8E.UInt16;
   subtype MSR_MDLC_Field is ATSAM3X8E.UInt4;
   subtype MSR_MRTR_Field is ATSAM3X8E.Bit;
   subtype MSR_MABT_Field is ATSAM3X8E.Bit;
   subtype MSR_MRDY_Field is ATSAM3X8E.Bit;
   subtype MSR_MMI_Field is ATSAM3X8E.Bit;

   --  Mailbox Status Register (MB = 0)
   type MSR_Register is record
      --  Read-only. Timer value
      MTIMESTAMP     : MSR_MTIMESTAMP_Field;
      --  Read-only. Mailbox Data Length Code
      MDLC           : MSR_MDLC_Field;
      --  Read-only. Mailbox Remote Transmission Request
      MRTR           : MSR_MRTR_Field;
      --  unspecified
      Reserved_21_21 : ATSAM3X8E.Bit;
      --  Read-only. Mailbox Message Abort
      MABT           : MSR_MABT_Field;
      --  Read-only. Mailbox Ready
      MRDY           : MSR_MRDY_Field;
      --  Read-only. Mailbox Message Ignored
      MMI            : MSR_MMI_Field;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MSR_Register use record
      MTIMESTAMP     at 0 range 0 .. 15;
      MDLC           at 0 range 16 .. 19;
      MRTR           at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      MABT           at 0 range 22 .. 22;
      MRDY           at 0 range 23 .. 23;
      MMI            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype MCR_MDLC_Field is ATSAM3X8E.UInt4;
   subtype MCR_MRTR_Field is ATSAM3X8E.Bit;
   subtype MCR_MACR_Field is ATSAM3X8E.Bit;
   subtype MCR_MTCR_Field is ATSAM3X8E.Bit;

   --  Mailbox Control Register (MB = 0)
   type MCR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.UInt16 := 16#0#;
      --  Write-only. Mailbox Data Length Code
      MDLC           : MCR_MDLC_Field := 16#0#;
      --  Write-only. Mailbox Remote Transmission Request
      MRTR           : MCR_MRTR_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Abort Request for Mailbox x
      MACR           : MCR_MACR_Field := 16#0#;
      --  Write-only. Mailbox Transfer Command
      MTCR           : MCR_MTCR_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MCR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      MDLC           at 0 range 16 .. 19;
      MRTR           at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      MACR           at 0 range 22 .. 22;
      MTCR           at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Controller Area Network 0
   type CAN_Peripheral is record
      --  Mode Register
      MR      : aliased CAN0_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Interrupt Enable Register
      IER     : aliased CAN0_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR     : aliased CAN0_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR     : aliased CAN0_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Status Register
      SR      : aliased CAN0_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Baudrate Register
      BR      : aliased CAN0_BR_Register;
      pragma Volatile_Full_Access (BR);
      --  Timer Register
      TIM     : aliased CAN0_TIM_Register;
      pragma Volatile_Full_Access (TIM);
      --  Timestamp Register
      TIMESTP : aliased CAN0_TIMESTP_Register;
      pragma Volatile_Full_Access (TIMESTP);
      --  Error Counter Register
      ECR     : aliased CAN0_ECR_Register;
      pragma Volatile_Full_Access (ECR);
      --  Transfer Command Register
      TCR     : aliased CAN0_TCR_Register;
      pragma Volatile_Full_Access (TCR);
      --  Abort Command Register
      ACR     : aliased CAN0_ACR_Register;
      pragma Volatile_Full_Access (ACR);
      --  Write Protect Mode Register
      WPMR    : aliased CAN0_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  Write Protect Status Register
      WPSR    : aliased CAN0_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
      --  Mailbox Mode Register (MB = 0)
      MMR0    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR0);
      --  Mailbox Acceptance Mask Register (MB = 0)
      MAM0    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM0);
      --  Mailbox ID Register (MB = 0)
      MID0    : aliased MID_Register;
      pragma Volatile_Full_Access (MID0);
      --  Mailbox Family ID Register (MB = 0)
      MFID0   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID0);
      --  Mailbox Status Register (MB = 0)
      MSR0    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR0);
      --  Mailbox Data Low Register (MB = 0)
      MDL0    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 0)
      MDH0    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 0)
      MCR0    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR0);
      --  Mailbox Mode Register (MB = 1)
      MMR1    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR1);
      --  Mailbox Acceptance Mask Register (MB = 1)
      MAM1    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM1);
      --  Mailbox ID Register (MB = 1)
      MID1    : aliased MID_Register;
      pragma Volatile_Full_Access (MID1);
      --  Mailbox Family ID Register (MB = 1)
      MFID1   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID1);
      --  Mailbox Status Register (MB = 1)
      MSR1    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR1);
      --  Mailbox Data Low Register (MB = 1)
      MDL1    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 1)
      MDH1    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 1)
      MCR1    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR1);
      --  Mailbox Mode Register (MB = 2)
      MMR2    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR2);
      --  Mailbox Acceptance Mask Register (MB = 2)
      MAM2    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM2);
      --  Mailbox ID Register (MB = 2)
      MID2    : aliased MID_Register;
      pragma Volatile_Full_Access (MID2);
      --  Mailbox Family ID Register (MB = 2)
      MFID2   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID2);
      --  Mailbox Status Register (MB = 2)
      MSR2    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR2);
      --  Mailbox Data Low Register (MB = 2)
      MDL2    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 2)
      MDH2    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 2)
      MCR2    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR2);
      --  Mailbox Mode Register (MB = 3)
      MMR3    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR3);
      --  Mailbox Acceptance Mask Register (MB = 3)
      MAM3    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM3);
      --  Mailbox ID Register (MB = 3)
      MID3    : aliased MID_Register;
      pragma Volatile_Full_Access (MID3);
      --  Mailbox Family ID Register (MB = 3)
      MFID3   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID3);
      --  Mailbox Status Register (MB = 3)
      MSR3    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR3);
      --  Mailbox Data Low Register (MB = 3)
      MDL3    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 3)
      MDH3    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 3)
      MCR3    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR3);
      --  Mailbox Mode Register (MB = 4)
      MMR4    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR4);
      --  Mailbox Acceptance Mask Register (MB = 4)
      MAM4    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM4);
      --  Mailbox ID Register (MB = 4)
      MID4    : aliased MID_Register;
      pragma Volatile_Full_Access (MID4);
      --  Mailbox Family ID Register (MB = 4)
      MFID4   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID4);
      --  Mailbox Status Register (MB = 4)
      MSR4    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR4);
      --  Mailbox Data Low Register (MB = 4)
      MDL4    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 4)
      MDH4    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 4)
      MCR4    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR4);
      --  Mailbox Mode Register (MB = 5)
      MMR5    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR5);
      --  Mailbox Acceptance Mask Register (MB = 5)
      MAM5    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM5);
      --  Mailbox ID Register (MB = 5)
      MID5    : aliased MID_Register;
      pragma Volatile_Full_Access (MID5);
      --  Mailbox Family ID Register (MB = 5)
      MFID5   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID5);
      --  Mailbox Status Register (MB = 5)
      MSR5    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR5);
      --  Mailbox Data Low Register (MB = 5)
      MDL5    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 5)
      MDH5    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 5)
      MCR5    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR5);
      --  Mailbox Mode Register (MB = 6)
      MMR6    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR6);
      --  Mailbox Acceptance Mask Register (MB = 6)
      MAM6    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM6);
      --  Mailbox ID Register (MB = 6)
      MID6    : aliased MID_Register;
      pragma Volatile_Full_Access (MID6);
      --  Mailbox Family ID Register (MB = 6)
      MFID6   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID6);
      --  Mailbox Status Register (MB = 6)
      MSR6    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR6);
      --  Mailbox Data Low Register (MB = 6)
      MDL6    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 6)
      MDH6    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 6)
      MCR6    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR6);
      --  Mailbox Mode Register (MB = 7)
      MMR7    : aliased MMR_Register;
      pragma Volatile_Full_Access (MMR7);
      --  Mailbox Acceptance Mask Register (MB = 7)
      MAM7    : aliased MAM_Register;
      pragma Volatile_Full_Access (MAM7);
      --  Mailbox ID Register (MB = 7)
      MID7    : aliased MID_Register;
      pragma Volatile_Full_Access (MID7);
      --  Mailbox Family ID Register (MB = 7)
      MFID7   : aliased MFID_Register;
      pragma Volatile_Full_Access (MFID7);
      --  Mailbox Status Register (MB = 7)
      MSR7    : aliased MSR_Register;
      pragma Volatile_Full_Access (MSR7);
      --  Mailbox Data Low Register (MB = 7)
      MDL7    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Data High Register (MB = 7)
      MDH7    : aliased ATSAM3X8E.UInt32;
      --  Mailbox Control Register (MB = 7)
      MCR7    : aliased MCR_Register;
      pragma Volatile_Full_Access (MCR7);
   end record
     with Volatile;

   for CAN_Peripheral use record
      MR      at 16#0# range 0 .. 31;
      IER     at 16#4# range 0 .. 31;
      IDR     at 16#8# range 0 .. 31;
      IMR     at 16#C# range 0 .. 31;
      SR      at 16#10# range 0 .. 31;
      BR      at 16#14# range 0 .. 31;
      TIM     at 16#18# range 0 .. 31;
      TIMESTP at 16#1C# range 0 .. 31;
      ECR     at 16#20# range 0 .. 31;
      TCR     at 16#24# range 0 .. 31;
      ACR     at 16#28# range 0 .. 31;
      WPMR    at 16#E4# range 0 .. 31;
      WPSR    at 16#E8# range 0 .. 31;
      MMR0    at 16#200# range 0 .. 31;
      MAM0    at 16#204# range 0 .. 31;
      MID0    at 16#208# range 0 .. 31;
      MFID0   at 16#20C# range 0 .. 31;
      MSR0    at 16#210# range 0 .. 31;
      MDL0    at 16#214# range 0 .. 31;
      MDH0    at 16#218# range 0 .. 31;
      MCR0    at 16#21C# range 0 .. 31;
      MMR1    at 16#220# range 0 .. 31;
      MAM1    at 16#224# range 0 .. 31;
      MID1    at 16#228# range 0 .. 31;
      MFID1   at 16#22C# range 0 .. 31;
      MSR1    at 16#230# range 0 .. 31;
      MDL1    at 16#234# range 0 .. 31;
      MDH1    at 16#238# range 0 .. 31;
      MCR1    at 16#23C# range 0 .. 31;
      MMR2    at 16#240# range 0 .. 31;
      MAM2    at 16#244# range 0 .. 31;
      MID2    at 16#248# range 0 .. 31;
      MFID2   at 16#24C# range 0 .. 31;
      MSR2    at 16#250# range 0 .. 31;
      MDL2    at 16#254# range 0 .. 31;
      MDH2    at 16#258# range 0 .. 31;
      MCR2    at 16#25C# range 0 .. 31;
      MMR3    at 16#260# range 0 .. 31;
      MAM3    at 16#264# range 0 .. 31;
      MID3    at 16#268# range 0 .. 31;
      MFID3   at 16#26C# range 0 .. 31;
      MSR3    at 16#270# range 0 .. 31;
      MDL3    at 16#274# range 0 .. 31;
      MDH3    at 16#278# range 0 .. 31;
      MCR3    at 16#27C# range 0 .. 31;
      MMR4    at 16#280# range 0 .. 31;
      MAM4    at 16#284# range 0 .. 31;
      MID4    at 16#288# range 0 .. 31;
      MFID4   at 16#28C# range 0 .. 31;
      MSR4    at 16#290# range 0 .. 31;
      MDL4    at 16#294# range 0 .. 31;
      MDH4    at 16#298# range 0 .. 31;
      MCR4    at 16#29C# range 0 .. 31;
      MMR5    at 16#2A0# range 0 .. 31;
      MAM5    at 16#2A4# range 0 .. 31;
      MID5    at 16#2A8# range 0 .. 31;
      MFID5   at 16#2AC# range 0 .. 31;
      MSR5    at 16#2B0# range 0 .. 31;
      MDL5    at 16#2B4# range 0 .. 31;
      MDH5    at 16#2B8# range 0 .. 31;
      MCR5    at 16#2BC# range 0 .. 31;
      MMR6    at 16#2C0# range 0 .. 31;
      MAM6    at 16#2C4# range 0 .. 31;
      MID6    at 16#2C8# range 0 .. 31;
      MFID6   at 16#2CC# range 0 .. 31;
      MSR6    at 16#2D0# range 0 .. 31;
      MDL6    at 16#2D4# range 0 .. 31;
      MDH6    at 16#2D8# range 0 .. 31;
      MCR6    at 16#2DC# range 0 .. 31;
      MMR7    at 16#2E0# range 0 .. 31;
      MAM7    at 16#2E4# range 0 .. 31;
      MID7    at 16#2E8# range 0 .. 31;
      MFID7   at 16#2EC# range 0 .. 31;
      MSR7    at 16#2F0# range 0 .. 31;
      MDL7    at 16#2F4# range 0 .. 31;
      MDH7    at 16#2F8# range 0 .. 31;
      MCR7    at 16#2FC# range 0 .. 31;
   end record;

   --  Controller Area Network 0
   CAN0_Periph : aliased CAN_Peripheral
     with Import, Address => CAN0_Base;

   --  Controller Area Network 1
   CAN1_Periph : aliased CAN_Peripheral
     with Import, Address => CAN1_Base;

end ATSAM3X8E.CAN;
