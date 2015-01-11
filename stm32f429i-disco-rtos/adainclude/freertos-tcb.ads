with System;

package FreeRTOS.TCB with Preelaborate is

   --  Requires configUSE_APPLICATION_TASK_TAG to be set in
   --  FreeRTOSConfig.h.

   --  Return the parameter saved in the current task's FreeRTOS
   --  TCB. In our case, this will be the corresponding ATCB.
   function Get_Application_Parameter return System.Address;

   --  Save Parameter in the current task's FreeRTOS TCB. In our case,
   --  this will be the corresponding ATCB.
   procedure Set_Application_Parameter (Parameter : System.Address);

end FreeRTOS.TCB;
