/**
  ******************************************************************************
  * @file    BSP/Src/stm32f4xx_it.c
  * @author  MCD Application Team
  * @version V1.1.0
  * @date    26-June-2014
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all exceptions handler and
  *          peripherals interrupt service routine.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2014 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_it.h"


/** @addtogroup STM32F4xx_HAL_Examples
  * @{
  */

/** @addtogroup BSP
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
#ifdef EE_M24LR64
extern I2C_HandleTypeDef I2cHandle;
#endif /* EE_M24LR64 */

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/******************************************************************************/
/*            Cortex-M4 Processor Exceptions Handlers                         */
/******************************************************************************/

/**
  * @brief  This function handles NMI exception.
  * @param  None
  * @retval None
  */
void NMI_Handler(void)
{
}

/**
  * @brief  This function handles Hard Fault exception.
  * @param  None
  * @retval None
  */
void HardFault_Handler(void)
{
  /* Go to infinite loop when Hard Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Memory Manage exception.
  * @param  None
  * @retval None
  */
void MemManage_Handler(void)
{
  /* Go to infinite loop when Memory Manage exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Bus Fault exception.
  * @param  None
  * @retval None
  */
void BusFault_Handler(void)
{
  /* Go to infinite loop when Bus Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Usage Fault exception.
  * @param  None
  * @retval None
  */
void UsageFault_Handler(void)
{
  /* Go to infinite loop when Usage Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles SVCall exception.
  * @param  None
  * @retval None
  */
void SVC_Handler(void)
{
}

/**
  * @brief  This function handles Debug Monitor exception.
  * @param  None
  * @retval None
  */
void DebugMon_Handler(void)
{
}

/**
  * @brief  This function handles PendSVC exception.
  * @param  None
  * @retval None
  */
void PendSV_Handler(void)
{
}

/**
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  */
void SysTick_Handler(void)
{
  HAL_IncTick();
  HAL_SYSTICK_IRQHandler();
}

/******************************************************************************/
/*                 STM32F4xx Peripherals Interrupt Handlers                   */
/*  Add here the Interrupt Handler for the used peripheral(s) (PPP), for the  */
/*  available peripheral interrupt handler's name please refer to the startup */
/*  file (startup_stm32f4xx.s).                                               */
/******************************************************************************/
//
///********************** (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

/* By sjw

   The dummies in startup_stm32f429xx.s are all zero-length, so if an
   unexpected interrupt occurs you're left guessing as to which one it
   was.

   This setup - which of course makes the code 32f429-specific - means
   you can use the debugger to tell which interrupt handler the board
   is spinning in.

   They are all declared weak so that a 'strong' interrupt handler
   will override them. */

#define dummy_handler(name) __attribute__((weak)) void name() {while (1) {}}

dummy_handler(WWDG_IRQHandler)
dummy_handler(PVD_IRQHandler)
dummy_handler(TAMP_STAMP_IRQHandler)
dummy_handler(RTC_WKUP_IRQHandler)
dummy_handler(FLASH_IRQHandler)
dummy_handler(RCC_IRQHandler)
dummy_handler(EXTI0_IRQHandler)
dummy_handler(EXTI1_IRQHandler)
dummy_handler(EXTI2_IRQHandler)
dummy_handler(EXTI3_IRQHandler)
dummy_handler(EXTI4_IRQHandler)
dummy_handler(DMA1_Stream0_IRQHandler)
dummy_handler(DMA1_Stream1_IRQHandler)
dummy_handler(DMA1_Stream2_IRQHandler)
dummy_handler(DMA1_Stream3_IRQHandler)
dummy_handler(DMA1_Stream4_IRQHandler)
dummy_handler(DMA1_Stream5_IRQHandler)
dummy_handler(DMA1_Stream6_IRQHandler)
dummy_handler(ADC_IRQHandler)
dummy_handler(CAN1_TX_IRQHandler)
dummy_handler(CAN1_RX0_IRQHandler)
dummy_handler(CAN1_RX1_IRQHandler)
dummy_handler(CAN1_SCE_IRQHandler)
dummy_handler(EXTI9_5_IRQHandler)
dummy_handler(TIM1_BRK_TIM9_IRQHandler)
dummy_handler(TIM1_UP_TIM10_IRQHandler)
dummy_handler(TIM1_TRG_COM_TIM11_IRQHandler)
dummy_handler(TIM1_CC_IRQHandler)
dummy_handler(TIM2_IRQHandler)
dummy_handler(TIM3_IRQHandler)
dummy_handler(TIM4_IRQHandler)
dummy_handler(I2C1_EV_IRQHandler)
dummy_handler(I2C1_ER_IRQHandler)
dummy_handler(I2C2_EV_IRQHandler)
dummy_handler(I2C2_ER_IRQHandler)
dummy_handler(SPI1_IRQHandler)
dummy_handler(SPI2_IRQHandler)
dummy_handler(USART1_IRQHandler)
dummy_handler(USART2_IRQHandler)
dummy_handler(USART3_IRQHandler)
dummy_handler(EXTI15_10_IRQHandler)
dummy_handler(RTC_Alarm_IRQHandler)
dummy_handler(OTG_FS_WKUP_IRQHandler)
dummy_handler(TIM8_BRK_TIM12_IRQHandler)
dummy_handler(TIM8_UP_TIM13_IRQHandler)
dummy_handler(TIM8_TRG_COM_TIM14_IRQHandler)
dummy_handler(TIM8_CC_IRQHandler)
dummy_handler(DMA1_Stream7_IRQHandler)
dummy_handler(FMC_IRQHandler)
dummy_handler(SDIO_IRQHandler)
dummy_handler(TIM5_IRQHandler)
dummy_handler(SPI3_IRQHandler)
dummy_handler(UART4_IRQHandler)
dummy_handler(UART5_IRQHandler)
dummy_handler(TIM6_DAC_IRQHandler)
dummy_handler(TIM7_IRQHandler)
dummy_handler(DMA2_Stream0_IRQHandler)
dummy_handler(DMA2_Stream1_IRQHandler)
dummy_handler(DMA2_Stream2_IRQHandler)
dummy_handler(DMA2_Stream3_IRQHandler)
dummy_handler(DMA2_Stream4_IRQHandler)
dummy_handler(ETH_IRQHandler)
dummy_handler(ETH_WKUP_IRQHandler)
dummy_handler(CAN2_TX_IRQHandler)
dummy_handler(CAN2_RX0_IRQHandler)
dummy_handler(CAN2_RX1_IRQHandler)
dummy_handler(CAN2_SCE_IRQHandler)
dummy_handler(OTG_FS_IRQHandler)
dummy_handler(DMA2_Stream5_IRQHandler)
dummy_handler(DMA2_Stream6_IRQHandler)
dummy_handler(DMA2_Stream7_IRQHandler)
dummy_handler(USART6_IRQHandler)
dummy_handler(I2C3_EV_IRQHandler)
dummy_handler(I2C3_ER_IRQHandler)
dummy_handler(OTG_HS_EP1_OUT_IRQHandler)
dummy_handler(OTG_HS_EP1_IN_IRQHandler)
dummy_handler(OTG_HS_WKUP_IRQHandler)
dummy_handler(OTG_HS_IRQHandler)
dummy_handler(DCMI_IRQHandler)
dummy_handler(HASH_RNG_IRQHandler)
dummy_handler(FPU_IRQHandler)
dummy_handler(UART7_IRQHandler)
dummy_handler(UART8_IRQHandler)
dummy_handler(SPI4_IRQHandler)
dummy_handler(SPI5_IRQHandler)
dummy_handler(SPI6_IRQHandler)
dummy_handler(SAI1_IRQHandler)
dummy_handler(LTDC_IRQHandler)
dummy_handler(LTDC_ER_IRQHandler)
dummy_handler(DMA2D_IRQHandler)
