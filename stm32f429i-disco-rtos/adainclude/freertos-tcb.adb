package body FreeRTOS.TCB is

   function Get_Application_Parameter return System.Address is
      function xTaskGetApplicationTaskTag
        (xTask : System.Address) return System.Address
      with
        Import,
        Convention => C,
        External_Name => "xTaskGetApplicationTaskTag";
   begin
      return xTaskGetApplicationTaskTag (System.Null_Address);
   end Get_Application_Parameter;

   procedure Set_Application_Parameter (Parameter : System.Address) is
      procedure vTaskSetApplicationTaskTag (xTask : System.Address;
                                            pxHookFunction : System.Address)
      with
        Import,
        Convention => C,
        External_Name => "vTaskSetApplicationTaskTag";
   begin
      vTaskSetApplicationTaskTag (System.Null_Address, Parameter);
   end Set_Application_Parameter;

end FreeRTOS.TCB;
