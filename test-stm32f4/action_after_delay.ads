--  Copyright (C) 2020 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

--  The purpose of this little suite is to determine what happens when
--  one task is running and another, at the same priority, exits a
--  delay; will it run or be blocked?

package Action_After_Delay with Elaborate_Body is
end Action_After_Delay;
