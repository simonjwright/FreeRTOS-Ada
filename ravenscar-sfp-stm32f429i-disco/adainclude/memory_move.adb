--
--  Copyright (C) 2006-2013, AdaCore
--

with Ada.Unchecked_Conversion;

package body Memory_Move is

   subtype mem is char_array (size_t);
   type memptr is access all mem;
   function to_memptr is new Ada.Unchecked_Conversion (Address, memptr);

   -------------
   -- memmove --
   -------------

   procedure memmove (Dest : Address; Src : Address; N : size_t) is
      dest_p : constant memptr := to_memptr (Dest);
      src_p  : constant memptr := to_memptr (Src);
   begin
      --  Return immediately if no bytes to copy.

      if N = 0 then
         return;
      end if;

      --  This function must handle overlapping memory regions
      --  for the source and destination. If the Dest buffer is
      --  located past the Src buffer then we use backward copying,
      --  and forward copying otherwise.

      if Dest > Src then
         for J in reverse 0 .. N - 1 loop
            dest_p (J) := src_p (J);
         end loop;
      else
         for J in 0 .. N - 1 loop
            dest_p (J) := src_p (J);
         end loop;
      end if;
   end memmove;

end Memory_Move;
