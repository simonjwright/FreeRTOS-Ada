pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package ATSAM3X8E.TC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CCR_CLKEN_Field is ATSAM3X8E.Bit;
   subtype CCR_CLKDIS_Field is ATSAM3X8E.Bit;
   subtype CCR_SWTRG_Field is ATSAM3X8E.Bit;

   --  Channel Control Register (channel = 0)
   type CCR_Register is record
      --  Write-only. Counter Clock Enable Command
      CLKEN         : CCR_CLKEN_Field := 16#0#;
      --  Write-only. Counter Clock Disable Command
      CLKDIS        : CCR_CLKDIS_Field := 16#0#;
      --  Write-only. Software Trigger Command
      SWTRG         : CCR_SWTRG_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      CLKEN         at 0 range 0 .. 0;
      CLKDIS        at 0 range 1 .. 1;
      SWTRG         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Clock Selection
   type CMR0_TCCLKS_Field is
     (--  Clock selected: TCLK1
      TIMER_CLOCK1,
      --  Clock selected: TCLK2
      TIMER_CLOCK2,
      --  Clock selected: TCLK3
      TIMER_CLOCK3,
      --  Clock selected: TCLK4
      TIMER_CLOCK4,
      --  Clock selected: TCLK5
      TIMER_CLOCK5,
      --  Clock selected: XC0
      XC0,
      --  Clock selected: XC1
      XC1,
      --  Clock selected: XC2
      XC2)
     with Size => 3;
   for CMR0_TCCLKS_Field use
     (TIMER_CLOCK1 => 0,
      TIMER_CLOCK2 => 1,
      TIMER_CLOCK3 => 2,
      TIMER_CLOCK4 => 3,
      TIMER_CLOCK5 => 4,
      XC0 => 5,
      XC1 => 6,
      XC2 => 7);

   subtype CMR_CLKI_Field is ATSAM3X8E.Bit;

   --  Burst Signal Selection
   type CMR0_BURST_Field is
     (--  The clock is not gated by an external signal.
      NONE,
      --  XC0 is ANDed with the selected clock.
      XC0,
      --  XC1 is ANDed with the selected clock.
      XC1,
      --  XC2 is ANDed with the selected clock.
      XC2)
     with Size => 2;
   for CMR0_BURST_Field use
     (NONE => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype CMR_LDBSTOP_Field is ATSAM3X8E.Bit;
   subtype CMR_LDBDIS_Field is ATSAM3X8E.Bit;

   --  External Trigger Edge Selection
   type CMR0_ETRGEDG_Field is
     (--  The clock is not gated by an external signal.
      NONE,
      --  Rising edge
      RISING,
      --  Falling edge
      FALLING,
      --  Each edge
      EDGE)
     with Size => 2;
   for CMR0_ETRGEDG_Field use
     (NONE => 0,
      RISING => 1,
      FALLING => 2,
      EDGE => 3);

   subtype CMR_ABETRG_Field is ATSAM3X8E.Bit;
   subtype CMR_CPCTRG_Field is ATSAM3X8E.Bit;
   subtype CMR_WAVE_Field is ATSAM3X8E.Bit;

   --  RA Loading Edge Selection
   type CMR0_LDRA_Field is
     (--  None
      NONE,
      --  Rising edge of TIOA
      RISING,
      --  Falling edge of TIOA
      FALLING,
      --  Each edge of TIOA
      EDGE)
     with Size => 2;
   for CMR0_LDRA_Field use
     (NONE => 0,
      RISING => 1,
      FALLING => 2,
      EDGE => 3);

   --  RB Loading Edge Selection
   type CMR0_LDRB_Field is
     (--  None
      NONE,
      --  Rising edge of TIOA
      RISING,
      --  Falling edge of TIOA
      FALLING,
      --  Each edge of TIOA
      EDGE)
     with Size => 2;
   for CMR0_LDRB_Field use
     (NONE => 0,
      RISING => 1,
      FALLING => 2,
      EDGE => 3);

   --  Channel Mode Register (channel = 0)
   type CMR_Register is record
      --  Clock Selection
      TCCLKS         : CMR0_TCCLKS_Field := ATSAM3X8E.TC.TIMER_CLOCK1;
      --  Clock Invert
      CLKI           : CMR_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST          : CMR0_BURST_Field := ATSAM3X8E.TC.NONE;
      --  Counter Clock Stopped with RB Loading
      LDBSTOP        : CMR_LDBSTOP_Field := 16#0#;
      --  Counter Clock Disable with RB Loading
      LDBDIS         : CMR_LDBDIS_Field := 16#0#;
      --  External Trigger Edge Selection
      ETRGEDG        : CMR0_ETRGEDG_Field := ATSAM3X8E.TC.NONE;
      --  TIOA or TIOB External Trigger Selection
      ABETRG         : CMR_ABETRG_Field := 16#0#;
      --  unspecified
      Reserved_11_13 : ATSAM3X8E.UInt3 := 16#0#;
      --  RC Compare Trigger Enable
      CPCTRG         : CMR_CPCTRG_Field := 16#0#;
      --  Waveform Mode
      WAVE           : CMR_WAVE_Field := 16#0#;
      --  RA Loading Edge Selection
      LDRA           : CMR0_LDRA_Field := ATSAM3X8E.TC.NONE;
      --  RB Loading Edge Selection
      LDRB           : CMR0_LDRB_Field := ATSAM3X8E.TC.NONE;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMR_Register use record
      TCCLKS         at 0 range 0 .. 2;
      CLKI           at 0 range 3 .. 3;
      BURST          at 0 range 4 .. 5;
      LDBSTOP        at 0 range 6 .. 6;
      LDBDIS         at 0 range 7 .. 7;
      ETRGEDG        at 0 range 8 .. 9;
      ABETRG         at 0 range 10 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      CPCTRG         at 0 range 14 .. 14;
      WAVE           at 0 range 15 .. 15;
      LDRA           at 0 range 16 .. 17;
      LDRB           at 0 range 18 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Clock Selection
   type CMR0_WAVE_EQ_1_TCCLKS_Field is
     (--  Clock selected: TCLK1
      TIMER_CLOCK1,
      --  Clock selected: TCLK2
      TIMER_CLOCK2,
      --  Clock selected: TCLK3
      TIMER_CLOCK3,
      --  Clock selected: TCLK4
      TIMER_CLOCK4,
      --  Clock selected: TCLK5
      TIMER_CLOCK5,
      --  Clock selected: XC0
      XC0,
      --  Clock selected: XC1
      XC1,
      --  Clock selected: XC2
      XC2)
     with Size => 3;
   for CMR0_WAVE_EQ_1_TCCLKS_Field use
     (TIMER_CLOCK1 => 0,
      TIMER_CLOCK2 => 1,
      TIMER_CLOCK3 => 2,
      TIMER_CLOCK4 => 3,
      TIMER_CLOCK5 => 4,
      XC0 => 5,
      XC1 => 6,
      XC2 => 7);

   subtype TC0_CMR0_WAVE_EQ_1_CLKI_Field is ATSAM3X8E.Bit;

   --  Burst Signal Selection
   type CMR0_WAVE_EQ_1_BURST_Field is
     (--  The clock is not gated by an external signal.
      NONE,
      --  XC0 is ANDed with the selected clock.
      XC0,
      --  XC1 is ANDed with the selected clock.
      XC1,
      --  XC2 is ANDed with the selected clock.
      XC2)
     with Size => 2;
   for CMR0_WAVE_EQ_1_BURST_Field use
     (NONE => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype TC0_CMR0_WAVE_EQ_1_CPCSTOP_Field is ATSAM3X8E.Bit;
   subtype TC0_CMR0_WAVE_EQ_1_CPCDIS_Field is ATSAM3X8E.Bit;

   --  External Event Edge Selection
   type CMR0_WAVE_EQ_1_EEVTEDG_Field is
     (--  None
      NONE,
      --  Rising edge
      RISING,
      --  Falling edge
      FALLING,
      --  Each edge
      EDGE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_EEVTEDG_Field use
     (NONE => 0,
      RISING => 1,
      FALLING => 2,
      EDGE => 3);

   --  External Event Selection
   type CMR0_WAVE_EQ_1_EEVT_Field is
     (--  TIOB
      TIOB,
      --  XC0
      XC0,
      --  XC1
      XC1,
      --  XC2
      XC2)
     with Size => 2;
   for CMR0_WAVE_EQ_1_EEVT_Field use
     (TIOB => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype TC0_CMR0_WAVE_EQ_1_ENETRG_Field is ATSAM3X8E.Bit;

   --  Waveform Selection
   type CMR0_WAVE_EQ_1_WAVSEL_Field is
     (--  UP mode without automatic trigger on RC Compare
      UP,
      --  UPDOWN mode without automatic trigger on RC Compare
      UPDOWN,
      --  UP mode with automatic trigger on RC Compare
      UP_RC,
      --  UPDOWN mode with automatic trigger on RC Compare
      UPDOWN_RC)
     with Size => 2;
   for CMR0_WAVE_EQ_1_WAVSEL_Field use
     (UP => 0,
      UPDOWN => 1,
      UP_RC => 2,
      UPDOWN_RC => 3);

   subtype TC0_CMR0_WAVE_EQ_1_WAVE_Field is ATSAM3X8E.Bit;

   --  RA Compare Effect on TIOA
   type CMR0_WAVE_EQ_1_ACPA_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_ACPA_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RC Compare Effect on TIOA
   type CMR0_WAVE_EQ_1_ACPC_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_ACPC_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  External Event Effect on TIOA
   type CMR0_WAVE_EQ_1_AEEVT_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_AEEVT_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Software Trigger Effect on TIOA
   type CMR0_WAVE_EQ_1_ASWTRG_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_ASWTRG_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RB Compare Effect on TIOB
   type CMR0_WAVE_EQ_1_BCPB_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_BCPB_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RC Compare Effect on TIOB
   type CMR0_WAVE_EQ_1_BCPC_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_BCPC_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  External Event Effect on TIOB
   type CMR0_WAVE_EQ_1_BEEVT_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_BEEVT_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Software Trigger Effect on TIOB
   type CMR0_WAVE_EQ_1_BSWTRG_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR0_WAVE_EQ_1_BSWTRG_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Channel Mode Register (channel = 0)
   type TC0_CMR0_WAVE_EQ_1_Register is record
      --  Clock Selection
      TCCLKS  : CMR0_WAVE_EQ_1_TCCLKS_Field := ATSAM3X8E.TC.TIMER_CLOCK1;
      --  Clock Invert
      CLKI    : TC0_CMR0_WAVE_EQ_1_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST   : CMR0_WAVE_EQ_1_BURST_Field := ATSAM3X8E.TC.NONE;
      --  Counter Clock Stopped with RC Compare
      CPCSTOP : TC0_CMR0_WAVE_EQ_1_CPCSTOP_Field := 16#0#;
      --  Counter Clock Disable with RC Compare
      CPCDIS  : TC0_CMR0_WAVE_EQ_1_CPCDIS_Field := 16#0#;
      --  External Event Edge Selection
      EEVTEDG : CMR0_WAVE_EQ_1_EEVTEDG_Field := ATSAM3X8E.TC.NONE;
      --  External Event Selection
      EEVT    : CMR0_WAVE_EQ_1_EEVT_Field := ATSAM3X8E.TC.TIOB;
      --  External Event Trigger Enable
      ENETRG  : TC0_CMR0_WAVE_EQ_1_ENETRG_Field := 16#0#;
      --  Waveform Selection
      WAVSEL  : CMR0_WAVE_EQ_1_WAVSEL_Field := ATSAM3X8E.TC.UP;
      --  Waveform Mode
      WAVE    : TC0_CMR0_WAVE_EQ_1_WAVE_Field := 16#0#;
      --  RA Compare Effect on TIOA
      ACPA    : CMR0_WAVE_EQ_1_ACPA_Field := ATSAM3X8E.TC.NONE;
      --  RC Compare Effect on TIOA
      ACPC    : CMR0_WAVE_EQ_1_ACPC_Field := ATSAM3X8E.TC.NONE;
      --  External Event Effect on TIOA
      AEEVT   : CMR0_WAVE_EQ_1_AEEVT_Field := ATSAM3X8E.TC.NONE;
      --  Software Trigger Effect on TIOA
      ASWTRG  : CMR0_WAVE_EQ_1_ASWTRG_Field := ATSAM3X8E.TC.NONE;
      --  RB Compare Effect on TIOB
      BCPB    : CMR0_WAVE_EQ_1_BCPB_Field := ATSAM3X8E.TC.NONE;
      --  RC Compare Effect on TIOB
      BCPC    : CMR0_WAVE_EQ_1_BCPC_Field := ATSAM3X8E.TC.NONE;
      --  External Event Effect on TIOB
      BEEVT   : CMR0_WAVE_EQ_1_BEEVT_Field := ATSAM3X8E.TC.NONE;
      --  Software Trigger Effect on TIOB
      BSWTRG  : CMR0_WAVE_EQ_1_BSWTRG_Field := ATSAM3X8E.TC.NONE;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_CMR0_WAVE_EQ_1_Register use record
      TCCLKS  at 0 range 0 .. 2;
      CLKI    at 0 range 3 .. 3;
      BURST   at 0 range 4 .. 5;
      CPCSTOP at 0 range 6 .. 6;
      CPCDIS  at 0 range 7 .. 7;
      EEVTEDG at 0 range 8 .. 9;
      EEVT    at 0 range 10 .. 11;
      ENETRG  at 0 range 12 .. 12;
      WAVSEL  at 0 range 13 .. 14;
      WAVE    at 0 range 15 .. 15;
      ACPA    at 0 range 16 .. 17;
      ACPC    at 0 range 18 .. 19;
      AEEVT   at 0 range 20 .. 21;
      ASWTRG  at 0 range 22 .. 23;
      BCPB    at 0 range 24 .. 25;
      BCPC    at 0 range 26 .. 27;
      BEEVT   at 0 range 28 .. 29;
      BSWTRG  at 0 range 30 .. 31;
   end record;

   subtype SMMR_GCEN_Field is ATSAM3X8E.Bit;
   subtype SMMR_DOWN_Field is ATSAM3X8E.Bit;

   --  Stepper Motor Mode Register (channel = 0)
   type SMMR_Register is record
      --  Gray Count Enable
      GCEN          : SMMR_GCEN_Field := 16#0#;
      --  DOWN Count
      DOWN          : SMMR_DOWN_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SMMR_Register use record
      GCEN          at 0 range 0 .. 0;
      DOWN          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype SR_COVFS_Field is ATSAM3X8E.Bit;
   subtype SR_LOVRS_Field is ATSAM3X8E.Bit;
   subtype SR_CPAS_Field is ATSAM3X8E.Bit;
   subtype SR_CPBS_Field is ATSAM3X8E.Bit;
   subtype SR_CPCS_Field is ATSAM3X8E.Bit;
   subtype SR_LDRAS_Field is ATSAM3X8E.Bit;
   subtype SR_LDRBS_Field is ATSAM3X8E.Bit;
   subtype SR_ETRGS_Field is ATSAM3X8E.Bit;
   subtype SR_CLKSTA_Field is ATSAM3X8E.Bit;
   subtype SR_MTIOA_Field is ATSAM3X8E.Bit;
   subtype SR_MTIOB_Field is ATSAM3X8E.Bit;

   --  Status Register (channel = 0)
   type SR_Register is record
      --  Read-only. Counter Overflow Status
      COVFS          : SR_COVFS_Field;
      --  Read-only. Load Overrun Status
      LOVRS          : SR_LOVRS_Field;
      --  Read-only. RA Compare Status
      CPAS           : SR_CPAS_Field;
      --  Read-only. RB Compare Status
      CPBS           : SR_CPBS_Field;
      --  Read-only. RC Compare Status
      CPCS           : SR_CPCS_Field;
      --  Read-only. RA Loading Status
      LDRAS          : SR_LDRAS_Field;
      --  Read-only. RB Loading Status
      LDRBS          : SR_LDRBS_Field;
      --  Read-only. External Trigger Status
      ETRGS          : SR_ETRGS_Field;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Clock Enabling Status
      CLKSTA         : SR_CLKSTA_Field;
      --  Read-only. TIOA Mirror
      MTIOA          : SR_MTIOA_Field;
      --  Read-only. TIOB Mirror
      MTIOB          : SR_MTIOB_Field;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
      COVFS          at 0 range 0 .. 0;
      LOVRS          at 0 range 1 .. 1;
      CPAS           at 0 range 2 .. 2;
      CPBS           at 0 range 3 .. 3;
      CPCS           at 0 range 4 .. 4;
      LDRAS          at 0 range 5 .. 5;
      LDRBS          at 0 range 6 .. 6;
      ETRGS          at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      CLKSTA         at 0 range 16 .. 16;
      MTIOA          at 0 range 17 .. 17;
      MTIOB          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype IER_COVFS_Field is ATSAM3X8E.Bit;
   subtype IER_LOVRS_Field is ATSAM3X8E.Bit;
   subtype IER_CPAS_Field is ATSAM3X8E.Bit;
   subtype IER_CPBS_Field is ATSAM3X8E.Bit;
   subtype IER_CPCS_Field is ATSAM3X8E.Bit;
   subtype IER_LDRAS_Field is ATSAM3X8E.Bit;
   subtype IER_LDRBS_Field is ATSAM3X8E.Bit;
   subtype IER_ETRGS_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register (channel = 0)
   type IER_Register is record
      --  Write-only. Counter Overflow
      COVFS         : IER_COVFS_Field := 16#0#;
      --  Write-only. Load Overrun
      LOVRS         : IER_LOVRS_Field := 16#0#;
      --  Write-only. RA Compare
      CPAS          : IER_CPAS_Field := 16#0#;
      --  Write-only. RB Compare
      CPBS          : IER_CPBS_Field := 16#0#;
      --  Write-only. RC Compare
      CPCS          : IER_CPCS_Field := 16#0#;
      --  Write-only. RA Loading
      LDRAS         : IER_LDRAS_Field := 16#0#;
      --  Write-only. RB Loading
      LDRBS         : IER_LDRBS_Field := 16#0#;
      --  Write-only. External Trigger
      ETRGS         : IER_ETRGS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      COVFS         at 0 range 0 .. 0;
      LOVRS         at 0 range 1 .. 1;
      CPAS          at 0 range 2 .. 2;
      CPBS          at 0 range 3 .. 3;
      CPCS          at 0 range 4 .. 4;
      LDRAS         at 0 range 5 .. 5;
      LDRBS         at 0 range 6 .. 6;
      ETRGS         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype IDR_COVFS_Field is ATSAM3X8E.Bit;
   subtype IDR_LOVRS_Field is ATSAM3X8E.Bit;
   subtype IDR_CPAS_Field is ATSAM3X8E.Bit;
   subtype IDR_CPBS_Field is ATSAM3X8E.Bit;
   subtype IDR_CPCS_Field is ATSAM3X8E.Bit;
   subtype IDR_LDRAS_Field is ATSAM3X8E.Bit;
   subtype IDR_LDRBS_Field is ATSAM3X8E.Bit;
   subtype IDR_ETRGS_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register (channel = 0)
   type IDR_Register is record
      --  Write-only. Counter Overflow
      COVFS         : IDR_COVFS_Field := 16#0#;
      --  Write-only. Load Overrun
      LOVRS         : IDR_LOVRS_Field := 16#0#;
      --  Write-only. RA Compare
      CPAS          : IDR_CPAS_Field := 16#0#;
      --  Write-only. RB Compare
      CPBS          : IDR_CPBS_Field := 16#0#;
      --  Write-only. RC Compare
      CPCS          : IDR_CPCS_Field := 16#0#;
      --  Write-only. RA Loading
      LDRAS         : IDR_LDRAS_Field := 16#0#;
      --  Write-only. RB Loading
      LDRBS         : IDR_LDRBS_Field := 16#0#;
      --  Write-only. External Trigger
      ETRGS         : IDR_ETRGS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      COVFS         at 0 range 0 .. 0;
      LOVRS         at 0 range 1 .. 1;
      CPAS          at 0 range 2 .. 2;
      CPBS          at 0 range 3 .. 3;
      CPCS          at 0 range 4 .. 4;
      LDRAS         at 0 range 5 .. 5;
      LDRBS         at 0 range 6 .. 6;
      ETRGS         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype IMR_COVFS_Field is ATSAM3X8E.Bit;
   subtype IMR_LOVRS_Field is ATSAM3X8E.Bit;
   subtype IMR_CPAS_Field is ATSAM3X8E.Bit;
   subtype IMR_CPBS_Field is ATSAM3X8E.Bit;
   subtype IMR_CPCS_Field is ATSAM3X8E.Bit;
   subtype IMR_LDRAS_Field is ATSAM3X8E.Bit;
   subtype IMR_LDRBS_Field is ATSAM3X8E.Bit;
   subtype IMR_ETRGS_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register (channel = 0)
   type IMR_Register is record
      --  Read-only. Counter Overflow
      COVFS         : IMR_COVFS_Field;
      --  Read-only. Load Overrun
      LOVRS         : IMR_LOVRS_Field;
      --  Read-only. RA Compare
      CPAS          : IMR_CPAS_Field;
      --  Read-only. RB Compare
      CPBS          : IMR_CPBS_Field;
      --  Read-only. RC Compare
      CPCS          : IMR_CPCS_Field;
      --  Read-only. RA Loading
      LDRAS         : IMR_LDRAS_Field;
      --  Read-only. RB Loading
      LDRBS         : IMR_LDRBS_Field;
      --  Read-only. External Trigger
      ETRGS         : IMR_ETRGS_Field;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      COVFS         at 0 range 0 .. 0;
      LOVRS         at 0 range 1 .. 1;
      CPAS          at 0 range 2 .. 2;
      CPBS          at 0 range 3 .. 3;
      CPCS          at 0 range 4 .. 4;
      LDRAS         at 0 range 5 .. 5;
      LDRBS         at 0 range 6 .. 6;
      ETRGS         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Clock Selection
   type CMR1_WAVE_EQ_1_TCCLKS_Field is
     (--  Clock selected: TCLK1
      TIMER_CLOCK1,
      --  Clock selected: TCLK2
      TIMER_CLOCK2,
      --  Clock selected: TCLK3
      TIMER_CLOCK3,
      --  Clock selected: TCLK4
      TIMER_CLOCK4,
      --  Clock selected: TCLK5
      TIMER_CLOCK5,
      --  Clock selected: XC0
      XC0,
      --  Clock selected: XC1
      XC1,
      --  Clock selected: XC2
      XC2)
     with Size => 3;
   for CMR1_WAVE_EQ_1_TCCLKS_Field use
     (TIMER_CLOCK1 => 0,
      TIMER_CLOCK2 => 1,
      TIMER_CLOCK3 => 2,
      TIMER_CLOCK4 => 3,
      TIMER_CLOCK5 => 4,
      XC0 => 5,
      XC1 => 6,
      XC2 => 7);

   subtype TC0_CMR1_WAVE_EQ_1_CLKI_Field is ATSAM3X8E.Bit;

   --  Burst Signal Selection
   type CMR1_WAVE_EQ_1_BURST_Field is
     (--  The clock is not gated by an external signal.
      NONE,
      --  XC0 is ANDed with the selected clock.
      XC0,
      --  XC1 is ANDed with the selected clock.
      XC1,
      --  XC2 is ANDed with the selected clock.
      XC2)
     with Size => 2;
   for CMR1_WAVE_EQ_1_BURST_Field use
     (NONE => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype TC0_CMR1_WAVE_EQ_1_CPCSTOP_Field is ATSAM3X8E.Bit;
   subtype TC0_CMR1_WAVE_EQ_1_CPCDIS_Field is ATSAM3X8E.Bit;

   --  External Event Edge Selection
   type CMR1_WAVE_EQ_1_EEVTEDG_Field is
     (--  None
      NONE,
      --  Rising edge
      RISING,
      --  Falling edge
      FALLING,
      --  Each edge
      EDGE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_EEVTEDG_Field use
     (NONE => 0,
      RISING => 1,
      FALLING => 2,
      EDGE => 3);

   --  External Event Selection
   type CMR1_WAVE_EQ_1_EEVT_Field is
     (--  TIOB
      TIOB,
      --  XC0
      XC0,
      --  XC1
      XC1,
      --  XC2
      XC2)
     with Size => 2;
   for CMR1_WAVE_EQ_1_EEVT_Field use
     (TIOB => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype TC0_CMR1_WAVE_EQ_1_ENETRG_Field is ATSAM3X8E.Bit;

   --  Waveform Selection
   type CMR1_WAVE_EQ_1_WAVSEL_Field is
     (--  UP mode without automatic trigger on RC Compare
      UP,
      --  UPDOWN mode without automatic trigger on RC Compare
      UPDOWN,
      --  UP mode with automatic trigger on RC Compare
      UP_RC,
      --  UPDOWN mode with automatic trigger on RC Compare
      UPDOWN_RC)
     with Size => 2;
   for CMR1_WAVE_EQ_1_WAVSEL_Field use
     (UP => 0,
      UPDOWN => 1,
      UP_RC => 2,
      UPDOWN_RC => 3);

   subtype TC0_CMR1_WAVE_EQ_1_WAVE_Field is ATSAM3X8E.Bit;

   --  RA Compare Effect on TIOA
   type CMR1_WAVE_EQ_1_ACPA_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_ACPA_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RC Compare Effect on TIOA
   type CMR1_WAVE_EQ_1_ACPC_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_ACPC_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  External Event Effect on TIOA
   type CMR1_WAVE_EQ_1_AEEVT_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_AEEVT_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Software Trigger Effect on TIOA
   type CMR1_WAVE_EQ_1_ASWTRG_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_ASWTRG_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RB Compare Effect on TIOB
   type CMR1_WAVE_EQ_1_BCPB_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_BCPB_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RC Compare Effect on TIOB
   type CMR1_WAVE_EQ_1_BCPC_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_BCPC_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  External Event Effect on TIOB
   type CMR1_WAVE_EQ_1_BEEVT_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_BEEVT_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Software Trigger Effect on TIOB
   type CMR1_WAVE_EQ_1_BSWTRG_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR1_WAVE_EQ_1_BSWTRG_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Channel Mode Register (channel = 1)
   type TC0_CMR1_WAVE_EQ_1_Register is record
      --  Clock Selection
      TCCLKS  : CMR1_WAVE_EQ_1_TCCLKS_Field := ATSAM3X8E.TC.TIMER_CLOCK1;
      --  Clock Invert
      CLKI    : TC0_CMR1_WAVE_EQ_1_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST   : CMR1_WAVE_EQ_1_BURST_Field := ATSAM3X8E.TC.NONE;
      --  Counter Clock Stopped with RC Compare
      CPCSTOP : TC0_CMR1_WAVE_EQ_1_CPCSTOP_Field := 16#0#;
      --  Counter Clock Disable with RC Compare
      CPCDIS  : TC0_CMR1_WAVE_EQ_1_CPCDIS_Field := 16#0#;
      --  External Event Edge Selection
      EEVTEDG : CMR1_WAVE_EQ_1_EEVTEDG_Field := ATSAM3X8E.TC.NONE;
      --  External Event Selection
      EEVT    : CMR1_WAVE_EQ_1_EEVT_Field := ATSAM3X8E.TC.TIOB;
      --  External Event Trigger Enable
      ENETRG  : TC0_CMR1_WAVE_EQ_1_ENETRG_Field := 16#0#;
      --  Waveform Selection
      WAVSEL  : CMR1_WAVE_EQ_1_WAVSEL_Field := ATSAM3X8E.TC.UP;
      --  Waveform Mode
      WAVE    : TC0_CMR1_WAVE_EQ_1_WAVE_Field := 16#0#;
      --  RA Compare Effect on TIOA
      ACPA    : CMR1_WAVE_EQ_1_ACPA_Field := ATSAM3X8E.TC.NONE;
      --  RC Compare Effect on TIOA
      ACPC    : CMR1_WAVE_EQ_1_ACPC_Field := ATSAM3X8E.TC.NONE;
      --  External Event Effect on TIOA
      AEEVT   : CMR1_WAVE_EQ_1_AEEVT_Field := ATSAM3X8E.TC.NONE;
      --  Software Trigger Effect on TIOA
      ASWTRG  : CMR1_WAVE_EQ_1_ASWTRG_Field := ATSAM3X8E.TC.NONE;
      --  RB Compare Effect on TIOB
      BCPB    : CMR1_WAVE_EQ_1_BCPB_Field := ATSAM3X8E.TC.NONE;
      --  RC Compare Effect on TIOB
      BCPC    : CMR1_WAVE_EQ_1_BCPC_Field := ATSAM3X8E.TC.NONE;
      --  External Event Effect on TIOB
      BEEVT   : CMR1_WAVE_EQ_1_BEEVT_Field := ATSAM3X8E.TC.NONE;
      --  Software Trigger Effect on TIOB
      BSWTRG  : CMR1_WAVE_EQ_1_BSWTRG_Field := ATSAM3X8E.TC.NONE;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_CMR1_WAVE_EQ_1_Register use record
      TCCLKS  at 0 range 0 .. 2;
      CLKI    at 0 range 3 .. 3;
      BURST   at 0 range 4 .. 5;
      CPCSTOP at 0 range 6 .. 6;
      CPCDIS  at 0 range 7 .. 7;
      EEVTEDG at 0 range 8 .. 9;
      EEVT    at 0 range 10 .. 11;
      ENETRG  at 0 range 12 .. 12;
      WAVSEL  at 0 range 13 .. 14;
      WAVE    at 0 range 15 .. 15;
      ACPA    at 0 range 16 .. 17;
      ACPC    at 0 range 18 .. 19;
      AEEVT   at 0 range 20 .. 21;
      ASWTRG  at 0 range 22 .. 23;
      BCPB    at 0 range 24 .. 25;
      BCPC    at 0 range 26 .. 27;
      BEEVT   at 0 range 28 .. 29;
      BSWTRG  at 0 range 30 .. 31;
   end record;

   --  Clock Selection
   type CMR2_WAVE_EQ_1_TCCLKS_Field is
     (--  Clock selected: TCLK1
      TIMER_CLOCK1,
      --  Clock selected: TCLK2
      TIMER_CLOCK2,
      --  Clock selected: TCLK3
      TIMER_CLOCK3,
      --  Clock selected: TCLK4
      TIMER_CLOCK4,
      --  Clock selected: TCLK5
      TIMER_CLOCK5,
      --  Clock selected: XC0
      XC0,
      --  Clock selected: XC1
      XC1,
      --  Clock selected: XC2
      XC2)
     with Size => 3;
   for CMR2_WAVE_EQ_1_TCCLKS_Field use
     (TIMER_CLOCK1 => 0,
      TIMER_CLOCK2 => 1,
      TIMER_CLOCK3 => 2,
      TIMER_CLOCK4 => 3,
      TIMER_CLOCK5 => 4,
      XC0 => 5,
      XC1 => 6,
      XC2 => 7);

   subtype TC0_CMR2_WAVE_EQ_1_CLKI_Field is ATSAM3X8E.Bit;

   --  Burst Signal Selection
   type CMR2_WAVE_EQ_1_BURST_Field is
     (--  The clock is not gated by an external signal.
      NONE,
      --  XC0 is ANDed with the selected clock.
      XC0,
      --  XC1 is ANDed with the selected clock.
      XC1,
      --  XC2 is ANDed with the selected clock.
      XC2)
     with Size => 2;
   for CMR2_WAVE_EQ_1_BURST_Field use
     (NONE => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype TC0_CMR2_WAVE_EQ_1_CPCSTOP_Field is ATSAM3X8E.Bit;
   subtype TC0_CMR2_WAVE_EQ_1_CPCDIS_Field is ATSAM3X8E.Bit;

   --  External Event Edge Selection
   type CMR2_WAVE_EQ_1_EEVTEDG_Field is
     (--  None
      NONE,
      --  Rising edge
      RISING,
      --  Falling edge
      FALLING,
      --  Each edge
      EDGE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_EEVTEDG_Field use
     (NONE => 0,
      RISING => 1,
      FALLING => 2,
      EDGE => 3);

   --  External Event Selection
   type CMR2_WAVE_EQ_1_EEVT_Field is
     (--  TIOB
      TIOB,
      --  XC0
      XC0,
      --  XC1
      XC1,
      --  XC2
      XC2)
     with Size => 2;
   for CMR2_WAVE_EQ_1_EEVT_Field use
     (TIOB => 0,
      XC0 => 1,
      XC1 => 2,
      XC2 => 3);

   subtype TC0_CMR2_WAVE_EQ_1_ENETRG_Field is ATSAM3X8E.Bit;

   --  Waveform Selection
   type CMR2_WAVE_EQ_1_WAVSEL_Field is
     (--  UP mode without automatic trigger on RC Compare
      UP,
      --  UPDOWN mode without automatic trigger on RC Compare
      UPDOWN,
      --  UP mode with automatic trigger on RC Compare
      UP_RC,
      --  UPDOWN mode with automatic trigger on RC Compare
      UPDOWN_RC)
     with Size => 2;
   for CMR2_WAVE_EQ_1_WAVSEL_Field use
     (UP => 0,
      UPDOWN => 1,
      UP_RC => 2,
      UPDOWN_RC => 3);

   subtype TC0_CMR2_WAVE_EQ_1_WAVE_Field is ATSAM3X8E.Bit;

   --  RA Compare Effect on TIOA
   type CMR2_WAVE_EQ_1_ACPA_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_ACPA_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RC Compare Effect on TIOA
   type CMR2_WAVE_EQ_1_ACPC_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_ACPC_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  External Event Effect on TIOA
   type CMR2_WAVE_EQ_1_AEEVT_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_AEEVT_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Software Trigger Effect on TIOA
   type CMR2_WAVE_EQ_1_ASWTRG_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_ASWTRG_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RB Compare Effect on TIOB
   type CMR2_WAVE_EQ_1_BCPB_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_BCPB_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  RC Compare Effect on TIOB
   type CMR2_WAVE_EQ_1_BCPC_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_BCPC_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  External Event Effect on TIOB
   type CMR2_WAVE_EQ_1_BEEVT_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_BEEVT_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Software Trigger Effect on TIOB
   type CMR2_WAVE_EQ_1_BSWTRG_Field is
     (--  None
      NONE,
      --  Set
      SET,
      --  Clear
      CLEAR,
      --  Toggle
      TOGGLE)
     with Size => 2;
   for CMR2_WAVE_EQ_1_BSWTRG_Field use
     (NONE => 0,
      SET => 1,
      CLEAR => 2,
      TOGGLE => 3);

   --  Channel Mode Register (channel = 2)
   type TC0_CMR2_WAVE_EQ_1_Register is record
      --  Clock Selection
      TCCLKS  : CMR2_WAVE_EQ_1_TCCLKS_Field := ATSAM3X8E.TC.TIMER_CLOCK1;
      --  Clock Invert
      CLKI    : TC0_CMR2_WAVE_EQ_1_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST   : CMR2_WAVE_EQ_1_BURST_Field := ATSAM3X8E.TC.NONE;
      --  Counter Clock Stopped with RC Compare
      CPCSTOP : TC0_CMR2_WAVE_EQ_1_CPCSTOP_Field := 16#0#;
      --  Counter Clock Disable with RC Compare
      CPCDIS  : TC0_CMR2_WAVE_EQ_1_CPCDIS_Field := 16#0#;
      --  External Event Edge Selection
      EEVTEDG : CMR2_WAVE_EQ_1_EEVTEDG_Field := ATSAM3X8E.TC.NONE;
      --  External Event Selection
      EEVT    : CMR2_WAVE_EQ_1_EEVT_Field := ATSAM3X8E.TC.TIOB;
      --  External Event Trigger Enable
      ENETRG  : TC0_CMR2_WAVE_EQ_1_ENETRG_Field := 16#0#;
      --  Waveform Selection
      WAVSEL  : CMR2_WAVE_EQ_1_WAVSEL_Field := ATSAM3X8E.TC.UP;
      --  Waveform Mode
      WAVE    : TC0_CMR2_WAVE_EQ_1_WAVE_Field := 16#0#;
      --  RA Compare Effect on TIOA
      ACPA    : CMR2_WAVE_EQ_1_ACPA_Field := ATSAM3X8E.TC.NONE;
      --  RC Compare Effect on TIOA
      ACPC    : CMR2_WAVE_EQ_1_ACPC_Field := ATSAM3X8E.TC.NONE;
      --  External Event Effect on TIOA
      AEEVT   : CMR2_WAVE_EQ_1_AEEVT_Field := ATSAM3X8E.TC.NONE;
      --  Software Trigger Effect on TIOA
      ASWTRG  : CMR2_WAVE_EQ_1_ASWTRG_Field := ATSAM3X8E.TC.NONE;
      --  RB Compare Effect on TIOB
      BCPB    : CMR2_WAVE_EQ_1_BCPB_Field := ATSAM3X8E.TC.NONE;
      --  RC Compare Effect on TIOB
      BCPC    : CMR2_WAVE_EQ_1_BCPC_Field := ATSAM3X8E.TC.NONE;
      --  External Event Effect on TIOB
      BEEVT   : CMR2_WAVE_EQ_1_BEEVT_Field := ATSAM3X8E.TC.NONE;
      --  Software Trigger Effect on TIOB
      BSWTRG  : CMR2_WAVE_EQ_1_BSWTRG_Field := ATSAM3X8E.TC.NONE;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_CMR2_WAVE_EQ_1_Register use record
      TCCLKS  at 0 range 0 .. 2;
      CLKI    at 0 range 3 .. 3;
      BURST   at 0 range 4 .. 5;
      CPCSTOP at 0 range 6 .. 6;
      CPCDIS  at 0 range 7 .. 7;
      EEVTEDG at 0 range 8 .. 9;
      EEVT    at 0 range 10 .. 11;
      ENETRG  at 0 range 12 .. 12;
      WAVSEL  at 0 range 13 .. 14;
      WAVE    at 0 range 15 .. 15;
      ACPA    at 0 range 16 .. 17;
      ACPC    at 0 range 18 .. 19;
      AEEVT   at 0 range 20 .. 21;
      ASWTRG  at 0 range 22 .. 23;
      BCPB    at 0 range 24 .. 25;
      BCPC    at 0 range 26 .. 27;
      BEEVT   at 0 range 28 .. 29;
      BSWTRG  at 0 range 30 .. 31;
   end record;

   subtype TC0_BCR_SYNC_Field is ATSAM3X8E.Bit;

   --  Block Control Register
   type TC0_BCR_Register is record
      --  Write-only. Synchro Command
      SYNC          : TC0_BCR_SYNC_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_BCR_Register use record
      SYNC          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  External Clock Signal 0 Selection
   type BMR_TC0XC0S_Field is
     (--  Signal connected to XC0: TCLK0
      TCLK0,
      --  Signal connected to XC0: TIOA1
      TIOA1,
      --  Signal connected to XC0: TIOA2
      TIOA2)
     with Size => 2;
   for BMR_TC0XC0S_Field use
     (TCLK0 => 0,
      TIOA1 => 2,
      TIOA2 => 3);

   --  External Clock Signal 1 Selection
   type BMR_TC1XC1S_Field is
     (--  Signal connected to XC1: TCLK1
      TCLK1,
      --  Signal connected to XC1: TIOA0
      TIOA0,
      --  Signal connected to XC1: TIOA2
      TIOA2)
     with Size => 2;
   for BMR_TC1XC1S_Field use
     (TCLK1 => 0,
      TIOA0 => 2,
      TIOA2 => 3);

   --  External Clock Signal 2 Selection
   type BMR_TC2XC2S_Field is
     (--  Signal connected to XC2: TCLK2
      TCLK2,
      --  Signal connected to XC2: TIOA1
      TIOA1,
      --  Signal connected to XC2: TIOA2
      TIOA2)
     with Size => 2;
   for BMR_TC2XC2S_Field use
     (TCLK2 => 0,
      TIOA1 => 2,
      TIOA2 => 3);

   subtype TC0_BMR_QDEN_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_POSEN_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_SPEEDEN_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_QDTRANS_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_EDGPHA_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_INVA_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_INVB_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_INVIDX_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_SWAP_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_IDXPHB_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_FILTER_Field is ATSAM3X8E.Bit;
   subtype TC0_BMR_MAXFILT_Field is ATSAM3X8E.UInt6;

   --  Block Mode Register
   type TC0_BMR_Register is record
      --  External Clock Signal 0 Selection
      TC0XC0S        : BMR_TC0XC0S_Field := ATSAM3X8E.TC.TCLK0;
      --  External Clock Signal 1 Selection
      TC1XC1S        : BMR_TC1XC1S_Field := ATSAM3X8E.TC.TCLK1;
      --  External Clock Signal 2 Selection
      TC2XC2S        : BMR_TC2XC2S_Field := ATSAM3X8E.TC.TCLK2;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Quadrature Decoder ENabled
      QDEN           : TC0_BMR_QDEN_Field := 16#0#;
      --  POSition ENabled
      POSEN          : TC0_BMR_POSEN_Field := 16#0#;
      --  SPEED ENabled
      SPEEDEN        : TC0_BMR_SPEEDEN_Field := 16#0#;
      --  Quadrature Decoding TRANSparent
      QDTRANS        : TC0_BMR_QDTRANS_Field := 16#0#;
      --  EDGe on PHA count mode
      EDGPHA         : TC0_BMR_EDGPHA_Field := 16#0#;
      --  INVerted phA
      INVA           : TC0_BMR_INVA_Field := 16#0#;
      --  INVerted phB
      INVB           : TC0_BMR_INVB_Field := 16#0#;
      --  INVerted InDeX
      INVIDX         : TC0_BMR_INVIDX_Field := 16#0#;
      --  SWAP PHA and PHB
      SWAP           : TC0_BMR_SWAP_Field := 16#0#;
      --  InDeX pin is PHB pin
      IDXPHB         : TC0_BMR_IDXPHB_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : ATSAM3X8E.Bit := 16#0#;
      FILTER         : TC0_BMR_FILTER_Field := 16#0#;
      --  MAXimum FILTer
      MAXFILT        : TC0_BMR_MAXFILT_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : ATSAM3X8E.UInt6 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_BMR_Register use record
      TC0XC0S        at 0 range 0 .. 1;
      TC1XC1S        at 0 range 2 .. 3;
      TC2XC2S        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      QDEN           at 0 range 8 .. 8;
      POSEN          at 0 range 9 .. 9;
      SPEEDEN        at 0 range 10 .. 10;
      QDTRANS        at 0 range 11 .. 11;
      EDGPHA         at 0 range 12 .. 12;
      INVA           at 0 range 13 .. 13;
      INVB           at 0 range 14 .. 14;
      INVIDX         at 0 range 15 .. 15;
      SWAP           at 0 range 16 .. 16;
      IDXPHB         at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      FILTER         at 0 range 19 .. 19;
      MAXFILT        at 0 range 20 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype TC0_QIER_IDX_Field is ATSAM3X8E.Bit;
   subtype TC0_QIER_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype TC0_QIER_QERR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Enable Register
   type TC0_QIER_Register is record
      --  Write-only. InDeX
      IDX           : TC0_QIER_IDX_Field := 16#0#;
      --  Write-only. DIRection CHanGe
      DIRCHG        : TC0_QIER_DIRCHG_Field := 16#0#;
      --  Write-only. Quadrature ERRor
      QERR          : TC0_QIER_QERR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_QIER_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype TC0_QIDR_IDX_Field is ATSAM3X8E.Bit;
   subtype TC0_QIDR_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype TC0_QIDR_QERR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Disable Register
   type TC0_QIDR_Register is record
      --  Write-only. InDeX
      IDX           : TC0_QIDR_IDX_Field := 16#0#;
      --  Write-only. DIRection CHanGe
      DIRCHG        : TC0_QIDR_DIRCHG_Field := 16#0#;
      --  Write-only. Quadrature ERRor
      QERR          : TC0_QIDR_QERR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_QIDR_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype TC0_QIMR_IDX_Field is ATSAM3X8E.Bit;
   subtype TC0_QIMR_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype TC0_QIMR_QERR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Mask Register
   type TC0_QIMR_Register is record
      --  Read-only. InDeX
      IDX           : TC0_QIMR_IDX_Field;
      --  Read-only. DIRection CHanGe
      DIRCHG        : TC0_QIMR_DIRCHG_Field;
      --  Read-only. Quadrature ERRor
      QERR          : TC0_QIMR_QERR_Field;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_QIMR_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype TC0_QISR_IDX_Field is ATSAM3X8E.Bit;
   subtype TC0_QISR_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype TC0_QISR_QERR_Field is ATSAM3X8E.Bit;
   subtype TC0_QISR_DIR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Status Register
   type TC0_QISR_Register is record
      --  Read-only. InDeX
      IDX           : TC0_QISR_IDX_Field;
      --  Read-only. DIRection CHanGe
      DIRCHG        : TC0_QISR_DIRCHG_Field;
      --  Read-only. Quadrature ERRor
      QERR          : TC0_QISR_QERR_Field;
      --  unspecified
      Reserved_3_7  : ATSAM3X8E.UInt5;
      --  Read-only. DIRection
      DIR           : TC0_QISR_DIR_Field;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_QISR_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_7  at 0 range 3 .. 7;
      DIR           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  TC0_FMR_ENCF array element
   subtype TC0_FMR_ENCF_Element is ATSAM3X8E.Bit;

   --  TC0_FMR_ENCF array
   type TC0_FMR_ENCF_Field_Array is array (0 .. 1) of TC0_FMR_ENCF_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for TC0_FMR_ENCF
   type TC0_FMR_ENCF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENCF as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  ENCF as an array
            Arr : TC0_FMR_ENCF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC0_FMR_ENCF_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Fault Mode Register
   type TC0_FMR_Register is record
      --  ENable Compare Fault Channel 0
      ENCF          : TC0_FMR_ENCF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_FMR_Register use record
      ENCF          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TC0_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype TC0_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type TC0_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : TC0_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : TC0_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for TC0_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TC0_Disc is
     (Default,
      WAVE_EQ_1);

   --  Timer Counter 0
   type TC_Peripheral
     (Discriminent : TC0_Disc := Default)
   is record
      --  Channel Control Register (channel = 0)
      CCR0           : aliased CCR_Register;
      pragma Volatile_Full_Access (CCR0);
      --  Stepper Motor Mode Register (channel = 0)
      SMMR0          : aliased SMMR_Register;
      pragma Volatile_Full_Access (SMMR0);
      --  Counter Value (channel = 0)
      CV0            : aliased ATSAM3X8E.UInt32;
      --  Register A (channel = 0)
      RA0            : aliased ATSAM3X8E.UInt32;
      --  Register B (channel = 0)
      RB0            : aliased ATSAM3X8E.UInt32;
      --  Register C (channel = 0)
      RC0            : aliased ATSAM3X8E.UInt32;
      --  Status Register (channel = 0)
      SR0            : aliased SR_Register;
      pragma Volatile_Full_Access (SR0);
      --  Interrupt Enable Register (channel = 0)
      IER0           : aliased IER_Register;
      pragma Volatile_Full_Access (IER0);
      --  Interrupt Disable Register (channel = 0)
      IDR0           : aliased IDR_Register;
      pragma Volatile_Full_Access (IDR0);
      --  Interrupt Mask Register (channel = 0)
      IMR0           : aliased IMR_Register;
      pragma Volatile_Full_Access (IMR0);
      --  Channel Control Register (channel = 1)
      CCR1           : aliased CCR_Register;
      pragma Volatile_Full_Access (CCR1);
      --  Stepper Motor Mode Register (channel = 1)
      SMMR1          : aliased SMMR_Register;
      pragma Volatile_Full_Access (SMMR1);
      --  Counter Value (channel = 1)
      CV1            : aliased ATSAM3X8E.UInt32;
      --  Register A (channel = 1)
      RA1            : aliased ATSAM3X8E.UInt32;
      --  Register B (channel = 1)
      RB1            : aliased ATSAM3X8E.UInt32;
      --  Register C (channel = 1)
      RC1            : aliased ATSAM3X8E.UInt32;
      --  Status Register (channel = 1)
      SR1            : aliased SR_Register;
      pragma Volatile_Full_Access (SR1);
      --  Interrupt Enable Register (channel = 1)
      IER1           : aliased IER_Register;
      pragma Volatile_Full_Access (IER1);
      --  Interrupt Disable Register (channel = 1)
      IDR1           : aliased IDR_Register;
      pragma Volatile_Full_Access (IDR1);
      --  Interrupt Mask Register (channel = 1)
      IMR1           : aliased IMR_Register;
      pragma Volatile_Full_Access (IMR1);
      --  Channel Control Register (channel = 2)
      CCR2           : aliased CCR_Register;
      pragma Volatile_Full_Access (CCR2);
      --  Stepper Motor Mode Register (channel = 2)
      SMMR2          : aliased SMMR_Register;
      pragma Volatile_Full_Access (SMMR2);
      --  Counter Value (channel = 2)
      CV2            : aliased ATSAM3X8E.UInt32;
      --  Register A (channel = 2)
      RA2            : aliased ATSAM3X8E.UInt32;
      --  Register B (channel = 2)
      RB2            : aliased ATSAM3X8E.UInt32;
      --  Register C (channel = 2)
      RC2            : aliased ATSAM3X8E.UInt32;
      --  Status Register (channel = 2)
      SR2            : aliased SR_Register;
      pragma Volatile_Full_Access (SR2);
      --  Interrupt Enable Register (channel = 2)
      IER2           : aliased IER_Register;
      pragma Volatile_Full_Access (IER2);
      --  Interrupt Disable Register (channel = 2)
      IDR2           : aliased IDR_Register;
      pragma Volatile_Full_Access (IDR2);
      --  Interrupt Mask Register (channel = 2)
      IMR2           : aliased IMR_Register;
      pragma Volatile_Full_Access (IMR2);
      --  Block Control Register
      BCR            : aliased TC0_BCR_Register;
      pragma Volatile_Full_Access (BCR);
      --  Block Mode Register
      BMR            : aliased TC0_BMR_Register;
      pragma Volatile_Full_Access (BMR);
      --  QDEC Interrupt Enable Register
      QIER           : aliased TC0_QIER_Register;
      pragma Volatile_Full_Access (QIER);
      --  QDEC Interrupt Disable Register
      QIDR           : aliased TC0_QIDR_Register;
      pragma Volatile_Full_Access (QIDR);
      --  QDEC Interrupt Mask Register
      QIMR           : aliased TC0_QIMR_Register;
      pragma Volatile_Full_Access (QIMR);
      --  QDEC Interrupt Status Register
      QISR           : aliased TC0_QISR_Register;
      pragma Volatile_Full_Access (QISR);
      --  Fault Mode Register
      FMR            : aliased TC0_FMR_Register;
      pragma Volatile_Full_Access (FMR);
      --  Write Protect Mode Register
      WPMR           : aliased TC0_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      case Discriminent is
         when Default =>
            --  Channel Mode Register (channel = 0)
            CMR0 : aliased CMR_Register;
            pragma Volatile_Full_Access (CMR0);
            --  Channel Mode Register (channel = 1)
            CMR1 : aliased CMR_Register;
            pragma Volatile_Full_Access (CMR1);
            --  Channel Mode Register (channel = 2)
            CMR2 : aliased CMR_Register;
            pragma Volatile_Full_Access (CMR2);
         when WAVE_EQ_1 =>
            --  Channel Mode Register (channel = 0)
            CMR0_WAVE_EQ_1 : aliased TC0_CMR0_WAVE_EQ_1_Register;
            pragma Volatile_Full_Access (CMR0_WAVE_EQ_1);
            --  Channel Mode Register (channel = 1)
            CMR1_WAVE_EQ_1 : aliased TC0_CMR1_WAVE_EQ_1_Register;
            pragma Volatile_Full_Access (CMR1_WAVE_EQ_1);
            --  Channel Mode Register (channel = 2)
            CMR2_WAVE_EQ_1 : aliased TC0_CMR2_WAVE_EQ_1_Register;
            pragma Volatile_Full_Access (CMR2_WAVE_EQ_1);
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TC_Peripheral use record
      CCR0           at 16#0# range 0 .. 31;
      SMMR0          at 16#8# range 0 .. 31;
      CV0            at 16#10# range 0 .. 31;
      RA0            at 16#14# range 0 .. 31;
      RB0            at 16#18# range 0 .. 31;
      RC0            at 16#1C# range 0 .. 31;
      SR0            at 16#20# range 0 .. 31;
      IER0           at 16#24# range 0 .. 31;
      IDR0           at 16#28# range 0 .. 31;
      IMR0           at 16#2C# range 0 .. 31;
      CCR1           at 16#40# range 0 .. 31;
      SMMR1          at 16#48# range 0 .. 31;
      CV1            at 16#50# range 0 .. 31;
      RA1            at 16#54# range 0 .. 31;
      RB1            at 16#58# range 0 .. 31;
      RC1            at 16#5C# range 0 .. 31;
      SR1            at 16#60# range 0 .. 31;
      IER1           at 16#64# range 0 .. 31;
      IDR1           at 16#68# range 0 .. 31;
      IMR1           at 16#6C# range 0 .. 31;
      CCR2           at 16#80# range 0 .. 31;
      SMMR2          at 16#88# range 0 .. 31;
      CV2            at 16#90# range 0 .. 31;
      RA2            at 16#94# range 0 .. 31;
      RB2            at 16#98# range 0 .. 31;
      RC2            at 16#9C# range 0 .. 31;
      SR2            at 16#A0# range 0 .. 31;
      IER2           at 16#A4# range 0 .. 31;
      IDR2           at 16#A8# range 0 .. 31;
      IMR2           at 16#AC# range 0 .. 31;
      BCR            at 16#C0# range 0 .. 31;
      BMR            at 16#C4# range 0 .. 31;
      QIER           at 16#C8# range 0 .. 31;
      QIDR           at 16#CC# range 0 .. 31;
      QIMR           at 16#D0# range 0 .. 31;
      QISR           at 16#D4# range 0 .. 31;
      FMR            at 16#D8# range 0 .. 31;
      WPMR           at 16#E4# range 0 .. 31;
      CMR0           at 16#4# range 0 .. 31;
      CMR1           at 16#44# range 0 .. 31;
      CMR2           at 16#84# range 0 .. 31;
      CMR0_WAVE_EQ_1 at 16#4# range 0 .. 31;
      CMR1_WAVE_EQ_1 at 16#44# range 0 .. 31;
      CMR2_WAVE_EQ_1 at 16#84# range 0 .. 31;
   end record;

   --  Timer Counter 0
   TC0_Periph : aliased TC_Peripheral
     with Import, Address => TC0_Base;

   --  Timer Counter 1
   TC1_Periph : aliased TC_Peripheral
     with Import, Address => TC1_Base;

   --  Timer Counter 2
   TC2_Periph : aliased TC_Peripheral
     with Import, Address => TC2_Base;

end ATSAM3X8E.TC;
