--  System Timer, 11057 23-Mar-15, Chapter 10.22

with System;

package Registers.Cortex.SysTick with Preelaborate is

   type SysTick_T is record
      CTRL  : Interfaces.Unsigned_32;
      LOAD  : Interfaces.Unsigned_32;
      VAL   : Interfaces.Unsigned_32;
      CALIB : Interfaces.Unsigned_32;
   end record
   with Convention => Ada, Volatile, Size => 8 * 16;

   for SysTick_T use record
      CTRL  at 16#0000# range 0 .. 31;
      LOAD  at 16#0004# range 0 .. 31;
      VAL   at 16#0008# range 0 .. 31;
      CALIB at 16#000C# range 0 .. 31;
   end record;

   SysTick : SysTick_T
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#E000E010#);

end Registers.Cortex.SysTick;
