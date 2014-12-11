--  Copyright Simon Wright <simon@pushface.org>
--
--  This package is free software; you can redistribute it and/or
--  modify it under terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 3, or
--  (at your option) any later version.  It is distributed in the
--  hope that it will be useful, but WITHOUT ANY WARRANTY; without
--  even the implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE.
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

with Interfaces;
with System; use System;  -- See Display_String_At_Line

package body STM32F429I_Discovery.LCD is

   pragma Warnings (Off);
   type C_Alignment is (Center, Right, Left) with
     Convention => C;
   for C_Alignment use (Center => 1, Right => 2, Left => 3);
   C_Alignments : constant array (Alignment) of C_Alignment :=
     (Center => Center, Right => Right, Left => Left);
   pragma Warnings (On);

   C_Colors : constant array (Color) of Interfaces.Unsigned_32 :=
     (Blue         => 16#FF0000FF#,
        Green         => 16#FF00FF00#,
        Red           => 16#FFFF0000#,
        Cyan          => 16#FF00FFFF#,
        Magenta       => 16#FFFF00FF#,
        Yellow        => 16#FFFFFF00#,
        Light_Blue    => 16#FF8080FF#,
        Light_Green   => 16#FF80FF80#,
        Light_Red     => 16#FFFF8080#,
        Light_Cyan    => 16#FF80FFFF#,
        Light_Magenta => 16#FFFF80FF#,
        Light_Yellow  => 16#FFFFFF80#,
        Dark_Blue     => 16#FF000080#,
        Dark_Green    => 16#FF008000#,
        Dark_Red      => 16#FF800000#,
        Dark_Cyan     => 16#FF008080#,
        Dark_Magenta  => 16#FF800080#,
        Dark_Yellow   => 16#FF808000#,
        White         => 16#FFFFFFFF#,
        Light_Gray    => 16#FFD3D3D3#,
        Gray          => 16#FF808080#,
        Dark_Gray     => 16#FF404040#,
        Black         => 16#FF000000#,
        Brown         => 16#FFA52A2A#,
        Orange        => 16#FFFFA500#,
        Transparent   => 16#FF000000#);

   type C_Font is record
      Table  : access constant Interfaces.Unsigned_8;
      Width  : Interfaces.Unsigned_16;
      Height : Interfaces.Unsigned_16;
   end record with
     Convention => C;

   C_Font_24 : aliased C_Font with
     Import,
     Convention => C,
     External_Name => "Font24";
   C_Font_20 : aliased C_Font with
     Import,
     Convention => C,
     External_Name => "Font20";
   C_Font_16 : aliased C_Font with
     Import,
     Convention => C,
     External_Name => "Font16";
   C_Font_12 : aliased C_Font with
     Import,
     Convention => C,
     External_Name => "Font12";
   C_Font_8 : aliased C_Font with
     Import,
     Convention => C,
     External_Name => "Font8";

   C_Fonts : constant array (Font) of access constant C_Font :=
     (Font_8  => C_Font_8'Access,
      Font_12 => C_Font_12'Access,
      Font_16 => C_Font_16'Access,
      Font_20 => C_Font_20'Access,
      Font_24 => C_Font_24'Access);

   Status : Interfaces.Unsigned_8;

   pragma Warnings (Off);
   Width, Height : Interfaces.Unsigned_32;
   pragma Warnings (On);

   procedure Initialize is
      function BSP_LCD_Init return Interfaces.Unsigned_8 with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_Init";
      procedure BSP_LCD_LayerDefaultInit
        (Layerindex  : Interfaces.Unsigned_16;
         Framebuffer : Interfaces.Unsigned_32) with
           Import,
           Convention => C,
           External_Name => "BSP_LCD_LayerDefaultInit";
      procedure BSP_LCD_SelectLayer
        (Layerindex  : Interfaces.Unsigned_32) with
           Import,
           Convention => C,
           External_Name => "BSP_LCD_SelectLayer";
      function BSP_LCD_GetXSize return Interfaces.Unsigned_32 with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_GetXSize";
      function BSP_LCD_GetYSize return Interfaces.Unsigned_32 with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_GetYSize";
      use type Interfaces.Unsigned_8;
   begin
      Status := BSP_LCD_Init;
      if Status = 1 then
         raise Error with "BSP_LCD_Init failed";
      elsif Status = 2 then
         raise Timeout with "BSP_LCD_Init failed";
      end if;
      Width  := BSP_LCD_GetXSize;
      Height := BSP_LCD_GetYSize;
      --  These are *essential* if you want anything to actually
      --  display on the LCD!
      BSP_LCD_LayerDefaultInit (Layerindex  => 1,
                                Framebuffer => 16#D0000000#);
      BSP_LCD_SelectLayer (Layerindex => 1);
   end Initialize;

   procedure Clear (To : Color) is
      procedure BSP_LCD_Clear (To : Interfaces.Unsigned_32) with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_Clear";
   begin
      BSP_LCD_Clear (C_Colors (To));
   end Clear;

   procedure Set_Back_Color (To : Color) is
      procedure BSP_LCD_SetBackColor (To : Interfaces.Unsigned_32) with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_SetBackColor";
   begin
      BSP_LCD_SetBackColor (C_Colors (To));
   end Set_Back_Color;

   procedure Set_Text_Color (To : Color) is
      procedure BSP_LCD_SetTextColor (To : Interfaces.Unsigned_32) with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_SetTextColor";
   begin
      BSP_LCD_SetTextColor (C_Colors (To));
   end Set_Text_Color;

   procedure Set_Font (To : Font) is
      procedure BSP_LCD_SetFont (To : access constant C_Font) with
        Import,
        Convention => C,
        External_Name => "BSP_LCD_SetFont";
   begin
      BSP_LCD_SetFont (C_Fonts (To));
   end Set_Font;

   procedure Clear_String_Line (Line : Natural) is
      procedure BSP_LCD_ClearStringLine
        (Line : Interfaces.Unsigned_32) with
           Import,
           Convention => C,
           External_Name => "BSP_LCD_ClearStringLine";
   begin
      BSP_LCD_ClearStringLine (Interfaces.Unsigned_32 (Line));
   end Clear_String_Line;

   procedure Display_String_At_Line (Line : Natural; Message : String) is
      --  For some reason, System.Address will semantic-check but not
      --  compile because 'System is not visible'.
      procedure BSP_LCD_DisplayStringAtLine
        (Line : Interfaces.Unsigned_16;
         Ptr  : Address) with
           Import,
           Convention => C,
           External_Name => "BSP_LCD_DisplayStringAtLine";
      Chars : constant String (1 .. Message'Length + 1)
        := Message & Character'Val (0);
   begin
      BSP_LCD_DisplayStringAtLine (Interfaces.Unsigned_16 (Line),
                                   Chars (Chars'First)'Address);
   end Display_String_At_Line;

end STM32F429I_Discovery.LCD;
