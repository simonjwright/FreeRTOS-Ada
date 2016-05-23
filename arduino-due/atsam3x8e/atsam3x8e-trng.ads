--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  True Random Number Generator
package ATSAM3X8E.TRNG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_ENABLE_Field is ATSAM3X8E.Bit;
   subtype CR_KEY_Field is ATSAM3X8E.UInt24;

   --  Control Register
   type CR_Register is record
      --  Write-only. Enables the TRNG to provide random values
      ENABLE       : CR_ENABLE_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write-only. Security Key
      KEY          : CR_KEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      ENABLE       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      KEY          at 0 range 8 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_DATRDY_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Data Ready Interrupt Enable
      DATRDY        : IER_DATRDY_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      DATRDY        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_DATRDY_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Data Ready Interrupt Disable
      DATRDY        : IDR_DATRDY_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      DATRDY        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_DATRDY_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Data Ready Interrupt Mask
      DATRDY        : IMR_DATRDY_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      DATRDY        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------
   -- ISR_Register --
   ------------------

   subtype ISR_DATRDY_Field is ATSAM3X8E.Bit;

   --  Interrupt Status Register
   type ISR_Register is record
      --  Read-only. Data Ready
      DATRDY        : ISR_DATRDY_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : ATSAM3X8E.UInt31;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      DATRDY        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  True Random Number Generator
   type TRNG_Peripheral is record
      --  Control Register
      CR    : CR_Register;
      --  Interrupt Enable Register
      IER   : IER_Register;
      --  Interrupt Disable Register
      IDR   : IDR_Register;
      --  Interrupt Mask Register
      IMR   : IMR_Register;
      --  Interrupt Status Register
      ISR   : ISR_Register;
      --  Output Data Register
      ODATA : ATSAM3X8E.Word;
   end record
     with Volatile;

   for TRNG_Peripheral use record
      CR    at 0 range 0 .. 31;
      IER   at 16 range 0 .. 31;
      IDR   at 20 range 0 .. 31;
      IMR   at 24 range 0 .. 31;
      ISR   at 28 range 0 .. 31;
      ODATA at 80 range 0 .. 31;
   end record;

   --  True Random Number Generator
   TRNG_Periph : aliased TRNG_Peripheral
     with Import, Address => TRNG_Base;

end ATSAM3X8E.TRNG;
