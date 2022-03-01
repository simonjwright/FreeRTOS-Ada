--  Copyright (C) 2020 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with Ada.Real_Time;

package body Action_After_Delay is

   task T1;
   task T2;

   T2_Has_Run : Boolean := False with Volatile;

   task body T1 is
   begin
      loop
         exit when T2_Has_Run;
      end loop;
      --  PE here (because it's illegal in Ravenscar to exit a task)
      --  if T2 has run
   end T1;

   task body T2 is
      use type Ada.Real_Time.Time;
   begin
      delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (1);
      --  Shouldn't get here, since T1 hasn't reached a dispatching
      --  point.
      T2_Has_Run := True;
      delay until Ada.Real_Time.Time_Last;
   end T2;

end Action_After_Delay;
