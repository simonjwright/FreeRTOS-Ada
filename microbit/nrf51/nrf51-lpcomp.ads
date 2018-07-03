--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.LPCOMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between READY event and SAMPLE task.
   type READY_SAMPLE_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for READY_SAMPLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between RADY event and STOP task.
   type READY_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for READY_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between DOWN event and STOP task.
   type DOWN_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for DOWN_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between UP event and STOP task.
   type UP_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for UP_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between CROSS event and STOP task.
   type CROSS_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for CROSS_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for the LPCOMP.
   type SHORTS_Register is record
      --  Shortcut between READY event and SAMPLE task.
      READY_SAMPLE  : READY_SAMPLE_Field := Disabled;
      --  Shortcut between RADY event and STOP task.
      READY_STOP    : READY_STOP_Field := Disabled;
      --  Shortcut between DOWN event and STOP task.
      DOWN_STOP     : DOWN_STOP_Field := Disabled;
      --  Shortcut between UP event and STOP task.
      UP_STOP       : UP_STOP_Field := Disabled;
      --  Shortcut between CROSS event and STOP task.
      CROSS_STOP    : CROSS_STOP_Field := Disabled;
      --  unspecified
      Reserved_5_31 : nrf51.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      READY_SAMPLE  at 0 range 0 .. 0;
      READY_STOP    at 0 range 1 .. 1;
      DOWN_STOP     at 0 range 2 .. 2;
      UP_STOP       at 0 range 3 .. 3;
      CROSS_STOP    at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on READY event.
   type READY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for READY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on READY event.
   type READY_Field_1 is
     (
      --  Reset value for the field
      Ready_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for READY_Field_1 use
     (Ready_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on DOWN event.
   type DOWN_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for DOWN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on DOWN event.
   type DOWN_Field_1 is
     (
      --  Reset value for the field
      Down_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for DOWN_Field_1 use
     (Down_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on UP event.
   type UP_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for UP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on UP event.
   type UP_Field_1 is
     (
      --  Reset value for the field
      Up_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for UP_Field_1 use
     (Up_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on CROSS event.
   type CROSS_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for CROSS_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on CROSS event.
   type CROSS_Field_1 is
     (
      --  Reset value for the field
      Cross_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for CROSS_Field_1 use
     (Cross_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on READY event.
      READY         : READY_Field_1 := Ready_Field_Reset;
      --  Enable interrupt on DOWN event.
      DOWN          : DOWN_Field_1 := Down_Field_Reset;
      --  Enable interrupt on UP event.
      UP            : UP_Field_1 := Up_Field_Reset;
      --  Enable interrupt on CROSS event.
      CROSS         : CROSS_Field_1 := Cross_Field_Reset;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      READY         at 0 range 0 .. 0;
      DOWN          at 0 range 1 .. 1;
      UP            at 0 range 2 .. 2;
      CROSS         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on READY event.
   type READY_Field_2 is
     (
      --  Reset value for the field
      Ready_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for READY_Field_2 use
     (Ready_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on DOWN event.
   type DOWN_Field_2 is
     (
      --  Reset value for the field
      Down_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for DOWN_Field_2 use
     (Down_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on UP event.
   type UP_Field_2 is
     (
      --  Reset value for the field
      Up_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for UP_Field_2 use
     (Up_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on CROSS event.
   type CROSS_Field_2 is
     (
      --  Reset value for the field
      Cross_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for CROSS_Field_2 use
     (Cross_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on READY event.
      READY         : READY_Field_2 := Ready_Field_Reset;
      --  Disable interrupt on DOWN event.
      DOWN          : DOWN_Field_2 := Down_Field_Reset;
      --  Disable interrupt on UP event.
      UP            : UP_Field_2 := Up_Field_Reset;
      --  Disable interrupt on CROSS event.
      CROSS         : CROSS_Field_2 := Cross_Field_Reset;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      READY         at 0 range 0 .. 0;
      DOWN          at 0 range 1 .. 1;
      UP            at 0 range 2 .. 2;
      CROSS         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ---------------------
   -- RESULT_Register --
   ---------------------

   --  Result of last compare. Decision point SAMPLE task.
   type RESULT_Field is
     (
      --  Input voltage is bellow the reference threshold.
      Bellow,
      --  Input voltage is above the reference threshold.
      Above)
     with Size => 1;
   for RESULT_Field use
     (Bellow => 0,
      Above => 1);

   --  Result of last compare.
   type RESULT_Register is record
      --  Read-only. Result of last compare. Decision point SAMPLE task.
      RESULT        : RESULT_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESULT_Register use record
      RESULT        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable LPCOMP.
   type ENABLE_Field is
     (
      --  Disabled LPCOMP.
      Disabled,
      --  Enable LPCOMP.
      Enabled)
     with Size => 2;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable the LPCOMP.
   type ENABLE_Register is record
      --  Enable or disable LPCOMP.
      ENABLE        : ENABLE_Field := Disabled;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -------------------
   -- PSEL_Register --
   -------------------

   --  Analog input pin select.
   type PSEL_Field is
     (
      --  Use analog input 0 as analog input.
      Analoginput0,
      --  Use analog input 1 as analog input.
      Analoginput1,
      --  Use analog input 2 as analog input.
      Analoginput2,
      --  Use analog input 3 as analog input.
      Analoginput3,
      --  Use analog input 4 as analog input.
      Analoginput4,
      --  Use analog input 5 as analog input.
      Analoginput5,
      --  Use analog input 6 as analog input.
      Analoginput6,
      --  Use analog input 7 as analog input.
      Analoginput7)
     with Size => 3;
   for PSEL_Field use
     (Analoginput0 => 0,
      Analoginput1 => 1,
      Analoginput2 => 2,
      Analoginput3 => 3,
      Analoginput4 => 4,
      Analoginput5 => 5,
      Analoginput6 => 6,
      Analoginput7 => 7);

   --  Input pin select.
   type PSEL_Register is record
      --  Analog input pin select.
      PSEL          : PSEL_Field := Analoginput0;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSEL_Register use record
      PSEL          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ---------------------
   -- REFSEL_Register --
   ---------------------

   --  Reference select.
   type REFSEL_Field is
     (
      --  Use supply with a 1/8 prescaler as reference.
      Supplyoneeighthprescaling,
      --  Use supply with a 2/8 prescaler as reference.
      Supplytwoeighthsprescaling,
      --  Use supply with a 3/8 prescaler as reference.
      Supplythreeeighthsprescaling,
      --  Use supply with a 4/8 prescaler as reference.
      Supplyfoureighthsprescaling,
      --  Use supply with a 5/8 prescaler as reference.
      Supplyfiveeighthsprescaling,
      --  Use supply with a 6/8 prescaler as reference.
      Supplysixeighthsprescaling,
      --  Use supply with a 7/8 prescaler as reference.
      Supplyseveneighthsprescaling,
      --  Use external analog reference as reference.
      Aref)
     with Size => 3;
   for REFSEL_Field use
     (Supplyoneeighthprescaling => 0,
      Supplytwoeighthsprescaling => 1,
      Supplythreeeighthsprescaling => 2,
      Supplyfoureighthsprescaling => 3,
      Supplyfiveeighthsprescaling => 4,
      Supplysixeighthsprescaling => 5,
      Supplyseveneighthsprescaling => 6,
      Aref => 7);

   --  Reference select.
   type REFSEL_Register is record
      --  Reference select.
      REFSEL        : REFSEL_Field := Supplyoneeighthprescaling;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for REFSEL_Register use record
      REFSEL        at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------------
   -- EXTREFSEL_Register --
   ------------------------

   --  External analog reference pin selection.
   type EXTREFSEL_Field is
     (
      --  Use analog reference 0 as reference.
      Analogreference0,
      --  Use analog reference 1 as reference.
      Analogreference1)
     with Size => 1;
   for EXTREFSEL_Field use
     (Analogreference0 => 0,
      Analogreference1 => 1);

   --  External reference select.
   type EXTREFSEL_Register is record
      --  External analog reference pin selection.
      EXTREFSEL     : EXTREFSEL_Field := Analogreference0;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTREFSEL_Register use record
      EXTREFSEL     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- ANADETECT_Register --
   ------------------------

   --  Analog detect configuration.
   type ANADETECT_Field is
     (
      --  Generate ANADETEC on crossing, both upwards and downwards crossing.
      Cross,
      --  Generate ANADETEC on upwards crossing only.
      Up,
      --  Generate ANADETEC on downwards crossing only.
      Down)
     with Size => 2;
   for ANADETECT_Field use
     (Cross => 0,
      Up => 1,
      Down => 2);

   --  Analog detect configuration.
   type ANADETECT_Register is record
      --  Analog detect configuration.
      ANADETECT     : ANADETECT_Field := Cross;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ANADETECT_Register use record
      ANADETECT     at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

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

   --  Low power comparator.
   type LPCOMP_Peripheral is record
      --  Start the comparator.
      TASKS_START  : nrf51.Word;
      --  Stop the comparator.
      TASKS_STOP   : nrf51.Word;
      --  Sample comparator value.
      TASKS_SAMPLE : nrf51.Word;
      --  LPCOMP is ready and output is valid.
      EVENTS_READY : nrf51.Word;
      --  Input voltage crossed the threshold going down.
      EVENTS_DOWN  : nrf51.Word;
      --  Input voltage crossed the threshold going up.
      EVENTS_UP    : nrf51.Word;
      --  Input voltage crossed the threshold in any direction.
      EVENTS_CROSS : nrf51.Word;
      --  Shortcuts for the LPCOMP.
      SHORTS       : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET     : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR     : INTENCLR_Register;
      --  Result of last compare.
      RESULT       : RESULT_Register;
      --  Enable the LPCOMP.
      ENABLE       : ENABLE_Register;
      --  Input pin select.
      PSEL         : PSEL_Register;
      --  Reference select.
      REFSEL       : REFSEL_Register;
      --  External reference select.
      EXTREFSEL    : EXTREFSEL_Register;
      --  Analog detect configuration.
      ANADETECT    : ANADETECT_Register;
      --  Peripheral power control.
      POWER        : POWER_Register;
   end record
     with Volatile;

   for LPCOMP_Peripheral use record
      TASKS_START  at 0 range 0 .. 31;
      TASKS_STOP   at 4 range 0 .. 31;
      TASKS_SAMPLE at 8 range 0 .. 31;
      EVENTS_READY at 256 range 0 .. 31;
      EVENTS_DOWN  at 260 range 0 .. 31;
      EVENTS_UP    at 264 range 0 .. 31;
      EVENTS_CROSS at 268 range 0 .. 31;
      SHORTS       at 512 range 0 .. 31;
      INTENSET     at 772 range 0 .. 31;
      INTENCLR     at 776 range 0 .. 31;
      RESULT       at 1024 range 0 .. 31;
      ENABLE       at 1280 range 0 .. 31;
      PSEL         at 1284 range 0 .. 31;
      REFSEL       at 1288 range 0 .. 31;
      EXTREFSEL    at 1292 range 0 .. 31;
      ANADETECT    at 1312 range 0 .. 31;
      POWER        at 4092 range 0 .. 31;
   end record;

   --  Low power comparator.
   LPCOMP_Periph : aliased LPCOMP_Peripheral
     with Import, Address => LPCOMP_Base;

end nrf51.LPCOMP;
