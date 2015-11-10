pragma Restrictions (No_Elaboration_Code);

with Registers.ATSAM3X8.Peripheral_Identifiers;
use Registers.ATSAM3X8.Peripheral_Identifiers;

package body Interrupts is

   procedure Dummy_Handler;
   procedure Dummy_Handler is
   begin
      loop
         null;
      end loop;
   end Dummy_Handler;

   procedure SysTick_Handler
   with Export, Convention => Ada, External_Name => "SysTick_Handler";
   pragma Weak_External (SysTick_Handler);
   procedure SysTick_Handler is
   begin
      loop
         null;
      end loop;
   end SysTick_Handler;

   procedure PIOB_IRQ_Handler
   with Export, Convention => Ada, External_Name => "PIOB_IRQ_Handler";
   pragma Weak_External (PIOB_IRQ_Handler);
   procedure PIOB_IRQ_Handler is
   begin
      loop
         null;
      end loop;
   end PIOB_IRQ_Handler;

   type Handler is access procedure;

   Vectors : array (-14 .. CAN1_IRQ) of Handler :=
     (-9 .. -6 | -4 .. -3       => null,                   -- reserved
      -14                       => Dummy_Handler'Access,   -- NMI
      -13                       => Dummy_Handler'Access,   -- HardFault
      -12                       => Dummy_Handler'Access,   -- MemManagement
      -11                       => Dummy_Handler'Access,   -- BusFault
      -10                       => Dummy_Handler'Access,   -- UsageFault
      -5                        => Dummy_Handler'Access,   -- SVCall
      -2                        => Dummy_Handler'Access,   -- PendSV
      -1                        => SysTick_Handler'Access, -- SysTick
      PIOB_IRQ                  => PIOB_IRQ_Handler'Access,
      others                    => Dummy_Handler'Access)
     with
       Export,
       Convention => Ada;
   pragma Linker_Section (Vectors, ".isr_vector");

end Interrupts;
