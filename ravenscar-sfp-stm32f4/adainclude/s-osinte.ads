------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                    S Y S T E M . O S _ I N T E R F A C E                 --
--                                                                          --
--                                   S p e c                                --
--                                                                          --
--             Copyright (C) 1991-1994, Florida State University            --
--          Copyright (C) 1995-2013, Free Software Foundation, Inc.         --
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
------------------------------------------------------------------------------

--  Ravenscar version of this package for bare board targets

--  This package encapsulates all direct interfaces to OS services that are
--  needed by the tasking run-time (libgnarl).

pragma Restrictions (No_Elaboration_Code);
--  This could use a comment, why is it here???

with System.Multiprocessors;
with System.Parameters;

with System.BB.Threads.Queues;
with System.BB.Time;
with System.BB.Interrupts;
with System.BB.Board_Support;
with System.BB.CPU_Primitives.Multiprocessors;

package System.OS_Interface is
   pragma Preelaborate;

   ----------------
   -- Interrupts --
   ----------------

   Max_Interrupt : constant := System.BB.Interrupts.Max_Interrupt;
   --  Number of asynchronous interrupts

   subtype Interrupt_ID is System.BB.Interrupts.Interrupt_ID;
   --  Interrupt identifiers

   No_Interrupt : constant Interrupt_ID := System.BB.Interrupts.No_Interrupt;
   --  Special value indicating no interrupt

   subtype Interrupt_Handler is System.BB.Interrupts.Interrupt_Handler;
   --  Interrupt handlers

   --------------------------
   -- Interrupt processing --
   --------------------------

   function Current_Interrupt return Interrupt_ID
     renames System.BB.Interrupts.Current_Interrupt;
   --  Function that returns the hardware interrupt currently being
   --  handled (if any). In case no hardware interrupt is being handled
   --  the returned value is No_Interrupt.

   procedure Attach_Handler
     (Handler : Interrupt_Handler;
      Id      : Interrupt_ID;
      PO_Prio : Interrupt_Priority)
     renames System.BB.Interrupts.Attach_Handler;
   --  Attach a handler to a hardware interrupt

   ----------
   -- Time --
   ----------

   subtype Time is System.BB.Time.Time;
   --  Representation of the time in the underlying tasking system

   subtype Time_Span is System.BB.Time.Time_Span;
   --  Represents the length of time intervals in the underlying tasking
   --  system.

   function Ticks_Per_Second return Natural
      renames System.BB.Board_Support.Ticks_Per_Second;
   --  Number of clock ticks per second

   function Clock return Time renames System.BB.Time.Clock;
   --  Get the number of ticks elapsed since startup

   procedure Delay_Until (T : Time) renames System.BB.Time.Delay_Until;
   --  Suspend the calling task until the absolute time specified by T

   -------------
   -- Threads --
   -------------

   subtype Thread_Descriptor is System.BB.Threads.Thread_Descriptor;
   --  Type that contains the information about a thread (registers,
   --  priority, etc.).

   subtype Thread_Id is System.BB.Threads.Thread_Id;
   --  Identifiers for the underlying threads

   Null_Thread_Id : constant Thread_Id :=
                      System.BB.Threads.Null_Thread_Id;
   --  Identifier for a non valid thread

   Lwp_Self : constant System.Address := Null_Address;
   --  LWP is not used by gdb on ravenscar

   procedure Initialize
     (Environment_Thread : Thread_Id;
      Main_Priority      : System.Any_Priority)
     renames System.BB.Threads.Initialize;
   --  Procedure for initializing the underlying tasking system

   procedure Initialize_Slave_Environment (Environment_Thread : Thread_Id)
     renames System.BB.Threads.Initialize_Slave_Environment;
   --  Procedure to initialize the fake environment thread on a slave CPU.
   --  This thread is used to handle interrupt if the CPU doesn't have any
   --  other task.

   procedure Thread_Create
     (Id            : Thread_Id;
      Code          : System.Address;
      Arg           : System.Address;
      Priority      : System.Any_Priority;
      Base_CPU      : System.Multiprocessors.CPU_Range;
      Stack_Address : System.Address;
      Stack_Size    : System.Parameters.Size_Type)
     renames System.BB.Threads.Thread_Create;
   --  Create a new thread

   function Thread_Self return Thread_Id renames System.BB.Threads.Thread_Self;
   --  Return the thread identifier for the calling task

   ----------
   -- ATCB --
   ----------

   procedure Set_ATCB (ATCB : System.Address)
     renames System.BB.Threads.Set_ATCB;
   --  Associate the specified ATCB to the currently running thread

   function Get_ATCB return System.Address renames System.BB.Threads.Get_ATCB;
   --  Get the ATCB associated to the currently running thread

   ----------------
   -- Scheduling --
   ----------------

   procedure Set_Priority (Priority  : System.Any_Priority)
     renames System.BB.Threads.Set_Priority;
   --  Set the active priority of the executing thread to the given value

   function Get_Priority  (Id : Thread_Id) return System.Any_Priority
     renames System.BB.Threads.Get_Priority;
   --  Get the current base priority of a thread

   procedure Sleep renames System.BB.Threads.Sleep;
   --  The calling thread is unconditionally suspended

   procedure Wakeup (Id : Thread_Id) renames System.BB.Threads.Wakeup;
   --  The referred thread becomes ready (the thread must be suspended)

   ---------------------
   -- Multiprocessors --
   ---------------------

   function Get_Affinity (Id : Thread_Id) return Multiprocessors.CPU_Range
     renames System.BB.Threads.Get_Affinity;
   --  Return CPU affinity of the given thread (maybe Not_A_Specific_CPU)

   function Get_CPU  (Id : Thread_Id) return Multiprocessors.CPU
     renames System.BB.Threads.Get_CPU;
   --  Return the CPU in charge of the given thread (always a valid CPU)

   function Current_Priority
     (CPU_Id : Multiprocessors.CPU) return System.Any_Priority
     renames System.BB.Threads.Queues.Current_Priority;
   --  Return the active priority of the current thread or
   --  System.Any_Priority'First if no threads are running.

   function Current_CPU return Multiprocessors.CPU
     renames System.BB.CPU_Primitives.Multiprocessors.Current_CPU;
   --  Return the id of the current CPU

end System.OS_Interface;
