package body FreeRTOS is

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

   --  We don't need to initialize the memory arena; the only
   --  non-empty implementation of vPortInitialiseBlocks() is in
   --  heap1.c, and that says it's only needed if static memory isn't
   --  cleared.
   --
   --  I have to say I don't understand this:
   --
   --  void vPortInitialiseBlocks( void )
   --  {
   --      /* Only required when static memory is not cleared. */
   --      xNextFreeByte = ( size_t ) 0;
   --  }
   --
   --  but
   --
   --  static size_t xNextFreeByte = ( size_t ) 0;

   --  procedure Initialize
   --  with
   --    Import,
   --    Convention => C,
   --    External_Name => "vPortInitialiseBlocks";

end FreeRTOS;
