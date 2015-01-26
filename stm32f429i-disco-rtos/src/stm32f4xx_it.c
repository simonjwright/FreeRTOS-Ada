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
#include "cmsis_os.h"


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
/*
 * This function records the register values of the hard fault from
 * the stack frame of the HardFault_Handler.
 * See http://www.freertos.org/Debugging-Hard-Faults-On-Cortex-M-Microcontrollers.html
 */
static void prvGetRegistersFromStack(uint32_t *pulFaultStackAddress);
__attribute__((naked)) void HardFault_Handler(void)
{
  __asm volatile
    (
     " tst lr, #4                                                \n"
     " ite eq                                                    \n"
     " mrseq r0, msp                                             \n"
     " mrsne r0, psp                                             \n"
     " ldr r1, [r0, #24]                                         \n"
     " ldr r2, handler2_address_const                            \n"
     " bx r2                                                     \n"
     " handler2_address_const: .word prvGetRegistersFromStack    \n"
     );
}
static void prvGetRegistersFromStack(uint32_t *pulFaultStackAddress)
{
  /* These are volatile to try and prevent the compiler/linker
     optimising them away as the variables never actually get used.
     If the debugger won't show the values of the variables, make them
     global by moving their declaration outside of this function. */
  volatile uint32_t r0;
  volatile uint32_t r1;
  volatile uint32_t r2;
  volatile uint32_t r3;
  volatile uint32_t r12;
  volatile uint32_t lr; /* Link register. */
  volatile uint32_t pc; /* Program counter. */
  volatile uint32_t psr;/* Program status register. */

  r0  = pulFaultStackAddress[0];
  r1  = pulFaultStackAddress[1];
  r2  = pulFaultStackAddress[2];
  r3  = pulFaultStackAddress[3];
  r12 = pulFaultStackAddress[4];
  lr  = pulFaultStackAddress[5];
  pc  = pulFaultStackAddress[6];
  psr = pulFaultStackAddress[7];

  /* When the following line is hit, the variables contain the
     register values. */
    for (;;);
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
//void SVC_Handler(void)
//{
//}

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
//void PendSV_Handler(void)
//{
//}

/**
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  */
void SysTick_Handler(void)
{
  HAL_IncTick();
  HAL_SYSTICK_IRQHandler();
  if (xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED)
  {
    xPortSysTickHandler();
  }
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

   Declare a set of handlers, one for each IRQ. Each handler looks in
   interrupt_handlers[IRQ] to see whether a handler has been installed
   from Ada; if so, call it; if not, loop (so you can catch unexpected
   interrupts in the debugger).

   They are all declared weak so that a 'strong' interrupt handler
   will override them. */

/* Pointer to the interrupt handler wrapper created by Ada; the
   'object' is the actual PO. */
typedef void (*handler_wrapper)(void *object);

/* Array, to be indexed from Ada as Interrupt_ID (0 .. 90), of handler
   wrappers. The index values also match IRQn_Type, in
   $CUBE/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f429xx.h.

   Called from the weak IRQ handlers defined below if not null.

   The Ada side will register handlers here; see
   System.Interupts.Install_Restricted_Handlers. */
handler_wrapper _gnat_interrupt_handlers[91] = {0, };

/* Parallel array containing the actual parameter to be passed to the
   handler wrapper.

   Implemented as parallel arrays rather than array of structs to be
   sure that interrupt_handlers[] is initialized. */
void * _gnat_interrupt_handler_parameters[91] = {0, };

#define dummy_handler(name, offset)                     \
__attribute__((weak)) void name()                       \
{                                                       \
  if (_gnat_interrupt_handlers[offset]) {               \
    _gnat_interrupt_handlers[offset]                    \
      (_gnat_interrupt_handler_parameters[offset]);     \
  } else {                                              \
    while (1) {};                                       \
  }                                                     \
}

dummy_handler(WWDG_IRQHandler,		0)
dummy_handler(PVD_IRQHandler,		1)
dummy_handler(TAMP_STAMP_IRQHandler,	2)
dummy_handler(RTC_WKUP_IRQHandler,	3)
dummy_handler(FLASH_IRQHandler,		4)
dummy_handler(RCC_IRQHandler,		5)
dummy_handler(EXTI0_IRQHandler,		6)
dummy_handler(EXTI1_IRQHandler,		7)
dummy_handler(EXTI2_IRQHandler,		8)
dummy_handler(EXTI3_IRQHandler,		9)
dummy_handler(EXTI4_IRQHandler,		10)
dummy_handler(DMA1_Stream0_IRQHandler,	11)
dummy_handler(DMA1_Stream1_IRQHandler,	12)
dummy_handler(DMA1_Stream2_IRQHandler,	13)
dummy_handler(DMA1_Stream3_IRQHandler,	14)
dummy_handler(DMA1_Stream4_IRQHandler,	15)
dummy_handler(DMA1_Stream5_IRQHandler,	16)
dummy_handler(DMA1_Stream6_IRQHandler,	17)
dummy_handler(ADC_IRQHandler,		18)
dummy_handler(CAN1_TX_IRQHandler,	19)
dummy_handler(CAN1_RX0_IRQHandler,	20)
dummy_handler(CAN1_RX1_IRQHandler,	21)
dummy_handler(CAN1_SCE_IRQHandler,	22)
dummy_handler(EXTI9_5_IRQHandler,	23)
dummy_handler(TIM1_BRK_TIM9_IRQHandler,	24)
dummy_handler(TIM1_UP_TIM10_IRQHandler,	25)
dummy_handler(TIM1_TRG_COM_TIM11_IRQHandler,	26)
dummy_handler(TIM1_CC_IRQHandler,	27)
dummy_handler(TIM2_IRQHandler,		28)
dummy_handler(TIM3_IRQHandler,		29)
dummy_handler(TIM4_IRQHandler,		30)
dummy_handler(I2C1_EV_IRQHandler,	31)
dummy_handler(I2C1_ER_IRQHandler,	32)
dummy_handler(I2C2_EV_IRQHandler,	33)
dummy_handler(I2C2_ER_IRQHandler,	34)
dummy_handler(SPI1_IRQHandler,		35)
dummy_handler(SPI2_IRQHandler,		36)
dummy_handler(USART1_IRQHandler,	37)
dummy_handler(USART2_IRQHandler,	38)
dummy_handler(USART3_IRQHandler,	39)
dummy_handler(EXTI15_10_IRQHandler,	40)
dummy_handler(RTC_Alarm_IRQHandler,	41)
dummy_handler(OTG_FS_WKUP_IRQHandler,	42)
dummy_handler(TIM8_BRK_TIM12_IRQHandler,	43)
dummy_handler(TIM8_UP_TIM13_IRQHandler,	44)
dummy_handler(TIM8_TRG_COM_TIM14_IRQHandler,	45)
dummy_handler(TIM8_CC_IRQHandler,	46)
dummy_handler(DMA1_Stream7_IRQHandler,	47)
dummy_handler(FMC_IRQHandler,		48)
dummy_handler(SDIO_IRQHandler,		49)
dummy_handler(TIM5_IRQHandler,		50)
dummy_handler(SPI3_IRQHandler,		51)
dummy_handler(UART4_IRQHandler,		52)
dummy_handler(UART5_IRQHandler,		53)
dummy_handler(TIM6_DAC_IRQHandler,	54)
dummy_handler(TIM7_IRQHandler,		55)
dummy_handler(DMA2_Stream0_IRQHandler,	56)
dummy_handler(DMA2_Stream1_IRQHandler,	57)
dummy_handler(DMA2_Stream2_IRQHandler,	58)
dummy_handler(DMA2_Stream3_IRQHandler,	59)
dummy_handler(DMA2_Stream4_IRQHandler,	60)
dummy_handler(ETH_IRQHandler,		61)
dummy_handler(ETH_WKUP_IRQHandler,	62)
dummy_handler(CAN2_TX_IRQHandler,	63)
dummy_handler(CAN2_RX0_IRQHandler,	64)
dummy_handler(CAN2_RX1_IRQHandler,	65)
dummy_handler(CAN2_SCE_IRQHandler,	66)
dummy_handler(OTG_FS_IRQHandler,	67)
dummy_handler(DMA2_Stream5_IRQHandler,	68)
dummy_handler(DMA2_Stream6_IRQHandler,	69)
dummy_handler(DMA2_Stream7_IRQHandler,	70)
dummy_handler(USART6_IRQHandler,	71)
dummy_handler(I2C3_EV_IRQHandler,	72)
dummy_handler(I2C3_ER_IRQHandler,	73)
dummy_handler(OTG_HS_EP1_OUT_IRQHandler,	74)
dummy_handler(OTG_HS_EP1_IN_IRQHandler,	75)
dummy_handler(OTG_HS_WKUP_IRQHandler,	76)
dummy_handler(OTG_HS_IRQHandler,	77)
dummy_handler(DCMI_IRQHandler,		78)
/* CRYP_IRQHandler, not present on stm32f429xx */
dummy_handler(HASH_RNG_IRQHandler,	80)
dummy_handler(FPU_IRQHandler,		81)
dummy_handler(UART7_IRQHandler,		82)
dummy_handler(UART8_IRQHandler,		83)
dummy_handler(SPI4_IRQHandler,		84)
dummy_handler(SPI5_IRQHandler,		85)
dummy_handler(SPI6_IRQHandler,		86)
dummy_handler(SAI1_IRQHandler,		87)
dummy_handler(LTDC_IRQHandler,		88)
dummy_handler(LTDC_ER_IRQHandler,	89)
dummy_handler(DMA2D_IRQHandler,		90)
