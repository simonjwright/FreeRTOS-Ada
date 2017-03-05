--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Universal Asynchronous Receiver Transmitter
package ATSAM3X8E.UART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_RSTRX_Field is ATSAM3X8E.Bit;
   subtype CR_RSTTX_Field is ATSAM3X8E.Bit;
   subtype CR_RXEN_Field is ATSAM3X8E.Bit;
   subtype CR_RXDIS_Field is ATSAM3X8E.Bit;
   subtype CR_TXEN_Field is ATSAM3X8E.Bit;
   subtype CR_TXDIS_Field is ATSAM3X8E.Bit;
   subtype CR_RSTSTA_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  unspecified
      Reserved_0_1  : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Reset Receiver
      RSTRX         : CR_RSTRX_Field := 16#0#;
      --  Write-only. Reset Transmitter
      RSTTX         : CR_RSTTX_Field := 16#0#;
      --  Write-only. Receiver Enable
      RXEN          : CR_RXEN_Field := 16#0#;
      --  Write-only. Receiver Disable
      RXDIS         : CR_RXDIS_Field := 16#0#;
      --  Write-only. Transmitter Enable
      TXEN          : CR_TXEN_Field := 16#0#;
      --  Write-only. Transmitter Disable
      TXDIS         : CR_TXDIS_Field := 16#0#;
      --  Write-only. Reset Status Bits
      RSTSTA        : CR_RSTSTA_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
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

   -----------------
   -- MR_Register --
   -----------------

   --  Parity Type
   type PAR_Field is
     (
      --  Even parity
      Even,
      --  Odd parity
      Odd,
      --  Space: parity forced to 0
      Space,
      --  Mark: parity forced to 1
      Mark,
      --  No parity
      No)
     with Size => 3;
   for PAR_Field use
     (Even => 0,
      Odd => 1,
      Space => 2,
      Mark => 3,
      No => 4);

   --  Channel Mode
   type CHMODE_Field is
     (
      --  Normal Mode
      Normal,
      --  Automatic Echo
      Automatic,
      --  Local Loopback
      Local_Loopback,
      --  Remote Loopback
      Remote_Loopback)
     with Size => 2;
   for CHMODE_Field use
     (Normal => 0,
      Automatic => 1,
      Local_Loopback => 2,
      Remote_Loopback => 3);

   --  Mode Register
   type MR_Register is record
      --  unspecified
      Reserved_0_8   : ATSAM3X8E.UInt9 := 16#0#;
      --  Parity Type
      PAR            : PAR_Field := Even;
      --  unspecified
      Reserved_12_13 : ATSAM3X8E.UInt2 := 16#0#;
      --  Channel Mode
      CHMODE         : CHMODE_Field := Normal;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      PAR            at 0 range 9 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      CHMODE         at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype IER_FRAME_Field is ATSAM3X8E.Bit;
   subtype IER_PARE_Field is ATSAM3X8E.Bit;
   subtype IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IER_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. Enable RXRDY Interrupt
      RXRDY          : IER_RXRDY_Field := 16#0#;
      --  Write-only. Enable TXRDY Interrupt
      TXRDY          : IER_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Enable End of Receive Transfer Interrupt
      ENDRX          : IER_ENDRX_Field := 16#0#;
      --  Write-only. Enable End of Transmit Interrupt
      ENDTX          : IER_ENDTX_Field := 16#0#;
      --  Write-only. Enable Overrun Error Interrupt
      OVRE           : IER_OVRE_Field := 16#0#;
      --  Write-only. Enable Framing Error Interrupt
      FRAME          : IER_FRAME_Field := 16#0#;
      --  Write-only. Enable Parity Error Interrupt
      PARE           : IER_PARE_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Enable TXEMPTY Interrupt
      TXEMPTY        : IER_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Enable Buffer Empty Interrupt
      TXBUFE         : IER_TXBUFE_Field := 16#0#;
      --  Write-only. Enable Buffer Full Interrupt
      RXBUFF         : IER_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
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

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_FRAME_Field is ATSAM3X8E.Bit;
   subtype IDR_PARE_Field is ATSAM3X8E.Bit;
   subtype IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IDR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. Disable RXRDY Interrupt
      RXRDY          : IDR_RXRDY_Field := 16#0#;
      --  Write-only. Disable TXRDY Interrupt
      TXRDY          : IDR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Disable End of Receive Transfer Interrupt
      ENDRX          : IDR_ENDRX_Field := 16#0#;
      --  Write-only. Disable End of Transmit Interrupt
      ENDTX          : IDR_ENDTX_Field := 16#0#;
      --  Write-only. Disable Overrun Error Interrupt
      OVRE           : IDR_OVRE_Field := 16#0#;
      --  Write-only. Disable Framing Error Interrupt
      FRAME          : IDR_FRAME_Field := 16#0#;
      --  Write-only. Disable Parity Error Interrupt
      PARE           : IDR_PARE_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Disable TXEMPTY Interrupt
      TXEMPTY        : IDR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit := 16#0#;
      --  Write-only. Disable Buffer Empty Interrupt
      TXBUFE         : IDR_TXBUFE_Field := 16#0#;
      --  Write-only. Disable Buffer Full Interrupt
      RXBUFF         : IDR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
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

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_FRAME_Field is ATSAM3X8E.Bit;
   subtype IMR_PARE_Field is ATSAM3X8E.Bit;
   subtype IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IMR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. Mask RXRDY Interrupt
      RXRDY          : IMR_RXRDY_Field := 16#0#;
      --  Read-only. Disable TXRDY Interrupt
      TXRDY          : IMR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit;
      --  Read-only. Mask End of Receive Transfer Interrupt
      ENDRX          : IMR_ENDRX_Field := 16#0#;
      --  Read-only. Mask End of Transmit Interrupt
      ENDTX          : IMR_ENDTX_Field := 16#0#;
      --  Read-only. Mask Overrun Error Interrupt
      OVRE           : IMR_OVRE_Field := 16#0#;
      --  Read-only. Mask Framing Error Interrupt
      FRAME          : IMR_FRAME_Field := 16#0#;
      --  Read-only. Mask Parity Error Interrupt
      PARE           : IMR_PARE_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit;
      --  Read-only. Mask TXEMPTY Interrupt
      TXEMPTY        : IMR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit;
      --  Read-only. Mask TXBUFE Interrupt
      TXBUFE         : IMR_TXBUFE_Field := 16#0#;
      --  Read-only. Mask RXBUFF Interrupt
      RXBUFF         : IMR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
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

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype SR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype SR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype SR_OVRE_Field is ATSAM3X8E.Bit;
   subtype SR_FRAME_Field is ATSAM3X8E.Bit;
   subtype SR_PARE_Field is ATSAM3X8E.Bit;
   subtype SR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype SR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype SR_RXBUFF_Field is ATSAM3X8E.Bit;

   --  Status Register
   type SR_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : SR_RXRDY_Field := 16#0#;
      --  Read-only. Transmitter Ready
      TXRDY          : SR_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : ATSAM3X8E.Bit;
      --  Read-only. End of Receiver Transfer
      ENDRX          : SR_ENDRX_Field := 16#0#;
      --  Read-only. End of Transmitter Transfer
      ENDTX          : SR_ENDTX_Field := 16#0#;
      --  Read-only. Overrun Error
      OVRE           : SR_OVRE_Field := 16#0#;
      --  Read-only. Framing Error
      FRAME          : SR_FRAME_Field := 16#0#;
      --  Read-only. Parity Error
      PARE           : SR_PARE_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : ATSAM3X8E.Bit;
      --  Read-only. Transmitter Empty
      TXEMPTY        : SR_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : ATSAM3X8E.Bit;
      --  Read-only. Transmission Buffer Empty
      TXBUFE         : SR_TXBUFE_Field := 16#0#;
      --  Read-only. Receive Buffer Full
      RXBUFF         : SR_RXBUFF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : ATSAM3X8E.UInt19;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SR_Register use record
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

   ------------------
   -- RHR_Register --
   ------------------

   subtype RHR_RXCHR_Field is ATSAM3X8E.Byte;

   --  Receive Holding Register
   type RHR_Register is record
      --  Read-only. Received Character
      RXCHR         : RHR_RXCHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RHR_Register use record
      RXCHR         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- THR_Register --
   ------------------

   subtype THR_TXCHR_Field is ATSAM3X8E.Byte;

   --  Transmit Holding Register
   type THR_Register is record
      --  Write-only. Character to be Transmitted
      TXCHR         : THR_TXCHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for THR_Register use record
      TXCHR         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- BRGR_Register --
   -------------------

   subtype BRGR_CD_Field is ATSAM3X8E.Short;

   --  Baud Rate Generator Register
   type BRGR_Register is record
      --  Clock Divisor
      CD             : BRGR_CD_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BRGR_Register use record
      CD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- RCR_Register --
   ------------------

   subtype RCR_RXCTR_Field is ATSAM3X8E.Short;

   --  Receive Counter Register
   type RCR_Register is record
      --  Receive Counter Register
      RXCTR          : RCR_RXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      RXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- TCR_Register --
   ------------------

   subtype TCR_TXCTR_Field is ATSAM3X8E.Short;

   --  Transmit Counter Register
   type TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- RNCR_Register --
   -------------------

   subtype RNCR_RXNCTR_Field is ATSAM3X8E.Short;

   --  Receive Next Counter Register
   type RNCR_Register is record
      --  Receive Next Counter
      RXNCTR         : RNCR_RXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RNCR_Register use record
      RXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- TNCR_Register --
   -------------------

   subtype TNCR_TXNCTR_Field is ATSAM3X8E.Short;

   --  Transmit Next Counter Register
   type TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- PTCR_Register --
   -------------------

   subtype PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -------------------
   -- PTSR_Register --
   -------------------

   subtype PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : PTSR_RXTEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : PTSR_TXTEN_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for PTSR_Register use record
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
      CR   : CR_Register;
      --  Mode Register
      MR   : MR_Register;
      --  Interrupt Enable Register
      IER  : IER_Register;
      --  Interrupt Disable Register
      IDR  : IDR_Register;
      --  Interrupt Mask Register
      IMR  : IMR_Register;
      --  Status Register
      SR   : SR_Register;
      --  Receive Holding Register
      RHR  : RHR_Register;
      --  Transmit Holding Register
      THR  : THR_Register;
      --  Baud Rate Generator Register
      BRGR : BRGR_Register;
      --  Receive Pointer Register
      RPR  : ATSAM3X8E.Word;
      --  Receive Counter Register
      RCR  : RCR_Register;
      --  Transmit Pointer Register
      TPR  : ATSAM3X8E.Word;
      --  Transmit Counter Register
      TCR  : TCR_Register;
      --  Receive Next Pointer Register
      RNPR : ATSAM3X8E.Word;
      --  Receive Next Counter Register
      RNCR : RNCR_Register;
      --  Transmit Next Pointer Register
      TNPR : ATSAM3X8E.Word;
      --  Transmit Next Counter Register
      TNCR : TNCR_Register;
      --  Transfer Control Register
      PTCR : PTCR_Register;
      --  Transfer Status Register
      PTSR : PTSR_Register;
   end record
     with Volatile;

   for UART_Peripheral use record
      CR   at 0 range 0 .. 31;
      MR   at 4 range 0 .. 31;
      IER  at 8 range 0 .. 31;
      IDR  at 12 range 0 .. 31;
      IMR  at 16 range 0 .. 31;
      SR   at 20 range 0 .. 31;
      RHR  at 24 range 0 .. 31;
      THR  at 28 range 0 .. 31;
      BRGR at 32 range 0 .. 31;
      RPR  at 256 range 0 .. 31;
      RCR  at 260 range 0 .. 31;
      TPR  at 264 range 0 .. 31;
      TCR  at 268 range 0 .. 31;
      RNPR at 272 range 0 .. 31;
      RNCR at 276 range 0 .. 31;
      TNPR at 280 range 0 .. 31;
      TNCR at 284 range 0 .. 31;
      PTCR at 288 range 0 .. 31;
      PTSR at 292 range 0 .. 31;
   end record;

   --  Universal Asynchronous Receiver Transmitter
   UART_Periph : aliased UART_Peripheral
     with Import, Address => UART_Base;

end ATSAM3X8E.UART;
