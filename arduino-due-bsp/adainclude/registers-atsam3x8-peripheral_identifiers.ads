--  Peripheral Identifiers, 11057 23-Mar-15, Chapter 9.1
--
--  Used for NVIC and Power Management.
--
--  Typically, identifiers 0 .. 31 correspond to bits in register 0,
--  32 .. 45 to bits (n - 32) in register 1 of a pair (e.g. PMC.PCER0,
--  PMC.PCER1).

package Registers.ATSAM3X8.Peripheral_Identifiers is

   SUPC_IRQ       : constant := 0;  --  Supply Controller
   RSTC_IRQ       : constant := 1;  --  Reset Controller
   RTC_IRQ        : constant := 2;  --  Real-time Clock
   RTT_IRQ        : constant := 3;  --  Real-time Timer
   WDG_IRQ        : constant := 4;  --  Watchdog Timer
   PMC_IRQ        : constant := 5;  --  Power Management Controller
   EEFC0_IRQ      : constant := 6;  --  Enhanced Embedded Flash Controller 0
   EEFC1_IRQ      : constant := 7;  --  Enhanced Embedded Flash Controller 1
   UART_IRQ       : constant := 8;  --  Universal Asynchronous Rx/Tx
   SMC_SDRAMC_IRQ : constant := 9;  --  Static Memory / Sync DRAM Controller
   SDRAMC_IRQ     : constant := 10; --  Synchronous Dynamic RAM Controller
   PIOA_IRQ       : constant := 11; --  Parallel I/O Controller A
   PIOB_IRQ       : constant := 12; --  Parallel I/O Controller B
   PIOC_IRQ       : constant := 13; --  Parallel I/O Controller C
   PIOD_IRQ       : constant := 14; --  Parallel I/O Controller D
   PIOE_IRQ       : constant := 15; --  Parallel I/O Controller E
   PIOF_IRQ       : constant := 16; --  Parallel I/O Controller F
   USART0_IRQ     : constant := 17; --  USART 0
   USART1_IRQ     : constant := 18; --  USART 1
   USART2_IRQ     : constant := 19; --  USART 2
   USART3_IRQ     : constant := 20; --  USART 3
   HSMCI_IRQ      : constant := 21; --  High Speed Multimedia Card Interface
   TWI0_IRQ       : constant := 22; --  Two-Wire Interface 0
   TWI1_IRQ       : constant := 23; --  Two-Wire Interface 1
   SPI0_IRQ       : constant := 24; --  Serial Peripheral Interface 0
   SPI1_IRQ       : constant := 25; --  Serial Peripheral Interface 1
   SSC_IRQ        : constant := 26; --  Synchronous Serial Controller
   TC0_IRQ        : constant := 27; --  Timer Counter Channel 0
   TC1_IRQ        : constant := 28; --  Timer Counter Channel 1
   TC2_IRQ        : constant := 29; --  Timer Counter Channel 2
   TC3_IRQ        : constant := 30; --  Timer Counter Channel 3
   TC4_IRQ        : constant := 31; --  Timer Counter Channel 4
   TC5_IRQ        : constant := 32; --  Timer Counter Channel 5
   TC6_IRQ        : constant := 33; --  Timer Counter Channel 6
   TC7_IRQ        : constant := 34; --  Timer Counter Channel 7
   TC8_IRQ        : constant := 35; --  Timer Counter Channel 8
   PWM_IRQ        : constant := 36; --  Pulse Width Modulation Controller
   ADC_IRQ        : constant := 37; --  ADC Controller
   DACC_IRQ       : constant := 38; --  DAC Controller
   DMAC_IRQ       : constant := 39; --  DMA Controller
   UOTGHS_IRQ     : constant := 40; --  USB OTG High Speed
   TRNG_IRQ       : constant := 41; --  True Random Number Generator
   EMAC_IRQ       : constant := 42; --  Ethernet MAC
   CAN0_IRQ       : constant := 43; --  CAN Controller 0
   CAN1_IRQ       : constant := 44; --  CAN Controller 1

end Registers.ATSAM3X8.Peripheral_Identifiers;
