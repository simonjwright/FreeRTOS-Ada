--  Specs for Basic Interrupt management package
--  Shawn Nock 1 Jul. 2016

package nrf51.Interrupts is
   type Interrupt is (POWER_CLOCK_IRQ, RADIO_IRQ, UART0_IRQ, SPI0_TWI0_IRQ,
                      SPI1_TWI1_IRQ, Unused_IRQ0, GPIOTE_IRQ, ADC_IRQ,
                      TIMER0_IRQ, TIMER1_IRQ, TIMER2_IRQ, RTC0_IRQ, TEMP_IRQ,
                      RNG_IRQ, ECB_IRQ, CCM_AAR_IRQ, WDT_IRQ, RTC1_IRQ,
                      QDEC_IRQ, LPCOMP_IRQ, SWI0_IRQ, SWI1_IRQ, SWI2_IRQ,
                      SWI3_IRQ, SWI4_IRQ, SWI5_IRQ, Unused_IRQ1, Unused_IRQ2,
                      Unused_IRQ3, Unused_IRQ4, Unused_IRQ5, Unused_IRQ6);

   type IRQ_Priority is (IRQ_Prio_Highest, IRQ_Prio_High, IRQ_Prio_Med,
                         IRQ_Prio_Low);

   procedure Set_Priority (I : Interrupt; P : IRQ_Priority);
   procedure Enable (I : Interrupt);
   procedure Disable (I : Interrupt);
end nrf51.Interrupts;
