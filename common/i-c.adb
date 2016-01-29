------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                         I N T E R F A C E S . C                          --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--       Copyright (C) 1992-2009, 2016, Free Software Foundation, Inc.      --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Modified from GCC 4.9.1 for Cortex GNAT RTS.
--  The main change is the omission of wide characters.

package body Interfaces.C is

   -----------------------
   -- Is_Nul_Terminated --
   -----------------------

   --  Case of char_array

   function Is_Nul_Terminated (Item : char_array) return Boolean is
   begin
      for J in Item'Range loop
         if Item (J) = nul then
            return True;
         end if;
      end loop;

      return False;
   end Is_Nul_Terminated;

   ------------
   -- To_Ada --
   ------------

   --  Convert char to Character

   function To_Ada (Item : char) return Character is
   begin
      return Character'Val (char'Pos (Item));
   end To_Ada;

   --  Convert char_array to String (function form)

   function To_Ada
     (Item     : char_array;
      Trim_Nul : Boolean := True) return String
   is
      Count : Natural;
      From  : size_t;

   begin
      if Trim_Nul then
         From := Item'First;

         loop
            if From > Item'Last then
               raise Terminator_Error;
            elsif Item (From) = nul then
               exit;
            else
               From := From + 1;
            end if;
         end loop;

         Count := Natural (From - Item'First);

      else
         Count := Item'Length;
      end if;

      declare
         R : String (1 .. Count);

      begin
         for J in R'Range loop
            R (J) := To_Ada (Item (size_t (J) + (Item'First - 1)));
         end loop;

         return R;
      end;
   end To_Ada;

   --  Convert char_array to String (procedure form)

   procedure To_Ada
     (Item     : char_array;
      Target   : out String;
      Count    : out Natural;
      Trim_Nul : Boolean := True)
   is
      From : size_t;
      To   : Positive;

   begin
      if Trim_Nul then
         From := Item'First;
         loop
            if From > Item'Last then
               raise Terminator_Error;
            elsif Item (From) = nul then
               exit;
            else
               From := From + 1;
            end if;
         end loop;

         Count := Natural (From - Item'First);

      else
         Count := Item'Length;
      end if;

      if Count > Target'Length then
         raise Constraint_Error;

      else
         From := Item'First;
         To   := Target'First;

         for J in 1 .. Count loop
            Target (To) := Character (Item (From));
            From := From + 1;
            To   := To + 1;
         end loop;
      end if;

   end To_Ada;

   ----------
   -- To_C --
   ----------

   --  Convert Character to char

   function To_C (Item : Character) return char is
   begin
      return char'Val (Character'Pos (Item));
   end To_C;

   --  Convert String to char_array (function form)

   function To_C
     (Item       : String;
      Append_Nul : Boolean := True) return char_array
   is
   begin
      if Append_Nul then
         declare
            R : char_array (0 .. Item'Length);

         begin
            for J in Item'Range loop
               R (size_t (J - Item'First)) := To_C (Item (J));
            end loop;

            R (R'Last) := nul;
            return R;
         end;

      --  Append_Nul False

      else
         --  A nasty case, if the string is null, we must return a null
         --  char_array. The lower bound of this array is required to be zero
         --  (RM B.3(50)) but that is of course impossible given that size_t
         --  is unsigned. According to Ada 2005 AI-258, the result is to raise
         --  Constraint_Error. This is also the appropriate behavior in Ada 95,
         --  since nothing else makes sense.

         if Item'Length = 0 then
            raise Constraint_Error;

         --  Normal case

         else
            declare
               R : char_array (0 .. Item'Length - 1);

            begin
               for J in Item'Range loop
                  R (size_t (J - Item'First)) := To_C (Item (J));
               end loop;

               return R;
            end;
         end if;
      end if;
   end To_C;

   --  Convert String to char_array (procedure form)

   procedure To_C
     (Item       : String;
      Target     : out char_array;
      Count      : out size_t;
      Append_Nul : Boolean := True)
   is
      To : size_t;

   begin
      if Target'Length < Item'Length then
         raise Constraint_Error;

      else
         To := Target'First;
         for From in Item'Range loop
            Target (To) := char (Item (From));
            To := To + 1;
         end loop;

         if Append_Nul then
            if To > Target'Last then
               raise Constraint_Error;
            else
               Target (To) := nul;
               Count := Item'Length + 1;
            end if;

         else
            Count := Item'Length;
         end if;
      end if;
   end To_C;

end Interfaces.C;
