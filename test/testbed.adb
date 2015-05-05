--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

--  This program has no visible functionality; the idea is to use the
--  debugger to check that the expected effect has happened.

with Containing;
--  Ada.Containers

with Dispatching;
--  Tagged types

with Strings;
--  Secondary stack

with Last_Chance_Handler;
--  Check we can supply our own version, replacing libgnat's weak one.

with Interfaces.C.Strings;
--  Check we can build with this package in the closure.

with SO;
--  Check suspension objects.

with Streams;

with Start_FreeRTOS_Scheduler;

procedure Testbed is
   function Use_Secondary_Stack (S : String) return String;
   --  Is this allowed in the environment task? NO!
   function Use_Secondary_Stack (S : String) return String is
   begin
      return S (S'First .. Positive'Min (10, S'Length) + S'First - 1);
   end Use_Secondary_Stack;
begin
   declare
      Err : exception;
   begin
      begin
         raise Err with "test";
      end;
   exception
      when Err => null;
   end;
   declare
      S : constant String := Use_Secondary_Stack ("hello world");
   begin
      null;
   end;
   Streams.Check (42);
   Start_FreeRTOS_Scheduler;
end Testbed;
