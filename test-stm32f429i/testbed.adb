--  Copyright (C) 2016, 2017 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

--  This program has no visible functionality; the idea is to use the
--  debugger to check that the expected effect has happened.

with Ada.Real_Time;

with Containing;
pragma Unreferenced (Containing);
--  Ada.Containers

with Dispatching;
pragma Unreferenced (Dispatching);
--  Tagged types

with Floating_Point;
pragma Unreferenced (Floating_Point);
--  Floating point

with Images;
pragma Unreferenced (Images);
--  'Image(), 'Img

with Interfaces.C.Strings;
pragma Unreferenced (Interfaces.C.Strings);
--  Check we can build with this package in the closure.

with Interrupts;
pragma Unreferenced (Interrupts);
--  Check interrupt handling.

with Iteration;
pragma Unreferenced (Iteration);
--  Generalized iteration

with Heartbeat;
pragma Unreferenced (Heartbeat);
--  Timing

with Last_Chance_Handler;
pragma Unreferenced (Last_Chance_Handler);
--  Check we can supply our own version, replacing libgnat's weak one.

with Ada.Numerics.Elementary_Functions;

with SO;
pragma Unreferenced (SO);
--  Check suspension objects.

with Streams;

with Strings;
pragma Unreferenced (Strings);
--  Secondary stack

procedure Testbed is
   function Use_Secondary_Stack (S : String) return String;
   function Use_Secondary_Stack (S : String) return String is
   begin
      return S (S'First .. Positive'Min (10, S'Length) + S'First - 1);
   end Use_Secondary_Stack;
begin

   --  Check local handling of exceptions
   declare
      Err : exception;
   begin
      begin
         raise Err;
      end;
   exception
      when Err => null;
   end;

   --  Check secondary stack use
   declare
      S : constant String := Use_Secondary_Stack ("hello world")
        with Unreferenced;
   begin
      null;
   end;

   declare
      Result : Float := 0.0 with Volatile, Unreferenced;
   begin
      Result := Ada.Numerics.Elementary_Functions.Sqrt (2.0);
      --  need a valid statement inside the block for 'next' to get to
      --  in the debugger
      delay until Ada.Real_Time.Clock;
   end;

   --  Check streams
   Streams.Check (42);

   delay until Ada.Real_Time.Time_Last;
end Testbed;
