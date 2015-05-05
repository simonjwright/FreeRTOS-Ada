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
