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

package body Floating_Point is

   use type Ada.Real_Time.Time;

   function Square (F : Float) return Float;

   task Floats;
   task body Floats is
      Forty_Two : constant Float := 42.0;
      Result : Float with Volatile;
   begin
      loop
         Result := Square (Forty_Two);
         if Result / Forty_Two /= Forty_Two then
            raise Constraint_Error with "float mismatch";
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Floats;

   function Square (F : Float) return Float is (F * F);

   function Square (F : Long_Float) return Long_Float;

   task Long_Floats;
   task body Long_Floats is
      Forty_Two : constant Long_Float := 42.0;
      Result : Long_Float with Volatile;
   begin
      loop
         Result := Square (Forty_Two);
         if Result / Forty_Two /= Forty_Two then
            raise Constraint_Error with "long float mismatch";
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end Long_Floats;

   function Square (F : Long_Float) return Long_Float is (F * F);

end Floating_Point;
