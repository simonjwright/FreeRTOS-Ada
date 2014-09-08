------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--     S Y S T E M . T A S K _ P R I M I T I V E S . O P E R A T I O N S    --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                     Copyright (C) 2001-2011, AdaCore                     --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion. GNARL is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  This is the generic bare board version of this package

--  This package contains all the GNULL primitives that interface directly with
--  the underlying kernel.

pragma Restrictions (No_Elaboration_Code);

with Ada.Unchecked_Conversion;

with System.Storage_Elements;
with System.Tasking.Debug;

package body System.Task_Primitives.Operations is

   use System.OS_Interface;
   use System.Parameters;
   use System.Storage_Elements;

   use type System.Tasking.Task_Id;

   ---------------------
   -- Local Functions --
   ---------------------

   function To_Address is new
     Ada.Unchecked_Conversion (ST.Task_Id, System.Address);

   function To_Task_Id is new
     Ada.Unchecked_Conversion (System.Address, ST.Task_Id);

   ----------
   -- Self --
   ----------

   function Self return ST.Task_Id is
   begin
      return To_Task_Id (System.OS_Interface.Get_ATCB);
   end Self;

   -----------
   -- Sleep --
   -----------

   procedure Sleep
     (Self_ID : ST.Task_Id;
      Reason  : System.Tasking.Task_States)
   is
      pragma Unreferenced (Reason);
   begin
      --  A task can only suspend itself

      pragma Assert (Self_ID = Self);

      System.OS_Interface.Sleep;
   end Sleep;

   -----------------
   -- Delay_Until --
   -----------------

   procedure Delay_Until (Abs_Time : Time) is
      Self_ID : constant ST.Task_Id := Self;
   begin
      Self_ID.Common.State := ST.Delay_Sleep;
      System.OS_Interface.Delay_Until (System.OS_Interface.Time (Abs_Time));
      Self_ID.Common.State := ST.Runnable;
   end Delay_Until;

   ---------------------
   -- Monotonic_Clock --
   ---------------------

   function Monotonic_Clock return Time is
   begin
      return Time (System.OS_Interface.Clock);
   end Monotonic_Clock;

   ------------
   -- Wakeup --
   ------------

   procedure Wakeup (T : ST.Task_Id; Reason : System.Tasking.Task_States) is
      pragma Unreferenced (Reason);
   begin
      System.OS_Interface.Wakeup (T.Common.LL.Thread);
   end Wakeup;

   ------------------
   -- Set_Priority --
   ------------------

   procedure Set_Priority (T : ST.Task_Id; Prio : System.Any_Priority) is
   begin
      --  A task can only change its own priority

      pragma Assert (T = Self);

      --  Change the priority in the underlying executive

      System.OS_Interface.Set_Priority (Prio);
   end Set_Priority;

   ------------------
   -- Get_Priority --
   ------------------

   function Get_Priority (T : ST.Task_Id) return System.Any_Priority is
   begin
      --  Get current active priority

      return System.OS_Interface.Get_Priority (T.Common.LL.Thread);
   end Get_Priority;

   ------------------
   -- Get_Affinity --
   ------------------

   function Get_Affinity
     (T : ST.Task_Id) return System.Multiprocessors.CPU_Range
   is
   begin
      return System.OS_Interface.Get_Affinity (T.Common.LL.Thread);
   end Get_Affinity;

   -------------
   -- Get_CPU --
   -------------

   function Get_CPU (T : ST.Task_Id) return System.Multiprocessors.CPU is
   begin

      return System.OS_Interface.Get_CPU (T.Common.LL.Thread);
   end Get_CPU;

   -------------------
   -- Get_Thread_Id --
   -------------------

   function Get_Thread_Id (T : ST.Task_Id) return OSI.Thread_Id is
   begin
      return T.Common.LL.Thread;
   end Get_Thread_Id;

   ----------------
   -- Enter_Task --
   ----------------

   procedure Enter_Task (Self_ID : ST.Task_Id) is
   begin
      --  Notify the underlying executive about the Ada task that is being
      --  executed by the running thread.

      System.OS_Interface.Set_ATCB (To_Address (Self_ID));

      --  Set lwp (for gdb)

      Self_ID.Common.LL.Lwp := Lwp_Self;

      --  Register the task to System.Tasking.Debug

      System.Tasking.Debug.Add_Task_Id (Self_ID);

      --  Ensure that the task has the right priority priority at the end
      --  of its initialization (before calling the task's code).

      System.OS_Interface.Set_Priority (Self_ID.Common.Base_Priority);
   end Enter_Task;

   --------------------
   -- Initialize_TCB --
   --------------------

   procedure Initialize_TCB (Self_ID : ST.Task_Id; Succeeded : out Boolean) is
      pragma Unreferenced (Self_ID);
   begin
      --  Nothing to be done as part of the initialization of TCBs

      Succeeded := True;
   end Initialize_TCB;

   -----------------
   -- Create_Task --
   -----------------

   procedure Create_Task
     (T          : ST.Task_Id;
      Wrapper    : System.Address;
      Stack_Size : System.Parameters.Size_Type;
      Priority   : System.Any_Priority;
      Base_CPU   : System.Multiprocessors.CPU_Range;
      Succeeded  : out Boolean)
   is
   begin
      --  The stack has been preallocated for these targets

      pragma Assert
        (T.Common.Compiler_Data.Pri_Stack_Info.Start_Address /= Null_Address
         and then Storage_Offset (Stack_Size) =
           T.Common.Compiler_Data.Pri_Stack_Info.Size);

      T.Common.LL.Thread := T.Common.LL.Thread_Desc'Access;

      --  Create the underlying task

      System.OS_Interface.Thread_Create
        (T.Common.LL.Thread,
         Wrapper,
         To_Address (T),
         Priority,
         Base_CPU,
         T.Common.Compiler_Data.Pri_Stack_Info.Start_Address,
         Size_Type (T.Common.Compiler_Data.Pri_Stack_Info.Size));

      Succeeded :=  True;
   end Create_Task;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Environment_Task : ST.Task_Id) is
   begin
      Environment_Task.Common.LL.Thread :=
        Environment_Task.Common.LL.Thread_Desc'Access;

      --  Clear Activation_Link, as required by Add_Task_Id

      Environment_Task.Common.Activation_Link := null;

      --  First the underlying multitasking executive must be initialized

      System.OS_Interface.Initialize
        (Environment_Task.Common.LL.Thread,
         Environment_Task.Common.Base_Priority);

      --  The environment task must also execute its initialization

      Enter_Task (Environment_Task);
   end Initialize;

   ----------------------
   -- Initialize_Slave --
   ----------------------

   procedure Initialize_Slave (Environment_Task : ST.Task_Id) is
   begin
      Environment_Task.Common.LL.Thread :=
        Environment_Task.Common.LL.Thread_Desc'Access;

      --  Clear Activation_Link, as required by Add_Task_Id

      Environment_Task.Common.Activation_Link := null;

      --  Initialize the environment thread

      System.OS_Interface.Initialize_Slave_Environment
        (Environment_Task.Common.LL.Thread);

      --  The environment task must also execute its initialization

      Enter_Task (Environment_Task);
   end Initialize_Slave;

   ---------------------
   -- Is_Task_Context --
   ---------------------

   function Is_Task_Context return Boolean is
   begin
      return System.OS_Interface.Current_Interrupt = No_Interrupt;
   end Is_Task_Context;

end System.Task_Primitives.Operations;
