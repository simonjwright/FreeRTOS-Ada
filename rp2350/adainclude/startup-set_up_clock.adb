--  Copyright (C) 2024 Free Software Foundation, Inc.
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

--  This is the RP2350 (Risc-V) version.

with RP2350.CLOCKS;
with RP2350.PLL_SYS;
with RP2350.PLL_USB;
with RP2350.XOSC;
with RP2350.Reset;

use RP2350;
use RP2350.CLOCKS;
use RP2350.PLL_SYS;
use RP2350.PLL_USB;
use RP2350.XOSC;

separate (Startup)
procedure Set_Up_Clock is

   procedure Set_Up_Crystal_Oscillator;
   procedure Set_Up_Reference_Clock;
   procedure Set_Up_System_PLL;
   --  procedure Set_Up_USB_PLL;
   procedure Set_Up_System_Clock;

   procedure Set_Up_Crystal_Oscillator is
   begin
      XOSC_Periph.STARTUP := (DELAY_k => 16#c4#, --  see SVD
                              X4      => 0,
                              others  => <>);
      XOSC_Periph.CTRL := (ENABLE     => ENABLE,
                           FREQ_RANGE => Val_10_30MHZ,
                           others     => <>);
      loop
         exit when XOSC_Periph.STATUS.STABLE = 1;
      end loop;
   end Set_Up_Crystal_Oscillator;

   procedure Set_Up_Reference_Clock is
   begin
      --  Set the reference clock to use the crystal clock as source.
      CLOCKS_Periph.CLK_REF_CTRL := (SRC    => xosc_clksrc,
                                     AUXSRC => clksrc_pll_usb,
                                     others => <>);
      CLOCKS_Periph.CLK_REF_DIV  := (INT    => 1,
                                     others => <>);
      loop
         exit when CLOCKS_Periph.CLK_REF_SELECTED.CLK_REF_SELECTED = 2#0100#;
         --  This is bit-encoded corresponding to the numeric value of
         --  the selected source (xosc_clksrc = 2).
      end loop;
   end Set_Up_Reference_Clock;

   procedure Set_Up_System_PLL is
   begin
      RP2350.Reset.Release_Subsystem (RP2350.Reset.PLL_SYS);

      --  --  Turn off the power to the PLL.
      PLL_SYS_Periph.PWR := (PD        => 1,
                             VCOPD     => 1,
                             POSTDIVPD => 1,
                             others    => <>);

      --  These PLL settings for PLL_SYS are as calculated by the SDK's
      --  vcocalc.py, and agree with TDS 8.6.4:
      --  Requested: 150.0 MHz
      --  Achieved:  150.0 MHz
      --  REFDIV:    1
      --  FBDIV:     125 (VCO = 1500.0 MHz)
      --  PD1:       5
      --  PD2:       2

      --  Program the reference clock divider and the feedback divider.
      PLL_SYS_Periph.CS        := (REFDIV    => 1,
                                   others    => <>);
      PLL_SYS_Periph.FBDIV_INT := (FBDIV_INT => 125,
                                   others    => <>);
      --  Set up the post dividers. TDS says (?) do this after
      --  achieving lock ...
      PLL_SYS_Periph.PRIM      := (POSTDIV1  => 5,
                                   POSTDIV2  => 2,
                                   others    => <>);

      --  Turn on the PLL (the default settings, 1, are to have power
      --  off).  The RP2350 hardware provides an alias for this register
      --  (and others) for which writing a 1 bit clears that bit in the
      --  register.
      PLL_SYS_Periph.PWR := (PD        => 0,
                             VCOPD     => 0,
                             POSTDIVPD => 0,
                             others    => <>);

      --  Wait for the PLL to lock.
      loop
         exit when PLL_SYS_Periph.CS.LOCK = 1;
      end loop;

   end Set_Up_System_PLL;

   --  procedure Set_Up_USB_PLL is
   --  begin
   --     RP2350.Reset.Reset_Subsystem (RP2350.Reset.PLL_USB);

   --     --  Turn off the power to the PLL.
   --     PLL_USB_Periph.PWR := (PD        => 1,
   --                            VCOPD     => 1,
   --                            POSTDIVPD => 1,
   --                            others    => <>);

   --     --  The PLL settings for PLL_USB as calculated by the SDK's
   --     --  vcocalc.py disagree with TDS 8.6.4. These settings are from
   --     --  8.6.4.
   --     --  Requested: 48.0 MHz
   --     --  Achieved:  48.0 MHz
   --     --  REFDIV:    1
   --     --  FBDIV:     100 (VCO = 1200.0 MHz)
   --     --  PD1:       5
   --     --  PD2:       5

   --     --  Program the reference clock divider and the feedback divider.
   --     PLL_USB_Periph.CS        := (REFDIV    => 1,
   --                                  others    => <>);
   --     PLL_USB_Periph.FBDIV_INT := (FBDIV_INT => 100,
   --                                  others    => <>);

   --     --  Turn on the PLL (the default settings, 1, are to have power
   --     --  off).  The RP2350 hardware provides an alias for this register
   --     --  (and others) for which writing a 1 bit clears that bit in the
   --     --  register.
   --     PLL_USB_Periph.PWR       := (PD     => 0,
   --                                  VCOPD  => 0,
   --                                  others => <>);

   --     --  Wait for the PLL to lock.
   --     loop
   --        exit when PLL_USB_Periph.CS.LOCK = 1;
   --     end loop;

   --     --  Set up the post dividers.
   --     PLL_USB_Periph.PRIM      := (POSTDIV1  => 5,
   --                                  POSTDIV2  => 5,
   --                                  others    => <>);

   --     --  Turn on the post divider (retaining the cleared state set above).
   --     PLL_USB_Periph.PWR := (PD        => 0,
   --                            VCOPD     => 0,
   --                            POSTDIVPD => 0,
   --                            others    => <>);
   --  end Set_Up_USB_PLL;

   procedure Set_Up_System_Clock is
   begin
      --  The default for SRC is clk_ref, but Chalandi Amine uses the
      --  alternative clksrc_clk_sys_aux.
      CLOCKS_Periph.CLK_SYS_CTRL := (SRC    => clksrc_clk_sys_aux,
                                     AUXSRC => clksrc_pll_sys,
                                     others => <>);
      CLOCKS_Periph.CLK_SYS_DIV  := (INT    => 1,
                                     others => <>);
      loop
         exit when CLOCKS_Periph.CLK_SYS_SELECTED.CLK_SYS_SELECTED = 2#0010#;
         --  This is bit-encoded corresponding to the numeric value of
         --  the selected source (clksrc_clk_sys_aux = 1).
      end loop;
   end Set_Up_System_Clock;

