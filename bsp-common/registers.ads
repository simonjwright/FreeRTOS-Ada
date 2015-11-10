with Ada.Unchecked_Conversion;
with Interfaces;

package Registers with Pure is

   --  Types for bit/partword handling.

   type Bits_1 is mod 2 with  Size => 1;
   type Bits_2 is mod 4 with  Size => 2;
   type Bits_4 is mod 16 with Size => 4;

   type Bits_16x1 is array (0 .. 15) of Bits_1 with Pack, Size => 16;
   type Bits_16x2 is array (0 .. 7)  of Bits_2 with Pack, Size => 16;
   type Bits_16x4 is array (0 .. 3)  of Bits_4 with Pack, Size => 16;

   function U16_To_B1
     is new Ada.Unchecked_Conversion (Interfaces.Unsigned_16, Bits_16x1);
   function B1_To_U16
     is new Ada.Unchecked_Conversion (Bits_16x1, Interfaces.Unsigned_16);
   function U16_To_B2
     is new Ada.Unchecked_Conversion (Interfaces.Unsigned_16, Bits_16x2);
   function B2_To_U16
     is new Ada.Unchecked_Conversion (Bits_16x2, Interfaces.Unsigned_16);
   function U16_To_B4
     is new Ada.Unchecked_Conversion (Interfaces.Unsigned_16, Bits_16x4);
   function B4_To_U16
     is new Ada.Unchecked_Conversion (Bits_16x4, Interfaces.Unsigned_16);

   type Bits_32x1 is array (0 .. 31) of Bits_1 with Pack, Size => 32;
   type Bits_32x2 is array (0 .. 15) of Bits_2 with Pack, Size => 32;
   type Bits_32x4 is array (0 .. 7)  of Bits_4 with Pack, Size => 32;

   function U32_To_B1
     is new Ada.Unchecked_Conversion (Interfaces.Unsigned_32, Bits_32x1);
   function B1_To_U32
     is new Ada.Unchecked_Conversion (Bits_32x1, Interfaces.Unsigned_32);
   function U32_To_B2
     is new Ada.Unchecked_Conversion (Interfaces.Unsigned_32, Bits_32x2);
   function B2_To_U32
     is new Ada.Unchecked_Conversion (Bits_32x2, Interfaces.Unsigned_32);
   function U32_To_B4
     is new Ada.Unchecked_Conversion (Interfaces.Unsigned_32, Bits_32x4);
   function B4_To_U32
     is new Ada.Unchecked_Conversion (Bits_32x4, Interfaces.Unsigned_32);

end Registers;
