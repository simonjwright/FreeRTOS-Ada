------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                S Y S T E M . B B . T I M I N G _ E V E N T S             --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                     Copyright (C) 2011-2013, AdaCore                     --
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

with System.BB.CPU_Primitives.Multiprocessors;
with System.BB.Parameters;
with System.BB.Protection;
with System.BB.Threads;
with System.BB.Threads.Queues;

package body System.BB.Timing_Events is

   use type System.BB.Time.Time;
   use System.Multiprocessors;
   use System.BB.CPU_Primitives.Multiprocessors;
   use System.BB.Threads;

   Events_Table : array (CPU) of Timing_Event_Access := (others => null);
   --  One event list for each CPU

   procedure Insert
     (Event    : not null Timing_Event_Access;
      Is_First : out Boolean) with
   --  Insert an event in the event list of the current CPU (Timeout order
   --  then FIFO). Is_First is set to True when Event becomes the next timing
   --  event to serve, False otherwise.

     Pre =>

       --  The first element in the list (if it exists) cannot have a previous
       --  element.

       (if Events_Table (Current_CPU) /= null then
         Events_Table (Current_CPU).Prev = null)

         --  The event should be set

         and then Event.Handler /= null

         --  The event should not be already inserted in a list

         and then Event.Next = null and then Event.Prev = null

         --  Timing Events must always be handled by the same CPU

         and then (not System.BB.Parameters.Multiprocessor
                    or else Event.CPU = Current_CPU),

     Post =>

       --  Is_First is set to True when Event becomes the next timing event to
       --  serve (because the list was empty or the list contained only events
       --  with a later expiration time).

       (if Events_Table (Current_CPU) = Event then
           Is_First
             and then Event.all.Prev = null
             and then Event.all.Next = Events_Table'Old (Current_CPU)

        --  If the event is not first then the head of queue does not change

        else
           Events_Table (Current_CPU) = Events_Table'Old (Current_CPU)
             and then Event.all.Prev /= null)

         --  The queue cannot be empty after insertion

         and then Events_Table (Current_CPU) /= null

         --  The first element in the list can never have a previous element

         and then Events_Table (Current_CPU).Prev = null

         --  The queue is always ordered by expiration time and then FIFO

         and then (Event.all.Next = null
                    or else Event.all.Next.Timeout > Event.Timeout)
         and then (Event.all.Prev = null
                    or else Event.all.Prev.Timeout <= Event.Timeout);

   procedure Extract (Event     : not null Timing_Event_Access;
                      Was_First : out Boolean) with
   --  Extract an event from the event list of the current CPU. Was_First is
   --  True when we extract the event that was first in the queue, else False.

     Pre =>

       --  There must be at least one element in the queue

       Events_Table (Current_CPU) /= null

         --  The first element in the list can never have a previous element

         and then Events_Table (Current_CPU).Prev = null

         --  The first element has Prev equal to null, but the others have Prev
         --  pointing to another timing event.

         and then (if Event /= Events_Table (Current_CPU) then
                     Event.Prev /= null)

         --  The queue is always ordered by expiration time and then FIFO

         and then (Event.Next = null
                    or else Event.Next.Timeout >= Event.Timeout)
         and then (Event.Prev = null
                    or else Event.Prev.Timeout <= Event.Timeout)

         --  Timing Events must always be handled by the same CPU

         and then (not System.BB.Parameters.Multiprocessor
                    or else Event.CPU = Current_CPU),

     Post =>

       --  Was_First is set to True when we extract the event that was first
       --  in the queue.

       (if Events_Table'Old (Current_CPU) = Event then
          Events_Table (Current_CPU) /= Events_Table'Old (Current_CPU)
            and then Was_First)

         --  The first element in the list (if it exists) cannot have a
         --  previous element.

         and then (if Events_Table (Current_CPU) /= null then
                     Events_Table (Current_CPU).Prev = null)

         --  The Prev and Next pointers are set to null to indicate that the
         --  event is no longer in the list.

         and then Event.all.Prev = null
         and then Event.all.Next = null;

   -----------------
   -- Set_Handler --
   -----------------

   procedure Set_Handler
     (Event   : in out Timing_Event;
      At_Time : System.BB.Time.Time;
      Handler : Timing_Event_Handler)
   is
      Next_Alarm : System.BB.Time.Time;
      CPU_Id     : constant CPU        := Current_CPU;
      Was_First  : Boolean             := False;
      Is_First   : Boolean             := False;

   begin
      --  The access to the list must be protected

      Protection.Enter_Kernel;

      if Event.Handler /= null then

         --  Extract if the event is already set

         Extract (Event'Unchecked_Access, Was_First);
      end if;

      Event.Handler := Handler;

      if Handler /= null then

         --  Update event fields

         Event.Timeout := At_Time;
         Event.CPU     := CPU_Id;

         --  Insert event in the list

         Insert (Event'Unchecked_Access, Is_First);
      end if;

      if Was_First or else Is_First then
         --  Set the timer for the next alarm

         Next_Alarm := Time.Get_Next_Timeout (CPU_Id);
         Time.Update_Alarm (Next_Alarm);
      end if;

      --  The following pragma cannot be transformed into a post-condition
      --  because the call to Leave_Kernel is a dispatching operation and the
      --  status of the timing event handler may change (if may expire, for
      --  example).

      pragma Assert
        ((if Handler = null then

             --  If Handler is null the event is cleared

             Event.Handler = null

          else
             --  If Handler is not null then the timing event handler is set,
             --  and the execution time for the event is set to At_Time in the
             --  current CPU. Next timeout events can never be later than the
             --  event that we have just inserted.

             Event.Handler = Handler
               and then Event.Timeout = At_Time
               and then Time.Get_Next_Timeout (CPU_Id) <= At_Time));

      Protection.Leave_Kernel;
   end Set_Handler;

   ---------------------
   -- Current_Handler --
   ---------------------

   function Current_Handler
     (Event : Timing_Event) return Timing_Event_Handler
   is
   begin
      return Event.Handler;
   end Current_Handler;

   --------------------
   -- Cancel_Handler --
   --------------------

   procedure Cancel_Handler
     (Event     : in out Timing_Event;
      Cancelled : out Boolean)
   is
      Next_Alarm : System.BB.Time.Time;
      CPU_Id     : constant CPU := Current_CPU;
      Was_First  : Boolean;

   begin
      --  The access to the list must be protected

      Protection.Enter_Kernel;

      if Event.Handler /= null then

         --  Extract if the event is already set

         Extract (Event'Unchecked_Access, Was_First);

         Cancelled     := True;
         Event.Handler := null;

         if Was_First then
            Next_Alarm := Time.Get_Next_Timeout (CPU_Id);
            Time.Update_Alarm (Next_Alarm);
         end if;
      else
         Cancelled := False;
      end if;

      pragma Assert (Event.Handler = null);

      Protection.Leave_Kernel;
   end Cancel_Handler;

   -----------------------------------
   -- Execute_Expired_Timing_Events --
   -----------------------------------

   procedure Execute_Expired_Timing_Events (Now : System.BB.Time.Time) is
      CPU_Id          : constant CPU := Current_CPU;
      Event           : Timing_Event_Access := Events_Table (CPU_Id);
      Handler         : Timing_Event_Handler;
      Was_First       : Boolean;
      Self_Id         : Thread_Id;
      Caller_Priority : Any_Priority;

   begin
      --  Fast path: no timing event

      if Event = null then
         return;
      end if;

      --  As required by RM D.15 (14/2), timing events must be executed at
      --  the highest priority (Interrupt_Priority'Last). This is ensured by
      --  executing this part at the highest interrupt priority (and not at the
      --  one corresponding to the timer hardware interrupt). At the end of the
      --  execution of any timing event handler the priority that is restored
      --  is that of the alarm handler. If this part of the alarm handler
      --  executes at a priority lower than Interrupt_Priority'Last then
      --  the protection of the queues would not be guaranteed.

      Self_Id := Thread_Self;
      Caller_Priority := Get_Priority (Self_Id);

      Queues.Change_Priority (Self_Id, Interrupt_Priority'Last);

      --  Extract and execute all the expired timing events

      while Event /= null and then Event.Timeout <= Now loop

         --  Get handler

         Handler := Event.Handler;

         pragma Assert (Handler /= null);

         --  Extract first event from the list

         Extract (Event, Was_First);

         pragma Assert (Was_First);

         --  Clear the event. Do it before executing the handler before the
         --  timing event can be reinserted in the handler.

         Event.Handler := null;

         --  Execute the handler

         Handler (Event.all);

         Event := Events_Table (CPU_Id);
      end loop;

      Queues.Change_Priority (Self_Id, Caller_Priority);

      --  No more events to handle with an expiration time before Now

      pragma Assert (Events_Table (CPU_Id) = null
                       or else Events_Table (CPU_Id).Timeout > Now);
   end Execute_Expired_Timing_Events;

   ----------------------
   -- Get_Next_Timeout --
   ----------------------

   function Get_Next_Timeout
     (CPU_Id : System.Multiprocessors.CPU) return System.BB.Time.Time
   is
      Event : constant Timing_Event_Access := Events_Table (CPU_Id);
   begin
      if Event = null then
         return System.BB.Time.Time'Last;
      else
         return Event.all.Timeout;
      end if;
   end Get_Next_Timeout;

   -------------------
   -- Time_Of_Event --
   -------------------

   function Time_Of_Event (Event : Timing_Event) return System.BB.Time.Time is
   begin
      if Event.Handler = null then
         return System.BB.Time.Time'First;
      else
         return Event.Timeout;
      end if;
   end Time_Of_Event;

   -------------
   -- Extract --
   -------------

   procedure Extract (Event     : not null Timing_Event_Access;
                      Was_First : out Boolean)
   is
      CPU_Id : constant CPU := Current_CPU;

   begin
      --  Head extraction

      if Events_Table (CPU_Id) = Event then
         Was_First := True;
         Events_Table (CPU_Id) := Event.Next;

      --  Middle or tail extraction

      else
         pragma Assert (Event.Prev /= null);

         Was_First := False;
         Event.Prev.Next := Event.Next;
      end if;

      if Event.Next /= null then
         Event.Next.Prev := Event.Prev;
      end if;

      Event.Next := null;
      Event.Prev := null;
   end Extract;

   -------------
   -- Insert --
   -------------

   procedure Insert
     (Event    : not null Timing_Event_Access;
      Is_First : out Boolean)
   is
      CPU_Id      : constant CPU := Current_CPU;
      Aux_Pointer : Timing_Event_Access;

   begin
      --  Insert at the head if there is no other events with a smaller timeout

      if Events_Table (CPU_Id) = null
        or else Events_Table (CPU_Id).Timeout > Event.Timeout
      then
         Is_First := True;

         Event.Next := Events_Table (CPU_Id);

         if Events_Table (CPU_Id) /= null then
            Events_Table (CPU_Id).Prev := Event;
         end if;

         Events_Table (CPU_Id) := Event;

      --  Middle or tail insertion

      else
         pragma Assert (Events_Table (CPU_Id) /= null);

         Is_First := False;

         Aux_Pointer := Events_Table (CPU_Id);

         while Aux_Pointer.Next /= null
           and then Aux_Pointer.Next.Timeout <= Event.Timeout
         loop
            Aux_Pointer := Aux_Pointer.Next;
         end loop;

         --  Insert after the Aux_Pointer

         Event.Next := Aux_Pointer.Next;
         Event.Prev := Aux_Pointer;

         if Aux_Pointer.Next /= null then
            Aux_Pointer.Next.Prev := Event;
         end if;

         Aux_Pointer.Next := Event;
      end if;
   end Insert;

end System.BB.Timing_Events;
