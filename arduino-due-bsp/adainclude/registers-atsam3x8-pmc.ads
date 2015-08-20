--  Power Management Controller, 11057 23-Mar-15, Chapter 28

with System;

package Registers.ATSAM3X8.PMC with Preelaborate is

   type PMC_T is record
      SCER  : aliased Bits_32x1;
      SCDR  : aliased Bits_32x1;
      SCSR  : aliased Bits_32x1;
      PCER0 : aliased Bits_32x1;
      PCDR0 : aliased Bits_32x1;
      PCSR0 : aliased Bits_32x1;
      UCKR  : aliased Bits_32x1; -- CKGR_UCKR
      MOR   : aliased Bits_32x1; -- CKGR_MOR
      MCFR  : aliased Bits_32x1; -- CKGR_MCFR
      PLLAR : aliased Bits_32x1; -- CKGR_PLLAR
      MCKR  : aliased Bits_32x1;
      USB   : aliased Bits_32x1;
      PCK0  : aliased Bits_32x1;
      PCK1  : aliased Bits_32x1;
      PCK2  : aliased Bits_32x1;
      IER   : aliased Bits_32x1;
      IDR   : aliased Bits_32x1;
      SR    : aliased Bits_32x1;
      IMR   : aliased Bits_32x1;
      FSMR  : aliased Bits_32x1;
      FSPR  : aliased Bits_32x1;
      FOCR  : aliased Bits_32x1;
      WPMR  : aliased Bits_32x1;
      WPSR  : aliased Bits_32x1;
      PCER1 : aliased Bits_32x1;
      PCDR1 : aliased Bits_32x1;
      PCSR1 : aliased Bits_32x1;
      PCR   : aliased Bits_32x1;
   end record
   with Convention => Ada, Volatile, Size => 8 * (16#010C# + 4);

   for PMC_T use record
      SCER  at 16#0000# range 0 .. 31;
      SCDR  at 16#0004# range 0 .. 31;
      SCSR  at 16#0008# range 0 .. 31;
      PCER0 at 16#0010# range 0 .. 31;
      PCDR0 at 16#0014# range 0 .. 31;
      PCSR0 at 16#0018# range 0 .. 31;
      UCKR  at 16#001C# range 0 .. 31; -- CKGR_UCKR
      MOR   at 16#0020# range 0 .. 31; -- CKGR_MOR
      MCFR  at 16#0024# range 0 .. 31; -- CKGR_MCFR
      PLLAR at 16#0028# range 0 .. 31; -- CKGR_PLLAR
      MCKR  at 16#0030# range 0 .. 31;
      USB   at 16#0038# range 0 .. 31;
      PCK0  at 16#0040# range 0 .. 31;
      PCK1  at 16#0044# range 0 .. 31;
      PCK2  at 16#0048# range 0 .. 31;
      IER   at 16#0060# range 0 .. 31;
      IDR   at 16#0064# range 0 .. 31;
      SR    at 16#0068# range 0 .. 31;
      IMR   at 16#006C# range 0 .. 31;
      FSMR  at 16#0070# range 0 .. 31;
      FSPR  at 16#0074# range 0 .. 31;
      FOCR  at 16#0078# range 0 .. 31;
      WPMR  at 16#00E4# range 0 .. 31;
      WPSR  at 16#00E8# range 0 .. 31;
      PCER1 at 16#0100# range 0 .. 31;
      PCDR1 at 16#0104# range 0 .. 31;
      PCSR1 at 16#0108# range 0 .. 31;
      PCR   at 16#010C# range 0 .. 31;
   end record;

   PMC : PMC_T
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#400E0600#);

end Registers.ATSAM3X8.PMC;
