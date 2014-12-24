with Ada.Real_Time;

package body LEDs is

   task body LED is
      Next : Ada.Real_Time.Time := Ada.Real_Time.Clock;
      use type Ada.Real_Time.Time;
   begin
      loop
         STM32F429I_Discovery.LEDs.Toggle (The_LED);
         Next := Next + Ada.Real_Time.Milliseconds (Period_Millis);
         delay until Next;
      end loop;
   end LED;

end LEDs;
