--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  USB On-The-Go Interface
package ATSAM3X8E.UOTGHS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ----------------------
   -- DEVCTRL_Register --
   ----------------------

   subtype DEVCTRL_UADD_Field is ATSAM3X8E.UInt7;
   subtype DEVCTRL_ADDEN_Field is ATSAM3X8E.Bit;
   subtype DEVCTRL_DETACH_Field is ATSAM3X8E.Bit;
   subtype DEVCTRL_RMWKUP_Field is ATSAM3X8E.Bit;

   --  Mode Configuration
   type SPDCONF_Field is
     (
      --  The peripheral starts in full-speed mode and performs a high-speed
      --  reset to switch to the high-speed mode if the host is high-speed
      --  capable.
      Normal,
      --  For a better consumption, if high-speed is not needed.
      Low_Power,
      --  Forced high speed.
      High_Speed,
      --  The peripheral remains in full-speed mode whatever the host speed
      --  capability.
      Forced_Fs)
     with Size => 2;
   for SPDCONF_Field use
     (Normal => 0,
      Low_Power => 1,
      High_Speed => 2,
      Forced_Fs => 3);

   subtype DEVCTRL_LS_Field is ATSAM3X8E.Bit;
   subtype DEVCTRL_TSTJ_Field is ATSAM3X8E.Bit;
   subtype DEVCTRL_TSTK_Field is ATSAM3X8E.Bit;
   subtype DEVCTRL_TSTPCKT_Field is ATSAM3X8E.Bit;
   subtype DEVCTRL_OPMODE2_Field is ATSAM3X8E.Bit;

   --  Device General Control Register
   type DEVCTRL_Register is record
      --  USB Address
      UADD           : DEVCTRL_UADD_Field := 16#0#;
      --  Address Enable
      ADDEN          : DEVCTRL_ADDEN_Field := 16#0#;
      --  Detach
      DETACH         : DEVCTRL_DETACH_Field := 16#1#;
      --  Remote Wake-Up
      RMWKUP         : DEVCTRL_RMWKUP_Field := 16#0#;
      --  Mode Configuration
      SPDCONF        : SPDCONF_Field := Normal;
      --  Low-Speed Mode Force
      LS             : DEVCTRL_LS_Field := 16#0#;
      --  Test mode J
      TSTJ           : DEVCTRL_TSTJ_Field := 16#0#;
      --  Test mode K
      TSTK           : DEVCTRL_TSTK_Field := 16#0#;
      --  Test packet mode
      TSTPCKT        : DEVCTRL_TSTPCKT_Field := 16#0#;
      --  Specific Operational mode
      OPMODE2        : DEVCTRL_OPMODE2_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVCTRL_Register use record
      UADD           at 0 range 0 .. 6;
      ADDEN          at 0 range 7 .. 7;
      DETACH         at 0 range 8 .. 8;
      RMWKUP         at 0 range 9 .. 9;
      SPDCONF        at 0 range 10 .. 11;
      LS             at 0 range 12 .. 12;
      TSTJ           at 0 range 13 .. 13;
      TSTK           at 0 range 14 .. 14;
      TSTPCKT        at 0 range 15 .. 15;
      OPMODE2        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   ---------------------
   -- DEVISR_Register --
   ---------------------

   subtype DEVISR_SUSP_Field is ATSAM3X8E.Bit;
   subtype DEVISR_MSOF_Field is ATSAM3X8E.Bit;
   subtype DEVISR_SOF_Field is ATSAM3X8E.Bit;
   subtype DEVISR_EORST_Field is ATSAM3X8E.Bit;
   subtype DEVISR_WAKEUP_Field is ATSAM3X8E.Bit;
   subtype DEVISR_EORSM_Field is ATSAM3X8E.Bit;
   subtype DEVISR_UPRSM_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_0_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_1_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_2_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_3_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_4_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_5_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_6_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_7_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_8_Field is ATSAM3X8E.Bit;
   subtype DEVISR_PEP_9_Field is ATSAM3X8E.Bit;
   subtype DEVISR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype DEVISR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype DEVISR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype DEVISR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype DEVISR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype DEVISR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Device Global Interrupt Status Register
   type DEVISR_Register is record
      --  Read-only. Suspend Interrupt
      SUSP           : DEVISR_SUSP_Field := 16#0#;
      --  Read-only. Micro Start of Frame Interrupt
      MSOF           : DEVISR_MSOF_Field := 16#0#;
      --  Read-only. Start of Frame Interrupt
      SOF            : DEVISR_SOF_Field := 16#0#;
      --  Read-only. End of Reset Interrupt
      EORST          : DEVISR_EORST_Field := 16#0#;
      --  Read-only. Wake-Up Interrupt
      WAKEUP         : DEVISR_WAKEUP_Field := 16#0#;
      --  Read-only. End of Resume Interrupt
      EORSM          : DEVISR_EORSM_Field := 16#0#;
      --  Read-only. Upstream Resume Interrupt
      UPRSM          : DEVISR_UPRSM_Field := 16#0#;
      --  unspecified
      Reserved_7_11  : ATSAM3X8E.UInt5;
      --  Read-only. Endpoint 0 Interrupt
      PEP_0          : DEVISR_PEP_0_Field := 16#0#;
      --  Read-only. Endpoint 1 Interrupt
      PEP_1          : DEVISR_PEP_1_Field := 16#0#;
      --  Read-only. Endpoint 2 Interrupt
      PEP_2          : DEVISR_PEP_2_Field := 16#0#;
      --  Read-only. Endpoint 3 Interrupt
      PEP_3          : DEVISR_PEP_3_Field := 16#0#;
      --  Read-only. Endpoint 4 Interrupt
      PEP_4          : DEVISR_PEP_4_Field := 16#0#;
      --  Read-only. Endpoint 5 Interrupt
      PEP_5          : DEVISR_PEP_5_Field := 16#0#;
      --  Read-only. Endpoint 6 Interrupt
      PEP_6          : DEVISR_PEP_6_Field := 16#0#;
      --  Read-only. Endpoint 7 Interrupt
      PEP_7          : DEVISR_PEP_7_Field := 16#0#;
      --  Read-only. Endpoint 8 Interrupt
      PEP_8          : DEVISR_PEP_8_Field := 16#0#;
      --  Read-only. Endpoint 9 Interrupt
      PEP_9          : DEVISR_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_22_24 : ATSAM3X8E.UInt3;
      --  Read-only. DMA Channel 1 Interrupt
      DMA_1          : DEVISR_DMA_1_Field := 16#0#;
      --  Read-only. DMA Channel 2 Interrupt
      DMA_2          : DEVISR_DMA_2_Field := 16#0#;
      --  Read-only. DMA Channel 3 Interrupt
      DMA_3          : DEVISR_DMA_3_Field := 16#0#;
      --  Read-only. DMA Channel 4 Interrupt
      DMA_4          : DEVISR_DMA_4_Field := 16#0#;
      --  Read-only. DMA Channel 5 Interrupt
      DMA_5          : DEVISR_DMA_5_Field := 16#0#;
      --  Read-only. DMA Channel 6 Interrupt
      DMA_6          : DEVISR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVISR_Register use record
      SUSP           at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      Reserved_7_11  at 0 range 7 .. 11;
      PEP_0          at 0 range 12 .. 12;
      PEP_1          at 0 range 13 .. 13;
      PEP_2          at 0 range 14 .. 14;
      PEP_3          at 0 range 15 .. 15;
      PEP_4          at 0 range 16 .. 16;
      PEP_5          at 0 range 17 .. 17;
      PEP_6          at 0 range 18 .. 18;
      PEP_7          at 0 range 19 .. 19;
      PEP_8          at 0 range 20 .. 20;
      PEP_9          at 0 range 21 .. 21;
      Reserved_22_24 at 0 range 22 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- DEVICR_Register --
   ---------------------

   subtype DEVICR_SUSPC_Field is ATSAM3X8E.Bit;
   subtype DEVICR_MSOFC_Field is ATSAM3X8E.Bit;
   subtype DEVICR_SOFC_Field is ATSAM3X8E.Bit;
   subtype DEVICR_EORSTC_Field is ATSAM3X8E.Bit;
   subtype DEVICR_WAKEUPC_Field is ATSAM3X8E.Bit;
   subtype DEVICR_EORSMC_Field is ATSAM3X8E.Bit;
   subtype DEVICR_UPRSMC_Field is ATSAM3X8E.Bit;

   --  Device Global Interrupt Clear Register
   type DEVICR_Register is record
      --  Write-only. Suspend Interrupt Clear
      SUSPC         : DEVICR_SUSPC_Field := 16#0#;
      --  Write-only. Micro Start of Frame Interrupt Clear
      MSOFC         : DEVICR_MSOFC_Field := 16#0#;
      --  Write-only. Start of Frame Interrupt Clear
      SOFC          : DEVICR_SOFC_Field := 16#0#;
      --  Write-only. End of Reset Interrupt Clear
      EORSTC        : DEVICR_EORSTC_Field := 16#0#;
      --  Write-only. Wake-Up Interrupt Clear
      WAKEUPC       : DEVICR_WAKEUPC_Field := 16#0#;
      --  Write-only. End of Resume Interrupt Clear
      EORSMC        : DEVICR_EORSMC_Field := 16#0#;
      --  Write-only. Upstream Resume Interrupt Clear
      UPRSMC        : DEVICR_UPRSMC_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVICR_Register use record
      SUSPC         at 0 range 0 .. 0;
      MSOFC         at 0 range 1 .. 1;
      SOFC          at 0 range 2 .. 2;
      EORSTC        at 0 range 3 .. 3;
      WAKEUPC       at 0 range 4 .. 4;
      EORSMC        at 0 range 5 .. 5;
      UPRSMC        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   ---------------------
   -- DEVIFR_Register --
   ---------------------

   subtype DEVIFR_SUSPS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_MSOFS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_SOFS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_EORSTS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_WAKEUPS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_EORSMS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_UPRSMS_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype DEVIFR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Device Global Interrupt Set Register
   type DEVIFR_Register is record
      --  Write-only. Suspend Interrupt Set
      SUSPS          : DEVIFR_SUSPS_Field := 16#0#;
      --  Write-only. Micro Start of Frame Interrupt Set
      MSOFS          : DEVIFR_MSOFS_Field := 16#0#;
      --  Write-only. Start of Frame Interrupt Set
      SOFS           : DEVIFR_SOFS_Field := 16#0#;
      --  Write-only. End of Reset Interrupt Set
      EORSTS         : DEVIFR_EORSTS_Field := 16#0#;
      --  Write-only. Wake-Up Interrupt Set
      WAKEUPS        : DEVIFR_WAKEUPS_Field := 16#0#;
      --  Write-only. End of Resume Interrupt Set
      EORSMS         : DEVIFR_EORSMS_Field := 16#0#;
      --  Write-only. Upstream Resume Interrupt Set
      UPRSMS         : DEVIFR_UPRSMS_Field := 16#0#;
      --  unspecified
      Reserved_7_24  : ATSAM3X8E.UInt18 := 16#0#;
      --  Write-only. DMA Channel 1 Interrupt Set
      DMA_1          : DEVIFR_DMA_1_Field := 16#0#;
      --  Write-only. DMA Channel 2 Interrupt Set
      DMA_2          : DEVIFR_DMA_2_Field := 16#0#;
      --  Write-only. DMA Channel 3 Interrupt Set
      DMA_3          : DEVIFR_DMA_3_Field := 16#0#;
      --  Write-only. DMA Channel 4 Interrupt Set
      DMA_4          : DEVIFR_DMA_4_Field := 16#0#;
      --  Write-only. DMA Channel 5 Interrupt Set
      DMA_5          : DEVIFR_DMA_5_Field := 16#0#;
      --  Write-only. DMA Channel 6 Interrupt Set
      DMA_6          : DEVIFR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVIFR_Register use record
      SUSPS          at 0 range 0 .. 0;
      MSOFS          at 0 range 1 .. 1;
      SOFS           at 0 range 2 .. 2;
      EORSTS         at 0 range 3 .. 3;
      WAKEUPS        at 0 range 4 .. 4;
      EORSMS         at 0 range 5 .. 5;
      UPRSMS         at 0 range 6 .. 6;
      Reserved_7_24  at 0 range 7 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- DEVIMR_Register --
   ---------------------

   subtype DEVIMR_SUSPE_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_MSOFE_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_SOFE_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_EORSTE_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_WAKEUPE_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_EORSME_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_UPRSME_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_0_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_1_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_2_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_3_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_4_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_5_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_6_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_7_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_8_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_PEP_9_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype DEVIMR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Device Global Interrupt Mask Register
   type DEVIMR_Register is record
      --  Read-only. Suspend Interrupt Mask
      SUSPE          : DEVIMR_SUSPE_Field := 16#0#;
      --  Read-only. Micro Start of Frame Interrupt Mask
      MSOFE          : DEVIMR_MSOFE_Field := 16#0#;
      --  Read-only. Start of Frame Interrupt Mask
      SOFE           : DEVIMR_SOFE_Field := 16#0#;
      --  Read-only. End of Reset Interrupt Mask
      EORSTE         : DEVIMR_EORSTE_Field := 16#0#;
      --  Read-only. Wake-Up Interrupt Mask
      WAKEUPE        : DEVIMR_WAKEUPE_Field := 16#0#;
      --  Read-only. End of Resume Interrupt Mask
      EORSME         : DEVIMR_EORSME_Field := 16#0#;
      --  Read-only. Upstream Resume Interrupt Mask
      UPRSME         : DEVIMR_UPRSME_Field := 16#0#;
      --  unspecified
      Reserved_7_11  : ATSAM3X8E.UInt5;
      --  Read-only. Endpoint 0 Interrupt Mask
      PEP_0          : DEVIMR_PEP_0_Field := 16#0#;
      --  Read-only. Endpoint 1 Interrupt Mask
      PEP_1          : DEVIMR_PEP_1_Field := 16#0#;
      --  Read-only. Endpoint 2 Interrupt Mask
      PEP_2          : DEVIMR_PEP_2_Field := 16#0#;
      --  Read-only. Endpoint 3 Interrupt Mask
      PEP_3          : DEVIMR_PEP_3_Field := 16#0#;
      --  Read-only. Endpoint 4 Interrupt Mask
      PEP_4          : DEVIMR_PEP_4_Field := 16#0#;
      --  Read-only. Endpoint 5 Interrupt Mask
      PEP_5          : DEVIMR_PEP_5_Field := 16#0#;
      --  Read-only. Endpoint 6 Interrupt Mask
      PEP_6          : DEVIMR_PEP_6_Field := 16#0#;
      --  Read-only. Endpoint 7 Interrupt Mask
      PEP_7          : DEVIMR_PEP_7_Field := 16#0#;
      --  Read-only. Endpoint 8 Interrupt Mask
      PEP_8          : DEVIMR_PEP_8_Field := 16#0#;
      --  Read-only. Endpoint 9 Interrupt Mask
      PEP_9          : DEVIMR_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_22_24 : ATSAM3X8E.UInt3;
      --  Read-only. DMA Channel 1 Interrupt Mask
      DMA_1          : DEVIMR_DMA_1_Field := 16#0#;
      --  Read-only. DMA Channel 2 Interrupt Mask
      DMA_2          : DEVIMR_DMA_2_Field := 16#0#;
      --  Read-only. DMA Channel 3 Interrupt Mask
      DMA_3          : DEVIMR_DMA_3_Field := 16#0#;
      --  Read-only. DMA Channel 4 Interrupt Mask
      DMA_4          : DEVIMR_DMA_4_Field := 16#0#;
      --  Read-only. DMA Channel 5 Interrupt Mask
      DMA_5          : DEVIMR_DMA_5_Field := 16#0#;
      --  Read-only. DMA Channel 6 Interrupt Mask
      DMA_6          : DEVIMR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVIMR_Register use record
      SUSPE          at 0 range 0 .. 0;
      MSOFE          at 0 range 1 .. 1;
      SOFE           at 0 range 2 .. 2;
      EORSTE         at 0 range 3 .. 3;
      WAKEUPE        at 0 range 4 .. 4;
      EORSME         at 0 range 5 .. 5;
      UPRSME         at 0 range 6 .. 6;
      Reserved_7_11  at 0 range 7 .. 11;
      PEP_0          at 0 range 12 .. 12;
      PEP_1          at 0 range 13 .. 13;
      PEP_2          at 0 range 14 .. 14;
      PEP_3          at 0 range 15 .. 15;
      PEP_4          at 0 range 16 .. 16;
      PEP_5          at 0 range 17 .. 17;
      PEP_6          at 0 range 18 .. 18;
      PEP_7          at 0 range 19 .. 19;
      PEP_8          at 0 range 20 .. 20;
      PEP_9          at 0 range 21 .. 21;
      Reserved_22_24 at 0 range 22 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- DEVIDR_Register --
   ---------------------

   subtype DEVIDR_SUSPEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_MSOFEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_SOFEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_EORSTEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_WAKEUPEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_EORSMEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_UPRSMEC_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_0_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_1_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_2_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_3_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_4_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_5_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_6_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_7_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_8_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_PEP_9_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype DEVIDR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Device Global Interrupt Disable Register
   type DEVIDR_Register is record
      --  Write-only. Suspend Interrupt Disable
      SUSPEC         : DEVIDR_SUSPEC_Field := 16#0#;
      --  Write-only. Micro Start of Frame Interrupt Disable
      MSOFEC         : DEVIDR_MSOFEC_Field := 16#0#;
      --  Write-only. Start of Frame Interrupt Disable
      SOFEC          : DEVIDR_SOFEC_Field := 16#0#;
      --  Write-only. End of Reset Interrupt Disable
      EORSTEC        : DEVIDR_EORSTEC_Field := 16#0#;
      --  Write-only. Wake-Up Interrupt Disable
      WAKEUPEC       : DEVIDR_WAKEUPEC_Field := 16#0#;
      --  Write-only. End of Resume Interrupt Disable
      EORSMEC        : DEVIDR_EORSMEC_Field := 16#0#;
      --  Write-only. Upstream Resume Interrupt Disable
      UPRSMEC        : DEVIDR_UPRSMEC_Field := 16#0#;
      --  unspecified
      Reserved_7_11  : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Endpoint 0 Interrupt Disable
      PEP_0          : DEVIDR_PEP_0_Field := 16#0#;
      --  Write-only. Endpoint 1 Interrupt Disable
      PEP_1          : DEVIDR_PEP_1_Field := 16#0#;
      --  Write-only. Endpoint 2 Interrupt Disable
      PEP_2          : DEVIDR_PEP_2_Field := 16#0#;
      --  Write-only. Endpoint 3 Interrupt Disable
      PEP_3          : DEVIDR_PEP_3_Field := 16#0#;
      --  Write-only. Endpoint 4 Interrupt Disable
      PEP_4          : DEVIDR_PEP_4_Field := 16#0#;
      --  Write-only. Endpoint 5 Interrupt Disable
      PEP_5          : DEVIDR_PEP_5_Field := 16#0#;
      --  Write-only. Endpoint 6 Interrupt Disable
      PEP_6          : DEVIDR_PEP_6_Field := 16#0#;
      --  Write-only. Endpoint 7 Interrupt Disable
      PEP_7          : DEVIDR_PEP_7_Field := 16#0#;
      --  Write-only. Endpoint 8 Interrupt Disable
      PEP_8          : DEVIDR_PEP_8_Field := 16#0#;
      --  Write-only. Endpoint 9 Interrupt Disable
      PEP_9          : DEVIDR_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_22_24 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. DMA Channel 1 Interrupt Disable
      DMA_1          : DEVIDR_DMA_1_Field := 16#0#;
      --  Write-only. DMA Channel 2 Interrupt Disable
      DMA_2          : DEVIDR_DMA_2_Field := 16#0#;
      --  Write-only. DMA Channel 3 Interrupt Disable
      DMA_3          : DEVIDR_DMA_3_Field := 16#0#;
      --  Write-only. DMA Channel 4 Interrupt Disable
      DMA_4          : DEVIDR_DMA_4_Field := 16#0#;
      --  Write-only. DMA Channel 5 Interrupt Disable
      DMA_5          : DEVIDR_DMA_5_Field := 16#0#;
      --  Write-only. DMA Channel 6 Interrupt Disable
      DMA_6          : DEVIDR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVIDR_Register use record
      SUSPEC         at 0 range 0 .. 0;
      MSOFEC         at 0 range 1 .. 1;
      SOFEC          at 0 range 2 .. 2;
      EORSTEC        at 0 range 3 .. 3;
      WAKEUPEC       at 0 range 4 .. 4;
      EORSMEC        at 0 range 5 .. 5;
      UPRSMEC        at 0 range 6 .. 6;
      Reserved_7_11  at 0 range 7 .. 11;
      PEP_0          at 0 range 12 .. 12;
      PEP_1          at 0 range 13 .. 13;
      PEP_2          at 0 range 14 .. 14;
      PEP_3          at 0 range 15 .. 15;
      PEP_4          at 0 range 16 .. 16;
      PEP_5          at 0 range 17 .. 17;
      PEP_6          at 0 range 18 .. 18;
      PEP_7          at 0 range 19 .. 19;
      PEP_8          at 0 range 20 .. 20;
      PEP_9          at 0 range 21 .. 21;
      Reserved_22_24 at 0 range 22 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- DEVIER_Register --
   ---------------------

   subtype DEVIER_SUSPES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_MSOFES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_SOFES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_EORSTES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_WAKEUPES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_EORSMES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_UPRSMES_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_0_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_1_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_2_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_3_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_4_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_5_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_6_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_7_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_8_Field is ATSAM3X8E.Bit;
   subtype DEVIER_PEP_9_Field is ATSAM3X8E.Bit;
   subtype DEVIER_DMA_1_Field is ATSAM3X8E.Bit;
   subtype DEVIER_DMA_2_Field is ATSAM3X8E.Bit;
   subtype DEVIER_DMA_3_Field is ATSAM3X8E.Bit;
   subtype DEVIER_DMA_4_Field is ATSAM3X8E.Bit;
   subtype DEVIER_DMA_5_Field is ATSAM3X8E.Bit;
   subtype DEVIER_DMA_6_Field is ATSAM3X8E.Bit;

   --  Device Global Interrupt Enable Register
   type DEVIER_Register is record
      --  Write-only. Suspend Interrupt Enable
      SUSPES         : DEVIER_SUSPES_Field := 16#0#;
      --  Write-only. Micro Start of Frame Interrupt Enable
      MSOFES         : DEVIER_MSOFES_Field := 16#0#;
      --  Write-only. Start of Frame Interrupt Enable
      SOFES          : DEVIER_SOFES_Field := 16#0#;
      --  Write-only. End of Reset Interrupt Enable
      EORSTES        : DEVIER_EORSTES_Field := 16#0#;
      --  Write-only. Wake-Up Interrupt Enable
      WAKEUPES       : DEVIER_WAKEUPES_Field := 16#0#;
      --  Write-only. End of Resume Interrupt Enable
      EORSMES        : DEVIER_EORSMES_Field := 16#0#;
      --  Write-only. Upstream Resume Interrupt Enable
      UPRSMES        : DEVIER_UPRSMES_Field := 16#0#;
      --  unspecified
      Reserved_7_11  : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Endpoint 0 Interrupt Enable
      PEP_0          : DEVIER_PEP_0_Field := 16#0#;
      --  Write-only. Endpoint 1 Interrupt Enable
      PEP_1          : DEVIER_PEP_1_Field := 16#0#;
      --  Write-only. Endpoint 2 Interrupt Enable
      PEP_2          : DEVIER_PEP_2_Field := 16#0#;
      --  Write-only. Endpoint 3 Interrupt Enable
      PEP_3          : DEVIER_PEP_3_Field := 16#0#;
      --  Write-only. Endpoint 4 Interrupt Enable
      PEP_4          : DEVIER_PEP_4_Field := 16#0#;
      --  Write-only. Endpoint 5 Interrupt Enable
      PEP_5          : DEVIER_PEP_5_Field := 16#0#;
      --  Write-only. Endpoint 6 Interrupt Enable
      PEP_6          : DEVIER_PEP_6_Field := 16#0#;
      --  Write-only. Endpoint 7 Interrupt Enable
      PEP_7          : DEVIER_PEP_7_Field := 16#0#;
      --  Write-only. Endpoint 8 Interrupt Enable
      PEP_8          : DEVIER_PEP_8_Field := 16#0#;
      --  Write-only. Endpoint 9 Interrupt Enable
      PEP_9          : DEVIER_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_22_24 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. DMA Channel 1 Interrupt Enable
      DMA_1          : DEVIER_DMA_1_Field := 16#0#;
      --  Write-only. DMA Channel 2 Interrupt Enable
      DMA_2          : DEVIER_DMA_2_Field := 16#0#;
      --  Write-only. DMA Channel 3 Interrupt Enable
      DMA_3          : DEVIER_DMA_3_Field := 16#0#;
      --  Write-only. DMA Channel 4 Interrupt Enable
      DMA_4          : DEVIER_DMA_4_Field := 16#0#;
      --  Write-only. DMA Channel 5 Interrupt Enable
      DMA_5          : DEVIER_DMA_5_Field := 16#0#;
      --  Write-only. DMA Channel 6 Interrupt Enable
      DMA_6          : DEVIER_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVIER_Register use record
      SUSPES         at 0 range 0 .. 0;
      MSOFES         at 0 range 1 .. 1;
      SOFES          at 0 range 2 .. 2;
      EORSTES        at 0 range 3 .. 3;
      WAKEUPES       at 0 range 4 .. 4;
      EORSMES        at 0 range 5 .. 5;
      UPRSMES        at 0 range 6 .. 6;
      Reserved_7_11  at 0 range 7 .. 11;
      PEP_0          at 0 range 12 .. 12;
      PEP_1          at 0 range 13 .. 13;
      PEP_2          at 0 range 14 .. 14;
      PEP_3          at 0 range 15 .. 15;
      PEP_4          at 0 range 16 .. 16;
      PEP_5          at 0 range 17 .. 17;
      PEP_6          at 0 range 18 .. 18;
      PEP_7          at 0 range 19 .. 19;
      PEP_8          at 0 range 20 .. 20;
      PEP_9          at 0 range 21 .. 21;
      Reserved_22_24 at 0 range 22 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- DEVEPT_Register --
   ---------------------

   -----------------
   -- DEVEPT.EPEN --
   -----------------

   --  DEVEPT_EPEN array element
   subtype DEVEPT_EPEN_Element is ATSAM3X8E.Bit;

   --  DEVEPT_EPEN array
   type DEVEPT_EPEN_Field_Array is array (0 .. 8) of DEVEPT_EPEN_Element
     with Component_Size => 1, Size => 9;

   --  Type definition for DEVEPT_EPEN
   type DEVEPT_EPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EPEN as a value
            Val : ATSAM3X8E.UInt9;
         when True =>
            --  EPEN as an array
            Arr : DEVEPT_EPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 9;

   for DEVEPT_EPEN_Field use record
      Val at 0 range 0 .. 8;
      Arr at 0 range 0 .. 8;
   end record;

   ------------------
   -- DEVEPT.EPRST --
   ------------------

   --  DEVEPT_EPRST array element
   subtype DEVEPT_EPRST_Element is ATSAM3X8E.Bit;

   --  DEVEPT_EPRST array
   type DEVEPT_EPRST_Field_Array is array (0 .. 8) of DEVEPT_EPRST_Element
     with Component_Size => 1, Size => 9;

   --  Type definition for DEVEPT_EPRST
   type DEVEPT_EPRST_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EPRST as a value
            Val : ATSAM3X8E.UInt9;
         when True =>
            --  EPRST as an array
            Arr : DEVEPT_EPRST_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 9;

   for DEVEPT_EPRST_Field use record
      Val at 0 range 0 .. 8;
      Arr at 0 range 0 .. 8;
   end record;

   --  Device Endpoint Register
   type DEVEPT_Register is record
      --  Endpoint 0 Enable
      EPEN           : DEVEPT_EPEN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_9_15  : ATSAM3X8E.UInt7 := 16#0#;
      --  Endpoint 0 Reset
      EPRST          : DEVEPT_EPRST_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPT_Register use record
      EPEN           at 0 range 0 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      EPRST          at 0 range 16 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ----------------------
   -- DEVFNUM_Register --
   ----------------------

   subtype DEVFNUM_MFNUM_Field is ATSAM3X8E.UInt3;
   subtype DEVFNUM_FNUM_Field is ATSAM3X8E.UInt11;
   subtype DEVFNUM_FNCERR_Field is ATSAM3X8E.Bit;

   --  Device Frame Number Register
   type DEVFNUM_Register is record
      --  Read-only. Micro Frame Number
      MFNUM          : DEVFNUM_MFNUM_Field := 16#0#;
      --  Read-only. Frame Number
      FNUM           : DEVFNUM_FNUM_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : ATSAM3X8E.Bit;
      --  Read-only. Frame Number CRC Error
      FNCERR         : DEVFNUM_FNCERR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVFNUM_Register use record
      MFNUM          at 0 range 0 .. 2;
      FNUM           at 0 range 3 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      FNCERR         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------------
   -- DEVEPTCFG_Register --
   ------------------------

   subtype DEVEPTCFG_ALLOC_Field is ATSAM3X8E.Bit;

   --  Endpoint Banks
   type EPBK_Field is
     (
      --  Single-bank endpoint
      EPBK_Field_1_Bank,
      --  Double-bank endpoint
      EPBK_Field_2_Bank,
      --  Triple-bank endpoint
      EPBK_Field_3_Bank)
     with Size => 2;
   for EPBK_Field use
     (EPBK_Field_1_Bank => 0,
      EPBK_Field_2_Bank => 1,
      EPBK_Field_3_Bank => 2);

   --  Endpoint Size
   type EPSIZE_Field is
     (
      --  8 bytes
      EPSIZE_Field_8_Byte,
      --  16 bytes
      EPSIZE_Field_16_Byte,
      --  32 bytes
      EPSIZE_Field_32_Byte,
      --  64 bytes
      EPSIZE_Field_64_Byte,
      --  128 bytes
      EPSIZE_Field_128_Byte,
      --  256 bytes
      EPSIZE_Field_256_Byte,
      --  512 bytes
      EPSIZE_Field_512_Byte,
      --  1024 bytes
      EPSIZE_Field_1024_Byte)
     with Size => 3;
   for EPSIZE_Field use
     (EPSIZE_Field_8_Byte => 0,
      EPSIZE_Field_16_Byte => 1,
      EPSIZE_Field_32_Byte => 2,
      EPSIZE_Field_64_Byte => 3,
      EPSIZE_Field_128_Byte => 4,
      EPSIZE_Field_256_Byte => 5,
      EPSIZE_Field_512_Byte => 6,
      EPSIZE_Field_1024_Byte => 7);

   --  Endpoint Direction
   type EPDIR_Field is
     (
      --  The endpoint direction is OUT.
      Out_k,
      --  The endpoint direction is IN (nor for control endpoints).
      In_k)
     with Size => 1;
   for EPDIR_Field use
     (Out_k => 0,
      In_k => 1);

   subtype DEVEPTCFG_AUTOSW_Field is ATSAM3X8E.Bit;

   --  Endpoint Type
   type EPTYPE_Field is
     (
      --  Control
      Ctrl,
      --  Isochronous
      Iso,
      --  Bulk
      Blk,
      --  Interrupt
      Intrpt)
     with Size => 2;
   for EPTYPE_Field use
     (Ctrl => 0,
      Iso => 1,
      Blk => 2,
      Intrpt => 3);

   --  Number of transaction per microframe for isochronous endpoint
   type NBTRANS_Field is
     (
      --  reserved to endpoint that does not have the high-bandwidth
      --  isochronous capability.
      NBTRANS_Field_0_Trans,
      --  default value: one transaction per micro-frame.
      NBTRANS_Field_1_Trans,
      --  2 transactions per micro-frame. This endpoint should be configured as
      --  double-bank.
      NBTRANS_Field_2_Trans,
      --  3 transactions per micro-frame. This endpoint should be configured as
      --  triple-bank.
      NBTRANS_Field_3_Trans)
     with Size => 2;
   for NBTRANS_Field use
     (NBTRANS_Field_0_Trans => 0,
      NBTRANS_Field_1_Trans => 1,
      NBTRANS_Field_2_Trans => 2,
      NBTRANS_Field_3_Trans => 3);

   --  Device Endpoint Configuration Register (n = 0)
   type DEVEPTCFG_Register is record
      --  unspecified
      Reserved_0_0   : ATSAM3X8E.Bit := 16#0#;
      --  Endpoint Memory Allocate
      ALLOC          : DEVEPTCFG_ALLOC_Field := 16#0#;
      --  Endpoint Banks
      EPBK           : EPBK_Field := EPBK_Field_1_Bank;
      --  Endpoint Size
      EPSIZE         : EPSIZE_Field := EPSIZE_Field_8_Byte;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Endpoint Direction
      EPDIR          : EPDIR_Field := Out_k;
      --  Automatic Switch
      AUTOSW         : DEVEPTCFG_AUTOSW_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit := 16#0#;
      --  Endpoint Type
      EPTYPE         : EPTYPE_Field := Ctrl;
      --  Number of transaction per microframe for isochronous endpoint
      NBTRANS        : NBTRANS_Field := NBTRANS_Field_0_Trans;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTCFG_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ALLOC          at 0 range 1 .. 1;
      EPBK           at 0 range 2 .. 3;
      EPSIZE         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      EPDIR          at 0 range 8 .. 8;
      AUTOSW         at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      EPTYPE         at 0 range 11 .. 12;
      NBTRANS        at 0 range 13 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  Device Endpoint Configuration Register (n = 0)
   type DEVEPTCFG_Registers is array (0 .. 9) of DEVEPTCFG_Register;

   ------------------------
   -- DEVEPTISR_Register --
   ------------------------

   subtype DEVEPTISR_TXINI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_RXOUTI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_RXSTPI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_NAKOUTI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_NAKINI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_OVERFI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_STALLEDI_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_SHORTPACKET_Field is ATSAM3X8E.Bit;

   --  Data Toggle Sequence
   type DTSEQ_Field is
     (
      --  Data0 toggle sequence
      Data0,
      --  Data1 toggle sequence
      Data1,
      --  Reserved for high-bandwidth isochronous endpoint
      Data2,
      --  Reserved for high-bandwidth isochronous endpoint
      Mdata)
     with Size => 2;
   for DTSEQ_Field use
     (Data0 => 0,
      Data1 => 1,
      Data2 => 2,
      Mdata => 3);

   --  Number of Busy Banks
   type NBUSYBK_Field is
     (
      --  0 busy bank (all banks free)
      NBUSYBK_Field_0_Busy,
      --  1 busy bank
      NBUSYBK_Field_1_Busy,
      --  2 busy banks
      NBUSYBK_Field_2_Busy,
      --  3 busy banks
      NBUSYBK_Field_3_Busy)
     with Size => 2;
   for NBUSYBK_Field use
     (NBUSYBK_Field_0_Busy => 0,
      NBUSYBK_Field_1_Busy => 1,
      NBUSYBK_Field_2_Busy => 2,
      NBUSYBK_Field_3_Busy => 3);

   --  Current Bank
   type CURRBK_Field is
     (
      --  Current bank is bank0
      Bank0,
      --  Current bank is bank1
      Bank1,
      --  Current bank is bank2
      Bank2)
     with Size => 2;
   for CURRBK_Field use
     (Bank0 => 0,
      Bank1 => 1,
      Bank2 => 2);

   subtype DEVEPTISR_RWALL_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_CTRLDIR_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_CFGOK_Field is ATSAM3X8E.Bit;
   subtype DEVEPTISR_BYCT_Field is ATSAM3X8E.UInt11;

   --  Device Endpoint Status Register (n = 0)
   type DEVEPTISR_Register is record
      --  Read-only. Transmitted IN Data Interrupt
      TXINI          : DEVEPTISR_TXINI_Field := 16#0#;
      --  Read-only. Received OUT Data Interrupt
      RXOUTI         : DEVEPTISR_RXOUTI_Field := 16#0#;
      --  Read-only. Received SETUP Interrupt
      RXSTPI         : DEVEPTISR_RXSTPI_Field := 16#0#;
      --  Read-only. NAKed OUT Interrupt
      NAKOUTI        : DEVEPTISR_NAKOUTI_Field := 16#0#;
      --  Read-only. NAKed IN Interrupt
      NAKINI         : DEVEPTISR_NAKINI_Field := 16#0#;
      --  Read-only. Overflow Interrupt
      OVERFI         : DEVEPTISR_OVERFI_Field := 16#0#;
      --  Read-only. STALLed Interrupt
      STALLEDI       : DEVEPTISR_STALLEDI_Field := 16#0#;
      --  Read-only. Short Packet Interrupt
      SHORTPACKET    : DEVEPTISR_SHORTPACKET_Field := 16#0#;
      --  Read-only. Data Toggle Sequence
      DTSEQ          : DTSEQ_Field := Data0;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2;
      --  Read-only. Number of Busy Banks
      NBUSYBK        : NBUSYBK_Field := NBUSYBK_Field_0_Busy;
      --  Read-only. Current Bank
      CURRBK         : CURRBK_Field := Bank0;
      --  Read-only. Read-write Allowed
      RWALL          : DEVEPTISR_RWALL_Field := 16#0#;
      --  Read-only. Control Direction
      CTRLDIR        : DEVEPTISR_CTRLDIR_Field := 16#0#;
      --  Read-only. Configuration OK Status
      CFGOK          : DEVEPTISR_CFGOK_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : ATSAM3X8E.Bit;
      --  Read-only. Byte Count
      BYCT           : DEVEPTISR_BYCT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTISR_Register use record
      TXINI          at 0 range 0 .. 0;
      RXOUTI         at 0 range 1 .. 1;
      RXSTPI         at 0 range 2 .. 2;
      NAKOUTI        at 0 range 3 .. 3;
      NAKINI         at 0 range 4 .. 4;
      OVERFI         at 0 range 5 .. 5;
      STALLEDI       at 0 range 6 .. 6;
      SHORTPACKET    at 0 range 7 .. 7;
      DTSEQ          at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      NBUSYBK        at 0 range 12 .. 13;
      CURRBK         at 0 range 14 .. 15;
      RWALL          at 0 range 16 .. 16;
      CTRLDIR        at 0 range 17 .. 17;
      CFGOK          at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      BYCT           at 0 range 20 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Device Endpoint Status Register (n = 0)
   type DEVEPTISR_Registers is array (0 .. 9) of DEVEPTISR_Register;

   ------------------------
   -- DEVEPTICR_Register --
   ------------------------

   subtype DEVEPTICR_TXINIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_RXOUTIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_RXSTPIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_NAKOUTIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_NAKINIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_OVERFIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_STALLEDIC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTICR_SHORTPACKETC_Field is ATSAM3X8E.Bit;

   --  Device Endpoint Clear Register (n = 0)
   type DEVEPTICR_Register is record
      --  Write-only. Transmitted IN Data Interrupt Clear
      TXINIC        : DEVEPTICR_TXINIC_Field := 16#0#;
      --  Write-only. Received OUT Data Interrupt Clear
      RXOUTIC       : DEVEPTICR_RXOUTIC_Field := 16#0#;
      --  Write-only. Received SETUP Interrupt Clear
      RXSTPIC       : DEVEPTICR_RXSTPIC_Field := 16#0#;
      --  Write-only. NAKed OUT Interrupt Clear
      NAKOUTIC      : DEVEPTICR_NAKOUTIC_Field := 16#0#;
      --  Write-only. NAKed IN Interrupt Clear
      NAKINIC       : DEVEPTICR_NAKINIC_Field := 16#0#;
      --  Write-only. Overflow Interrupt Clear
      OVERFIC       : DEVEPTICR_OVERFIC_Field := 16#0#;
      --  Write-only. STALLed Interrupt Clear
      STALLEDIC     : DEVEPTICR_STALLEDIC_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Clear
      SHORTPACKETC  : DEVEPTICR_SHORTPACKETC_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTICR_Register use record
      TXINIC        at 0 range 0 .. 0;
      RXOUTIC       at 0 range 1 .. 1;
      RXSTPIC       at 0 range 2 .. 2;
      NAKOUTIC      at 0 range 3 .. 3;
      NAKINIC       at 0 range 4 .. 4;
      OVERFIC       at 0 range 5 .. 5;
      STALLEDIC     at 0 range 6 .. 6;
      SHORTPACKETC  at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Device Endpoint Clear Register (n = 0)
   type DEVEPTICR_Registers is array (0 .. 9) of DEVEPTICR_Register;

   ------------------------
   -- DEVEPTIFR_Register --
   ------------------------

   subtype DEVEPTIFR_TXINIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_RXOUTIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_RXSTPIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_NAKOUTIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_NAKINIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_OVERFIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_STALLEDIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_SHORTPACKETS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIFR_NBUSYBKS_Field is ATSAM3X8E.Bit;

   --  Device Endpoint Set Register (n = 0)
   type DEVEPTIFR_Register is record
      --  Write-only. Transmitted IN Data Interrupt Set
      TXINIS         : DEVEPTIFR_TXINIS_Field := 16#0#;
      --  Write-only. Received OUT Data Interrupt Set
      RXOUTIS        : DEVEPTIFR_RXOUTIS_Field := 16#0#;
      --  Write-only. Received SETUP Interrupt Set
      RXSTPIS        : DEVEPTIFR_RXSTPIS_Field := 16#0#;
      --  Write-only. NAKed OUT Interrupt Set
      NAKOUTIS       : DEVEPTIFR_NAKOUTIS_Field := 16#0#;
      --  Write-only. NAKed IN Interrupt Set
      NAKINIS        : DEVEPTIFR_NAKINIS_Field := 16#0#;
      --  Write-only. Overflow Interrupt Set
      OVERFIS        : DEVEPTIFR_OVERFIS_Field := 16#0#;
      --  Write-only. STALLed Interrupt Set
      STALLEDIS      : DEVEPTIFR_STALLEDIS_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Set
      SHORTPACKETS   : DEVEPTIFR_SHORTPACKETS_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Number of Busy Banks Interrupt Set
      NBUSYBKS       : DEVEPTIFR_NBUSYBKS_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTIFR_Register use record
      TXINIS         at 0 range 0 .. 0;
      RXOUTIS        at 0 range 1 .. 1;
      RXSTPIS        at 0 range 2 .. 2;
      NAKOUTIS       at 0 range 3 .. 3;
      NAKINIS        at 0 range 4 .. 4;
      OVERFIS        at 0 range 5 .. 5;
      STALLEDIS      at 0 range 6 .. 6;
      SHORTPACKETS   at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKS       at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  Device Endpoint Set Register (n = 0)
   type DEVEPTIFR_Registers is array (0 .. 9) of DEVEPTIFR_Register;

   ------------------------
   -- DEVEPTIMR_Register --
   ------------------------

   subtype DEVEPTIMR_TXINE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_RXOUTE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_RXSTPE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_NAKOUTE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_NAKINE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_OVERFE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_STALLEDE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_SHORTPACKETE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_NBUSYBKE_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_KILLBK_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_FIFOCON_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_EPDISHDMA_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_NYETDIS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_RSTDT_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIMR_STALLRQ_Field is ATSAM3X8E.Bit;

   --  Device Endpoint Mask Register (n = 0)
   type DEVEPTIMR_Register is record
      --  Read-only. Transmitted IN Data Interrupt
      TXINE          : DEVEPTIMR_TXINE_Field := 16#0#;
      --  Read-only. Received OUT Data Interrupt
      RXOUTE         : DEVEPTIMR_RXOUTE_Field := 16#0#;
      --  Read-only. Received SETUP Interrupt
      RXSTPE         : DEVEPTIMR_RXSTPE_Field := 16#0#;
      --  Read-only. NAKed OUT Interrupt
      NAKOUTE        : DEVEPTIMR_NAKOUTE_Field := 16#0#;
      --  Read-only. NAKed IN Interrupt
      NAKINE         : DEVEPTIMR_NAKINE_Field := 16#0#;
      --  Read-only. Overflow Interrupt
      OVERFE         : DEVEPTIMR_OVERFE_Field := 16#0#;
      --  Read-only. STALLed Interrupt
      STALLEDE       : DEVEPTIMR_STALLEDE_Field := 16#0#;
      --  Read-only. Short Packet Interrupt
      SHORTPACKETE   : DEVEPTIMR_SHORTPACKETE_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4;
      --  Read-only. Number of Busy Banks Interrupt
      NBUSYBKE       : DEVEPTIMR_NBUSYBKE_Field := 16#0#;
      --  Read-only. Kill IN Bank
      KILLBK         : DEVEPTIMR_KILLBK_Field := 16#0#;
      --  Read-only. FIFO Control
      FIFOCON        : DEVEPTIMR_FIFOCON_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit;
      --  Read-only. Endpoint Interrupts Disable HDMA Request
      EPDISHDMA      : DEVEPTIMR_EPDISHDMA_Field := 16#0#;
      --  Read-only. NYET Token Disable
      NYETDIS        : DEVEPTIMR_NYETDIS_Field := 16#0#;
      --  Read-only. Reset Data Toggle
      RSTDT          : DEVEPTIMR_RSTDT_Field := 16#0#;
      --  Read-only. STALL Request
      STALLRQ        : DEVEPTIMR_STALLRQ_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTIMR_Register use record
      TXINE          at 0 range 0 .. 0;
      RXOUTE         at 0 range 1 .. 1;
      RXSTPE         at 0 range 2 .. 2;
      NAKOUTE        at 0 range 3 .. 3;
      NAKINE         at 0 range 4 .. 4;
      OVERFE         at 0 range 5 .. 5;
      STALLEDE       at 0 range 6 .. 6;
      SHORTPACKETE   at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKE       at 0 range 12 .. 12;
      KILLBK         at 0 range 13 .. 13;
      FIFOCON        at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      EPDISHDMA      at 0 range 16 .. 16;
      NYETDIS        at 0 range 17 .. 17;
      RSTDT          at 0 range 18 .. 18;
      STALLRQ        at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Device Endpoint Mask Register (n = 0)
   type DEVEPTIMR_Registers is array (0 .. 9) of DEVEPTIMR_Register;

   ------------------------
   -- DEVEPTIER_Register --
   ------------------------

   subtype DEVEPTIER_TXINES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_RXOUTES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_RXSTPES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_NAKOUTES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_NAKINES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_OVERFES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_STALLEDES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_SHORTPACKETES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_NBUSYBKES_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_KILLBKS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_FIFOCONS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_EPDISHDMAS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_NYETDISS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_RSTDTS_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIER_STALLRQS_Field is ATSAM3X8E.Bit;

   --  Device Endpoint Enable Register (n = 0)
   type DEVEPTIER_Register is record
      --  Write-only. Transmitted IN Data Interrupt Enable
      TXINES         : DEVEPTIER_TXINES_Field := 16#0#;
      --  Write-only. Received OUT Data Interrupt Enable
      RXOUTES        : DEVEPTIER_RXOUTES_Field := 16#0#;
      --  Write-only. Received SETUP Interrupt Enable
      RXSTPES        : DEVEPTIER_RXSTPES_Field := 16#0#;
      --  Write-only. NAKed OUT Interrupt Enable
      NAKOUTES       : DEVEPTIER_NAKOUTES_Field := 16#0#;
      --  Write-only. NAKed IN Interrupt Enable
      NAKINES        : DEVEPTIER_NAKINES_Field := 16#0#;
      --  Write-only. Overflow Interrupt Enable
      OVERFES        : DEVEPTIER_OVERFES_Field := 16#0#;
      --  Write-only. STALLed Interrupt Enable
      STALLEDES      : DEVEPTIER_STALLEDES_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Enable
      SHORTPACKETES  : DEVEPTIER_SHORTPACKETES_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Number of Busy Banks Interrupt Enable
      NBUSYBKES      : DEVEPTIER_NBUSYBKES_Field := 16#0#;
      --  Write-only. Kill IN Bank
      KILLBKS        : DEVEPTIER_KILLBKS_Field := 16#0#;
      --  Write-only. FIFO Control
      FIFOCONS       : DEVEPTIER_FIFOCONS_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Endpoint Interrupts Disable HDMA Request Enable
      EPDISHDMAS     : DEVEPTIER_EPDISHDMAS_Field := 16#0#;
      --  Write-only. NYET Token Disable Enable
      NYETDISS       : DEVEPTIER_NYETDISS_Field := 16#0#;
      --  Write-only. Reset Data Toggle Enable
      RSTDTS         : DEVEPTIER_RSTDTS_Field := 16#0#;
      --  Write-only. STALL Request Enable
      STALLRQS       : DEVEPTIER_STALLRQS_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTIER_Register use record
      TXINES         at 0 range 0 .. 0;
      RXOUTES        at 0 range 1 .. 1;
      RXSTPES        at 0 range 2 .. 2;
      NAKOUTES       at 0 range 3 .. 3;
      NAKINES        at 0 range 4 .. 4;
      OVERFES        at 0 range 5 .. 5;
      STALLEDES      at 0 range 6 .. 6;
      SHORTPACKETES  at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKES      at 0 range 12 .. 12;
      KILLBKS        at 0 range 13 .. 13;
      FIFOCONS       at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      EPDISHDMAS     at 0 range 16 .. 16;
      NYETDISS       at 0 range 17 .. 17;
      RSTDTS         at 0 range 18 .. 18;
      STALLRQS       at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Device Endpoint Enable Register (n = 0)
   type DEVEPTIER_Registers is array (0 .. 9) of DEVEPTIER_Register;

   ------------------------
   -- DEVEPTIDR_Register --
   ------------------------

   subtype DEVEPTIDR_TXINEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_RXOUTEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_RXSTPEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_NAKOUTEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_NAKINEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_OVERFEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_STALLEDEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_SHORTPACKETEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_NBUSYBKEC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_FIFOCONC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_EPDISHDMAC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_NYETDISC_Field is ATSAM3X8E.Bit;
   subtype DEVEPTIDR_STALLRQC_Field is ATSAM3X8E.Bit;

   --  Device Endpoint Disable Register (n = 0)
   type DEVEPTIDR_Register is record
      --  Write-only. Transmitted IN Interrupt Clear
      TXINEC         : DEVEPTIDR_TXINEC_Field := 16#0#;
      --  Write-only. Received OUT Data Interrupt Clear
      RXOUTEC        : DEVEPTIDR_RXOUTEC_Field := 16#0#;
      --  Write-only. Received SETUP Interrupt Clear
      RXSTPEC        : DEVEPTIDR_RXSTPEC_Field := 16#0#;
      --  Write-only. NAKed OUT Interrupt Clear
      NAKOUTEC       : DEVEPTIDR_NAKOUTEC_Field := 16#0#;
      --  Write-only. NAKed IN Interrupt Clear
      NAKINEC        : DEVEPTIDR_NAKINEC_Field := 16#0#;
      --  Write-only. Overflow Interrupt Clear
      OVERFEC        : DEVEPTIDR_OVERFEC_Field := 16#0#;
      --  Write-only. STALLed Interrupt Clear
      STALLEDEC      : DEVEPTIDR_STALLEDEC_Field := 16#0#;
      --  Write-only. Shortpacket Interrupt Clear
      SHORTPACKETEC  : DEVEPTIDR_SHORTPACKETEC_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Number of Busy Banks Interrupt Clear
      NBUSYBKEC      : DEVEPTIDR_NBUSYBKEC_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. FIFO Control Clear
      FIFOCONC       : DEVEPTIDR_FIFOCONC_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Endpoint Interrupts Disable HDMA Request Clear
      EPDISHDMAC     : DEVEPTIDR_EPDISHDMAC_Field := 16#0#;
      --  Write-only. NYET Token Disable Clear
      NYETDISC       : DEVEPTIDR_NYETDISC_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. STALL Request Clear
      STALLRQC       : DEVEPTIDR_STALLRQC_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVEPTIDR_Register use record
      TXINEC         at 0 range 0 .. 0;
      RXOUTEC        at 0 range 1 .. 1;
      RXSTPEC        at 0 range 2 .. 2;
      NAKOUTEC       at 0 range 3 .. 3;
      NAKINEC        at 0 range 4 .. 4;
      OVERFEC        at 0 range 5 .. 5;
      STALLEDEC      at 0 range 6 .. 6;
      SHORTPACKETEC  at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKEC      at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      FIFOCONC       at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      EPDISHDMAC     at 0 range 16 .. 16;
      NYETDISC       at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      STALLRQC       at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Device Endpoint Disable Register (n = 0)
   type DEVEPTIDR_Registers is array (0 .. 9) of DEVEPTIDR_Register;

   ----------------------------
   -- DEVDMACONTROL_Register --
   ----------------------------

   subtype DEVDMACONTROL1_CHANN_ENB_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_LDNXT_DSC_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_END_TR_EN_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_END_B_EN_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_END_TR_IT_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_END_BUFFIT_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_DESC_LD_IT_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_BURST_LCK_Field is ATSAM3X8E.Bit;
   subtype DEVDMACONTROL1_BUFF_LENGTH_Field is ATSAM3X8E.Short;

   --  Device DMA Channel Control Register (n = 1)
   type DEVDMACONTROL_Register is record
      --  Channel Enable Command
      CHANN_ENB     : DEVDMACONTROL1_CHANN_ENB_Field := 16#0#;
      --  Load Next Channel Transfer Descriptor Enable Command
      LDNXT_DSC     : DEVDMACONTROL1_LDNXT_DSC_Field := 16#0#;
      --  End of Transfer Enable Control
      END_TR_EN     : DEVDMACONTROL1_END_TR_EN_Field := 16#0#;
      --  End of Buffer Enable Control
      END_B_EN      : DEVDMACONTROL1_END_B_EN_Field := 16#0#;
      --  End of Transfer Interrupt Enable
      END_TR_IT     : DEVDMACONTROL1_END_TR_IT_Field := 16#0#;
      --  End of Buffer Interrupt Enable
      END_BUFFIT    : DEVDMACONTROL1_END_BUFFIT_Field := 16#0#;
      --  Descriptor Loaded Interrupt Enable
      DESC_LD_IT    : DEVDMACONTROL1_DESC_LD_IT_Field := 16#0#;
      --  Burst Lock Enable
      BURST_LCK     : DEVDMACONTROL1_BURST_LCK_Field := 16#0#;
      --  unspecified
      Reserved_8_15 : ATSAM3X8E.Byte := 16#0#;
      --  Buffer Byte Length (Write-only)
      BUFF_LENGTH   : DEVDMACONTROL1_BUFF_LENGTH_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVDMACONTROL_Register use record
      CHANN_ENB     at 0 range 0 .. 0;
      LDNXT_DSC     at 0 range 1 .. 1;
      END_TR_EN     at 0 range 2 .. 2;
      END_B_EN      at 0 range 3 .. 3;
      END_TR_IT     at 0 range 4 .. 4;
      END_BUFFIT    at 0 range 5 .. 5;
      DESC_LD_IT    at 0 range 6 .. 6;
      BURST_LCK     at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
      BUFF_LENGTH   at 0 range 16 .. 31;
   end record;

   ---------------------------
   -- DEVDMASTATUS_Register --
   ---------------------------

   subtype DEVDMASTATUS1_CHANN_ENB_Field is ATSAM3X8E.Bit;
   subtype DEVDMASTATUS1_CHANN_ACT_Field is ATSAM3X8E.Bit;
   subtype DEVDMASTATUS1_END_TR_ST_Field is ATSAM3X8E.Bit;
   subtype DEVDMASTATUS1_END_BF_ST_Field is ATSAM3X8E.Bit;
   subtype DEVDMASTATUS1_DESC_LDST_Field is ATSAM3X8E.Bit;
   subtype DEVDMASTATUS1_BUFF_COUNT_Field is ATSAM3X8E.Short;

   --  Device DMA Channel Status Register (n = 1)
   type DEVDMASTATUS_Register is record
      --  Channel Enable Status
      CHANN_ENB     : DEVDMASTATUS1_CHANN_ENB_Field := 16#0#;
      --  Channel Active Status
      CHANN_ACT     : DEVDMASTATUS1_CHANN_ACT_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : ATSAM3X8E.UInt2 := 16#0#;
      --  End of Channel Transfer Status
      END_TR_ST     : DEVDMASTATUS1_END_TR_ST_Field := 16#0#;
      --  End of Channel Buffer Status
      END_BF_ST     : DEVDMASTATUS1_END_BF_ST_Field := 16#0#;
      --  Descriptor Loaded Status
      DESC_LDST     : DEVDMASTATUS1_DESC_LDST_Field := 16#0#;
      --  unspecified
      Reserved_7_15 : ATSAM3X8E.UInt9 := 16#0#;
      --  Buffer Byte Count
      BUFF_COUNT    : DEVDMASTATUS1_BUFF_COUNT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for DEVDMASTATUS_Register use record
      CHANN_ENB     at 0 range 0 .. 0;
      CHANN_ACT     at 0 range 1 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      END_TR_ST     at 0 range 4 .. 4;
      END_BF_ST     at 0 range 5 .. 5;
      DESC_LDST     at 0 range 6 .. 6;
      Reserved_7_15 at 0 range 7 .. 15;
      BUFF_COUNT    at 0 range 16 .. 31;
   end record;

   ----------------------
   -- HSTCTRL_Register --
   ----------------------

   subtype HSTCTRL_SOFE_Field is ATSAM3X8E.Bit;
   subtype HSTCTRL_RESET_Field is ATSAM3X8E.Bit;
   subtype HSTCTRL_RESUME_Field is ATSAM3X8E.Bit;

   --  Host General Control Register
   type HSTCTRL_Register is record
      --  unspecified
      Reserved_0_7   : ATSAM3X8E.Byte := 16#0#;
      --  Start of Frame Generation Enable
      SOFE           : HSTCTRL_SOFE_Field := 16#0#;
      --  Send USB Reset
      RESET          : HSTCTRL_RESET_Field := 16#0#;
      --  Send USB Resume
      RESUME         : HSTCTRL_RESUME_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Mode Configuration
      SPDCONF        : SPDCONF_Field := Normal;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTCTRL_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      SOFE           at 0 range 8 .. 8;
      RESET          at 0 range 9 .. 9;
      RESUME         at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SPDCONF        at 0 range 12 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   ---------------------
   -- HSTISR_Register --
   ---------------------

   subtype HSTISR_DCONNI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DDISCI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_RSTI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_RSMEDI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_RXRSMI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_HSOFI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_HWUPI_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_0_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_1_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_2_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_3_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_4_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_5_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_6_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_7_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_8_Field is ATSAM3X8E.Bit;
   subtype HSTISR_PEP_9_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype HSTISR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Host Global Interrupt Status Register
   type HSTISR_Register is record
      --  Read-only. Device Connection Interrupt
      DCONNI         : HSTISR_DCONNI_Field := 16#0#;
      --  Read-only. Device Disconnection Interrupt
      DDISCI         : HSTISR_DDISCI_Field := 16#0#;
      --  Read-only. USB Reset Sent Interrupt
      RSTI           : HSTISR_RSTI_Field := 16#0#;
      --  Read-only. Downstream Resume Sent Interrupt
      RSMEDI         : HSTISR_RSMEDI_Field := 16#0#;
      --  Read-only. Upstream Resume Received Interrupt
      RXRSMI         : HSTISR_RXRSMI_Field := 16#0#;
      --  Read-only. Host Start of Frame Interrupt
      HSOFI          : HSTISR_HSOFI_Field := 16#0#;
      --  Read-only. Host Wake-Up Interrupt
      HWUPI          : HSTISR_HWUPI_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Pipe 0 Interrupt
      PEP_0          : HSTISR_PEP_0_Field := 16#0#;
      --  Read-only. Pipe 1 Interrupt
      PEP_1          : HSTISR_PEP_1_Field := 16#0#;
      --  Read-only. Pipe 2 Interrupt
      PEP_2          : HSTISR_PEP_2_Field := 16#0#;
      --  Read-only. Pipe 3 Interrupt
      PEP_3          : HSTISR_PEP_3_Field := 16#0#;
      --  Read-only. Pipe 4 Interrupt
      PEP_4          : HSTISR_PEP_4_Field := 16#0#;
      --  Read-only. Pipe 5 Interrupt
      PEP_5          : HSTISR_PEP_5_Field := 16#0#;
      --  Read-only. Pipe 6 Interrupt
      PEP_6          : HSTISR_PEP_6_Field := 16#0#;
      --  Read-only. Pipe 7 Interrupt
      PEP_7          : HSTISR_PEP_7_Field := 16#0#;
      --  Read-only. Pipe 8 Interrupt
      PEP_8          : HSTISR_PEP_8_Field := 16#0#;
      --  Read-only. Pipe 9 Interrupt
      PEP_9          : HSTISR_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_18_24 : ATSAM3X8E.UInt7;
      --  Read-only. DMA Channel 1 Interrupt
      DMA_1          : HSTISR_DMA_1_Field := 16#0#;
      --  Read-only. DMA Channel 2 Interrupt
      DMA_2          : HSTISR_DMA_2_Field := 16#0#;
      --  Read-only. DMA Channel 3 Interrupt
      DMA_3          : HSTISR_DMA_3_Field := 16#0#;
      --  Read-only. DMA Channel 4 Interrupt
      DMA_4          : HSTISR_DMA_4_Field := 16#0#;
      --  Read-only. DMA Channel 5 Interrupt
      DMA_5          : HSTISR_DMA_5_Field := 16#0#;
      --  Read-only. DMA Channel 6 Interrupt
      DMA_6          : HSTISR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTISR_Register use record
      DCONNI         at 0 range 0 .. 0;
      DDISCI         at 0 range 1 .. 1;
      RSTI           at 0 range 2 .. 2;
      RSMEDI         at 0 range 3 .. 3;
      RXRSMI         at 0 range 4 .. 4;
      HSOFI          at 0 range 5 .. 5;
      HWUPI          at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PEP_0          at 0 range 8 .. 8;
      PEP_1          at 0 range 9 .. 9;
      PEP_2          at 0 range 10 .. 10;
      PEP_3          at 0 range 11 .. 11;
      PEP_4          at 0 range 12 .. 12;
      PEP_5          at 0 range 13 .. 13;
      PEP_6          at 0 range 14 .. 14;
      PEP_7          at 0 range 15 .. 15;
      PEP_8          at 0 range 16 .. 16;
      PEP_9          at 0 range 17 .. 17;
      Reserved_18_24 at 0 range 18 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- HSTICR_Register --
   ---------------------

   subtype HSTICR_DCONNIC_Field is ATSAM3X8E.Bit;
   subtype HSTICR_DDISCIC_Field is ATSAM3X8E.Bit;
   subtype HSTICR_RSTIC_Field is ATSAM3X8E.Bit;
   subtype HSTICR_RSMEDIC_Field is ATSAM3X8E.Bit;
   subtype HSTICR_RXRSMIC_Field is ATSAM3X8E.Bit;
   subtype HSTICR_HSOFIC_Field is ATSAM3X8E.Bit;
   subtype HSTICR_HWUPIC_Field is ATSAM3X8E.Bit;

   --  Host Global Interrupt Clear Register
   type HSTICR_Register is record
      --  Write-only. Device Connection Interrupt Clear
      DCONNIC       : HSTICR_DCONNIC_Field := 16#0#;
      --  Write-only. Device Disconnection Interrupt Clear
      DDISCIC       : HSTICR_DDISCIC_Field := 16#0#;
      --  Write-only. USB Reset Sent Interrupt Clear
      RSTIC         : HSTICR_RSTIC_Field := 16#0#;
      --  Write-only. Downstream Resume Sent Interrupt Clear
      RSMEDIC       : HSTICR_RSMEDIC_Field := 16#0#;
      --  Write-only. Upstream Resume Received Interrupt Clear
      RXRSMIC       : HSTICR_RXRSMIC_Field := 16#0#;
      --  Write-only. Host Start of Frame Interrupt Clear
      HSOFIC        : HSTICR_HSOFIC_Field := 16#0#;
      --  Write-only. Host Wake-Up Interrupt Clear
      HWUPIC        : HSTICR_HWUPIC_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTICR_Register use record
      DCONNIC       at 0 range 0 .. 0;
      DDISCIC       at 0 range 1 .. 1;
      RSTIC         at 0 range 2 .. 2;
      RSMEDIC       at 0 range 3 .. 3;
      RXRSMIC       at 0 range 4 .. 4;
      HSOFIC        at 0 range 5 .. 5;
      HWUPIC        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   ---------------------
   -- HSTIFR_Register --
   ---------------------

   subtype HSTIFR_DCONNIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DDISCIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_RSTIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_RSMEDIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_RXRSMIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_HSOFIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_HWUPIS_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype HSTIFR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Host Global Interrupt Set Register
   type HSTIFR_Register is record
      --  Write-only. Device Connection Interrupt Set
      DCONNIS        : HSTIFR_DCONNIS_Field := 16#0#;
      --  Write-only. Device Disconnection Interrupt Set
      DDISCIS        : HSTIFR_DDISCIS_Field := 16#0#;
      --  Write-only. USB Reset Sent Interrupt Set
      RSTIS          : HSTIFR_RSTIS_Field := 16#0#;
      --  Write-only. Downstream Resume Sent Interrupt Set
      RSMEDIS        : HSTIFR_RSMEDIS_Field := 16#0#;
      --  Write-only. Upstream Resume Received Interrupt Set
      RXRSMIS        : HSTIFR_RXRSMIS_Field := 16#0#;
      --  Write-only. Host Start of Frame Interrupt Set
      HSOFIS         : HSTIFR_HSOFIS_Field := 16#0#;
      --  Write-only. Host Wake-Up Interrupt Set
      HWUPIS         : HSTIFR_HWUPIS_Field := 16#0#;
      --  unspecified
      Reserved_7_24  : ATSAM3X8E.UInt18 := 16#0#;
      --  Write-only. DMA Channel 1 Interrupt Set
      DMA_1          : HSTIFR_DMA_1_Field := 16#0#;
      --  Write-only. DMA Channel 2 Interrupt Set
      DMA_2          : HSTIFR_DMA_2_Field := 16#0#;
      --  Write-only. DMA Channel 3 Interrupt Set
      DMA_3          : HSTIFR_DMA_3_Field := 16#0#;
      --  Write-only. DMA Channel 4 Interrupt Set
      DMA_4          : HSTIFR_DMA_4_Field := 16#0#;
      --  Write-only. DMA Channel 5 Interrupt Set
      DMA_5          : HSTIFR_DMA_5_Field := 16#0#;
      --  Write-only. DMA Channel 6 Interrupt Set
      DMA_6          : HSTIFR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTIFR_Register use record
      DCONNIS        at 0 range 0 .. 0;
      DDISCIS        at 0 range 1 .. 1;
      RSTIS          at 0 range 2 .. 2;
      RSMEDIS        at 0 range 3 .. 3;
      RXRSMIS        at 0 range 4 .. 4;
      HSOFIS         at 0 range 5 .. 5;
      HWUPIS         at 0 range 6 .. 6;
      Reserved_7_24  at 0 range 7 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- HSTIMR_Register --
   ---------------------

   subtype HSTIMR_DCONNIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DDISCIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_RSTIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_RSMEDIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_RXRSMIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_HSOFIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_HWUPIE_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_0_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_1_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_2_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_3_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_4_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_5_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_6_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_7_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_8_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_PEP_9_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype HSTIMR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Host Global Interrupt Mask Register
   type HSTIMR_Register is record
      --  Read-only. Device Connection Interrupt Enable
      DCONNIE        : HSTIMR_DCONNIE_Field := 16#0#;
      --  Read-only. Device Disconnection Interrupt Enable
      DDISCIE        : HSTIMR_DDISCIE_Field := 16#0#;
      --  Read-only. USB Reset Sent Interrupt Enable
      RSTIE          : HSTIMR_RSTIE_Field := 16#0#;
      --  Read-only. Downstream Resume Sent Interrupt Enable
      RSMEDIE        : HSTIMR_RSMEDIE_Field := 16#0#;
      --  Read-only. Upstream Resume Received Interrupt Enable
      RXRSMIE        : HSTIMR_RXRSMIE_Field := 16#0#;
      --  Read-only. Host Start of Frame Interrupt Enable
      HSOFIE         : HSTIMR_HSOFIE_Field := 16#0#;
      --  Read-only. Host Wake-Up Interrupt Enable
      HWUPIE         : HSTIMR_HWUPIE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit;
      --  Read-only. Pipe 0 Interrupt Enable
      PEP_0          : HSTIMR_PEP_0_Field := 16#0#;
      --  Read-only. Pipe 1 Interrupt Enable
      PEP_1          : HSTIMR_PEP_1_Field := 16#0#;
      --  Read-only. Pipe 2 Interrupt Enable
      PEP_2          : HSTIMR_PEP_2_Field := 16#0#;
      --  Read-only. Pipe 3 Interrupt Enable
      PEP_3          : HSTIMR_PEP_3_Field := 16#0#;
      --  Read-only. Pipe 4 Interrupt Enable
      PEP_4          : HSTIMR_PEP_4_Field := 16#0#;
      --  Read-only. Pipe 5 Interrupt Enable
      PEP_5          : HSTIMR_PEP_5_Field := 16#0#;
      --  Read-only. Pipe 6 Interrupt Enable
      PEP_6          : HSTIMR_PEP_6_Field := 16#0#;
      --  Read-only. Pipe 7 Interrupt Enable
      PEP_7          : HSTIMR_PEP_7_Field := 16#0#;
      --  Read-only. Pipe 8 Interrupt Enable
      PEP_8          : HSTIMR_PEP_8_Field := 16#0#;
      --  Read-only. Pipe 9 Interrupt Enable
      PEP_9          : HSTIMR_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_18_24 : ATSAM3X8E.UInt7;
      --  Read-only. DMA Channel 1 Interrupt Enable
      DMA_1          : HSTIMR_DMA_1_Field := 16#0#;
      --  Read-only. DMA Channel 2 Interrupt Enable
      DMA_2          : HSTIMR_DMA_2_Field := 16#0#;
      --  Read-only. DMA Channel 3 Interrupt Enable
      DMA_3          : HSTIMR_DMA_3_Field := 16#0#;
      --  Read-only. DMA Channel 4 Interrupt Enable
      DMA_4          : HSTIMR_DMA_4_Field := 16#0#;
      --  Read-only. DMA Channel 5 Interrupt Enable
      DMA_5          : HSTIMR_DMA_5_Field := 16#0#;
      --  Read-only. DMA Channel 6 Interrupt Enable
      DMA_6          : HSTIMR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTIMR_Register use record
      DCONNIE        at 0 range 0 .. 0;
      DDISCIE        at 0 range 1 .. 1;
      RSTIE          at 0 range 2 .. 2;
      RSMEDIE        at 0 range 3 .. 3;
      RXRSMIE        at 0 range 4 .. 4;
      HSOFIE         at 0 range 5 .. 5;
      HWUPIE         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PEP_0          at 0 range 8 .. 8;
      PEP_1          at 0 range 9 .. 9;
      PEP_2          at 0 range 10 .. 10;
      PEP_3          at 0 range 11 .. 11;
      PEP_4          at 0 range 12 .. 12;
      PEP_5          at 0 range 13 .. 13;
      PEP_6          at 0 range 14 .. 14;
      PEP_7          at 0 range 15 .. 15;
      PEP_8          at 0 range 16 .. 16;
      PEP_9          at 0 range 17 .. 17;
      Reserved_18_24 at 0 range 18 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- HSTIDR_Register --
   ---------------------

   subtype HSTIDR_DCONNIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DDISCIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_RSTIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_RSMEDIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_RXRSMIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_HSOFIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_HWUPIEC_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_0_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_1_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_2_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_3_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_4_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_5_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_6_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_7_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_8_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_PEP_9_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DMA_1_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DMA_2_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DMA_3_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DMA_4_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DMA_5_Field is ATSAM3X8E.Bit;
   subtype HSTIDR_DMA_6_Field is ATSAM3X8E.Bit;

   --  Host Global Interrupt Disable Register
   type HSTIDR_Register is record
      --  Write-only. Device Connection Interrupt Disable
      DCONNIEC       : HSTIDR_DCONNIEC_Field := 16#0#;
      --  Write-only. Device Disconnection Interrupt Disable
      DDISCIEC       : HSTIDR_DDISCIEC_Field := 16#0#;
      --  Write-only. USB Reset Sent Interrupt Disable
      RSTIEC         : HSTIDR_RSTIEC_Field := 16#0#;
      --  Write-only. Downstream Resume Sent Interrupt Disable
      RSMEDIEC       : HSTIDR_RSMEDIEC_Field := 16#0#;
      --  Write-only. Upstream Resume Received Interrupt Disable
      RXRSMIEC       : HSTIDR_RXRSMIEC_Field := 16#0#;
      --  Write-only. Host Start of Frame Interrupt Disable
      HSOFIEC        : HSTIDR_HSOFIEC_Field := 16#0#;
      --  Write-only. Host Wake-Up Interrupt Disable
      HWUPIEC        : HSTIDR_HWUPIEC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Pipe 0 Interrupt Disable
      PEP_0          : HSTIDR_PEP_0_Field := 16#0#;
      --  Write-only. Pipe 1 Interrupt Disable
      PEP_1          : HSTIDR_PEP_1_Field := 16#0#;
      --  Write-only. Pipe 2 Interrupt Disable
      PEP_2          : HSTIDR_PEP_2_Field := 16#0#;
      --  Write-only. Pipe 3 Interrupt Disable
      PEP_3          : HSTIDR_PEP_3_Field := 16#0#;
      --  Write-only. Pipe 4 Interrupt Disable
      PEP_4          : HSTIDR_PEP_4_Field := 16#0#;
      --  Write-only. Pipe 5 Interrupt Disable
      PEP_5          : HSTIDR_PEP_5_Field := 16#0#;
      --  Write-only. Pipe 6 Interrupt Disable
      PEP_6          : HSTIDR_PEP_6_Field := 16#0#;
      --  Write-only. Pipe 7 Interrupt Disable
      PEP_7          : HSTIDR_PEP_7_Field := 16#0#;
      --  Write-only. Pipe 8 Interrupt Disable
      PEP_8          : HSTIDR_PEP_8_Field := 16#0#;
      --  Write-only. Pipe 9 Interrupt Disable
      PEP_9          : HSTIDR_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_18_24 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write-only. DMA Channel 1 Interrupt Disable
      DMA_1          : HSTIDR_DMA_1_Field := 16#0#;
      --  Write-only. DMA Channel 2 Interrupt Disable
      DMA_2          : HSTIDR_DMA_2_Field := 16#0#;
      --  Write-only. DMA Channel 3 Interrupt Disable
      DMA_3          : HSTIDR_DMA_3_Field := 16#0#;
      --  Write-only. DMA Channel 4 Interrupt Disable
      DMA_4          : HSTIDR_DMA_4_Field := 16#0#;
      --  Write-only. DMA Channel 5 Interrupt Disable
      DMA_5          : HSTIDR_DMA_5_Field := 16#0#;
      --  Write-only. DMA Channel 6 Interrupt Disable
      DMA_6          : HSTIDR_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTIDR_Register use record
      DCONNIEC       at 0 range 0 .. 0;
      DDISCIEC       at 0 range 1 .. 1;
      RSTIEC         at 0 range 2 .. 2;
      RSMEDIEC       at 0 range 3 .. 3;
      RXRSMIEC       at 0 range 4 .. 4;
      HSOFIEC        at 0 range 5 .. 5;
      HWUPIEC        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PEP_0          at 0 range 8 .. 8;
      PEP_1          at 0 range 9 .. 9;
      PEP_2          at 0 range 10 .. 10;
      PEP_3          at 0 range 11 .. 11;
      PEP_4          at 0 range 12 .. 12;
      PEP_5          at 0 range 13 .. 13;
      PEP_6          at 0 range 14 .. 14;
      PEP_7          at 0 range 15 .. 15;
      PEP_8          at 0 range 16 .. 16;
      PEP_9          at 0 range 17 .. 17;
      Reserved_18_24 at 0 range 18 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- HSTIER_Register --
   ---------------------

   subtype HSTIER_DCONNIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DDISCIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_RSTIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_RSMEDIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_RXRSMIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_HSOFIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_HWUPIES_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_0_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_1_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_2_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_3_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_4_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_5_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_6_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_7_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_8_Field is ATSAM3X8E.Bit;
   subtype HSTIER_PEP_9_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DMA_1_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DMA_2_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DMA_3_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DMA_4_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DMA_5_Field is ATSAM3X8E.Bit;
   subtype HSTIER_DMA_6_Field is ATSAM3X8E.Bit;

   --  Host Global Interrupt Enable Register
   type HSTIER_Register is record
      --  Write-only. Device Connection Interrupt Enable
      DCONNIES       : HSTIER_DCONNIES_Field := 16#0#;
      --  Write-only. Device Disconnection Interrupt Enable
      DDISCIES       : HSTIER_DDISCIES_Field := 16#0#;
      --  Write-only. USB Reset Sent Interrupt Enable
      RSTIES         : HSTIER_RSTIES_Field := 16#0#;
      --  Write-only. Downstream Resume Sent Interrupt Enable
      RSMEDIES       : HSTIER_RSMEDIES_Field := 16#0#;
      --  Write-only. Upstream Resume Received Interrupt Enable
      RXRSMIES       : HSTIER_RXRSMIES_Field := 16#0#;
      --  Write-only. Host Start of Frame Interrupt Enable
      HSOFIES        : HSTIER_HSOFIES_Field := 16#0#;
      --  Write-only. Host Wake-Up Interrupt Enable
      HWUPIES        : HSTIER_HWUPIES_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Pipe 0 Interrupt Enable
      PEP_0          : HSTIER_PEP_0_Field := 16#0#;
      --  Write-only. Pipe 1 Interrupt Enable
      PEP_1          : HSTIER_PEP_1_Field := 16#0#;
      --  Write-only. Pipe 2 Interrupt Enable
      PEP_2          : HSTIER_PEP_2_Field := 16#0#;
      --  Write-only. Pipe 3 Interrupt Enable
      PEP_3          : HSTIER_PEP_3_Field := 16#0#;
      --  Write-only. Pipe 4 Interrupt Enable
      PEP_4          : HSTIER_PEP_4_Field := 16#0#;
      --  Write-only. Pipe 5 Interrupt Enable
      PEP_5          : HSTIER_PEP_5_Field := 16#0#;
      --  Write-only. Pipe 6 Interrupt Enable
      PEP_6          : HSTIER_PEP_6_Field := 16#0#;
      --  Write-only. Pipe 7 Interrupt Enable
      PEP_7          : HSTIER_PEP_7_Field := 16#0#;
      --  Write-only. Pipe 8 Interrupt Enable
      PEP_8          : HSTIER_PEP_8_Field := 16#0#;
      --  Write-only. Pipe 9 Interrupt Enable
      PEP_9          : HSTIER_PEP_9_Field := 16#0#;
      --  unspecified
      Reserved_18_24 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write-only. DMA Channel 1 Interrupt Enable
      DMA_1          : HSTIER_DMA_1_Field := 16#0#;
      --  Write-only. DMA Channel 2 Interrupt Enable
      DMA_2          : HSTIER_DMA_2_Field := 16#0#;
      --  Write-only. DMA Channel 3 Interrupt Enable
      DMA_3          : HSTIER_DMA_3_Field := 16#0#;
      --  Write-only. DMA Channel 4 Interrupt Enable
      DMA_4          : HSTIER_DMA_4_Field := 16#0#;
      --  Write-only. DMA Channel 5 Interrupt Enable
      DMA_5          : HSTIER_DMA_5_Field := 16#0#;
      --  Write-only. DMA Channel 6 Interrupt Enable
      DMA_6          : HSTIER_DMA_6_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTIER_Register use record
      DCONNIES       at 0 range 0 .. 0;
      DDISCIES       at 0 range 1 .. 1;
      RSTIES         at 0 range 2 .. 2;
      RSMEDIES       at 0 range 3 .. 3;
      RXRSMIES       at 0 range 4 .. 4;
      HSOFIES        at 0 range 5 .. 5;
      HWUPIES        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PEP_0          at 0 range 8 .. 8;
      PEP_1          at 0 range 9 .. 9;
      PEP_2          at 0 range 10 .. 10;
      PEP_3          at 0 range 11 .. 11;
      PEP_4          at 0 range 12 .. 12;
      PEP_5          at 0 range 13 .. 13;
      PEP_6          at 0 range 14 .. 14;
      PEP_7          at 0 range 15 .. 15;
      PEP_8          at 0 range 16 .. 16;
      PEP_9          at 0 range 17 .. 17;
      Reserved_18_24 at 0 range 18 .. 24;
      DMA_1          at 0 range 25 .. 25;
      DMA_2          at 0 range 26 .. 26;
      DMA_3          at 0 range 27 .. 27;
      DMA_4          at 0 range 28 .. 28;
      DMA_5          at 0 range 29 .. 29;
      DMA_6          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   ---------------------
   -- HSTPIP_Register --
   ---------------------

   ----------------
   -- HSTPIP.PEN --
   ----------------

   --  HSTPIP_PEN array element
   subtype HSTPIP_PEN_Element is ATSAM3X8E.Bit;

   --  HSTPIP_PEN array
   type HSTPIP_PEN_Field_Array is array (0 .. 8) of HSTPIP_PEN_Element
     with Component_Size => 1, Size => 9;

   --  Type definition for HSTPIP_PEN
   type HSTPIP_PEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEN as a value
            Val : ATSAM3X8E.UInt9;
         when True =>
            --  PEN as an array
            Arr : HSTPIP_PEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 9;

   for HSTPIP_PEN_Field use record
      Val at 0 range 0 .. 8;
      Arr at 0 range 0 .. 8;
   end record;

   -----------------
   -- HSTPIP.PRST --
   -----------------

   --  HSTPIP_PRST array element
   subtype HSTPIP_PRST_Element is ATSAM3X8E.Bit;

   --  HSTPIP_PRST array
   type HSTPIP_PRST_Field_Array is array (0 .. 8) of HSTPIP_PRST_Element
     with Component_Size => 1, Size => 9;

   --  Type definition for HSTPIP_PRST
   type HSTPIP_PRST_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PRST as a value
            Val : ATSAM3X8E.UInt9;
         when True =>
            --  PRST as an array
            Arr : HSTPIP_PRST_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 9;

   for HSTPIP_PRST_Field use record
      Val at 0 range 0 .. 8;
      Arr at 0 range 0 .. 8;
   end record;

   --  Host Pipe Register
   type HSTPIP_Register is record
      --  Pipe 0 Enable
      PEN            : HSTPIP_PEN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_9_15  : ATSAM3X8E.UInt7 := 16#0#;
      --  Pipe 0 Reset
      PRST           : HSTPIP_PRST_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIP_Register use record
      PEN            at 0 range 0 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      PRST           at 0 range 16 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ----------------------
   -- HSTFNUM_Register --
   ----------------------

   subtype HSTFNUM_MFNUM_Field is ATSAM3X8E.UInt3;
   subtype HSTFNUM_FNUM_Field is ATSAM3X8E.UInt11;
   subtype HSTFNUM_FLENHIGH_Field is ATSAM3X8E.Byte;

   --  Host Frame Number Register
   type HSTFNUM_Register is record
      --  Micro Frame Number
      MFNUM          : HSTFNUM_MFNUM_Field := 16#0#;
      --  Frame Number
      FNUM           : HSTFNUM_FNUM_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Frame Length
      FLENHIGH       : HSTFNUM_FLENHIGH_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTFNUM_Register use record
      MFNUM          at 0 range 0 .. 2;
      FNUM           at 0 range 3 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      FLENHIGH       at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------
   -- HSTADDR_Register --
   ----------------------

   subtype HSTADDR1_HSTADDRP0_Field is ATSAM3X8E.UInt7;
   subtype HSTADDR1_HSTADDRP1_Field is ATSAM3X8E.UInt7;
   subtype HSTADDR1_HSTADDRP2_Field is ATSAM3X8E.UInt7;
   subtype HSTADDR1_HSTADDRP3_Field is ATSAM3X8E.UInt7;

   --  Host Address 1 Register
   type HSTADDR_Register is record
      --  USB Host Address
      HSTADDRP0      : HSTADDR1_HSTADDRP0_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  USB Host Address
      HSTADDRP1      : HSTADDR1_HSTADDRP1_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit := 16#0#;
      --  USB Host Address
      HSTADDRP2      : HSTADDR1_HSTADDRP2_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  USB Host Address
      HSTADDRP3      : HSTADDR1_HSTADDRP3_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTADDR_Register use record
      HSTADDRP0      at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      HSTADDRP1      at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HSTADDRP2      at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      HSTADDRP3      at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   -----------------------
   -- HSTADDR3_Register --
   -----------------------

   subtype HSTADDR3_HSTADDRP8_Field is ATSAM3X8E.UInt7;
   subtype HSTADDR3_HSTADDRP9_Field is ATSAM3X8E.UInt7;

   --  Host Address 3 Register
   type HSTADDR3_Register is record
      --  USB Host Address
      HSTADDRP8      : HSTADDR3_HSTADDRP8_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  USB Host Address
      HSTADDRP9      : HSTADDR3_HSTADDRP9_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTADDR3_Register use record
      HSTADDRP8      at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      HSTADDRP9      at 0 range 8 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   ------------------------
   -- HSTPIPCFG_Register --
   ------------------------

   subtype HSTPIPCFG_ALLOC_Field is ATSAM3X8E.Bit;

   --  Pipe Banks
   type PBK_Field is
     (
      --  Single-bank pipe
      PBK_Field_1_Bank,
      --  Double-bank pipe
      PBK_Field_2_Bank,
      --  Triple-bank pipe
      PBK_Field_3_Bank)
     with Size => 2;
   for PBK_Field use
     (PBK_Field_1_Bank => 0,
      PBK_Field_2_Bank => 1,
      PBK_Field_3_Bank => 2);

   --  Pipe Size
   type PSIZE_Field is
     (
      --  8 bytes
      PSIZE_Field_8_Byte,
      --  16 bytes
      PSIZE_Field_16_Byte,
      --  32 bytes
      PSIZE_Field_32_Byte,
      --  64 bytes
      PSIZE_Field_64_Byte,
      --  128 bytes
      PSIZE_Field_128_Byte,
      --  256 bytes
      PSIZE_Field_256_Byte,
      --  512 bytes
      PSIZE_Field_512_Byte,
      --  1024 bytes
      PSIZE_Field_1024_Byte)
     with Size => 3;
   for PSIZE_Field use
     (PSIZE_Field_8_Byte => 0,
      PSIZE_Field_16_Byte => 1,
      PSIZE_Field_32_Byte => 2,
      PSIZE_Field_64_Byte => 3,
      PSIZE_Field_128_Byte => 4,
      PSIZE_Field_256_Byte => 5,
      PSIZE_Field_512_Byte => 6,
      PSIZE_Field_1024_Byte => 7);

   --  Pipe Token
   type PTOKEN_Field is
     (
      --  SETUP
      Setup,
      --  IN
      In_k,
      --  OUT
      Out_k)
     with Size => 2;
   for PTOKEN_Field use
     (Setup => 0,
      In_k => 1,
      Out_k => 2);

   subtype HSTPIPCFG_AUTOSW_Field is ATSAM3X8E.Bit;

   --  Pipe Type
   type PTYPE_Field is
     (
      --  Control
      Ctrl,
      --  Isochronous
      Iso,
      --  Bulk
      Blk,
      --  Interrupt
      Intrpt)
     with Size => 2;
   for PTYPE_Field use
     (Ctrl => 0,
      Iso => 1,
      Blk => 2,
      Intrpt => 3);

   subtype HSTPIPCFG_PEPNUM_Field is ATSAM3X8E.UInt4;
   subtype HSTPIPCFG_INTFRQ_Field is ATSAM3X8E.Byte;

   --  Host Pipe Configuration Register (n = 0)
   type HSTPIPCFG_Register is record
      --  unspecified
      Reserved_0_0   : ATSAM3X8E.Bit := 16#0#;
      --  Pipe Memory Allocate
      ALLOC          : HSTPIPCFG_ALLOC_Field := 16#0#;
      --  Pipe Banks
      PBK            : PBK_Field := PBK_Field_1_Bank;
      --  Pipe Size
      PSIZE          : PSIZE_Field := PSIZE_Field_8_Byte;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Pipe Token
      PTOKEN         : PTOKEN_Field := Setup;
      --  Automatic Switch
      AUTOSW         : HSTPIPCFG_AUTOSW_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Pipe Type
      PTYPE          : PTYPE_Field := Ctrl;
      --  unspecified
      Reserved_14_15 : ATSAM3X8E.UInt2 := 16#0#;
      --  Pipe Endpoint Number
      PEPNUM         : HSTPIPCFG_PEPNUM_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Pipe Interrupt Request Frequency
      INTFRQ         : HSTPIPCFG_INTFRQ_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPCFG_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ALLOC          at 0 range 1 .. 1;
      PBK            at 0 range 2 .. 3;
      PSIZE          at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PTOKEN         at 0 range 8 .. 9;
      AUTOSW         at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      PTYPE          at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      PEPNUM         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      INTFRQ         at 0 range 24 .. 31;
   end record;

   --  Host Pipe Configuration Register (n = 0)
   type HSTPIPCFG_Registers is array (0 .. 9) of HSTPIPCFG_Register;

   ------------------------
   -- HSTPIPISR_Register --
   ------------------------

   subtype HSTPIPISR_RXINI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_TXOUTI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_TXSTPI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_PERRI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_NAKEDI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_OVERFI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_RXSTALLDI_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_SHORTPACKETI_Field is ATSAM3X8E.Bit;

   --  Data Toggle Sequence
   type DTSEQ_Field_1 is
     (
      --  Data0 toggle sequence
      Data0,
      --  Data1 toggle sequence
      Data1)
     with Size => 2;
   for DTSEQ_Field_1 use
     (Data0 => 0,
      Data1 => 1);

   subtype HSTPIPISR_RWALL_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_CFGOK_Field is ATSAM3X8E.Bit;
   subtype HSTPIPISR_PBYCT_Field is ATSAM3X8E.UInt11;

   --  Host Pipe Status Register (n = 0)
   type HSTPIPISR_Register is record
      --  Read-only. Received IN Data Interrupt
      RXINI          : HSTPIPISR_RXINI_Field := 16#0#;
      --  Read-only. Transmitted OUT Data Interrupt
      TXOUTI         : HSTPIPISR_TXOUTI_Field := 16#0#;
      --  Read-only. Transmitted SETUP Interrupt
      TXSTPI         : HSTPIPISR_TXSTPI_Field := 16#0#;
      --  Read-only. Pipe Error Interrupt
      PERRI          : HSTPIPISR_PERRI_Field := 16#0#;
      --  Read-only. NAKed Interrupt
      NAKEDI         : HSTPIPISR_NAKEDI_Field := 16#0#;
      --  Read-only. Overflow Interrupt
      OVERFI         : HSTPIPISR_OVERFI_Field := 16#0#;
      --  Read-only. Received STALLed Interrupt
      RXSTALLDI      : HSTPIPISR_RXSTALLDI_Field := 16#0#;
      --  Read-only. Short Packet Interrupt
      SHORTPACKETI   : HSTPIPISR_SHORTPACKETI_Field := 16#0#;
      --  Read-only. Data Toggle Sequence
      DTSEQ          : DTSEQ_Field_1 := Data0;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2;
      --  Read-only. Number of Busy Banks
      NBUSYBK        : NBUSYBK_Field := NBUSYBK_Field_0_Busy;
      --  Read-only. Current Bank
      CURRBK         : CURRBK_Field := Bank0;
      --  Read-only. Read-write Allowed
      RWALL          : HSTPIPISR_RWALL_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : ATSAM3X8E.Bit;
      --  Read-only. Configuration OK Status
      CFGOK          : HSTPIPISR_CFGOK_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : ATSAM3X8E.Bit;
      --  Read-only. Pipe Byte Count
      PBYCT          : HSTPIPISR_PBYCT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPISR_Register use record
      RXINI          at 0 range 0 .. 0;
      TXOUTI         at 0 range 1 .. 1;
      TXSTPI         at 0 range 2 .. 2;
      PERRI          at 0 range 3 .. 3;
      NAKEDI         at 0 range 4 .. 4;
      OVERFI         at 0 range 5 .. 5;
      RXSTALLDI      at 0 range 6 .. 6;
      SHORTPACKETI   at 0 range 7 .. 7;
      DTSEQ          at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      NBUSYBK        at 0 range 12 .. 13;
      CURRBK         at 0 range 14 .. 15;
      RWALL          at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      CFGOK          at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      PBYCT          at 0 range 20 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Host Pipe Status Register (n = 0)
   type HSTPIPISR_Registers is array (0 .. 9) of HSTPIPISR_Register;

   ------------------------
   -- HSTPIPICR_Register --
   ------------------------

   subtype HSTPIPICR_RXINIC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPICR_TXOUTIC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPICR_TXSTPIC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPICR_NAKEDIC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPICR_OVERFIC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPICR_RXSTALLDIC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPICR_SHORTPACKETIC_Field is ATSAM3X8E.Bit;

   --  Host Pipe Clear Register (n = 0)
   type HSTPIPICR_Register is record
      --  Write-only. Received IN Data Interrupt Clear
      RXINIC        : HSTPIPICR_RXINIC_Field := 16#0#;
      --  Write-only. Transmitted OUT Data Interrupt Clear
      TXOUTIC       : HSTPIPICR_TXOUTIC_Field := 16#0#;
      --  Write-only. Transmitted SETUP Interrupt Clear
      TXSTPIC       : HSTPIPICR_TXSTPIC_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. NAKed Interrupt Clear
      NAKEDIC       : HSTPIPICR_NAKEDIC_Field := 16#0#;
      --  Write-only. Overflow Interrupt Clear
      OVERFIC       : HSTPIPICR_OVERFIC_Field := 16#0#;
      --  Write-only. Received STALLed Interrupt Clear
      RXSTALLDIC    : HSTPIPICR_RXSTALLDIC_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Clear
      SHORTPACKETIC : HSTPIPICR_SHORTPACKETIC_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPICR_Register use record
      RXINIC        at 0 range 0 .. 0;
      TXOUTIC       at 0 range 1 .. 1;
      TXSTPIC       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      NAKEDIC       at 0 range 4 .. 4;
      OVERFIC       at 0 range 5 .. 5;
      RXSTALLDIC    at 0 range 6 .. 6;
      SHORTPACKETIC at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Host Pipe Clear Register (n = 0)
   type HSTPIPICR_Registers is array (0 .. 9) of HSTPIPICR_Register;

   ------------------------
   -- HSTPIPIFR_Register --
   ------------------------

   subtype HSTPIPIFR_RXINIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_TXOUTIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_TXSTPIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_PERRIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_NAKEDIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_OVERFIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_RXSTALLDIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_SHORTPACKETIS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIFR_NBUSYBKS_Field is ATSAM3X8E.Bit;

   --  Host Pipe Set Register (n = 0)
   type HSTPIPIFR_Register is record
      --  Write-only. Received IN Data Interrupt Set
      RXINIS         : HSTPIPIFR_RXINIS_Field := 16#0#;
      --  Write-only. Transmitted OUT Data Interrupt Set
      TXOUTIS        : HSTPIPIFR_TXOUTIS_Field := 16#0#;
      --  Write-only. Transmitted SETUP Interrupt Set
      TXSTPIS        : HSTPIPIFR_TXSTPIS_Field := 16#0#;
      --  Write-only. Pipe Error Interrupt Set
      PERRIS         : HSTPIPIFR_PERRIS_Field := 16#0#;
      --  Write-only. NAKed Interrupt Set
      NAKEDIS        : HSTPIPIFR_NAKEDIS_Field := 16#0#;
      --  Write-only. Overflow Interrupt Set
      OVERFIS        : HSTPIPIFR_OVERFIS_Field := 16#0#;
      --  Write-only. Received STALLed Interrupt Set
      RXSTALLDIS     : HSTPIPIFR_RXSTALLDIS_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Set
      SHORTPACKETIS  : HSTPIPIFR_SHORTPACKETIS_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Number of Busy Banks Set
      NBUSYBKS       : HSTPIPIFR_NBUSYBKS_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPIFR_Register use record
      RXINIS         at 0 range 0 .. 0;
      TXOUTIS        at 0 range 1 .. 1;
      TXSTPIS        at 0 range 2 .. 2;
      PERRIS         at 0 range 3 .. 3;
      NAKEDIS        at 0 range 4 .. 4;
      OVERFIS        at 0 range 5 .. 5;
      RXSTALLDIS     at 0 range 6 .. 6;
      SHORTPACKETIS  at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKS       at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  Host Pipe Set Register (n = 0)
   type HSTPIPIFR_Registers is array (0 .. 9) of HSTPIPIFR_Register;

   ------------------------
   -- HSTPIPIMR_Register --
   ------------------------

   subtype HSTPIPIMR_RXINE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_TXOUTE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_TXSTPE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_PERRE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_NAKEDE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_OVERFIE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_RXSTALLDE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_SHORTPACKETIE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_NBUSYBKE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_FIFOCON_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_PDISHDMA_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_PFREEZE_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIMR_RSTDT_Field is ATSAM3X8E.Bit;

   --  Host Pipe Mask Register (n = 0)
   type HSTPIPIMR_Register is record
      --  Read-only. Received IN Data Interrupt Enable
      RXINE          : HSTPIPIMR_RXINE_Field := 16#0#;
      --  Read-only. Transmitted OUT Data Interrupt Enable
      TXOUTE         : HSTPIPIMR_TXOUTE_Field := 16#0#;
      --  Read-only. Transmitted SETUP Interrupt Enable
      TXSTPE         : HSTPIPIMR_TXSTPE_Field := 16#0#;
      --  Read-only. Pipe Error Interrupt Enable
      PERRE          : HSTPIPIMR_PERRE_Field := 16#0#;
      --  Read-only. NAKed Interrupt Enable
      NAKEDE         : HSTPIPIMR_NAKEDE_Field := 16#0#;
      --  Read-only. Overflow Interrupt Enable
      OVERFIE        : HSTPIPIMR_OVERFIE_Field := 16#0#;
      --  Read-only. Received STALLed Interrupt Enable
      RXSTALLDE      : HSTPIPIMR_RXSTALLDE_Field := 16#0#;
      --  Read-only. Short Packet Interrupt Enable
      SHORTPACKETIE  : HSTPIPIMR_SHORTPACKETIE_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4;
      --  Read-only. Number of Busy Banks Interrupt Enable
      NBUSYBKE       : HSTPIPIMR_NBUSYBKE_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : ATSAM3X8E.Bit;
      --  Read-only. FIFO Control
      FIFOCON        : HSTPIPIMR_FIFOCON_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit;
      --  Read-only. Pipe Interrupts Disable HDMA Request Enable
      PDISHDMA       : HSTPIPIMR_PDISHDMA_Field := 16#0#;
      --  Read-only. Pipe Freeze
      PFREEZE        : HSTPIPIMR_PFREEZE_Field := 16#0#;
      --  Read-only. Reset Data Toggle
      RSTDT          : HSTPIPIMR_RSTDT_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPIMR_Register use record
      RXINE          at 0 range 0 .. 0;
      TXOUTE         at 0 range 1 .. 1;
      TXSTPE         at 0 range 2 .. 2;
      PERRE          at 0 range 3 .. 3;
      NAKEDE         at 0 range 4 .. 4;
      OVERFIE        at 0 range 5 .. 5;
      RXSTALLDE      at 0 range 6 .. 6;
      SHORTPACKETIE  at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKE       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      FIFOCON        at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PDISHDMA       at 0 range 16 .. 16;
      PFREEZE        at 0 range 17 .. 17;
      RSTDT          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Host Pipe Mask Register (n = 0)
   type HSTPIPIMR_Registers is array (0 .. 9) of HSTPIPIMR_Register;

   ------------------------
   -- HSTPIPIER_Register --
   ------------------------

   subtype HSTPIPIER_RXINES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_TXOUTES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_TXSTPES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_PERRES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_NAKEDES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_OVERFIES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_RXSTALLDES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_SHORTPACKETIES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_NBUSYBKES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_PDISHDMAS_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_PFREEZES_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIER_RSTDTS_Field is ATSAM3X8E.Bit;

   --  Host Pipe Enable Register (n = 0)
   type HSTPIPIER_Register is record
      --  Write-only. Received IN Data Interrupt Enable
      RXINES         : HSTPIPIER_RXINES_Field := 16#0#;
      --  Write-only. Transmitted OUT Data Interrupt Enable
      TXOUTES        : HSTPIPIER_TXOUTES_Field := 16#0#;
      --  Write-only. Transmitted SETUP Interrupt Enable
      TXSTPES        : HSTPIPIER_TXSTPES_Field := 16#0#;
      --  Write-only. Pipe Error Interrupt Enable
      PERRES         : HSTPIPIER_PERRES_Field := 16#0#;
      --  Write-only. NAKed Interrupt Enable
      NAKEDES        : HSTPIPIER_NAKEDES_Field := 16#0#;
      --  Write-only. Overflow Interrupt Enable
      OVERFIES       : HSTPIPIER_OVERFIES_Field := 16#0#;
      --  Write-only. Received STALLed Interrupt Enable
      RXSTALLDES     : HSTPIPIER_RXSTALLDES_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Enable
      SHORTPACKETIES : HSTPIPIER_SHORTPACKETIES_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Number of Busy Banks Enable
      NBUSYBKES      : HSTPIPIER_NBUSYBKES_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Pipe Interrupts Disable HDMA Request Enable
      PDISHDMAS      : HSTPIPIER_PDISHDMAS_Field := 16#0#;
      --  Write-only. Pipe Freeze Enable
      PFREEZES       : HSTPIPIER_PFREEZES_Field := 16#0#;
      --  Write-only. Reset Data Toggle Enable
      RSTDTS         : HSTPIPIER_RSTDTS_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPIER_Register use record
      RXINES         at 0 range 0 .. 0;
      TXOUTES        at 0 range 1 .. 1;
      TXSTPES        at 0 range 2 .. 2;
      PERRES         at 0 range 3 .. 3;
      NAKEDES        at 0 range 4 .. 4;
      OVERFIES       at 0 range 5 .. 5;
      RXSTALLDES     at 0 range 6 .. 6;
      SHORTPACKETIES at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKES      at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      PDISHDMAS      at 0 range 16 .. 16;
      PFREEZES       at 0 range 17 .. 17;
      RSTDTS         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Host Pipe Enable Register (n = 0)
   type HSTPIPIER_Registers is array (0 .. 9) of HSTPIPIER_Register;

   ------------------------
   -- HSTPIPIDR_Register --
   ------------------------

   subtype HSTPIPIDR_RXINEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_TXOUTEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_TXSTPEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_PERREC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_NAKEDEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_OVERFIEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_RXSTALLDEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_SHORTPACKETIEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_NBUSYBKEC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_FIFOCONC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_PDISHDMAC_Field is ATSAM3X8E.Bit;
   subtype HSTPIPIDR_PFREEZEC_Field is ATSAM3X8E.Bit;

   --  Host Pipe Disable Register (n = 0)
   type HSTPIPIDR_Register is record
      --  Write-only. Received IN Data Interrupt Disable
      RXINEC         : HSTPIPIDR_RXINEC_Field := 16#0#;
      --  Write-only. Transmitted OUT Data Interrupt Disable
      TXOUTEC        : HSTPIPIDR_TXOUTEC_Field := 16#0#;
      --  Write-only. Transmitted SETUP Interrupt Disable
      TXSTPEC        : HSTPIPIDR_TXSTPEC_Field := 16#0#;
      --  Write-only. Pipe Error Interrupt Disable
      PERREC         : HSTPIPIDR_PERREC_Field := 16#0#;
      --  Write-only. NAKed Interrupt Disable
      NAKEDEC        : HSTPIPIDR_NAKEDEC_Field := 16#0#;
      --  Write-only. Overflow Interrupt Disable
      OVERFIEC       : HSTPIPIDR_OVERFIEC_Field := 16#0#;
      --  Write-only. Received STALLed Interrupt Disable
      RXSTALLDEC     : HSTPIPIDR_RXSTALLDEC_Field := 16#0#;
      --  Write-only. Short Packet Interrupt Disable
      SHORTPACKETIEC : HSTPIPIDR_SHORTPACKETIEC_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Number of Busy Banks Disable
      NBUSYBKEC      : HSTPIPIDR_NBUSYBKEC_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. FIFO Control Disable
      FIFOCONC       : HSTPIPIDR_FIFOCONC_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Pipe Interrupts Disable HDMA Request Disable
      PDISHDMAC      : HSTPIPIDR_PDISHDMAC_Field := 16#0#;
      --  Write-only. Pipe Freeze Disable
      PFREEZEC       : HSTPIPIDR_PFREEZEC_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : ATSAM3X8E.UInt14 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPIDR_Register use record
      RXINEC         at 0 range 0 .. 0;
      TXOUTEC        at 0 range 1 .. 1;
      TXSTPEC        at 0 range 2 .. 2;
      PERREC         at 0 range 3 .. 3;
      NAKEDEC        at 0 range 4 .. 4;
      OVERFIEC       at 0 range 5 .. 5;
      RXSTALLDEC     at 0 range 6 .. 6;
      SHORTPACKETIEC at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      NBUSYBKEC      at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      FIFOCONC       at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PDISHDMAC      at 0 range 16 .. 16;
      PFREEZEC       at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Host Pipe Disable Register (n = 0)
   type HSTPIPIDR_Registers is array (0 .. 9) of HSTPIPIDR_Register;

   -------------------------
   -- HSTPIPINRQ_Register --
   -------------------------

   subtype HSTPIPINRQ_INRQ_Field is ATSAM3X8E.Byte;
   subtype HSTPIPINRQ_INMODE_Field is ATSAM3X8E.Bit;

   --  Host Pipe IN Request Register (n = 0)
   type HSTPIPINRQ_Register is record
      --  IN Request Number before Freeze
      INRQ          : HSTPIPINRQ_INRQ_Field := 16#0#;
      --  IN Request Mode
      INMODE        : HSTPIPINRQ_INMODE_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPINRQ_Register use record
      INRQ          at 0 range 0 .. 7;
      INMODE        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Host Pipe IN Request Register (n = 0)
   type HSTPIPINRQ_Registers is array (0 .. 9) of HSTPIPINRQ_Register;

   ------------------------
   -- HSTPIPERR_Register --
   ------------------------

   subtype HSTPIPERR_DATATGL_Field is ATSAM3X8E.Bit;
   subtype HSTPIPERR_DATAPID_Field is ATSAM3X8E.Bit;
   subtype HSTPIPERR_PID_Field is ATSAM3X8E.Bit;
   subtype HSTPIPERR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype HSTPIPERR_CRC16_Field is ATSAM3X8E.Bit;
   subtype HSTPIPERR_COUNTER_Field is ATSAM3X8E.UInt2;

   --  Host Pipe Error Register (n = 0)
   type HSTPIPERR_Register is record
      --  Data Toggle Error
      DATATGL       : HSTPIPERR_DATATGL_Field := 16#0#;
      --  Data PID Error
      DATAPID       : HSTPIPERR_DATAPID_Field := 16#0#;
      --  PID Error
      PID           : HSTPIPERR_PID_Field := 16#0#;
      --  Time-Out Error
      TIMEOUT       : HSTPIPERR_TIMEOUT_Field := 16#0#;
      --  CRC16 Error
      CRC16         : HSTPIPERR_CRC16_Field := 16#0#;
      --  Error Counter
      COUNTER       : HSTPIPERR_COUNTER_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : ATSAM3X8E.UInt25 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTPIPERR_Register use record
      DATATGL       at 0 range 0 .. 0;
      DATAPID       at 0 range 1 .. 1;
      PID           at 0 range 2 .. 2;
      TIMEOUT       at 0 range 3 .. 3;
      CRC16         at 0 range 4 .. 4;
      COUNTER       at 0 range 5 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Host Pipe Error Register (n = 0)
   type HSTPIPERR_Registers is array (0 .. 9) of HSTPIPERR_Register;

   ----------------------------
   -- HSTDMACONTROL_Register --
   ----------------------------

   subtype HSTDMACONTROL1_CHANN_ENB_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_LDNXT_DSC_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_END_TR_EN_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_END_B_EN_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_END_TR_IT_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_END_BUFFIT_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_DESC_LD_IT_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_BURST_LCK_Field is ATSAM3X8E.Bit;
   subtype HSTDMACONTROL1_BUFF_LENGTH_Field is ATSAM3X8E.Short;

   --  Host DMA Channel Control Register (n = 1)
   type HSTDMACONTROL_Register is record
      --  Channel Enable Command
      CHANN_ENB     : HSTDMACONTROL1_CHANN_ENB_Field := 16#0#;
      --  Load Next Channel Transfer Descriptor Enable Command
      LDNXT_DSC     : HSTDMACONTROL1_LDNXT_DSC_Field := 16#0#;
      --  End of Transfer Enable (Control)
      END_TR_EN     : HSTDMACONTROL1_END_TR_EN_Field := 16#0#;
      --  End of Buffer Enable Control
      END_B_EN      : HSTDMACONTROL1_END_B_EN_Field := 16#0#;
      --  End of Transfer Interrupt Enable
      END_TR_IT     : HSTDMACONTROL1_END_TR_IT_Field := 16#0#;
      --  End of Buffer Interrupt Enable
      END_BUFFIT    : HSTDMACONTROL1_END_BUFFIT_Field := 16#0#;
      --  Descriptor Loaded Interrupt Enable
      DESC_LD_IT    : HSTDMACONTROL1_DESC_LD_IT_Field := 16#0#;
      --  Burst Lock Enable
      BURST_LCK     : HSTDMACONTROL1_BURST_LCK_Field := 16#0#;
      --  unspecified
      Reserved_8_15 : ATSAM3X8E.Byte := 16#0#;
      --  Buffer Byte Length (Write-only)
      BUFF_LENGTH   : HSTDMACONTROL1_BUFF_LENGTH_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTDMACONTROL_Register use record
      CHANN_ENB     at 0 range 0 .. 0;
      LDNXT_DSC     at 0 range 1 .. 1;
      END_TR_EN     at 0 range 2 .. 2;
      END_B_EN      at 0 range 3 .. 3;
      END_TR_IT     at 0 range 4 .. 4;
      END_BUFFIT    at 0 range 5 .. 5;
      DESC_LD_IT    at 0 range 6 .. 6;
      BURST_LCK     at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
      BUFF_LENGTH   at 0 range 16 .. 31;
   end record;

   ---------------------------
   -- HSTDMASTATUS_Register --
   ---------------------------

   subtype HSTDMASTATUS1_CHANN_ENB_Field is ATSAM3X8E.Bit;
   subtype HSTDMASTATUS1_CHANN_ACT_Field is ATSAM3X8E.Bit;
   subtype HSTDMASTATUS1_END_TR_ST_Field is ATSAM3X8E.Bit;
   subtype HSTDMASTATUS1_END_BF_ST_Field is ATSAM3X8E.Bit;
   subtype HSTDMASTATUS1_DESC_LDST_Field is ATSAM3X8E.Bit;
   subtype HSTDMASTATUS1_BUFF_COUNT_Field is ATSAM3X8E.Short;

   --  Host DMA Channel Status Register (n = 1)
   type HSTDMASTATUS_Register is record
      --  Channel Enable Status
      CHANN_ENB     : HSTDMASTATUS1_CHANN_ENB_Field := 16#0#;
      --  Channel Active Status
      CHANN_ACT     : HSTDMASTATUS1_CHANN_ACT_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : ATSAM3X8E.UInt2 := 16#0#;
      --  End of Channel Transfer Status
      END_TR_ST     : HSTDMASTATUS1_END_TR_ST_Field := 16#0#;
      --  End of Channel Buffer Status
      END_BF_ST     : HSTDMASTATUS1_END_BF_ST_Field := 16#0#;
      --  Descriptor Loaded Status
      DESC_LDST     : HSTDMASTATUS1_DESC_LDST_Field := 16#0#;
      --  unspecified
      Reserved_7_15 : ATSAM3X8E.UInt9 := 16#0#;
      --  Buffer Byte Count
      BUFF_COUNT    : HSTDMASTATUS1_BUFF_COUNT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for HSTDMASTATUS_Register use record
      CHANN_ENB     at 0 range 0 .. 0;
      CHANN_ACT     at 0 range 1 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      END_TR_ST     at 0 range 4 .. 4;
      END_BF_ST     at 0 range 5 .. 5;
      DESC_LDST     at 0 range 6 .. 6;
      Reserved_7_15 at 0 range 7 .. 15;
      BUFF_COUNT    at 0 range 16 .. 31;
   end record;

   -------------------
   -- CTRL_Register --
   -------------------

   subtype CTRL_IDTE_Field is ATSAM3X8E.Bit;
   subtype CTRL_VBUSTE_Field is ATSAM3X8E.Bit;
   subtype CTRL_SRPE_Field is ATSAM3X8E.Bit;
   subtype CTRL_VBERRE_Field is ATSAM3X8E.Bit;
   subtype CTRL_BCERRE_Field is ATSAM3X8E.Bit;
   subtype CTRL_ROLEEXE_Field is ATSAM3X8E.Bit;
   subtype CTRL_HNPERRE_Field is ATSAM3X8E.Bit;
   subtype CTRL_STOE_Field is ATSAM3X8E.Bit;
   subtype CTRL_VBUSHWC_Field is ATSAM3X8E.Bit;
   subtype CTRL_SRPSEL_Field is ATSAM3X8E.Bit;
   subtype CTRL_SRPREQ_Field is ATSAM3X8E.Bit;
   subtype CTRL_HNPREQ_Field is ATSAM3X8E.Bit;
   subtype CTRL_OTGPADE_Field is ATSAM3X8E.Bit;
   subtype CTRL_VBUSPO_Field is ATSAM3X8E.Bit;
   subtype CTRL_FRZCLK_Field is ATSAM3X8E.Bit;
   subtype CTRL_USBE_Field is ATSAM3X8E.Bit;
   subtype CTRL_TIMVALUE_Field is ATSAM3X8E.UInt2;
   subtype CTRL_TIMPAGE_Field is ATSAM3X8E.UInt2;
   subtype CTRL_UNLOCK_Field is ATSAM3X8E.Bit;

   --  UOTGID Pin Enable
   type UIDE_Field is
     (
      --  The USB mode (device/host) is selected from the UIMOD bit.
      Uimod,
      --  The USB mode (device/host) is selected from the UOTGID input pin.
      Uotgid)
     with Size => 1;
   for UIDE_Field use
     (Uimod => 0,
      Uotgid => 1);

   --  UOTGHS Mode
   type UIMOD_Field is
     (
      --  The module is in USB host mode.
      Host,
      --  The module is in USB device mode.
      Device)
     with Size => 1;
   for UIMOD_Field use
     (Host => 0,
      Device => 1);

   --  General Control Register
   type CTRL_Register is record
      --  ID Transition Interrupt Enable
      IDTE           : CTRL_IDTE_Field := 16#0#;
      --  VBus Transition Interrupt Enable
      VBUSTE         : CTRL_VBUSTE_Field := 16#0#;
      --  SRP Interrupt Enable
      SRPE           : CTRL_SRPE_Field := 16#0#;
      --  VBus Error Interrupt Enable
      VBERRE         : CTRL_VBERRE_Field := 16#0#;
      --  B-Connection Error Interrupt Enable
      BCERRE         : CTRL_BCERRE_Field := 16#0#;
      --  Role Exchange Interrupt Enable
      ROLEEXE        : CTRL_ROLEEXE_Field := 16#0#;
      --  HNP Error Interrupt Enable
      HNPERRE        : CTRL_HNPERRE_Field := 16#0#;
      --  Suspend Time-Out Interrupt Enable
      STOE           : CTRL_STOE_Field := 16#0#;
      --  VBus Hardware Control
      VBUSHWC        : CTRL_VBUSHWC_Field := 16#0#;
      --  SRP Selection
      SRPSEL         : CTRL_SRPSEL_Field := 16#0#;
      --  SRP Request
      SRPREQ         : CTRL_SRPREQ_Field := 16#0#;
      --  HNP Request
      HNPREQ         : CTRL_HNPREQ_Field := 16#0#;
      --  OTG Pad Enable
      OTGPADE        : CTRL_OTGPADE_Field := 16#0#;
      --  VBus Polarity Off
      VBUSPO         : CTRL_VBUSPO_Field := 16#0#;
      --  Freeze USB Clock
      FRZCLK         : CTRL_FRZCLK_Field := 16#1#;
      --  UOTGHS Enable
      USBE           : CTRL_USBE_Field := 16#0#;
      --  Timer Value
      TIMVALUE       : CTRL_TIMVALUE_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : ATSAM3X8E.UInt2 := 16#0#;
      --  Timer Page
      TIMPAGE        : CTRL_TIMPAGE_Field := 16#0#;
      --  Timer Access Unlock
      UNLOCK         : CTRL_UNLOCK_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : ATSAM3X8E.Bit := 16#0#;
      --  UOTGID Pin Enable
      UIDE           : UIDE_Field := Uotgid;
      --  UOTGHS Mode
      UIMOD          : UIMOD_Field := Device;
      --  unspecified
      Reserved_26_31 : ATSAM3X8E.UInt6 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      IDTE           at 0 range 0 .. 0;
      VBUSTE         at 0 range 1 .. 1;
      SRPE           at 0 range 2 .. 2;
      VBERRE         at 0 range 3 .. 3;
      BCERRE         at 0 range 4 .. 4;
      ROLEEXE        at 0 range 5 .. 5;
      HNPERRE        at 0 range 6 .. 6;
      STOE           at 0 range 7 .. 7;
      VBUSHWC        at 0 range 8 .. 8;
      SRPSEL         at 0 range 9 .. 9;
      SRPREQ         at 0 range 10 .. 10;
      HNPREQ         at 0 range 11 .. 11;
      OTGPADE        at 0 range 12 .. 12;
      VBUSPO         at 0 range 13 .. 13;
      FRZCLK         at 0 range 14 .. 14;
      USBE           at 0 range 15 .. 15;
      TIMVALUE       at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      TIMPAGE        at 0 range 20 .. 21;
      UNLOCK         at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      UIDE           at 0 range 24 .. 24;
      UIMOD          at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_IDTI_Field is ATSAM3X8E.Bit;
   subtype SR_VBUSTI_Field is ATSAM3X8E.Bit;
   subtype SR_SRPI_Field is ATSAM3X8E.Bit;
   subtype SR_VBERRI_Field is ATSAM3X8E.Bit;
   subtype SR_BCERRI_Field is ATSAM3X8E.Bit;
   subtype SR_ROLEEXI_Field is ATSAM3X8E.Bit;
   subtype SR_HNPERRI_Field is ATSAM3X8E.Bit;
   subtype SR_STOI_Field is ATSAM3X8E.Bit;
   subtype SR_VBUSRQ_Field is ATSAM3X8E.Bit;
   subtype SR_ID_Field is ATSAM3X8E.Bit;
   subtype SR_VBUS_Field is ATSAM3X8E.Bit;

   --  Speed Status
   type SPEED_Field is
     (
      --  Full-Speed mode
      Full_Speed,
      --  High-Speed mode
      High_Speed,
      --  Low-Speed mode
      Low_Speed)
     with Size => 2;
   for SPEED_Field use
     (Full_Speed => 0,
      High_Speed => 1,
      Low_Speed => 2);

   subtype SR_CLKUSABLE_Field is ATSAM3X8E.Bit;

   --  General Status Register
   type SR_Register is record
      --  Read-only. ID Transition Interrupt
      IDTI           : SR_IDTI_Field := 16#0#;
      --  Read-only. VBus Transition Interrupt
      VBUSTI         : SR_VBUSTI_Field := 16#0#;
      --  Read-only. SRP Interrupt
      SRPI           : SR_SRPI_Field := 16#0#;
      --  Read-only. VBus Error Interrupt
      VBERRI         : SR_VBERRI_Field := 16#0#;
      --  Read-only. B-Connection Error Interrupt
      BCERRI         : SR_BCERRI_Field := 16#0#;
      --  Read-only. Role Exchange Interrupt
      ROLEEXI        : SR_ROLEEXI_Field := 16#0#;
      --  Read-only. HNP Error Interrupt
      HNPERRI        : SR_HNPERRI_Field := 16#0#;
      --  Read-only. Suspend Time-Out Interrupt
      STOI           : SR_STOI_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit;
      --  Read-only. VBus Request
      VBUSRQ         : SR_VBUSRQ_Field := 16#0#;
      --  Read-only. UOTGID Pin State
      ID             : SR_ID_Field := 16#1#;
      --  Read-only. VBus Level
      VBUS           : SR_VBUS_Field := 16#0#;
      --  Read-only. Speed Status
      SPEED          : SPEED_Field := Full_Speed;
      --  Read-only. UTMI Clock Usable
      CLKUSABLE      : SR_CLKUSABLE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      IDTI           at 0 range 0 .. 0;
      VBUSTI         at 0 range 1 .. 1;
      SRPI           at 0 range 2 .. 2;
      VBERRI         at 0 range 3 .. 3;
      BCERRI         at 0 range 4 .. 4;
      ROLEEXI        at 0 range 5 .. 5;
      HNPERRI        at 0 range 6 .. 6;
      STOI           at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      VBUSRQ         at 0 range 9 .. 9;
      ID             at 0 range 10 .. 10;
      VBUS           at 0 range 11 .. 11;
      SPEED          at 0 range 12 .. 13;
      CLKUSABLE      at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   ------------------
   -- SCR_Register --
   ------------------

   subtype SCR_IDTIC_Field is ATSAM3X8E.Bit;
   subtype SCR_VBUSTIC_Field is ATSAM3X8E.Bit;
   subtype SCR_SRPIC_Field is ATSAM3X8E.Bit;
   subtype SCR_VBERRIC_Field is ATSAM3X8E.Bit;
   subtype SCR_BCERRIC_Field is ATSAM3X8E.Bit;
   subtype SCR_ROLEEXIC_Field is ATSAM3X8E.Bit;
   subtype SCR_HNPERRIC_Field is ATSAM3X8E.Bit;
   subtype SCR_STOIC_Field is ATSAM3X8E.Bit;
   subtype SCR_VBUSRQC_Field is ATSAM3X8E.Bit;

   --  General Status Clear Register
   type SCR_Register is record
      --  Write-only. ID Transition Interrupt Clear
      IDTIC          : SCR_IDTIC_Field := 16#0#;
      --  Write-only. VBus Transition Interrupt Clear
      VBUSTIC        : SCR_VBUSTIC_Field := 16#0#;
      --  Write-only. SRP Interrupt Clear
      SRPIC          : SCR_SRPIC_Field := 16#0#;
      --  Write-only. VBus Error Interrupt Clear
      VBERRIC        : SCR_VBERRIC_Field := 16#0#;
      --  Write-only. B-Connection Error Interrupt Clear
      BCERRIC        : SCR_BCERRIC_Field := 16#0#;
      --  Write-only. Role Exchange Interrupt Clear
      ROLEEXIC       : SCR_ROLEEXIC_Field := 16#0#;
      --  Write-only. HNP Error Interrupt Clear
      HNPERRIC       : SCR_HNPERRIC_Field := 16#0#;
      --  Write-only. Suspend Time-Out Interrupt Clear
      STOIC          : SCR_STOIC_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. VBus Request Clear
      VBUSRQC        : SCR_VBUSRQC_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      IDTIC          at 0 range 0 .. 0;
      VBUSTIC        at 0 range 1 .. 1;
      SRPIC          at 0 range 2 .. 2;
      VBERRIC        at 0 range 3 .. 3;
      BCERRIC        at 0 range 4 .. 4;
      ROLEEXIC       at 0 range 5 .. 5;
      HNPERRIC       at 0 range 6 .. 6;
      STOIC          at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      VBUSRQC        at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   ------------------
   -- SFR_Register --
   ------------------

   subtype SFR_IDTIS_Field is ATSAM3X8E.Bit;
   subtype SFR_VBUSTIS_Field is ATSAM3X8E.Bit;
   subtype SFR_SRPIS_Field is ATSAM3X8E.Bit;
   subtype SFR_VBERRIS_Field is ATSAM3X8E.Bit;
   subtype SFR_BCERRIS_Field is ATSAM3X8E.Bit;
   subtype SFR_ROLEEXIS_Field is ATSAM3X8E.Bit;
   subtype SFR_HNPERRIS_Field is ATSAM3X8E.Bit;
   subtype SFR_STOIS_Field is ATSAM3X8E.Bit;
   subtype SFR_VBUSRQS_Field is ATSAM3X8E.Bit;

   --  General Status Set Register
   type SFR_Register is record
      --  Write-only. ID Transition Interrupt Set
      IDTIS          : SFR_IDTIS_Field := 16#0#;
      --  Write-only. VBus Transition Interrupt Set
      VBUSTIS        : SFR_VBUSTIS_Field := 16#0#;
      --  Write-only. SRP Interrupt Set
      SRPIS          : SFR_SRPIS_Field := 16#0#;
      --  Write-only. VBus Error Interrupt Set
      VBERRIS        : SFR_VBERRIS_Field := 16#0#;
      --  Write-only. B-Connection Error Interrupt Set
      BCERRIS        : SFR_BCERRIS_Field := 16#0#;
      --  Write-only. Role Exchange Interrupt Set
      ROLEEXIS       : SFR_ROLEEXIS_Field := 16#0#;
      --  Write-only. HNP Error Interrupt Set
      HNPERRIS       : SFR_HNPERRIS_Field := 16#0#;
      --  Write-only. Suspend Time-Out Interrupt Set
      STOIS          : SFR_STOIS_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. VBus Request Set
      VBUSRQS        : SFR_VBUSRQS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SFR_Register use record
      IDTIS          at 0 range 0 .. 0;
      VBUSTIS        at 0 range 1 .. 1;
      SRPIS          at 0 range 2 .. 2;
      VBERRIS        at 0 range 3 .. 3;
      BCERRIS        at 0 range 4 .. 4;
      ROLEEXIS       at 0 range 5 .. 5;
      HNPERRIS       at 0 range 6 .. 6;
      STOIS          at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      VBUSRQS        at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   ------------------
   -- FSM_Register --
   ------------------

   --  Dual Role Device State
   type DRDSTATE_Field is
     (
      --  This is the start state for A-devices (when the ID pin is 0)
      A_Idlestate,
      --  In this state, the A-device waits for the voltage on VBus to rise
      --  above the A-device VBus Valid threshold (4.4 V).
      A_Wait_Vrise,
      --  In this state, the A-device waits for the B-device to signal a
      --  connection.
      A_Wait_Bcon,
      --  In this state, the A-device that operates in Host mode is
      --  operational.
      A_Host,
      --  The A-device operating as a host is in the suspend mode.
      A_Suspend,
      --  The A-device operates as a peripheral.
      A_Peripheral,
      --  In this state, the A-device waits for the voltage on VBus to drop
      --  below the A-device Session Valid threshold (1.4 V).
      A_Wait_Vfall,
      --  In this state, the A-device waits for recovery of the over-current
      --  condition that caused it to enter this state.
      A_Vbus_Err,
      --  In this state, the A-device waits for the data USB line to discharge
      --  (100 us).
      A_Wait_Discharge,
      --  This is the start state for B-device (when the ID pin is 1).
      B_Idle,
      --  In this state, the B-device acts as the peripheral.
      B_Peripheral,
      --  In this state, the B-device is in suspend mode and waits until 3 ms
      --  before initiating the HNP protocol if requested.
      B_Wait_Begin_Hnp,
      --  In this state, the B-device waits for the data USB line to discharge
      --  (100 us) before becoming Host.
      B_Wait_Discharge,
      --  In this state, the B-device waits for the A-device to signal a
      --  connect before becoming B-Host.
      B_Wait_Acon,
      --  In this state, the B-device acts as the Host.
      B_Host,
      --  In this state, the B-device attempts to start a session using the SRP
      --  protocol.
      B_Srp_Init)
     with Size => 4;
   for DRDSTATE_Field use
     (A_Idlestate => 0,
      A_Wait_Vrise => 1,
      A_Wait_Bcon => 2,
      A_Host => 3,
      A_Suspend => 4,
      A_Peripheral => 5,
      A_Wait_Vfall => 6,
      A_Vbus_Err => 7,
      A_Wait_Discharge => 8,
      B_Idle => 9,
      B_Peripheral => 10,
      B_Wait_Begin_Hnp => 11,
      B_Wait_Discharge => 12,
      B_Wait_Acon => 13,
      B_Host => 14,
      B_Srp_Init => 15);

   --  General Finite State Machine Register
   type FSM_Register is record
      --  Read-only. Dual Role Device State
      DRDSTATE      : DRDSTATE_Field := B_Idle;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FSM_Register use record
      DRDSTATE      at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USB On-The-Go Interface
   type UOTGHS_Peripheral is record
      --  Device General Control Register
      DEVCTRL        : DEVCTRL_Register;
      --  Device Global Interrupt Status Register
      DEVISR         : DEVISR_Register;
      --  Device Global Interrupt Clear Register
      DEVICR         : DEVICR_Register;
      --  Device Global Interrupt Set Register
      DEVIFR         : DEVIFR_Register;
      --  Device Global Interrupt Mask Register
      DEVIMR         : DEVIMR_Register;
      --  Device Global Interrupt Disable Register
      DEVIDR         : DEVIDR_Register;
      --  Device Global Interrupt Enable Register
      DEVIER         : DEVIER_Register;
      --  Device Endpoint Register
      DEVEPT         : DEVEPT_Register;
      --  Device Frame Number Register
      DEVFNUM        : DEVFNUM_Register;
      --  Device Endpoint Configuration Register (n = 0)
      DEVEPTCFG      : DEVEPTCFG_Registers;
      --  Device Endpoint Status Register (n = 0)
      DEVEPTISR      : DEVEPTISR_Registers;
      --  Device Endpoint Clear Register (n = 0)
      DEVEPTICR      : DEVEPTICR_Registers;
      --  Device Endpoint Set Register (n = 0)
      DEVEPTIFR      : DEVEPTIFR_Registers;
      --  Device Endpoint Mask Register (n = 0)
      DEVEPTIMR      : DEVEPTIMR_Registers;
      --  Device Endpoint Enable Register (n = 0)
      DEVEPTIER      : DEVEPTIER_Registers;
      --  Device Endpoint Disable Register (n = 0)
      DEVEPTIDR      : DEVEPTIDR_Registers;
      --  Device DMA Channel Next Descriptor Address Register (n = 1)
      DEVDMANXTDSC1  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 1)
      DEVDMAADDRESS1 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 1)
      DEVDMACONTROL1 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 1)
      DEVDMASTATUS1  : DEVDMASTATUS_Register;
      --  Device DMA Channel Next Descriptor Address Register (n = 2)
      DEVDMANXTDSC2  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 2)
      DEVDMAADDRESS2 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 2)
      DEVDMACONTROL2 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 2)
      DEVDMASTATUS2  : DEVDMASTATUS_Register;
      --  Device DMA Channel Next Descriptor Address Register (n = 3)
      DEVDMANXTDSC3  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 3)
      DEVDMAADDRESS3 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 3)
      DEVDMACONTROL3 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 3)
      DEVDMASTATUS3  : DEVDMASTATUS_Register;
      --  Device DMA Channel Next Descriptor Address Register (n = 4)
      DEVDMANXTDSC4  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 4)
      DEVDMAADDRESS4 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 4)
      DEVDMACONTROL4 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 4)
      DEVDMASTATUS4  : DEVDMASTATUS_Register;
      --  Device DMA Channel Next Descriptor Address Register (n = 5)
      DEVDMANXTDSC5  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 5)
      DEVDMAADDRESS5 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 5)
      DEVDMACONTROL5 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 5)
      DEVDMASTATUS5  : DEVDMASTATUS_Register;
      --  Device DMA Channel Next Descriptor Address Register (n = 6)
      DEVDMANXTDSC6  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 6)
      DEVDMAADDRESS6 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 6)
      DEVDMACONTROL6 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 6)
      DEVDMASTATUS6  : DEVDMASTATUS_Register;
      --  Device DMA Channel Next Descriptor Address Register (n = 7)
      DEVDMANXTDSC7  : ATSAM3X8E.Word;
      --  Device DMA Channel Address Register (n = 7)
      DEVDMAADDRESS7 : ATSAM3X8E.Word;
      --  Device DMA Channel Control Register (n = 7)
      DEVDMACONTROL7 : DEVDMACONTROL_Register;
      --  Device DMA Channel Status Register (n = 7)
      DEVDMASTATUS7  : DEVDMASTATUS_Register;
      --  Host General Control Register
      HSTCTRL        : HSTCTRL_Register;
      --  Host Global Interrupt Status Register
      HSTISR         : HSTISR_Register;
      --  Host Global Interrupt Clear Register
      HSTICR         : HSTICR_Register;
      --  Host Global Interrupt Set Register
      HSTIFR         : HSTIFR_Register;
      --  Host Global Interrupt Mask Register
      HSTIMR         : HSTIMR_Register;
      --  Host Global Interrupt Disable Register
      HSTIDR         : HSTIDR_Register;
      --  Host Global Interrupt Enable Register
      HSTIER         : HSTIER_Register;
      --  Host Pipe Register
      HSTPIP         : HSTPIP_Register;
      --  Host Frame Number Register
      HSTFNUM        : HSTFNUM_Register;
      --  Host Address 1 Register
      HSTADDR1       : HSTADDR_Register;
      --  Host Address 2 Register
      HSTADDR2       : HSTADDR_Register;
      --  Host Address 3 Register
      HSTADDR3       : HSTADDR3_Register;
      --  Host Pipe Configuration Register (n = 0)
      HSTPIPCFG      : HSTPIPCFG_Registers;
      --  Host Pipe Status Register (n = 0)
      HSTPIPISR      : HSTPIPISR_Registers;
      --  Host Pipe Clear Register (n = 0)
      HSTPIPICR      : HSTPIPICR_Registers;
      --  Host Pipe Set Register (n = 0)
      HSTPIPIFR      : HSTPIPIFR_Registers;
      --  Host Pipe Mask Register (n = 0)
      HSTPIPIMR      : HSTPIPIMR_Registers;
      --  Host Pipe Enable Register (n = 0)
      HSTPIPIER      : HSTPIPIER_Registers;
      --  Host Pipe Disable Register (n = 0)
      HSTPIPIDR      : HSTPIPIDR_Registers;
      --  Host Pipe IN Request Register (n = 0)
      HSTPIPINRQ     : HSTPIPINRQ_Registers;
      --  Host Pipe Error Register (n = 0)
      HSTPIPERR      : HSTPIPERR_Registers;
      --  Host DMA Channel Next Descriptor Address Register (n = 1)
      HSTDMANXTDSC1  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 1)
      HSTDMAADDRESS1 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 1)
      HSTDMACONTROL1 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 1)
      HSTDMASTATUS1  : HSTDMASTATUS_Register;
      --  Host DMA Channel Next Descriptor Address Register (n = 2)
      HSTDMANXTDSC2  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 2)
      HSTDMAADDRESS2 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 2)
      HSTDMACONTROL2 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 2)
      HSTDMASTATUS2  : HSTDMASTATUS_Register;
      --  Host DMA Channel Next Descriptor Address Register (n = 3)
      HSTDMANXTDSC3  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 3)
      HSTDMAADDRESS3 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 3)
      HSTDMACONTROL3 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 3)
      HSTDMASTATUS3  : HSTDMASTATUS_Register;
      --  Host DMA Channel Next Descriptor Address Register (n = 4)
      HSTDMANXTDSC4  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 4)
      HSTDMAADDRESS4 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 4)
      HSTDMACONTROL4 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 4)
      HSTDMASTATUS4  : HSTDMASTATUS_Register;
      --  Host DMA Channel Next Descriptor Address Register (n = 5)
      HSTDMANXTDSC5  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 5)
      HSTDMAADDRESS5 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 5)
      HSTDMACONTROL5 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 5)
      HSTDMASTATUS5  : HSTDMASTATUS_Register;
      --  Host DMA Channel Next Descriptor Address Register (n = 6)
      HSTDMANXTDSC6  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 6)
      HSTDMAADDRESS6 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 6)
      HSTDMACONTROL6 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 6)
      HSTDMASTATUS6  : HSTDMASTATUS_Register;
      --  Host DMA Channel Next Descriptor Address Register (n = 7)
      HSTDMANXTDSC7  : ATSAM3X8E.Word;
      --  Host DMA Channel Address Register (n = 7)
      HSTDMAADDRESS7 : ATSAM3X8E.Word;
      --  Host DMA Channel Control Register (n = 7)
      HSTDMACONTROL7 : HSTDMACONTROL_Register;
      --  Host DMA Channel Status Register (n = 7)
      HSTDMASTATUS7  : HSTDMASTATUS_Register;
      --  General Control Register
      CTRL           : CTRL_Register;
      --  General Status Register
      SR             : SR_Register;
      --  General Status Clear Register
      SCR            : SCR_Register;
      --  General Status Set Register
      SFR            : SFR_Register;
      --  General Finite State Machine Register
      FSM            : FSM_Register;
   end record
     with Volatile;

   for UOTGHS_Peripheral use record
      DEVCTRL        at 0 range 0 .. 31;
      DEVISR         at 4 range 0 .. 31;
      DEVICR         at 8 range 0 .. 31;
      DEVIFR         at 12 range 0 .. 31;
      DEVIMR         at 16 range 0 .. 31;
      DEVIDR         at 20 range 0 .. 31;
      DEVIER         at 24 range 0 .. 31;
      DEVEPT         at 28 range 0 .. 31;
      DEVFNUM        at 32 range 0 .. 31;
      DEVEPTCFG      at 256 range 0 .. 319;
      DEVEPTISR      at 304 range 0 .. 319;
      DEVEPTICR      at 352 range 0 .. 319;
      DEVEPTIFR      at 400 range 0 .. 319;
      DEVEPTIMR      at 448 range 0 .. 319;
      DEVEPTIER      at 496 range 0 .. 319;
      DEVEPTIDR      at 544 range 0 .. 319;
      DEVDMANXTDSC1  at 784 range 0 .. 31;
      DEVDMAADDRESS1 at 788 range 0 .. 31;
      DEVDMACONTROL1 at 792 range 0 .. 31;
      DEVDMASTATUS1  at 796 range 0 .. 31;
      DEVDMANXTDSC2  at 800 range 0 .. 31;
      DEVDMAADDRESS2 at 804 range 0 .. 31;
      DEVDMACONTROL2 at 808 range 0 .. 31;
      DEVDMASTATUS2  at 812 range 0 .. 31;
      DEVDMANXTDSC3  at 816 range 0 .. 31;
      DEVDMAADDRESS3 at 820 range 0 .. 31;
      DEVDMACONTROL3 at 824 range 0 .. 31;
      DEVDMASTATUS3  at 828 range 0 .. 31;
      DEVDMANXTDSC4  at 832 range 0 .. 31;
      DEVDMAADDRESS4 at 836 range 0 .. 31;
      DEVDMACONTROL4 at 840 range 0 .. 31;
      DEVDMASTATUS4  at 844 range 0 .. 31;
      DEVDMANXTDSC5  at 848 range 0 .. 31;
      DEVDMAADDRESS5 at 852 range 0 .. 31;
      DEVDMACONTROL5 at 856 range 0 .. 31;
      DEVDMASTATUS5  at 860 range 0 .. 31;
      DEVDMANXTDSC6  at 864 range 0 .. 31;
      DEVDMAADDRESS6 at 868 range 0 .. 31;
      DEVDMACONTROL6 at 872 range 0 .. 31;
      DEVDMASTATUS6  at 876 range 0 .. 31;
      DEVDMANXTDSC7  at 880 range 0 .. 31;
      DEVDMAADDRESS7 at 884 range 0 .. 31;
      DEVDMACONTROL7 at 888 range 0 .. 31;
      DEVDMASTATUS7  at 892 range 0 .. 31;
      HSTCTRL        at 1024 range 0 .. 31;
      HSTISR         at 1028 range 0 .. 31;
      HSTICR         at 1032 range 0 .. 31;
      HSTIFR         at 1036 range 0 .. 31;
      HSTIMR         at 1040 range 0 .. 31;
      HSTIDR         at 1044 range 0 .. 31;
      HSTIER         at 1048 range 0 .. 31;
      HSTPIP         at 1052 range 0 .. 31;
      HSTFNUM        at 1056 range 0 .. 31;
      HSTADDR1       at 1060 range 0 .. 31;
      HSTADDR2       at 1064 range 0 .. 31;
      HSTADDR3       at 1068 range 0 .. 31;
      HSTPIPCFG      at 1280 range 0 .. 319;
      HSTPIPISR      at 1328 range 0 .. 319;
      HSTPIPICR      at 1376 range 0 .. 319;
      HSTPIPIFR      at 1424 range 0 .. 319;
      HSTPIPIMR      at 1472 range 0 .. 319;
      HSTPIPIER      at 1520 range 0 .. 319;
      HSTPIPIDR      at 1568 range 0 .. 319;
      HSTPIPINRQ     at 1616 range 0 .. 319;
      HSTPIPERR      at 1664 range 0 .. 319;
      HSTDMANXTDSC1  at 1808 range 0 .. 31;
      HSTDMAADDRESS1 at 1812 range 0 .. 31;
      HSTDMACONTROL1 at 1816 range 0 .. 31;
      HSTDMASTATUS1  at 1820 range 0 .. 31;
      HSTDMANXTDSC2  at 1824 range 0 .. 31;
      HSTDMAADDRESS2 at 1828 range 0 .. 31;
      HSTDMACONTROL2 at 1832 range 0 .. 31;
      HSTDMASTATUS2  at 1836 range 0 .. 31;
      HSTDMANXTDSC3  at 1840 range 0 .. 31;
      HSTDMAADDRESS3 at 1844 range 0 .. 31;
      HSTDMACONTROL3 at 1848 range 0 .. 31;
      HSTDMASTATUS3  at 1852 range 0 .. 31;
      HSTDMANXTDSC4  at 1856 range 0 .. 31;
      HSTDMAADDRESS4 at 1860 range 0 .. 31;
      HSTDMACONTROL4 at 1864 range 0 .. 31;
      HSTDMASTATUS4  at 1868 range 0 .. 31;
      HSTDMANXTDSC5  at 1872 range 0 .. 31;
      HSTDMAADDRESS5 at 1876 range 0 .. 31;
      HSTDMACONTROL5 at 1880 range 0 .. 31;
      HSTDMASTATUS5  at 1884 range 0 .. 31;
      HSTDMANXTDSC6  at 1888 range 0 .. 31;
      HSTDMAADDRESS6 at 1892 range 0 .. 31;
      HSTDMACONTROL6 at 1896 range 0 .. 31;
      HSTDMASTATUS6  at 1900 range 0 .. 31;
      HSTDMANXTDSC7  at 1904 range 0 .. 31;
      HSTDMAADDRESS7 at 1908 range 0 .. 31;
      HSTDMACONTROL7 at 1912 range 0 .. 31;
      HSTDMASTATUS7  at 1916 range 0 .. 31;
      CTRL           at 2048 range 0 .. 31;
      SR             at 2052 range 0 .. 31;
      SCR            at 2056 range 0 .. 31;
      SFR            at 2060 range 0 .. 31;
      FSM            at 2092 range 0 .. 31;
   end record;

   --  USB On-The-Go Interface
   UOTGHS_Periph : aliased UOTGHS_Peripheral
     with Import, Address => UOTGHS_Base;

end ATSAM3X8E.UOTGHS;
