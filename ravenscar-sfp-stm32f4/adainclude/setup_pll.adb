------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2013, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

pragma Ada_2012; -- To work around pre-commit check?
pragma Restrictions (No_Elaboration_Code);

--  This initialization procedure mainly initializes the PLLs and
--  all derived clocks. For now it also initializes the first USART.
--  To be moved to s-textio, but needs clock info ???

with System.STM32F4; use System.STM32F4;

procedure Setup_Pll is

   subtype HSECLK_Range is Integer range   1_000_000 ..  26_000_000;
   subtype PLLIN_Range is Integer range      950_000 ..   2_000_000;
   subtype PLLVC0_Range is Integer range 192_000_000 .. 432_000_000;
   subtype PLLOUT_Range is Integer range  24_000_000 .. 168_000_000;
   subtype SYSCLK_Range is Integer range           1 .. 168_000_000;
   subtype HCLK_Range is Integer range             1 .. 168_000_000;
   subtype PCLK1_Range is Integer range            1 ..  42_000_000;
   subtype PCLK2_Range is Integer range            1 ..  84_000_000;
   subtype SPII2S_Range is Integer range           1 ..  37_500_000;
   pragma Unreferenced (SPII2S_Range);

   --  These internal low and high speed clocks are fixed. Do not modify.

   HSICLK : constant := 16_000_000;
   LSICLK : constant :=     32_000;
   pragma Unreferenced (LSICLK);

   --  The following external clock could be changed, but note that the PLL
   --  values have been calculated for a 168 MHz system clock from an external
   --  8 MHz HSE clock. The PLL values are used when Activate_PLL is True.

   HSECLK          : constant HSECLK_Range := 8_000_000; -- ext. clock is 8 MHz

   HSE_Enabled     : constant Boolean := True;  -- use high-speed ext. clock
   HSE_Bypass      : constant Boolean := False; -- don't bypass ext. resonator
   LSI_Enabled     : constant Boolean := True;  -- use low-speed internal clock

   Activate_PLL    : constant Boolean := True;
   Activate_PLLI2S : constant Boolean := False;

   pragma Assert ((if Activate_PLL then HSE_Enabled),
                  "PLL only supported with external clock");
   pragma Assert (not Activate_PLLI2S, "not yet implemented");

   -------------------------------
   -- Compute Clock Frequencies --
   -------------------------------

   PLLM_Value  : constant := 8;     -- divider in range 2 .. 63
   PLLN_Value  : constant := 336;   -- multiplier in range 192 .. 432
   PLLP_Value  : constant := 2;     -- divider may be 2, 4, 6 or 8
   PLLQ_Value  : constant := 7;     -- multiplier in range 2 .. 15

   PLLCLKIN    : constant PLLIN_Range  := HSECLK / PLLM_Value;
   PLLVC0      : constant PLLVC0_Range := PLLCLKIN * PLLN_Value;
   PLLCLKOUT   : constant PLLOUT_Range := PLLVC0 / PLLP_Value;

   PLLM     : constant Word := PLLM_Value;
   PLLN     : constant Word := PLLN_Value * 2**6;
   PLLP     : constant Word := (PLLP_Value / 2 - 1) * 2**16;
   PLLQ     : constant Word := PLLQ_Value * 2**24;

   HPRE     : constant Word := RCC_CFGR.HPRE_DIV1;
   PPRE1    : constant Word := RCC_CFGR.PPRE1_DIV4;
   PPRE2    : constant Word := RCC_CFGR.PPRE2_DIV2;

   SW       : constant Word :=
                (if Activate_PLL then RCC_CFGR.SW_PLL else RCC_CFGR.SW_HSI);

   SYSCLK   : constant SYSCLK_Range :=
                (if Activate_PLL then PLLCLKOUT else HSICLK);

   HCLK     : constant HCLK_Range :=
                (case HPRE is
                 when RCC_CFGR.HPRE_DIV1   => SYSCLK / 1,
                 when RCC_CFGR.HPRE_DIV2   => SYSCLK / 2,
                 when RCC_CFGR.HPRE_DIV4   => SYSCLK / 4,
                 when RCC_CFGR.HPRE_DIV8   => SYSCLK / 8,
                 when RCC_CFGR.HPRE_DIV16  => SYSCLK / 16,
                 when RCC_CFGR.HPRE_DIV64  => SYSCLK / 64,
                 when RCC_CFGR.HPRE_DIV128 => SYSCLK / 128,
                 when RCC_CFGR.HPRE_DIV256 => SYSCLK / 256,
                 when RCC_CFGR.HPRE_DIV512 => SYSCLK / 512,
                 when others => raise Program_Error);

   PCLK1    : constant PCLK1_Range :=
                (case PPRE1 is
                 when RCC_CFGR.PPRE1_DIV1  => HCLK / 1,
                 when RCC_CFGR.PPRE1_DIV2  => HCLK / 2,
                 when RCC_CFGR.PPRE1_DIV4  => HCLK / 4,
                 when RCC_CFGR.PPRE1_DIV8  => HCLK / 8,
                 when RCC_CFGR.PPRE1_DIV16 => HCLK / 16,
                 when others => raise Program_Error);
   pragma Unreferenced (PCLK1);

   PCLK2    : constant PCLK2_Range :=
                (case PPRE2 is
                 when RCC_CFGR.PPRE2_DIV1  => HCLK / 1,
                 when RCC_CFGR.PPRE2_DIV2  => HCLK / 2,
                 when RCC_CFGR.PPRE2_DIV4  => HCLK / 4,
                 when RCC_CFGR.PPRE2_DIV8  => HCLK / 8,
                 when RCC_CFGR.PPRE2_DIV16 => HCLK / 16,
                 when others => raise Program_Error);

   --  Local Subprograms

   function "and" (Left, Right : Word) return Boolean is
     ((Left and Right) /= 0);

   procedure Reset (Register : in out Word; Mask : Word);
   procedure Set (Register : in out Word; Mask : Word);

   procedure Initialize_USART1 (Baudrate : Positive);
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   -----------
   -- Reset --
   -----------

   procedure Reset (Register : in out Word; Mask : Word) is
   begin
      Register := Register and not Mask;
   end Reset;

   ---------
   -- Set --
   ---------

   procedure Set (Register : in out Word; Mask : Word) is
   begin
      Register := Register or Mask;
   end Set;

   -----------------------
   -- Initialize_Clocks --
   -----------------------

   procedure Initialize_Clocks is
   begin
      --  PWR clock enable
      --  Reset the power interface

      RCC.APB1ENR := RCC_APB1ENR_PWR;

      --  PWR initialization
      --  Select higher supply power for stable operation at max. freq.
      --  (See the Symbol V12 line in table 14 of the STM32F407xx datasheet,
      --  and table 15 p79). On the stm32f4 discovery board, VDD is 3V.

      PWR.CR := PWR_CR_VOS_HIGH;

      --  Wait until voltage supply scaling has completed

      loop
         exit when PWR.CSR and PWR_CSR_VOSRDY;
      end loop;

      --  Setup internal clock and wait for HSI stabilisation.
      --  The internal high speed clock is always enabled, because it is the
      --  fallback clock when the PLL fails.

      RCC.CR := RCC.CR or RCC_CR.HSION;

      loop
         exit when RCC.CR and RCC_CR.HSIRDY;
      end loop;

      --  Configure high-speed external clock, if enabled

      if HSE_Enabled then
         RCC.CR := RCC.CR or RCC_CR.HSEON
           or (if HSE_Bypass then RCC_CR.HSEBYP else 0);

         loop
            exit when RCC.CR and RCC_CR.HSERDY;
         end loop;
      end if;

      --  Configure low-speed internal clock if enabled

      if LSI_Enabled then
         RCC.CSR := RCC.CSR or RCC_CSR.LSION;

         loop
            exit when RCC.CSR and RCC_CSR.LSIRDY;
         end loop;
      end if;

      --  Activate PLL if enabled

      if Activate_PLL then
         RCC.PLLCFGR := PLLQ or PLLSRC_HSE or PLLP or PLLN or PLLM;
         Set (RCC.CR, RCC_CR.PLLON);

         loop
            exit when RCC.CR and RCC_CR.PLLRDY;
         end loop;
      end if;

      --  Configure flash
      --  Must be done before increasing the frequency, otherwise the CPU
      --  won't be able to fetch new instructions.

      FLASH.ACR := FLASH_ACR.LATENCY_5WS or FLASH_ACR.ICEN or FLASH_ACR.DCEN
        or FLASH_ACR.PRFTEN;

      --  Configure derived clocks

      RCC.CFGR :=
        --  AHB prescaler is 1, APB1 uses 4 and APB2 prescaler is 2
        HPRE or PPRE1 or PPRE2 or
        --  Configure MC01 pin to have the HSI (high speed internal clock)
        RCC_CFGR.MCO1PRE_DIV1 or RCC_CFGR.MCO1SEL_HSI or
        --  Configure MCO2 pin to have SYSCLK / 5
        RCC_CFGR.MCO2PRE_DIV5 or RCC_CFGR.MCO2SEL_SYSCLK or
        --  Select system clock source
        SW;

      if Activate_PLL then
         loop
            exit when (RCC.CFGR and (RCC_CFGR.SWS_HSE or RCC_CFGR.SWS_PLL))
              = RCC_CFGR.SWS_PLL;
         end loop;
      end if;

   end Initialize_Clocks;

   ------------------
   -- Reset_Clocks --
   ------------------

   procedure Reset_Clocks is
   begin
      --  Switch on high speed internal clock
      Set (RCC.CR, RCC_CR.HSION);

      --  Reset CFGR regiser
      RCC.CFGR := 0;

      --  Reset HSEON, CSSON and PLLON bits
      Reset (RCC.CR, RCC_CR.HSEON or RCC_CR.CSSON or RCC_CR.PLLON);

      --  Reset PLL configuration register
      RCC.PLLCFGR := 16#2400_3010#;

      --  Reset HSE bypass bit
      Reset (RCC.CR, RCC_CR.HSEBYP);

      --  Disable all interrupts
      RCC.CIR := 0;
   end Reset_Clocks;

   -----------------------
   -- Initialize_USART1 --
   -----------------------

   procedure Initialize_USART1 (Baudrate : Positive) is
      use GPIO;
      APB_Clock    : constant Positive := PCLK2;
      Int_Divider  : constant Positive := (25 * APB_Clock) / (4 * Baudrate);
      Frac_Divider : constant Natural := Int_Divider rem 100;
      BRR          : Bits_16;
   begin
      RCC.APB2ENR := RCC.APB2ENR or RCC_APB2ENR_USART1;
      RCC.AHB1ENR := RCC.AHB1ENR or RCC_AHB1ENR_GPIOB;

      GPIOB.MODER   (6 .. 7) := (Mode_AF,     Mode_AF);
      GPIOB.OSPEEDR (6 .. 7) := (Speed_50MHz, Speed_50MHz);
      GPIOB.OTYPER  (6 .. 7) := (Type_PP,     Type_PP);
      GPIOB.PUPDR   (6 .. 7) := (Pull_Up,     Pull_Up);
      GPIOB.AFRL    (6 .. 7) := (AF_USART1,   AF_USART1);

      BRR := (Bits_16 (Frac_Divider * 16) + 50) / 100 mod 16
               or Bits_16 (Int_Divider / 100 * 16);

      USART1.BRR := BRR;
      USART1.CR1 := USART.CR1_UE or USART.CR1_RE or USART.CR1_TE;
      USART1.CR2 := 0;
      USART1.CR3 := 0;
   end Initialize_USART1;

begin
   Reset_Clocks;
   Initialize_Clocks;
   Initialize_USART1 (115_200);
end Setup_Pll;
