pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F40x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F40x.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TR_SU_Field is STM32F40x.UInt4;
   subtype TR_ST_Field is STM32F40x.UInt3;
   subtype TR_MNU_Field is STM32F40x.UInt4;
   subtype TR_MNT_Field is STM32F40x.UInt3;
   subtype TR_HU_Field is STM32F40x.UInt4;
   subtype TR_HT_Field is STM32F40x.UInt2;
   subtype TR_PM_Field is STM32F40x.Bit;

   --  time register
   type TR_Register is record
      --  Second units in BCD format
      SU             : TR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST             : TR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  Minute units in BCD format
      MNU            : TR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT            : TR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32F40x.Bit := 16#0#;
      --  Hour units in BCD format
      HU             : TR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT             : TR_HT_Field := 16#0#;
      --  AM/PM notation
      PM             : TR_PM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : STM32F40x.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype DR_DU_Field is STM32F40x.UInt4;
   subtype DR_DT_Field is STM32F40x.UInt2;
   subtype DR_MU_Field is STM32F40x.UInt4;
   subtype DR_MT_Field is STM32F40x.Bit;
   subtype DR_WDU_Field is STM32F40x.UInt3;
   subtype DR_YU_Field is STM32F40x.UInt4;
   subtype DR_YT_Field is STM32F40x.UInt4;

   --  date register
   type DR_Register is record
      --  Date units in BCD format
      DU             : DR_DU_Field := 16#1#;
      --  Date tens in BCD format
      DT             : DR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : STM32F40x.UInt2 := 16#0#;
      --  Month units in BCD format
      MU             : DR_MU_Field := 16#1#;
      --  Month tens in BCD format
      MT             : DR_MT_Field := 16#0#;
      --  Week day units
      WDU            : DR_WDU_Field := 16#1#;
      --  Year units in BCD format
      YU             : DR_YU_Field := 16#0#;
      --  Year tens in BCD format
      YT             : DR_YT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F40x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      YU             at 0 range 16 .. 19;
      YT             at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CR_WCKSEL_Field is STM32F40x.UInt3;
   subtype CR_TSEDGE_Field is STM32F40x.Bit;
   subtype CR_REFCKON_Field is STM32F40x.Bit;
   subtype CR_FMT_Field is STM32F40x.Bit;
   subtype CR_DCE_Field is STM32F40x.Bit;
   subtype CR_ALRAE_Field is STM32F40x.Bit;
   subtype CR_ALRBE_Field is STM32F40x.Bit;
   subtype CR_WUTE_Field is STM32F40x.Bit;
   subtype CR_TSE_Field is STM32F40x.Bit;
   subtype CR_ALRAIE_Field is STM32F40x.Bit;
   subtype CR_ALRBIE_Field is STM32F40x.Bit;
   subtype CR_WUTIE_Field is STM32F40x.Bit;
   subtype CR_TSIE_Field is STM32F40x.Bit;
   subtype CR_ADD1H_Field is STM32F40x.Bit;
   subtype CR_SUB1H_Field is STM32F40x.Bit;
   subtype CR_BKP_Field is STM32F40x.Bit;
   subtype CR_POL_Field is STM32F40x.Bit;
   subtype CR_OSEL_Field is STM32F40x.UInt2;
   subtype CR_COE_Field is STM32F40x.Bit;

   --  control register
   type CR_Register is record
      --  Wakeup clock selection
      WCKSEL         : CR_WCKSEL_Field := 16#0#;
      --  Time-stamp event active edge
      TSEDGE         : CR_TSEDGE_Field := 16#0#;
      --  Reference clock detection enable (50 or 60 Hz)
      REFCKON        : CR_REFCKON_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32F40x.Bit := 16#0#;
      --  Hour format
      FMT            : CR_FMT_Field := 16#0#;
      --  Coarse digital calibration enable
      DCE            : CR_DCE_Field := 16#0#;
      --  Alarm A enable
      ALRAE          : CR_ALRAE_Field := 16#0#;
      --  Alarm B enable
      ALRBE          : CR_ALRBE_Field := 16#0#;
      --  Wakeup timer enable
      WUTE           : CR_WUTE_Field := 16#0#;
      --  Time stamp enable
      TSE            : CR_TSE_Field := 16#0#;
      --  Alarm A interrupt enable
      ALRAIE         : CR_ALRAIE_Field := 16#0#;
      --  Alarm B interrupt enable
      ALRBIE         : CR_ALRBIE_Field := 16#0#;
      --  Wakeup timer interrupt enable
      WUTIE          : CR_WUTIE_Field := 16#0#;
      --  Time-stamp interrupt enable
      TSIE           : CR_TSIE_Field := 16#0#;
      --  Add 1 hour (summer time change)
      ADD1H          : CR_ADD1H_Field := 16#0#;
      --  Subtract 1 hour (winter time change)
      SUB1H          : CR_SUB1H_Field := 16#0#;
      --  Backup
      BKP            : CR_BKP_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : STM32F40x.Bit := 16#0#;
      --  Output polarity
      POL            : CR_POL_Field := 16#0#;
      --  Output selection
      OSEL           : CR_OSEL_Field := 16#0#;
      --  Calibration output enable
      COE            : CR_COE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F40x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      WCKSEL         at 0 range 0 .. 2;
      TSEDGE         at 0 range 3 .. 3;
      REFCKON        at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      FMT            at 0 range 6 .. 6;
      DCE            at 0 range 7 .. 7;
      ALRAE          at 0 range 8 .. 8;
      ALRBE          at 0 range 9 .. 9;
      WUTE           at 0 range 10 .. 10;
      TSE            at 0 range 11 .. 11;
      ALRAIE         at 0 range 12 .. 12;
      ALRBIE         at 0 range 13 .. 13;
      WUTIE          at 0 range 14 .. 14;
      TSIE           at 0 range 15 .. 15;
      ADD1H          at 0 range 16 .. 16;
      SUB1H          at 0 range 17 .. 17;
      BKP            at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      POL            at 0 range 20 .. 20;
      OSEL           at 0 range 21 .. 22;
      COE            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype ISR_ALRAWF_Field is STM32F40x.Bit;
   subtype ISR_ALRBWF_Field is STM32F40x.Bit;
   subtype ISR_WUTWF_Field is STM32F40x.Bit;
   subtype ISR_SHPF_Field is STM32F40x.Bit;
   subtype ISR_INITS_Field is STM32F40x.Bit;
   subtype ISR_RSF_Field is STM32F40x.Bit;
   subtype ISR_INITF_Field is STM32F40x.Bit;
   subtype ISR_INIT_Field is STM32F40x.Bit;
   subtype ISR_ALRAF_Field is STM32F40x.Bit;
   subtype ISR_ALRBF_Field is STM32F40x.Bit;
   subtype ISR_WUTF_Field is STM32F40x.Bit;
   subtype ISR_TSF_Field is STM32F40x.Bit;
   subtype ISR_TSOVF_Field is STM32F40x.Bit;
   subtype ISR_TAMP1F_Field is STM32F40x.Bit;
   subtype ISR_TAMP2F_Field is STM32F40x.Bit;
   subtype ISR_RECALPF_Field is STM32F40x.Bit;

   --  initialization and status register
   type ISR_Register is record
      --  Read-only. Alarm A write flag
      ALRAWF         : ISR_ALRAWF_Field := 16#1#;
      --  Read-only. Alarm B write flag
      ALRBWF         : ISR_ALRBWF_Field := 16#1#;
      --  Read-only. Wakeup timer write flag
      WUTWF          : ISR_WUTWF_Field := 16#1#;
      --  Shift operation pending
      SHPF           : ISR_SHPF_Field := 16#0#;
      --  Read-only. Initialization status flag
      INITS          : ISR_INITS_Field := 16#0#;
      --  Registers synchronization flag
      RSF            : ISR_RSF_Field := 16#0#;
      --  Read-only. Initialization flag
      INITF          : ISR_INITF_Field := 16#0#;
      --  Initialization mode
      INIT           : ISR_INIT_Field := 16#0#;
      --  Alarm A flag
      ALRAF          : ISR_ALRAF_Field := 16#0#;
      --  Alarm B flag
      ALRBF          : ISR_ALRBF_Field := 16#0#;
      --  Wakeup timer flag
      WUTF           : ISR_WUTF_Field := 16#0#;
      --  Time-stamp flag
      TSF            : ISR_TSF_Field := 16#0#;
      --  Time-stamp overflow flag
      TSOVF          : ISR_TSOVF_Field := 16#0#;
      --  Tamper detection flag
      TAMP1F         : ISR_TAMP1F_Field := 16#0#;
      --  TAMPER2 detection flag
      TAMP2F         : ISR_TAMP2F_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32F40x.Bit := 16#0#;
      --  Read-only. Recalibration pending Flag
      RECALPF        : ISR_RECALPF_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32F40x.UInt15 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ALRAWF         at 0 range 0 .. 0;
      ALRBWF         at 0 range 1 .. 1;
      WUTWF          at 0 range 2 .. 2;
      SHPF           at 0 range 3 .. 3;
      INITS          at 0 range 4 .. 4;
      RSF            at 0 range 5 .. 5;
      INITF          at 0 range 6 .. 6;
      INIT           at 0 range 7 .. 7;
      ALRAF          at 0 range 8 .. 8;
      ALRBF          at 0 range 9 .. 9;
      WUTF           at 0 range 10 .. 10;
      TSF            at 0 range 11 .. 11;
      TSOVF          at 0 range 12 .. 12;
      TAMP1F         at 0 range 13 .. 13;
      TAMP2F         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      RECALPF        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype PRER_PREDIV_S_Field is STM32F40x.UInt15;
   subtype PRER_PREDIV_A_Field is STM32F40x.UInt7;

   --  prescaler register
   type PRER_Register is record
      --  Synchronous prescaler factor
      PREDIV_S       : PRER_PREDIV_S_Field := 16#FF#;
      --  unspecified
      Reserved_15_15 : STM32F40x.Bit := 16#0#;
      --  Asynchronous prescaler factor
      PREDIV_A       : PRER_PREDIV_A_Field := 16#7F#;
      --  unspecified
      Reserved_23_31 : STM32F40x.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      PREDIV_S       at 0 range 0 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WUTR_WUT_Field is STM32F40x.UInt16;

   --  wakeup timer register
   type WUTR_Register is record
      --  Wakeup auto-reload value bits
      WUT            : WUTR_WUT_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WUTR_Register use record
      WUT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALIBR_DC_Field is STM32F40x.UInt5;
   subtype CALIBR_DCS_Field is STM32F40x.Bit;

   --  calibration register
   type CALIBR_Register is record
      --  Digital calibration
      DC            : CALIBR_DC_Field := 16#0#;
      --  unspecified
      Reserved_5_6  : STM32F40x.UInt2 := 16#0#;
      --  Digital calibration sign
      DCS           : CALIBR_DCS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32F40x.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CALIBR_Register use record
      DC            at 0 range 0 .. 4;
      Reserved_5_6  at 0 range 5 .. 6;
      DCS           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ALRMAR_SU_Field is STM32F40x.UInt4;
   subtype ALRMAR_ST_Field is STM32F40x.UInt3;
   subtype ALRMAR_MSK1_Field is STM32F40x.Bit;
   subtype ALRMAR_MNU_Field is STM32F40x.UInt4;
   subtype ALRMAR_MNT_Field is STM32F40x.UInt3;
   subtype ALRMAR_MSK2_Field is STM32F40x.Bit;
   subtype ALRMAR_HU_Field is STM32F40x.UInt4;
   subtype ALRMAR_HT_Field is STM32F40x.UInt2;
   subtype ALRMAR_PM_Field is STM32F40x.Bit;
   subtype ALRMAR_MSK3_Field is STM32F40x.Bit;
   subtype ALRMAR_DU_Field is STM32F40x.UInt4;
   subtype ALRMAR_DT_Field is STM32F40x.UInt2;
   subtype ALRMAR_WDSEL_Field is STM32F40x.Bit;
   subtype ALRMAR_MSK4_Field is STM32F40x.Bit;

   --  alarm A register
   type ALRMAR_Register is record
      --  Second units in BCD format
      SU    : ALRMAR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST    : ALRMAR_ST_Field := 16#0#;
      --  Alarm A seconds mask
      MSK1  : ALRMAR_MSK1_Field := 16#0#;
      --  Minute units in BCD format
      MNU   : ALRMAR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT   : ALRMAR_MNT_Field := 16#0#;
      --  Alarm A minutes mask
      MSK2  : ALRMAR_MSK2_Field := 16#0#;
      --  Hour units in BCD format
      HU    : ALRMAR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT    : ALRMAR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : ALRMAR_PM_Field := 16#0#;
      --  Alarm A hours mask
      MSK3  : ALRMAR_MSK3_Field := 16#0#;
      --  Date units or day in BCD format
      DU    : ALRMAR_DU_Field := 16#0#;
      --  Date tens in BCD format
      DT    : ALRMAR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : ALRMAR_WDSEL_Field := 16#0#;
      --  Alarm A date mask
      MSK4  : ALRMAR_MSK4_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ALRMAR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype ALRMBR_SU_Field is STM32F40x.UInt4;
   subtype ALRMBR_ST_Field is STM32F40x.UInt3;
   subtype ALRMBR_MSK1_Field is STM32F40x.Bit;
   subtype ALRMBR_MNU_Field is STM32F40x.UInt4;
   subtype ALRMBR_MNT_Field is STM32F40x.UInt3;
   subtype ALRMBR_MSK2_Field is STM32F40x.Bit;
   subtype ALRMBR_HU_Field is STM32F40x.UInt4;
   subtype ALRMBR_HT_Field is STM32F40x.UInt2;
   subtype ALRMBR_PM_Field is STM32F40x.Bit;
   subtype ALRMBR_MSK3_Field is STM32F40x.Bit;
   subtype ALRMBR_DU_Field is STM32F40x.UInt4;
   subtype ALRMBR_DT_Field is STM32F40x.UInt2;
   subtype ALRMBR_WDSEL_Field is STM32F40x.Bit;
   subtype ALRMBR_MSK4_Field is STM32F40x.Bit;

   --  alarm B register
   type ALRMBR_Register is record
      --  Second units in BCD format
      SU    : ALRMBR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST    : ALRMBR_ST_Field := 16#0#;
      --  Alarm B seconds mask
      MSK1  : ALRMBR_MSK1_Field := 16#0#;
      --  Minute units in BCD format
      MNU   : ALRMBR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT   : ALRMBR_MNT_Field := 16#0#;
      --  Alarm B minutes mask
      MSK2  : ALRMBR_MSK2_Field := 16#0#;
      --  Hour units in BCD format
      HU    : ALRMBR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT    : ALRMBR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : ALRMBR_PM_Field := 16#0#;
      --  Alarm B hours mask
      MSK3  : ALRMBR_MSK3_Field := 16#0#;
      --  Date units or day in BCD format
      DU    : ALRMBR_DU_Field := 16#0#;
      --  Date tens in BCD format
      DT    : ALRMBR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : ALRMBR_WDSEL_Field := 16#0#;
      --  Alarm B date mask
      MSK4  : ALRMBR_MSK4_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ALRMBR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype WPR_KEY_Field is STM32F40x.Byte;

   --  write protection register
   type WPR_Register is record
      --  Write-only. Write protection key
      KEY           : WPR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32F40x.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSR_SS_Field is STM32F40x.UInt16;

   --  sub second register
   type SSR_Register is record
      --  Read-only. Sub second value
      SS             : SSR_SS_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SHIFTR_SUBFS_Field is STM32F40x.UInt15;
   subtype SHIFTR_ADD1S_Field is STM32F40x.Bit;

   --  shift control register
   type SHIFTR_Register is record
      --  Write-only. Subtract a fraction of a second
      SUBFS          : SHIFTR_SUBFS_Field := 16#0#;
      --  unspecified
      Reserved_15_30 : STM32F40x.UInt16 := 16#0#;
      --  Write-only. Add one second
      ADD1S          : SHIFTR_ADD1S_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   subtype TSTR_TAMP1E_Field is STM32F40x.Bit;
   subtype TSTR_TAMP1TRG_Field is STM32F40x.Bit;
   subtype TSTR_TAMPIE_Field is STM32F40x.Bit;
   subtype TSTR_TAMP1INSEL_Field is STM32F40x.Bit;
   subtype TSTR_TSINSEL_Field is STM32F40x.Bit;
   subtype TSTR_ALARMOUTTYPE_Field is STM32F40x.Bit;

   --  time stamp time register
   type TSTR_Register is record
      --  Read-only. Tamper 1 detection enable
      TAMP1E         : TSTR_TAMP1E_Field;
      --  Read-only. Active level for tamper 1
      TAMP1TRG       : TSTR_TAMP1TRG_Field;
      --  Read-only. Tamper interrupt enable
      TAMPIE         : TSTR_TAMPIE_Field;
      --  unspecified
      Reserved_3_15  : STM32F40x.UInt13;
      --  Read-only. TAMPER1 mapping
      TAMP1INSEL     : TSTR_TAMP1INSEL_Field;
      --  Read-only. TIMESTAMP mapping
      TSINSEL        : TSTR_TSINSEL_Field;
      --  Read-only. AFO_ALARM output type
      ALARMOUTTYPE   : TSTR_ALARMOUTTYPE_Field;
      --  unspecified
      Reserved_19_31 : STM32F40x.UInt13;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TSTR_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP1TRG       at 0 range 1 .. 1;
      TAMPIE         at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      TAMP1INSEL     at 0 range 16 .. 16;
      TSINSEL        at 0 range 17 .. 17;
      ALARMOUTTYPE   at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype TSDR_DU_Field is STM32F40x.UInt4;
   subtype TSDR_DT_Field is STM32F40x.UInt2;
   subtype TSDR_MU_Field is STM32F40x.UInt4;
   subtype TSDR_MT_Field is STM32F40x.Bit;
   subtype TSDR_WDU_Field is STM32F40x.UInt3;

   --  time stamp date register
   type TSDR_Register is record
      --  Read-only. Date units in BCD format
      DU             : TSDR_DU_Field;
      --  Read-only. Date tens in BCD format
      DT             : TSDR_DT_Field;
      --  unspecified
      Reserved_6_7   : STM32F40x.UInt2;
      --  Read-only. Month units in BCD format
      MU             : TSDR_MU_Field;
      --  Read-only. Month tens in BCD format
      MT             : TSDR_MT_Field;
      --  Read-only. Week day units
      WDU            : TSDR_WDU_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TSDR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TSSSR_SS_Field is STM32F40x.UInt16;

   --  timestamp sub second register
   type TSSSR_Register is record
      --  Read-only. Sub second value
      SS             : TSSSR_SS_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALR_CALM_Field is STM32F40x.UInt9;
   subtype CALR_CALW16_Field is STM32F40x.Bit;
   subtype CALR_CALW8_Field is STM32F40x.Bit;
   subtype CALR_CALP_Field is STM32F40x.Bit;

   --  calibration register
   type CALR_Register is record
      --  Calibration minus
      CALM           : CALR_CALM_Field := 16#0#;
      --  unspecified
      Reserved_9_12  : STM32F40x.UInt4 := 16#0#;
      --  Use a 16-second calibration cycle period
      CALW16         : CALR_CALW16_Field := 16#0#;
      --  Use an 8-second calibration cycle period
      CALW8          : CALR_CALW8_Field := 16#0#;
      --  Increase frequency of RTC by 488.5 ppm
      CALP           : CALR_CALP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CALM           at 0 range 0 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      CALW16         at 0 range 13 .. 13;
      CALW8          at 0 range 14 .. 14;
      CALP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TAFCR_TAMP1E_Field is STM32F40x.Bit;
   subtype TAFCR_TAMP1TRG_Field is STM32F40x.Bit;
   subtype TAFCR_TAMPIE_Field is STM32F40x.Bit;
   subtype TAFCR_TAMP2E_Field is STM32F40x.Bit;
   subtype TAFCR_TAMP2TRG_Field is STM32F40x.Bit;
   subtype TAFCR_TAMPTS_Field is STM32F40x.Bit;
   subtype TAFCR_TAMPFREQ_Field is STM32F40x.UInt3;
   subtype TAFCR_TAMPFLT_Field is STM32F40x.UInt2;
   subtype TAFCR_TAMPPRCH_Field is STM32F40x.UInt2;
   subtype TAFCR_TAMPPUDIS_Field is STM32F40x.Bit;
   subtype TAFCR_TAMP1INSEL_Field is STM32F40x.Bit;
   subtype TAFCR_TSINSEL_Field is STM32F40x.Bit;
   subtype TAFCR_ALARMOUTTYPE_Field is STM32F40x.Bit;

   --  tamper and alternate function configuration register
   type TAFCR_Register is record
      --  Tamper 1 detection enable
      TAMP1E         : TAFCR_TAMP1E_Field := 16#0#;
      --  Active level for tamper 1
      TAMP1TRG       : TAFCR_TAMP1TRG_Field := 16#0#;
      --  Tamper interrupt enable
      TAMPIE         : TAFCR_TAMPIE_Field := 16#0#;
      --  Tamper 2 detection enable
      TAMP2E         : TAFCR_TAMP2E_Field := 16#0#;
      --  Active level for tamper 2
      TAMP2TRG       : TAFCR_TAMP2TRG_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : STM32F40x.UInt2 := 16#0#;
      --  Activate timestamp on tamper detection event
      TAMPTS         : TAFCR_TAMPTS_Field := 16#0#;
      --  Tamper sampling frequency
      TAMPFREQ       : TAFCR_TAMPFREQ_Field := 16#0#;
      --  Tamper filter count
      TAMPFLT        : TAFCR_TAMPFLT_Field := 16#0#;
      --  Tamper precharge duration
      TAMPPRCH       : TAFCR_TAMPPRCH_Field := 16#0#;
      --  TAMPER pull-up disable
      TAMPPUDIS      : TAFCR_TAMPPUDIS_Field := 16#0#;
      --  TAMPER1 mapping
      TAMP1INSEL     : TAFCR_TAMP1INSEL_Field := 16#0#;
      --  TIMESTAMP mapping
      TSINSEL        : TAFCR_TSINSEL_Field := 16#0#;
      --  AFO_ALARM output type
      ALARMOUTTYPE   : TAFCR_ALARMOUTTYPE_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : STM32F40x.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TAFCR_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP1TRG       at 0 range 1 .. 1;
      TAMPIE         at 0 range 2 .. 2;
      TAMP2E         at 0 range 3 .. 3;
      TAMP2TRG       at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      TAMPTS         at 0 range 7 .. 7;
      TAMPFREQ       at 0 range 8 .. 10;
      TAMPFLT        at 0 range 11 .. 12;
      TAMPPRCH       at 0 range 13 .. 14;
      TAMPPUDIS      at 0 range 15 .. 15;
      TAMP1INSEL     at 0 range 16 .. 16;
      TSINSEL        at 0 range 17 .. 17;
      ALARMOUTTYPE   at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype ALRMASSR_SS_Field is STM32F40x.UInt15;
   subtype ALRMASSR_MASKSS_Field is STM32F40x.UInt4;

   --  alarm A sub second register
   type ALRMASSR_Register is record
      --  Sub seconds value
      SS             : ALRMASSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : STM32F40x.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : ALRMASSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F40x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ALRMBSSR_SS_Field is STM32F40x.UInt15;
   subtype ALRMBSSR_MASKSS_Field is STM32F40x.UInt4;

   --  alarm B sub second register
   type ALRMBSSR_Register is record
      --  Sub seconds value
      SS             : ALRMBSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : STM32F40x.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : ALRMBSSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F40x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ALRMBSSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Real-time clock
   type RTC_Peripheral is record
      --  time register
      TR       : aliased TR_Register;
      pragma Volatile_Full_Access (TR);
      --  date register
      DR       : aliased DR_Register;
      pragma Volatile_Full_Access (DR);
      --  control register
      CR       : aliased CR_Register;
      pragma Volatile_Full_Access (CR);
      --  initialization and status register
      ISR      : aliased ISR_Register;
      pragma Volatile_Full_Access (ISR);
      --  prescaler register
      PRER     : aliased PRER_Register;
      pragma Volatile_Full_Access (PRER);
      --  wakeup timer register
      WUTR     : aliased WUTR_Register;
      pragma Volatile_Full_Access (WUTR);
      --  calibration register
      CALIBR   : aliased CALIBR_Register;
      pragma Volatile_Full_Access (CALIBR);
      --  alarm A register
      ALRMAR   : aliased ALRMAR_Register;
      pragma Volatile_Full_Access (ALRMAR);
      --  alarm B register
      ALRMBR   : aliased ALRMBR_Register;
      pragma Volatile_Full_Access (ALRMBR);
      --  write protection register
      WPR      : aliased WPR_Register;
      pragma Volatile_Full_Access (WPR);
      --  sub second register
      SSR      : aliased SSR_Register;
      pragma Volatile_Full_Access (SSR);
      --  shift control register
      SHIFTR   : aliased SHIFTR_Register;
      pragma Volatile_Full_Access (SHIFTR);
      --  time stamp time register
      TSTR     : aliased TSTR_Register;
      pragma Volatile_Full_Access (TSTR);
      --  time stamp date register
      TSDR     : aliased TSDR_Register;
      pragma Volatile_Full_Access (TSDR);
      --  timestamp sub second register
      TSSSR    : aliased TSSSR_Register;
      pragma Volatile_Full_Access (TSSSR);
      --  calibration register
      CALR     : aliased CALR_Register;
      pragma Volatile_Full_Access (CALR);
      --  tamper and alternate function configuration register
      TAFCR    : aliased TAFCR_Register;
      pragma Volatile_Full_Access (TAFCR);
      --  alarm A sub second register
      ALRMASSR : aliased ALRMASSR_Register;
      pragma Volatile_Full_Access (ALRMASSR);
      --  alarm B sub second register
      ALRMBSSR : aliased ALRMBSSR_Register;
      pragma Volatile_Full_Access (ALRMBSSR);
      --  backup register
      BKP0R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP1R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP2R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP3R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP4R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP5R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP6R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP7R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP8R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP9R    : aliased STM32F40x.UInt32;
      --  backup register
      BKP10R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP11R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP12R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP13R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP14R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP15R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP16R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP17R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP18R   : aliased STM32F40x.UInt32;
      --  backup register
      BKP19R   : aliased STM32F40x.UInt32;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TR       at 16#0# range 0 .. 31;
      DR       at 16#4# range 0 .. 31;
      CR       at 16#8# range 0 .. 31;
      ISR      at 16#C# range 0 .. 31;
      PRER     at 16#10# range 0 .. 31;
      WUTR     at 16#14# range 0 .. 31;
      CALIBR   at 16#18# range 0 .. 31;
      ALRMAR   at 16#1C# range 0 .. 31;
      ALRMBR   at 16#20# range 0 .. 31;
      WPR      at 16#24# range 0 .. 31;
      SSR      at 16#28# range 0 .. 31;
      SHIFTR   at 16#2C# range 0 .. 31;
      TSTR     at 16#30# range 0 .. 31;
      TSDR     at 16#34# range 0 .. 31;
      TSSSR    at 16#38# range 0 .. 31;
      CALR     at 16#3C# range 0 .. 31;
      TAFCR    at 16#40# range 0 .. 31;
      ALRMASSR at 16#44# range 0 .. 31;
      ALRMBSSR at 16#48# range 0 .. 31;
      BKP0R    at 16#50# range 0 .. 31;
      BKP1R    at 16#54# range 0 .. 31;
      BKP2R    at 16#58# range 0 .. 31;
      BKP3R    at 16#5C# range 0 .. 31;
      BKP4R    at 16#60# range 0 .. 31;
      BKP5R    at 16#64# range 0 .. 31;
      BKP6R    at 16#68# range 0 .. 31;
      BKP7R    at 16#6C# range 0 .. 31;
      BKP8R    at 16#70# range 0 .. 31;
      BKP9R    at 16#74# range 0 .. 31;
      BKP10R   at 16#78# range 0 .. 31;
      BKP11R   at 16#7C# range 0 .. 31;
      BKP12R   at 16#80# range 0 .. 31;
      BKP13R   at 16#84# range 0 .. 31;
      BKP14R   at 16#88# range 0 .. 31;
      BKP15R   at 16#8C# range 0 .. 31;
      BKP16R   at 16#90# range 0 .. 31;
      BKP17R   at 16#94# range 0 .. 31;
      BKP18R   at 16#98# range 0 .. 31;
      BKP19R   at 16#9C# range 0 .. 31;
   end record;

   --  Real-time clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end STM32F40x.RTC;
