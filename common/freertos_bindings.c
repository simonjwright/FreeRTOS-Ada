// Copyright (C) 2016-2024 Free Software Foundation, Inc.
//
// GNAT is free software;  you can  redistribute it  and/or modify it under
// terms of the  GNU General Public License as published  by the Free Soft-
// ware  Foundation;  either version 3,  or (at your option) any later ver-
// sion.  GNAT is distributed in the hope that it will be useful, but WITH-
// OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.
//
// As a special exception under Section 7 of GPL version 3, you are granted
// additional permissions described in the GCC Runtime Library Exception,
// version 3.1, as published by the Free Software Foundation.
//
// You should have received a copy of the GNU General Public License and
// a copy of the GCC Runtime Library Exception along with this program;
// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
// <http://www.gnu.org/licenses/>.
//
// This interface to FreeRTOS is part of the Cortex GNAT RTS project.
//
// This file creates callable interfaces to some FreeRTOS macros.  The
// alternative is to code in Ada what the macros translate to; this is
// all very well until FreeRTOS changes the way the macro is
// implemented, and in any case the main reason for there being macros
// in the first place is that the implementation is different for
// different CPU architectures.

#include <FreeRTOS.h>
#include <queue.h>
#include <semphr.h>
#include <task.h>

const int _gnat_freertos_tick_rate = configTICK_RATE_HZ;

void _gnat_disable_interrupts(void) {
  taskDISABLE_INTERRUPTS();
}

void _gnat_enable_interrupts(void) {
  taskENABLE_INTERRUPTS();
}

void _gnat_enter_critical(void) {
  taskENTER_CRITICAL();
}

void _gnat_exit_critical(void) {
  taskEXIT_CRITICAL();
}

void _gnat_yield_from_isr(int switch_required) {
  portEND_SWITCHING_ISR(switch_required);
}

QueueHandle_t _gnat_xQueueCreate(portBASE_TYPE uxQueueLength,
                                 portBASE_TYPE uxItemSize) {
  return xQueueCreate(uxQueueLength, uxItemSize);
}

// We only need to append new items to the queue.
portBASE_TYPE _gnat_xQueueSend(QueueHandle_t xQueue,
                               const void *pvItemToQueue,
                               TickType_t xTicksToWait) {
  return xQueueSendToBack(xQueue, pvItemToQueue, xTicksToWait);
}

portBASE_TYPE _gnat_xQueueSendFromISR
  (QueueHandle_t xQueue,
   const void *pvItemToQueue,
   portBASE_TYPE *pxHigherPriorityTaskWoken) {
  return xQueueSendToBackFromISR
    (xQueue, pvItemToQueue, pxHigherPriorityTaskWoken);
}

portBASE_TYPE _gnat_xQueueOverwrite(QueueHandle_t xQueue,
                                    const void *pvItemToQueue) {
  return xQueueOverwrite(xQueue, pvItemToQueue);
}

portBASE_TYPE _gnat_xQueueReceive(QueueHandle_t xQueue,
                                  void *pvBuffer,
                                  TickType_t xTicksToWait) {
  return xQueueReceive(xQueue, pvBuffer, xTicksToWait);
}

SemaphoreHandle_t _gnat_xSemaphoreCreateBinary() {
   return xSemaphoreCreateBinary();
 }

 portBASE_TYPE _gnat_xSemaphoreGive(SemaphoreHandle_t xSemaphore) {
   return xSemaphoreGive(xSemaphore);
}

portBASE_TYPE _gnat_xSemaphoreTake(SemaphoreHandle_t xSemaphore,
                                   TickType_t xBlockTime) {
  return xSemaphoreTake(xSemaphore, xBlockTime);
}

portBASE_TYPE _gnat_xSemaphoreGiveFromISR
  (SemaphoreHandle_t xSemaphore,
   portBASE_TYPE *pxHigherPriorityTaskWoken) {
  return xSemaphoreGiveFromISR(xSemaphore, pxHigherPriorityTaskWoken);
}
