with Ada.Unchecked_Conversion;
with System;

package FreeRTOS.Tasks with Preelaborate is

   type Task_Handle is private;
   Null_Task_Handle : constant Task_Handle;

   --  Conversion utilities for our own use.
   function To_Task_Handle (A : System.Address) return Task_Handle;
   function To_Address (T : Task_Handle) return System.Address;

   type Task_Code is access procedure (Arg1 : System.Address)
   with
     Convention => C;

   function Create_Task
     (Code        : Task_Code;
      Name        : String;
      Stack_Depth : Natural;
      Parameters  : System.Address;
      Priority    : System.Any_Priority)
     return Task_Handle;
   --  Code: the procedure to be executed
   --  Name: of task
   --  Stack_Depth: in bytes
   --  Parameters: passed to Code
   --  Priority: of task
   --  May raise Program_Error if the task couldn't be created.

   procedure Resume (T : Task_Handle)
   with
     Import,
     Convention => C,
     External_Name => "vTaskResume";

   procedure Suspend (T : Task_Handle)
   with
     Import,
     Convention => C,
     External_Name => "vTaskSuspend";

   procedure Start_Scheduler
   with
     Import,
     Convention => C,
     External_Name => "vTaskStartScheduler",
     No_Return;

private

   type Task_Handle is mod 2 ** Standard'Address_Size;
   Null_Task_Handle : constant Task_Handle := 0;

   function Convert
     is new Ada.Unchecked_Conversion (System.Address, Task_Handle);
   function To_Task_Handle (A : System.Address) return Task_Handle
     renames Convert;

   function Convert
     is new Ada.Unchecked_Conversion (Task_Handle, System.Address);
   function To_Address (T : Task_Handle) return System.Address
     renames Convert;

end FreeRTOS.Tasks;
