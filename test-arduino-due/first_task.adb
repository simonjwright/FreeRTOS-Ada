--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Interrupts.Names;
with Ada.Real_Time;
with Interfaces;
with System;

with Registers.ATSAM3X8.PIO;
with Registers.ATSAM3X8.PMC;
with Registers.ATSAM3X8.Peripheral_Identifiers;

use Registers.ATSAM3X8.PIO;
use Registers.ATSAM3X8.PMC;
use Registers.ATSAM3X8.Peripheral_Identifiers;

package body First_Task is

   --  The input pin is PB21 (digital pin 52).
   Input_Pin : constant := 21;

   --  The LED is pin PB27.
   Output_Pin : constant := 27;

   protected Button
   with
     Interrupt_Priority => System.Interrupt_Priority'First
   is
      entry Wait;
   private
      Triggered : Boolean := False;
      procedure Handler
      with
        Attach_Handler => Ada.Interrupts.Names.PIOB_IRQ,
        Unreferenced;
   end Button;

   task T;

   protected body Button is
      entry Wait when Triggered is
      begin
         Triggered := False;
      end Wait;

      procedure Handler is
         Status : constant Registers.Bits_32x1 := PIOB.ISR;
         use type Registers.Bits_1;
      begin
         Triggered := Status (Input_Pin) /= 0;
      end Handler;
   end Button;

   task body T is
      use type Ada.Real_Time.Time;
      use type Registers.Bits_1;
   begin
      --  Clear the output pin
      PIOB.CODR := (Output_Pin => 1, others => 0);

      loop
         Button.Wait;

         if PIOB.PDSR (Input_Pin) /= 0 then  -- pulled-up
            --  Clear the output pin
            PIOB.CODR := (Output_Pin => 1, others => 0);
         else
            --  Set the output pin
            PIOB.SODR := (Output_Pin => 1, others => 0);
         end if;
      end loop;
   end T;

   use type Interfaces.Unsigned_32;
begin
   --  Enable PIOB
   PMC.PCER0 := (PIOB_IRQ => 1, others => 0);

   --  Enable PB21 ..
   PIOB.PER := (Input_Pin => 1, others => 0);

   --  .. disable output ..
   PIOB.ODR := (Input_Pin => 1, others => 0);

   --  .. enable pull-up ..
   PIOB.PUER := (Input_Pin => 1, others => 0);

   --  .. disable pullup on the other pins (? default) ..
   PIOB.PUDR := (Input_Pin => 0, others => 1);

   --  .. enable interrupts on edge (? default) ..
   --  PIOB.ESR := (Input_Pin => 1, others => 0);

   --  .. enable interrupts from Input_Pin on rising edge (button-up) ..
   PIOB.REHLSR := (Input_Pin => 1, others => 0);

   --  .. debounce slow clock multiplier (32 kHz, => 5 ms, 200 Hz)
   PIOB.SCDR := 32678 / 200;

   --  .. debounce ..
   PIOB.DIFSR := (Input_Pin => 1, others => 0);

   --  .. enable interrupts.
   PIOB.IER := (Input_Pin => 1, others => 0);

   --  Enable PB27 ..
   PIOB.PER := (Output_Pin => 1, others => 0);

   --  .. as output.
   PIOB.OER := (Output_Pin => 1, others => 0);

end First_Task;
