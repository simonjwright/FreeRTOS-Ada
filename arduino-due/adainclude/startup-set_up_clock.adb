--  Copyright (C) 2016 Free Software Foundation, Inc.
--
--  This file is part of the Cortex GNAT RTS project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

with ATSAM3X8E.EFC; use ATSAM3X8E.EFC;
with ATSAM3X8E.PMC; use ATSAM3X8E.PMC;

separate (Startup)
procedure Set_Up_Clock is

   --  See Programming Sequence, 11507 23-Mar-15, Chapter 28.12; also
   --  Enhanced Embedded Flash Mode Register, ibid 18.5.1; also, in
   --  xdk-asf-3.24.2/sam/utils/cmsis/sam3x/, system_init_flash() in
   --  source/templates/system_sam3x.c and macros in
   --  include/sam3x8e.h.

   use type ATSAM3X8E.Bit;
begin
   --  Set Flash wait states (FWS) to 4 in both banks
   declare
      FMR : FMR_Register;
   begin
      FMR             := EFC0_Periph.FMR;
      FMR.FWS         := 4;
      EFC0_Periph.FMR := FMR;
      FMR             := EFC1_Periph.FMR;
      FMR.FWS         := 4;
      EFC1_Periph.FMR := FMR;
   end;

   --  Select the Main Clock
   PMC_Periph.CKGR_MOR := (KEY      => 16#37#,
                           MOSCXTEN => 1,     -- main crystal oscillator enable
                           MOSCRCEN => 1,     -- main on-chip rc osc. enable
                           MOSCXTST => 8,     -- startup time
                           others   => <>);
   --  XXX shouldn't this give 4 MHz, not 12?

   --  Loop until stable
   loop
      exit when PMC_Periph.PMC_SR.MOSCXTS /= 0;
   end loop;

   --  Select the Main oscillator
   declare
      CKGR_MOR : CKGR_MOR_Register;
   begin
      CKGR_MOR            := PMC_Periph.CKGR_MOR;
      CKGR_MOR.KEY        := 16#37#;
      CKGR_MOR.MOSCSEL    := 1;
      PMC_Periph.CKGR_MOR := CKGR_MOR;
   end;

   --  Loop until selected
   loop
      exit when PMC_Periph.PMC_SR.MOSCSELS /= 0;
   end loop;

   --  Disable PLLA (?hardware bugfix?)
   PMC_Periph.CKGR_PLLAR := (ONE    => 1,
                             MULA   => 0,
                             DIVA   => 0,
                             others => <>);

   --  Set PLLA to multiply by 14, count 16#3f#, divide by 1 (=>
   --  enable PLL); Main Clock is 12 MHz, => 168 Mhz
   PMC_Periph.CKGR_PLLAR := (ONE       => 1,
                             MULA      => 13,   -- multipler - 1
                             PLLACOUNT => 16#3f#,
                             DIVA      => 1,
                             others    => <>);

   --  Loop until ready
   loop
      exit when PMC_Periph.PMC_SR.LOCKA /= 0;
   end loop;

   declare
      PMC_MCKR : PMC_MCKR_Register;
   begin
      --  Select Main Clock, PRES 0 (no prescaling)
      PMC_Periph.PMC_MCKR := (CSS    => Main_Clk,
                              others => <>);
      --  Loop until ready
      loop
         exit when PMC_Periph.PMC_SR.MCKRDY /= 0;
      end loop;

      --  Set PRES 8
      PMC_MCKR            := PMC_Periph.PMC_MCKR;
      PMC_MCKR.PRES       := Clk_8;
      PMC_Periph.PMC_MCKR := PMC_MCKR;
      --  Loop until ready
      loop
         exit when PMC_Periph.PMC_SR.MCKRDY /= 0;
      end loop;

      --  Select PLLA with PRES 1 (=> prescale by 2); other way round from
      --  Main_Clock above, as recommended
      --  Set PRES
      PMC_MCKR            := PMC_Periph.PMC_MCKR;
      PMC_MCKR.PRES       := Clk_2;
      PMC_Periph.PMC_MCKR := PMC_MCKR;
      --  Loop until ready
      loop
         exit when PMC_Periph.PMC_SR.MCKRDY /= 0;
      end loop;

      --  Set CSS
      PMC_MCKR            := PMC_Periph.PMC_MCKR;
      PMC_MCKR.CSS        := Plla_Clk;
      PMC_Periph.PMC_MCKR := PMC_MCKR;
      --  Loop until ready
      loop
         exit when PMC_Periph.PMC_SR.MCKRDY /= 0;
      end loop;
   end;
end Set_Up_Clock;
