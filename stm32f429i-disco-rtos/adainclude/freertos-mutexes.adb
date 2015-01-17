package body FreeRTOS.Mutexes is

   Max_Delay : constant Unsigned_Base_Type := 16#ffff_ffff#;

   function Create_Mutex return not null Mutex_Handle is
      function xSemaphoreCreateMutex return Mutex_Handle
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreCreateMutex";
      Result : constant Mutex_Handle := xSemaphoreCreateMutex;
   begin
      if Result = null then
         raise Program_Error with "couldn't create mutex";
      end if;
      return Result;
   end Create_Mutex;

   procedure Give (The_Mutex : not null Mutex_Handle) is
      function xSemaphoreGive (Semaphore : Mutex_Handle) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreGive";
      Status : Status_Code;
   begin
      Status := xSemaphoreGive (Semaphore => The_Mutex);

      if Status /= Pass then
         raise Program_Error with "error giving mutex";
      end if;
   end Give;

   procedure Take (The_Mutex : not null Mutex_Handle) is
      function xSemaphoreTake
        (Semaphore  : Mutex_Handle;
         Block_Time : Unsigned_Base_Type) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreTake";
      --  Block_Time will be 0 anyway, for "indefinitely", but it's
      --  a long in this port because configUSE_16_BIT_TICKS == 0.
      Status : Status_Code;
   begin
      Status := xSemaphoreTake (Semaphore  => The_Mutex,
                                Block_Time => Max_Delay);

      if Status /= Pass then
         raise Program_Error with "error taking mutex";
      end if;
   end Take;

end FreeRTOS.Mutexes;
