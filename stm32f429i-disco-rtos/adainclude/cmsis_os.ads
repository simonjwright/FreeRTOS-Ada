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

with Interfaces;
with System;

package CMSIS_OS with Preelaborate is

   use type Interfaces.Integer_32;

   --  Definitions from cmsis_os.h as customised for FreeRTOS.

   subtype osPriority is Interfaces.Integer_32;
   osPriorityIdle        : constant osPriority := -3;
   osPriorityLow         : constant osPriority := -2;
   osPriorityBelowNormal : constant osPriority := -1;
   osPriorityNormal      : constant osPriority := 0;
   osPriorityAboveNormal : constant osPriority := 1;
   osPriorityHigh        : constant osPriority := 2;
   osPriorityRealtime    : constant osPriority := 3;
   osPriorityError       : constant osPriority := 16#84#;

   subtype osStatus is Interfaces.Unsigned_32;
   osOK                   : constant osStatus := 0;
   osEventSignal          : constant osStatus := 16#08#;
   osEventMessage         : constant osStatus := 16#10#;
   osEventMail            : constant osStatus := 16#20#;
   osEventTimeout         : constant osStatus := 16#40#;
   osErrorParameter       : constant osStatus := 16#80#;
   osErrorResource        : constant osStatus := 16#81#;
   osErrorTimeoutResource : constant osStatus := 16#c1#;
   osErrorISR             : constant osStatus := 16#82#;
   osErrorISRRecursive    : constant osStatus := 16#83#;
   osErrorPriority        : constant osStatus := 16#84#;
   osErrorNoMemory        : constant osStatus := 16#85#;
   osErrorValue           : constant osStatus := 16#86#;
   osErrorOS              : constant osStatus := 16#ff#;
   os_status_reserved     : constant osStatus := 16#7fff_ffff#;

   osWaitForever : constant Interfaces.Unsigned_32 := 16#ffff_ffff#;

   ---------------
   --  Threads  --
   ---------------

   type os_pthread is access procedure (Arg1 : System.Address)
   with
     Convention => C;

   type osThreadId is private;
   Null_osThreadId : constant osThreadId;

   type os_thread_def is record
      Name      : System.Address; -- Interfaces.C.Strings.chars_ptr
      Pthread   : os_pthread;
      Tpriority : osPriority;
      Instances : Interfaces.Unsigned_32;
      Stacksize : Interfaces.Unsigned_32;  -- in words, not bytes
   end record
   with
     Convention => C_Pass_By_Copy;

   subtype osThreadDef_t is os_thread_def;

   function osThreadCreate
     (Thread_Def : access constant osThreadDef_t;
      Argument : System.Address) return osThreadId
   with
     Import,
     Convention => C,
     External_Name => "osThreadCreate";

   function osThreadGetId return osThreadId
   with
     Import,
     Convention => C,
     External_Name => "osThreadGetId";

   function osThreadTerminate (Thread_Id : osThreadId) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osThreadTerminate";

   function osThreadYield return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osThreadYield";

   function osThreadSetPriority
     (Thread_Id : osThreadId; Priority : osPriority) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osThreadSetPriority";

   function osThreadGetPriority (Thread_Id : osThreadId) return osPriority
   with
     Import,
     Convention => C,
     External_Name => "osThreadGetPriority";

   function osDelay (Millisec : Interfaces.Unsigned_32) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osDelay";

   ---------------
   --  Mutexes  --
   ---------------

   type osMutexId is private;
   Null_osMutexId : constant osMutexId;

   type os_mutex_def is record
      Dummy : aliased Interfaces.Unsigned_32;
   end record
   with
     Convention => C_Pass_By_Copy;

   subtype osMutexDef_t is os_mutex_def;

   function osMutexCreate
     (Mutex_Def : access constant osMutexDef_t) return osMutexId
   with
     Import,
     Convention => C,
     External_Name => "osMutexCreate";

   function osMutexWait
     (Mutex_Def : osMutexId;
      Millisec : Interfaces.Unsigned_32 := osWaitForever) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osMutexWait";

   function osMutexRelease
     (Mutex_Def : osMutexId) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osMutexRelease";

   ------------------
   --  Semaphores  --
   ------------------

   type osSemaphoreId is private;
   Null_osSemaphoreId : constant osSemaphoreId;

   type os_semaphore_def is record
      Dummy : aliased Interfaces.Unsigned_32;
   end record
   with
     Convention => C_Pass_By_Copy;

   subtype osSemaphoreDef_t is os_mutex_def;

   function osSemaphoreCreate
     (Semaphore_Def : access constant osSemaphoreDef_t;
      Count : Interfaces.Integer_32) return osSemaphoreId
   with
     Import,
     Convention => C,
     External_Name => "osSemaphoreCreate";

   function osSemaphoreWait
     (Semaphore_Def : osSemaphoreId;
      Millisec : Interfaces.Unsigned_32 := osWaitForever) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osSemaphoreWait";

   function osSemaphoreRelease
     (Semaphore_Def : osSemaphoreId) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osSemaphoreRelease";

   --------------
   --  Kernel  --
   --------------

   function osKernelStart
     (Thread_Def : access constant osThreadDef_t;
      Argument : System.Address) return osStatus
   with
     Import,
     Convention => C,
     External_Name => "osKernelStart";

   function osKernelSysTick return Interfaces.Unsigned_32
   with
     Import,
     Convention => C,
     External_Name => "osKernelSysTick";

   function osKernelRunning return Interfaces.Integer_32
   with
     Import,
     Convention => C,
     External_Name => "osKernelRunning";

private

   --  Would have declared as "new System.Address" but then couldn't
   --  create Null_osThreadId because it wouldn't be static (as
   --  required since this unit needs to be preelaborable).

   type osThreadId is mod 2 ** Standard'Address_Size;
   --  task_h.xTaskHandle

   Null_osThreadId : constant osThreadId := 0;

   type osMutexId is mod 2 ** Standard'Address_Size;
   --  semphr_h.xSemaphoreHandle -> queue_h.xQueueHandle

   Null_osMutexId : constant osMutexId := 0;

   type osSemaphoreId is mod 2 ** Standard'Address_Size;
   --  semphr_h.xSemaphoreHandle -> queue_h.xQueueHandle

   Null_osSemaphoreId : constant osSemaphoreId := 0;

end CMSIS_OS;
