--  Copyright Simon Wright <simon@pushface.org>
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with Memory_Streams;

package body Streams is

   Str : aliased Memory_Streams.Stream_Type (Capacity => 32);

   procedure Check (N : Integer) is
      M : Integer;
   begin
      Integer'Write (Str'Access, N);
      Integer'Read (Str'Access, M);
      if M /= N then
         raise Program_Error with "Streams.Check: M /= N";
      end if;
   end Check;

end Streams;
