/*
 * Copyright Simon Wright <simon@pushface.org>
 *
 * Copying and distribution of this file, with or without
 * modification, are permitted in any medium without royalty provided
 * the copyright notice and this notice are preserved.  This file is
 * offered as-is, without any warranty.
 */

#include "stm32f429i_discovery.h"
#include "stm32f4xx_hal.h"
#include "bsp_configure_system_clock.h"

static int t_250 = 0;
static int t_500 = 0;

void HAL_SYSTICK_Callback(void)
{
  static unsigned ticks = 0;
  ticks++;
  if ((ticks % 250) == 0) {
    t_250 = !0;
  }
  if ((ticks % 500) == 0) {
    t_500 = !0;
  }
}

#define short_led LED4
#define long_led  LED3

int main(void)
{
  HAL_Init();

  /* Configure the system clock to 180 Mhz, and SysTick to 1 ms */
  _bsp_configure_system_clock();

  /* Configure LED3 and LED4 */
  BSP_LED_Init(LED3);
  BSP_LED_Init(LED4);

  while (1) {
    if (t_500) {
      BSP_LED_Toggle(long_led);
      t_500 = 0;
    }
    if (t_250) {
      BSP_LED_Toggle(short_led);
      t_250 = 0;
    }
  }
}
