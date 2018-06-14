------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--     S Y S T E M . T A S K I N G . R E S T R I C T E D . S T A G E S      --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 2016-2018 Free Software Foundation, Inc.            --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This is a simplified version of the System.Tasking.Stages package,
--  intended to be used in a restricted run time.

--  This package represents the high level tasking interface used by the
--  compiler to expand Ada 95 tasking constructs into simpler run time calls.

--  This is the version for the Cortex GNAT RTS project.

with Ada.Unchecked_Conversion;
with System.Address_To_Access_Conversions;
with System.FreeRTOS.TCB;
with System.Memory;

package body System.Tasking.Restricted.Stages is

   Sequential_Elaboration_Started : Boolean := False;

   procedure Wrapper (Arg1 : System.Address) with Convention => C;
   --  This is the procedure passed to
   --  FreeRTOS.Tasks.Create_Task. Arg1 is the address of its
   --  Parameters.

   type Parameters is record
      ATCB          : Task_Id;
      Task_Proc     : Task_Procedure_Access;
      Discriminants : System.Address;
      SStack_Size   : System.Parameters.Size_Type;
   end record;

   package Parameters_Conversion
     is new System.Address_To_Access_Conversions (Object => Parameters);

   procedure Wrapper (Arg1 : System.Address) is
      function Convert_Task_Id
        is new Ada.Unchecked_Conversion (Task_Id, System.Address);

      P : constant Parameters_Conversion.Object_Pointer :=
        Parameters_Conversion.To_Pointer (Arg1);

      Secondary_Stack :
        aliased System.Secondary_Stack.Stack (Size => P.SStack_Size);
      --  At this point, the stack is the task's stack
   begin
      --  Save the ATCB in the FreeRTOS TCB
      FreeRTOS.TCB.Set_Application_Parameter (Convert_Task_Id (P.ATCB));

      --  Register the secondary stack
      P.ATCB.Secondary_Stack := Secondary_Stack'Unchecked_Access;
      --  Unchecked_Access is OK because it can only be accessed from
      --  the current task, within Task_Proc.

      --  Call the task procedure
      P.Task_Proc (P.Discriminants);

      --  If we return here, the task procedure has exited (and not
      --  because of an exception, which would already have reached
      --  the last chance handler).
      raise Program_Error with "task exited, not allowed in Ravenscar";
   end Wrapper;

   --  Null_Task_Name : constant String := (1 => ASCII.NUL);

   --  The > GCC 6 version
   procedure Create_Restricted_Task
     (Priority             :        Integer;
      Stack_Address        :        System.Address;
      Size                 :        System.Parameters.Size_Type;
      Secondary_Stack_Size :        System.Parameters.Size_Type;
      Task_Info            :        System.Task_Info.Task_Info_Type;
      CPU                  :        Integer;
      State                :        Task_Procedure_Access;
      Discriminants        :        System.Address;
      Elaborated           :        Access_Boolean;
      Chain                : in out Activation_Chain;
      Task_Image           :        String;
      Created_Task         :        Task_Id) is

      pragma Unreferenced (Stack_Address);
      pragma Unreferenced (Task_Info);
      pragma Unreferenced (CPU);
      pragma Unreferenced (Chain);

      Actual_Stack_Size : constant System.Parameters.Size_Type :=
        System.Parameters.Adjust_Storage_Size (Size);

      Wrapper_Parameter_Address : constant System.Address :=
        Memory.Alloc (Parameters'Max_Size_In_Storage_Elements);
      Wrapper_Parameter_Access :
        constant Parameters_Conversion.Object_Pointer :=
        Parameters_Conversion.To_Pointer (Wrapper_Parameter_Address);

      use type System.Parameters.Size_Type;
      use type FreeRTOS.Tasks.Task_Handle;
   begin
      if Wrapper_Parameter_Address = System.Null_Address then
         raise Storage_Error with "couldn't allocate task wrapper";
      end if;
      Wrapper_Parameter_Access.all :=
        (ATCB          => Created_Task,
         Task_Proc     => State,
         Discriminants => Discriminants,
         SStack_Size   =>
           (if Secondary_Stack_Size = System.Parameters.Unspecified_Size
            then System.Parameters.Secondary_Stack_Size (Actual_Stack_Size)
            else Secondary_Stack_Size));

      Created_Task.Common.Base_Priority := (if Priority = Unspecified_Priority
                                            then System.Default_Priority
                                            else Priority);
      Created_Task.Common.Thread :=
        FreeRTOS.Tasks.Create_Task
          (Code        => Wrapper'Access,
           Name        => Task_Image,
           Stack_Depth => Natural (Actual_Stack_Size),
           Parameters  => Wrapper_Parameter_Address,
           Priority    => Created_Task.Common.Base_Priority);
      --  The Entry_Call belongs to the task, so Self can be set up now.
      Created_Task.Entry_Call.Self := Created_Task;
      Elaborated.all := Created_Task.Common.Thread /= null;
   end Create_Restricted_Task;

   procedure Create_Restricted_Task_Sequential
     (Priority             : Integer;
      Stack_Address        : System.Address;
      Size                 : System.Parameters.Size_Type;
      Secondary_Stack_Size : System.Parameters.Size_Type;
      Task_Info            : System.Task_Info.Task_Info_Type;
      CPU                  : Integer;
      State                : Task_Procedure_Access;
      Discriminants        : System.Address;
      Elaborated           : Access_Boolean;
      Task_Image           : String;
      Created_Task         : Task_Id)
   is
      --  Create_Restricted_Task requires a Chain parameter; however,
      --  in this RTS it's ignored, because all tasks are activated as
      --  they are elaborated (i.e., concurrently).
      Dummy_Activation_Chain : Activation_Chain;
   begin

      --  If we're called at all, it's because sequential activation
      --  has been requested. If this is the first call, suspend
      --  tasking (awaiting a call to Activate_All_Tasks_Sequential).
      pragma Assert (Partition_Elaboration_Policy = 'S',
                     "Partition_Elaboration_Policy not sequential");
      if not Sequential_Elaboration_Started then
         Sequential_Elaboration_Started := True;
         FreeRTOS.Tasks.Suspend_All_Tasks;
      end if;

      Create_Restricted_Task
        (Priority             => Priority,
         Stack_Address        => Stack_Address,
         Size                 => Size,
         Secondary_Stack_Size => Secondary_Stack_Size,
         Task_Info            => Task_Info,
         CPU                  => CPU,
         State                => State,
         Discriminants        => Discriminants,
         Elaborated           => Elaborated,
         Chain                => Dummy_Activation_Chain,  -- <<<
         Task_Image           => Task_Image,
         Created_Task         => Created_Task);
   end Create_Restricted_Task_Sequential;

   procedure Activate_Restricted_Tasks
     (Chain_Access : Activation_Chain_Access) is
      pragma Unreferenced (Chain_Access);
   begin
      --  This can get called even with sequential elaboration,
      --  because if the RTS was compiled with concurrent activation
      --  (almost certainly the case) any tasks in the RTS (e.g. for
      --  Timing_Events) will call here at the end of package
      --  elaboration.
      null;
   end Activate_Restricted_Tasks;

   procedure Activate_All_Tasks_Sequential is
   begin
      pragma Assert (Partition_Elaboration_Policy = 'S',
                     "Partition_Elaboration_Policy not sequential");
      FreeRTOS.Tasks.Resume_All_Tasks;
   end Activate_All_Tasks_Sequential;

   procedure Complete_Restricted_Activation is
   begin
      null;
   end Complete_Restricted_Activation;

   procedure Complete_Restricted_Task is
   begin
      null;
   end Complete_Restricted_Task;

end System.Tasking.Restricted.Stages;
