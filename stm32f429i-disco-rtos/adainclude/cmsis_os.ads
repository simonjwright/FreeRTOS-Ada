with Interfaces;
with System;

package CMSIS_OS is

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

   --  ???
   type os_timer_type is
     (OsTimerOnce,
      OsTimerPeriodic) with
        Convention => C;

   type os_pthread is access procedure (Arg1 : System.Address)
   with
     Convention => C;

   --  ???
   type os_ptimer is access procedure (Arg1 : System.Address)
   with
     Convention => C;

   type osThreadId is private;
   Null_osThreadId : constant osThreadId;

   --  ???
   type osTimerId is private;

   type osMutexId is private;

   type os_thread_def is record
      Name      : System.Address; -- Interfaces.C.Strings.chars_ptr
      Pthread   : os_pthread;
      Tpriority : osPriority;
      Instances : Interfaces.Unsigned_32;
      Stacksize : Interfaces.Unsigned_32;
   end record
   with
     Convention => C_Pass_By_Copy;

   subtype osThreadDef_t is os_thread_def;

   --  ???
   type os_timer_def is record
      Ptimer : os_ptimer;
   end record
   with
     Convention => C_Pass_By_Copy;

   subtype osTimerDef_t is os_timer_def;

   type os_mutex_def is record
      Dummy : aliased Interfaces.Unsigned_32;
   end record
   with
     Convention => C_Pass_By_Copy;

   subtype osMutexDef_t is os_mutex_def;

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

private

   type osThreadId is new System.Address;
   --  task_h.xTaskHandle

   Null_osThreadId : constant osThreadId := osThreadId (System.Null_Address);

   type osTimerId is new System.Address;
   --  timers_h.xTimerHandle

   type osMutexId is new System.Address;
   --  semphr_h.xSemaphoreHandle -> queue_h.xQueueHandle

end CMSIS_OS;
