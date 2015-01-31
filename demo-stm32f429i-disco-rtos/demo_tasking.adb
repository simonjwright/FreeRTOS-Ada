--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

--  This is the main program of the demonstration of the
--  FreeRTOS-based Ravenscar-style runtime system.

--  The body of the program is in the LEDs package; we just need it to
--  be included.
with LEDs;
pragma Unreferenced (LEDs);

--  For the moment, the tasking kernel has to be started explicitly in
--  user code.
with FreeRTOS.Tasks;

with Ada.Unchecked_Deallocation;

procedure Demo_Tasking is
   --  Simple-minded checks for memory allocation.
   type P is access Integer;
   procedure Free is new Ada.Unchecked_Deallocation (Integer, P);
   V : P := new Integer'(42);
begin
   if V.all /= 42 then
      raise Program_Error with "allocate variable contains the wrong value";
   end if;
   Free (V);
   if V /= null then
      raise Program_Error with "failed to free allocated variable";
   end if;
   FreeRTOS.Tasks.Start_Scheduler;
   --  does not return
end Demo_Tasking;
