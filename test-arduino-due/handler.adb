with Registers.ATSAM3X8.PIO;
use Registers.ATSAM3X8.PIO;
package body Handler is

   --  The input pin is PB21 (digital pin 52).
   --  The LED is pin PB27.

   Input_Pin : constant := 21;
   Output_Pin : constant := 27;

   LED_State : Boolean := False;

   Counter : Long_Float := 0.0
     with Volatile;  -- so it doesn't get optimized away!

   procedure Handler
   with Export, Convention => Ada, External_Name => "PIOB_IRQ_Handler";

   procedure Handler is
      --  read & clear interrupt status
      Status : constant Registers.Bits_32x1 := PIOB.ISR;
   begin
      LED_State := not LED_State;
      if LED_State then
         PIOB.CODR := (Output_Pin => 1, others => 0);
      else
         --  Counter := Counter + 1.0;
         PIOB.SODR := (Output_Pin => 1, others => 0);
      end if;
   end Handler;

end Handler;
