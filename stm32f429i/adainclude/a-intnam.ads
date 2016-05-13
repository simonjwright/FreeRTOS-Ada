--  Copyright (C) 2016 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

package Ada.Interrupts.Names is

   --  See RM0090 (DocID018909 Rev 11) Table 61.

   WWDG_IRQ               : constant Interrupt_ID := 0;
   PVD_IRQ                : constant Interrupt_ID := 1;
   TAMP_STAMP_IRQ         : constant Interrupt_ID := 2;
   RTC_WKUP_IRQ           : constant Interrupt_ID := 3;
   FLASH_IRQ              : constant Interrupt_ID := 4;
   RCC_IRQ                : constant Interrupt_ID := 5;
   EXTI0_IRQ              : constant Interrupt_ID := 6;
   EXTI1_IRQ              : constant Interrupt_ID := 7;
   EXTI2_IRQ              : constant Interrupt_ID := 8;
   EXTI3_IRQ              : constant Interrupt_ID := 9;
   EXTI4_IRQ              : constant Interrupt_ID := 10;
   DMA1_Stream0_IRQ       : constant Interrupt_ID := 11;
   DMA1_Stream1_IRQ       : constant Interrupt_ID := 12;
   DMA1_Stream2_IRQ       : constant Interrupt_ID := 13;
   DMA1_Stream3_IRQ       : constant Interrupt_ID := 14;
   DMA1_Stream4_IRQ       : constant Interrupt_ID := 15;
   DMA1_Stream5_IRQ       : constant Interrupt_ID := 16;
   DMA1_Stream6_IRQ       : constant Interrupt_ID := 17;
   ADC_IRQ                : constant Interrupt_ID := 18;
   CAN1_TX_IRQ            : constant Interrupt_ID := 19;
   CAN1_RX0_IRQ           : constant Interrupt_ID := 20;
   CAN1_RX1_IRQ           : constant Interrupt_ID := 21;
   CAN1_SCE_IRQ           : constant Interrupt_ID := 22;
   EXTI9_5_IRQ            : constant Interrupt_ID := 23;
   TIM1_BRK_TIM9_IRQ      : constant Interrupt_ID := 24;
   TIM1_UP_TIM10_IRQ      : constant Interrupt_ID := 25;
   TIM1_TRG_COM_TIM11_IRQ : constant Interrupt_ID := 26;
   TIM1_CC_IRQ            : constant Interrupt_ID := 27;
   TIM2_IRQ               : constant Interrupt_ID := 28;
   TIM3_IRQ               : constant Interrupt_ID := 29;
   TIM4_IRQ               : constant Interrupt_ID := 30;
   I2C1_EV_IRQ            : constant Interrupt_ID := 31;
   I2C1_ER_IRQ            : constant Interrupt_ID := 32;
   I2C2_EV_IRQ            : constant Interrupt_ID := 33;
   I2C2_ER_IRQ            : constant Interrupt_ID := 34;
   SPI1_IRQ               : constant Interrupt_ID := 35;
   SPI2_IRQ               : constant Interrupt_ID := 36;
   USART1_IRQ             : constant Interrupt_ID := 37;
   USART2_IRQ             : constant Interrupt_ID := 38;
   USART3_IRQ             : constant Interrupt_ID := 39;
   EXTI15_10_IRQ          : constant Interrupt_ID := 40;
   RTC_Alarm_IRQ          : constant Interrupt_ID := 41;
   OTG_FS_WKUP_IRQ        : constant Interrupt_ID := 42;
   TIM8_BRK_TIM12_IRQ     : constant Interrupt_ID := 43;
   TIM8_UP_TIM13_IRQ      : constant Interrupt_ID := 44;
   TIM8_TRG_COM_TIM14_IRQ : constant Interrupt_ID := 45;
   TIM8_CC_IRQ            : constant Interrupt_ID := 46;
   DMA1_Stream7_IRQ       : constant Interrupt_ID := 47;
   FMC_IRQ                : constant Interrupt_ID := 48;
   SDIO_IRQ               : constant Interrupt_ID := 49;
   TIM5_IRQ               : constant Interrupt_ID := 50;
   SPI3_IRQ               : constant Interrupt_ID := 51;
   UART4_IRQ              : constant Interrupt_ID := 52;
   UART5_IRQ              : constant Interrupt_ID := 53;
   TIM6_DAC_IRQ           : constant Interrupt_ID := 54;
   TIM7_IRQ               : constant Interrupt_ID := 55;
   DMA2_Stream0_IRQ       : constant Interrupt_ID := 56;
   DMA2_Stream1_IRQ       : constant Interrupt_ID := 57;
   DMA2_Stream2_IRQ       : constant Interrupt_ID := 58;
   DMA2_Stream3_IRQ       : constant Interrupt_ID := 59;
   DMA2_Stream4_IRQ       : constant Interrupt_ID := 60;
   ETH_IRQ                : constant Interrupt_ID := 61;
   ETH_WKUP_IRQ           : constant Interrupt_ID := 62;
   CAN2_TX_IRQ            : constant Interrupt_ID := 63;
   CAN2_RX0_IRQ           : constant Interrupt_ID := 64;
   CAN2_RX1_IRQ           : constant Interrupt_ID := 65;
   CAN2_SCE_IRQ           : constant Interrupt_ID := 66;
   OTG_FS_IRQ             : constant Interrupt_ID := 67;
   DMA2_Stream5_IRQ       : constant Interrupt_ID := 68;
   DMA2_Stream6_IRQ       : constant Interrupt_ID := 69;
   DMA2_Stream7_IRQ       : constant Interrupt_ID := 70;
   USART6_IRQ             : constant Interrupt_ID := 71;
   I2C3_EV_IRQ            : constant Interrupt_ID := 72;
   I2C3_ER_IRQ            : constant Interrupt_ID := 73;
   OTG_HS_EP1_OUT_IRQ     : constant Interrupt_ID := 74;
   OTG_HS_EP1_IN_IRQ      : constant Interrupt_ID := 75;
   OTG_HS_WKUP_IRQ        : constant Interrupt_ID := 76;
   OTG_HS_IRQ             : constant Interrupt_ID := 77;
   DCMI_IRQ               : constant Interrupt_ID := 78;
   CRYP_IRQ               : constant Interrupt_ID := 79; -- may not be present
   HASH_RNG_IRQ           : constant Interrupt_ID := 80;
   FPU_IRQ                : constant Interrupt_ID := 81;
   UART7_IRQ              : constant Interrupt_ID := 82;
   UART8_IRQ              : constant Interrupt_ID := 83;
   SPI4_IRQ               : constant Interrupt_ID := 84;
   SPI5_IRQ               : constant Interrupt_ID := 85;
   SPI6_IRQ               : constant Interrupt_ID := 86;
   SAI1_IRQ               : constant Interrupt_ID := 87;
   LTDC_IRQ               : constant Interrupt_ID := 88;
   LTDC_ER_IRQ            : constant Interrupt_ID := 89;
   DMA2D_IRQ              : constant Interrupt_ID := 90;

end Ada.Interrupts.Names;
