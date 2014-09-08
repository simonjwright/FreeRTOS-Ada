------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--               S Y S T E M . B B . T H R E A D S . Q U E U E S            --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2004 The European Space Agency            --
--                     Copyright (C) 2003-2013, AdaCore                     --
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

with System.BB.Time;
with System.BB.CPU_Primitives.Multiprocessors;
with System.Multiprocessors;

package System.BB.Threads.Queues is
   pragma Preelaborate;

   use type System.BB.Time.Time;
   package CPRMU renames System.BB.CPU_Primitives.Multiprocessors;

   ----------------
   -- Ready list --
   ----------------

   procedure Insert (Thread : Thread_Id) with
   --  Insert the thread into the ready queue. The thread is always inserted
   --  at the tail of its active priority because these are the semantics of
   --  FIFO_Within_Priorities dispatching policy when a task becomes ready to
   --  execute.
   --
   --  There is one case in which the ready queue does not change after the
   --  insertion. It can happen only when there is no ready thread to execute,
   --  in which case the currently running thread was inserted in the queue
   --  (keeping its state as non-runnable). If the state of the thread changes
   --  (after an interrupt), the reinsertion of the thread will not change the
   --  ready queue.

     Pre =>
       Thread /= Null_Thread_Id

         --  Normal insertion

         and then (Thread.State = Runnable

                    --  Insertion in the queue of the thread that was executing
                    --  before (even when it is no longer runnable) because we
                    --  need to have an an execution context for the interrupts
                    --  that may arrive.

                    or else First_Thread = Null_Thread_Id),

     Post =>

       --  Insertions in the queue when there is no thread ready to execute
       --  means that there can be no other ready thread.

       (if Thread.State'Old /= Runnable then
         First_Thread = Thread
           and then Running_Thread = Thread
           and then Running_Thread.Next = Null_Thread_Id

        --  Insertions at the tail of its active priority must guarantee that
        --  any thread after this one must have a priority which is strictly
        --  lower than the one just inserted.

        else Thread.Next = Null_Thread_Id
               or else Thread.Active_Priority > Thread.Next.Active_Priority),

     Inline => True;

   procedure Extract (Thread : Thread_Id) with
   --  Remove the thread from the ready queue. We can only extract the one
   --  which is first in the ready queue.

     Pre =>

       --  The only thread that can be extracted from the ready list is the
       --  one that is currently executing (as a result of a delay or a
       --  protected operation).

       Thread = Running_Thread
         and then Thread = First_Thread
         and then Thread.State /= Runnable,

     Post =>
       --  The next thread to execute is the one just next in the ready queue

       First_Thread = Thread.Next'Old
         and then Thread.all.Next = Null_Thread_Id,

     Inline => True;

   procedure Change_Priority
     (Thread   : Thread_Id;
      Priority : System.Any_Priority) with
   --  Move the thread to a new priority within the ready queue

     Pre =>
       Thread /= Null_Thread_Id

       --  We can only change the priority of the thread that is currently
       --  executing.

       and then Thread = Running_Thread

       --  Additionally, this thread must be the first in the ready queue
       --  (otherwise, it would not be executing).

       and then Thread = First_Thread

       --  The new priority can never be lower than the base priority,

       and then Priority >= Thread.Base_Priority,

     Post =>
       Thread.all.Active_Priority = Priority
         and then Thread = Running_Thread

         --  When raising the priority, it is not possible that there is
         --  another thread with a higher priority (otherwise the other thread
         --  would be running). Hence, there is no displacement required within
         --  the queue, because the thread is already in the first position.

         and then (if Priority >= Thread.Active_Priority'Old then
                     First_Thread = Thread

                   --  When reducing the priority, if there is a thread with a
                   --  higher priority then the currently executing thread is
                   --  no longer the first in the ready queue.

                   else (if First_Thread = Thread then
                            Thread.Next = Null_Thread_Id
                              or else Thread.Next.Active_Priority <= Priority
                         else
                            First_Thread.Active_Priority > Priority)),

     Inline => True;

   function Current_Priority
     (CPU_Id : System.Multiprocessors.CPU) return System.Any_Priority with
   --  Return the active priority of the current thread or
   --  System.Any_Priority'First if no threads are running.

     Post =>

         --  When no thread is ready to execute then return the lowest priority

         (if Running_Thread_Table (CPU_Id) = Null_Thread_Id
           or else Running_Thread_Table (CPU_Id).State /= Runnable
          then
            Current_Priority'Result = System.Any_Priority'First

          --  Otherwise, return the active priority of the running thread

          else
            Current_Priority'Result =
              Running_Thread_Table (CPU_Id).Active_Priority),

     Inline => True;

   procedure Yield (Thread : Thread_Id) with
   --  Move the thread to the tail of its current priority

     Pre =>

       --  The only thread that can yield is the one that is currently
       --  executing.

       Thread = Running_Thread
         and then Thread = First_Thread
         and then Thread.State = Runnable,

     Post =>

       --  The next thread to execute is the one just next in the ready queue
       --  if it has the same priority of the currently running thread.

       (if First_Thread /= Thread then
           Thread.all.Active_Priority = First_Thread.Active_Priority
             and then
               (Thread.Next = Null_Thread_Id
                 or else Thread.Next.Active_Priority < Thread.Active_Priority)

        --  Otherwise, nothing changes

        else Thread = First_Thread)

       --  The thread must have been moved as last in its priority queue

       and then
         (Thread.all.Next = Null_Thread_Id
            or else Thread.all.Next.Active_Priority < Thread.Active_Priority)

       --  In any case, the thread must remain runnable, and no context switch
       --  is possible within this procedure.

       and then Thread = Running_Thread
       and then Thread.all.State = Runnable;

   Running_Thread_Table : array (System.Multiprocessors.CPU) of Thread_Id :=
                            (others => Null_Thread_Id);
   pragma Volatile_Components (Running_Thread_Table);
   pragma Export (Asm, Running_Thread_Table, "__gnat_running_thread_table");
   --  Identifier of the thread that is currently executing in the given CPU.
   --  This shared variable is used by the debugger to know which is the
   --  currently running thread. This variable is exported to be visible in the
   --  assembly code to allow its value to be used when necessary (by the
   --  low-level routines).

   First_Thread_Table : array (System.Multiprocessors.CPU) of Thread_Id :=
                          (others => Null_Thread_Id);
   pragma Volatile_Components (First_Thread_Table);
   pragma Export (Asm, First_Thread_Table, "first_thread_table");
   --  Pointers to the first thread of the priority queue for each CPU. This is
   --  the thread that will be next to execute in the given CPU (if not already
   --  executing). This variable is exported to be visible in the assembly code
   --  to allow its value to be used when necessary (by the low-level
   --  routines).

   function Running_Thread return Thread_Id with
   --  Returns the running thread of the current CPU

     Post => Running_Thread'Result /= Null_Thread_Id,

     Inline => True;

   function First_Thread return Thread_Id with
   --  Returns the first thread in the priority queue of the current CPU

     Inline => True;

   function Context_Switch_Needed return Boolean with
   --  This function returns True if the task (or interrupt handler) that is
   --  executing is no longer the highest priority one. This function can also
   --  be called by the interrupt handlers' epilogue.

     Pre =>
       First_Thread /= Null_Thread_Id
         and then Running_Thread /= Null_Thread_Id,

     Post =>
       Context_Switch_Needed'Result = (First_Thread /= Running_Thread),

     Inline => True,

     Export => True,
     Convention => Asm,
     External_Name => "context_switch_needed";

   ----------------
   -- Alarm list --
   ----------------

   procedure Insert_Alarm
     (T        : System.BB.Time.Time;
      Thread   : Thread_Id;
      Is_First : out Boolean) with
   --  This procedure inserts the Thread inside the alarm queue ordered by
   --  Time. If the alarm is the next to be served then the procedure returns
   --  True in the Is_First argument, and False otherwise.

     Pre =>

       --  We can only insert in the alarm queue threads whose state is
       --  Delayed.

       Thread /= Null_Thread_Id
         and then Thread.State = Delayed,

     Post =>

       --  The alarm time is always inserted in the thread descriptor

       Thread.all.Alarm_Time = T

       --  Always inserted by expiration time

       and then (Thread.all.Next_Alarm = Null_Thread_Id
                   or else
                 Thread.all.Alarm_Time <= Thread.all.Next_Alarm.Alarm_Time)

       --  Next alarm can never be later than the currently inserted one

       and then Get_Next_Alarm_Time (Get_CPU (Thread)) <= T

       --  Inserted first in the queue if there is not a more recent alarm

       and then (if Is_First then Get_Next_Alarm_Time (Get_CPU (Thread)) = T);

   function Extract_First_Alarm return Thread_Id with
   --  Extract the first element in the alarm queue and return its identifier

     Post =>

       --  All threads extracted from the alarm queue must be waiting in a
       --  delay statement.

       Extract_First_Alarm'Result.State = Delayed

         --  After extraction the Alarm_Time field is set to Time'Last

         and then Extract_First_Alarm'Result.Alarm_Time =
           System.BB.Time.Time'Last

         --  After extraction the Next_Alarm field is set to Null_Thread_Id

         and then Extract_First_Alarm'Result.Next_Alarm = Null_Thread_Id

         --  The extracted thread must be the one with the smallest value of
         --  Alarm_Time.

         and then Get_Next_Alarm_Time (CPRMU.Current_CPU)'Old <=
           Get_Next_Alarm_Time (CPRMU.Current_CPU),

     Inline => True;

   function Get_Next_Alarm_Time
     (CPU_Id : System.Multiprocessors.CPU) return System.BB.Time.Time;
   pragma Inline (Get_Next_Alarm_Time);
   --  Return the time when the next alarm should be set. This function does
   --  not modify the queue.

   procedure Wakeup_Expired_Alarms (Now : Time.Time) with
   --  Wakeup all expired alarms and set the alarm timer if needed

     Post =>
       Get_Next_Alarm_Time (CPRMU.Current_CPU) > Now;

   -----------------
   -- Global_List --
   -----------------

   Global_List : Thread_Id := Null_Thread_Id;
   --  This variable is the starting point of the list containing all threads
   --  in the system. No protection (for concurrent access) is needed for
   --  this variable because task creation is serialized.

end System.BB.Threads.Queues;
