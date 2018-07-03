--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.CCM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between ENDKSGEN event and CRYPT task.
   type ENDKSGEN_CRYPT_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for ENDKSGEN_CRYPT_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for the CCM.
   type SHORTS_Register is record
      --  Shortcut between ENDKSGEN event and CRYPT task.
      ENDKSGEN_CRYPT : ENDKSGEN_CRYPT_Field := Disabled;
      --  unspecified
      Reserved_1_31  : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      ENDKSGEN_CRYPT at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on ENDKSGEN event.
   type ENDKSGEN_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ENDKSGEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ENDKSGEN event.
   type ENDKSGEN_Field_1 is
     (
      --  Reset value for the field
      Endksgen_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ENDKSGEN_Field_1 use
     (Endksgen_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ENDCRYPT event.
   type ENDCRYPT_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ENDCRYPT_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ENDCRYPT event.
   type ENDCRYPT_Field_1 is
     (
      --  Reset value for the field
      Endcrypt_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ENDCRYPT_Field_1 use
     (Endcrypt_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ERROR event.
   type ERROR_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ERROR_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ERROR event.
   type ERROR_Field_1 is
     (
      --  Reset value for the field
      Error_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ERROR_Field_1 use
     (Error_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on ENDKSGEN event.
      ENDKSGEN      : ENDKSGEN_Field_1 := Endksgen_Field_Reset;
      --  Enable interrupt on ENDCRYPT event.
      ENDCRYPT      : ENDCRYPT_Field_1 := Endcrypt_Field_Reset;
      --  Enable interrupt on ERROR event.
      ERROR         : ERROR_Field_1 := Error_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      ENDKSGEN      at 0 range 0 .. 0;
      ENDCRYPT      at 0 range 1 .. 1;
      ERROR         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on ENDKSGEN event.
   type ENDKSGEN_Field_2 is
     (
      --  Reset value for the field
      Endksgen_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ENDKSGEN_Field_2 use
     (Endksgen_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ENDCRYPT event.
   type ENDCRYPT_Field_2 is
     (
      --  Reset value for the field
      Endcrypt_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ENDCRYPT_Field_2 use
     (Endcrypt_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ERROR event.
   type ERROR_Field_2 is
     (
      --  Reset value for the field
      Error_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ERROR_Field_2 use
     (Error_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on ENDKSGEN event.
      ENDKSGEN      : ENDKSGEN_Field_2 := Endksgen_Field_Reset;
      --  Disable interrupt on ENDCRYPT event.
      ENDCRYPT      : ENDCRYPT_Field_2 := Endcrypt_Field_Reset;
      --  Disable interrupt on ERROR event.
      ERROR         : ERROR_Field_2 := Error_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      ENDKSGEN      at 0 range 0 .. 0;
      ENDCRYPT      at 0 range 1 .. 1;
      ERROR         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------------
   -- MICSTATUS_Register --
   ------------------------

   --  Result of the MIC check performed during the previous CCM RX STARTCRYPT
   type MICSTATUS_Field is
     (
      --  MIC check failed.
      Checkfailed,
      --  MIC check passed.
      Checkpassed)
     with Size => 1;
   for MICSTATUS_Field use
     (Checkfailed => 0,
      Checkpassed => 1);

   --  CCM RX MIC check result.
   type MICSTATUS_Register is record
      --  Read-only. Result of the MIC check performed during the previous CCM
      --  RX STARTCRYPT
      MICSTATUS     : MICSTATUS_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MICSTATUS_Register use record
      MICSTATUS     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  CCM enable.
   type ENABLE_Field is
     (
      --  CCM is disabled.
      Disabled,
      --  CCM is enabled.
      Enabled)
     with Size => 2;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 2);

   --  CCM enable.
   type ENABLE_Register is record
      --  CCM enable.
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
   -- MODE_Register --
   -------------------

   --  CCM mode operation.
   type MODE_Field is
     (
      --  CCM mode TX
      Encryption,
      --  CCM mode TX
      Decryption)
     with Size => 1;
   for MODE_Field use
     (Encryption => 0,
      Decryption => 1);

   --  Operation mode.
   type MODE_Register is record
      --  CCM mode operation.
      MODE          : MODE_Field := Decryption;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MODE_Register use record
      MODE          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
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

   --  AES CCM Mode Encryption.
   type CCM_Peripheral is record
      --  Start generation of key-stream. This operation will stop by itself
      --  when completed.
      TASKS_KSGEN     : nrf51.Word;
      --  Start encrypt/decrypt. This operation will stop by itself when
      --  completed.
      TASKS_CRYPT     : nrf51.Word;
      --  Stop encrypt/decrypt.
      TASKS_STOP      : nrf51.Word;
      --  Keystream generation completed.
      EVENTS_ENDKSGEN : nrf51.Word;
      --  Encrypt/decrypt completed.
      EVENTS_ENDCRYPT : nrf51.Word;
      --  Error happened.
      EVENTS_ERROR    : nrf51.Word;
      --  Shortcuts for the CCM.
      SHORTS          : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET        : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR        : INTENCLR_Register;
      --  CCM RX MIC check result.
      MICSTATUS       : MICSTATUS_Register;
      --  CCM enable.
      ENABLE          : ENABLE_Register;
      --  Operation mode.
      MODE            : MODE_Register;
      --  Pointer to a data structure holding AES key and NONCE vector.
      CNFPTR          : nrf51.Word;
      --  Pointer to the input packet.
      INPTR           : nrf51.Word;
      --  Pointer to the output packet.
      OUTPTR          : nrf51.Word;
      --  Pointer to a "scratch" data area used for temporary storage during
      --  resolution. A minimum of 43 bytes must be reserved.
      SCRATCHPTR      : nrf51.Word;
      --  Peripheral power control.
      POWER           : POWER_Register;
   end record
     with Volatile;

   for CCM_Peripheral use record
      TASKS_KSGEN     at 0 range 0 .. 31;
      TASKS_CRYPT     at 4 range 0 .. 31;
      TASKS_STOP      at 8 range 0 .. 31;
      EVENTS_ENDKSGEN at 256 range 0 .. 31;
      EVENTS_ENDCRYPT at 260 range 0 .. 31;
      EVENTS_ERROR    at 264 range 0 .. 31;
      SHORTS          at 512 range 0 .. 31;
      INTENSET        at 772 range 0 .. 31;
      INTENCLR        at 776 range 0 .. 31;
      MICSTATUS       at 1024 range 0 .. 31;
      ENABLE          at 1280 range 0 .. 31;
      MODE            at 1284 range 0 .. 31;
      CNFPTR          at 1288 range 0 .. 31;
      INPTR           at 1292 range 0 .. 31;
      OUTPTR          at 1296 range 0 .. 31;
      SCRATCHPTR      at 1300 range 0 .. 31;
      POWER           at 4092 range 0 .. 31;
   end record;

   --  AES CCM Mode Encryption.
   CCM_Periph : aliased CCM_Peripheral
     with Import, Address => CCM_Base;

end nrf51.CCM;
