------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                   A D A . I N T E R R U P T S . N A M E S                --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--          Copyright (C) 1991-2013, Free Software Foundation, Inc.         --
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
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This is the version for Cortex M4F STM32F4 targets

package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   --  The STM32F4X reference manual defines the interrupt in Table 45
   --  (page 250 of Doc ID 018909 Rev 4). The meaningful number, the position
   --  starts at 0. Unfortunately, Interrupt_ID 0 is reserved and the SysTick
   --  interrupt (a core interrupt) is handled by the runtime like other
   --  interrupts. So the first interrupt (window watchdog) is numbered 2 while
   --  it is at position 0 in the manual. The offset of 2 is reflected in
   --  s-bbbosu-stm32f4.adb by the First_IRQ constant.

   Sys_Tick_Interrupt               : constant Interrupt_ID := 1;
   WWDG_Interrupt                   : constant Interrupt_ID := 2;
   PVD_Interrupt                    : constant Interrupt_ID := 3;
   TAMP_STAMP_Interrupt             : constant Interrupt_ID := 4;
   RTC_WKUP_Interrupt               : constant Interrupt_ID := 5;
   FLASH_Interrupt                  : constant Interrupt_ID := 6;
   RCC_Interrupt                    : constant Interrupt_ID := 7;
   EXTI0_Interrupt                  : constant Interrupt_ID := 8;
   EXTI1_Interrupt                  : constant Interrupt_ID := 9;
   EXTI2_Interrupt                  : constant Interrupt_ID := 10;
   EXTI3_Interrupt                  : constant Interrupt_ID := 11;
   EXTI4_Interrupt                  : constant Interrupt_ID := 12;
   DMA1_Stream0_Interrupt           : constant Interrupt_ID := 13;
   DMA1_Stream1_Interrupt           : constant Interrupt_ID := 14;
   DMA1_Stream2_Interrupt           : constant Interrupt_ID := 15;
   DMA1_Stream3_Interrupt           : constant Interrupt_ID := 16;
   DMA1_Stream4_Interrupt           : constant Interrupt_ID := 17;
   DMA1_Stream5_Interrupt           : constant Interrupt_ID := 18;
   DMA1_Stream6_Interrupt           : constant Interrupt_ID := 19;
   ADC_Interrupt                    : constant Interrupt_ID := 20;
   CAN1_TX_Interrupt                : constant Interrupt_ID := 21;
   CAN1_RX0_Interrupt               : constant Interrupt_ID := 22;
   CAN1_RX1_Interrupt               : constant Interrupt_ID := 23;
   CAN1_SCE_Interrupt               : constant Interrupt_ID := 24;
   EXTI9_5_Interrupt                : constant Interrupt_ID := 25;
   TIM1_BRK_TIM9_Interrupt          : constant Interrupt_ID := 26;
   TIM1_UP_TIM10_Interrupt          : constant Interrupt_ID := 27;
   TIM1_TRG_COM_TIM11_Interrupt     : constant Interrupt_ID := 28;
   TIM1_CC_Interrupt                : constant Interrupt_ID := 29;
   TIM2_Interrupt                   : constant Interrupt_ID := 30;
   TIM3_Interrupt                   : constant Interrupt_ID := 31;
   TIM4_Interrupt                   : constant Interrupt_ID := 32;
   I2C1_EV_Interrupt                : constant Interrupt_ID := 33;
   I2C1_ER_Interrupt                : constant Interrupt_ID := 34;
   I2C2_EV_Interrupt                : constant Interrupt_ID := 35;
   I2C2_ER_Interrupt                : constant Interrupt_ID := 36;
   SPI1_Interrupt                   : constant Interrupt_ID := 37;
   SPI2_Interrupt                   : constant Interrupt_ID := 38;
   USART1_Interrupt                 : constant Interrupt_ID := 39;
   USART2_Interrupt                 : constant Interrupt_ID := 40;
   USART3_Interrupt                 : constant Interrupt_ID := 41;
   EXTI15_10_Interrupt              : constant Interrupt_ID := 42;
   RTC_Alarm_Interrupt              : constant Interrupt_ID := 43;
   OTG_FS_WKUP_Interrupt            : constant Interrupt_ID := 44;
   TIM8_BRK_TIM12_Interrupt         : constant Interrupt_ID := 45;
   TIM8_UP_TIM13_Interrupt          : constant Interrupt_ID := 46;
   TIM8_TRG_COM_TIM14_Interrupt     : constant Interrupt_ID := 47;
   TIM8_CC_Interrupt                : constant Interrupt_ID := 48;
   DMA1_Stream7_Interrupt           : constant Interrupt_ID := 49;
   FSMC_Interrupt                   : constant Interrupt_ID := 50;
   SDIO_Interrupt                   : constant Interrupt_ID := 51;
   TIM5_Interrupt                   : constant Interrupt_ID := 52;
   SPI3_Interrupt                   : constant Interrupt_ID := 53;
   UART4_Interrupt                  : constant Interrupt_ID := 54;
   UART5_Interrupt                  : constant Interrupt_ID := 55;
   TIM6_DAC_Interrupt               : constant Interrupt_ID := 56;
   TIM7_Interrupt                   : constant Interrupt_ID := 57;
   DMA2_Stream0_Interrupt           : constant Interrupt_ID := 58;
   DMA2_Stream1_Interrupt           : constant Interrupt_ID := 59;
   DMA2_Stream2_Interrupt           : constant Interrupt_ID := 60;
   DMA2_Stream3_Interrupt           : constant Interrupt_ID := 61;
   DMA2_Stream4_Interrupt           : constant Interrupt_ID := 62;
   ETH_Interrupt                    : constant Interrupt_ID := 63;
   ETH_WKUP_Interrupt               : constant Interrupt_ID := 64;
   CAN2_TX_Interrupt                : constant Interrupt_ID := 65;
   CAN2_RX0_Interrupt               : constant Interrupt_ID := 66;
   CAN2_RX1_Interrupt               : constant Interrupt_ID := 67;
   CAN2_SCE_Interrupt               : constant Interrupt_ID := 68;
   OTG_FS_Interrupt                 : constant Interrupt_ID := 69;
   DMA2_Stream5_Interrupt           : constant Interrupt_ID := 70;
   DMA2_Stream6_Interrupt           : constant Interrupt_ID := 71;
   DMA2_Stream7_Interrupt           : constant Interrupt_ID := 72;
   USART6_Interrupt                 : constant Interrupt_ID := 73;
   I2C3_EV_Interrupt                : constant Interrupt_ID := 74;
   I2C3_ER_Interrupt                : constant Interrupt_ID := 75;
   OTG_HS_EP1_OUT_Interrupt         : constant Interrupt_ID := 76;
   OTG_HS_EP1_IN_Interrupt          : constant Interrupt_ID := 77;
   OTG_HS_WKUP_Interrupt            : constant Interrupt_ID := 78;
   OTG_HS_Interrupt                 : constant Interrupt_ID := 79;
   DCMI_Interrupt                   : constant Interrupt_ID := 80;
   CRYP_Interrupt                   : constant Interrupt_ID := 81;
   HASH_RNG_Interrupt               : constant Interrupt_ID := 82;
   FPU_Interrupt                    : constant Interrupt_ID := 83;

end Ada.Interrupts.Names;
