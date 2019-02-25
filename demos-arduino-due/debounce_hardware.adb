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
--  hardware-implemented version of debouncing.

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
         Status : constant ISR_Register := PIOB_Periph.ISR;
      begin
         if Status.Arr (Input_Pin) /= 0 then
            Interrupts := Interrupts + 1;
            Triggered := True;
         end if;
      end Handler;
   end Button;

   task body T is
      use type Ada.Real_Time.Time;
   begin
      --  Clear the output pin
      PIOB_Periph.CODR.Arr := (2 | Output_Pin => 1, others => 0);

      loop
         declare
            Interrupts_Received : Natural;
         begin
            Button.Wait (Interrupts => Interrupts_Received);

            for J in 1 .. Interrupts_Received loop
               PIOB_Periph.SODR.Arr := (Output_Pin => 1, others => 0);
               delay until
                 Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
               PIOB_Periph.CODR.Arr := (Output_Pin => 1, others => 0);
               delay until
                 Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
            end loop;
         end;
      end loop;
   end T;

begin
   --  Enable PIOB
   PMC_Periph.PMC_PCER0.PID.Arr := (Ada.Interrupts.Names.PIOB_IRQ => 1,
                                    others => 0);

   --  Enable PB14 ..
   PIOB_Periph.PER.Arr := (Input_Pin => 1, others => 0);

   --  .. enable additional interrupt modes ..
   PIOB_Periph.AIMER.Arr := (Input_Pin => 1, others => 0);

   --  .. enable interrupts on rising edge (button-up) ..
   PIOB_Periph.REHLSR.Arr := (Input_Pin => 1, others => 0);

   --  .. debounce slow clock multiplier (32 kHz; we want 5 ms, 200 Hz) ..

   --  From 11057 datasheet, 31.5.9 & 31.7.2:
   --     Tdiv_slclk = 2*(DIV+1)*Tslow_clock
   --  so
   --     DIV = Tdiv_slclk/Tslow_clock/2 - 1
   --         = Fslow_clock/Fslclk/2 - 1
   PIOB_Periph.SCDR.DIV := UInt14 (32768 / 200 / 2 - 1);

   --  .. debounce vs glitch ..
   PIOB_Periph.DIFSR.Arr := (Input_Pin => 1, others => 0);

   --  .. enable debounce ..
   PIOB_Periph.IFER.Arr := (Input_Pin => 1, others => 0);

   --  .. enable interrupts.
   PIOB_Periph.IER.Arr := (Input_Pin => 1, others => 0);

   --  Enable PB27 ..
   PIOB_Periph.PER.Arr := (Output_Pin => 1, others => 0);

   --  .. as output.
   PIOB_Periph.OER.Arr := (Output_Pin => 1, others => 0);

end Debounce_Impl;
