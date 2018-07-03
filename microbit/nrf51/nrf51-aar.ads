--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.AAR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on END event.
   type END_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for END_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on END event.
   type END_Field_1 is
     (
      --  Reset value for the field
      End_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for END_Field_1 use
     (End_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on RESOLVED event.
   type RESOLVED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for RESOLVED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on RESOLVED event.
   type RESOLVED_Field_1 is
     (
      --  Reset value for the field
      Resolved_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for RESOLVED_Field_1 use
     (Resolved_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on NOTRESOLVED event.
   type NOTRESOLVED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for NOTRESOLVED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on NOTRESOLVED event.
   type NOTRESOLVED_Field_1 is
     (
      --  Reset value for the field
      Notresolved_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for NOTRESOLVED_Field_1 use
     (Notresolved_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on END event.
      END_k         : END_Field_1 := End_Field_Reset;
      --  Enable interrupt on RESOLVED event.
      RESOLVED      : RESOLVED_Field_1 := Resolved_Field_Reset;
      --  Enable interrupt on NOTRESOLVED event.
      NOTRESOLVED   : NOTRESOLVED_Field_1 := Notresolved_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      END_k         at 0 range 0 .. 0;
      RESOLVED      at 0 range 1 .. 1;
      NOTRESOLVED   at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on ENDKSGEN event.
   type END_Field_2 is
     (
      --  Reset value for the field
      End_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for END_Field_2 use
     (End_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on RESOLVED event.
   type RESOLVED_Field_2 is
     (
      --  Reset value for the field
      Resolved_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for RESOLVED_Field_2 use
     (Resolved_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on NOTRESOLVED event.
   type NOTRESOLVED_Field_2 is
     (
      --  Reset value for the field
      Notresolved_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for NOTRESOLVED_Field_2 use
     (Notresolved_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on ENDKSGEN event.
      END_k         : END_Field_2 := End_Field_Reset;
      --  Disable interrupt on RESOLVED event.
      RESOLVED      : RESOLVED_Field_2 := Resolved_Field_Reset;
      --  Disable interrupt on NOTRESOLVED event.
      NOTRESOLVED   : NOTRESOLVED_Field_2 := Notresolved_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      END_k         at 0 range 0 .. 0;
      RESOLVED      at 0 range 1 .. 1;
      NOTRESOLVED   at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ---------------------
   -- STATUS_Register --
   ---------------------

   subtype STATUS_STATUS_Field is nrf51.UInt4;

   --  Resolution status.
   type STATUS_Register is record
      --  Read-only. The IRK used last time an address was resolved.
      STATUS        : STATUS_STATUS_Field;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATUS_Register use record
      STATUS        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable AAR.
   type ENABLE_Field is
     (
      --  Disabled AAR.
      Disabled,
      --  Enable AAR.
      Enabled)
     with Size => 2;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 3);

   --  Enable AAR.
   type ENABLE_Register is record
      --  Enable AAR.
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
   -- NIRK_Register --
   -------------------

   subtype NIRK_NIRK_Field is nrf51.UInt5;

   --  Number of Identity root Keys in the IRK data structure.
   type NIRK_Register is record
      --  Number of Identity root Keys in the IRK data structure.
      NIRK          : NIRK_NIRK_Field := 16#1#;
      --  unspecified
      Reserved_5_31 : nrf51.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for NIRK_Register use record
      NIRK          at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
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

   --  Accelerated Address Resolver.
   type AAR_Peripheral is record
      --  Start resolving addresses based on IRKs specified in the IRK data
      --  structure.
      TASKS_START        : nrf51.Word;
      --  Stop resolving addresses.
      TASKS_STOP         : nrf51.Word;
      --  Address resolution procedure completed.
      EVENTS_END         : nrf51.Word;
      --  Address resolved.
      EVENTS_RESOLVED    : nrf51.Word;
      --  Address not resolved.
      EVENTS_NOTRESOLVED : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET           : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR           : INTENCLR_Register;
      --  Resolution status.
      STATUS             : STATUS_Register;
      --  Enable AAR.
      ENABLE             : ENABLE_Register;
      --  Number of Identity root Keys in the IRK data structure.
      NIRK               : NIRK_Register;
      --  Pointer to the IRK data structure.
      IRKPTR             : nrf51.Word;
      --  Pointer to the resolvable address (6 bytes).
      ADDRPTR            : nrf51.Word;
      --  Pointer to a "scratch" data area used for temporary storage during
      --  resolution. A minimum of 3 bytes must be reserved.
      SCRATCHPTR         : nrf51.Word;
      --  Peripheral power control.
      POWER              : POWER_Register;
   end record
     with Volatile;

   for AAR_Peripheral use record
      TASKS_START        at 0 range 0 .. 31;
      TASKS_STOP         at 8 range 0 .. 31;
      EVENTS_END         at 256 range 0 .. 31;
      EVENTS_RESOLVED    at 260 range 0 .. 31;
      EVENTS_NOTRESOLVED at 264 range 0 .. 31;
      INTENSET           at 772 range 0 .. 31;
      INTENCLR           at 776 range 0 .. 31;
      STATUS             at 1024 range 0 .. 31;
      ENABLE             at 1280 range 0 .. 31;
      NIRK               at 1284 range 0 .. 31;
      IRKPTR             at 1288 range 0 .. 31;
      ADDRPTR            at 1296 range 0 .. 31;
      SCRATCHPTR         at 1300 range 0 .. 31;
      POWER              at 4092 range 0 .. 31;
   end record;

   --  Accelerated Address Resolver.
   AAR_Periph : aliased AAR_Peripheral
     with Import, Address => AAR_Base;

end nrf51.AAR;
