with System;

package body FreeRTOS.Mutexes is

   function Create_Mutex return Mutex_Handle is
      function xQueueCreateMutex return Mutex_Handle
      with
        Import,
        Convention => C,
        External_Name => "xQueueCreateMutex";
      Result : constant Mutex_Handle :=
        xQueueCreateMutex;
   begin
      if Result = Null_Mutex_Handle then
         raise Program_Error with "couldn't create mutex";
      end if;
      return Result;
   end Create_Mutex;

   procedure Give (The_Mutex : Mutex_Handle) is
      --  xSemaphoreGive() is implemented as a macro wrapping
      --  xQueueGenericSend().
      function xQueueGenericSend
        (Queue         : Mutex_Handle;
         Item_To_Queue : System.Address;
         Ticks_To_Wait : Unsigned_Base_Type;
         Copy_Position : Base_Type) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "xQueueGenericSend";
      --  In the macro, Ticks_To_Wait is set to semGIVE_BLOCK_TIME (0),
      --  Copy_Position to queueSEND_TO_BACK (0).
      Status : Status_Code;
   begin
      if The_Mutex = Null_Mutex_Handle then
         raise Program_Error with "attempt to give null mutex";
      end if;

      Status := xQueueGenericSend
        (Queue => The_Mutex,
         Item_To_Queue => System.Null_Address,
         Ticks_To_Wait => 0,
         Copy_Position => 0);

      if Status /= Pass then
         raise Program_Error with "error giving mutex";
      end if;
   end Give;

   procedure Take (The_Mutex : Mutex_Handle) is
      --  xSemaphoreTake() is implemented as a macro wrapping
      --  xQueueGenericReceive().
      function xQueueGenericReceive
        (Queue         : Mutex_Handle;
         Buffer        : System.Address;
         Ticks_To_Wait : Unsigned_Base_Type;
         Just_Peek     : Base_Type) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "xQueueGenericReceive";
      --  Ticks_To_Wait will be 0 anyway, for "indefinitely", but it's
      --  a long in this port because configUSE_16_BIT_TICKS == 0.
      Status : Status_Code;
   begin
      if The_Mutex = Null_Mutex_Handle then
         raise Program_Error with "attempt to take null mutex";
      end if;

      Status := xQueueGenericReceive
        (Queue         => The_Mutex,
         Buffer        => System.Null_Address,
         Ticks_To_Wait => 0,
         Just_Peek     => 0);

      if Status /= Pass then
         raise Program_Error with "error taking mutex";
      end if;
   end Take;

end FreeRTOS.Mutexes;
