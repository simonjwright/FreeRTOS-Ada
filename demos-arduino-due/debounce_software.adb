--  Copyright (C) 2016 Free Software Foundation, Inc.

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
with Interfaces;
with System;

with Registers.ATSAM3X8.PIO;
with Registers.ATSAM3X8.PMC;
with Registers.ATSAM3X8.Peripheral_Identifiers;

use Registers.ATSAM3X8.PIO;
use Registers.ATSAM3X8.PMC;
use Registers.ATSAM3X8.Peripheral_Identifiers;

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
         Status : constant Registers.Bits_32x1 := PIOB.ISR;
         use type Registers.Bits_1;
      begin
         if Status (Input_Pin) /= 0 then
            Triggered := True;
         end if;
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

         delay until
           Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (5);

         --  Pull-up is enabled, so the pin is 0 if the button is pressed
         if PIOB.PDSR (Input_Pin) /= 0 then
            PIOB.CODR := (Output_Pin => 1, others => 0);
         else
            PIOB.SODR := (Output_Pin => 1, others => 0);
         end if;
      end loop;
   end T;

   use type Interfaces.Unsigned_32;
begin
   --  Enable PIOB
   PMC.PCER0 := (PIOB_IRQ => 1, others => 0);

   --  Enable PB14 ..
   PIOB.PER := (Input_Pin => 1, others => 0);

   --  .. enable interrupts.
   PIOB.IER := (Input_Pin => 1, others => 0);

   --  Enable PB27 ..
   PIOB.PER := (Output_Pin => 1, others => 0);

   --  .. as output.
   PIOB.OER := (Output_Pin => 1, others => 0);

end Debounce_Impl;
