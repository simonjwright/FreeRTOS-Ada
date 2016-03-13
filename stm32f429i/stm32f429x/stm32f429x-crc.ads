--  Automatically generated from STM32F429x.svd by SVD2Ada
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F429x.CRC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_IDR_Field is STM32F429x.Byte;

   --  Independent Data register
   type IDR_Register is record
      --  Independent Data register
      IDR           : IDR_IDR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32F429x.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      IDR           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_CR_Field is STM32F429x.Bit;

   --  Control register
   type CR_Register is record
      --  Control regidter
      CR            : CR_CR_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32F429x.UInt31 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      CR            at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Cryptographic processor
   type CRC_Peripheral is record
      --  Data register
      DR  : STM32F429x.Word;
      --  Independent Data register
      IDR : IDR_Register;
      --  Control register
      CR  : CR_Register;
   end record
     with Volatile;

   for CRC_Peripheral use record
      DR  at 0 range 0 .. 31;
      IDR at 4 range 0 .. 31;
      CR  at 8 range 0 .. 31;
   end record;

   --  Cryptographic processor
   CRC_Periph : aliased CRC_Peripheral
     with Import, Address => System'To_Address (16#40023000#);

end STM32F429x.CRC;
