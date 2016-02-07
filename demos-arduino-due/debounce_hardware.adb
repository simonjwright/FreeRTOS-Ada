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
--  hardware-implemented version of debouncing.

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
      entry Wait (Interrupts : out Natural);
   private
      Triggered : Boolean := False;
      Interrupts : Natural := 0;
      procedure Handler
      with
        Attach_Handler => Ada.Interrupts.Names.PIOB_IRQ,
        Unreferenced;
   end Button;

   task T;

   protected body Button is
      entry Wait (Interrupts : out Natural) when Triggered is
      begin
         Triggered := False;
         Interrupts := Button.Interrupts;
         Button.Interrupts := 0;
      end Wait;

      procedure Handler is
         Status : constant Registers.Bits_32x1 := PIOB.ISR;
         use type Registers.Bits_1;
      begin
         if Status (Input_Pin) /= 0 then
            Interrupts := Interrupts + 1;
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
         declare
            Interrupts_Received : Natural;
         begin
            Button.Wait (Interrupts => Interrupts_Received);

            for J in 1 .. Interrupts_Received loop
               PIOB.SODR := (Output_Pin => 1, others => 0);
               delay until
                 Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
               PIOB.CODR := (Output_Pin => 1, others => 0);
               delay until
                 Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
            end loop;
         end;
      end loop;
   end T;

   use type Interfaces.Unsigned_32;
begin
   --  Enable PIOB
   PMC.PCER0 := (PIOB_IRQ => 1, others => 0);

   --  Enable PB14 ..
   PIOB.PER := (Input_Pin => 1, others => 0);

   --  .. enable additional interrupt modes ..
   PIOB.AIMER := (Input_Pin => 1, others => 0);

   --  .. enable interrupts on rising edge (button-up) ..
   PIOB.REHLSR := (Input_Pin => 1, others => 0);

   --  .. debounce slow clock multiplier (32 kHz; we want 5 ms, 200 Hz) ..

   --  From 11057 datasheet, 31.5.9 & 31.7.2:
   --     Tdiv_slclk = 2*(DIV+1)*Tslow_clock
   --  so
   --     DIV = Tdiv_slclk/Tslow_clock/2 - 1
   --         = Fslow_clock/Fslclk/2 - 1
   PIOB.SCDR := 32768 / 200 / 2 - 1;

   --  .. debounce vs glitch ..
   PIOB.DIFSR := (Input_Pin => 1, others => 0);

   --  .. enable debounce ..
   PIOB.IFER := (Input_Pin => 1, others => 0);

   --  .. enable interrupts.
   PIOB.IER := (Input_Pin => 1, others => 0);

   --  Enable PB27 ..
   PIOB.PER := (Output_Pin => 1, others => 0);

   --  .. as output.
   PIOB.OER := (Output_Pin => 1, others => 0);

end Debounce_Impl;
