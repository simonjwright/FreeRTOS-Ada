--  Copyright Simon Wright <simon@pushface.org>
--
--  This file is free software; you can redistribute it and/or modify
--  it under terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3, or (at your
--  option) any later version. This file is distributed in the hope
--  that it will be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
--  PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

--  This package offers a minimal interface to the STM32 BSP
--  facilities, which include multiple layers, drawing of
--  rectangles/ellipses, and display of bitmaps.

package STM32F429I_Discovery.LCD is

   --  Raised on failure to initialize.
   Error : exception;
   Timeout : exception;

   procedure Initialize;

   type Alignment is (Center, Right, Left) with
     Convention => C;
   for Alignment use (Center => 1, Right => 2, Left => 3);

   type Color is
     (Blue,
      Green,
      Red,
      Cyan,
      Magenta,
      Yellow,
      Light_Blue,
      Light_Green,
      Light_Red,
      Light_Cyan,
      Light_Magenta,
      Light_Yellow,
      Dark_Blue,
      Dark_Green,
      Dark_Red,
      Dark_Cyan,
      Dark_Magenta,
      Dark_Yellow,
      White,
      Light_Gray,
      Gray,
      Dark_Gray,
      Black,
      Brown,
      Orange,
      Transparent);

   procedure Clear (To : Color);
   procedure Set_Back_Color (To : Color);
   procedure Set_Text_Color (To : Color);

   type Font is (Font_8, Font_12, Font_16, Font_20, Font_24);
   Default_Font : constant Font := Font_24;

   procedure Set_Font (To : Font);

   procedure Clear_String_Line (Line : Natural);
   procedure Display_String_At_Line (Line : Natural; Message : String);

end STM32F429I_Discovery.LCD;
