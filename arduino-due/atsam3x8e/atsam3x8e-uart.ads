pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  Universal Asynchronous Receiver Transmitter
package ATSAM3X8E.UART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype UART_CR_RSTRX_Field is ATSAM3X8E.Bit;
   subtype UART_CR_RSTTX_Field is ATSAM3X8E.Bit;
   subtype UART_CR_RXEN_Field is ATSAM3X8E.Bit;
   subtype UART_CR_RXDIS_Field is ATSAM3X8E.Bit;
   subtype UART_CR_TXEN_Field is ATSAM3X8E.Bit;
   subtype UART_CR_TXDIS_Field is ATSAM3X8E.Bit;
   subtype UART_CR_RSTSTA_Field is ATSAM3X8E.Bit;

   --  Control Register
   type UART_CR_Register is record
      --  unspecified
      Reserved_0_1  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Reset Receiver
      RSTRX         : UART_CR_RSTRX_Field := 16#0#;
      --  Write-only. Reset Transmitter
      RSTTX         : UART_CR_RSTTX_Field := 16#0#;
      --  Write-only. Receiver Enable
      RXEN          : UART_CR_RXEN_Field := 16#0#;
      --  Write-only. Receiver Disable
      RXDIS         : UART_CR_RXDIS_Field := 16#0#;
      --  Write-only. Transmitter Enable
      TXEN          : UART_CR_TXEN_Field := 16#0#;
      --  Write-only. Transmitter Disable
      TXDIS         : UART_CR_TXDIS_Field := 16#0#;
      --  Write-only. Reset Status Bits
      RSTSTA        : UART_CR_RSTSTA_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_CR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      RSTRX         at 0 range 2 .. 2;
      RSTTX         at 0 range 3 .. 3;
      RXEN          at 0 range 4 .. 4;
      RXDIS         at 0 range 5 .. 5;
      TXEN          at 0 range 6 .. 6;
      TXDIS         at 0 range 7 .. 7;
      RSTSTA        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Parity Type
   type MR_PAR_Field is
     (--  Even parity
      EVEN,
      --  Odd parity
      ODD,
      --  Space: parity forced to 0
      SPACE,
      --  Mark: parity forced to 1
      MARK,
      --  No parity
      NO)
     with Size => 3;
   for MR_PAR_Field use
     (EVEN => 0,
      ODD => 1,
      SPACE => 2,
      MARK => 3,
      NO => 4);

   --  Channel Mode
   type MR_CHMODE_Field is
     (--  Normal Mode
      NORMAL,
      --  Automatic Echo
      AUTOMATIC,
      --  Local Loopback
      LOCAL_LOOPBACK,
      --  Remote Loopback
      REMOTE_LOOPBACK)
     with Size => 2;
   for MR_CHMODE_Field use
     (NORMAL => 0,
      AUTOMATIC => 1,
      LOCAL_LOOPBACK => 2,
      REMOTE_LOOPBACK => 3);

   --  Mode Register
   type UART_MR_Register is record
      --  unspecified
      Reserved_0_8   : ATSAM3X8E.UInt9 := 16#0#;
      --  Parity Type
      PAR            : MR_PAR_Field := ATSAM3X8E.UART.EVEN;
      --  unspecified
      Reserved_12_13 : ATSAM3X8E.UInt2 := 16#0#;
      --  Channel Mode
      CHMODE         : MR_CHMODE_Field := ATSAM3X8E.UART.NORMAL;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_MR_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      PAR            at 0 range 9 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      CHMODE         at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UART_IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype UART_IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype UART_IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype UART_IER_FRAME_Field is ATSAM3X8E.Bit;
   subtype UART_IER_PARE_Field is ATSAM3X8E.Bit;
   subtype UART_IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype UART_IER_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype UART_IER_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type UART_IER_Register is record
      --  Write-only. Enable RXRDY Interrupt
      RXRDY          : UART_IER_RXRDY_Field := 16#0#;
      --  Write-only. Enable TXRDY Interrupt
      TXRDY          : UART_IER_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Enable End of Receive Transfer Interrupt
      ENDRX          : UART_IER_ENDRX_Field := 16#0#;
      --  Write-only. Enable End of Transmit Interrupt
      ENDTX          : UART_IER_ENDTX_Field := 16#0#;
      --  Write-only. Enable Overrun Error Interrupt
      OVRE           : UART_IER_OVRE_Field := 16#0#;
      --  Write-only. Enable Framing Error Interrupt
      FRAME          : UART_IER_FRAME_Field := 16#0#;
      --  Write-only. Enable Parity Error Interrupt
      PARE           : UART_IER_PARE_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Enable TXEMPTY Interrupt
      TXEMPTY        : UART_IER_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Enable Buffer Empty Interrupt
      TXBUFE         : UART_IER_TXBUFE_Field := 16#0#;
      --  Write-only. Enable Buffer Full Interrupt
      RXBUFF         : UART_IER_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_IER_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype UART_IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_FRAME_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_PARE_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype UART_IDR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type UART_IDR_Register is record
      --  Write-only. Disable RXRDY Interrupt
      RXRDY          : UART_IDR_RXRDY_Field := 16#0#;
      --  Write-only. Disable TXRDY Interrupt
      TXRDY          : UART_IDR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Disable End of Receive Transfer Interrupt
      ENDRX          : UART_IDR_ENDRX_Field := 16#0#;
      --  Write-only. Disable End of Transmit Interrupt
      ENDTX          : UART_IDR_ENDTX_Field := 16#0#;
      --  Write-only. Disable Overrun Error Interrupt
      OVRE           : UART_IDR_OVRE_Field := 16#0#;
      --  Write-only. Disable Framing Error Interrupt
      FRAME          : UART_IDR_FRAME_Field := 16#0#;
      --  Write-only. Disable Parity Error Interrupt
      PARE           : UART_IDR_PARE_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Disable TXEMPTY Interrupt
      TXEMPTY        : UART_IDR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Disable Buffer Empty Interrupt
      TXBUFE         : UART_IDR_TXBUFE_Field := 16#0#;
      --  Write-only. Disable Buffer Full Interrupt
      RXBUFF         : UART_IDR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_IDR_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype UART_IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_FRAME_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_PARE_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype UART_IMR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type UART_IMR_Register is record
      --  Read-only. Mask RXRDY Interrupt
      RXRDY          : UART_IMR_RXRDY_Field;
      --  Read-only. Disable TXRDY Interrupt
      TXRDY          : UART_IMR_TXRDY_Field;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit;
      --  Read-only. Mask End of Receive Transfer Interrupt
      ENDRX          : UART_IMR_ENDRX_Field;
      --  Read-only. Mask End of Transmit Interrupt
      ENDTX          : UART_IMR_ENDTX_Field;
      --  Read-only. Mask Overrun Error Interrupt
      OVRE           : UART_IMR_OVRE_Field;
      --  Read-only. Mask Framing Error Interrupt
      FRAME          : UART_IMR_FRAME_Field;
      --  Read-only. Mask Parity Error Interrupt
      PARE           : UART_IMR_PARE_Field;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit;
      --  Read-only. Mask TXEMPTY Interrupt
      TXEMPTY        : UART_IMR_TXEMPTY_Field;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit;
      --  Read-only. Mask TXBUFE Interrupt
      TXBUFE         : UART_IMR_TXBUFE_Field;
      --  Read-only. Mask RXBUFF Interrupt
      RXBUFF         : UART_IMR_RXBUFF_Field;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_IMR_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype UART_SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype UART_SR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype UART_SR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype UART_SR_OVRE_Field is ATSAM3X8E.Bit;
   subtype UART_SR_FRAME_Field is ATSAM3X8E.Bit;
   subtype UART_SR_PARE_Field is ATSAM3X8E.Bit;
   subtype UART_SR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype UART_SR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype UART_SR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Status Register
   type UART_SR_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : UART_SR_RXRDY_Field;
      --  Read-only. Transmitter Ready
      TXRDY          : UART_SR_TXRDY_Field;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit;
      --  Read-only. End of Receiver Transfer
      ENDRX          : UART_SR_ENDRX_Field;
      --  Read-only. End of Transmitter Transfer
      ENDTX          : UART_SR_ENDTX_Field;
      --  Read-only. Overrun Error
      OVRE           : UART_SR_OVRE_Field;
      --  Read-only. Framing Error
      FRAME          : UART_SR_FRAME_Field;
      --  Read-only. Parity Error
      PARE           : UART_SR_PARE_Field;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit;
      --  Read-only. Transmitter Empty
      TXEMPTY        : UART_SR_TXEMPTY_Field;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit;
      --  Read-only. Transmission Buffer Empty
      TXBUFE         : UART_SR_TXBUFE_Field;
      --  Read-only. Receive Buffer Full
      RXBUFF         : UART_SR_RXBUFF_Field;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_SR_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype UART_RHR_RXCHR_Field is ATSAM3X8E.Byte;

   --  Receive Holding Register
   type UART_RHR_Register is record
      --  Read-only. Received Character
      RXCHR         : UART_RHR_RXCHR_Field;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_RHR_Register use record
      RXCHR         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UART_THR_TXCHR_Field is ATSAM3X8E.Byte;

   --  Transmit Holding Register
   type UART_THR_Register is record
      --  Write-only. Character to be Transmitted
      TXCHR         : UART_THR_TXCHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_THR_Register use record
      TXCHR         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UART_BRGR_CD_Field is ATSAM3X8E.UInt16;

   --  Baud Rate Generator Register
   type UART_BRGR_Register is record
      --  Clock Divisor
      CD             : UART_BRGR_CD_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_BRGR_Register use record
      CD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UART_RCR_RXCTR_Field is ATSAM3X8E.UInt16;

   --  Receive Counter Register
   type UART_RCR_Register is record
      --  Receive Counter Register
      RXCTR          : UART_RCR_RXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_RCR_Register use record
      RXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UART_TCR_TXCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Counter Register
   type UART_TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : UART_TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UART_RNCR_RXNCTR_Field is ATSAM3X8E.UInt16;

   --  Receive Next Counter Register
   type UART_RNCR_Register is record
      --  Receive Next Counter
      RXNCTR         : UART_RNCR_RXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_RNCR_Register use record
      RXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UART_TNCR_TXNCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Next Counter Register
   type UART_TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : UART_TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype UART_PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype UART_PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype UART_PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype UART_PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type UART_PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : UART_PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : UART_PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : UART_PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : UART_PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype UART_PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype UART_PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type UART_PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : UART_PTSR_RXTEN_Field;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : UART_PTSR_TXTEN_Field;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for UART_PTSR_Register use record
      RXTEN         at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      TXTEN         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Universal Asynchronous Receiver Transmitter
   type UART_Peripheral is record
      --  Control Register
      CR   : aliased UART_CR_Register;
      pragma Volatile_Full_Access (CR);
      --  Mode Register
      MR   : aliased UART_MR_Register;
      pragma Volatile_Full_Access (MR);
      --  Interrupt Enable Register
      IER  : aliased UART_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR  : aliased UART_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR  : aliased UART_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Status Register
      SR   : aliased UART_SR_Register;
      pragma Volatile_Full_Access (SR);
      --  Receive Holding Register
      RHR  : aliased UART_RHR_Register;
      pragma Volatile_Full_Access (RHR);
      --  Transmit Holding Register
      THR  : aliased UART_THR_Register;
      pragma Volatile_Full_Access (THR);
      --  Baud Rate Generator Register
      BRGR : aliased UART_BRGR_Register;
      pragma Volatile_Full_Access (BRGR);
      --  Receive Pointer Register
      RPR  : aliased ATSAM3X8E.UInt32;
      --  Receive Counter Register
      RCR  : aliased UART_RCR_Register;
      pragma Volatile_Full_Access (RCR);
      --  Transmit Pointer Register
      TPR  : aliased ATSAM3X8E.UInt32;
      --  Transmit Counter Register
      TCR  : aliased UART_TCR_Register;
      pragma Volatile_Full_Access (TCR);
      --  Receive Next Pointer Register
      RNPR : aliased ATSAM3X8E.UInt32;
      --  Receive Next Counter Register
      RNCR : aliased UART_RNCR_Register;
      pragma Volatile_Full_Access (RNCR);
      --  Transmit Next Pointer Register
      TNPR : aliased ATSAM3X8E.UInt32;
      --  Transmit Next Counter Register
      TNCR : aliased UART_TNCR_Register;
      pragma Volatile_Full_Access (TNCR);
      --  Transfer Control Register
      PTCR : aliased UART_PTCR_Register;
      pragma Volatile_Full_Access (PTCR);
      --  Transfer Status Register
      PTSR : aliased UART_PTSR_Register;
      pragma Volatile_Full_Access (PTSR);
   end record
     with Volatile;

   for UART_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      MR   at 16#4# range 0 .. 31;
      IER  at 16#8# range 0 .. 31;
      IDR  at 16#C# range 0 .. 31;
      IMR  at 16#10# range 0 .. 31;
      SR   at 16#14# range 0 .. 31;
      RHR  at 16#18# range 0 .. 31;
      THR  at 16#1C# range 0 .. 31;
      BRGR at 16#20# range 0 .. 31;
      RPR  at 16#100# range 0 .. 31;
      RCR  at 16#104# range 0 .. 31;
      TPR  at 16#108# range 0 .. 31;
      TCR  at 16#10C# range 0 .. 31;
      RNPR at 16#110# range 0 .. 31;
      RNCR at 16#114# range 0 .. 31;
      TNPR at 16#118# range 0 .. 31;
      TNCR at 16#11C# range 0 .. 31;
      PTCR at 16#120# range 0 .. 31;
      PTSR at 16#124# range 0 .. 31;
   end record;

   --  Universal Asynchronous Receiver Transmitter
   UART_Periph : aliased UART_Peripheral
     with Import, Address => UART_Base;

end ATSAM3X8E.UART;
