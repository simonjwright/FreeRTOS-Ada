with System.Parameters;

package FreeRTOS with Preelaborate is

   --------------------
   -- Memory control --
   --------------------

   function Malloc
     (Size : System.Parameters.Size_Type) return System.Address
   with
     Import,
     Convention => C,
     External_Name => "pvPortMalloc";

   procedure Free (Ptr : System.Address)
   with
     Import,
     Convention => C,
     External_Name => "vPortFree";

   ------------------
   -- Task control --
   ------------------

   --  (additional to that supported by CMSIS_OS).

   procedure Resume (Task_Id : System.Address)
   with
     Import,
     Convention => C,
     External_Name => "vTaskResume";

   procedure Suspend (Task_Id : System.Address)
   with
     Import,
     Convention => C,
     External_Name => "vTaskSuspend";

   ------------------
   -- ATCB support --
   ------------------

   --  Requires configUSE_APPLICATION_TASK_TAG to be set in
   --  FreeRTOSConfig.h.

   --  Return the parameter saved in the current task's FreeRTOS
   --  TCB. In our case, this will be the corresponding ATCB.
   function Get_Application_Parameter return System.Address;

   --  Save Parameter in the current task's FreeRTOS TCB. In our case,
   --  this will be the corresponding ATCB.
   procedure Set_Application_Parameter (Parameter : System.Address);

end FreeRTOS;
