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

with STM32F429I_Discovery.HAL;
pragma Unreferenced (STM32F429I_Discovery.HAL);
pragma Elaborate_All (STM32F429I_Discovery.HAL);

package body STM32F429I_Discovery.LEDs is

   type Board_LED is (LED_3, LED_4) with
     Convention => C;
   for Board_LED use (LED_3 => 0,
                      LED_4 => 1);
   Board_LEDs : constant array (LED) of Board_LED :=
     (LED3 => LED_3,
      LED4 => LED_4);

   procedure Initialize is
      procedure BSP_LED_Init (The_LED : Board_LED) with
        Import,
        Convention => C,
        External_Name => "BSP_LED_Init";
   begin
      BSP_LED_Init (Board_LEDs (LED3));
      BSP_LED_Init (Board_LEDs (LED4));
   end Initialize;

   procedure Set    (The_LED : LED) is
      procedure BSP_LED_On (The_LED : Board_LED) with
        Import,
        Convention => C,
        External_Name => "BSP_LED_On";
   begin
      BSP_LED_On (Board_LEDs (The_LED));
   end Set;

   procedure Clear  (The_LED : LED) is
      procedure BSP_LED_Off (The_LED : Board_LED) with
        Import,
        Convention => C,
        External_Name => "BSP_LED_Off";
   begin
      BSP_LED_Off (Board_LEDs (The_LED));
   end Clear;

   procedure Toggle (The_LED : LED) is
      procedure BSP_LED_Toggle (The_LED : Board_LED) with
        Import,
        Convention => C,
        External_Name => "BSP_LED_Toggle";
   begin
      BSP_LED_Toggle (Board_LEDs (The_LED));
   end Toggle;

begin
   Initialize;
end STM32F429I_Discovery.LEDs;
