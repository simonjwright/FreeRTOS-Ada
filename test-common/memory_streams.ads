--  Copyright (C) 2016 Free Software Foundation, Inc.

--  This package is free software; you can redistribute it and/or
--  modify it under terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 2, or
--  (at your option) any later version. This package is distributed in
--  the hope that it will be useful, but WITHOUT ANY WARRANTY; without
--  even the implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE. See the GNU General Public License for more
--  details. You should have received a copy of the GNU General Public
--  License distributed with this package; see file COPYING.  If not,
--  write to the Free Software Foundation, 59 Temple Place - Suite
--  330, Boston, MA 02111-1307, USA.

--  As a special exception, if other files instantiate generics from
--  this unit, or you link this unit with other files to produce an
--  executable, this unit does not by itself cause the resulting
--  executable to be covered by the GNU General Public License.  This
--  exception does not however invalidate any other reasons why the
--  executable file might be covered by the GNU Public License.

--  This unit has been copied from the Booch Components, where it was
--  BC.Support.Memory_Streams.

with Ada.Streams;

package Memory_Streams is

   pragma Preelaborate;

   type Stream_Type
     (Capacity : Ada.Streams.Stream_Element_Count)
      is new Ada.Streams.Root_Stream_Type with private;
   --  Provides an in-memory Stream.

   function Length (Stream : Stream_Type) return Natural;
   --  Returns the number of stream elements in Stream.

   function Contents (Stream : Stream_Type)
                     return Ada.Streams.Stream_Element_Array;
   --  Returns a copy of the contents of Stream.

   procedure Write_Contents (To : access Ada.Streams.Root_Stream_Type'Class;
                             Stream : Stream_Type);
   --  Writes the contents of Stream directly to the stream To.
   --
   --  If To is itself a memory Stream_Type, this will effectively
   --  concatenate Stream to To.

   procedure Read_Contents (From : access Ada.Streams.Root_Stream_Type'Class;
                            Stream : in out Stream_Type);
   --  Fills Stream directly from the stream From.
   --
   --  Reads the lesser of the Capacity of Stream and the "length" of
   --  From.
   --
   --  The previous contents of Stream are lost.

   procedure Set_Contents (From : Ada.Streams.Stream_Element_Array;
                           Stream : in out Stream_Type);
   --  Sets the contents of Stream to be the contents of array From.
   --
   --  Raises Ada.IO_Exceptions.End_Error if Stream is not
   --  large enough to contain From.
   --
   --  The previous contents of Stream are lost.
   --
   --  Aimed at use with datagram sockets, where you have to take the
   --  contents in one bite and can't know in advance how long the
   --  datagram is.

   procedure Reset (Stream : out Stream_Type);
   --  Clears Stream.

private

   type Stream_Type
     (Capacity : Ada.Streams.Stream_Element_Count)
   is new Ada.Streams.Root_Stream_Type with record
      Next_Write : Ada.Streams.Stream_Element_Count := 1;
      Next_Read : Ada.Streams.Stream_Element_Count := 1;
      Buffer : Ada.Streams.Stream_Element_Array (1 .. Capacity);
   end record;

   procedure Read
     (Stream : in out Stream_Type;
      Item   : out Ada.Streams.Stream_Element_Array;
      Last   : out Ada.Streams.Stream_Element_Offset);
   --  Removes Item'Length storage elements (or, as many as remain)
   --  from Stream. Last is updated to the final index in Item that
   --  was updated (normally, Item'Last). When Stream was already
   --  empty, Item will be unchanged and Last will be set to
   --  Item'First - 1.

   procedure Write
     (Stream : in out Stream_Type;
      Item   : in Ada.Streams.Stream_Element_Array);
   --  Adds Item to Stream. Raises Ada.IO_Exceptions.End_Error on
   --  overrun.

end Memory_Streams;
