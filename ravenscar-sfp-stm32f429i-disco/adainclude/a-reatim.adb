------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--                         A D A . R E A L _ T I M E                        --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                     Copyright (C) 2001-2014, AdaCore                     --
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
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This is the Ravenscar version of this package for generic bare board
--  targets. Note that the operations here assume that Time is a 64-bit
--  unsigned integer and Time_Span is a 64-bit signed integer.

with System.Tasking;
with System.Task_Primitives.Operations;

with Ada.Unchecked_Conversion;

package body Ada.Real_Time is
   pragma Suppress (Overflow_Check);
   --  This package has careful manual overflow checks, and unsupresses them
   --  where appropriate. This default enables compilation with checks enabled
   --  on Ravenscar SFP, where 64-bit multiplication with overflow checking is
   --  not available.

   package OSI renames System.OS_Interface;
   subtype LLI is Long_Long_Integer;

   ------------------------------------------------------------
   -- Handling of Conversions Between Duration and Time_Span --
   ------------------------------------------------------------

   --  For the To_Duration and To_Time_Span conversion functions, we use the
   --  intermediate Integer representation of Duration (64-bit) to allow for
   --  simple Integer operations instead of Float. We take advantage of the
   --  fact that Duration is represented as an Integer with units of Small.
   --  Within these conversions we perform the range checks required by
   --  AI-00432 manually.

   --  Note that in the past, within To_Duration and To_Time_Span, we were
   --  first computing the conversion factor between Duration and Time_Span
   --  (10 ** 9 / Clock_Frecuency) and then we multiplied or divided by it. The
   --  advantage of this approach was that the operations were simple, and we
   --  limited a lot the number of occurrences of overflows, but the accuracy
   --  loss could be significant depending on the clock frequency. For example,
   --  with a clock frequency of 600 MHz the factor was 1.66, which was rounded
   --  to 1 (Integer), and hence with a 67% difference.

   --  We tried also to have a better trade off (Contraint_Error being raised
   --  when transforming very big values, but limiting a lot the loss of
   --  accuracy) using Clock_Frequency in MHz instead of Hz. Therefore, we
   --  multiplied first by 10 ** 3 (or Clock_Frequency / 10 ** 6 which is
   --  typically smaller than 1000), and hence overflow could occur only with
   --  really big values). The problem of this approach was that some processor
   --  frequencies may not be expressed in multiples of MHz (for example,
   --  33.3333 MHz). The approach finally followed is to do the operations
   --  "by hand" on the upper and the lower part of the 64-bit value. This is
   --  slightly heavier, but we can preserve the best accuracy and the lowest
   --  occurrence of overflows.

   -----------------------
   -- Local definitions --
   -----------------------

   type Uint_64 is mod 2 ** 64;
   --  Type used to represent intermediate results of arithmetic operations

   Max_Pos_Time_Span : constant := Uint_64 (Time_Span_Last);
   Max_Neg_Time_Span : constant := Uint_64 (2 ** 63);
   --  Absolute value of Time_Span_Last and Time_Span_First. Used in overflow
   --  checks. Note that we avoid using abs on Time_Span_First everywhere.

   -----------------------
   -- Local subprograms --
   -----------------------

   function To_Duration is
     new Ada.Unchecked_Conversion (LLI, Duration);

   function To_Integer is
     new Ada.Unchecked_Conversion (Duration, LLI);

   function Mul_Div (V : Uint_64; M : Natural; D : Natural) return Uint_64;
   --  Compute V * M / D. Constraint_Error is raised in case of overflow,
   --  results above (2 ** 63) - 1 are considered as overflow. Therefore,
   --  the result can safely be converted to a signed 64-bit value.

   ---------
   -- "*" --
   ---------

   function "*" (Left : Time_Span; Right : Integer) return Time_Span is
      Is_Negative : constant Boolean :=
        (Left > 0 and then Right < 0) or else (Left < 0 and then Right > 0);
      --  Sign of the result

      Max_Value : constant Uint_64 :=
        (if Is_Negative then Max_Neg_Time_Span else Max_Pos_Time_Span);
      --  Maximum absolute value that can be returned by the multiplication
      --  taking into account the sign of the operators.

      Abs_Left : constant Uint_64 :=
        (if Left = Time_Span_First then Max_Neg_Time_Span
         else Uint_64 (abs (Left)));
      --  Remove sign of left operator

      Abs_Right : constant Uint_64 := Uint_64 (abs (LLI (Right)));
      --  Remove sign of right operator

   begin
      --  Overflow check is performed by hand assuming that Time_Span is a
      --  64-bit signed integer. Otherwise these checks would need an
      --  intermediate type with more than 64-bit. The sign of the operators
      --  is removed to simplify the intermediate computation of the overflow
      --  check.

      if Abs_Right /= 0 and then Max_Value / Abs_Right < Abs_Left then
         raise Constraint_Error;
      else
         return Left * Time_Span (Right);
      end if;
   end "*";

   function "*" (Left : Integer; Right : Time_Span) return Time_Span is
   begin
      return Right * Left;
   end "*";

   ---------
   -- "+" --
   ---------

   function "+" (Left : Time; Right : Time_Span) return Time is
   begin
      --  Overflow checks are be performed by hand assuming that Time and
      --  Time_Span are 64-bit unsigned and signed integers respectively.
      --  Otherwise these checks would need an intermediate type with more
      --  than 64 bits.

      if Right >= 0
        and then Uint_64 (Time_Last) - Uint_64 (Left) >= Uint_64 (Right)
      then
         return Time (Uint_64 (Left) + Uint_64 (Right));

      elsif Right = Time_Span'First and then Left >= Max_Neg_Time_Span then
         return Time (Uint_64 (Left) - Max_Neg_Time_Span);

      elsif Right < 0 and then Left >= Time (abs (Right)) then
         return Time (Uint_64 (Left) - Uint_64 (abs (Right)));

      else
         raise Constraint_Error;
      end if;
   end "+";

   function "+" (Left, Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (LLI (Left) + LLI (Right));
   end "+";

   ---------
   -- "-" --
   ---------

   function "-" (Left : Time; Right : Time_Span) return Time is
   begin
      --  Overflow checks must be performed by hand assuming that Time and
      --  Time_Span are 64-bit unsigned and signed integers respectively.
      --  Otherwise these checks would need an intermediate type with more
      --  than 64-bit.

      if Right >= 0 and then Left >= Time (Right) then
         return Time (Uint_64 (Left) - Uint_64 (Right));

      elsif Right = Time_Span'First
        and then Uint_64 (Time_Last) - Uint_64 (Left) >= Max_Neg_Time_Span
      then
         return Left + Time (Max_Neg_Time_Span);

      elsif Right < 0
        and then Uint_64 (Time_Last) - Uint_64 (Left) >= Uint_64 (abs (Right))
      then
         return Left + Time (abs (Right));

      else
         raise Constraint_Error;
      end if;
   end "-";

   function "-" (Left, Right : Time) return Time_Span is
   begin
      --  Overflow checks must be performed by hand assuming that Time and
      --  Time_Span are 64-bit unsigned and signed integers respectively.
      --  Otherwise these checks would need an intermediate type with more
      --  than 64-bit.

      if Left >= Right
        and then Uint_64 (Left) - Uint_64 (Right) <= Uint_64 (Time_Span_Last)
      then
         return Time_Span (Uint_64 (Left) - Uint_64 (Right));

      elsif Left < Right
        and then Uint_64 (Right) - Uint_64 (Left) <= Max_Neg_Time_Span
      then
         return Time_Span (-(Uint_64 (Right) - Uint_64 (Left)));

      else
         raise Constraint_Error;
      end if;
   end "-";

   function "-" (Left, Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (LLI (Left) - LLI (Right));
   end "-";

   function "-" (Right : Time_Span) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Time_Span (-LLI (Right));
   end "-";

   ---------
   -- "/" --
   ---------

   function "/" (Left, Right : Time_Span) return Integer is
      pragma Unsuppress (Overflow_Check);
   begin
      return Integer (LLI (Left) / LLI (Right));
   end "/";

   function "/" (Left : Time_Span; Right : Integer) return Time_Span is
      pragma Unsuppress (Overflow_Check);
   begin
      return Left / Time_Span (Right);
   end "/";

   -----------
   -- Clock --
   -----------

   function Clock return Time is
   begin
      return Time (System.Task_Primitives.Operations.Monotonic_Clock);
   end Clock;

   ------------------
   -- Microseconds --
   ------------------

   function Microseconds (US : Integer) return Time_Span is
   begin
      --  Overflow can't happen (Ticks_Per_Second is Natural)

      return Time_Span
        (LLI (US) * LLI (OSI.Ticks_Per_Second)) / Time_Span (10#1#E6);
   end Microseconds;

   ------------------
   -- Milliseconds --
   ------------------

   function Milliseconds (MS : Integer) return Time_Span is
   begin
      --  Overflow can't happen (Ticks_Per_Second is Natural)

      return Time_Span
        (LLI (MS) * LLI (OSI.Ticks_Per_Second)) / Time_Span (10#1#E3);
   end Milliseconds;

   -------------
   -- Minutes --
   -------------

   function Minutes (M : Integer) return Time_Span is
      Min_M : constant LLI := LLI'First / LLI (OSI.Ticks_Per_Second);
      Max_M : constant LLI := LLI'Last  / LLI (OSI.Ticks_Per_Second);
      --  Bounds for Sec_M.  Note that we can't use unsupress overflow checks,
      --  as this would require the use of arit64

      Sec_M : constant LLI := LLI (M) * 60;
      --  M converted to seconds

   begin
      if Sec_M < Min_M or else Sec_M > Max_M then
         raise Constraint_Error;
      else
         return Time_Span (Sec_M * LLI (OSI.Ticks_Per_Second));
      end if;
   end Minutes;

   -----------------
   -- Nanoseconds --
   -----------------

   function Nanoseconds (NS : Integer) return Time_Span is
   begin
      --  Overflow can't happen (Ticks_Per_Second is Natural)

      return Time_Span
        (LLI (NS) * LLI (OSI.Ticks_Per_Second)) / Time_Span (10#1#E9);
   end Nanoseconds;

   -------------
   -- Seconds --
   -------------

   function Seconds (S : Integer) return Time_Span is
   begin
      --  Overflow can't happen (Ticks_Per_Second is Natural)

      return Time_Span (LLI (S) * LLI (OSI.Ticks_Per_Second));
   end Seconds;

   -----------
   -- Split --
   -----------

   procedure Split (T : Time; SC : out Seconds_Count; TS : out Time_Span) is
      Res : constant Time := Time (OSI.Ticks_Per_Second);
   begin
      SC := Seconds_Count (T / Res);
      TS := T - Time (SC) * Res;
   end Split;

   -------------
   -- Time_Of --
   -------------

   function Time_Of (SC : Seconds_Count; TS : Time_Span) return Time is
      Res : constant Time := Time (OSI.Ticks_Per_Second);
   begin
      if Time_Last / Res < Time (SC) then
         raise Constraint_Error;
      else
         return Time (SC) * Res + TS;
      end if;
   end Time_Of;

   -------------
   -- Mul_Div --
   -------------

   function Mul_Div (V : Uint_64; M : Natural; D : Natural) return Uint_64 is

      --  Upper case letters represent one word (32-bit words in our case).
      --  If we can compute, PQ = AB / D, then we can compute ABC / D using
      --  the following method (pencil and paper algorithm):

      --  MN  := AB / D       (first quotient)
      --  R   := AB - MN * D  (remainder on one word, as R < D)
      --  OP  := RC / D       (second quotient)
      --  res := MN0 + OP

      --  We check absence of overflow in the final result by checking that
      --  M is 0, and that there is no carry when adding N0 and OP.

      --  Initially, A = 0, BC = V

      V_Hi : Uint_64 := V / 2 ** 32;   -- AB
      V_Lo : Uint_64 := V rem 2 ** 32; --  C

      Result_Hi : Uint_64;
      --  High part of the result

      Result_Lo : Uint_64;
      --  Low part of the result

      Remainder : Uint_64;
      --  Remainder of the first division (denoted R above)

   begin
      --  Multiply V by M

      V_Hi := V_Hi * Uint_64 (M);
      V_Lo := V_Lo * Uint_64 (M);
      V_Hi := V_Hi + V_Lo / 2 ** 32;
      V_Lo := V_Lo rem 2 ** 32;

      --  First quotient

      Result_Hi := V_Hi / Uint_64 (D);

      if Result_Hi > (2 ** 31 - 1) then

         --  The final result conversion would overflow: Result_Hi will be
         --  the high 32 bit part of the result.

         raise Constraint_Error;
      end if;

      Remainder := V_Hi - Result_Hi * Uint_64 (D);

      Result_Hi := Result_Hi * 2 ** 32;

      --  Second quotient. To improve rounding, D / 2 is added

      Result_Lo :=
        (V_Lo + Remainder * 2 ** 32 + Uint_64 (D / 2)) / Uint_64 (D);

      if Result_Lo > (2 ** 63 - 1) - Result_Hi then

         --  The final conversion for the result (just below) would overflow

         raise Constraint_Error;
      end if;

      return Result_Hi + Result_Lo;
   end Mul_Div;

   -----------------
   -- To_Duration --
   -----------------

   function To_Duration (TS : Time_Span) return Duration is
      Duration_Units : constant Natural := Natural (1.0 / Duration'Small);
      --  Number of units of Duration in one second. The result is correct
      --  (not rounded) as Duration'Small is 10.0**(-9)

      Result : LLI;
      --  Contains the temporary result

      Is_Negative : constant Boolean := TS < 0;
      --  Remove the sign to simplify the intermediate computations

      TPS : constant Natural := OSI.Ticks_Per_Second;
      --  Capture ticks per second value

   begin
      --  See comment at the beginning of this file about this implementation

      --  We need to accurately compute TS * Duration_Units / Ticks_Per_Second
      --  TS being a 64-bit integer, both Duration_Units and Ticks_Per_Second
      --  are 32-bit integers.

      Result :=
        (if TS = Time_Span'First
         then LLI (Mul_Div (Max_Neg_Time_Span, Duration_Units, TPS))
         else LLI (Mul_Div (Uint_64 (abs TS),  Duration_Units, TPS)));

      --  Handle the sign of the result

      if Is_Negative then
         Result := -Result;
      end if;

      return To_Duration (Result);
   end To_Duration;

   ------------------
   -- To_Time_Span --
   ------------------

   function To_Time_Span (D : Duration) return Time_Span is
      Duration_Units : constant Natural := Natural (1.0 / Duration'Small);
      --  Number of units of Duration in one second

      Result : LLI;
      --  Contains the temporary results

      Is_Negative : constant Boolean := D < 0.0;
      --  Remove the sign to simplify the intermediate computations

   begin
      --  See comment at the beginning of this file about this implementation

      Result := LLI
        (Mul_Div (Uint_64 (abs To_Integer (D)),
                  OSI.Ticks_Per_Second,
                  Duration_Units));

      --  Handle the sign of the result

      if Is_Negative then
         Result := -Result;
      end if;

      return Time_Span (Result);
   end To_Time_Span;

begin
   --  Ensure that the tasking run time is initialized when using clock and/or
   --  delay operations. The initialization routine has the required machinery
   --  to prevent multiple calls to Initialize.

   System.Tasking.Initialize;
end Ada.Real_Time;
