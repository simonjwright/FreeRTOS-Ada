--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

pragma Restrictions (No_Implicit_Heap_Allocations);
--  Without this, GNAT GPL 2014 & GCC 4.9.1 think that this unit
--  violates the restriction (which isn't allowed in Ravenscar).

with Ada.Containers.Bounded_Vectors;
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

   procedure Initialize_BSP is
   begin
      BSP_PB_Init (Button_Key, BUTTON_MODE_EXTI);
   end Initialize_BSP;

   --  Intervals contains all the possible intervals (between toggling
   --  the green LED). The idea is that each time the button is
   --  pressed we move on to the next interval.
   --
   --  We're only using Bounded_Vectors here to show that it works:
   --  obviously an array would be better suited to this problem!

   package Interval_Containers
     is new Ada.Containers.Bounded_Vectors
       (Index_Type   => Natural,
        Element_Type => Ada.Real_Time.Time_Span,
        "="          => Ada.Real_Time."=");

   Intervals : Interval_Containers.Vector (5);

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

   protected body Button is
      entry Wait_For_Trigger when Triggered is
      begin
         Triggered := False;
      end Wait_For_Trigger;

      procedure Handler is
         procedure HAL_GPIO_EXTI_IRQHandler
           (GPIO_Pin : Interfaces.Unsigned_16)
         with
           Import,
           Convention => C,
           External_Name => "HAL_GPIO_EXTI_IRQHandler";
      begin
         HAL_GPIO_EXTI_IRQHandler (16#0001#);
         Triggered := True;
      end Handler;
   end Button;

   task body Debouncer is
      use type Ada.Real_Time.Time;
      use type Interfaces.Unsigned_32;
   begin
      loop
         Button.Wait_For_Trigger;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         if BSP_PB_GetState (Button_Key) /= 0 then
            Current_Index :=
              (Current_Index + 1) mod Natural (Intervals.Length);
         end if;
      end loop;
   end Debouncer;

begin
   Initialize_BSP;
   --  This code is called during elaboration from the environment
   --  task; that means, it turns out, that we can't use
   --  Intervals.Insert_Space (0, 5) and then use array indexing
   --  notation (Intervals (0) := whatever), because that uses the
   --  secondary stack ...
   Intervals.Append (Ada.Real_Time.Milliseconds (50));
   Intervals.Append (Ada.Real_Time.Milliseconds (100));
   Intervals.Append (Ada.Real_Time.Milliseconds (200));
   Intervals.Append (Ada.Real_Time.Milliseconds (500));
   Intervals.Append (Ada.Real_Time.Milliseconds (1000));
end Buttons;
