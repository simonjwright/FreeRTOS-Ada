pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package ATSAM3X8E.SYSC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  General Purpose Backup Register
   subtype RSTC_CR_PROCRST_Field is ATSAM3X8E.Bit;
   subtype RSTC_CR_PERRST_Field is ATSAM3X8E.Bit;
   subtype RSTC_CR_EXTRST_Field is ATSAM3X8E.Bit;
   subtype RSTC_CR_KEY_Field is ATSAM3X8E.Byte;

   --  Control Register
   type RSTC_CR_Register is record
      --  Write-only. Processor Reset
      PROCRST       : RSTC_CR_PROCRST_Field := 16#0#;
      --  unspecified
      Reserved_1_1  : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Peripheral Reset
      PERRST        : RSTC_CR_PERRST_Field := 16#0#;
      --  Write-only. External Reset
      EXTRST        : RSTC_CR_EXTRST_Field := 16#0#;
      --  unspecified
      Reserved_4_23 : ATSAM3X8E.UInt20 := 16#0#;
      --  Write-only. System Reset Key
      KEY           : RSTC_CR_KEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RSTC_CR_Register use record
      PROCRST       at 0 range 0 .. 0;
      Reserved_1_1  at 0 range 1 .. 1;
      PERRST        at 0 range 2 .. 2;
      EXTRST        at 0 range 3 .. 3;
      Reserved_4_23 at 0 range 4 .. 23;
      KEY           at 0 range 24 .. 31;
   end record;

   subtype RSTC_SR_URSTS_Field is ATSAM3X8E.Bit;
   subtype RSTC_SR_RSTTYP_Field is ATSAM3X8E.UInt3;
   subtype RSTC_SR_NRSTL_Field is ATSAM3X8E.Bit;
   subtype RSTC_SR_SRCMP_Field is ATSAM3X8E.Bit;

   --  Status Register
   type RSTC_SR_Register is record
      --  Read-only. User Reset Status
      URSTS          : RSTC_SR_URSTS_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Reset Type
      RSTTYP         : RSTC_SR_RSTTYP_Field;
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5;
      --  Read-only. NRST Pin Level
      NRSTL          : RSTC_SR_NRSTL_Field;
      --  Read-only. Software Reset Command in Progress
      SRCMP          : RSTC_SR_SRCMP_Field;
      --  unspecified
      Reserved_18_31 : ATSAM3X8E.UInt14;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RSTC_SR_Register use record
      URSTS          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      RSTTYP         at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      NRSTL          at 0 range 16 .. 16;
      SRCMP          at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype RSTC_MR_URSTEN_Field is ATSAM3X8E.Bit;
   subtype RSTC_MR_URSTIEN_Field is ATSAM3X8E.Bit;
   subtype RSTC_MR_ERSTL_Field is ATSAM3X8E.UInt4;
   subtype RSTC_MR_KEY_Field is ATSAM3X8E.Byte;

   --  Mode Register
   type RSTC_MR_Register is record
      --  User Reset Enable
      URSTEN         : RSTC_MR_URSTEN_Field := 16#1#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  User Reset Interrupt Enable
      URSTIEN        : RSTC_MR_URSTIEN_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  External Reset Length
      ERSTL          : RSTC_MR_ERSTL_Field := 16#0#;
      --  unspecified
      Reserved_12_23 : ATSAM3X8E.UInt12 := 16#0#;
      --  Password
      KEY            : RSTC_MR_KEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RSTC_MR_Register use record
      URSTEN         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      URSTIEN        at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      ERSTL          at 0 range 8 .. 11;
      Reserved_12_23 at 0 range 12 .. 23;
      KEY            at 0 range 24 .. 31;
   end record;

   subtype RTC_CR_UPDTIM_Field is ATSAM3X8E.Bit;
   subtype RTC_CR_UPDCAL_Field is ATSAM3X8E.Bit;

   --  Time Event Selection
   type CR_TIMEVSEL_Field is
     (--  Minute change
      MINUTE,
      --  Hour change
      HOUR,
      --  Every day at midnight
      MIDNIGHT,
      --  Every day at noon
      NOON)
     with Size => 2;
   for CR_TIMEVSEL_Field use
     (MINUTE => 0,
      HOUR => 1,
      MIDNIGHT => 2,
      NOON => 3);

   --  Calendar Event Selection
   type CR_CALEVSEL_Field is
     (--  Week change (every Monday at time 00:00:00)
      WEEK,
      --  Month change (every 01 of each month at time 00:00:00)
      MONTH,
      --  Year change (every January 1 at time 00:00:00)
      YEAR)
     with Size => 2;
   for CR_CALEVSEL_Field use
     (WEEK => 0,
      MONTH => 1,
      YEAR => 2);

   --  Control Register
   type RTC_CR_Register is record
      --  Update Request Time Register
      UPDTIM         : RTC_CR_UPDTIM_Field := 16#0#;
      --  Update Request Calendar Register
      UPDCAL         : RTC_CR_UPDCAL_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Time Event Selection
      TIMEVSEL       : CR_TIMEVSEL_Field := ATSAM3X8E.SYSC.MINUTE;
      --  unspecified
      Reserved_10_15 : ATSAM3X8E.UInt6 := 16#0#;
      --  Calendar Event Selection
      CALEVSEL       : CR_CALEVSEL_Field := ATSAM3X8E.SYSC.WEEK;
      --  unspecified
      Reserved_18_31 : ATSAM3X8E.UInt14 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_CR_Register use record
      UPDTIM         at 0 range 0 .. 0;
      UPDCAL         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TIMEVSEL       at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      CALEVSEL       at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype RTC_MR_HRMOD_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type RTC_MR_Register is record
      --  12-/24-hour Mode
      HRMOD         : RTC_MR_HRMOD_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_MR_Register use record
      HRMOD         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype RTC_TIMR_SEC_Field is ATSAM3X8E.UInt7;
   subtype RTC_TIMR_MIN_Field is ATSAM3X8E.UInt7;
   subtype RTC_TIMR_HOUR_Field is ATSAM3X8E.UInt6;
   subtype RTC_TIMR_AMPM_Field is ATSAM3X8E.Bit;

   --  Time Register
   type RTC_TIMR_Register is record
      --  Current Second
      SEC            : RTC_TIMR_SEC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Current Minute
      MIN            : RTC_TIMR_MIN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit := 16#0#;
      --  Current Hour
      HOUR           : RTC_TIMR_HOUR_Field := 16#0#;
      --  Ante Meridiem Post Meridiem Indicator
      AMPM           : RTC_TIMR_AMPM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_TIMR_Register use record
      SEC            at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MIN            at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HOUR           at 0 range 16 .. 21;
      AMPM           at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype RTC_CALR_CENT_Field is ATSAM3X8E.UInt7;
   subtype RTC_CALR_YEAR_Field is ATSAM3X8E.Byte;
   subtype RTC_CALR_MONTH_Field is ATSAM3X8E.UInt5;
   subtype RTC_CALR_DAY_Field is ATSAM3X8E.UInt3;
   subtype RTC_CALR_DATE_Field is ATSAM3X8E.UInt6;

   --  Calendar Register
   type RTC_CALR_Register is record
      --  Current Century
      CENT           : RTC_CALR_CENT_Field := 16#20#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Current Year
      YEAR           : RTC_CALR_YEAR_Field := 16#7#;
      --  Current Month
      MONTH          : RTC_CALR_MONTH_Field := 16#1#;
      --  Current Day in Current Week
      DAY            : RTC_CALR_DAY_Field := 16#1#;
      --  Current Day in Current Month
      DATE           : RTC_CALR_DATE_Field := 16#1#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_CALR_Register use record
      CENT           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      YEAR           at 0 range 8 .. 15;
      MONTH          at 0 range 16 .. 20;
      DAY            at 0 range 21 .. 23;
      DATE           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype RTC_TIMALR_SEC_Field is ATSAM3X8E.UInt7;
   subtype RTC_TIMALR_SECEN_Field is ATSAM3X8E.Bit;
   subtype RTC_TIMALR_MIN_Field is ATSAM3X8E.UInt7;
   subtype RTC_TIMALR_MINEN_Field is ATSAM3X8E.Bit;
   subtype RTC_TIMALR_HOUR_Field is ATSAM3X8E.UInt6;
   subtype RTC_TIMALR_AMPM_Field is ATSAM3X8E.Bit;
   subtype RTC_TIMALR_HOUREN_Field is ATSAM3X8E.Bit;

   --  Time Alarm Register
   type RTC_TIMALR_Register is record
      --  Second Alarm
      SEC            : RTC_TIMALR_SEC_Field := 16#0#;
      --  Second Alarm Enable
      SECEN          : RTC_TIMALR_SECEN_Field := 16#0#;
      --  Minute Alarm
      MIN            : RTC_TIMALR_MIN_Field := 16#0#;
      --  Minute Alarm Enable
      MINEN          : RTC_TIMALR_MINEN_Field := 16#0#;
      --  Hour Alarm
      HOUR           : RTC_TIMALR_HOUR_Field := 16#0#;
      --  AM/PM Indicator
      AMPM           : RTC_TIMALR_AMPM_Field := 16#0#;
      --  Hour Alarm Enable
      HOUREN         : RTC_TIMALR_HOUREN_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_TIMALR_Register use record
      SEC            at 0 range 0 .. 6;
      SECEN          at 0 range 7 .. 7;
      MIN            at 0 range 8 .. 14;
      MINEN          at 0 range 15 .. 15;
      HOUR           at 0 range 16 .. 21;
      AMPM           at 0 range 22 .. 22;
      HOUREN         at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype RTC_CALALR_MONTH_Field is ATSAM3X8E.UInt5;
   subtype RTC_CALALR_MTHEN_Field is ATSAM3X8E.Bit;
   subtype RTC_CALALR_DATE_Field is ATSAM3X8E.UInt6;
   subtype RTC_CALALR_DATEEN_Field is ATSAM3X8E.Bit;

   --  Calendar Alarm Register
   type RTC_CALALR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.UInt16 := 16#0#;
      --  Month Alarm
      MONTH          : RTC_CALALR_MONTH_Field := 16#1#;
      --  unspecified
      Reserved_21_22 : ATSAM3X8E.UInt2 := 16#0#;
      --  Month Alarm Enable
      MTHEN          : RTC_CALALR_MTHEN_Field := 16#0#;
      --  Date Alarm
      DATE           : RTC_CALALR_DATE_Field := 16#1#;
      --  unspecified
      Reserved_30_30 : ATSAM3X8E.Bit := 16#0#;
      --  Date Alarm Enable
      DATEEN         : RTC_CALALR_DATEEN_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_CALALR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      MONTH          at 0 range 16 .. 20;
      Reserved_21_22 at 0 range 21 .. 22;
      MTHEN          at 0 range 23 .. 23;
      DATE           at 0 range 24 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      DATEEN         at 0 range 31 .. 31;
   end record;

   subtype RTC_SR_ACKUPD_Field is ATSAM3X8E.Bit;
   subtype RTC_SR_ALARM_Field is ATSAM3X8E.Bit;
   subtype RTC_SR_SEC_Field is ATSAM3X8E.Bit;
   subtype RTC_SR_TIMEV_Field is ATSAM3X8E.Bit;
   subtype RTC_SR_CALEV_Field is ATSAM3X8E.Bit;

   --  Status Register
   type RTC_SR_Register is record
      --  Read-only. Acknowledge for Update
      ACKUPD        : RTC_SR_ACKUPD_Field;
      --  Read-only. Alarm Flag
      ALARM         : RTC_SR_ALARM_Field;
      --  Read-only. Second Event
      SEC           : RTC_SR_SEC_Field;
      --  Read-only. Time Event
      TIMEV         : RTC_SR_TIMEV_Field;
      --  Read-only. Calendar Event
      CALEV         : RTC_SR_CALEV_Field;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_SR_Register use record
      ACKUPD        at 0 range 0 .. 0;
      ALARM         at 0 range 1 .. 1;
      SEC           at 0 range 2 .. 2;
      TIMEV         at 0 range 3 .. 3;
      CALEV         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype RTC_SCCR_ACKCLR_Field is ATSAM3X8E.Bit;
   subtype RTC_SCCR_ALRCLR_Field is ATSAM3X8E.Bit;
   subtype RTC_SCCR_SECCLR_Field is ATSAM3X8E.Bit;
   subtype RTC_SCCR_TIMCLR_Field is ATSAM3X8E.Bit;
   subtype RTC_SCCR_CALCLR_Field is ATSAM3X8E.Bit;

   --  Status Clear Command Register
   type RTC_SCCR_Register is record
      --  Write-only. Acknowledge Clear
      ACKCLR        : RTC_SCCR_ACKCLR_Field := 16#0#;
      --  Write-only. Alarm Clear
      ALRCLR        : RTC_SCCR_ALRCLR_Field := 16#0#;
      --  Write-only. Second Clear
      SECCLR        : RTC_SCCR_SECCLR_Field := 16#0#;
      --  Write-only. Time Clear
      TIMCLR        : RTC_SCCR_TIMCLR_Field := 16#0#;
      --  Write-only. Calendar Clear
      CALCLR        : RTC_SCCR_CALCLR_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_SCCR_Register use record
      ACKCLR        at 0 range 0 .. 0;
      ALRCLR        at 0 range 1 .. 1;
      SECCLR        at 0 range 2 .. 2;
      TIMCLR        at 0 range 3 .. 3;
      CALCLR        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype RTC_IER_ACKEN_Field is ATSAM3X8E.Bit;
   subtype RTC_IER_ALREN_Field is ATSAM3X8E.Bit;
   subtype RTC_IER_SECEN_Field is ATSAM3X8E.Bit;
   subtype RTC_IER_TIMEN_Field is ATSAM3X8E.Bit;
   subtype RTC_IER_CALEN_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type RTC_IER_Register is record
      --  Write-only. Acknowledge Update Interrupt Enable
      ACKEN         : RTC_IER_ACKEN_Field := 16#0#;
      --  Write-only. Alarm Interrupt Enable
      ALREN         : RTC_IER_ALREN_Field := 16#0#;
      --  Write-only. Second Event Interrupt Enable
      SECEN         : RTC_IER_SECEN_Field := 16#0#;
      --  Write-only. Time Event Interrupt Enable
      TIMEN         : RTC_IER_TIMEN_Field := 16#0#;
      --  Write-only. Calendar Event Interrupt Enable
      CALEN         : RTC_IER_CALEN_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_IER_Register use record
      ACKEN         at 0 range 0 .. 0;
      ALREN         at 0 range 1 .. 1;
      SECEN         at 0 range 2 .. 2;
      TIMEN         at 0 range 3 .. 3;
      CALEN         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype RTC_IDR_ACKDIS_Field is ATSAM3X8E.Bit;
   subtype RTC_IDR_ALRDIS_Field is ATSAM3X8E.Bit;
   subtype RTC_IDR_SECDIS_Field is ATSAM3X8E.Bit;
   subtype RTC_IDR_TIMDIS_Field is ATSAM3X8E.Bit;
   subtype RTC_IDR_CALDIS_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type RTC_IDR_Register is record
      --  Write-only. Acknowledge Update Interrupt Disable
      ACKDIS        : RTC_IDR_ACKDIS_Field := 16#0#;
      --  Write-only. Alarm Interrupt Disable
      ALRDIS        : RTC_IDR_ALRDIS_Field := 16#0#;
      --  Write-only. Second Event Interrupt Disable
      SECDIS        : RTC_IDR_SECDIS_Field := 16#0#;
      --  Write-only. Time Event Interrupt Disable
      TIMDIS        : RTC_IDR_TIMDIS_Field := 16#0#;
      --  Write-only. Calendar Event Interrupt Disable
      CALDIS        : RTC_IDR_CALDIS_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_IDR_Register use record
      ACKDIS        at 0 range 0 .. 0;
      ALRDIS        at 0 range 1 .. 1;
      SECDIS        at 0 range 2 .. 2;
      TIMDIS        at 0 range 3 .. 3;
      CALDIS        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype RTC_IMR_ACK_Field is ATSAM3X8E.Bit;
   subtype RTC_IMR_ALR_Field is ATSAM3X8E.Bit;
   subtype RTC_IMR_SEC_Field is ATSAM3X8E.Bit;
   subtype RTC_IMR_TIM_Field is ATSAM3X8E.Bit;
   subtype RTC_IMR_CAL_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type RTC_IMR_Register is record
      --  Read-only. Acknowledge Update Interrupt Mask
      ACK           : RTC_IMR_ACK_Field;
      --  Read-only. Alarm Interrupt Mask
      ALR           : RTC_IMR_ALR_Field;
      --  Read-only. Second Event Interrupt Mask
      SEC           : RTC_IMR_SEC_Field;
      --  Read-only. Time Event Interrupt Mask
      TIM           : RTC_IMR_TIM_Field;
      --  Read-only. Calendar Event Interrupt Mask
      CAL           : RTC_IMR_CAL_Field;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_IMR_Register use record
      ACK           at 0 range 0 .. 0;
      ALR           at 0 range 1 .. 1;
      SEC           at 0 range 2 .. 2;
      TIM           at 0 range 3 .. 3;
      CAL           at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype RTC_VER_NVTIM_Field is ATSAM3X8E.Bit;
   subtype RTC_VER_NVCAL_Field is ATSAM3X8E.Bit;
   subtype RTC_VER_NVTIMALR_Field is ATSAM3X8E.Bit;
   subtype RTC_VER_NVCALALR_Field is ATSAM3X8E.Bit;

   --  Valid Entry Register
   type RTC_VER_Register is record
      --  Read-only. Non-valid Time
      NVTIM         : RTC_VER_NVTIM_Field;
      --  Read-only. Non-valid Calendar
      NVCAL         : RTC_VER_NVCAL_Field;
      --  Read-only. Non-valid Time Alarm
      NVTIMALR      : RTC_VER_NVTIMALR_Field;
      --  Read-only. Non-valid Calendar Alarm
      NVCALALR      : RTC_VER_NVCALALR_Field;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_VER_Register use record
      NVTIM         at 0 range 0 .. 0;
      NVCAL         at 0 range 1 .. 1;
      NVTIMALR      at 0 range 2 .. 2;
      NVCALALR      at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype RTC_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype RTC_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type RTC_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : RTC_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      WPKEY        : RTC_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTC_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype RTT_MR_RTPRES_Field is ATSAM3X8E.UInt16;
   subtype RTT_MR_ALMIEN_Field is ATSAM3X8E.Bit;
   subtype RTT_MR_RTTINCIEN_Field is ATSAM3X8E.Bit;
   subtype RTT_MR_RTTRST_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type RTT_MR_Register is record
      --  Real-time Timer Prescaler Value
      RTPRES         : RTT_MR_RTPRES_Field := 16#8000#;
      --  Alarm Interrupt Enable
      ALMIEN         : RTT_MR_ALMIEN_Field := 16#0#;
      --  Real-time Timer Increment Interrupt Enable
      RTTINCIEN      : RTT_MR_RTTINCIEN_Field := 16#0#;
      --  Real-time Timer Restart
      RTTRST         : RTT_MR_RTTRST_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTT_MR_Register use record
      RTPRES         at 0 range 0 .. 15;
      ALMIEN         at 0 range 16 .. 16;
      RTTINCIEN      at 0 range 17 .. 17;
      RTTRST         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype RTT_SR_ALMS_Field is ATSAM3X8E.Bit;
   subtype RTT_SR_RTTINC_Field is ATSAM3X8E.Bit;

   --  Status Register
   type RTT_SR_Register is record
      --  Read-only. Real-time Alarm Status
      ALMS          : RTT_SR_ALMS_Field;
      --  Read-only. Real-time Timer Increment
      RTTINC        : RTT_SR_RTTINC_Field;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for RTT_SR_Register use record
      ALMS          at 0 range 0 .. 0;
      RTTINC        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Voltage Regulator Off
   type CR_VROFF_Field is
     (--  no effect.
      NO_EFFECT,
      --  if KEY is correct, asserts vddcore_nreset and stops the voltage regulator.
      STOP_VREG)
     with Size => 1;
   for CR_VROFF_Field use
     (NO_EFFECT => 0,
      STOP_VREG => 1);

   --  Crystal Oscillator Select
   type CR_XTALSEL_Field is
     (--  no effect.
      NO_EFFECT,
      --  if KEY is correct, switches the slow clock on the crystal oscillator
--  output.
      CRYSTAL_SEL)
     with Size => 1;
   for CR_XTALSEL_Field use
     (NO_EFFECT => 0,
      CRYSTAL_SEL => 1);

   subtype SUPC_CR_KEY_Field is ATSAM3X8E.Byte;

   --  Supply Controller Control Register
   type SUPC_CR_Register is record
      --  unspecified
      Reserved_0_1  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Voltage Regulator Off
      VROFF         : CR_VROFF_Field := ATSAM3X8E.SYSC.NO_EFFECT;
      --  Write-only. Crystal Oscillator Select
      XTALSEL       : CR_XTALSEL_Field := ATSAM3X8E.SYSC.NO_EFFECT;
      --  unspecified
      Reserved_4_23 : ATSAM3X8E.UInt20 := 16#0#;
      --  Write-only. Password
      KEY           : SUPC_CR_KEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUPC_CR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      VROFF         at 0 range 2 .. 2;
      XTALSEL       at 0 range 3 .. 3;
      Reserved_4_23 at 0 range 4 .. 23;
      KEY           at 0 range 24 .. 31;
   end record;

   --  Supply Monitor Threshold
   type SMMR_SMTH_Field is
     (--  1.9 V
      Val_1_9V,
      --  2.0 V
      Val_2_0V,
      --  2.1 V
      Val_2_1V,
      --  2.2 V
      Val_2_2V,
      --  2.3 V
      Val_2_3V,
      --  2.4 V
      Val_2_4V,
      --  2.5 V
      Val_2_5V,
      --  2.6 V
      Val_2_6V,
      --  2.7 V
      Val_2_7V,
      --  2.8 V
      Val_2_8V,
      --  2.9 V
      Val_2_9V,
      --  3.0 V
      Val_3_0V,
      --  3.1 V
      Val_3_1V,
      --  3.2 V
      Val_3_2V,
      --  3.3 V
      Val_3_3V,
      --  3.4 V
      Val_3_4V)
     with Size => 4;
   for SMMR_SMTH_Field use
     (Val_1_9V => 0,
      Val_2_0V => 1,
      Val_2_1V => 2,
      Val_2_2V => 3,
      Val_2_3V => 4,
      Val_2_4V => 5,
      Val_2_5V => 6,
      Val_2_6V => 7,
      Val_2_7V => 8,
      Val_2_8V => 9,
      Val_2_9V => 10,
      Val_3_0V => 11,
      Val_3_1V => 12,
      Val_3_2V => 13,
      Val_3_3V => 14,
      Val_3_4V => 15);

   --  Supply Monitor Sampling Period
   type SMMR_SMSMPL_Field is
     (--  Supply Monitor disabled
      SMD,
      --  Continuous Supply Monitor
      CSM,
      --  Supply Monitor enabled one SLCK period every 32 SLCK periods
      Val_32SLCK,
      --  Supply Monitor enabled one SLCK period every 256 SLCK periods
      Val_256SLCK,
      --  Supply Monitor enabled one SLCK period every 2,048 SLCK periods
      Val_2048SLCK)
     with Size => 3;
   for SMMR_SMSMPL_Field use
     (SMD => 0,
      CSM => 1,
      Val_32SLCK => 2,
      Val_256SLCK => 3,
      Val_2048SLCK => 4);

   --  Supply Monitor Reset Enable
   type SMMR_SMRSTEN_Field is
     (--  the core reset signal "vddcore_nreset" is not affected when a supply
--  monitor detection occurs.
      NOT_ENABLE,
      --  the core reset signal, vddcore_nreset is asserted when a supply monitor
--  detection occurs.
      ENABLE)
     with Size => 1;
   for SMMR_SMRSTEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Supply Monitor Interrupt Enable
   type SMMR_SMIEN_Field is
     (--  the SUPC interrupt signal is not affected when a supply monitor detection
--  occurs.
      NOT_ENABLE,
      --  the SUPC interrupt signal is asserted when a supply monitor detection
--  occurs.
      ENABLE)
     with Size => 1;
   for SMMR_SMIEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Supply Controller Supply Monitor Mode Register
   type SUPC_SMMR_Register is record
      --  Supply Monitor Threshold
      SMTH           : SMMR_SMTH_Field := ATSAM3X8E.SYSC.Val_1_9V;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Supply Monitor Sampling Period
      SMSMPL         : SMMR_SMSMPL_Field := ATSAM3X8E.SYSC.SMD;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Supply Monitor Reset Enable
      SMRSTEN        : SMMR_SMRSTEN_Field := ATSAM3X8E.SYSC.NOT_ENABLE;
      --  Supply Monitor Interrupt Enable
      SMIEN          : SMMR_SMIEN_Field := ATSAM3X8E.SYSC.NOT_ENABLE;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUPC_SMMR_Register use record
      SMTH           at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SMSMPL         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SMRSTEN        at 0 range 12 .. 12;
      SMIEN          at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  Brownout Detector Reset Enable
   type MR_BODRSTEN_Field is
     (--  the core reset signal "vddcore_nreset" is not affected when a brownout
--  detection occurs.
      NOT_ENABLE,
      --  the core reset signal, vddcore_nreset is asserted when a brownout detection
--  occurs.
      ENABLE)
     with Size => 1;
   for MR_BODRSTEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Brownout Detector Disable
   type MR_BODDIS_Field is
     (--  the core brownout detector is enabled.
      ENABLE,
      --  the core brownout detector is disabled.
      DISABLE)
     with Size => 1;
   for MR_BODDIS_Field use
     (ENABLE => 0,
      DISABLE => 1);

   subtype SUPC_MR_VDDIORDYONREG_Field is ATSAM3X8E.Bit;

   --  Oscillator Bypass
   type MR_OSCBYPASS_Field is
     (--  no effect. Clock selection depends on XTALSEL value.
      NO_EFFECT,
      --  the 32-KHz XTAL oscillator is selected and is put in bypass mode.
      BYPASS)
     with Size => 1;
   for MR_OSCBYPASS_Field use
     (NO_EFFECT => 0,
      BYPASS => 1);

   subtype SUPC_MR_KEY_Field is ATSAM3X8E.Byte;

   --  Supply Controller Mode Register
   type SUPC_MR_Register is record
      --  unspecified
      Reserved_0_11  : ATSAM3X8E.UInt12 := 16#A00#;
      --  Brownout Detector Reset Enable
      BODRSTEN       : MR_BODRSTEN_Field := ATSAM3X8E.SYSC.ENABLE;
      --  Brownout Detector Disable
      BODDIS         : MR_BODDIS_Field := ATSAM3X8E.SYSC.ENABLE;
      VDDIORDYONREG  : SUPC_MR_VDDIORDYONREG_Field := 16#1#;
      --  unspecified
      Reserved_15_19 : ATSAM3X8E.UInt5 := 16#0#;
      --  Oscillator Bypass
      OSCBYPASS      : MR_OSCBYPASS_Field := ATSAM3X8E.SYSC.NO_EFFECT;
      --  unspecified
      Reserved_21_23 : ATSAM3X8E.UInt3 := 16#0#;
      --  Password Key
      KEY            : SUPC_MR_KEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUPC_MR_Register use record
      Reserved_0_11  at 0 range 0 .. 11;
      BODRSTEN       at 0 range 12 .. 12;
      BODDIS         at 0 range 13 .. 13;
      VDDIORDYONREG  at 0 range 14 .. 14;
      Reserved_15_19 at 0 range 15 .. 19;
      OSCBYPASS      at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      KEY            at 0 range 24 .. 31;
   end record;

   --  Force Wake Up Enable
   type WUMR_FWUPEN_Field is
     (--  the Force Wake Up pin has no wake up effect.
      NOT_ENABLE,
      --  the Force Wake Up pin low forces the wake up of the core power supply.
      ENABLE)
     with Size => 1;
   for WUMR_FWUPEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Supply Monitor Wake Up Enable
   type WUMR_SMEN_Field is
     (--  the supply monitor detection has no wake up effect.
      NOT_ENABLE,
      --  the supply monitor detection forces the wake up of the core power supply.
      ENABLE)
     with Size => 1;
   for WUMR_SMEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Real Time Timer Wake Up Enable
   type WUMR_RTTEN_Field is
     (--  the RTT alarm signal has no wake up effect.
      NOT_ENABLE,
      --  the RTT alarm signal forces the wake up of the core power supply.
      ENABLE)
     with Size => 1;
   for WUMR_RTTEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Real Time Clock Wake Up Enable
   type WUMR_RTCEN_Field is
     (--  the RTC alarm signal has no wake up effect.
      NOT_ENABLE,
      --  the RTC alarm signal forces the wake up of the core power supply.
      ENABLE)
     with Size => 1;
   for WUMR_RTCEN_Field use
     (NOT_ENABLE => 0,
      ENABLE => 1);

   --  Force Wake Up Debouncer Period
   type WUMR_FWUPDBC_Field is
     (--  Immediate, no debouncing, detected active at least on one Slow Clock edge.
      IMMEDIATE,
      --  FWUP shall be low for at least 3 SLCK periods
      Val_3_SCLK,
      --  FWUP shall be low for at least 32 SLCK periods
      Val_32_SCLK,
      --  FWUP shall be low for at least 512 SLCK periods
      Val_512_SCLK,
      --  FWUP shall be low for at least 4,096 SLCK periods
      Val_4096_SCLK,
      --  FWUP shall be low for at least 32,768 SLCK periods
      Val_32768_SCLK)
     with Size => 3;
   for WUMR_FWUPDBC_Field use
     (IMMEDIATE => 0,
      Val_3_SCLK => 1,
      Val_32_SCLK => 2,
      Val_512_SCLK => 3,
      Val_4096_SCLK => 4,
      Val_32768_SCLK => 5);

   --  Wake Up Inputs Debouncer Period
   type WUMR_WKUPDBC_Field is
     (--  Immediate, no debouncing, detected active at least on one Slow Clock edge.
      IMMEDIATE,
      --  WKUPx shall be in its active state for at least 3 SLCK periods
      Val_3_SCLK,
      --  WKUPx shall be in its active state for at least 32 SLCK periods
      Val_32_SCLK,
      --  WKUPx shall be in its active state for at least 512 SLCK periods
      Val_512_SCLK,
      --  WKUPx shall be in its active state for at least 4,096 SLCK periods
      Val_4096_SCLK,
      --  WKUPx shall be in its active state for at least 32,768 SLCK periods
      Val_32768_SCLK)
     with Size => 3;
   for WUMR_WKUPDBC_Field use
     (IMMEDIATE => 0,
      Val_3_SCLK => 1,
      Val_32_SCLK => 2,
      Val_512_SCLK => 3,
      Val_4096_SCLK => 4,
      Val_32768_SCLK => 5);

   --  Supply Controller Wake Up Mode Register
   type SUPC_WUMR_Register is record
      --  Force Wake Up Enable
      FWUPEN         : WUMR_FWUPEN_Field := ATSAM3X8E.SYSC.NOT_ENABLE;
      --  Supply Monitor Wake Up Enable
      SMEN           : WUMR_SMEN_Field := ATSAM3X8E.SYSC.NOT_ENABLE;
      --  Real Time Timer Wake Up Enable
      RTTEN          : WUMR_RTTEN_Field := ATSAM3X8E.SYSC.NOT_ENABLE;
      --  Real Time Clock Wake Up Enable
      RTCEN          : WUMR_RTCEN_Field := ATSAM3X8E.SYSC.NOT_ENABLE;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Force Wake Up Debouncer Period
      FWUPDBC        : WUMR_FWUPDBC_Field := ATSAM3X8E.SYSC.IMMEDIATE;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Wake Up Inputs Debouncer Period
      WKUPDBC        : WUMR_WKUPDBC_Field := ATSAM3X8E.SYSC.IMMEDIATE;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUPC_WUMR_Register use record
      FWUPEN         at 0 range 0 .. 0;
      SMEN           at 0 range 1 .. 1;
      RTTEN          at 0 range 2 .. 2;
      RTCEN          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      FWUPDBC        at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      WKUPDBC        at 0 range 12 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  Wake Up Input Enable 0
   type WUIR_WKUPEN0_Field is
     (--  the corresponding wake-up input has no wake up effect.
      DISABLE,
      --  the corresponding wake-up input forces the wake up of the core power
--  supply.
      ENABLE)
     with Size => 1;
   for WUIR_WKUPEN0_Field use
     (DISABLE => 0,
      ENABLE => 1);

   --  SUPC_WUIR_WKUPEN array
   type SUPC_WUIR_WKUPEN_Field_Array is array (0 .. 15) of WUIR_WKUPEN0_Field
     with Component_Size => 1, Size => 16;

   --  Type definition for SUPC_WUIR_WKUPEN
   type SUPC_WUIR_WKUPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WKUPEN as a value
            Val : ATSAM3X8E.UInt16;
         when True =>
            --  WKUPEN as an array
            Arr : SUPC_WUIR_WKUPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for SUPC_WUIR_WKUPEN_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Wake Up Input Type 0
   type WUIR_WKUPT0_Field is
     (--  a high to low level transition for a period defined by WKUPDBC on the
--  corresponding wake-up input forces the wake up of the core power supply.
      HIGH_TO_LOW,
      --  a low to high level transition for a period defined by WKUPDBC on the
--  correspond-ing wake-up input forces the wake up of the core power supply.
      LOW_TO_HIGH)
     with Size => 1;
   for WUIR_WKUPT0_Field use
     (HIGH_TO_LOW => 0,
      LOW_TO_HIGH => 1);

   --  SUPC_WUIR_WKUPT array
   type SUPC_WUIR_WKUPT_Field_Array is array (0 .. 15) of WUIR_WKUPT0_Field
     with Component_Size => 1, Size => 16;

   --  Type definition for SUPC_WUIR_WKUPT
   type SUPC_WUIR_WKUPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WKUPT as a value
            Val : ATSAM3X8E.UInt16;
         when True =>
            --  WKUPT as an array
            Arr : SUPC_WUIR_WKUPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for SUPC_WUIR_WKUPT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Supply Controller Wake Up Inputs Register
   type SUPC_WUIR_Register is record
      --  Wake Up Input Enable 0
      WKUPEN : SUPC_WUIR_WKUPEN_Field := (As_Array => False, Val => 16#0#);
      --  Wake Up Input Type 0
      WKUPT  : SUPC_WUIR_WKUPT_Field := (As_Array => False, Val => 16#0#);
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUPC_WUIR_Register use record
      WKUPEN at 0 range 0 .. 15;
      WKUPT  at 0 range 16 .. 31;
   end record;

   --  FWUP Wake Up Status
   type SR_FWUPS_Field is
     (--  no wake up due to the assertion of the FWUP pin has occurred since the last
--  read of SUPC_SR.
      NO,
      --  at least one wake up due to the assertion of the FWUP pin has occurred
--  since the last read of SUPC_SR.
      PRESENT)
     with Size => 1;
   for SR_FWUPS_Field use
     (NO => 0,
      PRESENT => 1);

   --  WKUP Wake Up Status
   type SR_WKUPS_Field is
     (--  no wake up due to the assertion of the WKUP pins has occurred since the
--  last read of SUPC_SR.
      NO,
      --  at least one wake up due to the assertion of the WKUP pins has occurred
--  since the last read of SUPC_SR.
      PRESENT)
     with Size => 1;
   for SR_WKUPS_Field use
     (NO => 0,
      PRESENT => 1);

   --  Supply Monitor Detection Wake Up Status
   type SR_SMWS_Field is
     (--  no wake up due to a supply monitor detection has occurred since the last
--  read of SUPC_SR.
      NO,
      --  at least one wake up due to a supply monitor detection has occurred since
--  the last read of SUPC_SR.
      PRESENT)
     with Size => 1;
   for SR_SMWS_Field use
     (NO => 0,
      PRESENT => 1);

   --  Brownout Detector Reset Status
   type SR_BODRSTS_Field is
     (--  no core brownout rising edge event has been detected since the last read of
--  the SUPC_SR.
      NO,
      --  at least one brownout output rising edge event has been detected since the
--  last read of the SUPC_SR.
      PRESENT)
     with Size => 1;
   for SR_BODRSTS_Field use
     (NO => 0,
      PRESENT => 1);

   --  Supply Monitor Reset Status
   type SR_SMRSTS_Field is
     (--  no supply monitor detection has generated a core reset since the last read
--  of the SUPC_SR.
      NO,
      --  at least one supply monitor detection has generated a core reset since the
--  last read of the SUPC_SR.
      PRESENT)
     with Size => 1;
   for SR_SMRSTS_Field use
     (NO => 0,
      PRESENT => 1);

   --  Supply Monitor Status
   type SR_SMS_Field is
     (--  no supply monitor detection since the last read of SUPC_SR.
      NO,
      --  at least one supply monitor detection since the last read of SUPC_SR.
      PRESENT)
     with Size => 1;
   for SR_SMS_Field use
     (NO => 0,
      PRESENT => 1);

   --  Supply Monitor Output Status
   type SR_SMOS_Field is
     (--  the supply monitor detected VDDUTMI higher than its threshold at its last
--  measurement.
      HIGH,
      --  the supply monitor detected VDDUTMI lower than its threshold at its last
--  measurement.
      LOW)
     with Size => 1;
   for SR_SMOS_Field use
     (HIGH => 0,
      LOW => 1);

   --  32-kHz Oscillator Selection Status
   type SR_OSCSEL_Field is
     (--  the slow clock, SLCK is generated by the embedded 32-kHz RC oscillator.
      RC,
      --  the slow clock, SLCK is generated by the 32-kHz crystal oscillator.
      CRYST)
     with Size => 1;
   for SR_OSCSEL_Field use
     (RC => 0,
      CRYST => 1);

   --  FWUP Input Status
   type SR_FWUPIS_Field is
     (--  FWUP input is tied low.
      LOW,
      --  FWUP input is tied high.
      HIGH)
     with Size => 1;
   for SR_FWUPIS_Field use
     (LOW => 0,
      HIGH => 1);

   --  WKUP Input Status 0
   type SR_WKUPIS0_Field is
     (--  the corresponding wake-up input is disabled, or was inactive at the time
--  the debouncer triggered a wake up event.
      DIS,
      --  the corresponding wake-up input was active at the time the debouncer
--  triggered a wake up event.
      EN)
     with Size => 1;
   for SR_WKUPIS0_Field use
     (DIS => 0,
      EN => 1);

   --  SUPC_SR_WKUPIS array
   type SUPC_SR_WKUPIS_Field_Array is array (0 .. 15) of SR_WKUPIS0_Field
     with Component_Size => 1, Size => 16;

   --  Type definition for SUPC_SR_WKUPIS
   type SUPC_SR_WKUPIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WKUPIS as a value
            Val : ATSAM3X8E.UInt16;
         when True =>
            --  WKUPIS as an array
            Arr : SUPC_SR_WKUPIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for SUPC_SR_WKUPIS_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Supply Controller Status Register
   type SUPC_SR_Register is record
      --  Read-only. FWUP Wake Up Status
      FWUPS          : SR_FWUPS_Field;
      --  Read-only. WKUP Wake Up Status
      WKUPS          : SR_WKUPS_Field;
      --  Read-only. Supply Monitor Detection Wake Up Status
      SMWS           : SR_SMWS_Field;
      --  Read-only. Brownout Detector Reset Status
      BODRSTS        : SR_BODRSTS_Field;
      --  Read-only. Supply Monitor Reset Status
      SMRSTS         : SR_SMRSTS_Field;
      --  Read-only. Supply Monitor Status
      SMS            : SR_SMS_Field;
      --  Read-only. Supply Monitor Output Status
      SMOS           : SR_SMOS_Field;
      --  Read-only. 32-kHz Oscillator Selection Status
      OSCSEL         : SR_OSCSEL_Field;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4;
      --  Read-only. FWUP Input Status
      FWUPIS         : SR_FWUPIS_Field;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3;
      --  Read-only. WKUP Input Status 0
      WKUPIS         : SUPC_SR_WKUPIS_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SUPC_SR_Register use record
      FWUPS          at 0 range 0 .. 0;
      WKUPS          at 0 range 1 .. 1;
      SMWS           at 0 range 2 .. 2;
      BODRSTS        at 0 range 3 .. 3;
      SMRSTS         at 0 range 4 .. 4;
      SMS            at 0 range 5 .. 5;
      SMOS           at 0 range 6 .. 6;
      OSCSEL         at 0 range 7 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      FWUPIS         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      WKUPIS         at 0 range 16 .. 31;
   end record;

   subtype WDT_CR_WDRSTT_Field is ATSAM3X8E.Bit;
   subtype WDT_CR_KEY_Field is ATSAM3X8E.Byte;

   --  Control Register
   type WDT_CR_Register is record
      --  Write-only. Watchdog Restart
      WDRSTT        : WDT_CR_WDRSTT_Field := 16#0#;
      --  unspecified
      Reserved_1_23 : ATSAM3X8E.UInt23 := 16#0#;
      --  Write-only. Password
      KEY           : WDT_CR_KEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WDT_CR_Register use record
      WDRSTT        at 0 range 0 .. 0;
      Reserved_1_23 at 0 range 1 .. 23;
      KEY           at 0 range 24 .. 31;
   end record;

   subtype WDT_MR_WDV_Field is ATSAM3X8E.UInt12;
   subtype WDT_MR_WDFIEN_Field is ATSAM3X8E.Bit;
   subtype WDT_MR_WDRSTEN_Field is ATSAM3X8E.Bit;
   subtype WDT_MR_WDRPROC_Field is ATSAM3X8E.Bit;
   subtype WDT_MR_WDDIS_Field is ATSAM3X8E.Bit;
   subtype WDT_MR_WDD_Field is ATSAM3X8E.UInt12;
   subtype WDT_MR_WDDBGHLT_Field is ATSAM3X8E.Bit;
   subtype WDT_MR_WDIDLEHLT_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type WDT_MR_Register is record
      --  Watchdog Counter Value
      WDV            : WDT_MR_WDV_Field := 16#FFF#;
      --  Watchdog Fault Interrupt Enable
      WDFIEN         : WDT_MR_WDFIEN_Field := 16#0#;
      --  Watchdog Reset Enable
      WDRSTEN        : WDT_MR_WDRSTEN_Field := 16#1#;
      --  Watchdog Reset Processor
      WDRPROC        : WDT_MR_WDRPROC_Field := 16#0#;
      --  Watchdog Disable
      WDDIS          : WDT_MR_WDDIS_Field := 16#0#;
      --  Watchdog Delta Value
      WDD            : WDT_MR_WDD_Field := 16#FFF#;
      --  Watchdog Debug Halt
      WDDBGHLT       : WDT_MR_WDDBGHLT_Field := 16#1#;
      --  Watchdog Idle Halt
      WDIDLEHLT      : WDT_MR_WDIDLEHLT_Field := 16#1#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WDT_MR_Register use record
      WDV            at 0 range 0 .. 11;
      WDFIEN         at 0 range 12 .. 12;
      WDRSTEN        at 0 range 13 .. 13;
      WDRPROC        at 0 range 14 .. 14;
      WDDIS          at 0 range 15 .. 15;
      WDD            at 0 range 16 .. 27;
      WDDBGHLT       at 0 range 28 .. 28;
      WDIDLEHLT      at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype WDT_SR_WDUNF_Field is ATSAM3X8E.Bit;
   subtype WDT_SR_WDERR_Field is ATSAM3X8E.Bit;

   --  Status Register
   type WDT_SR_Register is record
      --  Read-only. Watchdog Underflow
      WDUNF         : WDT_SR_WDUNF_Field;
      --  Read-only. Watchdog Error
      WDERR         : WDT_SR_WDERR_Field;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for WDT_SR_Register use record
      WDUNF         at 0 range 0 .. 0;
      WDERR         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  General Purpose Backup Register
   type GPBR_Peripheral is record
      --  General Purpose Backup Register
      GPBR_0 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_1 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_2 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_3 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_4 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_5 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_6 : aliased ATSAM3X8E.UInt32;
      --  General Purpose Backup Register
      GPBR_7 : aliased ATSAM3X8E.UInt32;
   end record
     with Volatile;

   for GPBR_Peripheral use record
      GPBR_0 at 16#0# range 0 .. 31;
      GPBR_1 at 16#4# range 0 .. 31;
      GPBR_2 at 16#8# range 0 .. 31;
      GPBR_3 at 16#C# range 0 .. 31;
      GPBR_4 at 16#10# range 0 .. 31;
      GPBR_5 at 16#14# range 0 .. 31;
      GPBR_6 at 16#18# range 0 .. 31;
      GPBR_7 at 16#1C# range 0 .. 31;
   end record;

   --  General Purpose Backup Register
   GPBR_Periph : aliased GPBR_Peripheral
     with Import, Address => GPBR_Base;

   --  Reset Controller
   type RSTC_Peripheral is record
      --  Control Register
      CR : aliased RSTC_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Status Register
      SR : aliased RSTC_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Mode Register
      MR : aliased RSTC_MR_Register;
      pragma Volatile_Full_Access (MR);
   end record
     with Volatile;

   for RSTC_Peripheral use record
      CR at 16#0# range 0 .. 31;
      SR at 16#4# range 0 .. 31;
      MR at 16#8# range 0 .. 31;
   end record;

   --  Reset Controller
   RSTC_Periph : aliased RSTC_Peripheral
     with Import, Address => RSTC_Base;

   --  Real-time Clock
   type RTC_Peripheral is record
      --  Control Register
      CR     : aliased RTC_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Mode Register
      MR     : aliased RTC_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Time Register
      TIMR   : aliased RTC_TIMR_Register;
      pragma Volatile_Full_Access (TIMR);
      --  Calendar Register
      CALR   : aliased RTC_CALR_Register;
      pragma Volatile_Full_Access (CALR);
      --  Time Alarm Register
      TIMALR : aliased RTC_TIMALR_Register;
      pragma Volatile_Full_Access (TIMALR);
      --  Calendar Alarm Register
      CALALR : aliased RTC_CALALR_Register;
      pragma Volatile_Full_Access (CALALR);
      --  Status Register
      SR     : aliased RTC_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Status Clear Command Register
      SCCR   : aliased RTC_SCCR_Register;
      pragma Volatile_Full_Access (SCCR);
      --  Interrupt Enable Register
      IER    : aliased RTC_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR    : aliased RTC_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR    : aliased RTC_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Valid Entry Register
      VER    : aliased RTC_VER_Register;
      pragma Volatile_Full_Access (VER);
      --  Write Protect Mode Register
      WPMR   : aliased RTC_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
   end record
     with Volatile;

   for RTC_Peripheral use record
      CR     at 16#0# range 0 .. 31;
      MR     at 16#4# range 0 .. 31;
      TIMR   at 16#8# range 0 .. 31;
      CALR   at 16#C# range 0 .. 31;
      TIMALR at 16#10# range 0 .. 31;
      CALALR at 16#14# range 0 .. 31;
      SR     at 16#18# range 0 .. 31;
      SCCR   at 16#1C# range 0 .. 31;
      IER    at 16#20# range 0 .. 31;
      IDR    at 16#24# range 0 .. 31;
      IMR    at 16#28# range 0 .. 31;
      VER    at 16#2C# range 0 .. 31;
      WPMR   at 16#E4# range 0 .. 31;
   end record;

   --  Real-time Clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

   --  Real-time Timer
   type RTT_Peripheral is record
      --  Mode Register
      MR : aliased RTT_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Alarm Register
      AR : aliased ATSAM3X8E.UInt32;
      --  Value Register
      VR : aliased ATSAM3X8E.UInt32;
      --  Status Register
      SR : aliased RTT_SR_Register;
      pragma Volatile_Full_Access (SR);
   end record
     with Volatile;

   for RTT_Peripheral use record
      MR at 16#0# range 0 .. 31;
      AR at 16#4# range 0 .. 31;
      VR at 16#8# range 0 .. 31;
      SR at 16#C# range 0 .. 31;
   end record;

   --  Real-time Timer
   RTT_Periph : aliased RTT_Peripheral
     with Import, Address => RTT_Base;

   --  Supply Controller
   type SUPC_Peripheral is record
      --  Supply Controller Control Register
      CR   : aliased SUPC_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Supply Controller Supply Monitor Mode Register
      SMMR : aliased SUPC_SMMR_Register;
      pragma Volatile_Full_Access (SMMR);
      --  Supply Controller Mode Register
      MR   : aliased SUPC_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Supply Controller Wake Up Mode Register
      WUMR : aliased SUPC_WUMR_Register;
      pragma Volatile_Full_Access (WUMR);
      --  Supply Controller Wake Up Inputs Register
      WUIR : aliased SUPC_WUIR_Register;
      pragma Volatile_Full_Access (WUIR);
      --  Supply Controller Status Register
      SR   : aliased SUPC_SR_Register;
      pragma Volatile_Full_Access (SR);
   end record
     with Volatile;

   for SUPC_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      SMMR at 16#4# range 0 .. 31;
      MR   at 16#8# range 0 .. 31;
      WUMR at 16#C# range 0 .. 31;
      WUIR at 16#10# range 0 .. 31;
      SR   at 16#14# range 0 .. 31;
   end record;

   --  Supply Controller
   SUPC_Periph : aliased SUPC_Peripheral
     with Import, Address => SUPC_Base;

   --  Watchdog Timer
   type WDT_Peripheral is record
      --  Control Register
      CR : aliased WDT_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Mode Register
      MR : aliased WDT_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Status Register
      SR : aliased WDT_SR_Register;
      pragma Volatile_Full_Access (SR);
   end record
     with Volatile;

   for WDT_Peripheral use record
      CR at 16#0# range 0 .. 31;
      MR at 16#4# range 0 .. 31;
      SR at 16#8# range 0 .. 31;
   end record;

   --  Watchdog Timer
   WDT_Periph : aliased WDT_Peripheral
     with Import, Address => WDT_Base;

end ATSAM3X8E.SYSC;
