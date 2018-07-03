--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Compare event on CC[n] match.

   --  Compare event on CC[n] match.
   type EVENTS_COMPARE_Registers is array (0 .. 3) of nrf51.Word;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on TICK event.
   type TICK_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for TICK_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on TICK event.
   type TICK_Field_1 is
     (
      --  Reset value for the field
      Tick_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for TICK_Field_1 use
     (Tick_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on OVRFLW event.
   type OVRFLW_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for OVRFLW_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on OVRFLW event.
   type OVRFLW_Field_1 is
     (
      --  Reset value for the field
      Ovrflw_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for OVRFLW_Field_1 use
     (Ovrflw_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on COMPARE[0] event.
   type COMPARE0_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for COMPARE0_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on COMPARE[0] event.
   type COMPARE0_Field_1 is
     (
      --  Reset value for the field
      Compare0_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for COMPARE0_Field_1 use
     (Compare0_Field_Reset => 0,
      Set => 1);

   ----------------------
   -- INTENSET.COMPARE --
   ----------------------

   --  INTENSET_COMPARE array
   type INTENSET_COMPARE_Field_Array is array (0 .. 3) of COMPARE0_Field_1
     with Component_Size => 1, Size => 4;

   --  Type definition for INTENSET_COMPARE
   type INTENSET_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : nrf51.UInt4;
         when True =>
            --  COMPARE as an array
            Arr : INTENSET_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for INTENSET_COMPARE_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on TICK event.
      TICK           : TICK_Field_1 := Tick_Field_Reset;
      --  Enable interrupt on OVRFLW event.
      OVRFLW         : OVRFLW_Field_1 := Ovrflw_Field_Reset;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  Enable interrupt on COMPARE[0] event.
      COMPARE        : INTENSET_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      TICK           at 0 range 0 .. 0;
      OVRFLW         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on TICK event.
   type TICK_Field_2 is
     (
      --  Reset value for the field
      Tick_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for TICK_Field_2 use
     (Tick_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on OVRFLW event.
   type OVRFLW_Field_2 is
     (
      --  Reset value for the field
      Ovrflw_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for OVRFLW_Field_2 use
     (Ovrflw_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on COMPARE[0] event.
   type COMPARE0_Field_2 is
     (
      --  Reset value for the field
      Compare0_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for COMPARE0_Field_2 use
     (Compare0_Field_Reset => 0,
      Clear => 1);

   ----------------------
   -- INTENCLR.COMPARE --
   ----------------------

   --  INTENCLR_COMPARE array
   type INTENCLR_COMPARE_Field_Array is array (0 .. 3) of COMPARE0_Field_2
     with Component_Size => 1, Size => 4;

   --  Type definition for INTENCLR_COMPARE
   type INTENCLR_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : nrf51.UInt4;
         when True =>
            --  COMPARE as an array
            Arr : INTENCLR_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for INTENCLR_COMPARE_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on TICK event.
      TICK           : TICK_Field_2 := Tick_Field_Reset;
      --  Disable interrupt on OVRFLW event.
      OVRFLW         : OVRFLW_Field_2 := Ovrflw_Field_Reset;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  Disable interrupt on COMPARE[0] event.
      COMPARE        : INTENCLR_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      TICK           at 0 range 0 .. 0;
      OVRFLW         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --------------------
   -- EVTEN_Register --
   --------------------

   -------------------
   -- EVTEN.COMPARE --
   -------------------

   --  EVTEN_COMPARE array
   type EVTEN_COMPARE_Field_Array is array (0 .. 3) of COMPARE0_Field
     with Component_Size => 1, Size => 4;

   --  Type definition for EVTEN_COMPARE
   type EVTEN_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : nrf51.UInt4;
         when True =>
            --  COMPARE as an array
            Arr : EVTEN_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVTEN_COMPARE_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Configures event enable routing to PPI for each RTC event.
   type EVTEN_Register is record
      --  TICK event enable.
      TICK           : TICK_Field := Disabled;
      --  OVRFLW event enable.
      OVRFLW         : OVRFLW_Field := Disabled;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  COMPARE[0] event enable.
      COMPARE        : EVTEN_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVTEN_Register use record
      TICK           at 0 range 0 .. 0;
      OVRFLW         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------------
   -- EVTENSET_Register --
   -----------------------

   ----------------------
   -- EVTENSET.COMPARE --
   ----------------------

   --  EVTENSET_COMPARE array
   type EVTENSET_COMPARE_Field_Array is array (0 .. 3) of COMPARE0_Field_1
     with Component_Size => 1, Size => 4;

   --  Type definition for EVTENSET_COMPARE
   type EVTENSET_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : nrf51.UInt4;
         when True =>
            --  COMPARE as an array
            Arr : EVTENSET_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVTENSET_COMPARE_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Enable events routing to PPI. The reading of this register gives the
   --  value of EVTEN.
   type EVTENSET_Register is record
      --  Enable routing to PPI of TICK event.
      TICK           : TICK_Field_1 := Tick_Field_Reset;
      --  Enable routing to PPI of OVRFLW event.
      OVRFLW         : OVRFLW_Field_1 := Ovrflw_Field_Reset;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  Enable routing to PPI of COMPARE[0] event.
      COMPARE        : EVTENSET_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVTENSET_Register use record
      TICK           at 0 range 0 .. 0;
      OVRFLW         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------------
   -- EVTENCLR_Register --
   -----------------------

   ----------------------
   -- EVTENCLR.COMPARE --
   ----------------------

   --  EVTENCLR_COMPARE array
   type EVTENCLR_COMPARE_Field_Array is array (0 .. 3) of COMPARE0_Field_2
     with Component_Size => 1, Size => 4;

   --  Type definition for EVTENCLR_COMPARE
   type EVTENCLR_COMPARE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPARE as a value
            Val : nrf51.UInt4;
         when True =>
            --  COMPARE as an array
            Arr : EVTENCLR_COMPARE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EVTENCLR_COMPARE_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Disable events routing to PPI. The reading of this register gives the
   --  value of EVTEN.
   type EVTENCLR_Register is record
      --  Disable routing to PPI of TICK event.
      TICK           : TICK_Field_2 := Tick_Field_Reset;
      --  Disable routing to PPI of OVRFLW event.
      OVRFLW         : OVRFLW_Field_2 := Ovrflw_Field_Reset;
      --  unspecified
      Reserved_2_15  : nrf51.UInt14 := 16#0#;
      --  Disable routing to PPI of COMPARE[0] event.
      COMPARE        : EVTENCLR_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVTENCLR_Register use record
      TICK           at 0 range 0 .. 0;
      OVRFLW         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   ----------------------
   -- COUNTER_Register --
   ----------------------

   subtype COUNTER_COUNTER_Field is nrf51.UInt24;

   --  Current COUNTER value.
   type COUNTER_Register is record
      --  Read-only. Counter value.
      COUNTER        : COUNTER_COUNTER_Field;
      --  unspecified
      Reserved_24_31 : nrf51.Byte;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COUNTER_Register use record
      COUNTER        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------------
   -- PRESCALER_Register --
   ------------------------

   subtype PRESCALER_PRESCALER_Field is nrf51.UInt12;

   --  12-bit prescaler for COUNTER frequency (32768/(PRESCALER+1)). Must be
   --  written when RTC is STOPed.
   type PRESCALER_Register is record
      --  RTC PRESCALER value.
      PRESCALER      : PRESCALER_PRESCALER_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : nrf51.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRESCALER_Register use record
      PRESCALER      at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------
   -- CC_Register --
   -----------------

   subtype CC_COMPARE_Field is nrf51.UInt24;

   --  Capture/compare registers.
   type CC_Register is record
      --  Compare value.
      COMPARE        : CC_COMPARE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : nrf51.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CC_Register use record
      COMPARE        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Capture/compare registers.
   type CC_Registers is array (0 .. 3) of CC_Register;

   --------------------
   -- POWER_Register --
   --------------------

   --  Peripheral power control.
   type POWER_Field is
     (
      --  Module power disabled.
      Disabled,
      --  Module power enabled.
      Enabled)
     with Size => 1;
   for POWER_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Peripheral power control.
   type POWER_Register is record
      --  Peripheral power control.
      POWER         : POWER_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_Register use record
      POWER         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Real time counter 0.
   type RTC_Peripheral is record
      --  Start RTC Counter.
      TASKS_START      : nrf51.Word;
      --  Stop RTC Counter.
      TASKS_STOP       : nrf51.Word;
      --  Clear RTC Counter.
      TASKS_CLEAR      : nrf51.Word;
      --  Set COUNTER to 0xFFFFFFF0.
      TASKS_TRIGOVRFLW : nrf51.Word;
      --  Event on COUNTER increment.
      EVENTS_TICK      : nrf51.Word;
      --  Event on COUNTER overflow.
      EVENTS_OVRFLW    : nrf51.Word;
      --  Compare event on CC[n] match.
      EVENTS_COMPARE   : EVENTS_COMPARE_Registers;
      --  Interrupt enable set register.
      INTENSET         : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR         : INTENCLR_Register;
      --  Configures event enable routing to PPI for each RTC event.
      EVTEN            : EVTEN_Register;
      --  Enable events routing to PPI. The reading of this register gives the
      --  value of EVTEN.
      EVTENSET         : EVTENSET_Register;
      --  Disable events routing to PPI. The reading of this register gives the
      --  value of EVTEN.
      EVTENCLR         : EVTENCLR_Register;
      --  Current COUNTER value.
      COUNTER          : COUNTER_Register;
      --  12-bit prescaler for COUNTER frequency (32768/(PRESCALER+1)). Must be
      --  written when RTC is STOPed.
      PRESCALER        : PRESCALER_Register;
      --  Capture/compare registers.
      CC               : CC_Registers;
      --  Peripheral power control.
      POWER            : POWER_Register;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TASKS_START      at 0 range 0 .. 31;
      TASKS_STOP       at 4 range 0 .. 31;
      TASKS_CLEAR      at 8 range 0 .. 31;
      TASKS_TRIGOVRFLW at 12 range 0 .. 31;
      EVENTS_TICK      at 256 range 0 .. 31;
      EVENTS_OVRFLW    at 260 range 0 .. 31;
      EVENTS_COMPARE   at 320 range 0 .. 127;
      INTENSET         at 772 range 0 .. 31;
      INTENCLR         at 776 range 0 .. 31;
      EVTEN            at 832 range 0 .. 31;
      EVTENSET         at 836 range 0 .. 31;
      EVTENCLR         at 840 range 0 .. 31;
      COUNTER          at 1284 range 0 .. 31;
      PRESCALER        at 1288 range 0 .. 31;
      CC               at 1344 range 0 .. 127;
      POWER            at 4092 range 0 .. 31;
   end record;

   --  Real time counter 0.
   RTC0_Periph : aliased RTC_Peripheral
     with Import, Address => RTC0_Base;

   --  Real time counter 1.
   RTC1_Periph : aliased RTC_Peripheral
     with Import, Address => RTC1_Base;

end nrf51.RTC;
