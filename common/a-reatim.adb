------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--                         A D A . R E A L _ T I M E                        --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--             Copyright (C) 1991-1994, Florida State University            --
--                     Copyright (C) 1995-2010, AdaCore                     --
--             Copyright (C) 2016, Free Software Foundation Inc.            --
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
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

with Interfaces;
with System.FreeRTOS.Tasks;

package body Ada.Real_Time is

   ---------
   -- "*" --
   ---------

   --  Note that Constraint_Error may be propagated

   function "*" (Left : Time_Span; Right : Integer) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (Time_Base (Left) * Right);
   end "*";

   function "*" (Left : Integer; Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (Left * Time_Base (Right));
   end "*";

   ---------
   -- "+" --
   ---------

   --  Note that Constraint_Error may be propagated

   function "+" (Left : Time; Right : Time_Span) return Time is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time (Time_Base (Left) + Time_Base (Right));
   end "+";

   function "+" (Left : Time_Span; Right : Time) return Time is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time (Time_Base (Left) + Time_Base (Right));
   end "+";

   function "+" (Left, Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (Time_Base (Left) + Time_Base (Right));
   end "+";

   ---------
   -- "-" --
   ---------

   --  Note that Constraint_Error may be propagated

   function "-" (Left : Time; Right : Time_Span) return Time is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time (Time_Base (Left) - Time_Base (Right));
   end "-";

   function "-" (Left, Right : Time) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (Time_Base (Left) - Time_Base (Right));
   end "-";

   function "-" (Left, Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (Time_Base (Left) - Time_Base (Right));
   end "-";

   function "-" (Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span_Zero - Right;
   end "-";

   ---------
   -- "/" --
   ---------

   --  Note that Constraint_Error may be propagated

   function "/" (Left, Right : Time_Span) return Integer is
      pragma Unsuppress (Overflow_Check);
   begin
      return Integer (Time_Base (Left) / Time_Base (Right));
   end "/";

   function "/" (Left : Time_Span; Right : Integer) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (Time_Base (Left) / Right);
   end "/";

   -----------
   -- Clock --
   -----------

   function Clock return Time is
      --  This is a simple-minded version, which is only valid up to
      --  2**32 / 1000 seconds from system startup. This is
      --  approximately 50 days.

      --  FreeRTOSConfig.h has set configUSE_16_BIT_TICKS to 0 (so we
      --  get 32-bit ticks) and configTICK_RATE_HZ to 1000.
      function xTaskGetTickCount return Interfaces.Unsigned_32
      with
        Import,
        Convention => C,
        External_Name => "xTaskGetTickCount";
      function xTaskGetTickCountFromISR return Interfaces.Unsigned_32
      with
        Import,
        Convention => C,
        External_Name => "xTaskGetTickCountFromISR";
   begin
      return Tick * Time_Base ((if System.FreeRTOS.Tasks.In_ISR
                                then xTaskGetTickCountFromISR
                                else xTaskGetTickCount));
   end Clock;

   ------------------
   -- Microseconds --
   ------------------

   function Microseconds (US : Integer) return Time_Span is
   begin
      return Time_Span (US) / 1_000_000;
   end Microseconds;

   ------------------
   -- Milliseconds --
   ------------------

   function Milliseconds (MS : Integer) return Time_Span is
   begin
      return Time_Span (MS) / 1_000;
   end Milliseconds;

   -------------
   -- Minutes --
   -------------

   function Minutes (M : Integer) return Time_Span is
   begin
      return Milliseconds (M) * Integer'(60_000);
   end Minutes;

   -----------------
   -- Nanoseconds --
   -----------------

   function Nanoseconds (NS : Integer) return Time_Span is
   begin
      return Time_Span (NS) / 1_000_000_000;
   end Nanoseconds;

   -------------
   -- Seconds --
   -------------

   function Seconds (S : Integer) return Time_Span is
   begin
      return Milliseconds (S) * Integer'(1000);
   end Seconds;

   -----------
   -- Split --
   -----------

   procedure Split (T : Time; SC : out Seconds_Count; TS : out Time_Span) is
      T_Val : Time;

   begin
      --  Special-case for Time_First, whose absolute value is anomalous,
      --  courtesy of two's complement.

      T_Val := (if T = Time_First then abs (Time_Last) else abs (T));

      --  Extract the integer part of T, truncating towards zero

      SC :=
        (if T_Val < 0.5 then 0 else Seconds_Count (Time_Span'(T_Val - 0.5)));

      if T < 0.0 then
         SC := -SC;
      end if;

      --  If original time is negative, need to truncate towards negative
      --  infinity, to make TS non-negative, as per ARM.

      if Time (SC) > T then
         SC := SC - 1;
      end if;

      TS := Time_Span (Time_Base (T) - Time_Base (SC));
   end Split;

   -------------
   -- Time_Of --
   -------------

   function Time_Of (SC : Seconds_Count; TS : Time_Span) return Time is
   begin
      return Time (SC) + TS;
   end Time_Of;

   -----------------
   -- To_Duration --
   -----------------

   function To_Duration (TS : Time_Span) return Duration is
      pragma Unsuppress (Overflow_Check);
   begin
      return Duration (TS);
   end To_Duration;

   ------------------
   -- To_Time_Span --
   ------------------

   function To_Time_Span (D : Duration) return Time_Span is
   begin
      --  Note regarding AI-00432 requiring range checking on this
      --  conversion.  The range of Time_Span is greater than that of
      --  Duration, so there is no issue of overflow.

      return Time_Span (D);
   end To_Time_Span;

--  begin
   --  Ensure that the tasking run time is initialized when using clock and/or
   --  delay operations. The initialization routine has the required machinery
   --  to prevent multiple calls to Initialize.

   --  System.Tasking.Initialize;
end Ada.Real_Time;
