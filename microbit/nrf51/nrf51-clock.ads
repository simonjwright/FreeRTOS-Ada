--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.CLOCK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on HFCLKSTARTED event.
   type HFCLKSTARTED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for HFCLKSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on HFCLKSTARTED event.
   type HFCLKSTARTED_Field_1 is
     (
      --  Reset value for the field
      Hfclkstarted_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for HFCLKSTARTED_Field_1 use
     (Hfclkstarted_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on LFCLKSTARTED event.
   type LFCLKSTARTED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for LFCLKSTARTED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on LFCLKSTARTED event.
   type LFCLKSTARTED_Field_1 is
     (
      --  Reset value for the field
      Lfclkstarted_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for LFCLKSTARTED_Field_1 use
     (Lfclkstarted_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on DONE event.
   type DONE_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for DONE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on DONE event.
   type DONE_Field_1 is
     (
      --  Reset value for the field
      Done_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for DONE_Field_1 use
     (Done_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on CTTO event.
   type CTTO_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for CTTO_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on CTTO event.
   type CTTO_Field_1 is
     (
      --  Reset value for the field
      Ctto_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for CTTO_Field_1 use
     (Ctto_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on HFCLKSTARTED event.
      HFCLKSTARTED  : HFCLKSTARTED_Field_1 := Hfclkstarted_Field_Reset;
      --  Enable interrupt on LFCLKSTARTED event.
      LFCLKSTARTED  : LFCLKSTARTED_Field_1 := Lfclkstarted_Field_Reset;
      --  unspecified
      Reserved_2_2  : nrf51.Bit := 16#0#;
      --  Enable interrupt on DONE event.
      DONE          : DONE_Field_1 := Done_Field_Reset;
      --  Enable interrupt on CTTO event.
      CTTO          : CTTO_Field_1 := Ctto_Field_Reset;
      --  unspecified
      Reserved_5_31 : nrf51.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      HFCLKSTARTED  at 0 range 0 .. 0;
      LFCLKSTARTED  at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      DONE          at 0 range 3 .. 3;
      CTTO          at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on HFCLKSTARTED event.
   type HFCLKSTARTED_Field_2 is
     (
      --  Reset value for the field
      Hfclkstarted_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for HFCLKSTARTED_Field_2 use
     (Hfclkstarted_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on LFCLKSTARTED event.
   type LFCLKSTARTED_Field_2 is
     (
      --  Reset value for the field
      Lfclkstarted_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for LFCLKSTARTED_Field_2 use
     (Lfclkstarted_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on DONE event.
   type DONE_Field_2 is
     (
      --  Reset value for the field
      Done_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for DONE_Field_2 use
     (Done_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on CTTO event.
   type CTTO_Field_2 is
     (
      --  Reset value for the field
      Ctto_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for CTTO_Field_2 use
     (Ctto_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on HFCLKSTARTED event.
      HFCLKSTARTED  : HFCLKSTARTED_Field_2 := Hfclkstarted_Field_Reset;
      --  Disable interrupt on LFCLKSTARTED event.
      LFCLKSTARTED  : LFCLKSTARTED_Field_2 := Lfclkstarted_Field_Reset;
      --  unspecified
      Reserved_2_2  : nrf51.Bit := 16#0#;
      --  Disable interrupt on DONE event.
      DONE          : DONE_Field_2 := Done_Field_Reset;
      --  Disable interrupt on CTTO event.
      CTTO          : CTTO_Field_2 := Ctto_Field_Reset;
      --  unspecified
      Reserved_5_31 : nrf51.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      HFCLKSTARTED  at 0 range 0 .. 0;
      LFCLKSTARTED  at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      DONE          at 0 range 3 .. 3;
      CTTO          at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------------
   -- HFCLKRUN_Register --
   -----------------------

   --  Task HFCLKSTART trigger status.
   type STATUS_Field is
     (
      --  Task HFCLKSTART has not been triggered.
      Nottriggered,
      --  Task HFCLKSTART has been triggered.
      Triggered)
     with Size => 1;
   for STATUS_Field use
     (Nottriggered => 0,
      Triggered => 1);

   --  Task HFCLKSTART trigger status.
   type HFCLKRUN_Register is record
      --  Read-only. Task HFCLKSTART trigger status.
      STATUS        : STATUS_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for HFCLKRUN_Register use record
      STATUS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- HFCLKSTAT_Register --
   ------------------------

   --  Active clock source for the HF clock.
   type SRC_Field is
     (
      --  Internal 16MHz RC oscillator running and generating the HFCLK clock.
      Rc,
      --  External 16MHz/32MHz crystal oscillator running and generating the
      --  HFCLK clock.
      Xtal)
     with Size => 1;
   for SRC_Field use
     (Rc => 0,
      Xtal => 1);

   --  State for the HFCLK.
   type STATE_Field is
     (
      --  HFCLK clock not running.
      Notrunning,
      --  HFCLK clock running.
      Running)
     with Size => 1;
   for STATE_Field use
     (Notrunning => 0,
      Running => 1);

   --  High frequency clock status.
   type HFCLKSTAT_Register is record
      --  Read-only. Active clock source for the HF clock.
      SRC            : SRC_Field;
      --  unspecified
      Reserved_1_15  : nrf51.UInt15;
      --  Read-only. State for the HFCLK.
      STATE          : STATE_Field;
      --  unspecified
      Reserved_17_31 : nrf51.UInt15;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for HFCLKSTAT_Register use record
      SRC            at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      STATE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   -----------------------
   -- LFCLKRUN_Register --
   -----------------------

   --  Task LFCLKSTART triggered status.
   type LFCLKRUN_Register is record
      --  Read-only. Task LFCLKSTART triggered status.
      STATUS        : STATUS_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LFCLKRUN_Register use record
      STATUS        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- LFCLKSTAT_Register --
   ------------------------

   --  Active clock source for the LF clock.
   type SRC_Field_1 is
     (
      --  Internal 32KiHz RC oscillator running and generating the LFCLK clock.
      Rc,
      --  External 32KiHz crystal oscillator running and generating the LFCLK
      --  clock.
      Xtal,
      --  Internal 32KiHz synthesizer from the HFCLK running and generating the
      --  LFCLK clock.
      Synth)
     with Size => 2;
   for SRC_Field_1 use
     (Rc => 0,
      Xtal => 1,
      Synth => 2);

   --  Low frequency clock status.
   type LFCLKSTAT_Register is record
      --  Read-only. Active clock source for the LF clock.
      SRC            : SRC_Field_1;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14;
      --  Read-only. State for the LF clock.
      STATE          : STATE_Field;
      --  unspecified
      Reserved_17_31 : nrf51.UInt15;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LFCLKSTAT_Register use record
      SRC            at 0 range 0 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      STATE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   ---------------------------
   -- LFCLKSRCCOPY_Register --
   ---------------------------

   --  Clock source for the LFCLK clock, set when task LKCLKSTART is triggered.
   type LFCLKSRCCOPY_Register is record
      --  Read-only. Clock source for the LFCLK clock, set when task LKCLKSTART
      --  is triggered.
      SRC           : SRC_Field_1;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LFCLKSRCCOPY_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------------
   -- LFCLKSRC_Register --
   -----------------------

   --  Clock source for the LFCLK clock.
   type LFCLKSRC_Register is record
      --  Clock source.
      SRC           : SRC_Field_1 := Rc;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LFCLKSRC_Register use record
      SRC           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -------------------
   -- CTIV_Register --
   -------------------

   subtype CTIV_CTIV_Field is nrf51.UInt7;

   --  Calibration timer interval.
   type CTIV_Register is record
      --  Calibration timer interval in 0.25s resolution.
      CTIV          : CTIV_CTIV_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : nrf51.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIV_Register use record
      CTIV          at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -----------------------
   -- XTALFREQ_Register --
   -----------------------

   --  External Xtal frequency selection.
   type XTALFREQ_Field is
     (
      --  32MHz xtal is used as source for the HFCLK oscillator.
      XTALFREQ_Field_32Mhz,
      --  16MHz xtal is used as source for the HFCLK oscillator.
      XTALFREQ_Field_16Mhz)
     with Size => 8;
   for XTALFREQ_Field use
     (XTALFREQ_Field_32Mhz => 0,
      XTALFREQ_Field_16Mhz => 255);

   --  Crystal frequency.
   type XTALFREQ_Register is record
      --  External Xtal frequency selection.
      XTALFREQ      : XTALFREQ_Field := XTALFREQ_Field_16Mhz;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#FFFFFF#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for XTALFREQ_Register use record
      XTALFREQ      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Clock control.
   type CLOCK_Peripheral is record
      --  Start HFCLK clock source.
      TASKS_HFCLKSTART    : nrf51.Word;
      --  Stop HFCLK clock source.
      TASKS_HFCLKSTOP     : nrf51.Word;
      --  Start LFCLK clock source.
      TASKS_LFCLKSTART    : nrf51.Word;
      --  Stop LFCLK clock source.
      TASKS_LFCLKSTOP     : nrf51.Word;
      --  Start calibration of LFCLK RC oscillator.
      TASKS_CAL           : nrf51.Word;
      --  Start calibration timer.
      TASKS_CTSTART       : nrf51.Word;
      --  Stop calibration timer.
      TASKS_CTSTOP        : nrf51.Word;
      --  HFCLK oscillator started.
      EVENTS_HFCLKSTARTED : nrf51.Word;
      --  LFCLK oscillator started.
      EVENTS_LFCLKSTARTED : nrf51.Word;
      --  Calibration of LFCLK RC oscillator completed.
      EVENTS_DONE         : nrf51.Word;
      --  Calibration timer timeout.
      EVENTS_CTTO         : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET            : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR            : INTENCLR_Register;
      --  Task HFCLKSTART trigger status.
      HFCLKRUN            : HFCLKRUN_Register;
      --  High frequency clock status.
      HFCLKSTAT           : HFCLKSTAT_Register;
      --  Task LFCLKSTART triggered status.
      LFCLKRUN            : LFCLKRUN_Register;
      --  Low frequency clock status.
      LFCLKSTAT           : LFCLKSTAT_Register;
      --  Clock source for the LFCLK clock, set when task LKCLKSTART is
      --  triggered.
      LFCLKSRCCOPY        : LFCLKSRCCOPY_Register;
      --  Clock source for the LFCLK clock.
      LFCLKSRC            : LFCLKSRC_Register;
      --  Calibration timer interval.
      CTIV                : CTIV_Register;
      --  Crystal frequency.
      XTALFREQ            : XTALFREQ_Register;
   end record
     with Volatile;

   for CLOCK_Peripheral use record
      TASKS_HFCLKSTART    at 0 range 0 .. 31;
      TASKS_HFCLKSTOP     at 4 range 0 .. 31;
      TASKS_LFCLKSTART    at 8 range 0 .. 31;
      TASKS_LFCLKSTOP     at 12 range 0 .. 31;
      TASKS_CAL           at 16 range 0 .. 31;
      TASKS_CTSTART       at 20 range 0 .. 31;
      TASKS_CTSTOP        at 24 range 0 .. 31;
      EVENTS_HFCLKSTARTED at 256 range 0 .. 31;
      EVENTS_LFCLKSTARTED at 260 range 0 .. 31;
      EVENTS_DONE         at 268 range 0 .. 31;
      EVENTS_CTTO         at 272 range 0 .. 31;
      INTENSET            at 772 range 0 .. 31;
      INTENCLR            at 776 range 0 .. 31;
      HFCLKRUN            at 1032 range 0 .. 31;
      HFCLKSTAT           at 1036 range 0 .. 31;
      LFCLKRUN            at 1044 range 0 .. 31;
      LFCLKSTAT           at 1048 range 0 .. 31;
      LFCLKSRCCOPY        at 1052 range 0 .. 31;
      LFCLKSRC            at 1304 range 0 .. 31;
      CTIV                at 1336 range 0 .. 31;
      XTALFREQ            at 1360 range 0 .. 31;
   end record;

   --  Clock control.
   CLOCK_Periph : aliased CLOCK_Peripheral
     with Import, Address => CLOCK_Base;

end nrf51.CLOCK;
