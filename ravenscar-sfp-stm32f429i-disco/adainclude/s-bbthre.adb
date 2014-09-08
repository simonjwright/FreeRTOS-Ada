------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                       S Y S T E M . B B . T H R E A D S                  --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2014, AdaCore                     --
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
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

pragma Restrictions (No_Elaboration_Code);

with System.Storage_Elements;
with System.BB.Parameters;
with System.BB.Board_Support;
with System.BB.Protection;
with System.BB.Threads.Queues;

with Ada.Unchecked_Conversion;

package body System.BB.Threads is

   use System.Multiprocessors;
   use System.BB.CPU_Primitives;
   use System.BB.CPU_Primitives.Multiprocessors;
   use System.BB.Time;
   use System.BB.Parameters;
   use Board_Support;

   use type System.Address;
   use type System.Parameters.Size_Type;
   use type System.Storage_Elements.Storage_Offset;

   Slave_Stack_Size : constant System.Storage_Elements.Storage_Count := 1024;
   --  1 KB stacks for each of the environment tasks for slave processors

   type Slave_Stack_Space is
     new Storage_Elements.Storage_Array (1 .. Slave_Stack_Size);
   for Slave_Stack_Space'Alignment use 8;
   --  A minimum stack for the slave CPUs

   subtype Slave_CPUs is Multiprocessors.CPU
     range Multiprocessors.CPU'First + 1 .. Multiprocessors.CPU'Last;
   --  List of slave CPUs (all CPUs excluding the master which is the first
   --  one).

   Slave_Stacks : array (Slave_CPUs) of Slave_Stack_Space;
   --  Array that contains the environment stack space for slave CPUs (all
   --  CPUs except the first one which is considered the master). This is a
   --  null array on monoprocessor systems.

   Slave_Stacks_Table : array (Slave_CPUs) of System.Address;
   pragma Export (Asm, Slave_Stacks_Table, "slave_stack_table");
   --  Array that contains the environment stack pointers for slave CPUs (all
   --  CPUs except the first one which is considered the master). This is a
   --  null array on monoprocessor systems.

   -----------------------
   -- Stack information --
   -----------------------

   --  Boundaries of the stack for the environment task, defined by the linker
   --  script file.

   Top_Of_Environment_Stack : constant System.Address;
   pragma Import (Asm, Top_Of_Environment_Stack, "__stack_end");
   --  Top of the stack to be used by the environment task

   Bottom_Of_Environment_Stack : constant System.Address;
   pragma Import (Asm, Bottom_Of_Environment_Stack, "__stack_start");
   --  Bottom of the stack to be used by the environment task

   ------------------
   -- Get_Affinity --
   ------------------

   function Get_Affinity (Thread : Thread_Id) return CPU_Range is
   begin
      return Thread.Base_CPU;
   end Get_Affinity;

   -------------
   -- Get_CPU --
   -------------

   function Get_CPU (Thread : Thread_Id) return CPU is
   begin
      if Thread.Base_CPU = Not_A_Specific_CPU then

         --  Return the implementation specific default CPU

         return CPU'First;
      else
         return CPU (Thread.Base_CPU);
      end if;
   end Get_CPU;

   --------------
   -- Get_ATCB --
   --------------

   function Get_ATCB return System.Address is
   begin
      return System.BB.Threads.Queues.Running_Thread.ATCB;
   end Get_ATCB;

   ------------------
   -- Get_Priority --
   ------------------

   function Get_Priority (Id : Thread_Id) return System.Any_Priority is
   begin
      --  This function does not need to be protected by Enter_Kernel and
      --  Leave_Kernel, because the Active_Priority value is only updated by
      --  Set_Priority (atomically). Moreover, Active_Priority is marked as
      --  Volatile.

      return Id.Active_Priority;
   end Get_Priority;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
     (Environment_Thread : Thread_Id;
      Main_Priority      : System.Any_Priority)
   is
      Main_CPU : constant System.Multiprocessors.CPU := Current_CPU;

   begin
      --  Perform some basic hardware initialization (clock, timer, and
      --  interrupt handlers).

      Board_Support.Initialize_Board;
      Interrupts.Initialize_Interrupts;
      Time.Initialize_Timers;

      --  Set addresses of the stacks allocated to main procedures for the
      --  slave CPUs.

      pragma Warnings (Off, "loop range is null*");
      --  On monoprocessor targets, the following loop will never execute (no
      --  slave CPUs).

      --  Compute the stack pointers to be used by each slave CPU

      for CPU_Id in Slave_CPUs loop
         Slave_Stacks_Table (CPU_Id) :=
           (if System.Parameters.Stack_Grows_Down
            then ((Slave_Stacks (CPU_Id)'Address + Slave_Stack_Size) /
                     Standard'Maximum_Alignment) * Standard'Maximum_Alignment
            else Slave_Stacks (CPU_Id)'Address);
      end loop;

      pragma Warnings (On, "loop range is null*");

      --  Initialize internal queues and the environment task

      Protection.Enter_Kernel;

      --  The environment thread executes the main procedure of the program

      --  CPU of the environment thread is current one (initialization CPU)

      Environment_Thread.Base_CPU := Main_CPU;

      --  The active priority is initially equal to the base priority

      Environment_Thread.Base_Priority   := Main_Priority;
      Environment_Thread.Active_Priority := Main_Priority;

      --  The currently executing thread (and the only one) is the
      --  environment thread.

      Queues.Running_Thread_Table (Main_CPU) := Environment_Thread;
      Queues.First_Thread_Table (Main_CPU)   := Environment_Thread;
      Queues.Global_List                     := Environment_Thread;

      Environment_Thread.Next        := Null_Thread_Id;
      Environment_Thread.Global_List := Null_Thread_Id;

      --  Store stack information

      Environment_Thread.Top_Of_Stack := Top_Of_Environment_Stack'Address;

      Environment_Thread.Bottom_Of_Stack :=
        Bottom_Of_Environment_Stack'Address;

      --  The initial state is Runnable

      Environment_Thread.State := Runnable;

      --  Not currently in an interrupt handler

      Environment_Thread.In_Interrupt := False;

      --  No wakeup has been yet signaled

      Environment_Thread.Wakeup_Signaled := False;

      --  Initialize alarm status

      Environment_Thread.Alarm_Time := System.BB.Time.Time'Last;
      Environment_Thread.Next_Alarm := Null_Thread_Id;

      --  Reset execution time

      Environment_Thread.Execution_Time :=
        System.BB.Time.Initial_Composite_Execution_Time;

      --  Initialize the saved registers. We can ignore the stack and code to
      --  execute because the environment task is already executing. We are
      --  interested in the initialization of the rest of the state, such as
      --  the interrupt nesting level and the cache state.

      Initialize_Context
        (Buffer          => Environment_Thread.Context'Access,
         Program_Counter => Null_Address,
         Argument        => Null_Address,
         Stack_Pointer   => (if System.Parameters.Stack_Grows_Down
                             then Environment_Thread.Top_Of_Stack
                             else Environment_Thread.Bottom_Of_Stack));

      --  Enable use of the floating point unit in a multitasking environment

      Initialize_Floating_Point;

      --  The tasking executive is initialized

      Initialized := True;

      Protection.Leave_Kernel;
   end Initialize;

   ----------------------------------
   -- Initialize_Slave_Environment --
   ----------------------------------

   procedure Initialize_Slave_Environment (Environment_Thread : Thread_Id) is
      CPU_Id : constant System.Multiprocessors.CPU := Current_CPU;

   begin
      --  This procedure should only be called from a multiprocessor
      --  environment.

      pragma Warnings (Off);
      --  On monoprocessor targets, the following decision is always True and
      --  we expect the compiler to optimize out the else.

      if System.Multiprocessors.CPU'Range_Length = 1 then

         pragma Warnings (On);

         raise Program_Error;

      else
         --  Initialize internal queues and the environment task

         Protection.Enter_Kernel;

         Environment_Thread.Base_CPU        := CPU_Id;
         Environment_Thread.Base_Priority   := Any_Priority'First;
         Environment_Thread.Active_Priority := Any_Priority'First;

         --  The currently executing thread is a virtual one, created only to
         --  have a context for slave processors until the actual tasks are
         --  activated. Hence, we set it as running thread, but we do not
         --  insert it in the ready list nor in the global list.

         Queues.Running_Thread_Table (CPU_Id) := Environment_Thread;

         Environment_Thread.Next        := Null_Thread_Id;
         Environment_Thread.Global_List := Null_Thread_Id;

         --  Set a minimal stack

         Environment_Thread.Top_Of_Stack :=
           ((Slave_Stacks (CPU_Id)'Address + Slave_Stack_Size) /
              Standard'Maximum_Alignment) * Standard'Maximum_Alignment;

         Environment_Thread.Bottom_Of_Stack := Slave_Stacks (CPU_Id)'Address;

         --  The state is Suspended

         Environment_Thread.State := Suspended;

         --  Not in an interrupt

         Environment_Thread.In_Interrupt := False;

         --  No wakeup

         Environment_Thread.Wakeup_Signaled := False;

         --  No Alarm

         Environment_Thread.Alarm_Time := System.BB.Time.Time'Last;
         Environment_Thread.Next_Alarm := Null_Thread_Id;

         --  Reset execution time

         Environment_Thread.Execution_Time :=
           System.BB.Time.Initial_Composite_Execution_Time;

         --  Initialize the saved registers. We can ignore the stack and code
         --  to execute because the environment will never realy execute any
         --  code. We are interested in the initialization of the rest of the
         --  state, such as the interrupt nesting level and the cache state.

         Initialize_Context
           (Buffer          => Environment_Thread.Context'Access,
            Program_Counter => Null_Address,
            Argument        => Null_Address,
            Stack_Pointer   => Slave_Stacks_Table (CPU_Id));

         Protection.Leave_Kernel;
      end if;
   end Initialize_Slave_Environment;

   --------------
   -- Set_ATCB --
   --------------

   procedure Set_ATCB (ATCB : System.Address) is
   begin
      --  Set_ATCB is only called in the initialization of the task, and just
      --  by the owner of the thread, so there is no need of explicit kernel
      --  protection when calling this function.

      System.BB.Threads.Queues.Running_Thread.ATCB := ATCB;
   end Set_ATCB;

   ------------------
   -- Set_Priority --
   ------------------

   procedure Set_Priority (Priority  : System.Any_Priority) is
   begin
      Protection.Enter_Kernel;

      --  The Ravenscar profile does not allow dynamic priority changes. Tasks
      --  change their priority only when they inherit the ceiling priority of
      --  a PO (Ceiling Locking policy). Hence, the task must be running when
      --  changing the priority. It is not possible to change the priority of
      --  another thread within the Ravenscar profile, so that is why
      --  Running_Thread is used.

      --  Priority changes are only possible as a result of inheriting the
      --  ceiling priority of a protected object. Hence, it can never be set
      --  a priority which is lower than the base priority of the thread.

      pragma Assert
        (Queues.Running_Thread /= Null_Thread_Id
          and then Priority >= Queues.Running_Thread.Base_Priority);

      Queues.Change_Priority (Queues.Running_Thread, Priority);

      Protection.Leave_Kernel;
   end Set_Priority;

   -----------
   -- Sleep --
   -----------

   procedure Sleep is
      Self_Id : constant Thread_Id := Queues.Running_Thread;
   begin
      Protection.Enter_Kernel;

      --  It can only suspend if it is executing

      pragma Assert
        (Self_Id /= Null_Thread_Id and then Self_Id.State = Runnable);

      if Self_Id.Wakeup_Signaled then

         --  Another thread has already executed a Wakeup on this thread so
         --  that we just consume the token and continue execution. It means
         --  that just before this call to Sleep the task has been preempted
         --  by the task that is awaking it. Hence the Sleep/Wakeup calls do
         --  not happen in the expected order, and we use the Wakeup_Signaled
         --  to flag this event so it is not lost.

         --  The situation is the following:

         --    1) a task A is going to wait in an entry for a barrier
         --    2) task A releases the lock associated to the protected object
         --    3) task A calls Sleep to suspend itself
         --    4) a task B opens the barrier and awakes task A (calls Wakeup)

         --  This is the expected sequence of events, but 4) may happen
         --  before 3) because task A decreases its priority in step 2) as a
         --  consequence of releasing the lock (Ceiling_Locking). Hence, task
         --  A may be preempted by task B in the window between releasing the
         --  protected object and actually suspending itself, and the Wakeup
         --  call by task B in 4) can happen before the Sleep call in 3).

         Self_Id.Wakeup_Signaled := False;

      else
         --  Update status

         Self_Id.State := Suspended;

         --  Extract from the list of ready threads

         Queues.Extract (Self_Id);

         --  The currently executing thread is now blocked, and it will leave
         --  the CPU when executing the Leave_Kernel procedure.

      end if;

      Protection.Leave_Kernel;

      --  Now the thread has been awaken again and it is executing

   end Sleep;

   -------------------
   -- Thread_Create --
   -------------------

   procedure Thread_Create
     (Id            : Thread_Id;
      Code          : System.Address;
      Arg           : System.Address;
      Priority      : System.Any_Priority;
      Base_CPU      : System.Multiprocessors.CPU_Range;
      Stack_Address : System.Address;
      Stack_Size    : System.Parameters.Size_Type)
   is
   begin
      Protection.Enter_Kernel;

      --  Set the CPU affinity

      Id.Base_CPU := Base_CPU;

      --  Set the base and active priority

      Id.Base_Priority   := Priority;
      Id.Active_Priority := Priority;

      --  Insert in the global list

      Id.Global_List := Queues.Global_List;
      Queues.Global_List := Id;

      --  Insert task inside the ready list (as last within its priority)

      Queues.Insert (Id);

      --  Store stack information

      Id.Top_Of_Stack :=
        ((Stack_Address + Storage_Elements.Storage_Offset (Stack_Size)) /
            Standard'Maximum_Alignment) * Standard'Maximum_Alignment;

      Id.Bottom_Of_Stack := Stack_Address;

      --  The initial state is Runnable

      Id.State := Runnable;

      --  Not in an interrupt

      Id.In_Interrupt := False;

      --  No wakeup has been yet signaled

      Id.Wakeup_Signaled := False;

      --  Initialize the saved registers, including the program counter and
      --  stack pointer. The thread will execute the Thread_Caller procedure
      --  and the stack pointer points to the top of the stack assigned to the
      --  thread.

         Initialize_Context
           (Buffer          => Id.Context'Access,
            Program_Counter => Code,
            Argument        => Arg,
            Stack_Pointer   => (if System.Parameters.Stack_Grows_Down
                                then Id.Top_Of_Stack
                                else Id.Bottom_Of_Stack));

      --  Initialize alarm status

      Id.Alarm_Time := System.BB.Time.Time'Last;
      Id.Next_Alarm := Null_Thread_Id;

      --  Reset execution time

      Id.Execution_Time := System.BB.Time.Initial_Composite_Execution_Time;

      Protection.Leave_Kernel;
   end Thread_Create;

   -----------------
   -- Thread_Self --
   -----------------

   function Thread_Self return Thread_Id is
   begin
      --  Return the thread that is currently executing

      return Queues.Running_Thread;
   end Thread_Self;

   ------------
   -- Wakeup --
   ------------

   procedure Wakeup (Id : Thread_Id) is
   begin
      Protection.Enter_Kernel;

      if Id.State = Suspended then

         --  The thread is already waiting so that we awake it

         --  Update status

         Id.State := Runnable;

         --  Insert the thread at the tail of its active priority so that the
         --  thread will resume execution.

         Queues.Insert (Id);

      else
         --  The thread is not yet waiting so that we just signal that the
         --  Wakeup command has been executed. We are waking up a task that
         --  is going to wait in an entry for a barrier, but before calling
         --  Sleep it has been preempted by the task awaking it.

         Id.Wakeup_Signaled := True;
      end if;

      pragma Assert (Id.State = Runnable);

      Protection.Leave_Kernel;
   end Wakeup;

end System.BB.Threads;
