--  Copyright (C) 2020 Free Software Foundation, Inc.

--  This file is part of the FreeRTOS-Ada package.
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with Ada.Real_Time;

package body Delay_In_PO is

   protected body PO is

      procedure Potentially_Blocking is
      begin
         delay until Ada.Real_Time.Time_Last;
      end Potentially_Blocking;

   end PO;

end Delay_In_PO;
