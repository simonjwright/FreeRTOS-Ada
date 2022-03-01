------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--     S Y S T E M . T A S K I N G . R E S T R I C T E D . S T A G E S      --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--      Copyright (C) 2016-2018, 2020 Free Software Foundation, Inc.        --
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
      SStack_Addr   : System.Secondary_Stack.SS_Stack_Ptr;
      SStack_Size   : System.Parameters.Size_Type;
   end record;

   package Parameters_Conversion
     is new System.Address_To_Access_Conversions (Object => Parameters);

   procedure Wrapper (Arg1 : System.Address) is
      function Convert_Task_Id
      is new Ada.Unchecked_Conversion (Task_Id, System.Address);

      P : constant Parameters_Conversion.Object_Pointer :=
        Parameters_Conversion.To_Pointer (Arg1);

      use type System.Secondary_Stack.SS_Stack_Ptr;
   begin
      --  Save the ATCB in the FreeRTOS TCB
      FreeRTOS.TCB.Set_Application_Parameter (Convert_Task_Id (P.ATCB));

      --  Secondary stack handling:
      --
      --  If P.SStack_Addr is Null_Address, then we are to allocate a
      --  region from the bottom of the task's stack, size P.SStack_Size.
      --
      --  If P.SStack_Addr isn't Null_Address, it's a region of the
      --  task's package's BSS allocated and initialized by the
      --  compiler.

      if P.SStack_Addr = null then
         declare
            --  At this point, the stack is the task's stack. Declare
            --  a stack here.
            Secondary_Stack :
            aliased System.Secondary_Stack.SS_Stack (Size => P.SStack_Size);
         begin
            --  Register the secondary stack
            P.ATCB.Secondary_Stack := Secondary_Stack'Unchecked_Access;
            --  Unchecked_Access is OK because it can only be accessed from
            --  the current task, within Task_Proc.

            --  Call the task procedure. The secondary stack is still
            --  on the stack.
            P.Task_Proc (P.Discriminants);
         end;
      else
         --  Register the compiler-allocated secondary stack
         P.ATCB.Secondary_Stack := P.SStack_Addr;

         --  Call the task procedure
         P.Task_Proc (P.Discriminants);
      end if;

      --  If we return here, the task procedure has exited (and not
      --  because of an exception, which would already have reached
      --  the last chance handler).
      raise Program_Error with "task exited, not allowed in Ravenscar";
   end Wrapper;

   --  Null_Task_Name : constant String := (1 => ASCII.NUL);

   --  The > GCC 7 version
   procedure Create_Restricted_Task
     (Priority             :        Integer;
      Stack_Address        :        System.Address;
      Size                 :        System.Parameters.Size_Type;
      Sec_Stack_Address    :        System.Secondary_Stack.SS_Stack_Ptr;
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
         SStack_Addr   => Sec_Stack_Address,
         SStack_Size   =>
           (if Secondary_Stack_Size = System.Parameters.Unspecified_Size
            then System.Parameters.Secondary_Stack_Size (Actual_Stack_Size)
            else Secondary_Stack_Size));  -- don't think this will happen?

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

      --  Place at front of the chain of created tasks, so they can be
      --  accessed via GDB (this is a Ravenscar RTS, so tasks can only
      --  be created during elaboration and can't be deleted).
      Created_Task.Common.All_Tasks_Link := Task_Chain;
      Task_Chain := Created_Task;
   end Create_Restricted_Task;

   procedure Create_Restricted_Task_Sequential
     (Priority             : Integer;
      Stack_Address        : System.Address;
      Size                 : System.Parameters.Size_Type;
      Sec_Stack_Address    : System.Secondary_Stack.SS_Stack_Ptr;
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
      --  they are elaborated (i.e., concurrently) BUT FreeRTOS
      --  tasking is suspended.
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
         Sec_Stack_Address    => Sec_Stack_Address,
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
      --  If the elaboration policy is Sequential, Suspend_All_Tasks
      --  would have been called (in Create_Restricted_Task_Sequential)
      --  when the first user task was created during elaboration.
      --  However, if there are no user tasks but there are tasks in
      --  the RTS (e.g. Ada.Real_Time.Timing_Events) they will have
      --  been compiled with concurrent elaboration via
      --  Create_Restricted_Task, and Suspend_All_Tasks won't have
      --  been called. Unusual, but!!
      if Sequential_Elaboration_Started then
         FreeRTOS.Tasks.Resume_All_Tasks;
      end if;
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
