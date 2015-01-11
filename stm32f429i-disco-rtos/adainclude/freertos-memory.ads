with System;

package FreeRTOS.Memory with Preelaborate is

   function Malloc
     (Size : Natural) return System.Address
   with
     Import,
     Convention => C,
     External_Name => "pvPortMalloc";

   procedure Free (Ptr : System.Address)
   with
     Import,
     Convention => C,
     External_Name => "vPortFree";

end FreeRTOS.Memory;
