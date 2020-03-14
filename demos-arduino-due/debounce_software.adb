--  Copyright (C) 2016, 2019, 2020 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

--  This package, in file debounce_software.adb, is the
--  software-implemented version of debouncing.
--
--  To run, connect a pushbutton between GND and pin 53. On button-up,
--  the LED will flash a number of times indicating how many button-up
--  interrupts were received,

with Ada.Interrupts.Names;
with Ada.Real_Time;
with System;

with ATSAM3X8E.PIO;
with ATSAM3X8E.PMC;

use ATSAM3X8E;
use ATSAM3X8E.PIO;
use ATSAM3X8E.PMC;

package body Debounce_Impl is

   --  The input pin is PB14 (digital pin 53).
   Input_Pin : constant := 14;

   --  The LED is pin PB27.
   Output_Pin : constant := 27;

   protected Button
   with
     Interrupt_Priority => System.Interrupt_Priority'First
   is
      entry Wait;
   private
      Triggered : Boolean := False;
      Outstanding_Interrupts : Natural := 0;
      Suppress_Interrupts_Until : Ada.Real_Time.Time
        := Ada.Real_Time.Time_First;
      procedure Handler
      with
        Attach_Handler => Ada.Interrupts.Names.PIOB_IRQ,
        Unreferenced;
   end Button;

   task T;

   protected body Button is
      entry Wait when Triggered is
      begin
         Outstanding_Interrupts := Outstanding_Interrupts - 1;
         if Outstanding_Interrupts = 0 then
            Triggered := False;
         end if;
      end Wait;

      procedure Handler is
         Status : constant PIOA_ISR_Register := PIOB_Periph.ISR;
         Now : constant Ada.Real_Time.Time := Ada.Real_Time.Clock;
         use type Ada.Real_Time.Time;
      begin
         if Status.Arr (Input_Pin) /= 0
           --  Pull-up is enabled, so the pin is 0 if the button is pressed
           and then PIOB_Periph.PDSR.Arr (Input_Pin) /= 0
           and then Now >= Suppress_Interrupts_until
         then
            Triggered := True;
            Outstanding_Interrupts := Outstanding_Interrupts + 1;
            Suppress_Interrupts_Until := Now + Ada.Real_Time.Milliseconds (5);
         end if;
      end Handler;
   end Button;

   task body T is
      use type Ada.Real_Time.Time;
   begin
      --  Clear the output pin
      PIOB_Periph.CODR.Arr := (Output_Pin => 1, others => 0);

      loop
         Button.Wait;

         PIOB_Periph.SODR.Arr := (Output_Pin => 1, others => 0);
         delay until
           Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         PIOB_Periph.CODR.Arr := (Output_Pin => 1, others => 0);
         delay until
           Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end loop;
   end T;

begin
   --  Enable PIOB
   PMC_Periph.PMC_PCER0.PID.Arr := (Ada.Interrupts.Names.PIOB_IRQ => 1,
                                    others => 0);

   --  Enable PB14 ..
   PIOB_Periph.PER.Arr := (Input_Pin => 1, others => 0);

   --  .. enable interrupts.
   PIOB_Periph.IER.Arr := (Input_Pin => 1, others => 0);

   --  Enable PB27 ..
   PIOB_Periph.PER.Arr := (Output_Pin => 1, others => 0);

   --  .. as output.
   PIOB_Periph.OER.Arr := (Output_Pin => 1, others => 0);

end Debounce_Impl;
