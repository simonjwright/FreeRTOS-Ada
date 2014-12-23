with STM32F429I_Discovery.LEDs;
with System;
package LEDs is
   task type LED (The_LED       : STM32F429I_Discovery.LEDs.LED;
                  Period_Millis : Positive);

   Red   : LED (STM32F429I_Discovery.LEDs.Red,   1000);
   Green : LED (STM32F429I_Discovery.LEDs.Green, 125);
end LEDs;
