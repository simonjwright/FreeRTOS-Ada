with System;

package FreeRTOS.Tasks with Preelaborate is

   type TCB (<>) is private;
   type Task_Handle is access all TCB;

   type Task_Code is not null access procedure (Arg1 : System.Address)
   with
     Convention => C;

   function Create_Task
     (Code        : Task_Code;
      Name        : String;
      Stack_Depth : Natural;
      Parameters  : System.Address;
      Priority    : System.Any_Priority)
     return not null Task_Handle;
   --  Code: the procedure to be executed
   --  Name: of task
   --  Stack_Depth: in bytes
   --  Parameters: passed to Code
   --  Priority: of task
   --  May raise Program_Error if the task couldn't be created.

   function Get_Priority (T : Task_Handle) return System.Any_Priority;
   --  null T means "current task".

   procedure Set_Priority (T  : Task_Handle;
                           To : System.Any_Priority);
   --  null T means "current task".

   procedure Resume (T : not null Task_Handle)
   with
     Import,
     Convention => C,
     External_Name => "vTaskResume";

   procedure Suspend (T : Task_Handle)
   with
     Import,
     Convention => C,
     External_Name => "vTaskSuspend";
   --  null T means "current task".

   procedure Disable_Interrupts
   with
     Import,
     Convention => C,
     External_Name => "_gnat_disable_interrupts";

   procedure Enable_Interrupts
   with
     Import,
     Convention => C,
     External_Name => "_gnat_enable_interrupts";

   function In_ISR return Boolean;

   procedure Yield_From_ISR (Higher_Priority_Task_Woken : Integer)
   with
     Import,
     Convention => C,
     External_Name => "_gnat_yield_from_isr";

   procedure Start_Scheduler
   with
     Import,
     Convention => C,
     External_Name => "vTaskStartScheduler",
     No_Return;

private

   type TCB is null record;
   --  Of course it isn't really, but it is opaque to us.

end FreeRTOS.Tasks;
