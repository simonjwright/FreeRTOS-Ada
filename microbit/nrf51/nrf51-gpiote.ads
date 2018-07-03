--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.GPIOTE is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Tasks asssociated with GPIOTE channels.

   --  Tasks asssociated with GPIOTE channels.
   type TASKS_OUT_Registers is array (0 .. 3) of nrf51.Word;

   --  Tasks asssociated with GPIOTE channels.

   --  Tasks asssociated with GPIOTE channels.
   type EVENTS_IN_Registers is array (0 .. 3) of nrf51.Word;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on IN[0] event.
   type IN0_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for IN0_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on IN[0] event.
   type IN0_Field_1 is
     (
      --  Reset value for the field
      In0_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for IN0_Field_1 use
     (In0_Field_Reset => 0,
      Set => 1);

   -----------------
   -- INTENSET.IN --
   -----------------

   --  INTENSET_IN array
   type INTENSET_IN_Field_Array is array (0 .. 3) of IN0_Field_1
     with Component_Size => 1, Size => 4;

   --  Type definition for INTENSET_IN
   type INTENSET_IN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IN as a value
            Val : nrf51.UInt4;
         when True =>
            --  IN as an array
            Arr : INTENSET_IN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for INTENSET_IN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Enable interrupt on PORT event.
   type PORT_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for PORT_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on PORT event.
   type PORT_Field_1 is
     (
      --  Reset value for the field
      Port_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for PORT_Field_1 use
     (Port_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on IN[0] event.
      IN_k          : INTENSET_IN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_30 : nrf51.UInt27 := 16#0#;
      --  Enable interrupt on PORT event.
      PORT          : PORT_Field_1 := Port_Field_Reset;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      IN_k          at 0 range 0 .. 3;
      Reserved_4_30 at 0 range 4 .. 30;
      PORT          at 0 range 31 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on IN[0] event.
   type IN0_Field_2 is
     (
      --  Reset value for the field
      In0_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for IN0_Field_2 use
     (In0_Field_Reset => 0,
      Clear => 1);

   -----------------
   -- INTENCLR.IN --
   -----------------

   --  INTENCLR_IN array
   type INTENCLR_IN_Field_Array is array (0 .. 3) of IN0_Field_2
     with Component_Size => 1, Size => 4;

   --  Type definition for INTENCLR_IN
   type INTENCLR_IN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IN as a value
            Val : nrf51.UInt4;
         when True =>
            --  IN as an array
            Arr : INTENCLR_IN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for INTENCLR_IN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Disable interrupt on PORT event.
   type PORT_Field_2 is
     (
      --  Reset value for the field
      Port_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for PORT_Field_2 use
     (Port_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on IN[0] event.
      IN_k          : INTENCLR_IN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_30 : nrf51.UInt27 := 16#0#;
      --  Disable interrupt on PORT event.
      PORT          : PORT_Field_2 := Port_Field_Reset;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      IN_k          at 0 range 0 .. 3;
      Reserved_4_30 at 0 range 4 .. 30;
      PORT          at 0 range 31 .. 31;
   end record;

   ---------------------
   -- CONFIG_Register --
   ---------------------

   --  Mode
   type MODE_Field is
     (
      --  Disabled.
      Disabled,
      --  Channel configure in event mode.
      Event,
      --  Channel configure in task mode.
      Task_k)
     with Size => 2;
   for MODE_Field use
     (Disabled => 0,
      Event => 1,
      Task_k => 3);

   subtype CONFIG_PSEL_Field is nrf51.UInt5;

   --  Effects on output when in Task mode, or events on input that generates
   --  an event.
   type POLARITY_Field is
     (
      --  No task or event.
      None,
      --  Low to high.
      Lotohi,
      --  High to low.
      Hitolo,
      --  Toggle.
      Toggle)
     with Size => 2;
   for POLARITY_Field use
     (None => 0,
      Lotohi => 1,
      Hitolo => 2,
      Toggle => 3);

   --  Initial value of the output when the GPIOTE channel is configured as a
   --  Task.
   type OUTINIT_Field is
     (
      --  Initial low output when in task mode.
      Low,
      --  Initial high output when in task mode.
      High)
     with Size => 1;
   for OUTINIT_Field use
     (Low => 0,
      High => 1);

   --  Channel configuration registers.
   type CONFIG_Register is record
      --  Mode
      MODE           : MODE_Field := Disabled;
      --  unspecified
      Reserved_2_7   : nrf51.UInt6 := 16#0#;
      --  Pin select.
      PSEL           : CONFIG_PSEL_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : nrf51.UInt3 := 16#0#;
      --  Effects on output when in Task mode, or events on input that
      --  generates an event.
      POLARITY       : POLARITY_Field := None;
      --  unspecified
      Reserved_18_19 : nrf51.UInt2 := 16#0#;
      --  Initial value of the output when the GPIOTE channel is configured as
      --  a Task.
      OUTINIT        : OUTINIT_Field := Low;
      --  unspecified
      Reserved_21_31 : nrf51.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      MODE           at 0 range 0 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      PSEL           at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      POLARITY       at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      OUTINIT        at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   --  Channel configuration registers.
   type CONFIG_Registers is array (0 .. 3) of CONFIG_Register;

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

   --  GPIO tasks and events.
   type GPIOTE_Peripheral is record
      --  Tasks asssociated with GPIOTE channels.
      TASKS_OUT   : TASKS_OUT_Registers;
      --  Tasks asssociated with GPIOTE channels.
      EVENTS_IN   : EVENTS_IN_Registers;
      --  Event generated from multiple pins.
      EVENTS_PORT : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET    : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR    : INTENCLR_Register;
      --  Channel configuration registers.
      CONFIG      : CONFIG_Registers;
      --  Peripheral power control.
      POWER       : POWER_Register;
   end record
     with Volatile;

   for GPIOTE_Peripheral use record
      TASKS_OUT   at 0 range 0 .. 127;
      EVENTS_IN   at 256 range 0 .. 127;
      EVENTS_PORT at 380 range 0 .. 31;
      INTENSET    at 772 range 0 .. 31;
      INTENCLR    at 776 range 0 .. 31;
      CONFIG      at 1296 range 0 .. 127;
      POWER       at 4092 range 0 .. 31;
   end record;

   --  GPIO tasks and events.
   GPIOTE_Periph : aliased GPIOTE_Peripheral
     with Import, Address => GPIOTE_Base;

end nrf51.GPIOTE;
