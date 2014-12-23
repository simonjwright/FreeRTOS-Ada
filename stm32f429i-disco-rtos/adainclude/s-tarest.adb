with CMSIS_OS;
with FreeRTOS;
with Interfaces;
with System.Address_To_Access_Conversions;

package body System.Tasking.Restricted.Stages is

   procedure Wrapper (Arg1 : System.Address) with Convention => C;
   --  This is the procedure passed to osThreadCreate. Arg1 is the
   --  address of its Parameters.

   type Parameters is record
      Task_Proc     : Task_Procedure_Access;
      Discriminants : System.Address;
   end record;

   package Parameters_Conversion
     is new System.Address_To_Access_Conversions (Object => Parameters);

   procedure Wrapper (Arg1 : System.Address) is
      P : constant Parameters_Conversion.Object_Pointer :=
        Parameters_Conversion.To_Pointer (Arg1);
   begin
      P.Task_Proc (P.Discriminants);
   end Wrapper;

   procedure Create_Restricted_Task
     (Priority      : Integer;
      Stack_Address : System.Address;
      Size          : System.Parameters.Size_Type;
      Task_Info     : System.Task_Info.Task_Info_Type;
      CPU           : Integer;
      State         : Task_Procedure_Access;
      Discriminants : System.Address;
      Elaborated    : Access_Boolean;
      Chain         : in out Activation_Chain;
      Task_Image    : String;
      Created_Task  : Task_Id) is

      pragma Unreferenced (Stack_Address);
      pragma Unreferenced (Task_Info);
      pragma Unreferenced (CPU);
      pragma Unreferenced (Chain);
      pragma Unreferenced (Created_Task);

      --  Note, much complication because (although it's not
      --  explicitly stated) FreeRTOS expects the thread parameters to
      --  be available at least until the thread terminates (which, in
      --  Ravenscar, it won't do except under error conditions). (???)

      subtype Name is String (1 .. Task_Image'Length + 1);
      package Name_Conversion
        is new System.Address_To_Access_Conversions (Name);
      Name_Address : constant System.Address := FreeRTOS.Malloc (Name'Length);

      package Thread_Definition_Conversion
        is new System.Address_To_Access_Conversions (CMSIS_OS.osThreadDef_t);
      Thread_Definition_Address : constant System.Address :=
        FreeRTOS.Malloc (CMSIS_OS.osThreadDef_t'Max_Size_In_Storage_Elements);
      Thread_Definition_Access :
        constant Thread_Definition_Conversion.Object_Pointer :=
        Thread_Definition_Conversion.To_Pointer (Thread_Definition_Address);

      Wrapper_Parameter_Address : constant System.Address :=
        FreeRTOS.Malloc (Parameters'Max_Size_In_Storage_Elements);
      Wrapper_Parameter_Access :
        constant Parameters_Conversion.Object_Pointer :=
        Parameters_Conversion.To_Pointer (Wrapper_Parameter_Address);

      Thread : CMSIS_OS.osThreadId;

      use type System.Address;
      use type CMSIS_OS.osThreadId;
   begin
      if Name_Address = System.Null_Address then
         raise Storage_Error with "couldn't allocate name";
      end if;
      Name_Conversion.To_Pointer (Name_Address).all := Task_Image & ASCII.NUL;

      if Thread_Definition_Address = System.Null_Address then
         raise Storage_Error with "couldn't allocate thread definition";
      end if;
      Thread_Definition_Access.all :=
        (Name       => Name_Address,
         Pthread    => Wrapper'Access,
         Tpriority  =>
           Interfaces.Integer_32 ((if Priority = Unspecified_Priority
                                   then System.Default_Priority
                                   else Priority)),
         Instances  => 0,
         Stacksize  =>
           Interfaces.Unsigned_32
             (System.Parameters.Adjust_Storage_Size (Size)));

      if Wrapper_Parameter_Address = System.Null_Address then
         raise Storage_Error with "couldn't allocate wrapper";
      end if;
      Wrapper_Parameter_Access.all := (Task_Proc     => State,
                                       Discriminants => Discriminants);

      Thread :=
        CMSIS_OS.osThreadCreate (Thread_Def => Thread_Definition_Access,
                                 Argument   => Wrapper_Parameter_Address);
      Elaborated.all := Thread /= CMSIS_OS.Null_osThreadId;
   end Create_Restricted_Task;

   procedure Activate_Restricted_Tasks
     (Chain_Access : Activation_Chain_Access) is
      pragma Unreferenced (Chain_Access);
   begin
      null;
   end Activate_Restricted_Tasks;

   procedure Complete_Restricted_Activation is
   begin
      null;
   end Complete_Restricted_Activation;

   procedure Complete_Restricted_Task is
   begin
      null;
   end Complete_Restricted_Task;

end System.Tasking.Restricted.Stages;
