--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.TC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- CCR_Register --
   ------------------

   subtype CCR0_CLKEN_Field is ATSAM3X8E.Bit;
   subtype CCR0_CLKDIS_Field is ATSAM3X8E.Bit;
   subtype CCR0_SWTRG_Field is ATSAM3X8E.Bit;

   --  Channel Control Register (channel = 0)
   type CCR_Register is record
      --  Write-only. Counter Clock Enable Command
      CLKEN         : CCR0_CLKEN_Field := 16#0#;
      --  Write-only. Counter Clock Disable Command
      CLKDIS        : CCR0_CLKDIS_Field := 16#0#;
      --  Write-only. Software Trigger Command
      SWTRG         : CCR0_SWTRG_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      CLKEN         at 0 range 0 .. 0;
      CLKDIS        at 0 range 1 .. 1;
      SWTRG         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------
   -- CMR_Register --
   ------------------

   --  Clock Selection
   type TCCLKS_Field is
     (
      --  Clock selected: TCLK1
      Timer_Clock1,
      --  Clock selected: TCLK2
      Timer_Clock2,
      --  Clock selected: TCLK3
      Timer_Clock3,
      --  Clock selected: TCLK4
      Timer_Clock4,
      --  Clock selected: TCLK5
      Timer_Clock5,
      --  Clock selected: XC0
      Xc0,
      --  Clock selected: XC1
      Xc1,
      --  Clock selected: XC2
      Xc2)
     with Size => 3;
   for TCCLKS_Field use
     (Timer_Clock1 => 0,
      Timer_Clock2 => 1,
      Timer_Clock3 => 2,
      Timer_Clock4 => 3,
      Timer_Clock5 => 4,
      Xc0 => 5,
      Xc1 => 6,
      Xc2 => 7);

   subtype CMR0_CLKI_Field is ATSAM3X8E.Bit;

   --  Burst Signal Selection
   type BURST_Field is
     (
      --  The clock is not gated by an external signal.
      None,
      --  XC0 is ANDed with the selected clock.
      Xc0,
      --  XC1 is ANDed with the selected clock.
      Xc1,
      --  XC2 is ANDed with the selected clock.
      Xc2)
     with Size => 2;
   for BURST_Field use
     (None => 0,
      Xc0 => 1,
      Xc1 => 2,
      Xc2 => 3);

   subtype CMR0_LDBSTOP_Field is ATSAM3X8E.Bit;
   subtype CMR0_LDBDIS_Field is ATSAM3X8E.Bit;

   --  External Trigger Edge Selection
   type ETRGEDG_Field is
     (
      --  The clock is not gated by an external signal.
      None,
      --  Rising edge
      Rising,
      --  Falling edge
      Falling,
      --  Each edge
      Edge)
     with Size => 2;
   for ETRGEDG_Field use
     (None => 0,
      Rising => 1,
      Falling => 2,
      Edge => 3);

   subtype CMR0_ABETRG_Field is ATSAM3X8E.Bit;
   subtype CMR0_CPCTRG_Field is ATSAM3X8E.Bit;
   subtype CMR0_WAVE_Field is ATSAM3X8E.Bit;

   --  RA Loading Edge Selection
   type LDRA_Field is
     (
      --  None
      None,
      --  Rising edge of TIOA
      Rising,
      --  Falling edge of TIOA
      Falling,
      --  Each edge of TIOA
      Edge)
     with Size => 2;
   for LDRA_Field use
     (None => 0,
      Rising => 1,
      Falling => 2,
      Edge => 3);

   --  RB Loading Edge Selection
   type LDRB_Field is
     (
      --  None
      None,
      --  Rising edge of TIOA
      Rising,
      --  Falling edge of TIOA
      Falling,
      --  Each edge of TIOA
      Edge)
     with Size => 2;
   for LDRB_Field use
     (None => 0,
      Rising => 1,
      Falling => 2,
      Edge => 3);

   --  Channel Mode Register (channel = 0)
   type CMR_Register is record
      --  Clock Selection
      TCCLKS         : TCCLKS_Field := Timer_Clock1;
      --  Clock Invert
      CLKI           : CMR0_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST          : BURST_Field := None;
      --  Counter Clock Stopped with RB Loading
      LDBSTOP        : CMR0_LDBSTOP_Field := 16#0#;
      --  Counter Clock Disable with RB Loading
      LDBDIS         : CMR0_LDBDIS_Field := 16#0#;
      --  External Trigger Edge Selection
      ETRGEDG        : ETRGEDG_Field := None;
      --  TIOA or TIOB External Trigger Selection
      ABETRG         : CMR0_ABETRG_Field := 16#0#;
      --  unspecified
      Reserved_11_13 : ATSAM3X8E.UInt3 := 16#0#;
      --  RC Compare Trigger Enable
      CPCTRG         : CMR0_CPCTRG_Field := 16#0#;
      --  Waveform Mode
      WAVE           : CMR0_WAVE_Field := 16#0#;
      --  RA Loading Edge Selection
      LDRA           : LDRA_Field := None;
      --  RB Loading Edge Selection
      LDRB           : LDRB_Field := None;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   -----------------------------
   -- CMR0_WAVE_EQ_1_Register --
   -----------------------------

   subtype CMR0_WAVE_EQ_1_CLKI_Field is ATSAM3X8E.Bit;
   subtype CMR0_WAVE_EQ_1_CPCSTOP_Field is ATSAM3X8E.Bit;
   subtype CMR0_WAVE_EQ_1_CPCDIS_Field is ATSAM3X8E.Bit;

   --  External Event Edge Selection
   type EEVTEDG_Field is
     (
      --  None
      None,
      --  Rising edge
      Rising,
      --  Falling edge
      Falling,
      --  Each edge
      Edge)
     with Size => 2;
   for EEVTEDG_Field use
     (None => 0,
      Rising => 1,
      Falling => 2,
      Edge => 3);

   --  External Event Selection
   type EEVT_Field is
     (
      --  TIOB
      Tiob,
      --  XC0
      Xc0,
      --  XC1
      Xc1,
      --  XC2
      Xc2)
     with Size => 2;
   for EEVT_Field use
     (Tiob => 0,
      Xc0 => 1,
      Xc1 => 2,
      Xc2 => 3);

   subtype CMR0_WAVE_EQ_1_ENETRG_Field is ATSAM3X8E.Bit;

   --  Waveform Selection
   type WAVSEL_Field is
     (
      --  UP mode without automatic trigger on RC Compare
      Up,
      --  UPDOWN mode without automatic trigger on RC Compare
      Updown,
      --  UP mode with automatic trigger on RC Compare
      Up_Rc,
      --  UPDOWN mode with automatic trigger on RC Compare
      Updown_Rc)
     with Size => 2;
   for WAVSEL_Field use
     (Up => 0,
      Updown => 1,
      Up_Rc => 2,
      Updown_Rc => 3);

   subtype CMR0_WAVE_EQ_1_WAVE_Field is ATSAM3X8E.Bit;

   --  RA Compare Effect on TIOA
   type ACPA_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for ACPA_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  RC Compare Effect on TIOA
   type ACPC_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for ACPC_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  External Event Effect on TIOA
   type AEEVT_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for AEEVT_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  Software Trigger Effect on TIOA
   type ASWTRG_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for ASWTRG_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  RB Compare Effect on TIOB
   type BCPB_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for BCPB_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  RC Compare Effect on TIOB
   type BCPC_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for BCPC_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  External Event Effect on TIOB
   type BEEVT_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for BEEVT_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  Software Trigger Effect on TIOB
   type BSWTRG_Field is
     (
      --  None
      None,
      --  Set
      Set,
      --  Clear
      Clear,
      --  Toggle
      Toggle)
     with Size => 2;
   for BSWTRG_Field use
     (None => 0,
      Set => 1,
      Clear => 2,
      Toggle => 3);

   --  Channel Mode Register (channel = 0)
   type CMR0_WAVE_EQ_1_Register is record
      --  Clock Selection
      TCCLKS  : TCCLKS_Field := Timer_Clock1;
      --  Clock Invert
      CLKI    : CMR0_WAVE_EQ_1_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST   : BURST_Field := None;
      --  Counter Clock Stopped with RC Compare
      CPCSTOP : CMR0_WAVE_EQ_1_CPCSTOP_Field := 16#0#;
      --  Counter Clock Disable with RC Compare
      CPCDIS  : CMR0_WAVE_EQ_1_CPCDIS_Field := 16#0#;
      --  External Event Edge Selection
      EEVTEDG : EEVTEDG_Field := None;
      --  External Event Selection
      EEVT    : EEVT_Field := Tiob;
      --  External Event Trigger Enable
      ENETRG  : CMR0_WAVE_EQ_1_ENETRG_Field := 16#0#;
      --  Waveform Selection
      WAVSEL  : WAVSEL_Field := Up;
      --  Waveform Mode
      WAVE    : CMR0_WAVE_EQ_1_WAVE_Field := 16#0#;
      --  RA Compare Effect on TIOA
      ACPA    : ACPA_Field := None;
      --  RC Compare Effect on TIOA
      ACPC    : ACPC_Field := None;
      --  External Event Effect on TIOA
      AEEVT   : AEEVT_Field := None;
      --  Software Trigger Effect on TIOA
      ASWTRG  : ASWTRG_Field := None;
      --  RB Compare Effect on TIOB
      BCPB    : BCPB_Field := None;
      --  RC Compare Effect on TIOB
      BCPC    : BCPC_Field := None;
      --  External Event Effect on TIOB
      BEEVT   : BEEVT_Field := None;
      --  Software Trigger Effect on TIOB
      BSWTRG  : BSWTRG_Field := None;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMR0_WAVE_EQ_1_Register use record
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

   -------------------
   -- SMMR_Register --
   -------------------

   subtype SMMR0_GCEN_Field is ATSAM3X8E.Bit;
   subtype SMMR0_DOWN_Field is ATSAM3X8E.Bit;

   --  Stepper Motor Mode Register (channel = 0)
   type SMMR_Register is record
      --  Gray Count Enable
      GCEN          : SMMR0_GCEN_Field := 16#0#;
      --  DOWN Count
      DOWN          : SMMR0_DOWN_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SMMR_Register use record
      GCEN          at 0 range 0 .. 0;
      DOWN          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR0_COVFS_Field is ATSAM3X8E.Bit;
   subtype SR0_LOVRS_Field is ATSAM3X8E.Bit;
   subtype SR0_CPAS_Field is ATSAM3X8E.Bit;
   subtype SR0_CPBS_Field is ATSAM3X8E.Bit;
   subtype SR0_CPCS_Field is ATSAM3X8E.Bit;
   subtype SR0_LDRAS_Field is ATSAM3X8E.Bit;
   subtype SR0_LDRBS_Field is ATSAM3X8E.Bit;
   subtype SR0_ETRGS_Field is ATSAM3X8E.Bit;
   subtype SR0_CLKSTA_Field is ATSAM3X8E.Bit;
   subtype SR0_MTIOA_Field is ATSAM3X8E.Bit;
   subtype SR0_MTIOB_Field is ATSAM3X8E.Bit;

   --  Status Register (channel = 0)
   type SR_Register is record
      --  Read-only. Counter Overflow Status
      COVFS          : SR0_COVFS_Field := 16#0#;
      --  Read-only. Load Overrun Status
      LOVRS          : SR0_LOVRS_Field := 16#0#;
      --  Read-only. RA Compare Status
      CPAS           : SR0_CPAS_Field := 16#0#;
      --  Read-only. RB Compare Status
      CPBS           : SR0_CPBS_Field := 16#0#;
      --  Read-only. RC Compare Status
      CPCS           : SR0_CPCS_Field := 16#0#;
      --  Read-only. RA Loading Status
      LDRAS          : SR0_LDRAS_Field := 16#0#;
      --  Read-only. RB Loading Status
      LDRBS          : SR0_LDRBS_Field := 16#0#;
      --  Read-only. External Trigger Status
      ETRGS          : SR0_ETRGS_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : ATSAM3X8E.Byte;
      --  Read-only. Clock Enabling Status
      CLKSTA         : SR0_CLKSTA_Field := 16#0#;
      --  Read-only. TIOA Mirror
      MTIOA          : SR0_MTIOA_Field := 16#0#;
      --  Read-only. TIOB Mirror
      MTIOB          : SR0_MTIOB_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   ------------------
   -- IER_Register --
   ------------------

   subtype IER0_COVFS_Field is ATSAM3X8E.Bit;
   subtype IER0_LOVRS_Field is ATSAM3X8E.Bit;
   subtype IER0_CPAS_Field is ATSAM3X8E.Bit;
   subtype IER0_CPBS_Field is ATSAM3X8E.Bit;
   subtype IER0_CPCS_Field is ATSAM3X8E.Bit;
   subtype IER0_LDRAS_Field is ATSAM3X8E.Bit;
   subtype IER0_LDRBS_Field is ATSAM3X8E.Bit;
   subtype IER0_ETRGS_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register (channel = 0)
   type IER_Register is record
      --  Write-only. Counter Overflow
      COVFS         : IER0_COVFS_Field := 16#0#;
      --  Write-only. Load Overrun
      LOVRS         : IER0_LOVRS_Field := 16#0#;
      --  Write-only. RA Compare
      CPAS          : IER0_CPAS_Field := 16#0#;
      --  Write-only. RB Compare
      CPBS          : IER0_CPBS_Field := 16#0#;
      --  Write-only. RC Compare
      CPCS          : IER0_CPCS_Field := 16#0#;
      --  Write-only. RA Loading
      LDRAS         : IER0_LDRAS_Field := 16#0#;
      --  Write-only. RB Loading
      LDRBS         : IER0_LDRBS_Field := 16#0#;
      --  Write-only. External Trigger
      ETRGS         : IER0_ETRGS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR0_COVFS_Field is ATSAM3X8E.Bit;
   subtype IDR0_LOVRS_Field is ATSAM3X8E.Bit;
   subtype IDR0_CPAS_Field is ATSAM3X8E.Bit;
   subtype IDR0_CPBS_Field is ATSAM3X8E.Bit;
   subtype IDR0_CPCS_Field is ATSAM3X8E.Bit;
   subtype IDR0_LDRAS_Field is ATSAM3X8E.Bit;
   subtype IDR0_LDRBS_Field is ATSAM3X8E.Bit;
   subtype IDR0_ETRGS_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register (channel = 0)
   type IDR_Register is record
      --  Write-only. Counter Overflow
      COVFS         : IDR0_COVFS_Field := 16#0#;
      --  Write-only. Load Overrun
      LOVRS         : IDR0_LOVRS_Field := 16#0#;
      --  Write-only. RA Compare
      CPAS          : IDR0_CPAS_Field := 16#0#;
      --  Write-only. RB Compare
      CPBS          : IDR0_CPBS_Field := 16#0#;
      --  Write-only. RC Compare
      CPCS          : IDR0_CPCS_Field := 16#0#;
      --  Write-only. RA Loading
      LDRAS         : IDR0_LDRAS_Field := 16#0#;
      --  Write-only. RB Loading
      LDRBS         : IDR0_LDRBS_Field := 16#0#;
      --  Write-only. External Trigger
      ETRGS         : IDR0_ETRGS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR0_COVFS_Field is ATSAM3X8E.Bit;
   subtype IMR0_LOVRS_Field is ATSAM3X8E.Bit;
   subtype IMR0_CPAS_Field is ATSAM3X8E.Bit;
   subtype IMR0_CPBS_Field is ATSAM3X8E.Bit;
   subtype IMR0_CPCS_Field is ATSAM3X8E.Bit;
   subtype IMR0_LDRAS_Field is ATSAM3X8E.Bit;
   subtype IMR0_LDRBS_Field is ATSAM3X8E.Bit;
   subtype IMR0_ETRGS_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register (channel = 0)
   type IMR_Register is record
      --  Read-only. Counter Overflow
      COVFS         : IMR0_COVFS_Field := 16#0#;
      --  Read-only. Load Overrun
      LOVRS         : IMR0_LOVRS_Field := 16#0#;
      --  Read-only. RA Compare
      CPAS          : IMR0_CPAS_Field := 16#0#;
      --  Read-only. RB Compare
      CPBS          : IMR0_CPBS_Field := 16#0#;
      --  Read-only. RC Compare
      CPCS          : IMR0_CPCS_Field := 16#0#;
      --  Read-only. RA Loading
      LDRAS         : IMR0_LDRAS_Field := 16#0#;
      --  Read-only. RB Loading
      LDRBS         : IMR0_LDRBS_Field := 16#0#;
      --  Read-only. External Trigger
      ETRGS         : IMR0_ETRGS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

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

   -----------------------------
   -- CMR1_WAVE_EQ_1_Register --
   -----------------------------

   subtype CMR1_WAVE_EQ_1_CLKI_Field is ATSAM3X8E.Bit;
   subtype CMR1_WAVE_EQ_1_CPCSTOP_Field is ATSAM3X8E.Bit;
   subtype CMR1_WAVE_EQ_1_CPCDIS_Field is ATSAM3X8E.Bit;
   subtype CMR1_WAVE_EQ_1_ENETRG_Field is ATSAM3X8E.Bit;
   subtype CMR1_WAVE_EQ_1_WAVE_Field is ATSAM3X8E.Bit;

   --  Channel Mode Register (channel = 1)
   type CMR1_WAVE_EQ_1_Register is record
      --  Clock Selection
      TCCLKS  : TCCLKS_Field := Timer_Clock1;
      --  Clock Invert
      CLKI    : CMR1_WAVE_EQ_1_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST   : BURST_Field := None;
      --  Counter Clock Stopped with RC Compare
      CPCSTOP : CMR1_WAVE_EQ_1_CPCSTOP_Field := 16#0#;
      --  Counter Clock Disable with RC Compare
      CPCDIS  : CMR1_WAVE_EQ_1_CPCDIS_Field := 16#0#;
      --  External Event Edge Selection
      EEVTEDG : EEVTEDG_Field := None;
      --  External Event Selection
      EEVT    : EEVT_Field := Tiob;
      --  External Event Trigger Enable
      ENETRG  : CMR1_WAVE_EQ_1_ENETRG_Field := 16#0#;
      --  Waveform Selection
      WAVSEL  : WAVSEL_Field := Up;
      --  Waveform Mode
      WAVE    : CMR1_WAVE_EQ_1_WAVE_Field := 16#0#;
      --  RA Compare Effect on TIOA
      ACPA    : ACPA_Field := None;
      --  RC Compare Effect on TIOA
      ACPC    : ACPC_Field := None;
      --  External Event Effect on TIOA
      AEEVT   : AEEVT_Field := None;
      --  Software Trigger Effect on TIOA
      ASWTRG  : ASWTRG_Field := None;
      --  RB Compare Effect on TIOB
      BCPB    : BCPB_Field := None;
      --  RC Compare Effect on TIOB
      BCPC    : BCPC_Field := None;
      --  External Event Effect on TIOB
      BEEVT   : BEEVT_Field := None;
      --  Software Trigger Effect on TIOB
      BSWTRG  : BSWTRG_Field := None;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMR1_WAVE_EQ_1_Register use record
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

   -----------------------------
   -- CMR2_WAVE_EQ_1_Register --
   -----------------------------

   subtype CMR2_WAVE_EQ_1_CLKI_Field is ATSAM3X8E.Bit;
   subtype CMR2_WAVE_EQ_1_CPCSTOP_Field is ATSAM3X8E.Bit;
   subtype CMR2_WAVE_EQ_1_CPCDIS_Field is ATSAM3X8E.Bit;
   subtype CMR2_WAVE_EQ_1_ENETRG_Field is ATSAM3X8E.Bit;
   subtype CMR2_WAVE_EQ_1_WAVE_Field is ATSAM3X8E.Bit;

   --  Channel Mode Register (channel = 2)
   type CMR2_WAVE_EQ_1_Register is record
      --  Clock Selection
      TCCLKS  : TCCLKS_Field := Timer_Clock1;
      --  Clock Invert
      CLKI    : CMR2_WAVE_EQ_1_CLKI_Field := 16#0#;
      --  Burst Signal Selection
      BURST   : BURST_Field := None;
      --  Counter Clock Stopped with RC Compare
      CPCSTOP : CMR2_WAVE_EQ_1_CPCSTOP_Field := 16#0#;
      --  Counter Clock Disable with RC Compare
      CPCDIS  : CMR2_WAVE_EQ_1_CPCDIS_Field := 16#0#;
      --  External Event Edge Selection
      EEVTEDG : EEVTEDG_Field := None;
      --  External Event Selection
      EEVT    : EEVT_Field := Tiob;
      --  External Event Trigger Enable
      ENETRG  : CMR2_WAVE_EQ_1_ENETRG_Field := 16#0#;
      --  Waveform Selection
      WAVSEL  : WAVSEL_Field := Up;
      --  Waveform Mode
      WAVE    : CMR2_WAVE_EQ_1_WAVE_Field := 16#0#;
      --  RA Compare Effect on TIOA
      ACPA    : ACPA_Field := None;
      --  RC Compare Effect on TIOA
      ACPC    : ACPC_Field := None;
      --  External Event Effect on TIOA
      AEEVT   : AEEVT_Field := None;
      --  Software Trigger Effect on TIOA
      ASWTRG  : ASWTRG_Field := None;
      --  RB Compare Effect on TIOB
      BCPB    : BCPB_Field := None;
      --  RC Compare Effect on TIOB
      BCPC    : BCPC_Field := None;
      --  External Event Effect on TIOB
      BEEVT   : BEEVT_Field := None;
      --  Software Trigger Effect on TIOB
      BSWTRG  : BSWTRG_Field := None;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CMR2_WAVE_EQ_1_Register use record
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

   ------------------
   -- BCR_Register --
   ------------------

   subtype BCR_SYNC_Field is ATSAM3X8E.Bit;

   --  Block Control Register
   type BCR_Register is record
      --  Write-only. Synchro Command
      SYNC          : BCR_SYNC_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BCR_Register use record
      SYNC          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------
   -- BMR_Register --
   ------------------

   --  External Clock Signal 0 Selection
   type TC0XC0S_Field is
     (
      --  Signal connected to XC0: TCLK0
      Tclk0,
      --  Signal connected to XC0: TIOA1
      Tioa1,
      --  Signal connected to XC0: TIOA2
      Tioa2)
     with Size => 2;
   for TC0XC0S_Field use
     (Tclk0 => 0,
      Tioa1 => 2,
      Tioa2 => 3);

   --  External Clock Signal 1 Selection
   type TC1XC1S_Field is
     (
      --  Signal connected to XC1: TCLK1
      Tclk1,
      --  Signal connected to XC1: TIOA0
      Tioa0,
      --  Signal connected to XC1: TIOA2
      Tioa2)
     with Size => 2;
   for TC1XC1S_Field use
     (Tclk1 => 0,
      Tioa0 => 2,
      Tioa2 => 3);

   --  External Clock Signal 2 Selection
   type TC2XC2S_Field is
     (
      --  Signal connected to XC2: TCLK2
      Tclk2,
      --  Signal connected to XC2: TIOA1
      Tioa1,
      --  Signal connected to XC2: TIOA2
      Tioa2)
     with Size => 2;
   for TC2XC2S_Field use
     (Tclk2 => 0,
      Tioa1 => 2,
      Tioa2 => 3);

   subtype BMR_QDEN_Field is ATSAM3X8E.Bit;
   subtype BMR_POSEN_Field is ATSAM3X8E.Bit;
   subtype BMR_SPEEDEN_Field is ATSAM3X8E.Bit;
   subtype BMR_QDTRANS_Field is ATSAM3X8E.Bit;
   subtype BMR_EDGPHA_Field is ATSAM3X8E.Bit;
   subtype BMR_INVA_Field is ATSAM3X8E.Bit;
   subtype BMR_INVB_Field is ATSAM3X8E.Bit;
   subtype BMR_INVIDX_Field is ATSAM3X8E.Bit;
   subtype BMR_SWAP_Field is ATSAM3X8E.Bit;
   subtype BMR_IDXPHB_Field is ATSAM3X8E.Bit;
   subtype BMR_FILTER_Field is ATSAM3X8E.Bit;
   subtype BMR_MAXFILT_Field is ATSAM3X8E.UInt6;

   --  Block Mode Register
   type BMR_Register is record
      --  External Clock Signal 0 Selection
      TC0XC0S        : TC0XC0S_Field := Tclk0;
      --  External Clock Signal 1 Selection
      TC1XC1S        : TC1XC1S_Field := Tclk1;
      --  External Clock Signal 2 Selection
      TC2XC2S        : TC2XC2S_Field := Tclk2;
      --  unspecified
      Reserved_6_7   : ATSAM3X8E.UInt2 := 16#0#;
      --  Quadrature Decoder ENabled
      QDEN           : BMR_QDEN_Field := 16#0#;
      --  POSition ENabled
      POSEN          : BMR_POSEN_Field := 16#0#;
      --  SPEED ENabled
      SPEEDEN        : BMR_SPEEDEN_Field := 16#0#;
      --  Quadrature Decoding TRANSparent
      QDTRANS        : BMR_QDTRANS_Field := 16#0#;
      --  EDGe on PHA count mode
      EDGPHA         : BMR_EDGPHA_Field := 16#0#;
      --  INVerted phA
      INVA           : BMR_INVA_Field := 16#0#;
      --  INVerted phB
      INVB           : BMR_INVB_Field := 16#0#;
      --  INVerted InDeX
      INVIDX         : BMR_INVIDX_Field := 16#0#;
      --  SWAP PHA and PHB
      SWAP           : BMR_SWAP_Field := 16#0#;
      --  InDeX pin is PHB pin
      IDXPHB         : BMR_IDXPHB_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : ATSAM3X8E.Bit := 16#0#;
      FILTER         : BMR_FILTER_Field := 16#0#;
      --  MAXimum FILTer
      MAXFILT        : BMR_MAXFILT_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : ATSAM3X8E.UInt6 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BMR_Register use record
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

   -------------------
   -- QIER_Register --
   -------------------

   subtype QIER_IDX_Field is ATSAM3X8E.Bit;
   subtype QIER_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype QIER_QERR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Enable Register
   type QIER_Register is record
      --  Write-only. InDeX
      IDX           : QIER_IDX_Field := 16#0#;
      --  Write-only. DIRection CHanGe
      DIRCHG        : QIER_DIRCHG_Field := 16#0#;
      --  Write-only. Quadrature ERRor
      QERR          : QIER_QERR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for QIER_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -------------------
   -- QIDR_Register --
   -------------------

   subtype QIDR_IDX_Field is ATSAM3X8E.Bit;
   subtype QIDR_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype QIDR_QERR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Disable Register
   type QIDR_Register is record
      --  Write-only. InDeX
      IDX           : QIDR_IDX_Field := 16#0#;
      --  Write-only. DIRection CHanGe
      DIRCHG        : QIDR_DIRCHG_Field := 16#0#;
      --  Write-only. Quadrature ERRor
      QERR          : QIDR_QERR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for QIDR_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -------------------
   -- QIMR_Register --
   -------------------

   subtype QIMR_IDX_Field is ATSAM3X8E.Bit;
   subtype QIMR_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype QIMR_QERR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Mask Register
   type QIMR_Register is record
      --  Read-only. InDeX
      IDX           : QIMR_IDX_Field := 16#0#;
      --  Read-only. DIRection CHanGe
      DIRCHG        : QIMR_DIRCHG_Field := 16#0#;
      --  Read-only. Quadrature ERRor
      QERR          : QIMR_QERR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : ATSAM3X8E.UInt29;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for QIMR_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -------------------
   -- QISR_Register --
   -------------------

   subtype QISR_IDX_Field is ATSAM3X8E.Bit;
   subtype QISR_DIRCHG_Field is ATSAM3X8E.Bit;
   subtype QISR_QERR_Field is ATSAM3X8E.Bit;
   subtype QISR_DIR_Field is ATSAM3X8E.Bit;

   --  QDEC Interrupt Status Register
   type QISR_Register is record
      --  Read-only. InDeX
      IDX           : QISR_IDX_Field := 16#0#;
      --  Read-only. DIRection CHanGe
      DIRCHG        : QISR_DIRCHG_Field := 16#0#;
      --  Read-only. Quadrature ERRor
      QERR          : QISR_QERR_Field := 16#0#;
      --  unspecified
      Reserved_3_7  : ATSAM3X8E.UInt5;
      --  Read-only. DIRection
      DIR           : QISR_DIR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for QISR_Register use record
      IDX           at 0 range 0 .. 0;
      DIRCHG        at 0 range 1 .. 1;
      QERR          at 0 range 2 .. 2;
      Reserved_3_7  at 0 range 3 .. 7;
      DIR           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   ------------------
   -- FMR_Register --
   ------------------

   --------------
   -- FMR.ENCF --
   --------------

   --  FMR_ENCF array element
   subtype FMR_ENCF_Element is ATSAM3X8E.Bit;

   --  FMR_ENCF array
   type FMR_ENCF_Field_Array is array (0 .. 1) of FMR_ENCF_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for FMR_ENCF
   type FMR_ENCF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENCF as a value
            Val : ATSAM3X8E.UInt2;
         when True =>
            --  ENCF as an array
            Arr : FMR_ENCF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FMR_ENCF_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Fault Mode Register
   type FMR_Register is record
      --  ENable Compare Fault Channel 0
      ENCF          : FMR_ENCF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : ATSAM3X8E.UInt30 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FMR_Register use record
      ENCF          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
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
      --  Write Protect KEY
      WPKEY        : WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Timer Counter 0
   type TC_Peripheral is record
      --  Channel Control Register (channel = 0)
      CCR0  : CCR_Register;
      --  Channel Mode Register (channel = 0)
      CMR0  : CMR_Register;
      --  Stepper Motor Mode Register (channel = 0)
      SMMR0 : SMMR_Register;
      --  Counter Value (channel = 0)
      CV0   : ATSAM3X8E.Word;
      --  Register A (channel = 0)
      RA0   : ATSAM3X8E.Word;
      --  Register B (channel = 0)
      RB0   : ATSAM3X8E.Word;
      --  Register C (channel = 0)
      RC0   : ATSAM3X8E.Word;
      --  Status Register (channel = 0)
      SR0   : SR_Register;
      --  Interrupt Enable Register (channel = 0)
      IER0  : IER_Register;
      --  Interrupt Disable Register (channel = 0)
      IDR0  : IDR_Register;
      --  Interrupt Mask Register (channel = 0)
      IMR0  : IMR_Register;
      --  Channel Control Register (channel = 1)
      CCR1  : CCR_Register;
      --  Channel Mode Register (channel = 1)
      CMR1  : CMR_Register;
      --  Stepper Motor Mode Register (channel = 1)
      SMMR1 : SMMR_Register;
      --  Counter Value (channel = 1)
      CV1   : ATSAM3X8E.Word;
      --  Register A (channel = 1)
      RA1   : ATSAM3X8E.Word;
      --  Register B (channel = 1)
      RB1   : ATSAM3X8E.Word;
      --  Register C (channel = 1)
      RC1   : ATSAM3X8E.Word;
      --  Status Register (channel = 1)
      SR1   : SR_Register;
      --  Interrupt Enable Register (channel = 1)
      IER1  : IER_Register;
      --  Interrupt Disable Register (channel = 1)
      IDR1  : IDR_Register;
      --  Interrupt Mask Register (channel = 1)
      IMR1  : IMR_Register;
      --  Channel Control Register (channel = 2)
      CCR2  : CCR_Register;
      --  Channel Mode Register (channel = 2)
      CMR2  : CMR_Register;
      --  Stepper Motor Mode Register (channel = 2)
      SMMR2 : SMMR_Register;
      --  Counter Value (channel = 2)
      CV2   : ATSAM3X8E.Word;
      --  Register A (channel = 2)
      RA2   : ATSAM3X8E.Word;
      --  Register B (channel = 2)
      RB2   : ATSAM3X8E.Word;
      --  Register C (channel = 2)
      RC2   : ATSAM3X8E.Word;
      --  Status Register (channel = 2)
      SR2   : SR_Register;
      --  Interrupt Enable Register (channel = 2)
      IER2  : IER_Register;
      --  Interrupt Disable Register (channel = 2)
      IDR2  : IDR_Register;
      --  Interrupt Mask Register (channel = 2)
      IMR2  : IMR_Register;
      --  Block Control Register
      BCR   : BCR_Register;
      --  Block Mode Register
      BMR   : BMR_Register;
      --  QDEC Interrupt Enable Register
      QIER  : QIER_Register;
      --  QDEC Interrupt Disable Register
      QIDR  : QIDR_Register;
      --  QDEC Interrupt Mask Register
      QIMR  : QIMR_Register;
      --  QDEC Interrupt Status Register
      QISR  : QISR_Register;
      --  Fault Mode Register
      FMR   : FMR_Register;
      --  Write Protect Mode Register
      WPMR  : WPMR_Register;
   end record
     with Volatile;

   for TC_Peripheral use record
      CCR0  at 0 range 0 .. 31;
      CMR0  at 4 range 0 .. 31;
      SMMR0 at 8 range 0 .. 31;
      CV0   at 16 range 0 .. 31;
      RA0   at 20 range 0 .. 31;
      RB0   at 24 range 0 .. 31;
      RC0   at 28 range 0 .. 31;
      SR0   at 32 range 0 .. 31;
      IER0  at 36 range 0 .. 31;
      IDR0  at 40 range 0 .. 31;
      IMR0  at 44 range 0 .. 31;
      CCR1  at 64 range 0 .. 31;
      CMR1  at 68 range 0 .. 31;
      SMMR1 at 72 range 0 .. 31;
      CV1   at 80 range 0 .. 31;
      RA1   at 84 range 0 .. 31;
      RB1   at 88 range 0 .. 31;
      RC1   at 92 range 0 .. 31;
      SR1   at 96 range 0 .. 31;
      IER1  at 100 range 0 .. 31;
      IDR1  at 104 range 0 .. 31;
      IMR1  at 108 range 0 .. 31;
      CCR2  at 128 range 0 .. 31;
      CMR2  at 132 range 0 .. 31;
      SMMR2 at 136 range 0 .. 31;
      CV2   at 144 range 0 .. 31;
      RA2   at 148 range 0 .. 31;
      RB2   at 152 range 0 .. 31;
      RC2   at 156 range 0 .. 31;
      SR2   at 160 range 0 .. 31;
      IER2  at 164 range 0 .. 31;
      IDR2  at 168 range 0 .. 31;
      IMR2  at 172 range 0 .. 31;
      BCR   at 192 range 0 .. 31;
      BMR   at 196 range 0 .. 31;
      QIER  at 200 range 0 .. 31;
      QIDR  at 204 range 0 .. 31;
      QIMR  at 208 range 0 .. 31;
      QISR  at 212 range 0 .. 31;
      FMR   at 216 range 0 .. 31;
      WPMR  at 228 range 0 .. 31;
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
