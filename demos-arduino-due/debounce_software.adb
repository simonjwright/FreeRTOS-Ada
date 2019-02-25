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

--  This package, in file debounce_hardware.adb, is the
--  software-implemented version of debouncing.

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
         Status : constant ISR_Register := PIOB_Periph.ISR;
      begin
         if Status.Arr (Input_Pin) /= 0 then
            Triggered := True;
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

         delay until
           Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (5);

         --  Pull-up is enabled, so the pin is 0 if the button is pressed
         if PIOB_Periph.PDSR.Arr (Input_Pin) /= 0 then
            PIOB_Periph.CODR.Arr := (Output_Pin => 1, others => 0);
         else
            PIOB_Periph.SODR.Arr := (Output_Pin => 1, others => 0);
         end if;
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
