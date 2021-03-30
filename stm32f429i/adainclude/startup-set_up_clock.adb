--  Copyright (C) 2016-2021 Free Software Foundation, Inc.
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

with STM32F429x.FLASH; use STM32F429x.FLASH;
with STM32F429x.PWR;   use STM32F429x.PWR;
with STM32F429x.RCC;   use STM32F429x.RCC;

separate (Startup)
procedure Set_Up_Clock is
   use type STM32F429x.Bit;
begin

   --  Enable PWR clock
   RCC_Periph.APB1ENR.PWREN := 1;

   --  Set highest voltage for maximum frequency (168 MHz, or 180 MHz
   --  w/ overdrive).
   --  DocID024030 Rev 4 Table 17 Row V12.
   --  Postpone wait-until-ready until PLL is in use.
   PWR_Periph.CR.VOS := 3;

   --  Setup internal high-speed clock and wait for stabilisation.
   RCC_Periph.CR.HSION := 1;
   loop
      exit when RCC_Periph.CR.HSIRDY = 1;
   end loop;

   --  Setup external high-speed clock and wait for stabilisation.
   RCC_Periph.CR.HSEON := 1;
   --  Don't set HSEBYP (i.e. don't bypass external oscillator)
   loop
      exit when RCC_Periph.CR.HSERDY = 1;
   end loop;

   --  Setup internal low-speed clock and wait for stabilisation.
   RCC_Periph.CSR.LSION := 1;
   loop
      exit when RCC_Periph.CSR.LSIRDY = 1;
   end loop;

   --  Activate the PLL at 168 MHz.
   --  See RM0090 5.1.4 for how to enter overdrive mode and enable
   --  SYSCLK of 180 MHz.
   declare
      PLLCFGR : constant STM32F429x.RCC.PLLCFGR_Register
        := (PLLM   => 8,
            PLLN   => 336, -- no overdrive: 168 MHz
            PLLP   => 0,   -- *2
            PLLSRC => 1,   -- HSE
            PLLQ   => 7,
            others => <>);
   begin
      RCC_Periph.PLLCFGR := PLLCFGR;
   end;
   RCC_Periph.CR.PLLON := 1;
   loop
      exit when RCC_Periph.CR.PLLRDY = 1;
   end loop;

   --  Wait until voltage supply scaling is ready (must be after PLL
   --  is ready).
   loop
      exit when PWR_Periph.CSR.VOSRDY = 1;
   end loop;

   --  Set flash latency to 5 wait states _before_ increasing the clock.
   declare
      ACR : constant STM32F429x.FLASH.ACR_Register
        := (LATENCY => 5,
            PRFTEN  => 1,
            ICEN    => 1,
            DCEN    => 1,
            others  => <>);
      use type STM32F429x.UInt3;
   begin
      FLASH_Periph.ACR := ACR;

      --  Not sure we need to check this.
      loop
         exit when FLASH_Periph.ACR.LATENCY = 5;
      end loop;
   end;

   --  Configure clocks.
   declare
      CFGR : constant STM32F429x.RCC.CFGR_Register
        := (SW      => 2,            -- clock source is PLL
            HPRE    => 0,            -- AHB prescale = 1
            PPRE    => (As_Array => True,
                        Arr => (5,   -- APB lo speed prescale (PPRE1) = 4
                                4)), -- APB hi speed prescale (PPRE2) = 2
            MCO1    => 0,            -- MCU clock output 1 HSI selected
            MCO1PRE => 0,            -- MCU clock output 1 prescale = 1
            MCO2    => 0,            -- MCU clock output 2 SYSCLK selected
            MCO2PRE => 7,            -- MCU clock output 2 prescale = 5
            others  => <>);
      use type STM32F429x.UInt2;
   begin
      RCC_Periph.CFGR := CFGR;

      --  Wait until PLL running
      loop
         exit when RCC_Periph.CFGR.SWS = 2;
      end loop;
   end;

end Set_Up_Clock;
