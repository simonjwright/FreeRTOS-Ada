--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Real_Time;

package body Strings is

   function Substring (S : String) return String;

   task T;

   task body T is
   begin
      for J in 1 .. 20 loop
         declare
            S : constant String := Substring ("foo");
         begin
            null;
         end;
         declare
            S : constant String := Substring ("hello me hearties");
         begin
            null;
         end;
      end loop;
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

   function Substring (S : String) return String is
   begin
      return S (S'First .. Positive'Min (10, S'Length) + S'First - 1);
   end Substring;

end Strings;
