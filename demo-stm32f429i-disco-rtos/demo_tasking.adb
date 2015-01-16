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

procedure Demo_Tasking is
begin
   FreeRTOS.Tasks.Start_Scheduler;
   --  does not return
end Demo_Tasking;
