--  Copyright Simon Wright <simon@pushface.org>
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

package Clocking with Elaborate_Body is

   --  Flag_<n> is set every <n> milliseconds. Clear it to indicate
   --  that the corresponding processing is complete.

   Flag_125 : Boolean := False with Volatile;
   Flag_250 : Boolean := False with Volatile;
   Flag_500 : Boolean := False with Volatile;

end Clocking;
