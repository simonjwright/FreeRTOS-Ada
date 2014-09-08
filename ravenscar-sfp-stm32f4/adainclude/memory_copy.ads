--
--  Copyright (C) 2006-2013, AdaCore
--

--  This package provides a general block copy mechanisms analogous to that
--  provided by the C routine memcpy allowing for copies without overlap.

with System; use System;
with Interfaces.C; use Interfaces.C;

package Memory_Copy is
pragma Preelaborate;

   procedure memcpy (Dest : Address; Src : Address; N : size_t);
   pragma Export (C, memcpy, "memcpy");
   --  Copies N storage units from area starting at Src to area starting
   --  at Dest without any check for buffer overflow. The memory areas
   --  must not overlap, or the result of this call is undefined.

end Memory_Copy;
