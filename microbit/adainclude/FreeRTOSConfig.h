/*
  FreeRTOS settings for cortex-gnat-rts/microbit.
  Copied from the cortex-gnat-rts/stm32f4 version.

  Includes changes from nRF51_SDK.
*/

#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

/*-----------------------------------------------------------
 * Application specific definitions.
 *
 * These definitions should be adjusted for your particular hardware and
 * application requirements.
 *
 * THESE PARAMETERS ARE DESCRIBED WITHIN THE 'CONFIGURATION' SECTION OF THE
 * FreeRTOS API DOCUMENTATION AVAILABLE ON THE FreeRTOS.org WEB SITE.
 *
 * See http://www.freertos.org/a00110.html.
 *----------------------------------------------------------*/

/* Ensure stdint is only used by the compiler, and not the assembler. */
#if defined(__ICCARM__) || defined(__CC_ARM) || defined(__GNUC__)
	#include <stdint.h>
	extern uint32_t SystemCoreClock;
#endif


#define configUSE_PREEMPTION			1
#define configUSE_IDLE_HOOK			0
#define configUSE_TICK_HOOK			0
#define configCPU_CLOCK_HZ			( 16000000 )
#define configTICK_RATE_HZ			( ( TickType_t ) 1024 )

/* Extend the number of priority levels to cope with Ada ceiling
   priorities, which mean we need to raise a task waiting for an ISR
   to a priority corresponding to that interrupt's priority. So we
   need the additional priorities 8 (interrupt priority 3) to 10
   (interrupt priority 1, the highest that can use API interrupt-safe
   functions). */
#define configMAX_PRIORITIES			( 10 )

#define configMINIMAL_STACK_SIZE		( ( unsigned short ) 128 )
#define configTOTAL_HEAP_SIZE			( ( size_t ) ( 16 * 1024 ) )
#define configMAX_TASK_NAME_LEN			( 16 )
#define configUSE_TRACE_FACILITY		0
#define configUSE_16_BIT_TICKS			0
#define configIDLE_SHOULD_YIELD			1
#define configUSE_MUTEXES			0
#define configQUEUE_REGISTRY_SIZE		0
#define configCHECK_FOR_STACK_OVERFLOW	        2 /* full checking */
#define configUSE_RECURSIVE_MUTEXES		0
#define configUSE_MALLOC_FAILED_HOOK	        0
#define configUSE_APPLICATION_TASK_TAG	        1 /* for Task_Id in TCB */
#define configUSE_COUNTING_SEMAPHORES	        0
#define configGENERATE_RUN_TIME_STATS	        0
#define configUSE_QUEUE_SETS			0

#define configUSE_TIME_SLICING                  0 /* don't want round-robin */

/* Co-routine definitions. */
#define configUSE_CO_ROUTINES 		        0
#define configMAX_CO_ROUTINE_PRIORITIES        ( 2 )

/* Software timer definitions. */
#define configUSE_TIMERS			0
#define configTIMER_TASK_PRIORITY		( 2 )
#define configTIMER_QUEUE_LENGTH		10
#define configTIMER_TASK_STACK_DEPTH	        ( configMINIMAL_STACK_SIZE * 2 )

/* Set the following definitions to 1 to include the API function, or zero */
/* to exclude the API function. */
/* Updated for FreeRTOS 8, per http://www.freertos.org/a00110.html */
#define INCLUDE_eTaskGetState                   0
#define INCLUDE_pcTaskGetTaskName               0
#define INCLUDE_uxTaskGetStackHighWaterMark     0
#define INCLUDE_uxTaskPriorityGet               1
#define INCLUDE_vTaskCleanUpResources	        0
#define INCLUDE_vTaskDelay                      1
#define INCLUDE_vTaskDelayUntil			0
#define INCLUDE_vTaskDelete                     0
#define INCLUDE_vTaskPrioritySet                1
#define INCLUDE_vTaskSuspend                    1
#define INCLUDE_xEventGroupSetBitFromISR        0
#define INCLUDE_xResumeFromISR                  1
#define INCLUDE_xTaskGetCurrentTaskHandle       1
#define INCLUDE_xTaskGetIdleTaskHandle          0
#define INCLUDE_xTaskGetSchedulerState          1
#define INCLUDE_xTimerGetTimerDaemonTaskHandle  0
#define INCLUDE_xTimerPendFunctionCall          0

/* Cortex-M specific definitions. */
#ifdef __NVIC_PRIO_BITS
	/* __BVIC_PRIO_BITS will be specified when CMSIS is being used. */
	#define configPRIO_BITS       		__NVIC_PRIO_BITS
#else
	#define configPRIO_BITS       	       2        /* 3 priority levels */
#endif

/* The lowest interrupt priority that can be used in a call to a "set priority"
function. */
#define configLIBRARY_LOWEST_INTERRUPT_PRIORITY			0x3

/* The highest interrupt priority that can be used by any interrupt service
routine that makes calls to interrupt safe FreeRTOS API functions.  DO NOT CALL
INTERRUPT SAFE FREERTOS API FUNCTIONS FROM ANY INTERRUPT THAT HAS A HIGHER
PRIORITY THAN THIS! (higher priorities are lower numeric values. */
/* UNCLEAR THAT THIS IS TRUE FOR A CM0 PART, WHICH DOESN'T HAVE BASEPRI */
#define configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY	1

/* Interrupt priorities used by the kernel port layer itself.  These are generic
to all Cortex-M ports, and do not rely on any particular library functions. */
#define configKERNEL_INTERRUPT_PRIORITY 		( configLIBRARY_LOWEST_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )
/* !!!! configMAX_SYSCALL_INTERRUPT_PRIORITY must not be set to zero !!!!
See http://www.FreeRTOS.org/RTOS-Cortex-M3-M4.html. */
#define configMAX_SYSCALL_INTERRUPT_PRIORITY 	( configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )

/* Normal assert() semantics without relying on the provision of an assert.h
header file. */
#define configASSERT( x ) if( ( x ) == 0 ) { taskDISABLE_INTERRUPTS(); for( ;; ); }

/* Definitions that map the FreeRTOS port interrupt handlers to their CMSIS
standard names. */
#define vPortSVCHandler SVC_Handler
#define xPortPendSVHandler PendSV_Handler
#define xPortSysTickHandler SysTick_Handler

#endif /* FREERTOS_CONFIG_H */
