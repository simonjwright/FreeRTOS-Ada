--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Containing;
with Dispatching;
with Strings;

with Start_FreeRTOS_Scheduler;

procedure Testbed is
   function Fail (S : String) return String is
   begin
      return S (S'First .. Positive'Min (10, S'Length) + S'First - 1);
   end Fail;
begin
   --  declare
   --     S : constant String := Fail ("hello world");
   --  begin
   --     null;
   --  end;
   Start_FreeRTOS_Scheduler;
end Testbed;
