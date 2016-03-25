--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.SYSC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_PROCRST_Field is ATSAM3X8E.Bit;
   subtype CR_PERRST_Field is ATSAM3X8E.Bit;
   subtype CR_EXTRST_Field is ATSAM3X8E.Bit;
   subtype CR_KEY_Field is ATSAM3X8E.Byte;

   --  Control Register
   type CR_Register is record
      --  Write-only. Processor Reset
      PROCRST       : CR_PROCRST_Field := 16#0#;
      --  unspecified
      Reserved_1_1  : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Peripheral Reset
      PERRST        : CR_PERRST_Field := 16#0#;
      --  Write-only. External Reset
      EXTRST        : CR_EXTRST_Field := 16#0#;
      --  unspecified
      Reserved_4_23 : ATSAM3X8E.UInt20 := 16#0#;
      --  Write-only. System Reset Key
      KEY           : CR_KEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      PROCRST       at 0 range 0 .. 0;
      Reserved_1_1  at 0 range 1 .. 1;
      PERRST        at 0 range 2 .. 2;
      EXTRST        at 0 range 3 .. 3;
      Reserved_4_23 at 0 range 4 .. 23;
      KEY           at 0 range 24 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_URSTS_Field is ATSAM3X8E.Bit;
   subtype SR_RSTTYP_Field is ATSAM3X8E.UInt3;
   subtype SR_NRSTL_Field is ATSAM3X8E.Bit;
   subtype SR_SRCMP_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. User Reset Status
      URSTS          : SR_URSTS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Reset Type
      RSTTYP         : SR_RSTTYP_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : ATSAM3X8E.UInt5;
      --  Read-only. NRST Pin Level
      NRSTL          : SR_NRSTL_Field := 16#0#;
      --  Read-only. Software Reset Command in Progress
      SRCMP          : SR_SRCMP_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : ATSAM3X8E.UInt14;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      URSTS          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      RSTTYP         at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      NRSTL          at 0 range 16 .. 16;
      SRCMP          at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   subtype MR_URSTEN_Field is ATSAM3X8E.Bit;
   subtype MR_URSTIEN_Field is ATSAM3X8E.Bit;
   subtype MR_ERSTL_Field is ATSAM3X8E.UInt4;
   subtype MR_KEY_Field is ATSAM3X8E.Byte;

   --  Mode Register
   type MR_Register is record
      --  User Reset Enable
      URSTEN         : MR_URSTEN_Field := 16#1#;
      --  unspecified
      Reserved_1_3   : ATSAM3X8E.UInt3 := 16#0#;
      --  User Reset Interrupt Enable
      URSTIEN        : MR_URSTIEN_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : ATSAM3X8E.UInt3 := 16#0#;
      --  External Reset Length
      ERSTL          : MR_ERSTL_Field := 16#0#;
      --  unspecified
      Reserved_12_23 : ATSAM3X8E.UInt12 := 16#0#;
      --  Password
      KEY            : MR_KEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      URSTEN         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      URSTIEN        at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      ERSTL          at 0 range 8 .. 11;
      Reserved_12_23 at 0 range 12 .. 23;
      KEY            at 0 range 24 .. 31;
   end record;

   -------------------
   -- SMMR_Register --
   -------------------

   --  Supply Monitor Threshold
   type SMTH_Field is
     (
      --  1.9 V
      SMTH_Field_1_9V,
      --  2.0 V
      SMTH_Field_2_0V,
      --  2.1 V
      SMTH_Field_2_1V,
      --  2.2 V
      SMTH_Field_2_2V,
      --  2.3 V
      SMTH_Field_2_3V,
      --  2.4 V
      SMTH_Field_2_4V,
      --  2.5 V
      SMTH_Field_2_5V,
      --  2.6 V
      SMTH_Field_2_6V,
      --  2.7 V
      SMTH_Field_2_7V,
      --  2.8 V
      SMTH_Field_2_8V,
      --  2.9 V
      SMTH_Field_2_9V,
      --  3.0 V
      SMTH_Field_3_0V,
      --  3.1 V
      SMTH_Field_3_1V,
      --  3.2 V
      SMTH_Field_3_2V,
      --  3.3 V
      SMTH_Field_3_3V,
      --  3.4 V
      SMTH_Field_3_4V)
     with Size => 4;
   for SMTH_Field use
     (SMTH_Field_1_9V => 0,
      SMTH_Field_2_0V => 1,
      SMTH_Field_2_1V => 2,
      SMTH_Field_2_2V => 3,
      SMTH_Field_2_3V => 4,
      SMTH_Field_2_4V => 5,
      SMTH_Field_2_5V => 6,
      SMTH_Field_2_6V => 7,
      SMTH_Field_2_7V => 8,
      SMTH_Field_2_8V => 9,
      SMTH_Field_2_9V => 10,
      SMTH_Field_3_0V => 11,
      SMTH_Field_3_1V => 12,
      SMTH_Field_3_2V => 13,
      SMTH_Field_3_3V => 14,
      SMTH_Field_3_4V => 15);

   --  Supply Monitor Sampling Period
   type SMSMPL_Field is
     (
      --  Supply Monitor disabled
      Smd,
      --  Continuous Supply Monitor
      Csm,
      --  Supply Monitor enabled one SLCK period every 32 SLCK periods
      SMSMPL_Field_32Slck,
      --  Supply Monitor enabled one SLCK period every 256 SLCK periods
      SMSMPL_Field_256Slck,
      --  Supply Monitor enabled one SLCK period every 2,048 SLCK periods
      SMSMPL_Field_2048Slck)
     with Size => 3;
   for SMSMPL_Field use
     (Smd => 0,
      Csm => 1,
      SMSMPL_Field_32Slck => 2,
      SMSMPL_Field_256Slck => 3,
      SMSMPL_Field_2048Slck => 4);

   --  Supply Monitor Reset Enable
   type SMRSTEN_Field is
     (
      --  the core reset signal "vddcore_nreset" is not affected when a supply
      --  monitor detection occurs.
      Not_Enable,
      --  the core reset signal, vddcore_nreset is asserted when a supply
      --  monitor detection occurs.
      Enable)
     with Size => 1;
   for SMRSTEN_Field use
     (Not_Enable => 0,
      Enable => 1);

   --  Supply Monitor Interrupt Enable
   type SMIEN_Field is
     (
      --  the SUPC interrupt signal is not affected when a supply monitor
      --  detection occurs.
      Not_Enable,
      --  the SUPC interrupt signal is asserted when a supply monitor detection
      --  occurs.
      Enable)
     with Size => 1;
   for SMIEN_Field use
     (Not_Enable => 0,
      Enable => 1);

   --  Supply Controller Supply Monitor Mode Register
   type SMMR_Register is record
      --  Supply Monitor Threshold
      SMTH           : SMTH_Field := SMTH_Field_1_9V;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Supply Monitor Sampling Period
      SMSMPL         : SMSMPL_Field := Smd;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Supply Monitor Reset Enable
      SMRSTEN        : SMRSTEN_Field := Not_Enable;
      --  Supply Monitor Interrupt Enable
      SMIEN          : SMIEN_Field := Not_Enable;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SMMR_Register use record
      SMTH           at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SMSMPL         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SMRSTEN        at 0 range 12 .. 12;
      SMIEN          at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   -------------------
   -- WUMR_Register --
   -------------------

   --  Force Wake Up Enable
   type FWUPEN_Field is
     (
      --  the Force Wake Up pin has no wake up effect.
      Not_Enable,
      --  the Force Wake Up pin low forces the wake up of the core power
      --  supply.
      Enable)
     with Size => 1;
   for FWUPEN_Field use
     (Not_Enable => 0,
      Enable => 1);

   --  Supply Monitor Wake Up Enable
   type SMEN_Field is
     (
      --  the supply monitor detection has no wake up effect.
      Not_Enable,
      --  the supply monitor detection forces the wake up of the core power
      --  supply.
      Enable)
     with Size => 1;
   for SMEN_Field use
     (Not_Enable => 0,
      Enable => 1);

   --  Real Time Timer Wake Up Enable
   type RTTEN_Field is
     (
      --  the RTT alarm signal has no wake up effect.
      Not_Enable,
      --  the RTT alarm signal forces the wake up of the core power supply.
      Enable)
     with Size => 1;
   for RTTEN_Field use
     (Not_Enable => 0,
      Enable => 1);

   --  Real Time Clock Wake Up Enable
   type RTCEN_Field is
     (
      --  the RTC alarm signal has no wake up effect.
      Not_Enable,
      --  the RTC alarm signal forces the wake up of the core power supply.
      Enable)
     with Size => 1;
   for RTCEN_Field use
     (Not_Enable => 0,
      Enable => 1);

   --  Force Wake Up Debouncer Period
   type FWUPDBC_Field is
     (
      --  Immediate, no debouncing, detected active at least on one Slow Clock
      --  edge.
      Immediate,
      --  FWUP shall be low for at least 3 SLCK periods
      FWUPDBC_Field_3_Sclk,
      --  FWUP shall be low for at least 32 SLCK periods
      FWUPDBC_Field_32_Sclk,
      --  FWUP shall be low for at least 512 SLCK periods
      FWUPDBC_Field_512_Sclk,
      --  FWUP shall be low for at least 4,096 SLCK periods
      FWUPDBC_Field_4096_Sclk,
      --  FWUP shall be low for at least 32,768 SLCK periods
      FWUPDBC_Field_32768_Sclk)
     with Size => 3;
   for FWUPDBC_Field use
     (Immediate => 0,
      FWUPDBC_Field_3_Sclk => 1,
      FWUPDBC_Field_32_Sclk => 2,
      FWUPDBC_Field_512_Sclk => 3,
      FWUPDBC_Field_4096_Sclk => 4,
      FWUPDBC_Field_32768_Sclk => 5);

   --  Wake Up Inputs Debouncer Period
   type WKUPDBC_Field is
     (
      --  Immediate, no debouncing, detected active at least on one Slow Clock
      --  edge.
      Immediate,
      --  WKUPx shall be in its active state for at least 3 SLCK periods
      WKUPDBC_Field_3_Sclk,
      --  WKUPx shall be in its active state for at least 32 SLCK periods
      WKUPDBC_Field_32_Sclk,
      --  WKUPx shall be in its active state for at least 512 SLCK periods
      WKUPDBC_Field_512_Sclk,
      --  WKUPx shall be in its active state for at least 4,096 SLCK periods
      WKUPDBC_Field_4096_Sclk,
      --  WKUPx shall be in its active state for at least 32,768 SLCK periods
      WKUPDBC_Field_32768_Sclk)
     with Size => 3;
   for WKUPDBC_Field use
     (Immediate => 0,
      WKUPDBC_Field_3_Sclk => 1,
      WKUPDBC_Field_32_Sclk => 2,
      WKUPDBC_Field_512_Sclk => 3,
      WKUPDBC_Field_4096_Sclk => 4,
      WKUPDBC_Field_32768_Sclk => 5);

   --  Supply Controller Wake Up Mode Register
   type WUMR_Register is record
      --  Force Wake Up Enable
      FWUPEN         : FWUPEN_Field := Not_Enable;
      --  Supply Monitor Wake Up Enable
      SMEN           : SMEN_Field := Not_Enable;
      --  Real Time Timer Wake Up Enable
      RTTEN          : RTTEN_Field := Not_Enable;
      --  Real Time Clock Wake Up Enable
      RTCEN          : RTCEN_Field := Not_Enable;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Force Wake Up Debouncer Period
      FWUPDBC        : FWUPDBC_Field := Immediate;
      --  unspecified
      Reserved_11_11 : ATSAM3X8E.Bit := 16#0#;
      --  Wake Up Inputs Debouncer Period
      WKUPDBC        : WKUPDBC_Field := Immediate;
      --  unspecified
      Reserved_15_31 : ATSAM3X8E.UInt17 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WUMR_Register use record
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

   -------------------
   -- WUIR_Register --
   -------------------

   --  Wake Up Input Enable 0
   type WKUPEN0_Field is
     (
      --  the corresponding wake-up input has no wake up effect.
      Disable,
      --  the corresponding wake-up input forces the wake up of the core power
      --  supply.
      Enable)
     with Size => 1;
   for WKUPEN0_Field use
     (Disable => 0,
      Enable => 1);

   -----------------
   -- WUIR.WKUPEN --
   -----------------

   --  WUIR_WKUPEN array
   type WUIR_WKUPEN_Field_Array is array (0 .. 15) of WKUPEN0_Field
     with Component_Size => 1, Size => 16;

   --  Type definition for WUIR_WKUPEN
   type WUIR_WKUPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WKUPEN as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  WKUPEN as an array
            Arr : WUIR_WKUPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for WUIR_WKUPEN_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Wake Up Input Type 0
   type WKUPT0_Field is
     (
      --  a high to low level transition for a period defined by WKUPDBC on the
      --  corresponding wake-up input forces the wake up of the core power
      --  supply.
      High_To_Low,
      --  a low to high level transition for a period defined by WKUPDBC on the
      --  correspond-ing wake-up input forces the wake up of the core power
      --  supply.
      Low_To_High)
     with Size => 1;
   for WKUPT0_Field use
     (High_To_Low => 0,
      Low_To_High => 1);

   ----------------
   -- WUIR.WKUPT --
   ----------------

   --  WUIR_WKUPT array
   type WUIR_WKUPT_Field_Array is array (0 .. 15) of WKUPT0_Field
     with Component_Size => 1, Size => 16;

   --  Type definition for WUIR_WKUPT
   type WUIR_WKUPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WKUPT as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  WKUPT as an array
            Arr : WUIR_WKUPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for WUIR_WKUPT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Supply Controller Wake Up Inputs Register
   type WUIR_Register is record
      --  Wake Up Input Enable 0
      WKUPEN : WUIR_WKUPEN_Field := (As_Array => False, Val => 16#0#);
      --  Wake Up Input Type 0
      WKUPT  : WUIR_WKUPT_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WUIR_Register use record
      WKUPEN at 0 range 0 .. 15;
      WKUPT  at 0 range 16 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   --  FWUP Wake Up Status
   type FWUPS_Field is
     (
      --  no wake up due to the assertion of the FWUP pin has occurred since
      --  the last read of SUPC_SR.
      No,
      --  at least one wake up due to the assertion of the FWUP pin has
      --  occurred since the last read of SUPC_SR.
      Present)
     with Size => 1;
   for FWUPS_Field use
     (No => 0,
      Present => 1);

   --  WKUP Wake Up Status
   type WKUPS_Field is
     (
      --  no wake up due to the assertion of the WKUP pins has occurred since
      --  the last read of SUPC_SR.
      No,
      --  at least one wake up due to the assertion of the WKUP pins has
      --  occurred since the last read of SUPC_SR.
      Present)
     with Size => 1;
   for WKUPS_Field use
     (No => 0,
      Present => 1);

   --  Supply Monitor Detection Wake Up Status
   type SMWS_Field is
     (
      --  no wake up due to a supply monitor detection has occurred since the
      --  last read of SUPC_SR.
      No,
      --  at least one wake up due to a supply monitor detection has occurred
      --  since the last read of SUPC_SR.
      Present)
     with Size => 1;
   for SMWS_Field use
     (No => 0,
      Present => 1);

   --  Brownout Detector Reset Status
   type BODRSTS_Field is
     (
      --  no core brownout rising edge event has been detected since the last
      --  read of the SUPC_SR.
      No,
      --  at least one brownout output rising edge event has been detected
      --  since the last read of the SUPC_SR.
      Present)
     with Size => 1;
   for BODRSTS_Field use
     (No => 0,
      Present => 1);

   --  Supply Monitor Reset Status
   type SMRSTS_Field is
     (
      --  no supply monitor detection has generated a core reset since the last
      --  read of the SUPC_SR.
      No,
      --  at least one supply monitor detection has generated a core reset
      --  since the last read of the SUPC_SR.
      Present)
     with Size => 1;
   for SMRSTS_Field use
     (No => 0,
      Present => 1);

   --  Supply Monitor Status
   type SMS_Field is
     (
      --  no supply monitor detection since the last read of SUPC_SR.
      No,
      --  at least one supply monitor detection since the last read of SUPC_SR.
      Present)
     with Size => 1;
   for SMS_Field use
     (No => 0,
      Present => 1);

   --  Supply Monitor Output Status
   type SMOS_Field is
     (
      --  the supply monitor detected VDDUTMI higher than its threshold at its
      --  last measurement.
      High,
      --  the supply monitor detected VDDUTMI lower than its threshold at its
      --  last measurement.
      Low)
     with Size => 1;
   for SMOS_Field use
     (High => 0,
      Low => 1);

   --  32-kHz Oscillator Selection Status
   type OSCSEL_Field is
     (
      --  the slow clock, SLCK is generated by the embedded 32-kHz RC
      --  oscillator.
      Rc,
      --  the slow clock, SLCK is generated by the 32-kHz crystal oscillator.
      Cryst)
     with Size => 1;
   for OSCSEL_Field use
     (Rc => 0,
      Cryst => 1);

   --  FWUP Input Status
   type FWUPIS_Field is
     (
      --  FWUP input is tied low.
      Low,
      --  FWUP input is tied high.
      High)
     with Size => 1;
   for FWUPIS_Field use
     (Low => 0,
      High => 1);

   --  WKUP Input Status 0
   type WKUPIS0_Field is
     (
      --  the corresponding wake-up input is disabled, or was inactive at the
      --  time the debouncer triggered a wake up event.
      Dis,
      --  the corresponding wake-up input was active at the time the debouncer
      --  triggered a wake up event.
      En)
     with Size => 1;
   for WKUPIS0_Field use
     (Dis => 0,
      En => 1);

   ---------------
   -- SR.WKUPIS --
   ---------------

   --  SR_WKUPIS array
   type SR_WKUPIS_Field_Array is array (0 .. 15) of WKUPIS0_Field
     with Component_Size => 1, Size => 16;

   --  Type definition for SR_WKUPIS
   type SR_WKUPIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WKUPIS as a value
            Val : ATSAM3X8E.Short;
         when True =>
            --  WKUPIS as an array
            Arr : SR_WKUPIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for SR_WKUPIS_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Supply Controller Status Register
   type SR_Register_1 is record
      --  Read-only. FWUP Wake Up Status
      FWUPS          : FWUPS_Field := No;
      --  Read-only. WKUP Wake Up Status
      WKUPS          : WKUPS_Field := No;
      --  Read-only. Supply Monitor Detection Wake Up Status
      SMWS           : SMWS_Field := No;
      --  Read-only. Brownout Detector Reset Status
      BODRSTS        : BODRSTS_Field := No;
      --  Read-only. Supply Monitor Reset Status
      SMRSTS         : SMRSTS_Field := No;
      --  Read-only. Supply Monitor Status
      SMS            : SMS_Field := No;
      --  Read-only. Supply Monitor Output Status
      SMOS           : SMOS_Field := High;
      --  Read-only. 32-kHz Oscillator Selection Status
      OSCSEL         : OSCSEL_Field := Rc;
      --  unspecified
      Reserved_8_11  : ATSAM3X8E.UInt4;
      --  Read-only. FWUP Input Status
      FWUPIS         : FWUPIS_Field := Low;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3;
      --  Read-only. WKUP Input Status 0
      WKUPIS         : SR_WKUPIS_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register_1 use record
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

   -----------------
   -- MR_Register --
   -----------------

   subtype MR_RTPRES_Field is ATSAM3X8E.Short;
   subtype MR_ALMIEN_Field is ATSAM3X8E.Bit;
   subtype MR_RTTINCIEN_Field is ATSAM3X8E.Bit;
   subtype MR_RTTRST_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type MR_Register_1 is record
      --  Real-time Timer Prescaler Value
      RTPRES         : MR_RTPRES_Field := 16#8000#;
      --  Alarm Interrupt Enable
      ALMIEN         : MR_ALMIEN_Field := 16#0#;
      --  Real-time Timer Increment Interrupt Enable
      RTTINCIEN      : MR_RTTINCIEN_Field := 16#0#;
      --  Real-time Timer Restart
      RTTRST         : MR_RTTRST_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register_1 use record
      RTPRES         at 0 range 0 .. 15;
      ALMIEN         at 0 range 16 .. 16;
      RTTINCIEN      at 0 range 17 .. 17;
      RTTRST         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_ALMS_Field is ATSAM3X8E.Bit;
   subtype SR_RTTINC_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register_2 is record
      --  Read-only. Real-time Alarm Status
      ALMS          : SR_ALMS_Field := 16#0#;
      --  Read-only. Real-time Timer Increment
      RTTINC        : SR_RTTINC_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register_2 use record
      ALMS          at 0 range 0 .. 0;
      RTTINC        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   subtype MR_WDV_Field is ATSAM3X8E.UInt12;
   subtype MR_WDFIEN_Field is ATSAM3X8E.Bit;
   subtype MR_WDRSTEN_Field is ATSAM3X8E.Bit;
   subtype MR_WDRPROC_Field is ATSAM3X8E.Bit;
   subtype MR_WDDIS_Field is ATSAM3X8E.Bit;
   subtype MR_WDD_Field is ATSAM3X8E.UInt12;
   subtype MR_WDDBGHLT_Field is ATSAM3X8E.Bit;
   subtype MR_WDIDLEHLT_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type MR_Register_2 is record
      --  Watchdog Counter Value
      WDV            : MR_WDV_Field := 16#FFF#;
      --  Watchdog Fault Interrupt Enable
      WDFIEN         : MR_WDFIEN_Field := 16#0#;
      --  Watchdog Reset Enable
      WDRSTEN        : MR_WDRSTEN_Field := 16#1#;
      --  Watchdog Reset Processor
      WDRPROC        : MR_WDRPROC_Field := 16#0#;
      --  Watchdog Disable
      WDDIS          : MR_WDDIS_Field := 16#0#;
      --  Watchdog Delta Value
      WDD            : MR_WDD_Field := 16#FFF#;
      --  Watchdog Debug Halt
      WDDBGHLT       : MR_WDDBGHLT_Field := 16#1#;
      --  Watchdog Idle Halt
      WDIDLEHLT      : MR_WDIDLEHLT_Field := 16#1#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register_2 use record
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

   -------------------
   -- TIMR_Register --
   -------------------

   subtype TIMR_SEC_Field is ATSAM3X8E.UInt7;
   subtype TIMR_MIN_Field is ATSAM3X8E.UInt7;
   subtype TIMR_HOUR_Field is ATSAM3X8E.UInt6;
   subtype TIMR_AMPM_Field is ATSAM3X8E.Bit;

   --  Time Register
   type TIMR_Register is record
      --  Current Second
      SEC            : TIMR_SEC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Current Minute
      MIN            : TIMR_MIN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : ATSAM3X8E.Bit := 16#0#;
      --  Current Hour
      HOUR           : TIMR_HOUR_Field := 16#0#;
      --  Ante Meridiem Post Meridiem Indicator
      AMPM           : TIMR_AMPM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : ATSAM3X8E.UInt9 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TIMR_Register use record
      SEC            at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MIN            at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HOUR           at 0 range 16 .. 21;
      AMPM           at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   -------------------
   -- CALR_Register --
   -------------------

   subtype CALR_CENT_Field is ATSAM3X8E.UInt7;
   subtype CALR_YEAR_Field is ATSAM3X8E.Byte;
   subtype CALR_MONTH_Field is ATSAM3X8E.UInt5;
   subtype CALR_DAY_Field is ATSAM3X8E.UInt3;
   subtype CALR_DATE_Field is ATSAM3X8E.UInt6;

   --  Calendar Register
   type CALR_Register is record
      --  Current Century
      CENT           : CALR_CENT_Field := 16#20#;
      --  unspecified
      Reserved_7_7   : ATSAM3X8E.Bit := 16#0#;
      --  Current Year
      YEAR           : CALR_YEAR_Field := 16#7#;
      --  Current Month
      MONTH          : CALR_MONTH_Field := 16#1#;
      --  Current Day in Current Week
      DAY            : CALR_DAY_Field := 16#1#;
      --  Current Day in Current Month
      DATE           : CALR_DATE_Field := 16#1#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CENT           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      YEAR           at 0 range 8 .. 15;
      MONTH          at 0 range 16 .. 20;
      DAY            at 0 range 21 .. 23;
      DATE           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   ---------------------
   -- TIMALR_Register --
   ---------------------

   subtype TIMALR_SEC_Field is ATSAM3X8E.UInt7;
   subtype TIMALR_SECEN_Field is ATSAM3X8E.Bit;
   subtype TIMALR_MIN_Field is ATSAM3X8E.UInt7;
   subtype TIMALR_MINEN_Field is ATSAM3X8E.Bit;
   subtype TIMALR_HOUR_Field is ATSAM3X8E.UInt6;
   subtype TIMALR_AMPM_Field is ATSAM3X8E.Bit;
   subtype TIMALR_HOUREN_Field is ATSAM3X8E.Bit;

   --  Time Alarm Register
   type TIMALR_Register is record
      --  Second Alarm
      SEC            : TIMALR_SEC_Field := 16#0#;
      --  Second Alarm Enable
      SECEN          : TIMALR_SECEN_Field := 16#0#;
      --  Minute Alarm
      MIN            : TIMALR_MIN_Field := 16#0#;
      --  Minute Alarm Enable
      MINEN          : TIMALR_MINEN_Field := 16#0#;
      --  Hour Alarm
      HOUR           : TIMALR_HOUR_Field := 16#0#;
      --  AM/PM Indicator
      AMPM           : TIMALR_AMPM_Field := 16#0#;
      --  Hour Alarm Enable
      HOUREN         : TIMALR_HOUREN_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TIMALR_Register use record
      SEC            at 0 range 0 .. 6;
      SECEN          at 0 range 7 .. 7;
      MIN            at 0 range 8 .. 14;
      MINEN          at 0 range 15 .. 15;
      HOUR           at 0 range 16 .. 21;
      AMPM           at 0 range 22 .. 22;
      HOUREN         at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ---------------------
   -- CALALR_Register --
   ---------------------

   subtype CALALR_MONTH_Field is ATSAM3X8E.UInt5;
   subtype CALALR_MTHEN_Field is ATSAM3X8E.Bit;
   subtype CALALR_DATE_Field is ATSAM3X8E.UInt6;
   subtype CALALR_DATEEN_Field is ATSAM3X8E.Bit;

   --  Calendar Alarm Register
   type CALALR_Register is record
      --  unspecified
      Reserved_0_15  : ATSAM3X8E.Short := 16#0#;
      --  Month Alarm
      MONTH          : CALALR_MONTH_Field := 16#1#;
      --  unspecified
      Reserved_21_22 : ATSAM3X8E.UInt2 := 16#0#;
      --  Month Alarm Enable
      MTHEN          : CALALR_MTHEN_Field := 16#0#;
      --  Date Alarm
      DATE           : CALALR_DATE_Field := 16#1#;
      --  unspecified
      Reserved_30_30 : ATSAM3X8E.Bit := 16#0#;
      --  Date Alarm Enable
      DATEEN         : CALALR_DATEEN_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CALALR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      MONTH          at 0 range 16 .. 20;
      Reserved_21_22 at 0 range 21 .. 22;
      MTHEN          at 0 range 23 .. 23;
      DATE           at 0 range 24 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      DATEEN         at 0 range 31 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_ACKUPD_Field is ATSAM3X8E.Bit;
   subtype SR_ALARM_Field is ATSAM3X8E.Bit;
   subtype SR_SEC_Field is ATSAM3X8E.Bit;
   subtype SR_TIMEV_Field is ATSAM3X8E.Bit;
   subtype SR_CALEV_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register_3 is record
      --  Read-only. Acknowledge for Update
      ACKUPD        : SR_ACKUPD_Field := 16#0#;
      --  Read-only. Alarm Flag
      ALARM         : SR_ALARM_Field := 16#0#;
      --  Read-only. Second Event
      SEC           : SR_SEC_Field := 16#0#;
      --  Read-only. Time Event
      TIMEV         : SR_TIMEV_Field := 16#0#;
      --  Read-only. Calendar Event
      CALEV         : SR_CALEV_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register_3 use record
      ACKUPD        at 0 range 0 .. 0;
      ALARM         at 0 range 1 .. 1;
      SEC           at 0 range 2 .. 2;
      TIMEV         at 0 range 3 .. 3;
      CALEV         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -------------------
   -- SCCR_Register --
   -------------------

   subtype SCCR_ACKCLR_Field is ATSAM3X8E.Bit;
   subtype SCCR_ALRCLR_Field is ATSAM3X8E.Bit;
   subtype SCCR_SECCLR_Field is ATSAM3X8E.Bit;
   subtype SCCR_TIMCLR_Field is ATSAM3X8E.Bit;
   subtype SCCR_CALCLR_Field is ATSAM3X8E.Bit;

   --  Status Clear Command Register
   type SCCR_Register is record
      --  Write-only. Acknowledge Clear
      ACKCLR        : SCCR_ACKCLR_Field := 16#0#;
      --  Write-only. Alarm Clear
      ALRCLR        : SCCR_ALRCLR_Field := 16#0#;
      --  Write-only. Second Clear
      SECCLR        : SCCR_SECCLR_Field := 16#0#;
      --  Write-only. Time Clear
      TIMCLR        : SCCR_TIMCLR_Field := 16#0#;
      --  Write-only. Calendar Clear
      CALCLR        : SCCR_CALCLR_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCCR_Register use record
      ACKCLR        at 0 range 0 .. 0;
      ALRCLR        at 0 range 1 .. 1;
      SECCLR        at 0 range 2 .. 2;
      TIMCLR        at 0 range 3 .. 3;
      CALCLR        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_ACKEN_Field is ATSAM3X8E.Bit;
   subtype IER_ALREN_Field is ATSAM3X8E.Bit;
   subtype IER_SECEN_Field is ATSAM3X8E.Bit;
   subtype IER_TIMEN_Field is ATSAM3X8E.Bit;
   subtype IER_CALEN_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Acknowledge Update Interrupt Enable
      ACKEN         : IER_ACKEN_Field := 16#0#;
      --  Write-only. Alarm Interrupt Enable
      ALREN         : IER_ALREN_Field := 16#0#;
      --  Write-only. Second Event Interrupt Enable
      SECEN         : IER_SECEN_Field := 16#0#;
      --  Write-only. Time Event Interrupt Enable
      TIMEN         : IER_TIMEN_Field := 16#0#;
      --  Write-only. Calendar Event Interrupt Enable
      CALEN         : IER_CALEN_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      ACKEN         at 0 range 0 .. 0;
      ALREN         at 0 range 1 .. 1;
      SECEN         at 0 range 2 .. 2;
      TIMEN         at 0 range 3 .. 3;
      CALEN         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_ACKDIS_Field is ATSAM3X8E.Bit;
   subtype IDR_ALRDIS_Field is ATSAM3X8E.Bit;
   subtype IDR_SECDIS_Field is ATSAM3X8E.Bit;
   subtype IDR_TIMDIS_Field is ATSAM3X8E.Bit;
   subtype IDR_CALDIS_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Acknowledge Update Interrupt Disable
      ACKDIS        : IDR_ACKDIS_Field := 16#0#;
      --  Write-only. Alarm Interrupt Disable
      ALRDIS        : IDR_ALRDIS_Field := 16#0#;
      --  Write-only. Second Event Interrupt Disable
      SECDIS        : IDR_SECDIS_Field := 16#0#;
      --  Write-only. Time Event Interrupt Disable
      TIMDIS        : IDR_TIMDIS_Field := 16#0#;
      --  Write-only. Calendar Event Interrupt Disable
      CALDIS        : IDR_CALDIS_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      ACKDIS        at 0 range 0 .. 0;
      ALRDIS        at 0 range 1 .. 1;
      SECDIS        at 0 range 2 .. 2;
      TIMDIS        at 0 range 3 .. 3;
      CALDIS        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_ACK_Field is ATSAM3X8E.Bit;
   subtype IMR_ALR_Field is ATSAM3X8E.Bit;
   subtype IMR_SEC_Field is ATSAM3X8E.Bit;
   subtype IMR_TIM_Field is ATSAM3X8E.Bit;
   subtype IMR_CAL_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Acknowledge Update Interrupt Mask
      ACK           : IMR_ACK_Field := 16#0#;
      --  Read-only. Alarm Interrupt Mask
      ALR           : IMR_ALR_Field := 16#0#;
      --  Read-only. Second Event Interrupt Mask
      SEC           : IMR_SEC_Field := 16#0#;
      --  Read-only. Time Event Interrupt Mask
      TIM           : IMR_TIM_Field := 16#0#;
      --  Read-only. Calendar Event Interrupt Mask
      CAL           : IMR_CAL_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : ATSAM3X8E.UInt27;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      ACK           at 0 range 0 .. 0;
      ALR           at 0 range 1 .. 1;
      SEC           at 0 range 2 .. 2;
      TIM           at 0 range 3 .. 3;
      CAL           at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   ------------------
   -- VER_Register --
   ------------------

   subtype VER_NVTIM_Field is ATSAM3X8E.Bit;
   subtype VER_NVCAL_Field is ATSAM3X8E.Bit;
   subtype VER_NVTIMALR_Field is ATSAM3X8E.Bit;
   subtype VER_NVCALALR_Field is ATSAM3X8E.Bit;

   --  Valid Entry Register
   type VER_Register is record
      --  Read-only. Non-valid Time
      NVTIM         : VER_NVTIM_Field := 16#0#;
      --  Read-only. Non-valid Calendar
      NVCAL         : VER_NVCAL_Field := 16#0#;
      --  Read-only. Non-valid Time Alarm
      NVTIMALR      : VER_NVTIMALR_Field := 16#0#;
      --  Read-only. Non-valid Calendar Alarm
      NVCALALR      : VER_NVCALALR_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : ATSAM3X8E.UInt28;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for VER_Register use record
      NVTIM         at 0 range 0 .. 0;
      NVCAL         at 0 range 1 .. 1;
      NVTIMALR      at 0 range 2 .. 2;
      NVCALALR      at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
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
      WPKEY        : WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   --  General Purpose Backup Register

   --  General Purpose Backup Register
   type GPBR_Registers is array (0 .. 7) of ATSAM3X8E.Word;

   -----------------
   -- Peripherals --
   -----------------

   --  Reset Controller
   type RSTC_Peripheral is record
      --  Control Register
      CR : CR_Register;
      --  Status Register
      SR : SR_Register;
      --  Mode Register
      MR : MR_Register;
   end record
     with Volatile;

   for RSTC_Peripheral use record
      CR at 0 range 0 .. 31;
      SR at 4 range 0 .. 31;
      MR at 8 range 0 .. 31;
   end record;

   --  Reset Controller
   RSTC_Periph : aliased RSTC_Peripheral
     with Import, Address => RSTC_Base;

   --  Supply Controller
   type SUPC_Peripheral is record
      --  Supply Controller Control Register
      CR   : CR_Register;
      --  Supply Controller Supply Monitor Mode Register
      SMMR : SMMR_Register;
      --  Supply Controller Mode Register
      MR   : MR_Register;
      --  Supply Controller Wake Up Mode Register
      WUMR : WUMR_Register;
      --  Supply Controller Wake Up Inputs Register
      WUIR : WUIR_Register;
      --  Supply Controller Status Register
      SR   : SR_Register_1;
   end record
     with Volatile;

   for SUPC_Peripheral use record
      CR   at 0 range 0 .. 31;
      SMMR at 4 range 0 .. 31;
      MR   at 8 range 0 .. 31;
      WUMR at 12 range 0 .. 31;
      WUIR at 16 range 0 .. 31;
      SR   at 20 range 0 .. 31;
   end record;

   --  Supply Controller
   SUPC_Periph : aliased SUPC_Peripheral
     with Import, Address => SUPC_Base;

   --  Real-time Timer
   type RTT_Peripheral is record
      --  Mode Register
      MR : MR_Register_1;
      --  Alarm Register
      AR : ATSAM3X8E.Word;
      --  Value Register
      VR : ATSAM3X8E.Word;
      --  Status Register
      SR : SR_Register_2;
   end record
     with Volatile;

   for RTT_Peripheral use record
      MR at 0 range 0 .. 31;
      AR at 4 range 0 .. 31;
      VR at 8 range 0 .. 31;
      SR at 12 range 0 .. 31;
   end record;

   --  Real-time Timer
   RTT_Periph : aliased RTT_Peripheral
     with Import, Address => RTT_Base;

   --  Watchdog Timer
   type WDT_Peripheral is record
      --  Control Register
      CR : CR_Register;
      --  Mode Register
      MR : MR_Register_2;
      --  Status Register
      SR : SR_Register_2;
   end record
     with Volatile;

   for WDT_Peripheral use record
      CR at 0 range 0 .. 31;
      MR at 4 range 0 .. 31;
      SR at 8 range 0 .. 31;
   end record;

   --  Watchdog Timer
   WDT_Periph : aliased WDT_Peripheral
     with Import, Address => WDT_Base;

   --  Real-time Clock
   type RTC_Peripheral is record
      --  Control Register
      CR     : CR_Register;
      --  Mode Register
      MR     : MR_Register_2;
      --  Time Register
      TIMR   : TIMR_Register;
      --  Calendar Register
      CALR   : CALR_Register;
      --  Time Alarm Register
      TIMALR : TIMALR_Register;
      --  Calendar Alarm Register
      CALALR : CALALR_Register;
      --  Status Register
      SR     : SR_Register_3;
      --  Status Clear Command Register
      SCCR   : SCCR_Register;
      --  Interrupt Enable Register
      IER    : IER_Register;
      --  Interrupt Disable Register
      IDR    : IDR_Register;
      --  Interrupt Mask Register
      IMR    : IMR_Register;
      --  Valid Entry Register
      VER    : VER_Register;
      --  Write Protect Mode Register
      WPMR   : WPMR_Register;
   end record
     with Volatile;

   for RTC_Peripheral use record
      CR     at 0 range 0 .. 31;
      MR     at 4 range 0 .. 31;
      TIMR   at 8 range 0 .. 31;
      CALR   at 12 range 0 .. 31;
      TIMALR at 16 range 0 .. 31;
      CALALR at 20 range 0 .. 31;
      SR     at 24 range 0 .. 31;
      SCCR   at 28 range 0 .. 31;
      IER    at 32 range 0 .. 31;
      IDR    at 36 range 0 .. 31;
      IMR    at 40 range 0 .. 31;
      VER    at 44 range 0 .. 31;
      WPMR   at 228 range 0 .. 31;
   end record;

   --  Real-time Clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

   --  General Purpose Backup Register
   type GPBR_Peripheral is record
      --  General Purpose Backup Register
      GPBR : GPBR_Registers;
   end record
     with Volatile;

   for GPBR_Peripheral use record
      GPBR at 0 range 0 .. 255;
   end record;

   --  General Purpose Backup Register
   GPBR_Periph : aliased GPBR_Peripheral
     with Import, Address => GPBR_Base;

end ATSAM3X8E.SYSC;
