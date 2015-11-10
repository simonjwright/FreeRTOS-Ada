with Interfaces;

separate (Startup)
procedure Set_Up_Clock is

   --  See Programming Sequence, 11507 23-Mar-15, Chapter 28.12; also
   --  Enhanced Embedded Flash Mode Register, ibid 18.5.1; also, in
   --  xdk-asf-3.24.2/sam/utils/cmsis/sam3x/, system_init_flash() in
   --  source/templates/system_sam3x.c and macros in
   --  include/sam3x8e.h.

   EEFC_FMR0 : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0A00#);

   EEFC_FMR1 : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0C00#);

   CKGR_MOR : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0620#);

   CKGR_MCFR : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0624#);

   CKGR_PLLAR : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0628#);

   PMC_SR : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0668#);

   PMC_MCKR : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E0630#);

   FMR : Interfaces.Unsigned_32;
   MCKR : Interfaces.Unsigned_32;

   use type Interfaces.Unsigned_32;
begin
   --  Set Flash wait states (FWS) to 4 in both banks
   FMR := EEFC_FMR0 and (not 16#00000F00#);
   EEFC_FMR0 := FMR or 16#00000400#;
   FMR := EEFC_FMR1 and (not 16#00000F00#);
   EEFC_FMR1 := FMR or 16#00000400#;

   --  Write CKGR_MOR to select the Main Clock
   CKGR_MOR :=
     16#00370000# or  -- KEY
     16#00000800# or  -- MOSCXTST
     16#00000008# or  -- MOSCRCEN
     16#00000001#;    -- MOSCXTEN

   --  Loop until stable - check MOSCXTS, bit 0
   loop
      exit when (PMC_SR and 16#00000001#) /= 0;
   end loop;

   --  Select the Main oscillator
   CKGR_MOR := CKGR_MOR or
     16#00370000# or  -- KEY
     16#01000000#;    -- MOSCSEL

   --  Loop until selected - check MOSCSELS, bit 16, is 0 - or not???
   loop
      exit when (PMC_SR and 16#00010000#) /= 0;
   end loop;

   --  Disable PLLA (?hardware bugfix?)
   CKGR_PLLAR :=
     16#20000000# or  -- ONE
     16#00000000#;    -- MULA = 0, DIVA = 0, => disable

   --  Set PLLA to multiply by 14, count 16#3f#, divide by 1 (=>
   --  enable PLL); Main Clock is 12 MHz, => 168 Mhz
   CKGR_PLLAR :=
     16#20000000# or  -- ONE
     16#000D0000# or  -- MULA (multiplier - 1)
     16#00003F00# or  -- PLLACOUNT
     16#00000001#;    -- DIVA

   --  Loop until ready - check LOCKA, bit 1
   loop
      exit when (PMC_SR and 16#00000002#) /= 0;
   end loop;

   --  Select Main Clock, PRES 0 (no prescaling)
   --  Set CSS
   MCKR := PMC_MCKR and (not 16#0000000f#);
   PMC_MCKR := MCKR or 16#00000001#;
   --  Loop until ready - check MCKRDY, bit 3
   loop
      exit when (PMC_SR and 16#00000008#) /= 0;
   end loop;
   --  Set PRES
   MCKR := PMC_MCKR and (not 16#00000030#);
   PMC_MCKR := MCKR;
   --  Loop until ready - check MCKRDY, bit 3
   loop
      exit when (PMC_SR and 16#00000008#) /= 0;
   end loop;

   --  Select PLLA with PRES=1 (=> prescale by 2); other way round from
   --  Main_Clock above, as recommended
   --  Set PRES
   MCKR := PMC_MCKR and (not 16#00000030#);
   PMC_MCKR := MCKR or 16#00000010#;
   --  Loop until ready - check MCKRDY, bit 3
   loop
      exit when (PMC_SR and 16#00000008#) /= 0;
   end loop;
   --  Set CSS
   MCKR := PMC_MCKR and (not 16#0000000f#);
   PMC_MCKR := MCKR or 16#00000002#;
   --  Loop until ready - check MCKRDY, bit 3
   loop
      exit when (PMC_SR and 16#00000008#) /= 0;
   end loop;
end Set_Up_Clock;
