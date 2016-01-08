--  Copyright (C) 2016 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

with Ada.Real_Time;

package body Strings is

   function Substring (S : String) return String;

   task T;

   task body T is
   begin
      for J in 1 .. 20 loop
         declare
            S : constant String
              := Substring ("foo") with Unreferenced;
         begin
            null;
         end;
         declare
            S : constant String
              := Substring ("hello me hearties") with Unreferenced;
         begin
            null;
         end;
      end loop;
      declare
         Next : Ada.Real_Time.Time := Ada.Real_Time.Clock;
         use type Ada.Real_Time.Time;
      begin
         loop
            Next := Next + Ada.Real_Time.Milliseconds (500);
            delay until Next;
         end loop;
      end;
   end T;

   function Substring (S : String) return String is
   begin
      return S (S'First .. Positive'Min (10, S'Length) + S'First - 1);
   end Substring;

end Strings;