begin

   --  We can assume that machine interrupts are disabled at this point.

   --  First, adjust clock rate. The default clock rate depends on how
   --  the chip was treated before booting; for example, setting the
   --  default processor architecture to RISC-V caused the clock rate
   --  to drop from the advertised 150 MHz to an estimated 50 MHz,
   --  while running from flash caused a further 20-fold drop.

   Set_Up_Crystal_Oscillator;

   Set_Up_Reference_Clock;

   Set_Up_System_PLL;
   --  Set_Up_USB_PLL;

   Set_Up_System_Clock;

   --  Next, set up MTIME_CTRL. Refer Datasheet Table 79.
   MTIME_CTRL :
   declare
      type MTIME_CTRL_Register is record
         EN             : Bit    := 1;
         FULLSPEED      : Bit    := 0;
         DBGPAUSE_CORE0 : Bit    := 1;
         DBGPAUSE_CORE1 : Bit    := 1;
         Reserved_1     : UInt28 := 0;
      end record
      with Object_Size => 32, Bit_Order => System.Low_Order_First;

      for MTIME_CTRL_Register use record
         EN             at 0 range 0 .. 0;
         FULLSPEED      at 0 range 1 .. 1;
         DBGPAUSE_CORE0 at 0 range 2 .. 2;
         DBGPAUSE_CORE1 at 0 range 3 .. 3;
         Reserved_1     at 0 range 4 .. 31;
      end record;

      type SIO_Subsystem_Description is record
         MTIME_CTRL : aliased MTIME_CTRL_Register
           with Volatile_Full_Access;
      end record;

      for SIO_Subsystem_Description use record
         MTIME_CTRL at 16#1a4# range 0 .. 31;
      end record;

      SIO_Subsystem_Base : constant System.Address
        := System'To_Address (16#d000_0000#);

      SIO_Subsystem : aliased SIO_Subsystem_Description
        with Import, Address => SIO_Subsystem_Base;
   begin
      SIO_Subsystem.MTIME_CTRL := (EN        => 1,
                                   FULLSPEED => 1,
                                   others    => <>);
   end MTIME_CTRL;

   System.Machine_Code.Asm
     ("fence.i",
      Volatile => True);

end Set_Up_Clock;
