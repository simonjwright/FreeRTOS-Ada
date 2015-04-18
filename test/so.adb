--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Real_Time;
with Ada.Synchronous_Task_Control;

package body SO is

   The_SO: Ada.Synchronous_Task_Control.Suspension_Object;

   task T;
   task body T is
   begin
      loop
         Ada.Synchronous_Task_Control.Suspend_Until_True (The_SO);
      end loop;
   end T;

   task Tick;
   task body Tick is
      use type Ada.Real_Time.Time;
   begin
      loop
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
         Ada.Synchronous_Task_Control.Set_True (The_SO);
      end loop;
   end Tick;

end SO;
