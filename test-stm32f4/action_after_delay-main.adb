--  Copyright (C) 2020 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with Ada.Real_Time;
procedure Action_After_Delay.Main is
begin
   delay until Ada.Real_Time.Time_Last;
end Action_After_Delay.Main;
