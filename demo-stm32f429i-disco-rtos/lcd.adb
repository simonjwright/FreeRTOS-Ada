--  Copyright Simon Wright <simon@pushface.org>
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with STM32F429I_Discovery.HAL;
with STM32F429I_Discovery.LCD;

procedure LCD is
   Font : constant STM32F429I_Discovery.LCD.Font :=
     STM32F429I_Discovery.LCD.Font_16;
   Lines : constant Natural := 320 / 16;
begin
   STM32F429I_Discovery.LCD.Initialize;
   STM32F429I_Discovery.LCD.Set_Back_Color
     (STM32F429I_Discovery.LCD.White);
   STM32F429I_Discovery.LCD.Set_Text_Color
     (STM32F429I_Discovery.LCD.Black);
   STM32F429I_Discovery.LCD.Set_Font
     (STM32F429I_Discovery.LCD.Font_16);
   STM32F429I_Discovery.LCD.Clear (To => STM32F429I_Discovery.LCD.Red);
   STM32F429I_Discovery.HAL.Wait (1000);
   for J in 0 .. Lines - 1 loop
      STM32F429I_Discovery.HAL.Wait (250);
      STM32F429I_Discovery.LCD.Clear_String_Line (J);
      STM32F429I_Discovery.HAL.Wait (250);
      STM32F429I_Discovery.LCD.Set_Text_Color
        (STM32F429I_Discovery.LCD.Color'Val
           (J mod
              (STM32F429I_Discovery.LCD.Color'Pos
                 (STM32F429I_Discovery.LCD.Color'Last) + 1)));
      STM32F429I_Discovery.LCD.Display_String_At_Line
        (J, "hello my lovelies from Ada");
   end loop;
   STM32F429I_Discovery.LCD.Clear_String_Line (Lines - 1);
   STM32F429I_Discovery.LCD.Display_String_At_Line (Lines - 1, "that's it");
   loop
      null;
   end loop;
end LCD;
