--  Parallel Input/Output Controller, 11057 23-Mar-15, Chapter 31

with System;

package Registers.ATSAM3X8.PIO with Preelaborate is

   type PIO is record
      PER    : aliased Bits_32x1;
      PDR    : aliased Bits_32x1;
      PSR    : aliased Bits_32x1;

      OER    : aliased Bits_32x1;
      ODR    : aliased Bits_32x1;
      OSR    : aliased Bits_32x1;

      IFER   : aliased Bits_32x1;
      IFDR   : aliased Bits_32x1;
      IFSR   : aliased Bits_32x1;

      SODR   : aliased Bits_32x1;
      CODR   : aliased Bits_32x1;
      ODSR   : aliased Bits_32x1;
      PDSR   : aliased Bits_32x1;
      IER    : aliased Bits_32x1;
      IDR    : aliased Bits_32x1;
      IMR    : aliased Bits_32x1;
      ISR    : aliased Bits_32x1;
      MDER   : aliased Bits_32x1;
      MDDR   : aliased Bits_32x1;
      MDSR   : aliased Bits_32x1;

      PUDR   : aliased Bits_32x1;
      PUER   : aliased Bits_32x1;
      PUSR   : aliased Bits_32x1;

      ABSR   : aliased Bits_32x1;

      SCIFSR : aliased Bits_32x1;
      DIFSR  : aliased Bits_32x1;
      IFDGSR : aliased Bits_32x1;
      SCDR   : aliased Interfaces.Unsigned_32;
      OWER   : aliased Bits_32x1;
      OWDR   : aliased Bits_32x1;
      OWSR   : aliased Bits_32x1;

      AIMER  : aliased Bits_32x1;
      AIMDR  : aliased Bits_32x1;
      AIMMR  : aliased Bits_32x1;

      ESR    : aliased Bits_32x1;
      LSR    : aliased Bits_32x1;
      ELSR   : aliased Bits_32x1;

      FELLSR : aliased Bits_32x1;
      REHLSR : aliased Bits_32x1;
      FRLHSR : aliased Bits_32x1;

      LOCKSR : aliased Bits_32x1;
      WPMR   : aliased Bits_32x1;
      WPSR   : aliased Bits_32x1;
   end record
   with
     Convention => Ada,
     Volatile,
     Size => 8 * (16#E8# + 4);

   for PIO use record
      PER    at 16#00# range 0 .. 31;
      PDR    at 16#04# range 0 .. 31;
      PSR    at 16#08# range 0 .. 31;
      OER    at 16#10# range 0 .. 31;
      ODR    at 16#14# range 0 .. 31;
      OSR    at 16#18# range 0 .. 31;
      IFER   at 16#20# range 0 .. 31;
      IFDR   at 16#24# range 0 .. 31;
      IFSR   at 16#28# range 0 .. 31;
      SODR   at 16#30# range 0 .. 31;
      CODR   at 16#34# range 0 .. 31;
      ODSR   at 16#38# range 0 .. 31;
      PDSR   at 16#3c# range 0 .. 31;
      IER    at 16#40# range 0 .. 31;
      IDR    at 16#44# range 0 .. 31;
      IMR    at 16#48# range 0 .. 31;
      ISR    at 16#4c# range 0 .. 31;
      MDER   at 16#50# range 0 .. 31;
      MDDR   at 16#54# range 0 .. 31;
      MDSR   at 16#58# range 0 .. 31;
      PUDR   at 16#60# range 0 .. 31;
      PUER   at 16#64# range 0 .. 31;
      PUSR   at 16#68# range 0 .. 31;
      ABSR   at 16#70# range 0 .. 31;
      SCIFSR at 16#80# range 0 .. 31;
      DIFSR  at 16#84# range 0 .. 31;
      IFDGSR at 16#88# range 0 .. 31;
      SCDR   at 16#8c# range 0 .. 31;
      OWER   at 16#a0# range 0 .. 31;
      OWDR   at 16#a4# range 0 .. 31;
      OWSR   at 16#a8# range 0 .. 31;
      AIMER  at 16#b0# range 0 .. 31;
      AIMDR  at 16#b4# range 0 .. 31;
      AIMMR  at 16#b8# range 0 .. 31;
      ESR    at 16#c0# range 0 .. 31;
      LSR    at 16#c4# range 0 .. 31;
      ELSR   at 16#c8# range 0 .. 31;
      FELLSR at 16#d0# range 0 .. 31;
      REHLSR at 16#d4# range 0 .. 31;
      FRLHSR at 16#d8# range 0 .. 31;
      LOCKSR at 16#e0# range 0 .. 31;
      WPMR   at 16#e4# range 0 .. 31;
      WPSR   at 16#e8# range 0 .. 31;
   end record;

   PIOA : aliased PIO
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E0E00#);
   PIOB : aliased PIO
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E1000#);
   PIOC : aliased PIO
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E1200#);
   PIOD : aliased PIO
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E1400#);
   PIOE : aliased PIO
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E1600#);
   PIOF : aliased PIO
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E1800#);

end Registers.ATSAM3X8.PIO;
