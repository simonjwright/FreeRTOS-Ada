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

with STM32F429x.FLASH; use STM32F429x.FLASH;
with STM32F429x.PWR;   use STM32F429x.PWR;
with STM32F429x.RCC;   use STM32F429x.RCC;

separate (Startup)
procedure Set_Up_Clock is
   use type STM32F429x.Bit;
begin

   --  Enable PWR clock
   declare
      APB1ENR : APB1ENR_Register;
   begin
      APB1ENR := RCC_Periph.APB1ENR;
      APB1ENR.PWREN := 1;
      RCC_Periph.APB1ENR := APB1ENR;
   end;

   --  Set highest voltage for maximum frequency (168 MHz, or 180 MHz
   --  w/ overdrive).
   --  DocID024030 Rev 4 Table 17 Row V12.
   --  Postpone wait-until-ready until PLL is in use.
   declare
      CR  : STM32F429x.PWR.CR_Register;
   begin
      CR := PWR_Periph.CR;
      CR.VOS := 3;
      PWR_Periph.CR := CR;
   end;

   --  Setup internal high-speed clock and wait for stabilisation.
   declare
      CR : STM32F429x.RCC.CR_Register;
   begin
      CR := RCC_Periph.CR;
      CR.HSION := 1;
      RCC_Periph.CR := CR;
      loop
         CR := RCC_Periph.CR;
         exit when CR.HSIRDY = 1;
      end loop;
   end;

   --  Setup external high-speed clock and wait for stabilisation.
   declare
      CR : STM32F429x.RCC.CR_Register;
   begin
      CR := RCC_Periph.CR;
      CR.HSEON := 1;
      --  Don't set HSEBYP (i.e. don't bypass external oscillator)
      RCC_Periph.CR := CR;
      loop
         CR := RCC_Periph.CR;
         exit when CR.HSERDY = 1;
      end loop;
   end;

   --  Setup internal low-speed clock and wait for stabilisation.
   declare
      CSR : STM32F429x.RCC.CSR_Register;
   begin
      CSR := RCC_Periph.CSR;
      CSR.LSION := 1;
      RCC_Periph.CSR := CSR;
      loop
         CSR := RCC_Periph.CSR;
         exit when CSR.LSIRDY = 1;
      end loop;
   end;

   --  Activate the PLL at 168 MHz.
   --  See RM0090 5.1.4 for how to enter overdrive mode and enable
   --  SYSCLK of 180 MHz.
   declare
      CR : STM32F429x.RCC.CR_Register;
   begin
      RCC_Periph.PLLCFGR := (PLLM   => 8,
                             PLLN   => 336, -- no overdrive: 168 MHz
                             PLLP   => 0,   -- *2
                             PLLSRC => 1,   -- HSE
                             PLLQ   => 7,
                             others => <>);
      CR := RCC_Periph.CR;
      CR.PLLON := 1;
      RCC_Periph.CR := CR;
      loop
         CR := RCC_Periph.CR;
         exit when CR.PLLRDY = 1;
      end loop;
   end;

   --  Wait until voltage supply scaling is ready (must be after PLL
   --  is ready).
   declare
      CSR : STM32F429x.PWR.CSR_Register;
   begin
      loop
         CSR := PWR_Periph.CSR;
         exit when CSR.VOSRDY = 1;
      end loop;
   end;

   --  Set flash latency to 5 wait states _before_ increasing the clock.
   declare
      ACR : STM32F429x.FLASH.ACR_Register;
      use type STM32F429x.UInt3;
   begin
      FLASH_Periph.ACR := (LATENCY => 5,
                           PRFTEN  => 1,
                           ICEN    => 1,
                           DCEN    => 1,
                           others  => <>);
      --  Not sure we need to check this.
      loop
         ACR := FLASH_Periph.ACR;
         exit when ACR.LATENCY = 5;
      end loop;
   end;

   --  Configure clocks.
   RCC_Periph.CFGR :=
     (SW      => 2,            -- clock source is PLL
      HPRE    => 0,            -- AHB prescale = 1
      PPRE    => (As_Array => True,
                  Arr => (5,   -- APB lo speed prescale (PPRE1) = 4
                          4)), -- APB hi speed prescale (PPRE2) = 2
      MCO1    => 0,            -- MCU clock output 1 HSI selected
      MCO1PRE => 0,            -- MCU clock output 1 prescale = 1
      MCO2    => 0,            -- MCU clock output 2 SYSCLK selected
      MCO2PRE => 7,            -- MCU clock output 2 prescale = 5
      others  => <>);
   declare
      CFGR : STM32F429x.RCC.CFGR_Register;
      use type STM32F429x.UInt2;
   begin
      loop
         CFGR := RCC_Periph.CFGR;
         exit when CFGR.SWS = 2; -- PLL running
      end loop;
   end;

end Set_Up_Clock;
