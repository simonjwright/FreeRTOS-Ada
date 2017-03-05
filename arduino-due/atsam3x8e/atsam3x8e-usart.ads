--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.USART is
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
   subtype CR_STTBRK_Field is ATSAM3X8E.Bit;
   subtype CR_STPBRK_Field is ATSAM3X8E.Bit;
   subtype CR_STTTO_Field is ATSAM3X8E.Bit;
   subtype CR_SENDA_Field is ATSAM3X8E.Bit;
   subtype CR_RSTIT_Field is ATSAM3X8E.Bit;
   subtype CR_RSTNACK_Field is ATSAM3X8E.Bit;
   subtype CR_RETTO_Field is ATSAM3X8E.Bit;
   subtype CR_RTSEN_Field is ATSAM3X8E.Bit;
   subtype CR_RTSDIS_Field is ATSAM3X8E.Bit;
   subtype CR_LINABT_Field is ATSAM3X8E.Bit;
   subtype CR_LINWKUP_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_Register is record
      --  unspecified
      Reserved_0_1   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Reset Receiver
      RSTRX          : CR_RSTRX_Field := 16#0#;
      --  Write-only. Reset Transmitter
      RSTTX          : CR_RSTTX_Field := 16#0#;
      --  Write-only. Receiver Enable
      RXEN           : CR_RXEN_Field := 16#0#;
      --  Write-only. Receiver Disable
      RXDIS          : CR_RXDIS_Field := 16#0#;
      --  Write-only. Transmitter Enable
      TXEN           : CR_TXEN_Field := 16#0#;
      --  Write-only. Transmitter Disable
      TXDIS          : CR_TXDIS_Field := 16#0#;
      --  Write-only. Reset Status Bits
      RSTSTA         : CR_RSTSTA_Field := 16#0#;
      --  Write-only. Start Break
      STTBRK         : CR_STTBRK_Field := 16#0#;
      --  Write-only. Stop Break
      STPBRK         : CR_STPBRK_Field := 16#0#;
      --  Write-only. Start Time-out
      STTTO          : CR_STTTO_Field := 16#0#;
      --  Write-only. Send Address
      SENDA          : CR_SENDA_Field := 16#0#;
      --  Write-only. Reset Iterations
      RSTIT          : CR_RSTIT_Field := 16#0#;
      --  Write-only. Reset Non Acknowledge
      RSTNACK        : CR_RSTNACK_Field := 16#0#;
      --  Write-only. Rearm Time-out
      RETTO          : CR_RETTO_Field := 16#0#;
      --  unspecified
      Reserved_16_17 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Request to Send Enable
      RTSEN          : CR_RTSEN_Field := 16#0#;
      --  Write-only. Request to Send Disable
      RTSDIS         : CR_RTSDIS_Field := 16#0#;
      --  Write-only. Abort LIN Transmission
      LINABT         : CR_LINABT_Field := 16#0#;
      --  Write-only. Send LIN Wakeup Signal
      LINWKUP        : CR_LINWKUP_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      RSTRX          at 0 range 2 .. 2;
      RSTTX          at 0 range 3 .. 3;
      RXEN           at 0 range 4 .. 4;
      RXDIS          at 0 range 5 .. 5;
      TXEN           at 0 range 6 .. 6;
      TXDIS          at 0 range 7 .. 7;
      RSTSTA         at 0 range 8 .. 8;
      STTBRK         at 0 range 9 .. 9;
      STPBRK         at 0 range 10 .. 10;
      STTTO          at 0 range 11 .. 11;
      SENDA          at 0 range 12 .. 12;
      RSTIT          at 0 range 13 .. 13;
      RSTNACK        at 0 range 14 .. 14;
      RETTO          at 0 range 15 .. 15;
      Reserved_16_17 at 0 range 16 .. 17;
      RTSEN          at 0 range 18 .. 18;
      RTSDIS         at 0 range 19 .. 19;
      LINABT         at 0 range 20 .. 20;
      LINWKUP        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --------------------------
   -- CR_SPI_MODE_Register --
   --------------------------

   subtype CR_SPI_MODE_RSTRX_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_RSTTX_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_RXEN_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_RXDIS_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_TXEN_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_TXDIS_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_RSTSTA_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_FCS_Field is ATSAM3X8E.Bit;
   subtype CR_SPI_MODE_RCS_Field is ATSAM3X8E.Bit;

   --  Control Register
   type CR_SPI_MODE_Register is record
      --  unspecified
      Reserved_0_1   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Reset Receiver
      RSTRX          : CR_SPI_MODE_RSTRX_Field := 16#0#;
      --  Write-only. Reset Transmitter
      RSTTX          : CR_SPI_MODE_RSTTX_Field := 16#0#;
      --  Write-only. Receiver Enable
      RXEN           : CR_SPI_MODE_RXEN_Field := 16#0#;
      --  Write-only. Receiver Disable
      RXDIS          : CR_SPI_MODE_RXDIS_Field := 16#0#;
      --  Write-only. Transmitter Enable
      TXEN           : CR_SPI_MODE_TXEN_Field := 16#0#;
      --  Write-only. Transmitter Disable
      TXDIS          : CR_SPI_MODE_TXDIS_Field := 16#0#;
      --  Write-only. Reset Status Bits
      RSTSTA         : CR_SPI_MODE_RSTSTA_Field := 16#0#;
      --  unspecified
      Reserved_9_17  : ATSAM3X8E.UInt9 := 16#0#;
      --  Write-only. Force SPI Chip Select
      FCS            : CR_SPI_MODE_FCS_Field := 16#0#;
      --  Write-only. Release SPI Chip Select
      RCS            : CR_SPI_MODE_RCS_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CR_SPI_MODE_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      RSTRX          at 0 range 2 .. 2;
      RSTTX          at 0 range 3 .. 3;
      RXEN           at 0 range 4 .. 4;
      RXDIS          at 0 range 5 .. 5;
      TXEN           at 0 range 6 .. 6;
      TXDIS          at 0 range 7 .. 7;
      RSTSTA         at 0 range 8 .. 8;
      Reserved_9_17  at 0 range 9 .. 17;
      FCS            at 0 range 18 .. 18;
      RCS            at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   -----------------
   -- MR_Register --
   -----------------

   --  USART Mode of Operation
   type USART_MODE_Field is
     (
      --  Normal mode
      Normal,
      --  RS485
      Rs485,
      --  Hardware Handshaking
      Hw_Handshaking,
      --  IS07816 Protocol: T = 0
      Is07816_T_0,
      --  IS07816 Protocol: T = 1
      Is07816_T_1,
      --  IrDA
      Irda,
      --  LIN Master
      Lin_Master,
      --  LIN Slave
      Lin_Slave,
      --  SPI Master
      Spi_Master,
      --  SPI Slave
      Spi_Slave)
     with Size => 4;
   for USART_MODE_Field use
     (Normal => 0,
      Rs485 => 1,
      Hw_Handshaking => 2,
      Is07816_T_0 => 4,
      Is07816_T_1 => 6,
      Irda => 8,
      Lin_Master => 10,
      Lin_Slave => 11,
      Spi_Master => 14,
      Spi_Slave => 15);

   --  Clock Selection
   type USCLKS_Field is
     (
      --  Master Clock MCK is selected
      Mck,
      --  Internal Clock Divided MCK/DIV (DIV=8) is selected
      Div,
      --  Serial Clock SLK is selected
      Sck)
     with Size => 2;
   for USCLKS_Field use
     (Mck => 0,
      Div => 1,
      Sck => 3);

   --  Character Length.
   type CHRL_Field is
     (
      --  Character length is 5 bits
      CHRL_Field_5_Bit,
      --  Character length is 6 bits
      CHRL_Field_6_Bit,
      --  Character length is 7 bits
      CHRL_Field_7_Bit,
      --  Character length is 8 bits
      CHRL_Field_8_Bit)
     with Size => 2;
   for CHRL_Field use
     (CHRL_Field_5_Bit => 0,
      CHRL_Field_6_Bit => 1,
      CHRL_Field_7_Bit => 2,
      CHRL_Field_8_Bit => 3);

   subtype MR_SYNC_Field is ATSAM3X8E.Bit;

   --  Parity Type
   type PAR_Field is
     (
      --  Even parity
      Even,
      --  Odd parity
      Odd,
      --  Parity forced to 0 (Space)
      Space,
      --  Parity forced to 1 (Mark)
      Mark,
      --  No parity
      No,
      --  Multidrop mode
      Multidrop)
     with Size => 3;
   for PAR_Field use
     (Even => 0,
      Odd => 1,
      Space => 2,
      Mark => 3,
      No => 4,
      Multidrop => 6);

   --  Number of Stop Bits
   type NBSTOP_Field is
     (
      --  1 stop bit
      NBSTOP_Field_1_Bit,
      --  1.5 stop bit (SYNC = 0) or reserved (SYNC = 1)
      NBSTOP_Field_1_5_Bit,
      --  2 stop bits
      NBSTOP_Field_2_Bit)
     with Size => 2;
   for NBSTOP_Field use
     (NBSTOP_Field_1_Bit => 0,
      NBSTOP_Field_1_5_Bit => 1,
      NBSTOP_Field_2_Bit => 2);

   --  Channel Mode
   type CHMODE_Field is
     (
      --  Normal Mode
      Normal,
      --  Automatic Echo. Receiver input is connected to the TXD pin.
      Automatic,
      --  Local Loopback. Transmitter output is connected to the Receiver
      --  Input.
      Local_Loopback,
      --  Remote Loopback. RXD pin is internally connected to the TXD pin.
      Remote_Loopback)
     with Size => 2;
   for CHMODE_Field use
     (Normal => 0,
      Automatic => 1,
      Local_Loopback => 2,
      Remote_Loopback => 3);

   subtype MR_MSBF_Field is ATSAM3X8E.Bit;
   subtype MR_MODE9_Field is ATSAM3X8E.Bit;
   subtype MR_CLKO_Field is ATSAM3X8E.Bit;
   subtype MR_OVER_Field is ATSAM3X8E.Bit;
   subtype MR_INACK_Field is ATSAM3X8E.Bit;
   subtype MR_DSNACK_Field is ATSAM3X8E.Bit;
   subtype MR_VAR_SYNC_Field is ATSAM3X8E.Bit;
   subtype MR_INVDATA_Field is ATSAM3X8E.Bit;
   subtype MR_MAX_ITERATION_Field is ATSAM3X8E.UInt3;
   subtype MR_FILTER_Field is ATSAM3X8E.Bit;
   subtype MR_MAN_Field is ATSAM3X8E.Bit;
   subtype MR_MODSYNC_Field is ATSAM3X8E.Bit;
   subtype MR_ONEBIT_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type MR_Register is record
      --  USART Mode of Operation
      USART_MODE     : USART_MODE_Field := Normal;
      --  Clock Selection
      USCLKS         : USCLKS_Field := Mck;
      --  Character Length.
      CHRL           : CHRL_Field := CHRL_Field_5_Bit;
      --  Synchronous Mode Select
      SYNC           : MR_SYNC_Field := 16#0#;
      --  Parity Type
      PAR            : PAR_Field := Even;
      --  Number of Stop Bits
      NBSTOP         : NBSTOP_Field := NBSTOP_Field_1_Bit;
      --  Channel Mode
      CHMODE         : CHMODE_Field := Normal;
      --  Bit Order
      MSBF           : MR_MSBF_Field := 16#0#;
      --  9-bit Character Length
      MODE9          : MR_MODE9_Field := 16#0#;
      --  Clock Output Select
      CLKO           : MR_CLKO_Field := 16#0#;
      --  Oversampling Mode
      OVER           : MR_OVER_Field := 16#0#;
      --  Inhibit Non Acknowledge
      INACK          : MR_INACK_Field := 16#0#;
      --  Disable Successive NACK
      DSNACK         : MR_DSNACK_Field := 16#0#;
      --  Variable Synchronization of Command/Data Sync Start Frame Delimiter
      VAR_SYNC       : MR_VAR_SYNC_Field := 16#0#;
      --  INverted Data
      INVDATA        : MR_INVDATA_Field := 16#0#;
      --  Maximum Number of Automatic Iteration
      MAX_ITERATION  : MR_MAX_ITERATION_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : ATSAM3X8E.Bit := 16#0#;
      --  Infrared Receive Line Filter
      FILTER         : MR_FILTER_Field := 16#0#;
      --  Manchester Encoder/Decoder Enable
      MAN            : MR_MAN_Field := 16#0#;
      --  Manchester Synchronization Mode
      MODSYNC        : MR_MODSYNC_Field := 16#0#;
      --  Start Frame Delimiter Selector
      ONEBIT         : MR_ONEBIT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_Register use record
      USART_MODE     at 0 range 0 .. 3;
      USCLKS         at 0 range 4 .. 5;
      CHRL           at 0 range 6 .. 7;
      SYNC           at 0 range 8 .. 8;
      PAR            at 0 range 9 .. 11;
      NBSTOP         at 0 range 12 .. 13;
      CHMODE         at 0 range 14 .. 15;
      MSBF           at 0 range 16 .. 16;
      MODE9          at 0 range 17 .. 17;
      CLKO           at 0 range 18 .. 18;
      OVER           at 0 range 19 .. 19;
      INACK          at 0 range 20 .. 20;
      DSNACK         at 0 range 21 .. 21;
      VAR_SYNC       at 0 range 22 .. 22;
      INVDATA        at 0 range 23 .. 23;
      MAX_ITERATION  at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      FILTER         at 0 range 28 .. 28;
      MAN            at 0 range 29 .. 29;
      MODSYNC        at 0 range 30 .. 30;
      ONEBIT         at 0 range 31 .. 31;
   end record;

   --------------------------
   -- MR_SPI_MODE_Register --
   --------------------------

   --  USART Mode of Operation
   type USART_MODE_Field_1 is
     (
      --  Reset value for the field
      Usart_Mode_Field_Reset,
      --  SPI Master
      Spi_Master,
      --  SPI Slave
      Spi_Slave)
     with Size => 4;
   for USART_MODE_Field_1 use
     (Usart_Mode_Field_Reset => 0,
      Spi_Master => 14,
      Spi_Slave => 15);

   --  Character Length.
   type CHRL_Field_1 is
     (
      --  Reset value for the field
      Chrl_Field_Reset,
      --  Character length is 8 bits
      CHRL_Field_8_Bit)
     with Size => 2;
   for CHRL_Field_1 use
     (Chrl_Field_Reset => 0,
      CHRL_Field_8_Bit => 3);

   subtype MR_SPI_MODE_CPHA_Field is ATSAM3X8E.Bit;
   subtype MR_SPI_MODE_CPOL_Field is ATSAM3X8E.Bit;
   subtype MR_SPI_MODE_WRDBT_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type MR_SPI_MODE_Register is record
      --  USART Mode of Operation
      USART_MODE     : USART_MODE_Field_1 := Usart_Mode_Field_Reset;
      --  Clock Selection
      USCLKS         : USCLKS_Field := Mck;
      --  Character Length.
      CHRL           : CHRL_Field_1 := Chrl_Field_Reset;
      --  SPI Clock Phase
      CPHA           : MR_SPI_MODE_CPHA_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : ATSAM3X8E.UInt7 := 16#0#;
      --  SPI Clock Polarity
      CPOL           : MR_SPI_MODE_CPOL_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  Wait Read Data Before Transfer
      WRDBT          : MR_SPI_MODE_WRDBT_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : ATSAM3X8E.UInt11 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MR_SPI_MODE_Register use record
      USART_MODE     at 0 range 0 .. 3;
      USCLKS         at 0 range 4 .. 5;
      CHRL           at 0 range 6 .. 7;
      CPHA           at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      CPOL           at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      WRDBT          at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   subtype IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_RXBRK_Field is ATSAM3X8E.Bit;
   subtype IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype IER_FRAME_Field is ATSAM3X8E.Bit;
   subtype IER_PARE_Field is ATSAM3X8E.Bit;
   subtype IER_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_ITER_Field is ATSAM3X8E.Bit;
   subtype IER_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IER_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype IER_NACK_Field is ATSAM3X8E.Bit;
   subtype IER_CTSIC_Field is ATSAM3X8E.Bit;
   subtype IER_MANE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Write-only. RXRDY Interrupt Enable
      RXRDY          : IER_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Enable
      TXRDY          : IER_TXRDY_Field := 16#0#;
      --  Write-only. Receiver Break Interrupt Enable
      RXBRK          : IER_RXBRK_Field := 16#0#;
      --  Write-only. End of Receive Transfer Interrupt Enable (available in
      --  all USART modes of operation)
      ENDRX          : IER_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Interrupt Enable (available in all USART
      --  modes of operation)
      ENDTX          : IER_ENDTX_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : IER_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Enable
      FRAME          : IER_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Enable
      PARE           : IER_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Enable
      TIMEOUT        : IER_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Enable
      TXEMPTY        : IER_TXEMPTY_Field := 16#0#;
      --  Write-only. Max number of Repetitions Reached Interrupt Enable
      ITER           : IER_ITER_Field := 16#0#;
      --  Write-only. Buffer Empty Interrupt Enable (available in all USART
      --  modes of operation)
      TXBUFE         : IER_TXBUFE_Field := 16#0#;
      --  Write-only. Buffer Full Interrupt Enable (available in all USART
      --  modes of operation)
      RXBUFF         : IER_RXBUFF_Field := 16#0#;
      --  Write-only. Non Acknowledge Interrupt Enable
      NACK           : IER_NACK_Field := 16#0#;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Clear to Send Input Change Interrupt Enable
      CTSIC          : IER_CTSIC_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Manchester Error Interrupt Enable
      MANE           : IER_MANE_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      RXBRK          at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      ITER           at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      NACK           at 0 range 13 .. 13;
      Reserved_14_18 at 0 range 14 .. 18;
      CTSIC          at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      MANE           at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ---------------------------
   -- IER_SPI_MODE_Register --
   ---------------------------

   subtype IER_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype IER_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_SPI_MODE_Register is record
      --  Write-only. RXRDY Interrupt Enable
      RXRDY          : IER_SPI_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Enable
      TXRDY          : IER_SPI_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : IER_SPI_MODE_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. TXEMPTY Interrupt Enable
      TXEMPTY        : IER_SPI_MODE_TXEMPTY_Field := 16#0#;
      --  Write-only. SPI Underrun Error Interrupt Enable
      UNRE           : IER_SPI_MODE_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ---------------------------
   -- IER_LIN_MODE_Register --
   ---------------------------

   subtype IER_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype IER_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type IER_LIN_MODE_Register is record
      --  Write-only. RXRDY Interrupt Enable
      RXRDY          : IER_LIN_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Enable
      TXRDY          : IER_LIN_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : IER_LIN_MODE_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Enable
      FRAME          : IER_LIN_MODE_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Enable
      PARE           : IER_LIN_MODE_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Enable
      TIMEOUT        : IER_LIN_MODE_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Enable
      TXEMPTY        : IER_LIN_MODE_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. LIN Break Sent or LIN Break Received Interrupt Enable
      LINBK          : IER_LIN_MODE_LINBK_Field := 16#0#;
      --  Write-only. LIN Identifier Sent or LIN Identifier Received Interrupt
      --  Enable
      LINID          : IER_LIN_MODE_LINID_Field := 16#0#;
      --  Write-only. LIN Transfer Completed Interrupt Enable
      LINTC          : IER_LIN_MODE_LINTC_Field := 16#0#;
      --  unspecified
      Reserved_16_24 : ATSAM3X8E.UInt9 := 16#0#;
      --  Write-only. LIN Bus Error Interrupt Enable
      LINBE          : IER_LIN_MODE_LINBE_Field := 16#0#;
      --  Write-only. LIN Inconsistent Synch Field Error Interrupt Enable
      LINISFE        : IER_LIN_MODE_LINISFE_Field := 16#0#;
      --  Write-only. LIN Identifier Parity Interrupt Enable
      LINIPE         : IER_LIN_MODE_LINIPE_Field := 16#0#;
      --  Write-only. LIN Checksum Error Interrupt Enable
      LINCE          : IER_LIN_MODE_LINCE_Field := 16#0#;
      --  Write-only. LIN Slave Not Responding Error Interrupt Enable
      LINSNRE        : IER_LIN_MODE_LINSNRE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IER_LIN_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      LINBK          at 0 range 13 .. 13;
      LINID          at 0 range 14 .. 14;
      LINTC          at 0 range 15 .. 15;
      Reserved_16_24 at 0 range 16 .. 24;
      LINBE          at 0 range 25 .. 25;
      LINISFE        at 0 range 26 .. 26;
      LINIPE         at 0 range 27 .. 27;
      LINCE          at 0 range 28 .. 28;
      LINSNRE        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_RXBRK_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_FRAME_Field is ATSAM3X8E.Bit;
   subtype IDR_PARE_Field is ATSAM3X8E.Bit;
   subtype IDR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_ITER_Field is ATSAM3X8E.Bit;
   subtype IDR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IDR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype IDR_NACK_Field is ATSAM3X8E.Bit;
   subtype IDR_CTSIC_Field is ATSAM3X8E.Bit;
   subtype IDR_MANE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_Register is record
      --  Write-only. RXRDY Interrupt Disable
      RXRDY          : IDR_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Disable
      TXRDY          : IDR_TXRDY_Field := 16#0#;
      --  Write-only. Receiver Break Interrupt Disable
      RXBRK          : IDR_RXBRK_Field := 16#0#;
      --  Write-only. End of Receive Transfer Interrupt Disable (available in
      --  all USART modes of operation)
      ENDRX          : IDR_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Interrupt Disable (available in all USART
      --  modes of operation)
      ENDTX          : IDR_ENDTX_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : IDR_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Disable
      FRAME          : IDR_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Disable
      PARE           : IDR_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Disable
      TIMEOUT        : IDR_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Disable
      TXEMPTY        : IDR_TXEMPTY_Field := 16#0#;
      --  Write-only. Max number of Repetitions Reached Interrupt Disable
      ITER           : IDR_ITER_Field := 16#0#;
      --  Write-only. Buffer Empty Interrupt Disable (available in all USART
      --  modes of operation)
      TXBUFE         : IDR_TXBUFE_Field := 16#0#;
      --  Write-only. Buffer Full Interrupt Disable (available in all USART
      --  modes of operation)
      RXBUFF         : IDR_RXBUFF_Field := 16#0#;
      --  Write-only. Non Acknowledge Interrupt Disable
      NACK           : IDR_NACK_Field := 16#0#;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Clear to Send Input Change Interrupt Disable
      CTSIC          : IDR_CTSIC_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Manchester Error Interrupt Disable
      MANE           : IDR_MANE_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      RXBRK          at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      ITER           at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      NACK           at 0 range 13 .. 13;
      Reserved_14_18 at 0 range 14 .. 18;
      CTSIC          at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      MANE           at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ---------------------------
   -- IDR_SPI_MODE_Register --
   ---------------------------

   subtype IDR_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_SPI_MODE_Register is record
      --  Write-only. RXRDY Interrupt Disable
      RXRDY          : IDR_SPI_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Disable
      TXRDY          : IDR_SPI_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE           : IDR_SPI_MODE_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. TXEMPTY Interrupt Disable
      TXEMPTY        : IDR_SPI_MODE_TXEMPTY_Field := 16#0#;
      --  Write-only. SPI Underrun Error Interrupt Disable
      UNRE           : IDR_SPI_MODE_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ---------------------------
   -- IDR_LIN_MODE_Register --
   ---------------------------

   subtype IDR_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype IDR_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type IDR_LIN_MODE_Register is record
      --  Write-only. RXRDY Interrupt Disable
      RXRDY          : IDR_LIN_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Disable
      TXRDY          : IDR_LIN_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE           : IDR_LIN_MODE_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Disable
      FRAME          : IDR_LIN_MODE_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Disable
      PARE           : IDR_LIN_MODE_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Disable
      TIMEOUT        : IDR_LIN_MODE_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Disable
      TXEMPTY        : IDR_LIN_MODE_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. LIN Break Sent or LIN Break Received Interrupt Disable
      LINBK          : IDR_LIN_MODE_LINBK_Field := 16#0#;
      --  Write-only. LIN Identifier Sent or LIN Identifier Received Interrupt
      --  Disable
      LINID          : IDR_LIN_MODE_LINID_Field := 16#0#;
      --  Write-only. LIN Transfer Completed Interrupt Disable
      LINTC          : IDR_LIN_MODE_LINTC_Field := 16#0#;
      --  unspecified
      Reserved_16_24 : ATSAM3X8E.UInt9 := 16#0#;
      --  Write-only. LIN Bus Error Interrupt Disable
      LINBE          : IDR_LIN_MODE_LINBE_Field := 16#0#;
      --  Write-only. LIN Inconsistent Synch Field Error Interrupt Disable
      LINISFE        : IDR_LIN_MODE_LINISFE_Field := 16#0#;
      --  Write-only. LIN Identifier Parity Interrupt Disable
      LINIPE         : IDR_LIN_MODE_LINIPE_Field := 16#0#;
      --  Write-only. LIN Checksum Error Interrupt Disable
      LINCE          : IDR_LIN_MODE_LINCE_Field := 16#0#;
      --  Write-only. LIN Slave Not Responding Error Interrupt Disable
      LINSNRE        : IDR_LIN_MODE_LINSNRE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_LIN_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      LINBK          at 0 range 13 .. 13;
      LINID          at 0 range 14 .. 14;
      LINTC          at 0 range 15 .. 15;
      Reserved_16_24 at 0 range 16 .. 24;
      LINBE          at 0 range 25 .. 25;
      LINISFE        at 0 range 26 .. 26;
      LINIPE         at 0 range 27 .. 27;
      LINCE          at 0 range 28 .. 28;
      LINSNRE        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   subtype IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_RXBRK_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_FRAME_Field is ATSAM3X8E.Bit;
   subtype IMR_PARE_Field is ATSAM3X8E.Bit;
   subtype IMR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_ITER_Field is ATSAM3X8E.Bit;
   subtype IMR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype IMR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype IMR_NACK_Field is ATSAM3X8E.Bit;
   subtype IMR_CTSIC_Field is ATSAM3X8E.Bit;
   subtype IMR_MANE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_Register is record
      --  Read-only. RXRDY Interrupt Mask
      RXRDY          : IMR_RXRDY_Field := 16#0#;
      --  Read-only. TXRDY Interrupt Mask
      TXRDY          : IMR_TXRDY_Field := 16#0#;
      --  Read-only. Receiver Break Interrupt Mask
      RXBRK          : IMR_RXBRK_Field := 16#0#;
      --  Read-only. End of Receive Transfer Interrupt Mask (available in all
      --  USART modes of operation)
      ENDRX          : IMR_ENDRX_Field := 16#0#;
      --  Read-only. End of Transmit Interrupt Mask (available in all USART
      --  modes of operation)
      ENDTX          : IMR_ENDTX_Field := 16#0#;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : IMR_OVRE_Field := 16#0#;
      --  Read-only. Framing Error Interrupt Mask
      FRAME          : IMR_FRAME_Field := 16#0#;
      --  Read-only. Parity Error Interrupt Mask
      PARE           : IMR_PARE_Field := 16#0#;
      --  Read-only. Time-out Interrupt Mask
      TIMEOUT        : IMR_TIMEOUT_Field := 16#0#;
      --  Read-only. TXEMPTY Interrupt Mask
      TXEMPTY        : IMR_TXEMPTY_Field := 16#0#;
      --  Read-only. Max number of Repetitions Reached Interrupt Mask
      ITER           : IMR_ITER_Field := 16#0#;
      --  Read-only. Buffer Empty Interrupt Mask (available in all USART modes
      --  of operation)
      TXBUFE         : IMR_TXBUFE_Field := 16#0#;
      --  Read-only. Buffer Full Interrupt Mask (available in all USART modes
      --  of operation)
      RXBUFF         : IMR_RXBUFF_Field := 16#0#;
      --  Read-only. Non Acknowledge Interrupt Mask
      NACK           : IMR_NACK_Field := 16#0#;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5;
      --  Read-only. Clear to Send Input Change Interrupt Mask
      CTSIC          : IMR_CTSIC_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4;
      --  Read-only. Manchester Error Interrupt Mask
      MANE           : IMR_MANE_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      RXBRK          at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      ITER           at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      NACK           at 0 range 13 .. 13;
      Reserved_14_18 at 0 range 14 .. 18;
      CTSIC          at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      MANE           at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ---------------------------
   -- IMR_SPI_MODE_Register --
   ---------------------------

   subtype IMR_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_SPI_MODE_Register is record
      --  Read-only. RXRDY Interrupt Mask
      RXRDY          : IMR_SPI_MODE_RXRDY_Field := 16#0#;
      --  Read-only. TXRDY Interrupt Mask
      TXRDY          : IMR_SPI_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : IMR_SPI_MODE_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3;
      --  Read-only. TXEMPTY Interrupt Mask
      TXEMPTY        : IMR_SPI_MODE_TXEMPTY_Field := 16#0#;
      --  Read-only. SPI Underrun Error Interrupt Mask
      UNRE           : IMR_SPI_MODE_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ---------------------------
   -- IMR_LIN_MODE_Register --
   ---------------------------

   subtype IMR_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype IMR_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type IMR_LIN_MODE_Register is record
      --  Read-only. RXRDY Interrupt Mask
      RXRDY          : IMR_LIN_MODE_RXRDY_Field := 16#0#;
      --  Read-only. TXRDY Interrupt Mask
      TXRDY          : IMR_LIN_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : IMR_LIN_MODE_OVRE_Field := 16#0#;
      --  Read-only. Framing Error Interrupt Mask
      FRAME          : IMR_LIN_MODE_FRAME_Field := 16#0#;
      --  Read-only. Parity Error Interrupt Mask
      PARE           : IMR_LIN_MODE_PARE_Field := 16#0#;
      --  Read-only. Time-out Interrupt Mask
      TIMEOUT        : IMR_LIN_MODE_TIMEOUT_Field := 16#0#;
      --  Read-only. TXEMPTY Interrupt Mask
      TXEMPTY        : IMR_LIN_MODE_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3;
      --  Read-only. LIN Break Sent or LIN Break Received Interrupt Mask
      LINBK          : IMR_LIN_MODE_LINBK_Field := 16#0#;
      --  Read-only. LIN Identifier Sent or LIN Identifier Received Interrupt
      --  Mask
      LINID          : IMR_LIN_MODE_LINID_Field := 16#0#;
      --  Read-only. LIN Transfer Completed Interrupt Mask
      LINTC          : IMR_LIN_MODE_LINTC_Field := 16#0#;
      --  unspecified
      Reserved_16_24 : ATSAM3X8E.UInt9;
      --  Read-only. LIN Bus Error Interrupt Mask
      LINBE          : IMR_LIN_MODE_LINBE_Field := 16#0#;
      --  Read-only. LIN Inconsistent Synch Field Error Interrupt Mask
      LINISFE        : IMR_LIN_MODE_LINISFE_Field := 16#0#;
      --  Read-only. LIN Identifier Parity Interrupt Mask
      LINIPE         : IMR_LIN_MODE_LINIPE_Field := 16#0#;
      --  Read-only. LIN Checksum Error Interrupt Mask
      LINCE          : IMR_LIN_MODE_LINCE_Field := 16#0#;
      --  Read-only. LIN Slave Not Responding Error Interrupt Mask
      LINSNRE        : IMR_LIN_MODE_LINSNRE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IMR_LIN_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      LINBK          at 0 range 13 .. 13;
      LINID          at 0 range 14 .. 14;
      LINTC          at 0 range 15 .. 15;
      Reserved_16_24 at 0 range 16 .. 24;
      LINBE          at 0 range 25 .. 25;
      LINISFE        at 0 range 26 .. 26;
      LINIPE         at 0 range 27 .. 27;
      LINCE          at 0 range 28 .. 28;
      LINSNRE        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   ------------------
   -- CSR_Register --
   ------------------

   subtype CSR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype CSR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype CSR_RXBRK_Field is ATSAM3X8E.Bit;
   subtype CSR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype CSR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype CSR_OVRE_Field is ATSAM3X8E.Bit;
   subtype CSR_FRAME_Field is ATSAM3X8E.Bit;
   subtype CSR_PARE_Field is ATSAM3X8E.Bit;
   subtype CSR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype CSR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype CSR_ITER_Field is ATSAM3X8E.Bit;
   subtype CSR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype CSR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype CSR_NACK_Field is ATSAM3X8E.Bit;
   subtype CSR_CTSIC_Field is ATSAM3X8E.Bit;
   subtype CSR_CTS_Field is ATSAM3X8E.Bit;
   subtype CSR_MANERR_Field is ATSAM3X8E.Bit;

   --  Channel Status Register
   type CSR_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : CSR_RXRDY_Field := 16#0#;
      --  Read-only. Transmitter Ready
      TXRDY          : CSR_TXRDY_Field := 16#0#;
      --  Read-only. Break Received/End of Break
      RXBRK          : CSR_RXBRK_Field := 16#0#;
      --  Read-only. End of Receiver Transfer
      ENDRX          : CSR_ENDRX_Field := 16#0#;
      --  Read-only. End of Transmitter Transfer
      ENDTX          : CSR_ENDTX_Field := 16#0#;
      --  Read-only. Overrun Error
      OVRE           : CSR_OVRE_Field := 16#0#;
      --  Read-only. Framing Error
      FRAME          : CSR_FRAME_Field := 16#0#;
      --  Read-only. Parity Error
      PARE           : CSR_PARE_Field := 16#0#;
      --  Read-only. Receiver Time-out
      TIMEOUT        : CSR_TIMEOUT_Field := 16#0#;
      --  Read-only. Transmitter Empty
      TXEMPTY        : CSR_TXEMPTY_Field := 16#0#;
      --  Read-only. Max number of Repetitions Reached
      ITER           : CSR_ITER_Field := 16#0#;
      --  Read-only. Transmission Buffer Empty
      TXBUFE         : CSR_TXBUFE_Field := 16#0#;
      --  Read-only. Reception Buffer Full
      RXBUFF         : CSR_RXBUFF_Field := 16#0#;
      --  Read-only. Non Acknowledge Interrupt
      NACK           : CSR_NACK_Field := 16#0#;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5;
      --  Read-only. Clear to Send Input Change Flag
      CTSIC          : CSR_CTSIC_Field := 16#0#;
      --  unspecified
      Reserved_20_22 : ATSAM3X8E.UInt3;
      --  Read-only. Image of CTS Input
      CTS            : CSR_CTS_Field := 16#0#;
      --  Read-only. Manchester Error
      MANERR         : CSR_MANERR_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      RXBRK          at 0 range 2 .. 2;
      ENDRX          at 0 range 3 .. 3;
      ENDTX          at 0 range 4 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      ITER           at 0 range 10 .. 10;
      TXBUFE         at 0 range 11 .. 11;
      RXBUFF         at 0 range 12 .. 12;
      NACK           at 0 range 13 .. 13;
      Reserved_14_18 at 0 range 14 .. 18;
      CTSIC          at 0 range 19 .. 19;
      Reserved_20_22 at 0 range 20 .. 22;
      CTS            at 0 range 23 .. 23;
      MANERR         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   ---------------------------
   -- CSR_SPI_MODE_Register --
   ---------------------------

   subtype CSR_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype CSR_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype CSR_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype CSR_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype CSR_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Channel Status Register
   type CSR_SPI_MODE_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : CSR_SPI_MODE_RXRDY_Field := 16#0#;
      --  Read-only. Transmitter Ready
      TXRDY          : CSR_SPI_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error
      OVRE           : CSR_SPI_MODE_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3;
      --  Read-only. Transmitter Empty
      TXEMPTY        : CSR_SPI_MODE_TXEMPTY_Field := 16#0#;
      --  Read-only. Underrun Error
      UNRE           : CSR_SPI_MODE_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ---------------------------
   -- CSR_LIN_MODE_Register --
   ---------------------------

   subtype CSR_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINBLS_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype CSR_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Channel Status Register
   type CSR_LIN_MODE_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : CSR_LIN_MODE_RXRDY_Field := 16#0#;
      --  Read-only. Transmitter Ready
      TXRDY          : CSR_LIN_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error
      OVRE           : CSR_LIN_MODE_OVRE_Field := 16#0#;
      --  Read-only. Framing Error
      FRAME          : CSR_LIN_MODE_FRAME_Field := 16#0#;
      --  Read-only. Parity Error
      PARE           : CSR_LIN_MODE_PARE_Field := 16#0#;
      --  Read-only. Receiver Time-out
      TIMEOUT        : CSR_LIN_MODE_TIMEOUT_Field := 16#0#;
      --  Read-only. Transmitter Empty
      TXEMPTY        : CSR_LIN_MODE_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3;
      --  Read-only. LIN Break Sent or LIN Break Received
      LINBK          : CSR_LIN_MODE_LINBK_Field := 16#0#;
      --  Read-only. LIN Identifier Sent or LIN Identifier Received
      LINID          : CSR_LIN_MODE_LINID_Field := 16#0#;
      --  Read-only. LIN Transfer Completed
      LINTC          : CSR_LIN_MODE_LINTC_Field := 16#0#;
      --  unspecified
      Reserved_16_22 : ATSAM3X8E.UInt7;
      --  Read-only. LIN Bus Line Status
      LINBLS         : CSR_LIN_MODE_LINBLS_Field := 16#0#;
      --  unspecified
      Reserved_24_24 : ATSAM3X8E.Bit;
      --  Read-only. LIN Bit Error
      LINBE          : CSR_LIN_MODE_LINBE_Field := 16#0#;
      --  Read-only. LIN Inconsistent Synch Field Error
      LINISFE        : CSR_LIN_MODE_LINISFE_Field := 16#0#;
      --  Read-only. LIN Identifier Parity Error
      LINIPE         : CSR_LIN_MODE_LINIPE_Field := 16#0#;
      --  Read-only. LIN Checksum Error
      LINCE          : CSR_LIN_MODE_LINCE_Field := 16#0#;
      --  Read-only. LIN Slave Not Responding Error
      LINSNRE        : CSR_LIN_MODE_LINSNRE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_LIN_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      FRAME          at 0 range 6 .. 6;
      PARE           at 0 range 7 .. 7;
      TIMEOUT        at 0 range 8 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      LINBK          at 0 range 13 .. 13;
      LINID          at 0 range 14 .. 14;
      LINTC          at 0 range 15 .. 15;
      Reserved_16_22 at 0 range 16 .. 22;
      LINBLS         at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      LINBE          at 0 range 25 .. 25;
      LINISFE        at 0 range 26 .. 26;
      LINIPE         at 0 range 27 .. 27;
      LINCE          at 0 range 28 .. 28;
      LINSNRE        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   ------------------
   -- RHR_Register --
   ------------------

   subtype RHR_RXCHR_Field is ATSAM3X8E.UInt9;
   subtype RHR_RXSYNH_Field is ATSAM3X8E.Bit;

   --  Receiver Holding Register
   type RHR_Register is record
      --  Read-only. Received Character
      RXCHR          : RHR_RXCHR_Field := 16#0#;
      --  unspecified
      Reserved_9_14  : ATSAM3X8E.UInt6;
      --  Read-only. Received Sync
      RXSYNH         : RHR_RXSYNH_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RHR_Register use record
      RXCHR          at 0 range 0 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      RXSYNH         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- THR_Register --
   ------------------

   subtype THR_TXCHR_Field is ATSAM3X8E.UInt9;
   subtype THR_TXSYNH_Field is ATSAM3X8E.Bit;

   --  Transmitter Holding Register
   type THR_Register is record
      --  Write-only. Character to be Transmitted
      TXCHR          : THR_TXCHR_Field := 16#0#;
      --  unspecified
      Reserved_9_14  : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Sync Field to be transmitted
      TXSYNH         : THR_TXSYNH_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.Short := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for THR_Register use record
      TXCHR          at 0 range 0 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      TXSYNH         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- BRGR_Register --
   -------------------

   subtype BRGR_CD_Field is ATSAM3X8E.Short;
   subtype BRGR_FP_Field is ATSAM3X8E.UInt3;

   --  Baud Rate Generator Register
   type BRGR_Register is record
      --  Clock Divider
      CD             : BRGR_CD_Field := 16#0#;
      --  Fractional Part
      FP             : BRGR_FP_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for BRGR_Register use record
      CD             at 0 range 0 .. 15;
      FP             at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -------------------
   -- RTOR_Register --
   -------------------

   subtype RTOR_TO_Field is ATSAM3X8E.UInt17;

   --  Receiver Time-out Register
   type RTOR_Register is record
      --  Time-out Value
      TO             : RTOR_TO_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for RTOR_Register use record
      TO             at 0 range 0 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   -------------------
   -- TTGR_Register --
   -------------------

   subtype TTGR_TG_Field is ATSAM3X8E.Byte;

   --  Transmitter Timeguard Register
   type TTGR_Register is record
      --  Timeguard Value
      TG            : TTGR_TG_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for TTGR_Register use record
      TG            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- FIDI_Register --
   -------------------

   subtype FIDI_FI_DI_RATIO_Field is ATSAM3X8E.UInt11;

   --  FI DI Ratio Register
   type FIDI_Register is record
      --  FI Over DI Ratio Value
      FI_DI_RATIO    : FIDI_FI_DI_RATIO_Field := 16#174#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for FIDI_Register use record
      FI_DI_RATIO    at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ------------------
   -- NER_Register --
   ------------------

   subtype NER_NB_ERRORS_Field is ATSAM3X8E.Byte;

   --  Number of Errors Register
   type NER_Register is record
      --  Read-only. Number of Errors
      NB_ERRORS     : NER_NB_ERRORS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for NER_Register use record
      NB_ERRORS     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- IF_Register --
   -----------------

   subtype IF_IRDA_FILTER_Field is ATSAM3X8E.Byte;

   --  IrDA Filter Register
   type IF_Register is record
      --  IrDA Filter
      IRDA_FILTER   : IF_IRDA_FILTER_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for IF_Register use record
      IRDA_FILTER   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- MAN_Register --
   ------------------

   subtype MAN_TX_PL_Field is ATSAM3X8E.UInt4;

   --  Transmitter Preamble Pattern
   type TX_PP_Field is
     (
      --  The preamble is composed of '1's
      All_One,
      --  The preamble is composed of '0's
      All_Zero,
      --  The preamble is composed of '01's
      Zero_One,
      --  The preamble is composed of '10's
      One_Zero)
     with Size => 2;
   for TX_PP_Field use
     (All_One => 0,
      All_Zero => 1,
      Zero_One => 2,
      One_Zero => 3);

   subtype MAN_TX_MPOL_Field is ATSAM3X8E.Bit;
   subtype MAN_RX_PL_Field is ATSAM3X8E.UInt4;

   --  Receiver Preamble Pattern detected
   type RX_PP_Field is
     (
      --  The preamble is composed of '1's
      All_One,
      --  The preamble is composed of '0's
      All_Zero,
      --  The preamble is composed of '01's
      Zero_One,
      --  The preamble is composed of '10's
      One_Zero)
     with Size => 2;
   for RX_PP_Field use
     (All_One => 0,
      All_Zero => 1,
      Zero_One => 2,
      One_Zero => 3);

   subtype MAN_RX_MPOL_Field is ATSAM3X8E.Bit;
   subtype MAN_ONE_Field is ATSAM3X8E.Bit;
   subtype MAN_DRIFT_Field is ATSAM3X8E.Bit;

   --  Manchester Encoder Decoder Register
   type MAN_Register is record
      --  Transmitter Preamble Length
      TX_PL          : MAN_TX_PL_Field := 16#4#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Transmitter Preamble Pattern
      TX_PP          : TX_PP_Field := All_One;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2 := 16#0#;
      --  Transmitter Manchester Polarity
      TX_MPOL        : MAN_TX_MPOL_Field := 16#1#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Receiver Preamble Length
      RX_PL          : MAN_RX_PL_Field := 16#1#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Receiver Preamble Pattern detected
      RX_PP          : RX_PP_Field := All_One;
      --  unspecified
      Reserved_26_27 : ATSAM3X8E.UInt2 := 16#0#;
      --  Receiver Manchester Polarity
      RX_MPOL        : MAN_RX_MPOL_Field := 16#1#;
      --  Must Be Set to 1
      ONE            : MAN_ONE_Field := 16#1#;
      --  Drift compensation
      DRIFT          : MAN_DRIFT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#1#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for MAN_Register use record
      TX_PL          at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TX_PP          at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      TX_MPOL        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      RX_PL          at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      RX_PP          at 0 range 24 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      RX_MPOL        at 0 range 28 .. 28;
      ONE            at 0 range 29 .. 29;
      DRIFT          at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --------------------
   -- LINMR_Register --
   --------------------

   --  LIN Node Action
   type NACT_Field is
     (
      --  The USART transmits the response.
      Publish,
      --  The USART receives the response.
      Subscribe,
      --  The USART does not transmit and does not receive the response.
      Ignore)
     with Size => 2;
   for NACT_Field use
     (Publish => 0,
      Subscribe => 1,
      Ignore => 2);

   subtype LINMR_PARDIS_Field is ATSAM3X8E.Bit;
   subtype LINMR_CHKDIS_Field is ATSAM3X8E.Bit;
   subtype LINMR_CHKTYP_Field is ATSAM3X8E.Bit;
   subtype LINMR_DLM_Field is ATSAM3X8E.Bit;
   subtype LINMR_FSDIS_Field is ATSAM3X8E.Bit;
   subtype LINMR_WKUPTYP_Field is ATSAM3X8E.Bit;
   subtype LINMR_DLC_Field is ATSAM3X8E.Byte;
   subtype LINMR_PDCM_Field is ATSAM3X8E.Bit;

   --  LIN Mode Register
   type LINMR_Register is record
      --  LIN Node Action
      NACT           : NACT_Field := Publish;
      --  Parity Disable
      PARDIS         : LINMR_PARDIS_Field := 16#0#;
      --  Checksum Disable
      CHKDIS         : LINMR_CHKDIS_Field := 16#0#;
      --  Checksum Type
      CHKTYP         : LINMR_CHKTYP_Field := 16#0#;
      --  Data Length Mode
      DLM            : LINMR_DLM_Field := 16#0#;
      --  Frame Slot Mode Disable
      FSDIS          : LINMR_FSDIS_Field := 16#0#;
      --  Wakeup Signal Type
      WKUPTYP        : LINMR_WKUPTYP_Field := 16#0#;
      --  Data Length Control
      DLC            : LINMR_DLC_Field := 16#0#;
      --  PDC Mode
      PDCM           : LINMR_PDCM_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for LINMR_Register use record
      NACT           at 0 range 0 .. 1;
      PARDIS         at 0 range 2 .. 2;
      CHKDIS         at 0 range 3 .. 3;
      CHKTYP         at 0 range 4 .. 4;
      DLM            at 0 range 5 .. 5;
      FSDIS          at 0 range 6 .. 6;
      WKUPTYP        at 0 range 7 .. 7;
      DLC            at 0 range 8 .. 15;
      PDCM           at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --------------------
   -- LINIR_Register --
   --------------------

   subtype LINIR_IDCHR_Field is ATSAM3X8E.Byte;

   --  LIN Identifier Register
   type LINIR_Register is record
      --  Identifier Character
      IDCHR         : LINIR_IDCHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for LINIR_Register use record
      IDCHR         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type WPMR_Register is record
      --  Write Protect Enable
      WPEN         : WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPSR_Register --
   -------------------

   subtype WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype WPSR_WPVSRC_Field is ATSAM3X8E.Short;

   --  Write Protect Status Register
   type WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : WPSR_WPVS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : WPSR_WPVSRC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
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

   --  Universal Synchronous Asynchronous Receiver Transmitter 0
   type USART_Peripheral is record
      --  Control Register
      CR    : CR_Register;
      --  Mode Register
      MR    : MR_Register;
      --  Interrupt Enable Register
      IER   : IER_Register;
      --  Interrupt Disable Register
      IDR   : IDR_Register;
      --  Interrupt Mask Register
      IMR   : IMR_Register;
      --  Channel Status Register
      CSR   : CSR_Register;
      --  Receiver Holding Register
      RHR   : RHR_Register;
      --  Transmitter Holding Register
      THR   : THR_Register;
      --  Baud Rate Generator Register
      BRGR  : BRGR_Register;
      --  Receiver Time-out Register
      RTOR  : RTOR_Register;
      --  Transmitter Timeguard Register
      TTGR  : TTGR_Register;
      --  FI DI Ratio Register
      FIDI  : FIDI_Register;
      --  Number of Errors Register
      NER   : NER_Register;
      --  IrDA Filter Register
      IF_k  : IF_Register;
      --  Manchester Encoder Decoder Register
      MAN   : MAN_Register;
      --  LIN Mode Register
      LINMR : LINMR_Register;
      --  LIN Identifier Register
      LINIR : LINIR_Register;
      --  Write Protect Mode Register
      WPMR  : WPMR_Register;
      --  Write Protect Status Register
      WPSR  : WPSR_Register;
      --  Receive Pointer Register
      RPR   : ATSAM3X8E.Word;
      --  Receive Counter Register
      RCR   : RCR_Register;
      --  Transmit Pointer Register
      TPR   : ATSAM3X8E.Word;
      --  Transmit Counter Register
      TCR   : TCR_Register;
      --  Receive Next Pointer Register
      RNPR  : ATSAM3X8E.Word;
      --  Receive Next Counter Register
      RNCR  : RNCR_Register;
      --  Transmit Next Pointer Register
      TNPR  : ATSAM3X8E.Word;
      --  Transmit Next Counter Register
      TNCR  : TNCR_Register;
      --  Transfer Control Register
      PTCR  : PTCR_Register;
      --  Transfer Status Register
      PTSR  : PTSR_Register;
   end record
     with Volatile;

   for USART_Peripheral use record
      CR    at 0 range 0 .. 31;
      MR    at 4 range 0 .. 31;
      IER   at 8 range 0 .. 31;
      IDR   at 12 range 0 .. 31;
      IMR   at 16 range 0 .. 31;
      CSR   at 20 range 0 .. 31;
      RHR   at 24 range 0 .. 31;
      THR   at 28 range 0 .. 31;
      BRGR  at 32 range 0 .. 31;
      RTOR  at 36 range 0 .. 31;
      TTGR  at 40 range 0 .. 31;
      FIDI  at 64 range 0 .. 31;
      NER   at 68 range 0 .. 31;
      IF_k  at 76 range 0 .. 31;
      MAN   at 80 range 0 .. 31;
      LINMR at 84 range 0 .. 31;
      LINIR at 88 range 0 .. 31;
      WPMR  at 228 range 0 .. 31;
      WPSR  at 232 range 0 .. 31;
      RPR   at 256 range 0 .. 31;
      RCR   at 260 range 0 .. 31;
      TPR   at 264 range 0 .. 31;
      TCR   at 268 range 0 .. 31;
      RNPR  at 272 range 0 .. 31;
      RNCR  at 276 range 0 .. 31;
      TNPR  at 280 range 0 .. 31;
      TNCR  at 284 range 0 .. 31;
      PTCR  at 288 range 0 .. 31;
      PTSR  at 292 range 0 .. 31;
   end record;

   --  Universal Synchronous Asynchronous Receiver Transmitter 0
   USART0_Periph : aliased USART_Peripheral
     with Import, Address => USART0_Base;

   --  Universal Synchronous Asynchronous Receiver Transmitter 1
   USART1_Periph : aliased USART_Peripheral
     with Import, Address => USART1_Base;

   --  Universal Synchronous Asynchronous Receiver Transmitter 2
   USART2_Periph : aliased USART_Peripheral
     with Import, Address => USART2_Base;

   --  Universal Synchronous Asynchronous Receiver Transmitter 3
   USART3_Periph : aliased USART_Peripheral
     with Import, Address => USART3_Base;

end ATSAM3X8E.USART;
