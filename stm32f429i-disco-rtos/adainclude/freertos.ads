with System.Parameters;

package FreeRTOS with Elaborate_Body is

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

end FreeRTOS;
