--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.UICR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ----------------------
   -- RBPCONF_Register --
   ----------------------

   --  Readback protect region 0. Will be ignored if pre-programmed factory
   --  code is present on the chip.
   type PR0_Field is
     (
      --  Enabled.
      Enabled,
      --  Disabled.
      Disabled)
     with Size => 8;
   for PR0_Field use
     (Enabled => 0,
      Disabled => 255);

   --  Readback protect all code in the device.
   type PALL_Field is
     (
      --  Enabled.
      Enabled,
      --  Disabled.
      Disabled)
     with Size => 8;
   for PALL_Field use
     (Enabled => 0,
      Disabled => 255);

   --  Readback protection configuration.
   type RBPCONF_Register is record
      --  Readback protect region 0. Will be ignored if pre-programmed factory
      --  code is present on the chip.
      PR0            : PR0_Field := Disabled;
      --  Readback protect all code in the device.
      PALL           : PALL_Field := Disabled;
      --  unspecified
      Reserved_16_31 : nrf51.Short := 16#FFFF#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RBPCONF_Register use record
      PR0            at 0 range 0 .. 7;
      PALL           at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------------
   -- XTALFREQ_Register --
   -----------------------

   --  Reset value for CLOCK XTALFREQ register.
   type XTALFREQ_Field is
     (
      --  32MHz Xtal is used.
      XTALFREQ_Field_32Mhz,
      --  16MHz Xtal is used.
      XTALFREQ_Field_16Mhz)
     with Size => 8;
   for XTALFREQ_Field use
     (XTALFREQ_Field_32Mhz => 0,
      XTALFREQ_Field_16Mhz => 255);

   --  Reset value for CLOCK XTALFREQ register.
   type XTALFREQ_Register is record
      --  Reset value for CLOCK XTALFREQ register.
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

   -------------------
   -- FWID_Register --
   -------------------

   subtype FWID_FWID_Field is nrf51.Short;

   --  Firmware ID.
   type FWID_Register is record
      --  Read-only. Identification number for the firmware loaded into the
      --  chip.
      FWID           : FWID_FWID_Field;
      --  unspecified
      Reserved_16_31 : nrf51.Short;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FWID_Register use record
      FWID           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Reserved for Nordic firmware design.

   --  Reserved for Nordic firmware design.
   type NRFFW_Registers is array (0 .. 14) of nrf51.Word;

   --  Reserved for Nordic hardware design.

   --  Reserved for Nordic hardware design.
   type NRFHW_Registers is array (0 .. 11) of nrf51.Word;

   --  Reserved for customer.

   --  Reserved for customer.
   type CUSTOMER_Registers is array (0 .. 31) of nrf51.Word;

   -----------------
   -- Peripherals --
   -----------------

   type UICR_Disc is
     (
      Mode_1,
      Mode_2);

   --  User Information Configuration.
   type UICR_Peripheral
     (Discriminent : UICR_Disc := Mode_1)
   is record
      --  Length of code region 0.
      CLENR0         : nrf51.Word;
      --  Readback protection configuration.
      RBPCONF        : RBPCONF_Register;
      --  Reset value for CLOCK XTALFREQ register.
      XTALFREQ       : XTALFREQ_Register;
      --  Firmware ID.
      FWID           : FWID_Register;
      --  Reserved for Nordic hardware design.
      NRFHW          : NRFHW_Registers;
      --  Reserved for customer.
      CUSTOMER       : CUSTOMER_Registers;
      case Discriminent is
         when Mode_1 =>
            --  Bootloader start address.
            BOOTLOADERADDR : nrf51.Word;
         when Mode_2 =>
            --  Reserved for Nordic firmware design.
            NRFFW : NRFFW_Registers;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for UICR_Peripheral use record
      CLENR0         at 0 range 0 .. 31;
      RBPCONF        at 4 range 0 .. 31;
      XTALFREQ       at 8 range 0 .. 31;
      FWID           at 16 range 0 .. 31;
      NRFHW          at 80 range 0 .. 383;
      CUSTOMER       at 128 range 0 .. 1023;
      BOOTLOADERADDR at 20 range 0 .. 31;
      NRFFW          at 20 range 0 .. 479;
   end record;

   --  User Information Configuration.
   UICR_Periph : aliased UICR_Peripheral
     with Import, Address => UICR_Base;

end nrf51.UICR;
