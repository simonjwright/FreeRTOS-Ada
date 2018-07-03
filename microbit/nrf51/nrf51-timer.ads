--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.TIMER is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Capture Timer value to CC[n] registers.

   --  Capture Timer value to CC[n] registers.
   type TASKS_CAPTURE_Registers is array (0 .. 3) of nrf51.Word;

   --  Compare event on CC[n] match.

   --  Compare event on CC[n] match.
   type EVENTS_COMPARE_Registers is array (0 .. 3) of nrf51.Word;

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between CC[0] event and the CLEAR task.
   type COMPARE0_CLEAR_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE0_CLEAR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[1] event and the CLEAR task.
   type COMPARE1_CLEAR_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE1_CLEAR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[2] event and the CLEAR task.
   type COMPARE2_CLEAR_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE2_CLEAR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[3] event and the CLEAR task.
   type COMPARE3_CLEAR_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE3_CLEAR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[0] event and the STOP task.
   type COMPARE0_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE0_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[1] event and the STOP task.
   type COMPARE1_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE1_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[2] event and the STOP task.
   type COMPARE2_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE2_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CC[3] event and the STOP task.
   type COMPARE3_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for COMPARE3_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for Timer.
   type SHORTS_Register is record
      --  Shortcut between CC[0] event and the CLEAR task.
      COMPARE0_CLEAR : COMPARE0_CLEAR_Field := Disabled;
      --  Shortcut between CC[1] event and the CLEAR task.
      COMPARE1_CLEAR : COMPARE1_CLEAR_Field := Disabled;
      --  Shortcut between CC[2] event and the CLEAR task.
      COMPARE2_CLEAR : COMPARE2_CLEAR_Field := Disabled;
      --  Shortcut between CC[3] event and the CLEAR task.
      COMPARE3_CLEAR : COMPARE3_CLEAR_Field := Disabled;
      --  unspecified
      Reserved_4_7   : nrf51.UInt4 := 16#0#;
      --  Shortcut between CC[0] event and the STOP task.
      COMPARE0_STOP  : COMPARE0_STOP_Field := Disabled;
      --  Shortcut between CC[1] event and the STOP task.
      COMPARE1_STOP  : COMPARE1_STOP_Field := Disabled;
      --  Shortcut between CC[2] event and the STOP task.
      COMPARE2_STOP  : COMPARE2_STOP_Field := Disabled;
      --  Shortcut between CC[3] event and the STOP task.
      COMPARE3_STOP  : COMPARE3_STOP_Field := Disabled;
      --  unspecified
      Reserved_12_31 : nrf51.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      COMPARE0_CLEAR at 0 range 0 .. 0;
      COMPARE1_CLEAR at 0 range 1 .. 1;
      COMPARE2_CLEAR at 0 range 2 .. 2;
      COMPARE3_CLEAR at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      COMPARE0_STOP  at 0 range 8 .. 8;
      COMPARE1_STOP  at 0 range 9 .. 9;
      COMPARE2_STOP  at 0 range 10 .. 10;
      COMPARE3_STOP  at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on COMPARE[0]
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

   --  Enable interrupt on COMPARE[0]
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
      --  unspecified
      Reserved_0_15  : nrf51.Short := 16#0#;
      --  Enable interrupt on COMPARE[0]
      COMPARE        : INTENSET_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on COMPARE[0]
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
      --  unspecified
      Reserved_0_15  : nrf51.Short := 16#0#;
      --  Disable interrupt on COMPARE[0]
      COMPARE        : INTENCLR_COMPARE_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      COMPARE        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -------------------
   -- MODE_Register --
   -------------------

   --  Select Normal or Counter mode.
   type MODE_Field is
     (
      --  Timer in Normal mode.
      Timer,
      --  Timer in Counter mode.
      Counter)
     with Size => 1;
   for MODE_Field use
     (Timer => 0,
      Counter => 1);

   --  Timer Mode selection.
   type MODE_Register is record
      --  Select Normal or Counter mode.
      MODE          : MODE_Field := Timer;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MODE_Register use record
      MODE          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ----------------------
   -- BITMODE_Register --
   ----------------------

   --  Sets timer behaviour ro be like the implementation of a timer with width
   --  as indicated.
   type BITMODE_Field is
     (
      --  16-bit timer behaviour.
      BITMODE_Field_16Bit,
      --  8-bit timer behaviour.
      BITMODE_Field_08Bit,
      --  24-bit timer behaviour.
      BITMODE_Field_24Bit,
      --  32-bit timer behaviour.
      BITMODE_Field_32Bit)
     with Size => 2;
   for BITMODE_Field use
     (BITMODE_Field_16Bit => 0,
      BITMODE_Field_08Bit => 1,
      BITMODE_Field_24Bit => 2,
      BITMODE_Field_32Bit => 3);

   --  Sets timer behaviour.
   type BITMODE_Register is record
      --  Sets timer behaviour ro be like the implementation of a timer with
      --  width as indicated.
      BITMODE       : BITMODE_Field := BITMODE_Field_16Bit;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BITMODE_Register use record
      BITMODE       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ------------------------
   -- PRESCALER_Register --
   ------------------------

   subtype PRESCALER_PRESCALER_Field is nrf51.UInt4;

   --  4-bit prescaler to source clock frequency (max value 9). Source clock
   --  frequency is divided by 2^SCALE.
   type PRESCALER_Register is record
      --  Timer PRESCALER value. Max value is 9.
      PRESCALER     : PRESCALER_PRESCALER_Field := 16#4#;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRESCALER_Register use record
      PRESCALER     at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Capture/compare registers.

   --  Capture/compare registers.
   type CC_Registers is array (0 .. 3) of nrf51.Word;

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

   --  Timer 0.
   type TIMER_Peripheral is record
      --  Start Timer.
      TASKS_START    : nrf51.Word;
      --  Stop Timer.
      TASKS_STOP     : nrf51.Word;
      --  Increment Timer (In counter mode).
      TASKS_COUNT    : nrf51.Word;
      --  Clear timer.
      TASKS_CLEAR    : nrf51.Word;
      --  Shutdown timer.
      TASKS_SHUTDOWN : nrf51.Word;
      --  Capture Timer value to CC[n] registers.
      TASKS_CAPTURE  : TASKS_CAPTURE_Registers;
      --  Compare event on CC[n] match.
      EVENTS_COMPARE : EVENTS_COMPARE_Registers;
      --  Shortcuts for Timer.
      SHORTS         : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET       : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR       : INTENCLR_Register;
      --  Timer Mode selection.
      MODE           : MODE_Register;
      --  Sets timer behaviour.
      BITMODE        : BITMODE_Register;
      --  4-bit prescaler to source clock frequency (max value 9). Source clock
      --  frequency is divided by 2^SCALE.
      PRESCALER      : PRESCALER_Register;
      --  Capture/compare registers.
      CC             : CC_Registers;
      --  Peripheral power control.
      POWER          : POWER_Register;
   end record
     with Volatile;

   for TIMER_Peripheral use record
      TASKS_START    at 0 range 0 .. 31;
      TASKS_STOP     at 4 range 0 .. 31;
      TASKS_COUNT    at 8 range 0 .. 31;
      TASKS_CLEAR    at 12 range 0 .. 31;
      TASKS_SHUTDOWN at 16 range 0 .. 31;
      TASKS_CAPTURE  at 64 range 0 .. 127;
      EVENTS_COMPARE at 320 range 0 .. 127;
      SHORTS         at 512 range 0 .. 31;
      INTENSET       at 772 range 0 .. 31;
      INTENCLR       at 776 range 0 .. 31;
      MODE           at 1284 range 0 .. 31;
      BITMODE        at 1288 range 0 .. 31;
      PRESCALER      at 1296 range 0 .. 31;
      CC             at 1344 range 0 .. 127;
      POWER          at 4092 range 0 .. 31;
   end record;

   --  Timer 0.
   TIMER0_Periph : aliased TIMER_Peripheral
     with Import, Address => TIMER0_Base;

   --  Timer 1.
   TIMER1_Periph : aliased TIMER_Peripheral
     with Import, Address => TIMER1_Base;

   --  Timer 2.
   TIMER2_Periph : aliased TIMER_Peripheral
     with Import, Address => TIMER2_Base;

end nrf51.TIMER;
