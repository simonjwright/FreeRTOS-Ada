--  Copyright Simon Wright <simon@pushface.org>
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with Clocking;
with STM32F429I_Discovery.HAL;
with STM32F429I_Discovery.Buttons;
with STM32F429I_Discovery.LEDs;

procedure Ada_Delay is

   use all type STM32F429I_Discovery.LEDs.LED;

   type Speed is (Slow, Fast);
   type Order is array (Speed) of STM32F429I_Discovery.LEDs.LED;
   --  The choice of which LED blinks slow and which fast is
   --  controlled by whether the pushbutton is pressed or not.
   Orders : constant array (Boolean) of Order :=
     (False => (Slow => Red,
                Fast => Green),
      True =>  (Slow => Green,
                Fast => Red));

begin
   STM32F429I_Discovery.HAL.Initialize;

   STM32F429I_Discovery.Buttons.Initialize;
   STM32F429I_Discovery.LEDs.Initialize;

   loop
      declare
         The_Order : constant Order :=
           Orders (STM32F429I_Discovery.Buttons.Pressed);
      begin
         if Clocking.Flag_125 then
            Clocking.Flag_125 := False;
            STM32F429I_Discovery.LEDs.Toggle (The_Order (Fast));
         end if;

         if Clocking.Flag_250 then
            Clocking.Flag_250 := False;
            null;
         end if;

         if Clocking.Flag_500 then
            Clocking.Flag_500 := False;
             STM32F429I_Discovery.LEDs.Toggle (The_Order (Slow));
         end if;
      end;
   end loop;
end Ada_Delay;
