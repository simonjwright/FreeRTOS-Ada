--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.CAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- MR_Register --
   -----------------

   subtype MR_CANEN_Field is ATSAM3X8E.Bit;
   subtype MR_LPM_Field is ATSAM3X8E.Bit;
   subtype MR_ABM_Field is ATSAM3X8E.Bit;
   subtype MR_OVL_Field is ATSAM3X8E.Bit;
   subtype MR_TEOF_Field is ATSAM3X8E.Bit;
   subtype MR_TTM_Field is ATSAM3X8E.Bit;
   subtype MR_TIMFRZ_Field is ATSAM3X8E.Bit;
   subtype MR_DRPT_Field is ATSAM3X8E.Bit;

   --  Reception Synchronization Stage (not readable)
   type RXSYNC_Field is
     (
      --  Rx Signal with Double Synchro Stages (2 Positive Edges)
      Double_Pp,
      --  Rx Signal with Double Synchro Stages (One Positive Edge and One
      --  Negative Edge)
      Double_Pn,
      --  Rx Signal with Single Synchro Stage (Positive Edge)
      Single_P,
      --  Rx Signal with No Synchro Stage
      None)
     with Size => 3;
   for RXSYNC_Field use
     (Double_Pp => 0,
      Double_Pn => 1,
      Single_P => 2,
      None => 3);

   --  Mode Register
   type MR_Register is record
      --  CAN Controller Enable
      CANEN          : MR_CANEN_Field := 16#0#;
      --  Disable/Enable Low Power Mode
      LPM            : MR_LPM_Field := 16#0#;
      --  Disable/Enable Autobaud/Listen mode
      ABM            : MR_ABM_Field := 16#0#;
      --  Disable/Enable Overload Frame
      OVL            : MR_OVL_Field := 16#0#;
      --  Timestamp messages at each end of Frame
      TEOF           : MR_TEOF_Field := 16#0#;
      --  Disable/Enable Time Triggered Mode
      TTM            : MR_TTM_Field := 16#0#;
      --  Enable Timer Freeze
      TIMFRZ         : MR_TIMFRZ_Field := 16#0#;
      --  Disable Repeat
      DRPT           : MR_DRPT_Field := 16#0#;
      --  unspecified
      Reserved_8_23  : ATSAM3X8E.Short := 16#0#;
      --  Reception Synchronization Stage (not readable)
      RXSYNC         : RXSYNC_Field := Double_Pp;
      --  unspecified
      Reserved_27_31 : ATSAM3X8E.UInt5 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
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

   ------------------
   -- IER_Register --
   ------------------

   ------------
   -- IER.MB --
   ------------

   --  IER_MB array element
   subtype IER_MB_Element is ATSAM3X8E.Bit;

   --  IER_MB array
   type IER_MB_Field_Array is array (0 .. 7) of IER_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IER_MB
   type IER_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : IER_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IER_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype IER_ERRA_Field is ATSAM3X8E.Bit;
   subtype IER_WARN_Field is ATSAM3X8E.Bit;
   subtype IER_ERRP_Field is ATSAM3X8E.Bit;
   subtype IER_BOFF_Field is ATSAM3X8E.Bit;
   subtype IER_SLEEP_Field is ATSAM3X8E.Bit;
   subtype IER_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype IER_TOVF_Field is ATSAM3X8E.Bit;
   subtype IER_TSTP_Field is ATSAM3X8E.Bit;
   subtype IER_CERR_Field is ATSAM3X8E.Bit;
   subtype IER_SERR_Field is ATSAM3X8E.Bit;
   subtype IER_AERR_Field is ATSAM3X8E.Bit;
   subtype IER_FERR_Field is ATSAM3X8E.Bit;
   subtype IER_BERR_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Mailbox 0 Interrupt Enable
      MB             : IER_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Error Active Mode Interrupt Enable
      ERRA           : IER_ERRA_Field := 16#0#;
      --  Write-only. Warning Limit Interrupt Enable
      WARN           : IER_WARN_Field := 16#0#;
      --  Write-only. Error Passive Mode Interrupt Enable
      ERRP           : IER_ERRP_Field := 16#0#;
      --  Write-only. Bus Off Mode Interrupt Enable
      BOFF           : IER_BOFF_Field := 16#0#;
      --  Write-only. Sleep Interrupt Enable
      SLEEP          : IER_SLEEP_Field := 16#0#;
      --  Write-only. Wakeup Interrupt Enable
      WAKEUP         : IER_WAKEUP_Field := 16#0#;
      --  Write-only. Timer Overflow Interrupt Enable
      TOVF           : IER_TOVF_Field := 16#0#;
      --  Write-only. TimeStamp Interrupt Enable
      TSTP           : IER_TSTP_Field := 16#0#;
      --  Write-only. CRC Error Interrupt Enable
      CERR           : IER_CERR_Field := 16#0#;
      --  Write-only. Stuffing Error Interrupt Enable
      SERR           : IER_SERR_Field := 16#0#;
      --  Write-only. Acknowledgment Error Interrupt Enable
      AERR           : IER_AERR_Field := 16#0#;
      --  Write-only. Form Error Interrupt Enable
      FERR           : IER_FERR_Field := 16#0#;
      --  Write-only. Bit Error Interrupt Enable
      BERR           : IER_BERR_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
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

   ------------------
   -- IDR_Register --
   ------------------

   ------------
   -- IDR.MB --
   ------------

   --  IDR_MB array element
   subtype IDR_MB_Element is ATSAM3X8E.Bit;

   --  IDR_MB array
   type IDR_MB_Field_Array is array (0 .. 7) of IDR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IDR_MB
   type IDR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : IDR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IDR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype IDR_ERRA_Field is ATSAM3X8E.Bit;
   subtype IDR_WARN_Field is ATSAM3X8E.Bit;
   subtype IDR_ERRP_Field is ATSAM3X8E.Bit;
   subtype IDR_BOFF_Field is ATSAM3X8E.Bit;
   subtype IDR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype IDR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype IDR_TOVF_Field is ATSAM3X8E.Bit;
   subtype IDR_TSTP_Field is ATSAM3X8E.Bit;
   subtype IDR_CERR_Field is ATSAM3X8E.Bit;
   subtype IDR_SERR_Field is ATSAM3X8E.Bit;
   subtype IDR_AERR_Field is ATSAM3X8E.Bit;
   subtype IDR_FERR_Field is ATSAM3X8E.Bit;
   subtype IDR_BERR_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Mailbox 0 Interrupt Disable
      MB             : IDR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte := 16#0#;
      --  Write-only. Error Active Mode Interrupt Disable
      ERRA           : IDR_ERRA_Field := 16#0#;
      --  Write-only. Warning Limit Interrupt Disable
      WARN           : IDR_WARN_Field := 16#0#;
      --  Write-only. Error Passive Mode Interrupt Disable
      ERRP           : IDR_ERRP_Field := 16#0#;
      --  Write-only. Bus Off Mode Interrupt Disable
      BOFF           : IDR_BOFF_Field := 16#0#;
      --  Write-only. Sleep Interrupt Disable
      SLEEP          : IDR_SLEEP_Field := 16#0#;
      --  Write-only. Wakeup Interrupt Disable
      WAKEUP         : IDR_WAKEUP_Field := 16#0#;
      --  Write-only. Timer Overflow Interrupt
      TOVF           : IDR_TOVF_Field := 16#0#;
      --  Write-only. TimeStamp Interrupt Disable
      TSTP           : IDR_TSTP_Field := 16#0#;
      --  Write-only. CRC Error Interrupt Disable
      CERR           : IDR_CERR_Field := 16#0#;
      --  Write-only. Stuffing Error Interrupt Disable
      SERR           : IDR_SERR_Field := 16#0#;
      --  Write-only. Acknowledgment Error Interrupt Disable
      AERR           : IDR_AERR_Field := 16#0#;
      --  Write-only. Form Error Interrupt Disable
      FERR           : IDR_FERR_Field := 16#0#;
      --  Write-only. Bit Error Interrupt Disable
      BERR           : IDR_BERR_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
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

   ------------------
   -- IMR_Register --
   ------------------

   ------------
   -- IMR.MB --
   ------------

   --  IMR_MB array element
   subtype IMR_MB_Element is ATSAM3X8E.Bit;

   --  IMR_MB array
   type IMR_MB_Field_Array is array (0 .. 7) of IMR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for IMR_MB
   type IMR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : IMR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for IMR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype IMR_ERRA_Field is ATSAM3X8E.Bit;
   subtype IMR_WARN_Field is ATSAM3X8E.Bit;
   subtype IMR_ERRP_Field is ATSAM3X8E.Bit;
   subtype IMR_BOFF_Field is ATSAM3X8E.Bit;
   subtype IMR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype IMR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype IMR_TOVF_Field is ATSAM3X8E.Bit;
   subtype IMR_TSTP_Field is ATSAM3X8E.Bit;
   subtype IMR_CERR_Field is ATSAM3X8E.Bit;
   subtype IMR_SERR_Field is ATSAM3X8E.Bit;
   subtype IMR_AERR_Field is ATSAM3X8E.Bit;
   subtype IMR_FERR_Field is ATSAM3X8E.Bit;
   subtype IMR_BERR_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Mailbox 0 Interrupt Mask
      MB             : IMR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Error Active Mode Interrupt Mask
      ERRA           : IMR_ERRA_Field := 16#0#;
      --  Read-only. Warning Limit Interrupt Mask
      WARN           : IMR_WARN_Field := 16#0#;
      --  Read-only. Error Passive Mode Interrupt Mask
      ERRP           : IMR_ERRP_Field := 16#0#;
      --  Read-only. Bus Off Mode Interrupt Mask
      BOFF           : IMR_BOFF_Field := 16#0#;
      --  Read-only. Sleep Interrupt Mask
      SLEEP          : IMR_SLEEP_Field := 16#0#;
      --  Read-only. Wakeup Interrupt Mask
      WAKEUP         : IMR_WAKEUP_Field := 16#0#;
      --  Read-only. Timer Overflow Interrupt Mask
      TOVF           : IMR_TOVF_Field := 16#0#;
      --  Read-only. Timestamp Interrupt Mask
      TSTP           : IMR_TSTP_Field := 16#0#;
      --  Read-only. CRC Error Interrupt Mask
      CERR           : IMR_CERR_Field := 16#0#;
      --  Read-only. Stuffing Error Interrupt Mask
      SERR           : IMR_SERR_Field := 16#0#;
      --  Read-only. Acknowledgment Error Interrupt Mask
      AERR           : IMR_AERR_Field := 16#0#;
      --  Read-only. Form Error Interrupt Mask
      FERR           : IMR_FERR_Field := 16#0#;
      --  Read-only. Bit Error Interrupt Mask
      BERR           : IMR_BERR_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
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

   -----------------
   -- SR_Register --
   -----------------

   -----------
   -- SR.MB --
   -----------

   --  SR_MB array element
   subtype SR_MB_Element is ATSAM3X8E.Bit;

   --  SR_MB array
   type SR_MB_Field_Array is array (0 .. 7) of SR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for SR_MB
   type SR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : SR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for SR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype SR_ERRA_Field is ATSAM3X8E.Bit;
   subtype SR_WARN_Field is ATSAM3X8E.Bit;
   subtype SR_ERRP_Field is ATSAM3X8E.Bit;
   subtype SR_BOFF_Field is ATSAM3X8E.Bit;
   subtype SR_SLEEP_Field is ATSAM3X8E.Bit;
   subtype SR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype SR_TOVF_Field is ATSAM3X8E.Bit;
   subtype SR_TSTP_Field is ATSAM3X8E.Bit;
   subtype SR_CERR_Field is ATSAM3X8E.Bit;
   subtype SR_SERR_Field is ATSAM3X8E.Bit;
   subtype SR_AERR_Field is ATSAM3X8E.Bit;
   subtype SR_FERR_Field is ATSAM3X8E.Bit;
   subtype SR_BERR_Field is ATSAM3X8E.Bit;
   subtype SR_RBSY_Field is ATSAM3X8E.Bit;
   subtype SR_TBSY_Field is ATSAM3X8E.Bit;
   subtype SR_OVLSY_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. Mailbox 0 Event
      MB            : SR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_15 : ATSAM3X8E.Byte;
      --  Read-only. Error Active Mode
      ERRA          : SR_ERRA_Field := 16#0#;
      --  Read-only. Warning Limit
      WARN          : SR_WARN_Field := 16#0#;
      --  Read-only. Error Passive Mode
      ERRP          : SR_ERRP_Field := 16#0#;
      --  Read-only. Bus Off Mode
      BOFF          : SR_BOFF_Field := 16#0#;
      --  Read-only. CAN controller in Low power Mode
      SLEEP         : SR_SLEEP_Field := 16#0#;
      --  Read-only. CAN controller is not in Low power Mode
      WAKEUP        : SR_WAKEUP_Field := 16#0#;
      --  Read-only. Timer Overflow
      TOVF          : SR_TOVF_Field := 16#0#;
      --  Read-only.
      TSTP          : SR_TSTP_Field := 16#0#;
      --  Read-only. Mailbox CRC Error
      CERR          : SR_CERR_Field := 16#0#;
      --  Read-only. Mailbox Stuffing Error
      SERR          : SR_SERR_Field := 16#0#;
      --  Read-only. Acknowledgment Error
      AERR          : SR_AERR_Field := 16#0#;
      --  Read-only. Form Error
      FERR          : SR_FERR_Field := 16#0#;
      --  Read-only. Bit Error
      BERR          : SR_BERR_Field := 16#0#;
      --  Read-only. Receiver busy
      RBSY          : SR_RBSY_Field := 16#0#;
      --  Read-only. Transmitter busy
      TBSY          : SR_TBSY_Field := 16#0#;
      --  Read-only. Overload busy
      OVLSY         : SR_OVLSY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
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

   -----------------
   -- BR_Register --
   -----------------

   subtype BR_PHASE2_Field is ATSAM3X8E.UInt3;
   subtype BR_PHASE1_Field is ATSAM3X8E.UInt3;
   subtype BR_PROPAG_Field is ATSAM3X8E.UInt3;
   subtype BR_SJW_Field is ATSAM3X8E.UInt2;
   subtype BR_BRP_Field is ATSAM3X8E.UInt7;

   --  Sampling Mode
   type SMP_Field is
     (
      --  The incoming bit stream is sampled once at sample point.
      Once,
      --  The incoming bit stream is sampled three times with a period of a MCK
      --  clock period, centered on sample point.
      Three)
     with Size => 1;
   for SMP_Field use
     (Once => 0,
      Three => 1);

   --  Baudrate Register
   type BR_Register is record
      --  Phase 2 segment
      PHASE2         : BR_PHASE2_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : ATSAM3X8E.Bit := 16#0#;
      --  Phase 1 segment
      PHASE1         : BR_PHASE1_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Programming time segment
      PROPAG         : BR_PROPAG_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Re-synchronization jump width
      SJW            : BR_SJW_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Baudrate Prescaler.
      BRP            : BR_BRP_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  Sampling Mode
      SMP            : SMP_Field := Once;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BR_Register use record
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

   ------------------
   -- TIM_Register --
   ------------------

   subtype TIM_TIMER_Field is ATSAM3X8E.Short;

   --  Timer Register
   type TIM_Register is record
      --  Read-only. Timer
      TIMER          : TIM_TIMER_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TIM_Register use record
      TIMER          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ----------------------
   -- TIMESTP_Register --
   ----------------------

   subtype TIMESTP_MTIMESTAMP_Field is ATSAM3X8E.Short;

   --  Timestamp Register
   type TIMESTP_Register is record
      --  Read-only. Timestamp
      MTIMESTAMP     : TIMESTP_MTIMESTAMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TIMESTP_Register use record
      MTIMESTAMP     at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- ECR_Register --
   ------------------

   subtype ECR_REC_Field is ATSAM3X8E.Byte;
   subtype ECR_TEC_Field is ATSAM3X8E.Byte;

   --  Error Counter Register
   type ECR_Register is record
      --  Read-only. Receive Error Counter
      REC            : ECR_REC_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Transmit Error Counter
      TEC            : ECR_TEC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECR_Register use record
      REC            at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      TEC            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- TCR_Register --
   ------------------

   ------------
   -- TCR.MB --
   ------------

   --  TCR_MB array element
   subtype TCR_MB_Element is ATSAM3X8E.Bit;

   --  TCR_MB array
   type TCR_MB_Field_Array is array (0 .. 7) of TCR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for TCR_MB
   type TCR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : TCR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   subtype TCR_TIMRST_Field is ATSAM3X8E.Bit;

   --  Transfer Command Register
   type TCR_Register is record
      --  Write-only. Transfer Request for Mailbox 0
      MB            : TCR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_30 : ATSAM3X8E.UInt23 := 16#0#;
      --  Write-only. Timer Reset
      TIMRST        : TCR_TIMRST_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TCR_Register use record
      MB            at 0 range 0 .. 7;
      Reserved_8_30 at 0 range 8 .. 30;
      TIMRST        at 0 range 31 .. 31;
   end record;

   ------------------
   -- ACR_Register --
   ------------------

   ------------
   -- ACR.MB --
   ------------

   --  ACR_MB array element
   subtype ACR_MB_Element is ATSAM3X8E.Bit;

   --  ACR_MB array
   type ACR_MB_Field_Array is array (0 .. 7) of ACR_MB_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for ACR_MB
   type ACR_MB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MB as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  MB as an array
            Arr : ACR_MB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ACR_MB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Abort Command Register
   type ACR_Register is record
      --  Write-only. Abort Request for Mailbox 0
      MB            : ACR_MB_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      MB            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type WPMR_Register is record
      --  Write Protection Enable
      WPEN         : WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  SPI Write Protection Key Password
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
   subtype WPSR_WPVSRC_Field is ATSAM3X8E.Byte;

   --  Write Protect Status Register
   type WPSR_Register is record
      --  Read-only. Write Protection Violation Status
      WPVS           : WPSR_WPVS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protection Violation Source
      WPVSRC         : WPSR_WPVSRC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- MMR_Register --
   ------------------

   subtype MMR0_MTIMEMARK_Field is ATSAM3X8E.Short;
   subtype MMR0_PRIOR_Field is ATSAM3X8E.UInt4;

   --  Mailbox Object Type
   type MOT_Field is
     (
      --  Mailbox is disabled. This prevents receiving or transmitting any
      --  messages with this mailbox.
      Mb_Disabled,
      --  Reception Mailbox. Mailbox is configured for reception. If a message
      --  is received while the mailbox data register is full, it is discarded.
      Mb_Rx,
      --  Reception mailbox with overwrite. Mailbox is configured for
      --  reception. If a message is received while the mailbox is full, it
      --  overwrites the previous message.
      Mb_Rx_Overwrite,
      --  Transmit mailbox. Mailbox is configured for transmission.
      Mb_Tx,
      --  Consumer Mailbox. Mailbox is configured in reception but behaves as a
      --  Transmit Mailbox, i.e., it sends a remote frame and waits for an
      --  answer.
      Mb_Consumer,
      --  Producer Mailbox. Mailbox is configured in transmission but also
      --  behaves like a reception mailbox, i.e., it waits to receive a Remote
      --  Frame before sending its contents.
      Mb_Producer)
     with Size => 3;
   for MOT_Field use
     (Mb_Disabled => 0,
      Mb_Rx => 1,
      Mb_Rx_Overwrite => 2,
      Mb_Tx => 3,
      Mb_Consumer => 4,
      Mb_Producer => 5);

   --  Mailbox Mode Register (MB = 0)
   type MMR_Register is record
      --  Mailbox Timemark
      MTIMEMARK      : MMR0_MTIMEMARK_Field := 16#0#;
      --  Mailbox Priority
      PRIOR          : MMR0_PRIOR_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Mailbox Object Type
      MOT            : MOT_Field := Mb_Disabled;
      --  unspecified
      Reserved_27_31 : ATSAM3X8E.UInt5 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MMR_Register use record
      MTIMEMARK      at 0 range 0 .. 15;
      PRIOR          at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      MOT            at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   ------------------
   -- MAM_Register --
   ------------------

   subtype MAM0_MIDvB_Field is ATSAM3X8E.UInt18;
   subtype MAM0_MIDvA_Field is ATSAM3X8E.UInt11;
   subtype MAM0_MIDE_Field is ATSAM3X8E.Bit;

   --  Mailbox Acceptance Mask Register (MB = 0)
   type MAM_Register is record
      --  Complementary bits for identifier in extended frame mode
      MIDvB          : MAM0_MIDvB_Field := 16#0#;
      --  Identifier for standard frame mode
      MIDvA          : MAM0_MIDvA_Field := 16#0#;
      --  Identifier Version
      MIDE           : MAM0_MIDE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MAM_Register use record
      MIDvB          at 0 range 0 .. 17;
      MIDvA          at 0 range 18 .. 28;
      MIDE           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   ------------------
   -- MID_Register --
   ------------------

   subtype MID0_MIDvB_Field is ATSAM3X8E.UInt18;
   subtype MID0_MIDvA_Field is ATSAM3X8E.UInt11;
   subtype MID0_MIDE_Field is ATSAM3X8E.Bit;

   --  Mailbox ID Register (MB = 0)
   type MID_Register is record
      --  Complementary bits for identifier in extended frame mode
      MIDvB          : MID0_MIDvB_Field := 16#0#;
      --  Identifier for standard frame mode
      MIDvA          : MID0_MIDvA_Field := 16#0#;
      --  Identifier Version
      MIDE           : MID0_MIDE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MID_Register use record
      MIDvB          at 0 range 0 .. 17;
      MIDvA          at 0 range 18 .. 28;
      MIDE           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -------------------
   -- MFID_Register --
   -------------------

   subtype MFID0_MFID_Field is ATSAM3X8E.UInt29;

   --  Mailbox Family ID Register (MB = 0)
   type MFID_Register is record
      --  Read-only. Family ID
      MFID           : MFID0_MFID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : ATSAM3X8E.UInt3;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MFID_Register use record
      MFID           at 0 range 0 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   ------------------
   -- MSR_Register --
   ------------------

   subtype MSR0_MTIMESTAMP_Field is ATSAM3X8E.Short;
   subtype MSR0_MDLC_Field is ATSAM3X8E.UInt4;
   subtype MSR0_MRTR_Field is ATSAM3X8E.Bit;
   subtype MSR0_MABT_Field is ATSAM3X8E.Bit;
   subtype MSR0_MRDY_Field is ATSAM3X8E.Bit;
   subtype MSR0_MMI_Field is ATSAM3X8E.Bit;

   --  Mailbox Status Register (MB = 0)
   type MSR_Register is record
      --  Read-only. Timer value
      MTIMESTAMP     : MSR0_MTIMESTAMP_Field := 16#0#;
      --  Read-only. Mailbox Data Length Code
      MDLC           : MSR0_MDLC_Field := 16#0#;
      --  Read-only. Mailbox Remote Transmission Request
      MRTR           : MSR0_MRTR_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : ATSAM3X8E.Bit;
      --  Read-only. Mailbox Message Abort
      MABT           : MSR0_MABT_Field := 16#0#;
      --  Read-only. Mailbox Ready
      MRDY           : MSR0_MRDY_Field := 16#0#;
      --  Read-only. Mailbox Message Ignored
      MMI            : MSR0_MMI_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   ------------------
   -- MCR_Register --
   ------------------

   subtype MCR0_MDLC_Field is ATSAM3X8E.UInt4;
   subtype MCR0_MRTR_Field is ATSAM3X8E.Bit;
   subtype MCR0_MACR_Field is ATSAM3X8E.Bit;
   subtype MCR0_MTCR_Field is ATSAM3X8E.Bit;

   --  Mailbox Control Register (MB = 0)
   type MCR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.Short := 16#0#;
      --  Write-only. Mailbox Data Length Code
      MDLC           : MCR0_MDLC_Field := 16#0#;
      --  Write-only. Mailbox Remote Transmission Request
      MRTR           : MCR0_MRTR_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Abort Request for Mailbox x
      MACR           : MCR0_MACR_Field := 16#0#;
      --  Write-only. Mailbox Transfer Command
      MTCR           : MCR0_MTCR_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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
      MR      : MR_Register;
      --  Interrupt Enable Register
      IER     : IER_Register;
      --  Interrupt Disable Register
      IDR     : IDR_Register;
      --  Interrupt Mask Register
      IMR     : IMR_Register;
      --  Status Register
      SR      : SR_Register;
      --  Baudrate Register
      BR      : BR_Register;
      --  Timer Register
      TIM     : TIM_Register;
      --  Timestamp Register
      TIMESTP : TIMESTP_Register;
      --  Error Counter Register
      ECR     : ECR_Register;
      --  Transfer Command Register
      TCR     : TCR_Register;
      --  Abort Command Register
      ACR     : ACR_Register;
      --  Write Protect Mode Register
      WPMR    : WPMR_Register;
      --  Write Protect Status Register
      WPSR    : WPSR_Register;
      --  Mailbox Mode Register (MB = 0)
      MMR0    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 0)
      MAM0    : MAM_Register;
      --  Mailbox ID Register (MB = 0)
      MID0    : MID_Register;
      --  Mailbox Family ID Register (MB = 0)
      MFID0   : MFID_Register;
      --  Mailbox Status Register (MB = 0)
      MSR0    : MSR_Register;
      --  Mailbox Data Low Register (MB = 0)
      MDL0    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 0)
      MDH0    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 0)
      MCR0    : MCR_Register;
      --  Mailbox Mode Register (MB = 1)
      MMR1    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 1)
      MAM1    : MAM_Register;
      --  Mailbox ID Register (MB = 1)
      MID1    : MID_Register;
      --  Mailbox Family ID Register (MB = 1)
      MFID1   : MFID_Register;
      --  Mailbox Status Register (MB = 1)
      MSR1    : MSR_Register;
      --  Mailbox Data Low Register (MB = 1)
      MDL1    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 1)
      MDH1    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 1)
      MCR1    : MCR_Register;
      --  Mailbox Mode Register (MB = 2)
      MMR2    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 2)
      MAM2    : MAM_Register;
      --  Mailbox ID Register (MB = 2)
      MID2    : MID_Register;
      --  Mailbox Family ID Register (MB = 2)
      MFID2   : MFID_Register;
      --  Mailbox Status Register (MB = 2)
      MSR2    : MSR_Register;
      --  Mailbox Data Low Register (MB = 2)
      MDL2    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 2)
      MDH2    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 2)
      MCR2    : MCR_Register;
      --  Mailbox Mode Register (MB = 3)
      MMR3    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 3)
      MAM3    : MAM_Register;
      --  Mailbox ID Register (MB = 3)
      MID3    : MID_Register;
      --  Mailbox Family ID Register (MB = 3)
      MFID3   : MFID_Register;
      --  Mailbox Status Register (MB = 3)
      MSR3    : MSR_Register;
      --  Mailbox Data Low Register (MB = 3)
      MDL3    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 3)
      MDH3    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 3)
      MCR3    : MCR_Register;
      --  Mailbox Mode Register (MB = 4)
      MMR4    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 4)
      MAM4    : MAM_Register;
      --  Mailbox ID Register (MB = 4)
      MID4    : MID_Register;
      --  Mailbox Family ID Register (MB = 4)
      MFID4   : MFID_Register;
      --  Mailbox Status Register (MB = 4)
      MSR4    : MSR_Register;
      --  Mailbox Data Low Register (MB = 4)
      MDL4    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 4)
      MDH4    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 4)
      MCR4    : MCR_Register;
      --  Mailbox Mode Register (MB = 5)
      MMR5    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 5)
      MAM5    : MAM_Register;
      --  Mailbox ID Register (MB = 5)
      MID5    : MID_Register;
      --  Mailbox Family ID Register (MB = 5)
      MFID5   : MFID_Register;
      --  Mailbox Status Register (MB = 5)
      MSR5    : MSR_Register;
      --  Mailbox Data Low Register (MB = 5)
      MDL5    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 5)
      MDH5    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 5)
      MCR5    : MCR_Register;
      --  Mailbox Mode Register (MB = 6)
      MMR6    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 6)
      MAM6    : MAM_Register;
      --  Mailbox ID Register (MB = 6)
      MID6    : MID_Register;
      --  Mailbox Family ID Register (MB = 6)
      MFID6   : MFID_Register;
      --  Mailbox Status Register (MB = 6)
      MSR6    : MSR_Register;
      --  Mailbox Data Low Register (MB = 6)
      MDL6    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 6)
      MDH6    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 6)
      MCR6    : MCR_Register;
      --  Mailbox Mode Register (MB = 7)
      MMR7    : MMR_Register;
      --  Mailbox Acceptance Mask Register (MB = 7)
      MAM7    : MAM_Register;
      --  Mailbox ID Register (MB = 7)
      MID7    : MID_Register;
      --  Mailbox Family ID Register (MB = 7)
      MFID7   : MFID_Register;
      --  Mailbox Status Register (MB = 7)
      MSR7    : MSR_Register;
      --  Mailbox Data Low Register (MB = 7)
      MDL7    : ATSAM3X8E.Word;
      --  Mailbox Data High Register (MB = 7)
      MDH7    : ATSAM3X8E.Word;
      --  Mailbox Control Register (MB = 7)
      MCR7    : MCR_Register;
   end record
     with Volatile;

   for CAN_Peripheral use record
      MR      at 0 range 0 .. 31;
      IER     at 4 range 0 .. 31;
      IDR     at 8 range 0 .. 31;
      IMR     at 12 range 0 .. 31;
      SR      at 16 range 0 .. 31;
      BR      at 20 range 0 .. 31;
      TIM     at 24 range 0 .. 31;
      TIMESTP at 28 range 0 .. 31;
      ECR     at 32 range 0 .. 31;
      TCR     at 36 range 0 .. 31;
      ACR     at 40 range 0 .. 31;
      WPMR    at 228 range 0 .. 31;
      WPSR    at 232 range 0 .. 31;
      MMR0    at 512 range 0 .. 31;
      MAM0    at 516 range 0 .. 31;
      MID0    at 520 range 0 .. 31;
      MFID0   at 524 range 0 .. 31;
      MSR0    at 528 range 0 .. 31;
      MDL0    at 532 range 0 .. 31;
      MDH0    at 536 range 0 .. 31;
      MCR0    at 540 range 0 .. 31;
      MMR1    at 544 range 0 .. 31;
      MAM1    at 548 range 0 .. 31;
      MID1    at 552 range 0 .. 31;
      MFID1   at 556 range 0 .. 31;
      MSR1    at 560 range 0 .. 31;
      MDL1    at 564 range 0 .. 31;
      MDH1    at 568 range 0 .. 31;
      MCR1    at 572 range 0 .. 31;
      MMR2    at 576 range 0 .. 31;
      MAM2    at 580 range 0 .. 31;
      MID2    at 584 range 0 .. 31;
      MFID2   at 588 range 0 .. 31;
      MSR2    at 592 range 0 .. 31;
      MDL2    at 596 range 0 .. 31;
      MDH2    at 600 range 0 .. 31;
      MCR2    at 604 range 0 .. 31;
      MMR3    at 608 range 0 .. 31;
      MAM3    at 612 range 0 .. 31;
      MID3    at 616 range 0 .. 31;
      MFID3   at 620 range 0 .. 31;
      MSR3    at 624 range 0 .. 31;
      MDL3    at 628 range 0 .. 31;
      MDH3    at 632 range 0 .. 31;
      MCR3    at 636 range 0 .. 31;
      MMR4    at 640 range 0 .. 31;
      MAM4    at 644 range 0 .. 31;
      MID4    at 648 range 0 .. 31;
      MFID4   at 652 range 0 .. 31;
      MSR4    at 656 range 0 .. 31;
      MDL4    at 660 range 0 .. 31;
      MDH4    at 664 range 0 .. 31;
      MCR4    at 668 range 0 .. 31;
      MMR5    at 672 range 0 .. 31;
      MAM5    at 676 range 0 .. 31;
      MID5    at 680 range 0 .. 31;
      MFID5   at 684 range 0 .. 31;
      MSR5    at 688 range 0 .. 31;
      MDL5    at 692 range 0 .. 31;
      MDH5    at 696 range 0 .. 31;
      MCR5    at 700 range 0 .. 31;
      MMR6    at 704 range 0 .. 31;
      MAM6    at 708 range 0 .. 31;
      MID6    at 712 range 0 .. 31;
      MFID6   at 716 range 0 .. 31;
      MSR6    at 720 range 0 .. 31;
      MDL6    at 724 range 0 .. 31;
      MDH6    at 728 range 0 .. 31;
      MCR6    at 732 range 0 .. 31;
      MMR7    at 736 range 0 .. 31;
      MAM7    at 740 range 0 .. 31;
      MID7    at 744 range 0 .. 31;
      MFID7   at 748 range 0 .. 31;
      MSR7    at 752 range 0 .. 31;
      MDL7    at 756 range 0 .. 31;
      MDH7    at 760 range 0 .. 31;
      MCR7    at 764 range 0 .. 31;
   end record;

   --  Controller Area Network 0
   CAN0_Periph : aliased CAN_Peripheral
     with Import, Address => CAN0_Base;

   --  Controller Area Network 1
   CAN1_Periph : aliased CAN_Peripheral
     with Import, Address => CAN1_Base;

end ATSAM3X8E.CAN;
