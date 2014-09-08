------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--     S Y S T E M . T A S K I N G . P R O T E C T E D _ O B J E C T S .    --
--                     M U L T I P R O C E S S O R S                        --
--                                                                          --
--                               B o d y                                    --
--                                                                          --
--                       Copyright (C) 2010, AdaCore                        --
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

with System.Task_Primitives.Operations;

with System.Multiprocessors;
with System.Multiprocessors.Fair_Locks;
with System.Multiprocessors.Spin_Locks;
with System.OS_Interface;

with System.BB.Protection;
with System.BB.CPU_Primitives.Multiprocessors;
with System.BB.Threads.Queues;

package body System.Tasking.Protected_Objects.Multiprocessors is

   use System.Multiprocessors;
   use System.Multiprocessors.Spin_Locks;
   use System.Multiprocessors.Fair_Locks;

   package STPO renames System.Task_Primitives.Operations;

   type Entry_Call_List is limited record
      List : Entry_Call_Link;
      Lock : Fair_Lock;
   end record;

   Served_Entry_Call : array (CPU) of Entry_Call_List :=
                         (others =>
                            (List => null,
                             Lock => (Spinning => (others => False),
                                      Lock     => (Flag   => Unlocked))));
   --  List of served Entry_Call for each CPU

   ------------
   -- Served --
   ------------

   procedure Served (Entry_Call : Entry_Call_Link) is
      Caller     : constant Task_Id := Entry_Call.Self;
      Caller_CPU : constant CPU     := STPO.Get_CPU (Caller);

   begin
      --  The entry caller is on a different CPU

      --  We have to signal that the caller task is ready to be rescheduled,
      --  but we are not allowed modify the ready queue of the other CPU. We
      --  use the Served_Entry_Call list and a poke interrupt to signal that
      --  the task is ready.

      --  Disabled IRQ ensure atomicity of the operation. Atomicity plus Fair
      --  locks ensure bounded execution time.

      System.BB.CPU_Primitives.Disable_Interrupts;

      Lock (Served_Entry_Call (Caller_CPU).Lock);

      --  Add the entry call to the served list

      Entry_Call.Next := Served_Entry_Call (Caller_CPU).List;
      Served_Entry_Call (Caller_CPU).List := Entry_Call;

      Unlock (Served_Entry_Call (Caller_CPU).Lock);

      --  Enable interrupts

      --  We need to set the hardware interrupt masking level equal to
      --  the software priority of the task that is executing.

      if System.BB.Threads.Queues.Running_Thread.Active_Priority in
        Interrupt_Priority'Range
      then
         --  We need to mask some interrupts because we are executing at a
         --  hardware interrupt priority.

         System.BB.CPU_Primitives.Enable_Interrupts
           (System.BB.Threads.Queues.Running_Thread.Active_Priority -
              System.Interrupt_Priority'First + 1);

      else
         --  We are neither within an interrupt handler nor within task
         --  that has a priority in the range of Interrupt_Priority, so
         --  that no interrupt should be masked.

         System.BB.CPU_Primitives.Enable_Interrupts (0);
      end if;

      if STPO.Get_Priority (Entry_Call.Self) >
        System.OS_Interface.Current_Priority (Caller_CPU)
      then
         --  Poke the caller's CPU if the task has a higher priority

         System.BB.CPU_Primitives.Multiprocessors.Poke_CPU (Caller_CPU);
      end if;
   end Served;

   -------------------------
   -- Wakeup_Served_Entry --
   -------------------------

   procedure Wakeup_Served_Entry is
      CPU_Id     : constant CPU := STPO.Get_CPU (STPO.Self);
      Entry_Call : Entry_Call_Link;

   begin
      --  Interrupts are always disabled when entering here

      Lock (Served_Entry_Call (CPU_Id).Lock);

      Entry_Call := Served_Entry_Call (CPU_Id).List;
      Served_Entry_Call (CPU_Id).List := null;

      Unlock (Served_Entry_Call (CPU_Id).Lock);

      while Entry_Call /= null loop
         STPO.Wakeup (Entry_Call.Self, Entry_Caller_Sleep);
         Entry_Call := Entry_Call.Next;
      end loop;
   end Wakeup_Served_Entry;

begin
   System.BB.Protection.Wakeup_Served_Entry_Callback :=
     Wakeup_Served_Entry'Access;

end System.Tasking.Protected_Objects.Multiprocessors;
