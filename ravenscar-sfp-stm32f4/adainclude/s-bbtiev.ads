------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                S Y S T E M . B B . T I M I N G _ E V E N T S             --
--                                                                          --
--                                  S p e c                                 --
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

with System.BB.Time;
with System.Multiprocessors;

package System.Bb.Timing_Events is
   pragma Preelaborate;

   type Timing_Event;

   type Timing_Event_Handler
     is access procedure (Event : in out Timing_Event'Class);

   type Timing_Event_Access is access all Timing_Event;

   type Timing_Event is tagged limited record
      Timeout : System.BB.Time.Time := System.BB.Time.Time'First;
      --  The time at which the user's handler should be invoked when the event
      --  is "set" (i.e., when Handler is not null).

      Handler : Timing_Event_Handler := null;
      --  An access value designating the protected procedure to be invoked at
      --  the Timeout time in the future. When this value is null the event is
      --  said to be "cleared" and no timeout is processed.

      Next : Timing_Event_Access := null;
      --  Next event in the list

      Prev : Timing_Event_Access := null;
      --  Previous event in the list

      CPU : System.Multiprocessors.CPU;
      --  Owner of the timing event

   end record;

   procedure Set_Handler
     (Event   : in out Timing_Event;
      At_Time : System.BB.Time.Time;
      Handler : Timing_Event_Handler);
   --  Associate the handler Handler with the event Event: if Handler is null
   --  the event is cleared; otherwise, it is set, and the execution time for
   --  the event to be At_Time.
   --
   --  A call of a procedure Set_Handler for an event that is already set
   --  replaces the handler and the time of execution; if Handler is not null,
   --  the event remains set.

   function Current_Handler
     (Event : Timing_Event) return Timing_Event_Handler;
   --  Return the handler associated with Event if that event is set, null
   --  otherwise.

   procedure Cancel_Handler
     (Event     : in out Timing_Event;
      Cancelled : out Boolean);
   --  Clear the event if it is set. Cancelled is assigned True if the event
   --  was set prior to it being cleared; otherwise, it is assigned False.

   function Time_Of_Event (Event : Timing_Event) return System.BB.Time.Time;
   --  Return the time of the event if the event is set, Time'First otherwise

   function Get_Next_Timeout
     (CPU_Id : System.Multiprocessors.CPU) return System.BB.Time.Time;
   pragma Inline (Get_Next_Timeout);
   --  Return the next expiration time for all timing events associated with
   --  CPU_Id. Return Time'Last if no timing event is pending for CPU_Id.

   procedure Execute_Expired_Timing_Events (Now : System.BB.Time.Time);
   --  Execute all timing events whose expiration time is before Now

end System.BB.Timing_Events;
