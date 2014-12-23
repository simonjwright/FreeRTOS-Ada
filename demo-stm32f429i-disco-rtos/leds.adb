with CMSIS_OS;
with Interfaces;

package body LEDs is

   task body LED is
      Status : CMSIS_OS.osStatus;
      use type CMSIS_OS.osStatus;
   begin
      loop
         Status :=
           CMSIS_OS.osDelay
             (Millisec => Interfaces.Unsigned_32 (Period_Millis));
         if Status /= CMSIS_OS.osOK then
            raise Program_Error;
         end if;
         STM32F429I_Discovery.LEDs.Toggle (The_LED);
      end loop;
   end LED;

end LEDs;
