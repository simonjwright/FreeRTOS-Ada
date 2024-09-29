package RP2350.Reset is

   --  Note, these enumerals don't correspond to those defined in
   --  RP2350.RESETS, because those have treated e.g.I2C as one field
   --  of 2 bits, whereas they're actually two fields, as here.
   --
   --  The subsystems with more than one instance are I2C, PIO (has 3),
   --  SPI, TIMER, UART.
   type Subsystem is
     (
      ADC,
      BUSCTRL,
      DMA,
      HSTX,
      I2C0,
      I2C1,
      IO_BANK0,
      IO_QSPI,
      JTAG,
      PADS_BANK0,
      PADS_QSPI,
      PIO0,
      PIO1,
      PIO2,
      PLL_SYS,
      PLL_USB,
      PWM,
      SHA256,
      SPI0,
      SPI1,
      SYSCFG,
      SYSINFO,
      TBMAN,
      TIMER0,
      TIMER1,
      TRNG,
      UART0,
      UART1,
      USBCTRL
     );

   procedure Reset_Subsystem (S : Subsystem);

   procedure Release_Subsystem (S : Subsystem);

end RP2350.Reset;
