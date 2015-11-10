--  Nested Vectored Interrupt Controller, 11057 23-Mar-15, Chapter 10.20;
--  more detail at http://infocenter.arm.com/

with System;

package Registers.Cortex.NVIC with Preelaborate is

   type Bits_32x1_Array is array (Natural range <>) of Bits_32x1;
   type Bits_32x4_Array is array (Natural range <>) of Bits_32x4;

   type NVIC_T is record
      ISER : Bits_32x1_Array (0 .. 7);
      ICER : Bits_32x1_Array (0 .. 7);
      ISPR : Bits_32x1_Array (0 .. 7);
      ICPR : Bits_32x1_Array (0 .. 7);
      IABR : Bits_32x1_Array (0 .. 7);
      IPRO : Bits_32x4_Array (0 .. 59);
      STIR : Interfaces.Unsigned_32;
   end record
   with Convention => Ada, Volatile, Size => 8 * (16#0E00# + 4);

   for NVIC_T use record
      ISER at 16#0000# range 0 .. 255;
      ICER at 16#0080# range 0 .. 255;
      ISPR at 16#0100# range 0 .. 255;
      ICPR at 16#0180# range 0 .. 255;
      IABR at 16#0200# range 0 .. 255;
      IPRO at 16#0300# range 0 .. 1919;
      STIR at 16#0E00# range 0 .. 31;
   end record;

   NVIC : NVIC_T
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#E000E100#);

end Registers.Cortex.NVIC;
