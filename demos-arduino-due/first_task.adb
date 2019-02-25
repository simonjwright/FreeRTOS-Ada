--  Copyright (C) 2016, 2019 Free Software Foundation, Inc.

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

with Ada.Interrupts.Names;
with System;

with ATSAM3X8E.PIO;
with ATSAM3X8E.PMC;

use ATSAM3X8E;
use ATSAM3X8E.PIO;
use ATSAM3X8E.PMC;

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
         Status : constant PIO.ISR_Register := PIOB_Periph.ISR;
      begin
         Triggered := Status.Arr (Input_Pin) /= 0;
      end Handler;
   end Button;

   task body T is
   begin
      --  Clear the output pin
      PIOB_Periph.CODR.Arr := (Output_Pin => 1, others => 0);

      loop
         Button.Wait;

         if PIOB_Periph.PDSR.Arr (Input_Pin) /= 0 then  -- pulled-up
            --  Clear the output pin
            PIOB_Periph.CODR.Arr := (Output_Pin => 1, others => 0);
         else
            --  Set the output pin
            PIOB_Periph.SODR.Arr := (Output_Pin => 1, others => 0);
         end if;
      end loop;
   end T;

begin
   --  Enable PIOB
   PMC_Periph.PMC_PCER0.PID.Arr := (Ada.Interrupts.Names.PIOB_IRQ => 1,
                                    others => 0);

   --  Enable PB21 ..
   PIOB_Periph.PER.Arr := (Input_Pin => 1, others => 0);

   --  .. disable output ..
   PIOB_Periph.ODR.Arr := (Input_Pin => 1, others => 0);

   --  .. enable pull-up ..
   PIOB_Periph.PUER.Arr := (Input_Pin => 1, others => 0);

   --  .. disable pullup on the other pins (? default) ..
   PIOB_Periph.PUDR.Arr := (Input_Pin => 0, others => 1);

   --  .. enable interrupts on edge (? default) ..
   --  PIOB_Periph.ESR := (Input_Pin => 1, others => 0);

   --  .. enable interrupts from Input_Pin on rising edge (button-up) ..
   PIOB_Periph.REHLSR.Arr := (Input_Pin => 1, others => 0);

   --  .. debounce slow clock multiplier (32 kHz, => 5 ms, 200 Hz)
   PIOB_Periph.SCDR.DIV := UInt14 (32678 / 200);

   --  .. debounce ..
   PIOB_Periph.DIFSR.Arr := (Input_Pin => 1, others => 0);

   --  .. enable interrupts.
   PIOB_Periph.IER.Arr := (Input_Pin => 1, others => 0);

   --  Enable PB27 ..
   PIOB_Periph.PER.Arr := (Output_Pin => 1, others => 0);

   --  .. as output.
   PIOB_Periph.OER.Arr := (Output_Pin => 1, others => 0);

end First_Task;
