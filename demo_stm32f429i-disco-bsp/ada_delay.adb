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
--
--  Copyright Simon Wright <simon@pushface.org>

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
