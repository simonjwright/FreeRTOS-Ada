------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--     S Y S T E M . T A S K I N G . R E S T R I C T E D . S T A G E S      --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--       Copyright (C) 1992-2012, 2016, Free Software Foundation, Inc.      --
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
--  compiler to expand Ada 95 tasking constructs into simpler run time calls
--  (aka GNARLI, GNU Ada Run-time Library Interface)

--  Note: the compiler generates direct calls to this interface, via Rtsfind.
--  Any changes to this interface may require corresponding compiler changes
--  in exp_ch9.adb and possibly exp_ch7.adb

--  The restricted GNARLI is also composed of System.Protected_Objects and
--  System.Protected_Objects.Single_Entry

--  Modified for the Cortex GNAT RTS, by leaving out parts that aren't
--  called.

pragma Restrictions (No_Elaboration_Code);

with System.Parameters;
with System.Task_Info;

package System.Tasking.Restricted.Stages is
   pragma Preelaborate;

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
      Created_Task  : Task_Id);
   --  Compiler interface only. Do not call from within the RTS.  This
   --  must be called to create a new task, when the partition
   --  elaboration policy is not specified (or is concurrent).
   --
   --  Priority is the task's priority (assumed to be in the
   --  System.Any_Priority'Range)
   --
   --  Stack_Address is the start address of the stack associated to
   --  the task, in case it has been preallocated by the compiler; it
   --  is equal to Null_Address when the stack needs to be allocated
   --  by the underlying operating system.
   --
   --  Size is the stack size of the task to create
   --
   --  Task_Info is the task info associated with the created task, or
   --  Unspecified_Task_Info if none.
   --
   --  CPU is the task affinity. We pass it as an Integer to avoid an
   --  explicit dependency from System.Multiprocessors when not
   --  needed. Static range checks are performed when analyzing the
   --  pragma, and dynamic ones are performed before setting the
   --  affinity at run time.
   --
   --  State is the compiler generated task's procedure body
   --
   --  Discriminants is a pointer to a limited record whose
   --  discriminants are those of the task to create. This parameter
   --  should be passed as the single argument to State.
   --
   --  Elaborated is a pointer to a Boolean that must be set to true
   --  on exit if the task could be successfully elaborated.
   --
   --  Chain is a linked list of task that needs to be created. On
   --  exit, Created_Task.Activation_Link will be Chain.T_ID, and
   --  Chain.T_ID will be Created_Task (the created task will be
   --  linked at the front of Chain).
   --
   --  Task_Image is a string created by the compiler that the run
   --  time can store to ease the debugging and the
   --  Ada.Task_Identification facility.
   --
   --  Created_Task is the resulting task.
   --
   --  This procedure can raise Storage_Error if the task creation
   --  fails

   procedure Activate_Restricted_Tasks
     (Chain_Access : Activation_Chain_Access);
   --  Compiler interface only. Do not call from within the RTS.  This
   --  must be called by the creator of a chain of one or more new
   --  tasks, to activate them. The chain is a linked list that up to
   --  this point is only known to the task that created them, though
   --  the individual tasks are already in the All_Tasks_List.
   --
   --  The compiler builds the chain in LIFO order (as a
   --  stack). Another version of this procedure had code to reverse
   --  the chain, so as to activate the tasks in the order of
   --  declaration. This might be nice, but it is not needed if
   --  priority-based scheduling is supported, since all the activated
   --  tasks synchronize on the activators lock before they start
   --  activating and so they should start activating in priority
   --  order.
   --
   --  When the partition elaboration policy is sequential, this
   --  procedure does nothing, tasks will be activated at end of
   --  elaboration.

   procedure Complete_Restricted_Activation;
   --  Compiler interface only. Do not call from within the RTS. This
   --  should be called from the task body at the end of the
   --  elaboration code for its declarative part. Decrement the count
   --  of tasks to be activated by the activator and wake it up so it
   --  can check to see if all tasks have been activated. Except for
   --  the environment task, which should never call this procedure,
   --  T.Activator should only be null iff T has completed activation.

   procedure Complete_Restricted_Task;
   --  Compiler interface only. Do not call from within the RTS. This
   --  should be called from an implicit at-end handler associated
   --  with the task body, when it completes. From this point, the
   --  current task will become not callable. If the current task have
   --  not completed activation, this should be done now in order to
   --  wake up the activator (the environment task).

end System.Tasking.Restricted.Stages;
