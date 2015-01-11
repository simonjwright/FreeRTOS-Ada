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

package body STM32F429I_Discovery.Buttons is

   type Button_TypeDef is (Button_Key) with
     Convention => C;

   type ButtonMode_TypeDef is
     (BUTTON_MODE_GPIO,
      BUTTON_MODE_EXTI) with
        Convention => C;
   pragma Unreferenced (BUTTON_MODE_GPIO);

   procedure BSP_PB_Init
     (Button : Button_TypeDef;
      ButtonMode : ButtonMode_TypeDef) with
        Import,
        Convention => C,
        External_Name => "BSP_PB_Init";

   function BSP_PB_GetState
     (The_Button : Button_TypeDef) return Interfaces.Unsigned_32 with
       Import,
       Convention => C,
       External_Name => "BSP_PB_GetState";

   procedure Initialize is
   begin
      BSP_PB_Init (Button_Key, BUTTON_MODE_EXTI);
   end Initialize;

   function Pressed return Boolean is
      use type Interfaces.Unsigned_32;
   begin
      return BSP_PB_GetState (Button_Key) /= 0;
   end Pressed;

   --  Connecting EXTI0 (pin 0 only) to HAL_GPIO_EXTI_IRQHandler.
   --  Presumably if there are other interrupts for this GPIO they
   --  have to be coped with too, but this is from the main.c example.

   procedure EXTI0_IRQHandler with
     Export,
     Convention => C,
     External_Name => "EXTI0_IRQHandler",
     Unreferenced;

   procedure EXTI0_IRQHandler is
      procedure HAL_GPIO_EXTI_IRQHandler
        (GPIO_Pin : Interfaces.Unsigned_16) with
          Import,
          Convention => C,
          External_Name => "HAL_GPIO_EXTI_IRQHandler";
   begin
      HAL_GPIO_EXTI_IRQHandler (16#0001#);
   end EXTI0_IRQHandler;

   --  No need to implement the EXTI line detection Callback.

end STM32F429I_Discovery.Buttons;
