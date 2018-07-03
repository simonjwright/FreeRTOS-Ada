--  Copyright (C) 2016-2018 Free Software Foundation, Inc.

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

--  For the BBC micro:bit (nRF51).

package Ada.Interrupts.Names is

   POWER_CLOCK_IRQ : constant Interrupt_ID := 0;
   RADIO_IRQ       : constant Interrupt_ID := 1;
   UART0_IRQ       : constant Interrupt_ID := 2;
   SPI0_TWI0_IRQ   : constant Interrupt_ID := 3;
   SPI1_TWI1_IRQ   : constant Interrupt_ID := 4;
   --  unused
   GPIOTE_IRQ      : constant Interrupt_ID := 6;
   ADC_IRQ         : constant Interrupt_ID := 7;
   TIMER0_IRQ      : constant Interrupt_ID := 8;
   TIMER1_IRQ      : constant Interrupt_ID := 9;
   TIMER2_IRQ      : constant Interrupt_ID := 10;
   RTC0_IRQ        : constant Interrupt_ID := 11;
   TEMP_IRQ        : constant Interrupt_ID := 12;
   RNG_IRQ         : constant Interrupt_ID := 13;
   ECB_IRQ         : constant Interrupt_ID := 14;
   CCM_AAR_IRQ     : constant Interrupt_ID := 15;
   WDT_IRQ         : constant Interrupt_ID := 16;
   RTC1_IRQ        : constant Interrupt_ID := 17;
   QDEC_IRQ        : constant Interrupt_ID := 18;
   LPCOMP_IRQ      : constant Interrupt_ID := 19;
   SWI0_IRQ        : constant Interrupt_ID := 20;
   SWI1_IRQ        : constant Interrupt_ID := 21;
   SWI2_IRQ        : constant Interrupt_ID := 22;
   SWI3_IRQ        : constant Interrupt_ID := 23;
   SWI4_IRQ        : constant Interrupt_ID := 24;
   SWI5_IRQ        : constant Interrupt_ID := 25;

   --  AdaCore naming
   POWER_CLOCK_Interrupt : constant Interrupt_ID := 0;
   RADIO_Interrupt       : constant Interrupt_ID := 1;
   UART0_Interrupt       : constant Interrupt_ID := 2;
   SPI0_TWI0_Interrupt   : constant Interrupt_ID := 3;
   SPI1_TWI1_Interrupt   : constant Interrupt_ID := 4;
   --  unused
   GPIOTE_Interrupt      : constant Interrupt_ID := 6;
   ADC_Interrupt         : constant Interrupt_ID := 7;
   TIMER0_Interrupt      : constant Interrupt_ID := 8;
   TIMER1_Interrupt      : constant Interrupt_ID := 9;
   TIMER2_Interrupt      : constant Interrupt_ID := 10;
   RTC0_Interrupt        : constant Interrupt_ID := 11;
   TEMP_Interrupt        : constant Interrupt_ID := 12;
   RNG_Interrupt         : constant Interrupt_ID := 13;
   ECB_Interrupt         : constant Interrupt_ID := 14;
   CCM_AAR_Interrupt     : constant Interrupt_ID := 15;
   WDT_Interrupt         : constant Interrupt_ID := 16;
   RTC1_Interrupt        : constant Interrupt_ID := 17;
   QDEC_Interrupt        : constant Interrupt_ID := 18;
   LPCOMP_Interrupt      : constant Interrupt_ID := 19;
   SWI0_Interrupt        : constant Interrupt_ID := 20;
   SWI1_Interrupt        : constant Interrupt_ID := 21;
   SWI2_Interrupt        : constant Interrupt_ID := 22;
   SWI3_Interrupt        : constant Interrupt_ID := 23;
   SWI4_Interrupt        : constant Interrupt_ID := 24;
   SWI5_Interrupt        : constant Interrupt_ID := 25;

end Ada.Interrupts.Names;
