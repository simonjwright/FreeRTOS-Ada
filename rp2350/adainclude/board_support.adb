with RP2350.CLOCKS;  use RP2350.CLOCKS;
with RP2350.PLL_SYS;
--  with RP2350.PLL_USB;
with RP2350.XOSC;
with RP2350.Reset;

use RP2350;

package body Board_Support is

   procedure Initial_Resets;
   procedure Set_Up_Crystal_Oscillator;
   procedure Set_Up_Reference_Clock;
   procedure Set_Up_System_PLL;
   --  procedure Set_Up_USB_PLL;
   procedure Set_Up_System_Clock;
   --  procedure Set_Up_USB_Clock;

   procedure Initial_Resets is
      --  From pico-svd runtime_init.c: Reset all peripherals to put
      --  the system into a known state, except for
      --
      --  - QSPI pads and the XIP IO bank, as this is fatal if running
      --  from flash
      --
      --  - and the PLLs, as this is fatal if clock muxing has not
      --  been reset on this boot
      --
      --  - and USB, syscfg, as this disturbs USB-to-SWD on core 1

      use RP2350.Reset;

      Initial_Resets : constant array (Subsystem) of Boolean
        := (IO_QSPI | JTAG | PADS_QSPI | Reset.PLL_USB | USBCTRL |
              Reset.PLL_SYS => False,
            others => True);

      --  Remove reset from peripherals which are clocked only by
      --  clk_sys and clk_ref. Other peripherals stay in reset until
      --  we've configured clocks.

      --  Maybe these need some clocks working??
      --  Initial_Releases : constant array (Subsystem) of Boolean
      --    := (HSTX | ADC | SPI0 | SPI1 | UART0 | UART1 | USBCTRL => True,
      --        others => False);
   begin
      for S in Initial_Resets'Range loop
         if Initial_Resets (S) then
            Reset_Subsystem (S);
         end if;
      end loop;

      --  for S in Initial_Releases'Range loop
      --     if Initial_Releases (S) then
      --        Release_Subsystem (S);
      --     end if;
      --  end loop;
   end Initial_Resets;

   procedure Set_Up_Crystal_Oscillator is
      use RP2350.XOSC;
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
      use RP2350.PLL_SYS;
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
   --     use RP2350.PLL_USB;
   --  begin
   --     RP2350.Reset.Release_Subsystem (RP2350.Reset.PLL_USB);

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
   --     --  Set up the post dividers.
   --     PLL_USB_Periph.PRIM      := (POSTDIV1  => 5,
   --                                  POSTDIV2  => 5,
   --                                  others    => <>);

   --     --  Turn on the PLL (the default settings, 1, are to have power
   --     --  off).  The RP2350 hardware provides an alias for this register
   --     --  (and others) for which writing a 1 bit clears that bit in the
   --     --  register.
   --     PLL_USB_Periph.PWR       := (PD     => 0,
   --                                  VCOPD  => 0,
   --                                  POSTDIVPD => 0,
   --                                  others => <>);

   --     --  Wait for the PLL to lock.
   --     loop
   --        exit when PLL_USB_Periph.CS.LOCK = 1;
   --     end loop;

   --  end Set_Up_USB_PLL;

   procedure Set_Up_System_Clock is
   begin
      --  The default for SRC is clk_ref, but Chalandi Amine uses the
      --  alternative clksrc_clk_sys_aux; so, SRC is derived from
      --  AUXSRC, and AUXSRC is derived from PLL_SYS.
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

   --  procedure Set_Up_USB_Clock is
   --  begin
   --     CLOCKS_Periph.CLK_USB_CTRL := (AUXSRC => clksrc_pll_usb,
   --                                    others => <>);
   --     CLOCKS_Periph.CLK_USB_DIV  := (INT    => 1,
   --                                    others => <>);
   --  end Set_Up_USB_Clock;

   procedure Initialize is
   begin

      Initial_Resets;

      Set_Up_Crystal_Oscillator;

      Set_Up_Reference_Clock;

      Set_Up_System_PLL;
      --  Set_Up_USB_PLL;

      Set_Up_System_Clock;
      --  Set_Up_USB_Clock;

   end Initialize;

end Board_Support;
