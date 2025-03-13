--  Copyright (C) 2020 Free Software Foundation, Inc.

--  This file is part of the FreeRTOS-Ada package.
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

--  The purpose of this little suite is to provoke Program_Error by a
--  'delay until' inside a protected object.

package Delay_In_PO is

   protected PO is
      procedure Potentially_Blocking;
   end PO;

end Delay_In_PO;
