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

with Ada.IO_Exceptions;

package body Memory_Streams is


   function Contents (Stream : Stream_Type)
                     return Ada.Streams.Stream_Element_Array is
      use type Ada.Streams.Stream_Element_Offset;
   begin
      return Stream.Buffer (Stream.Buffer'First .. Stream.Next_Write - 1);
   end Contents;


   function Length (Stream : Stream_Type) return Natural is
      use type Ada.Streams.Stream_Element_Offset;
   begin
      return Natural (Stream.Next_Write - Stream.Buffer'First);
   end Length;


   procedure Read
     (Stream : in out Stream_Type;
      Item   : out Ada.Streams.Stream_Element_Array;
      Last   : out Ada.Streams.Stream_Element_Offset) is
      use type Ada.Streams.Stream_Element_Offset;
      Available : constant Ada.Streams.Stream_Element_Offset
        := Stream.Next_Write - Stream.Next_Read;
      Required : constant Ada.Streams.Stream_Element_Offset
        := Item'Last + 1 - Item'First;
   begin
      if Required < Available then
         Item := Stream.Buffer (Stream.Next_Read
                                  .. Stream.Next_Read + Required - 1);
         Stream.Next_Read := Stream.Next_Read + Required;
         Last := Item'Last;
      else
         Item (Item'First .. Item'First + Available - 1)
           := Stream.Buffer (Stream.Next_Read .. Stream.Next_Write - 1);
         Stream.Next_Read := Stream.Next_Write;
         Last := Item'First + Available - 1;
      end if;
   end Read;


   procedure Read_Contents (From : access Ada.Streams.Root_Stream_Type'Class;
                            Stream : in out Stream_Type) is
      use type Ada.Streams.Stream_Element_Offset;
   begin
      Reset (Stream);
      Ada.Streams.Read (From.all, Stream.Buffer, Stream.Next_Write);
      Stream.Next_Write := Stream.Next_Write + 1;
   end Read_Contents;


   procedure Reset (Stream : out Stream_Type) is
   begin
      Stream.Next_Write := 1;
      Stream.Next_Read := 1;
   end Reset;


   procedure Set_Contents (From : Ada.Streams.Stream_Element_Array;
                           Stream : in out Stream_Type) is
      use type Ada.Streams.Stream_Element_Offset;
   begin
      Reset (Stream);
      if From'Length > Stream.Capacity then
         raise Ada.IO_Exceptions.End_Error;
      end if;
      Stream.Buffer (1 .. From'Length) := From;
      Stream.Next_Write := From'Length + 1;
   end Set_Contents;


   procedure Write
     (Stream : in out Stream_Type;
      Item   : in Ada.Streams.Stream_Element_Array) is
      use type Ada.Streams.Stream_Element_Offset;
   begin
      if Stream.Next_Write + Item'Length > Stream.Buffer'Last + 1 then
         raise Ada.IO_Exceptions.End_Error;
      end if;
      Stream.Buffer (Stream.Next_Write .. Stream.Next_Write + Item'Length - 1)
        := Item;
      Stream.Next_Write := Stream.Next_Write + Item'Length;
   end Write;


   procedure Write_Contents (To : access Ada.Streams.Root_Stream_Type'Class;
                             Stream : Stream_Type) is
      use type Ada.Streams.Stream_Element_Offset;
   begin
      Ada.Streams.Write
        (To.all, Stream.Buffer (Stream.Buffer'First .. Stream.Next_Write - 1));
   end Write_Contents;


end Memory_Streams;
