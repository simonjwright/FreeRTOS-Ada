------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          A D A . R E A L _ T I M E . T I M I N G _ E V E N T S           --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--           Copyright (C) 2005-2013, Free Software Foundation, Inc.        --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with System.BB.Time;

package body Ada.Real_Time.Timing_Events is

   procedure Handler_Wrapper
     (Event : in out System.BB.Timing_Events.Timing_Event'Class) with
   --  This wrapper is needed to make a clean conversion between
   --  System.BB.Timing_Events.Timing_Event_Handler and
   --  Ada.Real_Time.Timing_Events.Timing_Event_Handler.

     Pre =>

       --  Timing_Event can only be defined from the type defined in RM D.15
       --  Ada.Real_Time.Timing_Events.Timing_Event.

       Event in Ada.Real_Time.Timing_Events.Timing_Event;

   package SBTE renames System.BB.Timing_Events;

   ---------------------
   -- Handler_Wrapper --
   ---------------------

   procedure Handler_Wrapper
     (Event : in out System.BB.Timing_Events.Timing_Event'Class)
   is
      RT_Event : Timing_Event renames Timing_Event (Event);
      --  View conversion on the parameter

      Handler : constant Timing_Event_Handler := RT_Event.Real_Handler;

   begin
      if Handler /= null then
         RT_Event.Real_Handler := null;
         Handler.all (RT_Event);
      end if;
   end Handler_Wrapper;

   -----------------
   -- Set_Handler --
   -----------------

   procedure Set_Handler
     (Event   : in out Timing_Event;
      At_Time : Time;
      Handler : Timing_Event_Handler)
   is
      BB_Handler : constant System.BB.Timing_Events.Timing_Event_Handler :=
        (if Handler = null then null else Handler_Wrapper'Access);
      --  Keep a null low-level handler if we are setting a null handler
      --  (meaning that we the event is to be cleared as per D.15 par. 11/3).
      --  Otherwise, pass the address of the wrapper in charge of executing
      --  the actual handler (we need a wrapper because in addition to execute
      --  the handler we need to set the handler to null to indicate that it
      --  has already been executed).

   begin
      Event.Real_Handler := Handler;

      SBTE.Set_Handler (SBTE.Timing_Event (Event),
                        System.BB.Time.Time (At_Time),
                        BB_Handler);
   end Set_Handler;

   ---------------------
   -- Current_Handler --
   ---------------------

   function Current_Handler
     (Event : Timing_Event) return Timing_Event_Handler
   is
   begin
      return Event.Real_Handler;
   end Current_Handler;

   --------------------
   -- Cancel_Handler --
   --------------------

   procedure Cancel_Handler
     (Event     : in out Timing_Event;
      Cancelled : out Boolean)
   is
   begin
      SBTE.Cancel_Handler (SBTE.Timing_Event (Event), Cancelled);
      Event.Real_Handler := null;
   end Cancel_Handler;

   -------------------
   -- Time_Of_Event --
   -------------------

   function Time_Of_Event (Event : Timing_Event) return Time is
   begin
      return Time (SBTE.Time_Of_Event (SBTE.Timing_Event (Event)));
   end Time_Of_Event;

end Ada.Real_Time.Timing_Events;
