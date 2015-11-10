with Registers.ATSAM3X8.PIO;
with Registers.ATSAM3X8.PMC;
with Registers.ATSAM3X8.Peripheral_Identifiers;

use Registers.ATSAM3X8.PIO;
use Registers.ATSAM3X8.PMC;
use Registers.ATSAM3X8.Peripheral_Identifiers;

with Registers.Cortex.NVIC;
use Registers.Cortex.NVIC;

with Interrupts;
with Handler;
with Time;

with System.Machine_Code;

procedure Program is

   procedure Enable_Interrupts is
   begin
      System.Machine_Code.Asm (Template => "cpsie i", Volatile => True);
   end Enable_Interrupts;

   procedure Disable_Interrupts is
   begin
      System.Machine_Code.Asm (Template => "cpsid i", Volatile => True);
   end Disable_Interrupts;

   procedure Wait_For_Interrupt is
   begin
      System.Machine_Code.Asm (Template => "wfi", Volatile => True);
   end Wait_For_Interrupt;

   --  The input pin is PB21 (digital pin 52).
   --  The LED is pin PB27.

   Input_Pin : constant := 21;
   Output_Pin : constant := 27;

begin

   PMC.PCER0 := (PIOB_IRQ => 1, others => 0);

   PIOB.PER := (Input_Pin => 1, others => 0);
   PIOB.ODR := (Input_Pin => 1, others => 0);
   PIOB.PUER := (Input_Pin => 1, others => 0);
   PIOB.PUDR := (Input_Pin => 0, others => 1);

   --  interrupts from Input_Pin on edge (? default)
   PIOB.ESR := (Input_Pin => 1, others => 0);
   --  interrupts from Input_Pin on rising edge
   PIOB.FELLSR := (Input_Pin => 1, others => 0);
   --  debounce Input_Pin
   PIOB.DIFSR := (Input_Pin => 1, others => 0);
   --  enable interrupts from the Input_Pin
   PIOB.IER := (Input_Pin => 1, others => 0);

   PIOB.PER := (Output_Pin => 1, others => 0);
   PIOB.OER := (Output_Pin => 1, others => 0);

   --  enable interrupts from PIOB, don't bother with priority
   NVIC.ISER (0) := (PIOB_IRQ => 1, others => 0);

   Enable_Interrupts;

   declare
      Next : Time.Time := Time.Clock;
      LED : Boolean := False;
      use type Time.Time;
   begin
      loop
         if LED then
            PIOB.CODR := (Output_Pin => 1, others => 0);
         else
            PIOB.SODR := (Output_Pin => 1, others => 0);
         end if;
         LED := not LED;
         Next := Next + 500;
         while Time.Clock < Next loop
            null;
         end loop;
      end loop;
   end;
end Program;
