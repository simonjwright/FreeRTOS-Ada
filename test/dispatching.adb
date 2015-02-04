--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Real_Time;

package body Dispatching is

   function Basis (B : Base) return Character is ('a');

   function Value (D : Derived) return Integer is (42);

   task T;

   task body T is
      D : Derived;
   begin
      declare
         C : Character := D.Basis;
         V : Integer := D.Value;
      begin
         null;
      end;
      declare
         Next : Ada.Real_Time.Time := Ada.Real_Time.Clock;
         use type Ada.Real_Time.Time;
      begin
         loop
            Next := Next + Ada.Real_Time.Milliseconds (500);
            delay until Next;
         end loop;
      end;
   end T;

end Dispatching;
