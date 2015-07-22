with Registers.Cortex.SysTick; use Registers.Cortex.SysTick;

package body Time is

   Current : Time := 0
     with Volatile;

   function Clock return Time is (Current);

   procedure SysTick_Handler
   with
     Export,
     Convention => Ada,
     External_Name => "SysTick_Handler";

   procedure SysTick_Handler is
   begin
      Current := Current + 1;
   end SysTick_Handler;

   Master_Clock_Frequency_Hz : constant := 4_000_000;
   SysTick_Divider : constant := 8;
   SysTick_Clock_Frequency_Hz : constant
     := Master_Clock_Frequency_Hz / SysTick_Divider;
   SysTick_Period_Millis : constant := 1;

   SysTick_Reload_Value : constant :=
      (SysTick_Clock_Frequency_Hz / 1_000) * SysTick_Period_Millis;

begin
   SysTick.VAL := 0;
   SysTick.LOAD := SysTick_Reload_Value;
   SysTick.CTRL := 2#0011#;
end Time;
