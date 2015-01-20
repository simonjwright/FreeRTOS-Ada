with Ada.Interrupts.Names;
with Interfaces;
with System;

package body Buttons is

   use Interfaces;
   --  ??? For some reason, the compiler can't see Interfaces in
   --  Interfaces.Unsigned_16 below. This fixes things.

   type Interval_Index is mod 4;

   Intervals : constant array (Interval_Index) of Ada.Real_Time.Time_Span
     := (Ada.Real_Time.Milliseconds (50),
         Ada.Real_Time.Milliseconds (100),
         Ada.Real_Time.Milliseconds (200),
         Ada.Real_Time.Milliseconds (500));

   --  With GCC 4.9, you must give Attach_Handler in the pragma form;
   --  the aspect form doesn't work. GCC 5.0 and GNAT GPL 2014 are
   --  both OK with either form.
   protected Button
   with
     Interrupt_Priority => System.Interrupt_Priority'First
   is
      function Current_Index return Interval_Index;
   private
      Index : Interval_Index := 0;
      procedure Handler;
      pragma Attach_Handler (Handler, Ada.Interrupts.Names.EXTI0_IRQ);
   end Button;

   function Interval return Ada.Real_Time.Time_Span is
     (Intervals (Button.Current_Index));

   procedure HAL_GPIO_EXTI_IRQHandler
     (GPIO_Pin : Unsigned_16)
   with
     Import,
     Convention => C,
     External_Name => "HAL_GPIO_EXTI_IRQHandler";

   protected body Button is
      function Current_Index return Interval_Index is
      begin
         return Index;
      end Current_Index;
      procedure Handler is
      begin
         HAL_GPIO_EXTI_IRQHandler (16#0001#);
         Index := Index + 1;
      end Handler;
   end Button;

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

   procedure Initialize is
   begin
      BSP_PB_Init (Button_Key, BUTTON_MODE_EXTI);
   end Initialize;

begin
   Initialize;
end Buttons;
