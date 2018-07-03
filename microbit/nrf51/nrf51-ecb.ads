--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.ECB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on ENDECB event.
   type ENDECB_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ENDECB_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ENDECB event.
   type ENDECB_Field_1 is
     (
      --  Reset value for the field
      Endecb_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ENDECB_Field_1 use
     (Endecb_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ERRORECB event.
   type ERRORECB_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ERRORECB_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ERRORECB event.
   type ERRORECB_Field_1 is
     (
      --  Reset value for the field
      Errorecb_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ERRORECB_Field_1 use
     (Errorecb_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on ENDECB event.
      ENDECB        : ENDECB_Field_1 := Endecb_Field_Reset;
      --  Enable interrupt on ERRORECB event.
      ERRORECB      : ERRORECB_Field_1 := Errorecb_Field_Reset;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      ENDECB        at 0 range 0 .. 0;
      ERRORECB      at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on ENDECB event.
   type ENDECB_Field_2 is
     (
      --  Reset value for the field
      Endecb_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ENDECB_Field_2 use
     (Endecb_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ERRORECB event.
   type ERRORECB_Field_2 is
     (
      --  Reset value for the field
      Errorecb_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ERRORECB_Field_2 use
     (Errorecb_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on ENDECB event.
      ENDECB        : ENDECB_Field_2 := Endecb_Field_Reset;
      --  Disable interrupt on ERRORECB event.
      ERRORECB      : ERRORECB_Field_2 := Errorecb_Field_Reset;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      ENDECB        at 0 range 0 .. 0;
      ERRORECB      at 0 range 1 .. 1;
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

   --  AES ECB Mode Encryption.
   type ECB_Peripheral is record
      --  Start ECB block encrypt. If a crypto operation is running, this will
      --  not initiate a new encryption and the ERRORECB event will be
      --  triggered.
      TASKS_STARTECB  : nrf51.Word;
      --  Stop current ECB encryption. If a crypto operation is running, this
      --  will will trigger the ERRORECB event.
      TASKS_STOPECB   : nrf51.Word;
      --  ECB block encrypt complete.
      EVENTS_ENDECB   : nrf51.Word;
      --  ECB block encrypt aborted due to a STOPECB task or due to an error.
      EVENTS_ERRORECB : nrf51.Word;
      --  Interrupt enable set register.
      INTENSET        : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR        : INTENCLR_Register;
      --  ECB block encrypt memory pointer.
      ECBDATAPTR      : nrf51.Word;
      --  Peripheral power control.
      POWER           : POWER_Register;
   end record
     with Volatile;

   for ECB_Peripheral use record
      TASKS_STARTECB  at 0 range 0 .. 31;
      TASKS_STOPECB   at 4 range 0 .. 31;
      EVENTS_ENDECB   at 256 range 0 .. 31;
      EVENTS_ERRORECB at 260 range 0 .. 31;
      INTENSET        at 772 range 0 .. 31;
      INTENCLR        at 776 range 0 .. 31;
      ECBDATAPTR      at 1284 range 0 .. 31;
      POWER           at 4092 range 0 .. 31;
   end record;

   --  AES ECB Mode Encryption.
   ECB_Periph : aliased ECB_Peripheral
     with Import, Address => ECB_Base;

end nrf51.ECB;
