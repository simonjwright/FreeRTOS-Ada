with Interfaces;

separate (Startup)
procedure Set_Up_Clock is

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

   use type Interfaces.Unsigned_32;
begin

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
     16#00000000#;    -- MULA = 0, disable

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

   --  --  Select PLLA as clock source, prescale by 2, no division
   --  PMC_MCKR :=
   --    16#00000010# or  -- PRES
   --    16#00000002#;    -- PLLA_CLK

   --  Select Main Clock, PRES 0 (no prescaling)
   PMC_MCKR := 16#00000001#;

   --  Loop until ready - check MCKRDY, bit 3
   loop
      exit when (PMC_SR and 16#00000008#) /= 0;
   end loop;

   --  --  Select PRES to 1 (=> prescale by 2), still with main clock
   --  PMC_MCKR := 16#00000011#;

   --  --  Loop until ready - check MCKRDY, bit 3
   --  loop
   --     exit when (PMC_SR and 16#00000008#) /= 0;
   --  end loop;

   --  --  Select PLLA, still with PRES to 1
   --  PMC_MCKR := 16#00000012#;

   --  --  Loop until ready - check MCKRDY, bit 3
   --  loop
   --     exit when (PMC_SR and 16#00000008#) /= 0;
   --  end loop;
end Set_Up_Clock;
