with Ada.Interrupts.Names;
with Interfaces;
with System;

package body Buttons is

   --  This lot is copied from STM32F429I_Discovery.Buttons, which
   --  uses the BSP_PB functions. It sets up the user button to give
   --  interrupts.

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

   use Interfaces;
   --  ??? For some reason to do with this RTS, the compiler can't see
   --  Interfaces in Interfaces.Unsigned_* after the PO
   --  definition. It can see Unsigned_*..

   Intervals : constant array (Natural range <>) of Ada.Real_Time.Time_Span
     := (Ada.Real_Time.Milliseconds (50),
         Ada.Real_Time.Milliseconds (100),
         Ada.Real_Time.Milliseconds (200),
         Ada.Real_Time.Milliseconds (500),
         Ada.Real_Time.Milliseconds (1000));

   Current_Index : Natural := 0
     with Volatile;
   --  Updated directly by Debouncer (laziness!)

   function Interval return Ada.Real_Time.Time_Span is
     (Intervals (Current_Index));

   --  With GCC 4.9, you must give Attach_Handler in the pragma form;
   --  the aspect form doesn't work. GCC 5.0 and GNAT GPL 2014 are
   --  both OK with either form.
   protected Button
   with
     Interrupt_Priority => System.Interrupt_Priority'First
   is
      entry Wait_For_Trigger;
   private
      Triggered : Boolean := False;
      procedure Handler;
      pragma Attach_Handler (Handler, Ada.Interrupts.Names.EXTI0_IRQ);
   end Button;

   task Debouncer;
   task body Debouncer is
      use type Ada.Real_Time.Time;
      use type Unsigned_32;
   begin
      loop
         Button.Wait_For_Trigger;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         if BSP_PB_GetState (Button_Key) /= 0 then
            Current_Index := (Current_Index + 1) mod Intervals'Length;
         end if;
      end loop;
   end Debouncer;

   procedure HAL_GPIO_EXTI_IRQHandler
     (GPIO_Pin : Unsigned_16)
   with
     Import,
     Convention => C,
     External_Name => "HAL_GPIO_EXTI_IRQHandler";

   protected body Button is
      entry Wait_For_Trigger when Triggered is
      begin
         Triggered := False;
      end Wait_For_Trigger;

      procedure Handler is
      begin
         HAL_GPIO_EXTI_IRQHandler (16#0001#);
         Triggered := True;
      end Handler;
   end Button;

begin
   Initialize;
end Buttons;
