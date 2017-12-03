------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                   A D A . R E A L _ T I M E . D E L A Y S                --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--    Copyright (C) 1992-2010, 2016-2017, Free Software Foundation, Inc.    --
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

--  Modified from GCC 4.9.1 for Cortex GNAT RTS.

with Interfaces;

package body Ada.Real_Time.Delays is

   procedure Delay_Until (T : Time) is
      procedure vTaskDelay (Ticks_To_Delay : Interfaces.Unsigned_32)
      with
        Import,
        Convention => C,
        External_Name => "vTaskDelay";
      Timespan_To_Delay : constant Time_Span := T - Clock;
   begin
      if Timespan_To_Delay > 0.0 then
         --  Need to avoid problems with ambiguity; and the version in
         --  Real_Time returns Integer, whereas we actually want
         --  Unsigned_32.
         vTaskDelay
           (Interfaces.Unsigned_32
              (Standard."/" (Timespan_To_Delay, Tick)));
      end if;
   end Delay_Until;

   -----------------
   -- To_Duration --
   -----------------

   function To_Duration (T : Time) return Duration is
   begin
      return To_Duration (Time_Span (T));
   end To_Duration;

end Ada.Real_Time.Delays;
