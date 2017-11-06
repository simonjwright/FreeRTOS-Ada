------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          A D A . R E A L _ T I M E . T I M I N G _ E V E N T S           --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--        Copyright (C) 2005-2014, 2017, Free Software Foundation, Inc.     --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Adapted from the GCC 7.1.0 version for Cortex GNAT RTS.

with System.FreeRTOS.Tasks;

package body Ada.Real_Time.Timing_Events is

   -----------
   -- Lists --
   -----------

   package Event_List is

      type List is tagged limited private;

      type Cursor is private;
      No_Element : constant Cursor;

      function Is_Empty (L : List) return Boolean;

      procedure Append (L : in out List; Item : Any_Timing_Event)
        with Post'Class => not Is_Empty (L);

      function First_Element (L : List) return Any_Timing_Event
        with Pre'Class => not Is_Empty (L);

      procedure Delete_First (L : in out List)
        with Pre'Class => not Is_Empty (L);

      function Find (L : List; Item : Any_Timing_Event) return Cursor;

      procedure Delete (L : in out List; C : in out Cursor)
        with
          Pre'Class  => C /= No_Element and not Is_Empty (L),
          Post'Class => C = No_Element;

   private
      type List is tagged limited record
         Head : Any_Timing_Event;
         Tail : Any_Timing_Event;
      end record;

      type Cursor is new Any_Timing_Event;
      No_Element : constant Cursor := null;
   end Event_List;

   package body Event_List
   is

      --  Event comparisons are in terms of the events' timeouts.
      function Less_For_Sort (Left, Right : Any_Timing_Event) return Boolean
      is (Left.Timeout < Right.Timeout);
      function Equal_For_Sort (Left, Right : Any_Timing_Event) return Boolean
      is (Left.Timeout = Right.Timeout);

      function Is_Empty (L : List) return Boolean
      is (L.Head = null);

      procedure Append (L : in out List; Item : Any_Timing_Event)
      is
      begin
         if L.Head = null then
            L.Head := Item;
            L.Tail := Item;
            pragma Assert (L.Head = Item
                           and then L.Tail = Item
                           and then L.Head.Next = null
                           and then L.Head.Prev = null);
         elsif Less_For_Sort (Item, L.Head) then
            --  Insert before the list head.
            L.Head.Prev := Item;
            Item.Next := L.Head;
            L.Head := Item;
            pragma Assert (L.Head = Item
                           and then L.Head.Prev = null
                           and then L.Head.Next.Prev = L.Head);
         elsif Less_For_Sort (L.Tail, Item)
           or else Equal_For_Sort (L.Tail, Item)
         then
            --  Insert after the list tail.
            L.Tail.Next := Item;
            Item.Prev := L.Tail;
            L.Tail := Item;
            pragma Assert (L.Tail = Item
                           and then L.Tail.Next = null
                           and then L.Tail.Prev.Next = L.Tail);
         else
            --  Need to insert after the last item in the list which is
            --  less than or equal to this item.
            --
            --  We don't need to alter the list head or tail.
            declare
               P : Any_Timing_Event := L.Head;
            begin
               while Less_For_Sort (P.Next, Item)
                 or else Equal_For_Sort (P.Next, Item) loop
                  P := P.Next;
               end loop;
               P.Next.Prev := Item;
               Item.Next := P.Next;
               Item.Prev := P;
               P.Next := Item;
            end;
            pragma Assert (Item.Next.Prev = Item
                           and then Item.Prev.Next = Item);
         end if;
      end Append;

      function First_Element (L : List) return Any_Timing_Event
      is (L.Head);

      procedure Delete_First (L : in out List)
      is
         First : constant Any_Timing_Event := L.Head;
      begin
         L.Head := First.Next;
         if L.Head = null then
            L.Tail := null;
         else
            L.Head.Prev := null;
         end if;

         --  Remove links from the removed event.
         First.Next := null;
         First.Prev := null;
      end Delete_First;

      function Find (L : List; Item : Any_Timing_Event) return Cursor
      is
         Result : Any_Timing_Event := L.Head;
      begin
         loop
            if Result = null then
               return No_Element;
            elsif Result = Item then
               return Cursor (Result);
            else
               Result := Result.Next;
            end if;
         end loop;
      end Find;

      procedure Delete (L : in out List; C : in out Cursor)
      is
      begin
         if C.Prev = null then
            L.Head := C.Next;
         else
            C.Prev.Next := C.Next;
         end if;
         if C.Next = null then
            L.Tail := C.Prev;
         else
            C.Next.Prev := C.Prev;
         end if;

         --  Remove links from the removed event.
         C.Next := null;
         C.Prev := null;

         C := No_Element;
      end Delete;

   end Event_List;

   -------------
   -- Locking --
   -------------

   procedure Lock;
   procedure Unlock;

   ------------
   -- Events --
   ------------

   All_Events : Event_List.List;
   --  The queue of pending events, ordered by increasing timeout value, that
   --  have been "set" by the user via Set_Handler.

   procedure Process_Queued_Events (Next_Event_Time : out Time);
   --  Examine the queue of pending events for any that have timed out. For
   --  those that have timed out, remove them from the queue and invoke their
   --  handler (unless the user has cancelled the event by setting the handler
   --  pointer to null). Mutually exclusive access is held via Lock/Unlock
   --  during part of the processing.

   procedure Insert_Into_Queue (This : Any_Timing_Event);
   --  Insert the specified event pointer into the queue of pending events
   --  with mutually exclusive access via Lock/Unlock.

   procedure Remove_From_Queue (This : Any_Timing_Event);
   --  Remove the specified event pointer from the queue of pending events with
   --  mutually exclusive access via Lock/Unlock. This procedure is used
   --  by the client-side routines (Set_Handler, etc.).

   -----------
   -- Timer --
   -----------

   task Timer is
      pragma Priority (System.Priority'Last);
   end Timer;

   task body Timer is

      Next : Time := Time_First;
      Period : constant Time_Span := Milliseconds (10);

      --  This is a simplistic implementation.
      --
      --  If there is no next event, Process_Queued_Events returns
      --  Time_First, and this task delays for Period before looking
      --  again.
      --
      --  If there is a next event, Process_Queued_Events returns the
      --  time when that event is to fire, and this task delays until
      --  then.
      --
      --  In either case, events which are scheduled during this
      --  task's delay are not considered until the delay expires.

   begin
      loop
         Process_Queued_Events (Next_Event_Time => Next);
         delay until (if Next = Time_First then Clock + Period else Next);
      end loop;
   end Timer;

   ---------------------------
   -- Process_Queued_Events --
   ---------------------------

   procedure Process_Queued_Events (Next_Event_Time : out Time) is
      Next_Event : Any_Timing_Event;

   begin
      loop
         Lock;

         if All_Events.Is_Empty then
            Unlock;
            Next_Event_Time := Time_First;
            exit;
         else
            Next_Event := All_Events.First_Element;
         end if;

         if Next_Event.Timeout > Clock then

            --  We found one that has not yet timed out. The queue is in
            --  ascending order by Timeout so there is no need to continue
            --  processing (and indeed we must not continue since we always
            --  delete the first element).

            Next_Event_Time := Next_Event.Timeout;
            Unlock;
            exit;
         end if;

         --  We have an event that has timed out so we will process it. It must
         --  be the first in the queue so no search is needed.

         All_Events.Delete_First;

         --  A fundamental issue is that the invocation of the event's handler
         --  might call Set_Handler on itself to re-insert itself back into the
         --  queue of future events. Thus we cannot hold the lock on the queue
         --  while invoking the event's handler.

         Unlock;

         --  There is no race condition with the user changing the handler
         --  pointer while we are processing because we are executing at the
         --  highest possible application task priority and are not doing
         --  anything to block prior to invoking their handler.

         declare
            Handler : constant Timing_Event_Handler := Next_Event.Handler;

         begin
            --  The first act is to clear the event, per D.15(13/2). Besides,
            --  we cannot clear the handler pointer *after* invoking the
            --  handler because the handler may have re-inserted the event via
            --  Set_Event. Thus we take a copy and then clear the component.

            Next_Event.Handler := null;

            if Handler /= null then
               Handler.all (Timing_Event (Next_Event.all));
            end if;

         --  Ignore exceptions propagated by Handler.all, as required by
         --  RM D.15(21/2).
         --
         --  Of course, exceptions can't be propagated in this RTS!

         exception
            when others =>
               null;
         end;
      end loop;
   end Process_Queued_Events;

   -----------------------
   -- Insert_Into_Queue --
   -----------------------

   procedure Insert_Into_Queue (This : Any_Timing_Event) is
   begin
      Lock;

      All_Events.Append (This);

      --  A critical property of the implementation of this package is that
      --  all occurrences are in ascending order by Timeout. Thus the first
      --  event in the queue always has the "next" value for the Timer task
      --  to use in its delay statement.

      Unlock;
   end Insert_Into_Queue;

   -----------------------
   -- Remove_From_Queue --
   -----------------------

   procedure Remove_From_Queue (This : Any_Timing_Event) is
      use Event_List;
      Location : Cursor;

   begin
      Lock;

      Location := All_Events.Find (This);

      if Location /= No_Element then
         All_Events.Delete (Location);
      end if;

      Unlock;
   end Remove_From_Queue;

   -----------------
   -- Set_Handler --
   -----------------

   procedure Set_Handler
     (Event   : in out Timing_Event;
      At_Time : Time;
      Handler : Timing_Event_Handler)
   is
   begin
      Remove_From_Queue (Event'Unchecked_Access);
      Event.Handler := null;

      --  RM D.15(15/2) required that at this point, we check whether the time
      --  has already passed, and if so, call Handler.all directly from here
      --  instead of doing the enqueuing below. However, this caused a nasty
      --  race condition and potential deadlock. If the current task has
      --  already locked the protected object of Handler.all, and the time has
      --  passed, deadlock would occur. It has been fixed by AI05-0094-1, which
      --  says that the handler should be executed as soon as possible, meaning
      --  that the timing event will be executed after the protected action
      --  finishes (Handler.all should not be called directly from here).
      --  The same comment applies to the other Set_Handler below.

      if Handler /= null then
         Event.Timeout := At_Time;
         Event.Handler := Handler;
         Insert_Into_Queue (Event'Unchecked_Access);
      end if;
   end Set_Handler;

   -----------------
   -- Set_Handler --
   -----------------

   procedure Set_Handler
     (Event   : in out Timing_Event;
      In_Time : Time_Span;
      Handler : Timing_Event_Handler)
   is
   begin
      Remove_From_Queue (Event'Unchecked_Access);
      Event.Handler := null;

      --  See comment in the other Set_Handler above

      if Handler /= null then
         Event.Timeout := Clock + In_Time;
         Event.Handler := Handler;
         Insert_Into_Queue (Event'Unchecked_Access);
      end if;
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
   begin
      Remove_From_Queue (Event'Unchecked_Access);
      Cancelled := Event.Handler /= null;
      Event.Handler := null;
   end Cancel_Handler;

   -------------------
   -- Time_Of_Event --
   -------------------

   function Time_Of_Event (Event : Timing_Event) return Time is
   begin
      --  RM D.15(18/2): Time_First must be returned if the event is
      --  not set

      return (if Event.Handler = null then Time_First else Event.Timeout);
   end Time_Of_Event;

   ----------
   -- Lock --
   ----------

   procedure Lock is
   begin
      --  An interrupt might be preempted by a higher-priority
      --  interrupt.
      System.FreeRTOS.Tasks.Disable_Interrupts;
   end Lock;

   ------------
   -- Unlock --
   ------------

   procedure Unlock is
   begin
      System.FreeRTOS.Tasks.Enable_Interrupts;
   end Unlock;

end Ada.Real_Time.Timing_Events;
