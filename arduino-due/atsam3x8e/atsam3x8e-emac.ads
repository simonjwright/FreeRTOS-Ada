--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Ethernet MAC 10/100
package ATSAM3X8E.EMAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- NCR_Register --
   ------------------

   subtype NCR_LB_Field is ATSAM3X8E.Bit;
   subtype NCR_LLB_Field is ATSAM3X8E.Bit;
   subtype NCR_RE_Field is ATSAM3X8E.Bit;
   subtype NCR_TE_Field is ATSAM3X8E.Bit;
   subtype NCR_MPE_Field is ATSAM3X8E.Bit;
   subtype NCR_CLRSTAT_Field is ATSAM3X8E.Bit;
   subtype NCR_INCSTAT_Field is ATSAM3X8E.Bit;
   subtype NCR_WESTAT_Field is ATSAM3X8E.Bit;
   subtype NCR_BP_Field is ATSAM3X8E.Bit;
   subtype NCR_TSTART_Field is ATSAM3X8E.Bit;
   subtype NCR_THALT_Field is ATSAM3X8E.Bit;

   --  Network Control Register
   type NCR_Register is record
      --  LoopBack
      LB             : NCR_LB_Field := 16#0#;
      --  Loopback local
      LLB            : NCR_LLB_Field := 16#0#;
      --  Receive enable
      RE             : NCR_RE_Field := 16#0#;
      --  Transmit enable
      TE             : NCR_TE_Field := 16#0#;
      --  Management port enable
      MPE            : NCR_MPE_Field := 16#0#;
      --  Clear statistics registers
      CLRSTAT        : NCR_CLRSTAT_Field := 16#0#;
      --  Increment statistics registers
      INCSTAT        : NCR_INCSTAT_Field := 16#0#;
      --  Write enable for statistics registers
      WESTAT         : NCR_WESTAT_Field := 16#0#;
      --  Back pressure
      BP             : NCR_BP_Field := 16#0#;
      --  Start transmission
      TSTART         : NCR_TSTART_Field := 16#0#;
      --  Transmit halt
      THALT          : NCR_THALT_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for NCR_Register use record
      LB             at 0 range 0 .. 0;
      LLB            at 0 range 1 .. 1;
      RE             at 0 range 2 .. 2;
      TE             at 0 range 3 .. 3;
      MPE            at 0 range 4 .. 4;
      CLRSTAT        at 0 range 5 .. 5;
      INCSTAT        at 0 range 6 .. 6;
      WESTAT         at 0 range 7 .. 7;
      BP             at 0 range 8 .. 8;
      TSTART         at 0 range 9 .. 9;
      THALT          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --------------------
   -- NCFGR_Register --
   --------------------

   subtype NCFGR_SPD_Field is ATSAM3X8E.Bit;
   subtype NCFGR_FD_Field is ATSAM3X8E.Bit;
   subtype NCFGR_JFRAME_Field is ATSAM3X8E.Bit;
   subtype NCFGR_CAF_Field is ATSAM3X8E.Bit;
   subtype NCFGR_NBC_Field is ATSAM3X8E.Bit;
   subtype NCFGR_MTI_Field is ATSAM3X8E.Bit;
   subtype NCFGR_UNI_Field is ATSAM3X8E.Bit;
   subtype NCFGR_BIG_Field is ATSAM3X8E.Bit;

   --  MDC clock divider
   type CLK_Field is
     (
      --  MCK divided by 8 (MCK up to 20 MHz).
      Mck_8,
      --  MCK divided by 16 (MCK up to 40 MHz).
      Mck_16,
      --  MCK divided by 32 (MCK up to 80 MHz).
      Mck_32,
      --  MCK divided by 64 (MCK up to 160 MHz).
      Mck_64)
     with Size => 2;
   for CLK_Field use
     (Mck_8 => 0,
      Mck_16 => 1,
      Mck_32 => 2,
      Mck_64 => 3);

   subtype NCFGR_RTY_Field is ATSAM3X8E.Bit;
   subtype NCFGR_PAE_Field is ATSAM3X8E.Bit;

   --  Receive Buffer Offset
   type RBOF_Field is
     (
      --  No offset from start of receive buffer.
      Offset_0,
      --  One-byte offset from start of receive buffer.
      Offset_1,
      --  Two-byte offset from start of receive buffer.
      Offset_2,
      --  Three-byte offset from start of receive buffer.
      Offset_3)
     with Size => 2;
   for RBOF_Field use
     (Offset_0 => 0,
      Offset_1 => 1,
      Offset_2 => 2,
      Offset_3 => 3);

   subtype NCFGR_RLCE_Field is ATSAM3X8E.Bit;
   subtype NCFGR_DRFCS_Field is ATSAM3X8E.Bit;
   subtype NCFGR_EFRHD_Field is ATSAM3X8E.Bit;
   subtype NCFGR_IRXFCS_Field is ATSAM3X8E.Bit;

   --  Network Configuration Register
   type NCFGR_Register is record
      --  Speed
      SPD            : NCFGR_SPD_Field := 16#0#;
      --  Full Duplex
      FD             : NCFGR_FD_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Jumbo Frames
      JFRAME         : NCFGR_JFRAME_Field := 16#0#;
      --  Copy All Frames
      CAF            : NCFGR_CAF_Field := 16#0#;
      --  No Broadcast
      NBC            : NCFGR_NBC_Field := 16#0#;
      --  Multicast Hash Enable
      MTI            : NCFGR_MTI_Field := 16#0#;
      --  Unicast Hash Enable
      UNI            : NCFGR_UNI_Field := 16#0#;
      --  Receive 1536 bytes frames
      BIG            : NCFGR_BIG_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : ATSAM3X8E.Bit := 16#0#;
      --  MDC clock divider
      CLK            : CLK_Field := Mck_32;
      --  Retry test
      RTY            : NCFGR_RTY_Field := 16#0#;
      --  Pause Enable
      PAE            : NCFGR_PAE_Field := 16#0#;
      --  Receive Buffer Offset
      RBOF           : RBOF_Field := Offset_0;
      --  Receive Length field Checking Enable
      RLCE           : NCFGR_RLCE_Field := 16#0#;
      --  Discard Receive FCS
      DRFCS          : NCFGR_DRFCS_Field := 16#0#;
      EFRHD          : NCFGR_EFRHD_Field := 16#0#;
      --  Ignore RX FCS
      IRXFCS         : NCFGR_IRXFCS_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for NCFGR_Register use record
      SPD            at 0 range 0 .. 0;
      FD             at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      JFRAME         at 0 range 3 .. 3;
      CAF            at 0 range 4 .. 4;
      NBC            at 0 range 5 .. 5;
      MTI            at 0 range 6 .. 6;
      UNI            at 0 range 7 .. 7;
      BIG            at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      CLK            at 0 range 10 .. 11;
      RTY            at 0 range 12 .. 12;
      PAE            at 0 range 13 .. 13;
      RBOF           at 0 range 14 .. 15;
      RLCE           at 0 range 16 .. 16;
      DRFCS          at 0 range 17 .. 17;
      EFRHD          at 0 range 18 .. 18;
      IRXFCS         at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   ------------------
   -- NSR_Register --
   ------------------

   subtype NSR_MDIO_Field is ATSAM3X8E.Bit;
   subtype NSR_IDLE_Field is ATSAM3X8E.Bit;

   --  Network Status Register
   type NSR_Register is record
      --  unspecified
      Reserved_0_0  : ATSAM3X8E.Bit;
      --  Read-only.
      MDIO          : NSR_MDIO_Field := 16#0#;
      --  Read-only.
      IDLE          : NSR_IDLE_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for NSR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      MDIO          at 0 range 1 .. 1;
      IDLE          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------
   -- TSR_Register --
   ------------------

   subtype TSR_UBR_Field is ATSAM3X8E.Bit;
   subtype TSR_COL_Field is ATSAM3X8E.Bit;
   subtype TSR_RLES_Field is ATSAM3X8E.Bit;
   subtype TSR_TGO_Field is ATSAM3X8E.Bit;
   subtype TSR_BEX_Field is ATSAM3X8E.Bit;
   subtype TSR_COMP_Field is ATSAM3X8E.Bit;
   subtype TSR_UND_Field is ATSAM3X8E.Bit;

   --  Transmit Status Register
   type TSR_Register is record
      --  Used Bit Read
      UBR           : TSR_UBR_Field := 16#0#;
      --  Collision Occurred
      COL           : TSR_COL_Field := 16#0#;
      --  Retry Limit exceeded
      RLES          : TSR_RLES_Field := 16#0#;
      --  Transmit Go
      TGO           : TSR_TGO_Field := 16#0#;
      --  Buffers exhausted mid frame
      BEX           : TSR_BEX_Field := 16#0#;
      --  Transmit Complete
      COMP          : TSR_COMP_Field := 16#0#;
      --  Transmit Underrun
      UND           : TSR_UND_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TSR_Register use record
      UBR           at 0 range 0 .. 0;
      COL           at 0 range 1 .. 1;
      RLES          at 0 range 2 .. 2;
      TGO           at 0 range 3 .. 3;
      BEX           at 0 range 4 .. 4;
      COMP          at 0 range 5 .. 5;
      UND           at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -------------------
   -- RBQP_Register --
   -------------------

   subtype RBQP_ADDR_Field is ATSAM3X8E.UInt30;

   --  Receive Buffer Queue Pointer Register
   type RBQP_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2 := 16#0#;
      --  Receive buffer queue pointer address
      ADDR         : RBQP_ADDR_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RBQP_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      ADDR         at 0 range 2 .. 31;
   end record;

   -------------------
   -- TBQP_Register --
   -------------------

   subtype TBQP_ADDR_Field is ATSAM3X8E.UInt30;

   --  Transmit Buffer Queue Pointer Register
   type TBQP_Register is record
      --  unspecified
      Reserved_0_1 : ATSAM3X8E.UInt2 := 16#0#;
      --  Transmit buffer queue pointer address
      ADDR         : TBQP_ADDR_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TBQP_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      ADDR         at 0 range 2 .. 31;
   end record;

   ------------------
   -- RSR_Register --
   ------------------

   subtype RSR_BNA_Field is ATSAM3X8E.Bit;
   subtype RSR_REC_Field is ATSAM3X8E.Bit;
   subtype RSR_OVR_Field is ATSAM3X8E.Bit;

   --  Receive Status Register
   type RSR_Register is record
      --  Buffer Not Available
      BNA           : RSR_BNA_Field := 16#0#;
      --  Frame Received
      REC           : RSR_REC_Field := 16#0#;
      --  Receive Overrun
      OVR           : RSR_OVR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RSR_Register use record
      BNA           at 0 range 0 .. 0;
      REC           at 0 range 1 .. 1;
      OVR           at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------
   -- ISR_Register --
   ------------------

   subtype ISR_MFD_Field is ATSAM3X8E.Bit;
   subtype ISR_RCOMP_Field is ATSAM3X8E.Bit;
   subtype ISR_RXUBR_Field is ATSAM3X8E.Bit;
   subtype ISR_TXUBR_Field is ATSAM3X8E.Bit;
   subtype ISR_TUND_Field is ATSAM3X8E.Bit;
   subtype ISR_RLEX_Field is ATSAM3X8E.Bit;
   subtype ISR_TXERR_Field is ATSAM3X8E.Bit;
   subtype ISR_TCOMP_Field is ATSAM3X8E.Bit;
   subtype ISR_ROVR_Field is ATSAM3X8E.Bit;
   subtype ISR_HRESP_Field is ATSAM3X8E.Bit;
   subtype ISR_PFRE_Field is ATSAM3X8E.Bit;
   subtype ISR_PTZ_Field is ATSAM3X8E.Bit;

   --  Interrupt Status Register
   type ISR_Register is record
      --  Management Frame Done
      MFD            : ISR_MFD_Field := 16#0#;
      --  Receive Complete
      RCOMP          : ISR_RCOMP_Field := 16#0#;
      --  Receive Used Bit Read
      RXUBR          : ISR_RXUBR_Field := 16#0#;
      --  Transmit Used Bit Read
      TXUBR          : ISR_TXUBR_Field := 16#0#;
      --  Ethernet Transmit Buffer Underrun
      TUND           : ISR_TUND_Field := 16#0#;
      --  Retry Limit Exceeded
      RLEX           : ISR_RLEX_Field := 16#0#;
      --  Transmit Error
      TXERR          : ISR_TXERR_Field := 16#0#;
      --  Transmit Complete
      TCOMP          : ISR_TCOMP_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : ATSAM3X8E.UInt2 := 16#0#;
      --  Receive Overrun
      ROVR           : ISR_ROVR_Field := 16#0#;
      --  Hresp not OK
      HRESP          : ISR_HRESP_Field := 16#0#;
      --  Pause Frame Received
      PFRE           : ISR_PFRE_Field := 16#0#;
      --  Pause Time Zero
      PTZ            : ISR_PTZ_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      MFD            at 0 range 0 .. 0;
      RCOMP          at 0 range 1 .. 1;
      RXUBR          at 0 range 2 .. 2;
      TXUBR          at 0 range 3 .. 3;
      TUND           at 0 range 4 .. 4;
      RLEX           at 0 range 5 .. 5;
      TXERR          at 0 range 6 .. 6;
      TCOMP          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      ROVR           at 0 range 10 .. 10;
      HRESP          at 0 range 11 .. 11;
      PFRE           at 0 range 12 .. 12;
      PTZ            at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_MFD_Field is ATSAM3X8E.Bit;
   subtype IER_RCOMP_Field is ATSAM3X8E.Bit;
   subtype IER_RXUBR_Field is ATSAM3X8E.Bit;
   subtype IER_TXUBR_Field is ATSAM3X8E.Bit;
   subtype IER_TUND_Field is ATSAM3X8E.Bit;
   subtype IER_RLE_Field is ATSAM3X8E.Bit;
   subtype IER_TXERR_Field is ATSAM3X8E.Bit;
   subtype IER_TCOMP_Field is ATSAM3X8E.Bit;
   subtype IER_ROVR_Field is ATSAM3X8E.Bit;
   subtype IER_HRESP_Field is ATSAM3X8E.Bit;
   subtype IER_PFR_Field is ATSAM3X8E.Bit;
   subtype IER_PTZ_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Management Frame sent
      MFD            : IER_MFD_Field := 16#0#;
      --  Write-only. Receive Complete
      RCOMP          : IER_RCOMP_Field := 16#0#;
      --  Write-only. Receive Used Bit Read
      RXUBR          : IER_RXUBR_Field := 16#0#;
      --  Write-only. Transmit Used Bit Read
      TXUBR          : IER_TXUBR_Field := 16#0#;
      --  Write-only. Ethernet Transmit Buffer Underrun
      TUND           : IER_TUND_Field := 16#0#;
      --  Write-only. Retry Limit Exceeded
      RLE            : IER_RLE_Field := 16#0#;
      --  Write-only.
      TXERR          : IER_TXERR_Field := 16#0#;
      --  Write-only. Transmit Complete
      TCOMP          : IER_TCOMP_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Receive Overrun
      ROVR           : IER_ROVR_Field := 16#0#;
      --  Write-only. Hresp not OK
      HRESP          : IER_HRESP_Field := 16#0#;
      --  Write-only. Pause Frame Received
      PFR            : IER_PFR_Field := 16#0#;
      --  Write-only. Pause Time Zero
      PTZ            : IER_PTZ_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      MFD            at 0 range 0 .. 0;
      RCOMP          at 0 range 1 .. 1;
      RXUBR          at 0 range 2 .. 2;
      TXUBR          at 0 range 3 .. 3;
      TUND           at 0 range 4 .. 4;
      RLE            at 0 range 5 .. 5;
      TXERR          at 0 range 6 .. 6;
      TCOMP          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      ROVR           at 0 range 10 .. 10;
      HRESP          at 0 range 11 .. 11;
      PFR            at 0 range 12 .. 12;
      PTZ            at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_MFD_Field is ATSAM3X8E.Bit;
   subtype IDR_RCOMP_Field is ATSAM3X8E.Bit;
   subtype IDR_RXUBR_Field is ATSAM3X8E.Bit;
   subtype IDR_TXUBR_Field is ATSAM3X8E.Bit;
   subtype IDR_TUND_Field is ATSAM3X8E.Bit;
   subtype IDR_RLE_Field is ATSAM3X8E.Bit;
   subtype IDR_TXERR_Field is ATSAM3X8E.Bit;
   subtype IDR_TCOMP_Field is ATSAM3X8E.Bit;
   subtype IDR_ROVR_Field is ATSAM3X8E.Bit;
   subtype IDR_HRESP_Field is ATSAM3X8E.Bit;
   subtype IDR_PFR_Field is ATSAM3X8E.Bit;
   subtype IDR_PTZ_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Management Frame sent
      MFD            : IDR_MFD_Field := 16#0#;
      --  Write-only. Receive Complete
      RCOMP          : IDR_RCOMP_Field := 16#0#;
      --  Write-only. Receive Used Bit Read
      RXUBR          : IDR_RXUBR_Field := 16#0#;
      --  Write-only. Transmit Used Bit Read
      TXUBR          : IDR_TXUBR_Field := 16#0#;
      --  Write-only. Ethernet Transmit Buffer Underrun
      TUND           : IDR_TUND_Field := 16#0#;
      --  Write-only. Retry Limit Exceeded
      RLE            : IDR_RLE_Field := 16#0#;
      --  Write-only.
      TXERR          : IDR_TXERR_Field := 16#0#;
      --  Write-only. Transmit Complete
      TCOMP          : IDR_TCOMP_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Receive Overrun
      ROVR           : IDR_ROVR_Field := 16#0#;
      --  Write-only. Hresp not OK
      HRESP          : IDR_HRESP_Field := 16#0#;
      --  Write-only. Pause Frame Received
      PFR            : IDR_PFR_Field := 16#0#;
      --  Write-only. Pause Time Zero
      PTZ            : IDR_PTZ_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      MFD            at 0 range 0 .. 0;
      RCOMP          at 0 range 1 .. 1;
      RXUBR          at 0 range 2 .. 2;
      TXUBR          at 0 range 3 .. 3;
      TUND           at 0 range 4 .. 4;
      RLE            at 0 range 5 .. 5;
      TXERR          at 0 range 6 .. 6;
      TCOMP          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      ROVR           at 0 range 10 .. 10;
      HRESP          at 0 range 11 .. 11;
      PFR            at 0 range 12 .. 12;
      PTZ            at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_MFD_Field is ATSAM3X8E.Bit;
   subtype IMR_RCOMP_Field is ATSAM3X8E.Bit;
   subtype IMR_RXUBR_Field is ATSAM3X8E.Bit;
   subtype IMR_TXUBR_Field is ATSAM3X8E.Bit;
   subtype IMR_TUND_Field is ATSAM3X8E.Bit;
   subtype IMR_RLE_Field is ATSAM3X8E.Bit;
   subtype IMR_TXERR_Field is ATSAM3X8E.Bit;
   subtype IMR_TCOMP_Field is ATSAM3X8E.Bit;
   subtype IMR_ROVR_Field is ATSAM3X8E.Bit;
   subtype IMR_HRESP_Field is ATSAM3X8E.Bit;
   subtype IMR_PFR_Field is ATSAM3X8E.Bit;
   subtype IMR_PTZ_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Management Frame sent
      MFD            : IMR_MFD_Field := 16#1#;
      --  Read-only. Receive Complete
      RCOMP          : IMR_RCOMP_Field := 16#1#;
      --  Read-only. Receive Used Bit Read
      RXUBR          : IMR_RXUBR_Field := 16#1#;
      --  Read-only. Transmit Used Bit Read
      TXUBR          : IMR_TXUBR_Field := 16#1#;
      --  Read-only. Ethernet Transmit Buffer Underrun
      TUND           : IMR_TUND_Field := 16#1#;
      --  Read-only. Retry Limit Exceeded
      RLE            : IMR_RLE_Field := 16#1#;
      --  Read-only.
      TXERR          : IMR_TXERR_Field := 16#1#;
      --  Read-only. Transmit Complete
      TCOMP          : IMR_TCOMP_Field := 16#1#;
      --  unspecified
      Reserved_8_9   : ATSAM3X8E.UInt2;
      --  Read-only. Receive Overrun
      ROVR           : IMR_ROVR_Field := 16#1#;
      --  Read-only. Hresp not OK
      HRESP          : IMR_HRESP_Field := 16#1#;
      --  Read-only. Pause Frame Received
      PFR            : IMR_PFR_Field := 16#1#;
      --  Read-only. Pause Time Zero
      PTZ            : IMR_PTZ_Field := 16#1#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      MFD            at 0 range 0 .. 0;
      RCOMP          at 0 range 1 .. 1;
      RXUBR          at 0 range 2 .. 2;
      TXUBR          at 0 range 3 .. 3;
      TUND           at 0 range 4 .. 4;
      RLE            at 0 range 5 .. 5;
      TXERR          at 0 range 6 .. 6;
      TCOMP          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      ROVR           at 0 range 10 .. 10;
      HRESP          at 0 range 11 .. 11;
      PFR            at 0 range 12 .. 12;
      PTZ            at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   ------------------
   -- MAN_Register --
   ------------------

   subtype MAN_DATA_Field is ATSAM3X8E.Short;
   subtype MAN_CODE_Field is ATSAM3X8E.UInt2;
   subtype MAN_REGA_Field is ATSAM3X8E.UInt5;
   subtype MAN_PHYA_Field is ATSAM3X8E.UInt5;
   subtype MAN_RW_Field is ATSAM3X8E.UInt2;
   subtype MAN_SOF_Field is ATSAM3X8E.UInt2;

   --  Phy Maintenance Register
   type MAN_Register is record
      DATA : MAN_DATA_Field := 16#0#;
      CODE : MAN_CODE_Field := 16#0#;
      --  Register Address
      REGA : MAN_REGA_Field := 16#0#;
      --  PHY Address
      PHYA : MAN_PHYA_Field := 16#0#;
      --  Read-write
      RW   : MAN_RW_Field := 16#0#;
      --  Start of frame
      SOF  : MAN_SOF_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MAN_Register use record
      DATA at 0 range 0 .. 15;
      CODE at 0 range 16 .. 17;
      REGA at 0 range 18 .. 22;
      PHYA at 0 range 23 .. 27;
      RW   at 0 range 28 .. 29;
      SOF  at 0 range 30 .. 31;
   end record;

   ------------------
   -- PTR_Register --
   ------------------

   subtype PTR_PTIME_Field is ATSAM3X8E.Short;

   --  Pause Time Register
   type PTR_Register is record
      --  Pause Time
      PTIME          : PTR_PTIME_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PTR_Register use record
      PTIME          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- PFR_Register --
   ------------------

   subtype PFR_FROK_Field is ATSAM3X8E.Short;

   --  Pause Frames Received Register
   type PFR_Register is record
      --  Pause Frames received OK
      FROK           : PFR_FROK_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PFR_Register use record
      FROK           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- FTO_Register --
   ------------------

   subtype FTO_FTOK_Field is ATSAM3X8E.UInt24;

   --  Frames Transmitted Ok Register
   type FTO_Register is record
      --  Frames Transmitted OK
      FTOK           : FTO_FTOK_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FTO_Register use record
      FTOK           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- SCF_Register --
   ------------------

   subtype SCF_SCF_Field is ATSAM3X8E.Short;

   --  Single Collision Frames Register
   type SCF_Register is record
      --  Single Collision Frames
      SCF            : SCF_SCF_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCF_Register use record
      SCF            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- MCF_Register --
   ------------------

   subtype MCF_MCF_Field is ATSAM3X8E.Short;

   --  Multiple Collision Frames Register
   type MCF_Register is record
      --  Multicollision Frames
      MCF            : MCF_MCF_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MCF_Register use record
      MCF            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- FRO_Register --
   ------------------

   subtype FRO_FROK_Field is ATSAM3X8E.UInt24;

   --  Frames Received Ok Register
   type FRO_Register is record
      --  Frames Received OK
      FROK           : FRO_FROK_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FRO_Register use record
      FROK           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- FCSE_Register --
   -------------------

   subtype FCSE_FCSE_Field is ATSAM3X8E.Byte;

   --  Frame Check Sequence Errors Register
   type FCSE_Register is record
      --  Frame Check Sequence Errors
      FCSE          : FCSE_FCSE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FCSE_Register use record
      FCSE          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- ALE_Register --
   ------------------

   subtype ALE_ALE_Field is ATSAM3X8E.Byte;

   --  Alignment Errors Register
   type ALE_Register is record
      --  Alignment Errors
      ALE           : ALE_ALE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ALE_Register use record
      ALE           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- DTF_Register --
   ------------------

   subtype DTF_DTF_Field is ATSAM3X8E.Short;

   --  Deferred Transmission Frames Register
   type DTF_Register is record
      --  Deferred Transmission Frames
      DTF            : DTF_DTF_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DTF_Register use record
      DTF            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- LCOL_Register --
   -------------------

   subtype LCOL_LCOL_Field is ATSAM3X8E.Byte;

   --  Late Collisions Register
   type LCOL_Register is record
      --  Late Collisions
      LCOL          : LCOL_LCOL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for LCOL_Register use record
      LCOL          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- ECOL_Register --
   -------------------

   subtype ECOL_EXCOL_Field is ATSAM3X8E.Byte;

   --  Excessive Collisions Register
   type ECOL_Register is record
      --  Excessive Collisions
      EXCOL         : ECOL_EXCOL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ECOL_Register use record
      EXCOL         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- TUND_Register --
   -------------------

   subtype TUND_TUND_Field is ATSAM3X8E.Byte;

   --  Transmit Underrun Errors Register
   type TUND_Register is record
      --  Transmit Underruns
      TUND          : TUND_TUND_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TUND_Register use record
      TUND          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- CSE_Register --
   ------------------

   subtype CSE_CSE_Field is ATSAM3X8E.Byte;

   --  Carrier Sense Errors Register
   type CSE_Register is record
      --  Carrier Sense Errors
      CSE           : CSE_CSE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CSE_Register use record
      CSE           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- RRE_Register --
   ------------------

   subtype RRE_RRE_Field is ATSAM3X8E.Short;

   --  Receive Resource Errors Register
   type RRE_Register is record
      --  Receive Resource Errors
      RRE            : RRE_RRE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RRE_Register use record
      RRE            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- ROV_Register --
   ------------------

   subtype ROV_ROVR_Field is ATSAM3X8E.Byte;

   --  Receive Overrun Errors Register
   type ROV_Register is record
      --  Receive Overrun
      ROVR          : ROV_ROVR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ROV_Register use record
      ROVR          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- RSE_Register --
   ------------------

   subtype RSE_RSE_Field is ATSAM3X8E.Byte;

   --  Receive Symbol Errors Register
   type RSE_Register is record
      --  Receive Symbol Errors
      RSE           : RSE_RSE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RSE_Register use record
      RSE           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- ELE_Register --
   ------------------

   subtype ELE_EXL_Field is ATSAM3X8E.Byte;

   --  Excessive Length Errors Register
   type ELE_Register is record
      --  Excessive Length Errors
      EXL           : ELE_EXL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ELE_Register use record
      EXL           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- RJA_Register --
   ------------------

   subtype RJA_RJB_Field is ATSAM3X8E.Byte;

   --  Receive Jabbers Register
   type RJA_Register is record
      --  Receive Jabbers
      RJB           : RJA_RJB_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RJA_Register use record
      RJB           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- USF_Register --
   ------------------

   subtype USF_USF_Field is ATSAM3X8E.Byte;

   --  Undersize Frames Register
   type USF_Register is record
      --  Undersize frames
      USF           : USF_USF_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for USF_Register use record
      USF           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- STE_Register --
   ------------------

   subtype STE_SQER_Field is ATSAM3X8E.Byte;

   --  SQE Test Errors Register
   type STE_Register is record
      --  SQE test errors
      SQER          : STE_SQER_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for STE_Register use record
      SQER          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- RLE_Register --
   ------------------

   subtype RLE_RLFM_Field is ATSAM3X8E.Byte;

   --  Received Length Field Mismatch Register
   type RLE_Register is record
      --  Receive Length Field Mismatch
      RLFM          : RLE_RLFM_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RLE_Register use record
      RLFM          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- SA1T_Register --
   -------------------

   subtype SA1T_ADDR_Field is ATSAM3X8E.Short;

   --  Specific Address 1 Top Register
   type SA1T_Register is record
      ADDR           : SA1T_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SA1T_Register use record
      ADDR           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- SA2T_Register --
   -------------------

   subtype SA2T_ADDR_Field is ATSAM3X8E.Short;

   --  Specific Address 2 Top Register
   type SA2T_Register is record
      ADDR           : SA2T_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SA2T_Register use record
      ADDR           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- SA3T_Register --
   -------------------

   subtype SA3T_ADDR_Field is ATSAM3X8E.Short;

   --  Specific Address 3 Top Register
   type SA3T_Register is record
      ADDR           : SA3T_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SA3T_Register use record
      ADDR           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- SA4T_Register --
   -------------------

   subtype SA4T_ADDR_Field is ATSAM3X8E.Short;

   --  Specific Address 4 Top Register
   type SA4T_Register is record
      ADDR           : SA4T_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SA4T_Register use record
      ADDR           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- TID_Register --
   ------------------

   subtype TID_TID_Field is ATSAM3X8E.Short;

   --  Type ID Checking Register
   type TID_Register is record
      --  Type ID checking
      TID            : TID_TID_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TID_Register use record
      TID            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --------------------
   -- USRIO_Register --
   --------------------

   subtype USRIO_RMII_Field is ATSAM3X8E.Bit;
   subtype USRIO_CLKEN_Field is ATSAM3X8E.Bit;

   --  User Input/Output Register
   type USRIO_Register is record
      --  Reduce MII
      RMII          : USRIO_RMII_Field := 16#0#;
      --  Clock Enable
      CLKEN         : USRIO_CLKEN_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for USRIO_Register use record
      RMII          at 0 range 0 .. 0;
      CLKEN         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Ethernet MAC 10/100
   type EMAC_Peripheral is record
      --  Network Control Register
      NCR   : NCR_Register;
      --  Network Configuration Register
      NCFGR : NCFGR_Register;
      --  Network Status Register
      NSR   : NSR_Register;
      --  Transmit Status Register
      TSR   : TSR_Register;
      --  Receive Buffer Queue Pointer Register
      RBQP  : RBQP_Register;
      --  Transmit Buffer Queue Pointer Register
      TBQP  : TBQP_Register;
      --  Receive Status Register
      RSR   : RSR_Register;
      --  Interrupt Status Register
      ISR   : ISR_Register;
      --  Interrupt Enable Register
      IER   : IER_Register;
      --  Interrupt Disable Register
      IDR   : IDR_Register;
      --  Interrupt Mask Register
      IMR   : IMR_Register;
      --  Phy Maintenance Register
      MAN   : MAN_Register;
      --  Pause Time Register
      PTR   : PTR_Register;
      --  Pause Frames Received Register
      PFR   : PFR_Register;
      --  Frames Transmitted Ok Register
      FTO   : FTO_Register;
      --  Single Collision Frames Register
      SCF   : SCF_Register;
      --  Multiple Collision Frames Register
      MCF   : MCF_Register;
      --  Frames Received Ok Register
      FRO   : FRO_Register;
      --  Frame Check Sequence Errors Register
      FCSE  : FCSE_Register;
      --  Alignment Errors Register
      ALE   : ALE_Register;
      --  Deferred Transmission Frames Register
      DTF   : DTF_Register;
      --  Late Collisions Register
      LCOL  : LCOL_Register;
      --  Excessive Collisions Register
      ECOL  : ECOL_Register;
      --  Transmit Underrun Errors Register
      TUND  : TUND_Register;
      --  Carrier Sense Errors Register
      CSE   : CSE_Register;
      --  Receive Resource Errors Register
      RRE   : RRE_Register;
      --  Receive Overrun Errors Register
      ROV   : ROV_Register;
      --  Receive Symbol Errors Register
      RSE   : RSE_Register;
      --  Excessive Length Errors Register
      ELE   : ELE_Register;
      --  Receive Jabbers Register
      RJA   : RJA_Register;
      --  Undersize Frames Register
      USF   : USF_Register;
      --  SQE Test Errors Register
      STE   : STE_Register;
      --  Received Length Field Mismatch Register
      RLE   : RLE_Register;
      --  Hash Register Bottom [31:0] Register
      HRB   : ATSAM3X8E.Word;
      --  Hash Register Top [63:32] Register
      HRT   : ATSAM3X8E.Word;
      --  Specific Address 1 Bottom Register
      SA1B  : ATSAM3X8E.Word;
      --  Specific Address 1 Top Register
      SA1T  : SA1T_Register;
      --  Specific Address 2 Bottom Register
      SA2B  : ATSAM3X8E.Word;
      --  Specific Address 2 Top Register
      SA2T  : SA2T_Register;
      --  Specific Address 3 Bottom Register
      SA3B  : ATSAM3X8E.Word;
      --  Specific Address 3 Top Register
      SA3T  : SA3T_Register;
      --  Specific Address 4 Bottom Register
      SA4B  : ATSAM3X8E.Word;
      --  Specific Address 4 Top Register
      SA4T  : SA4T_Register;
      --  Type ID Checking Register
      TID   : TID_Register;
      --  User Input/Output Register
      USRIO : USRIO_Register;
   end record
     with Volatile;

   for EMAC_Peripheral use record
      NCR   at 0 range 0 .. 31;
      NCFGR at 4 range 0 .. 31;
      NSR   at 8 range 0 .. 31;
      TSR   at 20 range 0 .. 31;
      RBQP  at 24 range 0 .. 31;
      TBQP  at 28 range 0 .. 31;
      RSR   at 32 range 0 .. 31;
      ISR   at 36 range 0 .. 31;
      IER   at 40 range 0 .. 31;
      IDR   at 44 range 0 .. 31;
      IMR   at 48 range 0 .. 31;
      MAN   at 52 range 0 .. 31;
      PTR   at 56 range 0 .. 31;
      PFR   at 60 range 0 .. 31;
      FTO   at 64 range 0 .. 31;
      SCF   at 68 range 0 .. 31;
      MCF   at 72 range 0 .. 31;
      FRO   at 76 range 0 .. 31;
      FCSE  at 80 range 0 .. 31;
      ALE   at 84 range 0 .. 31;
      DTF   at 88 range 0 .. 31;
      LCOL  at 92 range 0 .. 31;
      ECOL  at 96 range 0 .. 31;
      TUND  at 100 range 0 .. 31;
      CSE   at 104 range 0 .. 31;
      RRE   at 108 range 0 .. 31;
      ROV   at 112 range 0 .. 31;
      RSE   at 116 range 0 .. 31;
      ELE   at 120 range 0 .. 31;
      RJA   at 124 range 0 .. 31;
      USF   at 128 range 0 .. 31;
      STE   at 132 range 0 .. 31;
      RLE   at 136 range 0 .. 31;
      HRB   at 144 range 0 .. 31;
      HRT   at 148 range 0 .. 31;
      SA1B  at 152 range 0 .. 31;
      SA1T  at 156 range 0 .. 31;
      SA2B  at 160 range 0 .. 31;
      SA2T  at 164 range 0 .. 31;
      SA3B  at 168 range 0 .. 31;
      SA3T  at 172 range 0 .. 31;
      SA4B  at 176 range 0 .. 31;
      SA4T  at 180 range 0 .. 31;
      TID   at 184 range 0 .. 31;
      USRIO at 192 range 0 .. 31;
   end record;

   --  Ethernet MAC 10/100
   EMAC_Periph : aliased EMAC_Peripheral
     with Import, Address => EMAC_Base;

end ATSAM3X8E.EMAC;
