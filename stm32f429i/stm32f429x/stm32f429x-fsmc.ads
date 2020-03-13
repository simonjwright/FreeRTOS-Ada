pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F429x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F429x.FSMC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype BCR1_MBKEN_Field is STM32F429x.Bit;
   subtype BCR1_MUXEN_Field is STM32F429x.Bit;
   subtype BCR1_MTYP_Field is STM32F429x.UInt2;
   subtype BCR1_MWID_Field is STM32F429x.UInt2;
   subtype BCR1_FACCEN_Field is STM32F429x.Bit;
   subtype BCR1_BURSTEN_Field is STM32F429x.Bit;
   subtype BCR1_WAITPOL_Field is STM32F429x.Bit;
   subtype BCR1_WAITCFG_Field is STM32F429x.Bit;
   subtype BCR1_WREN_Field is STM32F429x.Bit;
   subtype BCR1_WAITEN_Field is STM32F429x.Bit;
   subtype BCR1_EXTMOD_Field is STM32F429x.Bit;
   subtype BCR1_ASYNCWAIT_Field is STM32F429x.Bit;
   subtype BCR1_CBURSTRW_Field is STM32F429x.Bit;
   subtype BCR1_CCLKEN_Field is STM32F429x.Bit;

   --  SRAM/NOR-Flash chip-select control register 1
   type BCR1_Register is record
      --  MBKEN
      MBKEN          : BCR1_MBKEN_Field := 16#0#;
      --  MUXEN
      MUXEN          : BCR1_MUXEN_Field := 16#0#;
      --  MTYP
      MTYP           : BCR1_MTYP_Field := 16#0#;
      --  MWID
      MWID           : BCR1_MWID_Field := 16#1#;
      --  FACCEN
      FACCEN         : BCR1_FACCEN_Field := 16#1#;
      --  unspecified
      Reserved_7_7   : STM32F429x.Bit := 16#1#;
      --  BURSTEN
      BURSTEN        : BCR1_BURSTEN_Field := 16#0#;
      --  WAITPOL
      WAITPOL        : BCR1_WAITPOL_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : STM32F429x.Bit := 16#0#;
      --  WAITCFG
      WAITCFG        : BCR1_WAITCFG_Field := 16#0#;
      --  WREN
      WREN           : BCR1_WREN_Field := 16#1#;
      --  WAITEN
      WAITEN         : BCR1_WAITEN_Field := 16#1#;
      --  EXTMOD
      EXTMOD         : BCR1_EXTMOD_Field := 16#0#;
      --  ASYNCWAIT
      ASYNCWAIT      : BCR1_ASYNCWAIT_Field := 16#0#;
      --  unspecified
      Reserved_16_18 : STM32F429x.UInt3 := 16#0#;
      --  CBURSTRW
      CBURSTRW       : BCR1_CBURSTRW_Field := 16#0#;
      --  CCLKEN
      CCLKEN         : BCR1_CCLKEN_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : STM32F429x.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BCR1_Register use record
      MBKEN          at 0 range 0 .. 0;
      MUXEN          at 0 range 1 .. 1;
      MTYP           at 0 range 2 .. 3;
      MWID           at 0 range 4 .. 5;
      FACCEN         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      BURSTEN        at 0 range 8 .. 8;
      WAITPOL        at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      WAITCFG        at 0 range 11 .. 11;
      WREN           at 0 range 12 .. 12;
      WAITEN         at 0 range 13 .. 13;
      EXTMOD         at 0 range 14 .. 14;
      ASYNCWAIT      at 0 range 15 .. 15;
      Reserved_16_18 at 0 range 16 .. 18;
      CBURSTRW       at 0 range 19 .. 19;
      CCLKEN         at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype BTR_ADDSET_Field is STM32F429x.UInt4;
   subtype BTR_ADDHLD_Field is STM32F429x.UInt4;
   subtype BTR_DATAST_Field is STM32F429x.Byte;
   subtype BTR_BUSTURN_Field is STM32F429x.UInt4;
   subtype BTR_CLKDIV_Field is STM32F429x.UInt4;
   subtype BTR_DATLAT_Field is STM32F429x.UInt4;
   subtype BTR_ACCMOD_Field is STM32F429x.UInt2;

   --  SRAM/NOR-Flash chip-select timing register 1
   type BTR_Register is record
      --  ADDSET
      ADDSET         : BTR_ADDSET_Field := 16#F#;
      --  ADDHLD
      ADDHLD         : BTR_ADDHLD_Field := 16#F#;
      --  DATAST
      DATAST         : BTR_DATAST_Field := 16#FF#;
      --  BUSTURN
      BUSTURN        : BTR_BUSTURN_Field := 16#F#;
      --  CLKDIV
      CLKDIV         : BTR_CLKDIV_Field := 16#F#;
      --  DATLAT
      DATLAT         : BTR_DATLAT_Field := 16#F#;
      --  ACCMOD
      ACCMOD         : BTR_ACCMOD_Field := 16#3#;
      --  unspecified
      Reserved_30_31 : STM32F429x.UInt2 := 16#3#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BTR_Register use record
      ADDSET         at 0 range 0 .. 3;
      ADDHLD         at 0 range 4 .. 7;
      DATAST         at 0 range 8 .. 15;
      BUSTURN        at 0 range 16 .. 19;
      CLKDIV         at 0 range 20 .. 23;
      DATLAT         at 0 range 24 .. 27;
      ACCMOD         at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype BCR_MBKEN_Field is STM32F429x.Bit;
   subtype BCR_MUXEN_Field is STM32F429x.Bit;
   subtype BCR_MTYP_Field is STM32F429x.UInt2;
   subtype BCR_MWID_Field is STM32F429x.UInt2;
   subtype BCR_FACCEN_Field is STM32F429x.Bit;
   subtype BCR_BURSTEN_Field is STM32F429x.Bit;
   subtype BCR_WAITPOL_Field is STM32F429x.Bit;
   subtype BCR_WRAPMOD_Field is STM32F429x.Bit;
   subtype BCR_WAITCFG_Field is STM32F429x.Bit;
   subtype BCR_WREN_Field is STM32F429x.Bit;
   subtype BCR_WAITEN_Field is STM32F429x.Bit;
   subtype BCR_EXTMOD_Field is STM32F429x.Bit;
   subtype BCR_ASYNCWAIT_Field is STM32F429x.Bit;
   subtype BCR_CBURSTRW_Field is STM32F429x.Bit;

   --  SRAM/NOR-Flash chip-select control register 2
   type BCR_Register is record
      --  MBKEN
      MBKEN          : BCR_MBKEN_Field := 16#0#;
      --  MUXEN
      MUXEN          : BCR_MUXEN_Field := 16#0#;
      --  MTYP
      MTYP           : BCR_MTYP_Field := 16#0#;
      --  MWID
      MWID           : BCR_MWID_Field := 16#1#;
      --  FACCEN
      FACCEN         : BCR_FACCEN_Field := 16#1#;
      --  unspecified
      Reserved_7_7   : STM32F429x.Bit := 16#1#;
      --  BURSTEN
      BURSTEN        : BCR_BURSTEN_Field := 16#0#;
      --  WAITPOL
      WAITPOL        : BCR_WAITPOL_Field := 16#0#;
      --  WRAPMOD
      WRAPMOD        : BCR_WRAPMOD_Field := 16#0#;
      --  WAITCFG
      WAITCFG        : BCR_WAITCFG_Field := 16#0#;
      --  WREN
      WREN           : BCR_WREN_Field := 16#1#;
      --  WAITEN
      WAITEN         : BCR_WAITEN_Field := 16#1#;
      --  EXTMOD
      EXTMOD         : BCR_EXTMOD_Field := 16#0#;
      --  ASYNCWAIT
      ASYNCWAIT      : BCR_ASYNCWAIT_Field := 16#0#;
      --  unspecified
      Reserved_16_18 : STM32F429x.UInt3 := 16#0#;
      --  CBURSTRW
      CBURSTRW       : BCR_CBURSTRW_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : STM32F429x.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BCR_Register use record
      MBKEN          at 0 range 0 .. 0;
      MUXEN          at 0 range 1 .. 1;
      MTYP           at 0 range 2 .. 3;
      MWID           at 0 range 4 .. 5;
      FACCEN         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      BURSTEN        at 0 range 8 .. 8;
      WAITPOL        at 0 range 9 .. 9;
      WRAPMOD        at 0 range 10 .. 10;
      WAITCFG        at 0 range 11 .. 11;
      WREN           at 0 range 12 .. 12;
      WAITEN         at 0 range 13 .. 13;
      EXTMOD         at 0 range 14 .. 14;
      ASYNCWAIT      at 0 range 15 .. 15;
      Reserved_16_18 at 0 range 16 .. 18;
      CBURSTRW       at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype PCR_PWAITEN_Field is STM32F429x.Bit;
   subtype PCR_PBKEN_Field is STM32F429x.Bit;
   subtype PCR_PTYP_Field is STM32F429x.Bit;
   subtype PCR_PWID_Field is STM32F429x.UInt2;
   subtype PCR_ECCEN_Field is STM32F429x.Bit;
   subtype PCR_TCLR_Field is STM32F429x.UInt4;
   subtype PCR_TAR_Field is STM32F429x.UInt4;
   subtype PCR_ECCPS_Field is STM32F429x.UInt3;

   --  PC Card/NAND Flash control register 2
   type PCR_Register is record
      --  unspecified
      Reserved_0_0   : STM32F429x.Bit := 16#0#;
      --  PWAITEN
      PWAITEN        : PCR_PWAITEN_Field := 16#0#;
      --  PBKEN
      PBKEN          : PCR_PBKEN_Field := 16#0#;
      --  PTYP
      PTYP           : PCR_PTYP_Field := 16#1#;
      --  PWID
      PWID           : PCR_PWID_Field := 16#1#;
      --  ECCEN
      ECCEN          : PCR_ECCEN_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : STM32F429x.UInt2 := 16#0#;
      --  TCLR
      TCLR           : PCR_TCLR_Field := 16#0#;
      --  TAR
      TAR            : PCR_TAR_Field := 16#0#;
      --  ECCPS
      ECCPS          : PCR_ECCPS_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : STM32F429x.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PCR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      PWAITEN        at 0 range 1 .. 1;
      PBKEN          at 0 range 2 .. 2;
      PTYP           at 0 range 3 .. 3;
      PWID           at 0 range 4 .. 5;
      ECCEN          at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      TCLR           at 0 range 9 .. 12;
      TAR            at 0 range 13 .. 16;
      ECCPS          at 0 range 17 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype SR_IRS_Field is STM32F429x.Bit;
   subtype SR_ILS_Field is STM32F429x.Bit;
   subtype SR_IFS_Field is STM32F429x.Bit;
   subtype SR_IREN_Field is STM32F429x.Bit;
   subtype SR_ILEN_Field is STM32F429x.Bit;
   subtype SR_IFEN_Field is STM32F429x.Bit;
   subtype SR_FEMPT_Field is STM32F429x.Bit;

   --  FIFO status and interrupt register 2
   type SR_Register is record
      --  IRS
      IRS           : SR_IRS_Field := 16#0#;
      --  ILS
      ILS           : SR_ILS_Field := 16#0#;
      --  IFS
      IFS           : SR_IFS_Field := 16#0#;
      --  IREN
      IREN          : SR_IREN_Field := 16#0#;
      --  ILEN
      ILEN          : SR_ILEN_Field := 16#0#;
      --  IFEN
      IFEN          : SR_IFEN_Field := 16#0#;
      --  Read-only. FEMPT
      FEMPT         : SR_FEMPT_Field := 16#1#;
      --  unspecified
      Reserved_7_31 : STM32F429x.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      IRS           at 0 range 0 .. 0;
      ILS           at 0 range 1 .. 1;
      IFS           at 0 range 2 .. 2;
      IREN          at 0 range 3 .. 3;
      ILEN          at 0 range 4 .. 4;
      IFEN          at 0 range 5 .. 5;
      FEMPT         at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PMEM_MEMSETx_Field is STM32F429x.Byte;
   subtype PMEM_MEMWAITx_Field is STM32F429x.Byte;
   subtype PMEM_MEMHOLDx_Field is STM32F429x.Byte;
   subtype PMEM_MEMHIZx_Field is STM32F429x.Byte;

   --  Common memory space timing register 2
   type PMEM_Register is record
      --  MEMSETx
      MEMSETx  : PMEM_MEMSETx_Field := 16#FC#;
      --  MEMWAITx
      MEMWAITx : PMEM_MEMWAITx_Field := 16#FC#;
      --  MEMHOLDx
      MEMHOLDx : PMEM_MEMHOLDx_Field := 16#FC#;
      --  MEMHIZx
      MEMHIZx  : PMEM_MEMHIZx_Field := 16#FC#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PMEM_Register use record
      MEMSETx  at 0 range 0 .. 7;
      MEMWAITx at 0 range 8 .. 15;
      MEMHOLDx at 0 range 16 .. 23;
      MEMHIZx  at 0 range 24 .. 31;
   end record;

   subtype PATT_ATTSETx_Field is STM32F429x.Byte;
   subtype PATT_ATTWAITx_Field is STM32F429x.Byte;
   subtype PATT_ATTHOLDx_Field is STM32F429x.Byte;
   subtype PATT_ATTHIZx_Field is STM32F429x.Byte;

   --  Attribute memory space timing register 2
   type PATT_Register is record
      --  ATTSETx
      ATTSETx  : PATT_ATTSETx_Field := 16#FC#;
      --  ATTWAITx
      ATTWAITx : PATT_ATTWAITx_Field := 16#FC#;
      --  ATTHOLDx
      ATTHOLDx : PATT_ATTHOLDx_Field := 16#FC#;
      --  ATTHIZx
      ATTHIZx  : PATT_ATTHIZx_Field := 16#FC#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PATT_Register use record
      ATTSETx  at 0 range 0 .. 7;
      ATTWAITx at 0 range 8 .. 15;
      ATTHOLDx at 0 range 16 .. 23;
      ATTHIZx  at 0 range 24 .. 31;
   end record;

   subtype PIO4_IOSETx_Field is STM32F429x.Byte;
   subtype PIO4_IOWAITx_Field is STM32F429x.Byte;
   subtype PIO4_IOHOLDx_Field is STM32F429x.Byte;
   subtype PIO4_IOHIZx_Field is STM32F429x.Byte;

   --  I/O space timing register 4
   type PIO4_Register is record
      --  IOSETx
      IOSETx  : PIO4_IOSETx_Field := 16#FC#;
      --  IOWAITx
      IOWAITx : PIO4_IOWAITx_Field := 16#FC#;
      --  IOHOLDx
      IOHOLDx : PIO4_IOHOLDx_Field := 16#FC#;
      --  IOHIZx
      IOHIZx  : PIO4_IOHIZx_Field := 16#FC#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PIO4_Register use record
      IOSETx  at 0 range 0 .. 7;
      IOWAITx at 0 range 8 .. 15;
      IOHOLDx at 0 range 16 .. 23;
      IOHIZx  at 0 range 24 .. 31;
   end record;

   subtype BWTR_ADDSET_Field is STM32F429x.UInt4;
   subtype BWTR_ADDHLD_Field is STM32F429x.UInt4;
   subtype BWTR_DATAST_Field is STM32F429x.Byte;
   subtype BWTR_CLKDIV_Field is STM32F429x.UInt4;
   subtype BWTR_DATLAT_Field is STM32F429x.UInt4;
   subtype BWTR_ACCMOD_Field is STM32F429x.UInt2;

   --  SRAM/NOR-Flash write timing registers 1
   type BWTR_Register is record
      --  ADDSET
      ADDSET         : BWTR_ADDSET_Field := 16#F#;
      --  ADDHLD
      ADDHLD         : BWTR_ADDHLD_Field := 16#F#;
      --  DATAST
      DATAST         : BWTR_DATAST_Field := 16#FF#;
      --  unspecified
      Reserved_16_19 : STM32F429x.UInt4 := 16#F#;
      --  CLKDIV
      CLKDIV         : BWTR_CLKDIV_Field := 16#F#;
      --  DATLAT
      DATLAT         : BWTR_DATLAT_Field := 16#F#;
      --  ACCMOD
      ACCMOD         : BWTR_ACCMOD_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : STM32F429x.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for BWTR_Register use record
      ADDSET         at 0 range 0 .. 3;
      ADDHLD         at 0 range 4 .. 7;
      DATAST         at 0 range 8 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CLKDIV         at 0 range 20 .. 23;
      DATLAT         at 0 range 24 .. 27;
      ACCMOD         at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype SDCR_NC_Field is STM32F429x.UInt2;
   subtype SDCR_NR_Field is STM32F429x.UInt2;
   subtype SDCR_MWID_Field is STM32F429x.UInt2;
   subtype SDCR_NB_Field is STM32F429x.Bit;
   subtype SDCR_CAS_Field is STM32F429x.UInt2;
   subtype SDCR_WP_Field is STM32F429x.Bit;
   subtype SDCR_SDCLK_Field is STM32F429x.UInt2;
   subtype SDCR_RBURST_Field is STM32F429x.Bit;
   subtype SDCR_RPIPE_Field is STM32F429x.UInt2;

   --  SDRAM Control Register 1
   type SDCR_Register is record
      --  Number of column address bits
      NC             : SDCR_NC_Field := 16#0#;
      --  Number of row address bits
      NR             : SDCR_NR_Field := 16#0#;
      --  Memory data bus width
      MWID           : SDCR_MWID_Field := 16#1#;
      --  Number of internal banks
      NB             : SDCR_NB_Field := 16#1#;
      --  CAS latency
      CAS            : SDCR_CAS_Field := 16#1#;
      --  Write protection
      WP             : SDCR_WP_Field := 16#1#;
      --  SDRAM clock configuration
      SDCLK          : SDCR_SDCLK_Field := 16#0#;
      --  Burst read
      RBURST         : SDCR_RBURST_Field := 16#0#;
      --  Read pipe
      RPIPE          : SDCR_RPIPE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32F429x.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SDCR_Register use record
      NC             at 0 range 0 .. 1;
      NR             at 0 range 2 .. 3;
      MWID           at 0 range 4 .. 5;
      NB             at 0 range 6 .. 6;
      CAS            at 0 range 7 .. 8;
      WP             at 0 range 9 .. 9;
      SDCLK          at 0 range 10 .. 11;
      RBURST         at 0 range 12 .. 12;
      RPIPE          at 0 range 13 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype SDTR_TMRD_Field is STM32F429x.UInt4;
   subtype SDTR_TXSR_Field is STM32F429x.UInt4;
   subtype SDTR_TRAS_Field is STM32F429x.UInt4;
   subtype SDTR_TRC_Field is STM32F429x.UInt4;
   subtype SDTR_TWR_Field is STM32F429x.UInt4;
   subtype SDTR_TRP_Field is STM32F429x.UInt4;
   subtype SDTR_TRCD_Field is STM32F429x.UInt4;

   --  SDRAM Timing register 1
   type SDTR_Register is record
      --  Load Mode Register to Active
      TMRD           : SDTR_TMRD_Field := 16#F#;
      --  Exit self-refresh delay
      TXSR           : SDTR_TXSR_Field := 16#F#;
      --  Self refresh time
      TRAS           : SDTR_TRAS_Field := 16#F#;
      --  Row cycle delay
      TRC            : SDTR_TRC_Field := 16#F#;
      --  Recovery delay
      TWR            : SDTR_TWR_Field := 16#F#;
      --  Row precharge delay
      TRP            : SDTR_TRP_Field := 16#F#;
      --  Row to column delay
      TRCD           : SDTR_TRCD_Field := 16#F#;
      --  unspecified
      Reserved_28_31 : STM32F429x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SDTR_Register use record
      TMRD           at 0 range 0 .. 3;
      TXSR           at 0 range 4 .. 7;
      TRAS           at 0 range 8 .. 11;
      TRC            at 0 range 12 .. 15;
      TWR            at 0 range 16 .. 19;
      TRP            at 0 range 20 .. 23;
      TRCD           at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype SDCMR_MODE_Field is STM32F429x.UInt3;
   subtype SDCMR_CTB2_Field is STM32F429x.Bit;
   subtype SDCMR_CTB1_Field is STM32F429x.Bit;
   subtype SDCMR_NRFS_Field is STM32F429x.UInt4;
   subtype SDCMR_MRD_Field is STM32F429x.UInt13;

   --  SDRAM Command Mode register
   type SDCMR_Register is record
      --  Write-only. Command mode
      MODE           : SDCMR_MODE_Field := 16#0#;
      --  Write-only. Command target bank 2
      CTB2           : SDCMR_CTB2_Field := 16#0#;
      --  Write-only. Command target bank 1
      CTB1           : SDCMR_CTB1_Field := 16#0#;
      --  Number of Auto-refresh
      NRFS           : SDCMR_NRFS_Field := 16#0#;
      --  Mode Register definition
      MRD            : SDCMR_MRD_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : STM32F429x.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SDCMR_Register use record
      MODE           at 0 range 0 .. 2;
      CTB2           at 0 range 3 .. 3;
      CTB1           at 0 range 4 .. 4;
      NRFS           at 0 range 5 .. 8;
      MRD            at 0 range 9 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype SDRTR_CRE_Field is STM32F429x.Bit;
   subtype SDRTR_COUNT_Field is STM32F429x.UInt13;
   subtype SDRTR_REIE_Field is STM32F429x.Bit;

   --  SDRAM Refresh Timer register
   type SDRTR_Register is record
      --  Write-only. Clear Refresh error flag
      CRE            : SDRTR_CRE_Field := 16#0#;
      --  Refresh Timer Count
      COUNT          : SDRTR_COUNT_Field := 16#0#;
      --  RES Interrupt Enable
      REIE           : SDRTR_REIE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32F429x.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SDRTR_Register use record
      CRE            at 0 range 0 .. 0;
      COUNT          at 0 range 1 .. 13;
      REIE           at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype SDSR_RE_Field is STM32F429x.Bit;
   --  SDSR_MODES array element
   subtype SDSR_MODES_Element is STM32F429x.UInt2;

   --  SDSR_MODES array
   type SDSR_MODES_Field_Array is array (1 .. 2) of SDSR_MODES_Element
     with Component_Size => 2, Size => 4;

   --  Type definition for SDSR_MODES
   type SDSR_MODES_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MODES as a value
            Val : STM32F429x.UInt4;
         when True =>
            --  MODES as an array
            Arr : SDSR_MODES_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for SDSR_MODES_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype SDSR_BUSY_Field is STM32F429x.Bit;

   --  SDRAM Status register
   type SDSR_Register is record
      --  Read-only. Refresh error flag
      RE            : SDSR_RE_Field;
      --  Read-only. Status Mode for Bank 1
      MODES         : SDSR_MODES_Field;
      --  Read-only. Busy status
      BUSY          : SDSR_BUSY_Field;
      --  unspecified
      Reserved_6_31 : STM32F429x.UInt26;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SDSR_Register use record
      RE            at 0 range 0 .. 0;
      MODES         at 0 range 1 .. 4;
      BUSY          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Flexible memory controller
   type FMC_Peripheral is record
      --  SRAM/NOR-Flash chip-select control register 1
      BCR1  : aliased BCR1_Register;
      pragma Volatile_Full_Access (BCR1);
      --  SRAM/NOR-Flash chip-select timing register 1
      BTR1  : aliased BTR_Register;
      pragma Volatile_Full_Access (BTR1);
      --  SRAM/NOR-Flash chip-select control register 2
      BCR2  : aliased BCR_Register;
      pragma Volatile_Full_Access (BCR2);
      --  SRAM/NOR-Flash chip-select timing register 2
      BTR2  : aliased BTR_Register;
      pragma Volatile_Full_Access (BTR2);
      --  SRAM/NOR-Flash chip-select control register 3
      BCR3  : aliased BCR_Register;
      pragma Volatile_Full_Access (BCR3);
      --  SRAM/NOR-Flash chip-select timing register 3
      BTR3  : aliased BTR_Register;
      pragma Volatile_Full_Access (BTR3);
      --  SRAM/NOR-Flash chip-select control register 4
      BCR4  : aliased BCR_Register;
      pragma Volatile_Full_Access (BCR4);
      --  SRAM/NOR-Flash chip-select timing register 4
      BTR4  : aliased BTR_Register;
      pragma Volatile_Full_Access (BTR4);
      --  PC Card/NAND Flash control register 2
      PCR2  : aliased PCR_Register;
      pragma Volatile_Full_Access (PCR2);
      --  FIFO status and interrupt register 2
      SR2   : aliased SR_Register;
      pragma Volatile_Full_Access (SR2);
      --  Common memory space timing register 2
      PMEM2 : aliased PMEM_Register;
      pragma Volatile_Full_Access (PMEM2);
      --  Attribute memory space timing register 2
      PATT2 : aliased PATT_Register;
      pragma Volatile_Full_Access (PATT2);
      --  ECC result register 2
      ECCR2 : aliased STM32F429x.UInt32;
      --  PC Card/NAND Flash control register 3
      PCR3  : aliased PCR_Register;
      pragma Volatile_Full_Access (PCR3);
      --  FIFO status and interrupt register 3
      SR3   : aliased SR_Register;
      pragma Volatile_Full_Access (SR3);
      --  Common memory space timing register 3
      PMEM3 : aliased PMEM_Register;
      pragma Volatile_Full_Access (PMEM3);
      --  Attribute memory space timing register 3
      PATT3 : aliased PATT_Register;
      pragma Volatile_Full_Access (PATT3);
      --  ECC result register 3
      ECCR3 : aliased STM32F429x.UInt32;
      --  PC Card/NAND Flash control register 4
      PCR4  : aliased PCR_Register;
      pragma Volatile_Full_Access (PCR4);
      --  FIFO status and interrupt register 4
      SR4   : aliased SR_Register;
      pragma Volatile_Full_Access (SR4);
      --  Common memory space timing register 4
      PMEM4 : aliased PMEM_Register;
      pragma Volatile_Full_Access (PMEM4);
      --  Attribute memory space timing register 4
      PATT4 : aliased PATT_Register;
      pragma Volatile_Full_Access (PATT4);
      --  I/O space timing register 4
      PIO4  : aliased PIO4_Register;
      pragma Volatile_Full_Access (PIO4);
      --  SRAM/NOR-Flash write timing registers 1
      BWTR1 : aliased BWTR_Register;
      pragma Volatile_Full_Access (BWTR1);
      --  SRAM/NOR-Flash write timing registers 2
      BWTR2 : aliased BWTR_Register;
      pragma Volatile_Full_Access (BWTR2);
      --  SRAM/NOR-Flash write timing registers 3
      BWTR3 : aliased BWTR_Register;
      pragma Volatile_Full_Access (BWTR3);
      --  SRAM/NOR-Flash write timing registers 4
      BWTR4 : aliased BWTR_Register;
      pragma Volatile_Full_Access (BWTR4);
      --  SDRAM Control Register 1
      SDCR1 : aliased SDCR_Register;
      pragma Volatile_Full_Access (SDCR1);
      --  SDRAM Control Register 2
      SDCR2 : aliased SDCR_Register;
      pragma Volatile_Full_Access (SDCR2);
      --  SDRAM Timing register 1
      SDTR1 : aliased SDTR_Register;
      pragma Volatile_Full_Access (SDTR1);
      --  SDRAM Timing register 2
      SDTR2 : aliased SDTR_Register;
      pragma Volatile_Full_Access (SDTR2);
      --  SDRAM Command Mode register
      SDCMR : aliased SDCMR_Register;
      pragma Volatile_Full_Access (SDCMR);
      --  SDRAM Refresh Timer register
      SDRTR : aliased SDRTR_Register;
      pragma Volatile_Full_Access (SDRTR);
      --  SDRAM Status register
      SDSR  : aliased SDSR_Register;
      pragma Volatile_Full_Access (SDSR);
   end record
     with Volatile;

   for FMC_Peripheral use record
      BCR1  at 16#0# range 0 .. 31;
      BTR1  at 16#4# range 0 .. 31;
      BCR2  at 16#8# range 0 .. 31;
      BTR2  at 16#C# range 0 .. 31;
      BCR3  at 16#10# range 0 .. 31;
      BTR3  at 16#14# range 0 .. 31;
      BCR4  at 16#18# range 0 .. 31;
      BTR4  at 16#1C# range 0 .. 31;
      PCR2  at 16#60# range 0 .. 31;
      SR2   at 16#64# range 0 .. 31;
      PMEM2 at 16#68# range 0 .. 31;
      PATT2 at 16#6C# range 0 .. 31;
      ECCR2 at 16#74# range 0 .. 31;
      PCR3  at 16#80# range 0 .. 31;
      SR3   at 16#84# range 0 .. 31;
      PMEM3 at 16#88# range 0 .. 31;
      PATT3 at 16#8C# range 0 .. 31;
      ECCR3 at 16#94# range 0 .. 31;
      PCR4  at 16#A0# range 0 .. 31;
      SR4   at 16#A4# range 0 .. 31;
      PMEM4 at 16#A8# range 0 .. 31;
      PATT4 at 16#AC# range 0 .. 31;
      PIO4  at 16#B0# range 0 .. 31;
      BWTR1 at 16#104# range 0 .. 31;
      BWTR2 at 16#10C# range 0 .. 31;
      BWTR3 at 16#114# range 0 .. 31;
      BWTR4 at 16#11C# range 0 .. 31;
      SDCR1 at 16#140# range 0 .. 31;
      SDCR2 at 16#144# range 0 .. 31;
      SDTR1 at 16#148# range 0 .. 31;
      SDTR2 at 16#14C# range 0 .. 31;
      SDCMR at 16#150# range 0 .. 31;
      SDRTR at 16#154# range 0 .. 31;
      SDSR  at 16#158# range 0 .. 31;
   end record;

   --  Flexible memory controller
   FMC_Periph : aliased FMC_Peripheral
     with Import, Address => FMC_Base;

end STM32F429x.FSMC;
