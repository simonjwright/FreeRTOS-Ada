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

with Ada.Unchecked_Deallocation;
with System.FreeRTOS.Tasks;

---------------------------------
-- Ada.Real_Time.Timing_Events --
---------------------------------

package body Ada.Real_Time.Timing_Events is

   -----------
   -- Lists --
   -----------

   generic
      type T is private;
      with function Less_For_Sort (L, R : T) return Boolean is <>;
      with function Equal_For_Sort (L, R : T) return Boolean is <>;
   package Lists
   is

      type List is tagged limited private;

      type Cursor is private;
      No_Element : constant Cursor;

      function Is_Empty (L : List) return Boolean;

      procedure Append (L : in out List; Item : T)
        with Post'Class => not Is_Empty (L);

      function First_Element (L : List) return T
        with Pre'Class => not Is_Empty (L);

      procedure Delete_First (L : in out List)
        with Pre'Class => not Is_Empty (L);

      function Find (L : List; Item : T) return Cursor;

      procedure Delete (L : in out List; C : in out Cursor)
        with
          Pre'Class  => C /= No_Element and not Is_Empty (L),
          Post'Class => C = No_Element;

   private
      type Cell;
      type Cell_P is access Cell;
      type Cell is record
         Item : T;
         Prev : Cell_P;
         Next : Cell_P;
      end record;

      type List is tagged limited record
         Head : Cell_P;
         Tail : Cell_P;
      end record;

      type Cursor is new Cell_P;
      No_Element : constant Cursor := null;
   end Lists;

   package body Lists
   is

      procedure Free is new Ada.Unchecked_Deallocation (Cell, Cell_P);

      function Is_Empty (L : List) return Boolean
      is (L.Head = null);

      procedure Append (L : in out List; Item : T)
      is
         C : constant Cell_P := new Cell'(Item => Item, others => <>);
      begin
         if L.Head = null then
            L.Head := C;
            L.Tail := C;
            pragma Assert (L.Head = C
                           and then L.Tail = C
                           and then L.Head.Next = null
                           and then L.Head.Prev = null);
         elsif Less_For_Sort (Item, L.Head.Item) then
            --  Insert before the list head.
            L.Head.Prev := C;
            C.Next := L.Head;
            L.Head := C;
            pragma Assert (L.Head = C
                           and then L.Head.Prev = null
                           and then L.Head.Next.Prev = L.Head);
         elsif Less_For_Sort (L.Tail.Item, Item)
           or else Equal_For_Sort (L.Tail.Item, Item)
         then
            --  Insert after the list tail.
            L.Tail.Next := C;
            C.Prev := L.Tail;
            L.Tail := C;
            pragma Assert (L.Tail = C
                           and then L.Tail.Next = null
                           and then L.Tail.Prev.Next = L.Tail);
         else
            --  Need to insert after the last item in the list which is
            --  less than or equal to this item.
            --
            --  We don't need to alter the list head or tail.
            declare
               P : Cell_P := L.Head;
            begin
               while Less_For_Sort (P.Next.Item, Item)
                 or else Equal_For_Sort (P.Next.Item, Item) loop
                  P := P.Next;
               end loop;
               P.Next.Prev := C;
               C.Next := P.Next;
               C.Prev := P;
               P.Next := C;
            end;
            pragma Assert (C.Next.Prev = C
                           and then C.Prev.Next = C);
         end if;
      end Append;

      function First_Element (L : List) return T
      is (L.Head.Item);

      procedure Delete_First (L : in out List)
      is
         Head : Cell_P := L.Head;
      begin
         L.Head := L.Head.Next;
         if L.Head = null then
            L.Tail := null;
         else
            L.Head.Prev := null;
         end if;
         Free (Head);
      end Delete_First;

      function Find (L : List; Item : T) return Cursor
      is
         Result : Cell_P := L.Head;
      begin
         loop
            if Result = null then
               return No_Element;
            elsif Result.Item = Item then
               return Cursor (Result);
            else
               Result := Result.Next;
            end if;
         end loop;
      end Find;

      procedure Delete (L : in out List; C : in out Cursor)
      is
         This : Cell_P := Cell_P (C);
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

         Free (This);
         C := No_Element;
      end Delete;

   end Lists;

   -------------
   -- Locking --
   -------------

   procedure Lock;
   procedure Unlock;

   ----------------------
   -- Any_Timing_Event --
   ----------------------

   type Any_Timing_Event is access all Timing_Event'Class;
   --  We must also handle user-defined types derived from Timing_Event

   ------------
   -- Events --
   ------------

   --  Event comparisons are in terms of the events' timeouts.
   function Sooner (Left, Right : Any_Timing_Event) return Boolean
   is (Left.Timeout < Right.Timeout);
   function Equal (Left, Right : Any_Timing_Event) return Boolean
   is (Left.Timeout = Right.Timeout);

   package Events is new Lists (Any_Timing_Event,
                                Less_For_Sort  => Sooner,
                                Equal_For_Sort => Equal);
   --  Provides the type for the container holding pointers to events

   All_Events : Events.List;
   --  The queue of pending events, ordered by increasing timeout value, that
   --  have been "set" by the user via Set_Handler.

   procedure Process_Queued_Events;
   --  Examine the queue of pending events for any that have timed out. For
   --  those that have timed out, remove them from the queue and invoke their
   --  handler (unless the user has cancelled the event by setting the handler
   --  pointer to null). Mutually exclusive access is held via Event_Queue_Lock
   --  during part of the processing.

   procedure Insert_Into_Queue (This : Any_Timing_Event);
   --  Insert the specified event pointer into the queue of pending events
   --  with mutually exclusive access via Event_Queue_Lock.

   procedure Remove_From_Queue (This : Any_Timing_Event);
   --  Remove the specified event pointer from the queue of pending events with
   --  mutually exclusive access via Event_Queue_Lock. This procedure is used
   --  by the client-side routines (Set_Handler, etc.).

   -----------
   -- Timer --
   -----------

   task Timer is
      pragma Priority (System.Priority'Last);
   end Timer;

   task body Timer is
      Period : constant Time_Span := Milliseconds (100);
      --  This is a "chiming" clock timer that fires periodically. The period
      --  selected is arbitrary and could be changed to suit the application
      --  requirements. Obviously a shorter period would give better resolution
      --  at the cost of more overhead.

   begin
      --  --  Since this package may be elaborated before System.Interrupt,
      --  --  we need to call Setup_Interrupt_Mask explicitly to ensure that
      --  --  this task has the proper signal mask.

      --  System.Interrupt_Management.Operations.Setup_Interrupt_Mask;

      loop
         Process_Queued_Events;
         delay until Clock + Period;
      end loop;
   end Timer;

   ---------------------------
   -- Process_Queued_Events --
   ---------------------------

   procedure Process_Queued_Events is
      Next_Event : Any_Timing_Event;

   begin
      loop
         Lock;

         if All_Events.Is_Empty then
            Unlock;
            return;
         else
            Next_Event := All_Events.First_Element;
         end if;

         if Next_Event.Timeout > Clock then

            --  We found one that has not yet timed out. The queue is in
            --  ascending order by Timeout so there is no need to continue
            --  processing (and indeed we must not continue since we always
            --  delete the first element).

            Unlock;
            return;
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
      use Events;
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
      --  RM D.15(18/2): Time_First must be returned in the event is not set

      return (if Event.Handler = null then Time_First else Event.Timeout);
   end Time_Of_Event;

   ----------
   -- Lock --
   ----------

   procedure Lock is
   begin
      if not System.FreeRTOS.Tasks.In_ISR then
         System.FreeRTOS.Tasks.Disable_Interrupts;
      end if;
   end Lock;

   ------------
   -- Unlock --
   ------------

   procedure Unlock is
   begin
      if not System.FreeRTOS.Tasks.In_ISR then
         System.FreeRTOS.Tasks.Enable_Interrupts;
      end if;
   end Unlock;

end Ada.Real_Time.Timing_Events;
