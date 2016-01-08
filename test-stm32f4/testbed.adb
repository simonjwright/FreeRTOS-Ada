--  Copyright (C) Simon Wright <simon@pushface.org>

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

with Containing;
--  Ada.Containers

with Dispatching;
--  Tagged types

with Iteration;
pragma Unreferenced (Iteration);
--  Generalized iteration

with Last_Chance_Handler;
pragma Unreferenced (Last_Chance_Handler);
--  Check we can supply our own version, replacing libgnat's weak one.

with Interfaces.C.Strings;
pragma Unreferenced (Interfaces.C.Strings);
--  Check we can build with this package in the closure.

with SO;
--  Check suspension objects.

with Streams;

with Strings;
--  Secondary stack

with Start_FreeRTOS_Scheduler;

procedure Testbed is
   function Use_Secondary_Stack (S : String) return String;
   function Use_Secondary_Stack (S : String) return String is
   begin
      return S (S'First .. Positive'Min (10, S'Length) + S'First - 1);
   end Use_Secondary_Stack;
begin
   declare
      Err : exception;
   begin
      begin
         raise Err;
      end;
   exception
      when Err => null;
   end;
   declare
      S : constant String := Use_Secondary_Stack ("hello world")
        with Unreferenced;
   begin
      null;
   end;
   Streams.Check (42);
   Start_FreeRTOS_Scheduler;
end Testbed;
