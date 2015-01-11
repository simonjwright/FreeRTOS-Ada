with Interfaces;

package body FreeRTOS.Tasks is

   --  from portmacro.h,
   --  portSTACK_TYPE is unsigned long (stack size units)

   Stack_Unit_Size : constant := 4;

   function Create_Task
     (Code        : Task_Code;
      Name        : String;
      Stack_Depth : Natural;                       -- in bytes
      Parameters  : System.Address;                -- passed to Code
      Priority    : System.Any_Priority)
     return Task_Handle is
      --  Code: the procedure to be executed
      --  Name: of task
      --  Stack_Depth: in bytes
      --  Parameters: passed to Code
      --  Priority: of task
      --  May raise Program_Error if the task couldn't be created.

      --  From task.h: xTaskCreate() is a macro round
      --  signed portBASE_TYPE xTaskGenericCreate(
      --    pdTASK_CODE pxTaskCode,
      --    const signed char * const pcName,
      --    unsigned short usStackDepth,
      --    void *pvParameters,
      --    unsigned portBASE_TYPE uxPriority,
      --    xTaskHandle *pxCreatedTask,
      --    portSTACK_TYPE *puxStackBuffer,
      --    const xMemoryRegion * const xRegions ) PRIVILEGED_FUNCTION;

      function xTaskGenericCreate
        (Code          :     Task_Code;
         Name          :     System.Address;         -- null-terminated
         Stack_Depth   :     Interfaces.Unsigned_16; -- in stack size units
         Parameters    :     System.Address;
         Priority      :     Unsigned_Base_Type;
         Created_Task  : out Task_Handle;
         Stack_Buffer  :     System.Address;
         Memory_Region :     System.Address)
        return Status_Code with
          Import,
          Convention => C,
          External_Name => "xTaskGenericCreate";

      Task_Name : constant String := Name & ASCII.NUL;
      Status : Status_Code := Fail;
      Result : Task_Handle := Null_Task_Handle;

   begin
      Status :=
        xTaskGenericCreate
          (Code          => Code,
           Name          => Task_Name (Task_Name'First)'Address,
           Stack_Depth   => Interfaces.Unsigned_16
             ((Stack_Depth + Stack_Unit_Size - 1) / Stack_Unit_Size),
           Parameters    => Parameters,
           Priority      => Unsigned_Base_Type (Priority),
           Created_Task  => Result,
           Stack_Buffer  => System.Null_Address,
           Memory_Region => System.Null_Address);

      if Status /= Pass then
         raise Program_Error with "couldn't create task";
      end if;

      return Result;
   end Create_Task;

end FreeRTOS.Tasks;
