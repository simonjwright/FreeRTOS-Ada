package System.Tasking is

   ----------------------------------------------------------------------------
   --                         copied from GCC 4.9.1                          --
   ----------------------------------------------------------------------------

   -------------------
   -- Priority info --
   -------------------

   Unspecified_Priority : constant Integer := System.Priority'First - 1;

   --------------------------------
   -- Master Related Definitions --
   --------------------------------

   subtype Master_Level is Integer;
   subtype Master_ID is Master_Level;

   --  Normally, a task starts out with internal master nesting level one
   --  larger than external master nesting level. It is incremented by one by
   --  Enter_Master, which is called in the task body only if the compiler
   --  thinks the task may have dependent tasks. It is set to 1 for the
   --  environment task, the level 2 is reserved for server tasks of the
   --  run-time system (the so called "independent tasks"), and the level 3 is
   --  for the library level tasks. Foreign threads which are detected by
   --  the run-time have a level of 0, allowing these tasks to be easily
   --  distinguished if needed.

   Foreign_Task_Level     : constant Master_Level := 0;
   Environment_Task_Level : constant Master_Level := 1;
   Independent_Task_Level : constant Master_Level := 2;
   Library_Task_Level     : constant Master_Level := 3;

   -------------------
   -- Affinity info --
   -------------------

   Unspecified_CPU : constant := -1;
   --  No affinity specified

   -------------------------------
   -- Entry related definitions --
   -------------------------------

   Null_Entry : constant := 0;

   Max_Entry : constant := Integer'Last;

   Interrupt_Entry : constant := -2;

   type Entry_Index is range Interrupt_Entry .. Max_Entry;

   ----------------------------------------------------------------------------
   --                    compiler interface for FreeRTOS                     --
   ----------------------------------------------------------------------------

   type Activation_Chain is limited private;

   type Activation_Chain_Access is access all Activation_Chain;

   type Ada_Task_Control_Block;

   type Task_Id is access all Ada_Task_Control_Block;

   type Task_Procedure_Access is access procedure (Arg : System.Address);

   type Ada_Task_Control_Block (Dummy : Integer) is null record;

   type Access_Boolean is access all Boolean;

private

   type Activation_Chain is limited record
      T_Id : Task_Id;
   end record;

end System.Tasking;
