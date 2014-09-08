--
--  Copyright (C) 2006-2013, AdaCore
--

--  This package provides a general block copy mechanism analogous to that
--  provided by the C routine memmove allowing for copies with overlap.

with System; use System;
with Interfaces.C; use Interfaces.C;

package Memory_Move is
pragma Preelaborate;

   procedure memmove (Dest : Address; Src : Address; N : size_t);
   pragma Export (C, memmove, "memmove");
   --  Copies N storage units from area starting at S2 to area starting
   --  at S1 without any check for buffer overflow. The difference between
   --  this memmove and memcpy is that with memmove, the storage areas may
   --  overlap (forwards or backwards) and the result is correct (i.e. it
   --  is as if S2 is first moved to a temporary area, and then this area
   --  is copied to S1 in a separate step).

end Memory_Move;
