--  Copyright (C) 2018, 2020 Free Software Foundation, Inc.
--
--  This file is part of the Cortex GNAT RTS project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

--  Normally, FreeRTOS uses the ARM SysTick interrupt. Unfortunately,
--  for nRF51822, Nordic have left out SysTick (it is optional!), so
--  we have to replace it.
--
--  The scheme is, to use one of the real-time clocks (RTC1) to
--  provide regular ticks. The interrupt handler (RTC1_IRQHandler)
--  resets for the next interrupt and calls the FreeRTOS-supplied
--  SysTick_Handler.
--
--  ARMv6-M only has 2 bits for interrupt priority, allocated as
--  below:
--
--  priority 0 (highest): FreeRTOS use only
--  priority 1 .. 3: applications, arranged in this RTS as (interrupt)
--    priorities 10, 9, 8 respectively.

--  RTC1_IRQHandler runs at ARM priority 3, Interrupt_Priority'First.

with nrf51.CLOCK;
with nrf51.RTC;
with System;

package body nRF51_Clock is

   procedure Start is
      use type nrf51.CLOCK.LFCLKSTAT_STATE_Field;
   begin

      --  Start the board low frequency clock, running off the high
      --  frequency clock (which runs automatically).
      --
      --  If the clock is already running, stop it.
      if nrf51.CLOCK.CLOCK_Periph.LFCLKSTAT.STATE = nrf51.CLOCK.Running then
         nrf51.CLOCK.CLOCK_Periph.TASKS_LFCLKSTOP := 1;
         loop
            exit when nrf51.CLOCK.CLOCK_Periph.LFCLKSTAT.STATE /=
              nrf51.CLOCK.Running;
         end loop;
      end if;

      --  Set the correct source.
      nrf51.CLOCK.CLOCK_Periph.LFCLKSRC.SRC := nrf51.CLOCK.Synth;
      nrf51.CLOCK.CLOCK_Periph.TASKS_LFCLKSTART := 1;
      loop
         exit when nrf51.CLOCK.CLOCK_Periph.LFCLKSTAT.STATE =
           nrf51.CLOCK.Running;
      end loop;

      --  Can't alter the prescaler while the RTC is running.
      nrf51.RTC.RTC1_Periph.TASKS_STOP := 1;

      --  The RTC base rate is 32,768 Hz. We're going to use the TICK
      --  functionality, which is essentially free-running.
      --
      --  A TICK event occurs when the COUNTER is incremented. An
      --  internal register <<PRESC>> is initialized to PRESCALER and
      --  decremented at 32,768 Hz; when it reaches zero, the COUNTER
      --  is incremented (causing the TICK event) and <<PRESC>> is
      --  reset to PRESCALER.

      --  Normally we'd go for a 1000 Hz clock, but the 32,768 clock
      --  means that the nearest we can get is 1024 Hz. Alter
      --  configTICK_RATE_HZ in FreeRTOSConfig.h to match.
      nrf51.RTC.RTC1_Periph.PRESCALER.PRESCALER := 32;

      --  Enable the TICK event.
      nrf51.RTC.RTC1_Periph.EVTEN.TICK := nrf51.RTC.Enabled;

      --  Enable interrupts on the TICK event,
      nrf51.RTC.RTC1_Periph.INTENSET.TICK := nrf51.RTC.Set;

      --  Enable interrupt 17 at priority one above Priority'Last
      --  (i.e. Interrupt_Priority'First). Copied from
      --  System.Interrupts
      declare
         type Bits_1 is mod 2   with Size => 1;
         type Bits_8 is mod 256 with Size => 8;

         type Bits_32x1 is array (0 .. 31) of Bits_1 with Pack, Size => 32;
         type Bits_32x8 is array (0 .. 3)  of Bits_8 with Pack, Size => 32;

         type Bits_32x1_Array is array (Natural range <>) of Bits_32x1;
         type Bits_32x8_Array is array (Natural range <>) of Bits_32x8;

         pragma Warnings (Off, "* bits of * unused");
         type NVIC_T is record
            ISER : Bits_32x1_Array (0 .. 7);  -- only (0) is usable
            ICER : Bits_32x1_Array (0 .. 7);
            ISPR : Bits_32x1_Array (0 .. 7);
            ICPR : Bits_32x1_Array (0 .. 7);
            IPR  : Bits_32x8_Array (0 .. 59);
         end record
         with Convention => Ada, Volatile, Size => 8 * (16#0E00# + 4);
         pragma Warnings (On, "* bits of * unused");
         --  See ARMv6M Architecture Reference Manual, 2010, Table B3-18

         for NVIC_T use record
            ISER at 16#0000# range 0 .. 255;
            ICER at 16#0080# range 0 .. 255;
            ISPR at 16#0100# range 0 .. 255;
            ICPR at 16#0180# range 0 .. 255;
            IPR  at 16#0300# range 0 .. 1919;
         end record;

         NVIC : NVIC_T
         with
           Import,
           Convention => Ada,
           Address => System'To_Address (16#E000E100#);

         Interrupt : constant := 17;
         Prio : constant := System.Interrupt_Priority'First;
      begin
         declare
            Index    : constant Natural := Interrupt / 4;
            Position : constant Natural := Interrupt mod 4;
            IPR      : Bits_32x8        := NVIC.IPR (Index);
         begin
            IPR (Position) :=
              Bits_8 (3 - (Prio - System.Interrupt_Priority'First))
                * 64; -- top 2 bits
            NVIC.IPR (Index) := IPR;
         end;
         declare
            Index    : constant Natural := Interrupt / 32;
            Position : constant Natural := Interrupt mod 32;
            Setting  : Bits_32x1        := (others => 0);
         begin
            Setting (Position) := 1;
            NVIC.ISER (Index) := Setting;
         end;
      end;

      --  Start the RTC tasks
      nrf51.RTC.RTC1_Periph.TASKS_START := 1;
   end Start;

   --  Startup has set up a weak RTC1_IRQHandler at interrupt 17.
   procedure RTC1_IRQHandler
   with
     Export,
     Convention => Ada,
     External_Name => "RTC1_IRQHandler";

   procedure RTC1_IRQHandler is

      procedure SysTick_Handler
      with
        Import,
        Convention => C,
        External_Name => "SysTick_Handler";

   begin
      --  Clear the TICK event.
      nrf51.RTC.RTC1_Periph.EVENTS_TICK := 0;

      --  Call the FreeRTOS handler.
      SysTick_Handler;
   end RTC1_IRQHandler;

end nRF51_Clock;
