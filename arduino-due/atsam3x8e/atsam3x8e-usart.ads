pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package ATSAM3X8E.USART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype USART0_CR_RSTRX_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RSTTX_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RXEN_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RXDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_TXEN_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_TXDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RSTSTA_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_STTBRK_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_STPBRK_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_STTTO_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SENDA_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RSTIT_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RSTNACK_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RETTO_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RTSEN_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_RTSDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_LINABT_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_LINWKUP_Field is ATSAM3X8E.Bit;

   --  Control Register
   type USART0_CR_Register is record
      --  unspecified
      Reserved_0_1   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Reset Receiver
      RSTRX          : USART0_CR_RSTRX_Field := 16#0#;
      --  Write-only. Reset Transmitter
      RSTTX          : USART0_CR_RSTTX_Field := 16#0#;
      --  Write-only. Receiver Enable
      RXEN           : USART0_CR_RXEN_Field := 16#0#;
      --  Write-only. Receiver Disable
      RXDIS          : USART0_CR_RXDIS_Field := 16#0#;
      --  Write-only. Transmitter Enable
      TXEN           : USART0_CR_TXEN_Field := 16#0#;
      --  Write-only. Transmitter Disable
      TXDIS          : USART0_CR_TXDIS_Field := 16#0#;
      --  Write-only. Reset Status Bits
      RSTSTA         : USART0_CR_RSTSTA_Field := 16#0#;
      --  Write-only. Start Break
      STTBRK         : USART0_CR_STTBRK_Field := 16#0#;
      --  Write-only. Stop Break
      STPBRK         : USART0_CR_STPBRK_Field := 16#0#;
      --  Write-only. Start Time-out
      STTTO          : USART0_CR_STTTO_Field := 16#0#;
      --  Write-only. Send Address
      SENDA          : USART0_CR_SENDA_Field := 16#0#;
      --  Write-only. Reset Iterations
      RSTIT          : USART0_CR_RSTIT_Field := 16#0#;
      --  Write-only. Reset Non Acknowledge
      RSTNACK        : USART0_CR_RSTNACK_Field := 16#0#;
      --  Write-only. Rearm Time-out
      RETTO          : USART0_CR_RETTO_Field := 16#0#;
      --  unspecified
      Reserved_16_17 : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Request to Send Enable
      RTSEN          : USART0_CR_RTSEN_Field := 16#0#;
      --  Write-only. Request to Send Disable
      RTSDIS         : USART0_CR_RTSDIS_Field := 16#0#;
      --  Write-only. Abort LIN Transmission
      LINABT         : USART0_CR_LINABT_Field := 16#0#;
      --  Write-only. Send LIN Wakeup Signal
      LINWKUP        : USART0_CR_LINWKUP_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : ATSAM3X8E.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_CR_Register use record
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

   subtype USART0_CR_SPI_MODE_RSTRX_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_RSTTX_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_RXEN_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_RXDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_TXEN_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_TXDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_RSTSTA_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_FCS_Field is ATSAM3X8E.Bit;
   subtype USART0_CR_SPI_MODE_RCS_Field is ATSAM3X8E.Bit;

   --  Control Register
   type USART0_CR_SPI_MODE_Register is record
      --  unspecified
      Reserved_0_1   : ATSAM3X8E.UInt2 := 16#0#;
      --  Write-only. Reset Receiver
      RSTRX          : USART0_CR_SPI_MODE_RSTRX_Field := 16#0#;
      --  Write-only. Reset Transmitter
      RSTTX          : USART0_CR_SPI_MODE_RSTTX_Field := 16#0#;
      --  Write-only. Receiver Enable
      RXEN           : USART0_CR_SPI_MODE_RXEN_Field := 16#0#;
      --  Write-only. Receiver Disable
      RXDIS          : USART0_CR_SPI_MODE_RXDIS_Field := 16#0#;
      --  Write-only. Transmitter Enable
      TXEN           : USART0_CR_SPI_MODE_TXEN_Field := 16#0#;
      --  Write-only. Transmitter Disable
      TXDIS          : USART0_CR_SPI_MODE_TXDIS_Field := 16#0#;
      --  Write-only. Reset Status Bits
      RSTSTA         : USART0_CR_SPI_MODE_RSTSTA_Field := 16#0#;
      --  unspecified
      Reserved_9_17  : ATSAM3X8E.UInt9 := 16#0#;
      --  Write-only. Force SPI Chip Select
      FCS            : USART0_CR_SPI_MODE_FCS_Field := 16#0#;
      --  Write-only. Release SPI Chip Select
      RCS            : USART0_CR_SPI_MODE_RCS_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : ATSAM3X8E.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_CR_SPI_MODE_Register use record
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

   --  USART Mode of Operation
   type MR_USART_MODE_Field is
     (--  Normal mode
      NORMAL,
      --  RS485
      RS485,
      --  Hardware Handshaking
      HW_HANDSHAKING,
      --  IS07816 Protocol: T = 0
      IS07816_T_0,
      --  IS07816 Protocol: T = 1
      IS07816_T_1,
      --  IrDA
      IRDA,
      --  LIN Master
      LIN_MASTER,
      --  LIN Slave
      LIN_SLAVE,
      --  SPI Master
      SPI_MASTER,
      --  SPI Slave
      SPI_SLAVE)
     with Size => 4;
   for MR_USART_MODE_Field use
     (NORMAL => 0,
      RS485 => 1,
      HW_HANDSHAKING => 2,
      IS07816_T_0 => 4,
      IS07816_T_1 => 6,
      IRDA => 8,
      LIN_MASTER => 10,
      LIN_SLAVE => 11,
      SPI_MASTER => 14,
      SPI_SLAVE => 15);

   --  Clock Selection
   type MR_USCLKS_Field is
     (--  Master Clock MCK is selected
      MCK,
      --  Internal Clock Divided MCK/DIV (DIV=8) is selected
      DIV,
      --  Serial Clock SLK is selected
      SCK)
     with Size => 2;
   for MR_USCLKS_Field use
     (MCK => 0,
      DIV => 1,
      SCK => 3);

   --  Character Length.
   type MR_CHRL_Field is
     (--  Character length is 5 bits
      Val_5_BIT,
      --  Character length is 6 bits
      Val_6_BIT,
      --  Character length is 7 bits
      Val_7_BIT,
      --  Character length is 8 bits
      Val_8_BIT)
     with Size => 2;
   for MR_CHRL_Field use
     (Val_5_BIT => 0,
      Val_6_BIT => 1,
      Val_7_BIT => 2,
      Val_8_BIT => 3);

   subtype USART0_MR_SYNC_Field is ATSAM3X8E.Bit;

   --  Parity Type
   type MR_PAR_Field is
     (--  Even parity
      EVEN,
      --  Odd parity
      ODD,
      --  Parity forced to 0 (Space)
      SPACE,
      --  Parity forced to 1 (Mark)
      MARK,
      --  No parity
      NO,
      --  Multidrop mode
      MULTIDROP)
     with Size => 3;
   for MR_PAR_Field use
     (EVEN => 0,
      ODD => 1,
      SPACE => 2,
      MARK => 3,
      NO => 4,
      MULTIDROP => 6);

   --  Number of Stop Bits
   type MR_NBSTOP_Field is
     (--  1 stop bit
      Val_1_BIT,
      --  1.5 stop bit (SYNC = 0) or reserved (SYNC = 1)
      Val_1_5_BIT,
      --  2 stop bits
      Val_2_BIT)
     with Size => 2;
   for MR_NBSTOP_Field use
     (Val_1_BIT => 0,
      Val_1_5_BIT => 1,
      Val_2_BIT => 2);

   --  Channel Mode
   type MR_CHMODE_Field is
     (--  Normal Mode
      NORMAL,
      --  Automatic Echo. Receiver input is connected to the TXD pin.
      AUTOMATIC,
      --  Local Loopback. Transmitter output is connected to the Receiver Input.
      LOCAL_LOOPBACK,
      --  Remote Loopback. RXD pin is internally connected to the TXD pin.
      REMOTE_LOOPBACK)
     with Size => 2;
   for MR_CHMODE_Field use
     (NORMAL => 0,
      AUTOMATIC => 1,
      LOCAL_LOOPBACK => 2,
      REMOTE_LOOPBACK => 3);

   subtype USART0_MR_MSBF_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_MODE9_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_CLKO_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_OVER_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_INACK_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_DSNACK_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_VAR_SYNC_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_INVDATA_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_MAX_ITERATION_Field is ATSAM3X8E.UInt3;
   subtype USART0_MR_FILTER_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_MAN_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_MODSYNC_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_ONEBIT_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type USART0_MR_Register is record
      --  USART Mode of Operation
      USART_MODE     : MR_USART_MODE_Field := ATSAM3X8E.USART.NORMAL;
      --  Clock Selection
      USCLKS         : MR_USCLKS_Field := ATSAM3X8E.USART.MCK;
      --  Character Length.
      CHRL           : MR_CHRL_Field := ATSAM3X8E.USART.Val_5_BIT;
      --  Synchronous Mode Select
      SYNC           : USART0_MR_SYNC_Field := 16#0#;
      --  Parity Type
      PAR            : MR_PAR_Field := ATSAM3X8E.USART.EVEN;
      --  Number of Stop Bits
      NBSTOP         : MR_NBSTOP_Field := ATSAM3X8E.USART.Val_1_BIT;
      --  Channel Mode
      CHMODE         : MR_CHMODE_Field := ATSAM3X8E.USART.NORMAL;
      --  Bit Order
      MSBF           : USART0_MR_MSBF_Field := 16#0#;
      --  9-bit Character Length
      MODE9          : USART0_MR_MODE9_Field := 16#0#;
      --  Clock Output Select
      CLKO           : USART0_MR_CLKO_Field := 16#0#;
      --  Oversampling Mode
      OVER           : USART0_MR_OVER_Field := 16#0#;
      --  Inhibit Non Acknowledge
      INACK          : USART0_MR_INACK_Field := 16#0#;
      --  Disable Successive NACK
      DSNACK         : USART0_MR_DSNACK_Field := 16#0#;
      --  Variable Synchronization of Command/Data Sync Start Frame Delimiter
      VAR_SYNC       : USART0_MR_VAR_SYNC_Field := 16#0#;
      --  INverted Data
      INVDATA        : USART0_MR_INVDATA_Field := 16#0#;
      --  Maximum Number of Automatic Iteration
      MAX_ITERATION  : USART0_MR_MAX_ITERATION_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : ATSAM3X8E.Bit := 16#0#;
      --  Infrared Receive Line Filter
      FILTER         : USART0_MR_FILTER_Field := 16#0#;
      --  Manchester Encoder/Decoder Enable
      MAN            : USART0_MR_MAN_Field := 16#0#;
      --  Manchester Synchronization Mode
      MODSYNC        : USART0_MR_MODSYNC_Field := 16#0#;
      --  Start Frame Delimiter Selector
      ONEBIT         : USART0_MR_ONEBIT_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_MR_Register use record
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

   --  USART Mode of Operation
   type MR_SPI_MODE_USART_MODE_Field is
     (--  Reset value for the field
      MR_SPI_MODE_USART_MODE_Field_Reset,
      --  SPI Master
      SPI_MASTER,
      --  SPI Slave
      SPI_SLAVE)
     with Size => 4;
   for MR_SPI_MODE_USART_MODE_Field use
     (MR_SPI_MODE_USART_MODE_Field_Reset => 0,
      SPI_MASTER => 14,
      SPI_SLAVE => 15);

   --  Clock Selection
   type MR_SPI_MODE_USCLKS_Field is
     (--  Master Clock MCK is selected
      MCK,
      --  Internal Clock Divided MCK/DIV (DIV=8) is selected
      DIV,
      --  Serial Clock SLK is selected
      SCK)
     with Size => 2;
   for MR_SPI_MODE_USCLKS_Field use
     (MCK => 0,
      DIV => 1,
      SCK => 3);

   --  Character Length.
   type MR_SPI_MODE_CHRL_Field is
     (--  Reset value for the field
      MR_SPI_MODE_CHRL_Field_Reset,
      --  Character length is 8 bits
      Val_8_BIT)
     with Size => 2;
   for MR_SPI_MODE_CHRL_Field use
     (MR_SPI_MODE_CHRL_Field_Reset => 0,
      Val_8_BIT => 3);

   subtype USART0_MR_SPI_MODE_CPHA_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_SPI_MODE_CPOL_Field is ATSAM3X8E.Bit;
   subtype USART0_MR_SPI_MODE_WRDBT_Field is ATSAM3X8E.Bit;

   --  Mode Register
   type USART0_MR_SPI_MODE_Register is record
      --  USART Mode of Operation
      USART_MODE     : MR_SPI_MODE_USART_MODE_Field :=
                        MR_SPI_MODE_USART_MODE_Field_Reset;
      --  Clock Selection
      USCLKS         : MR_SPI_MODE_USCLKS_Field := ATSAM3X8E.USART.MCK;
      --  Character Length.
      CHRL           : MR_SPI_MODE_CHRL_Field := MR_SPI_MODE_CHRL_Field_Reset;
      --  SPI Clock Phase
      CPHA           : USART0_MR_SPI_MODE_CPHA_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : ATSAM3X8E.UInt7 := 16#0#;
      --  SPI Clock Polarity
      CPOL           : USART0_MR_SPI_MODE_CPOL_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : ATSAM3X8E.UInt3 := 16#0#;
      --  Wait Read Data Before Transfer
      WRDBT          : USART0_MR_SPI_MODE_WRDBT_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : ATSAM3X8E.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_MR_SPI_MODE_Register use record
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

   subtype USART0_IER_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_RXBRK_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_ENDRX_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_ENDTX_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_ITER_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_NACK_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_CTSIC_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_MANE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type USART0_IER_Register is record
      --  Write-only. RXRDY Interrupt Enable
      RXRDY          : USART0_IER_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Enable
      TXRDY          : USART0_IER_TXRDY_Field := 16#0#;
      --  Write-only. Receiver Break Interrupt Enable
      RXBRK          : USART0_IER_RXBRK_Field := 16#0#;
      --  Write-only. End of Receive Transfer Interrupt Enable (available in
      --  all USART modes of operation)
      ENDRX          : USART0_IER_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Interrupt Enable (available in all USART
      --  modes of operation)
      ENDTX          : USART0_IER_ENDTX_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : USART0_IER_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Enable
      FRAME          : USART0_IER_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Enable
      PARE           : USART0_IER_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Enable
      TIMEOUT        : USART0_IER_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Enable
      TXEMPTY        : USART0_IER_TXEMPTY_Field := 16#0#;
      --  Write-only. Max number of Repetitions Reached Interrupt Enable
      ITER           : USART0_IER_ITER_Field := 16#0#;
      --  Write-only. Buffer Empty Interrupt Enable (available in all USART
      --  modes of operation)
      TXBUFE         : USART0_IER_TXBUFE_Field := 16#0#;
      --  Write-only. Buffer Full Interrupt Enable (available in all USART
      --  modes of operation)
      RXBUFF         : USART0_IER_RXBUFF_Field := 16#0#;
      --  Write-only. Non Acknowledge Interrupt Enable
      NACK           : USART0_IER_NACK_Field := 16#0#;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Clear to Send Input Change Interrupt Enable
      CTSIC          : USART0_IER_CTSIC_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Manchester Error Interrupt Enable
      MANE           : USART0_IER_MANE_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IER_Register use record
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

   subtype USART0_IER_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type USART0_IER_SPI_MODE_Register is record
      --  Write-only. RXRDY Interrupt Enable
      RXRDY          : USART0_IER_SPI_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Enable
      TXRDY          : USART0_IER_SPI_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : USART0_IER_SPI_MODE_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. TXEMPTY Interrupt Enable
      TXEMPTY        : USART0_IER_SPI_MODE_TXEMPTY_Field := 16#0#;
      --  Write-only. SPI Underrun Error Interrupt Enable
      UNRE           : USART0_IER_SPI_MODE_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IER_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype USART0_IER_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype USART0_IER_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Enable Register
   type USART0_IER_LIN_MODE_Register is record
      --  Write-only. RXRDY Interrupt Enable
      RXRDY          : USART0_IER_LIN_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Enable
      TXRDY          : USART0_IER_LIN_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : USART0_IER_LIN_MODE_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Enable
      FRAME          : USART0_IER_LIN_MODE_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Enable
      PARE           : USART0_IER_LIN_MODE_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Enable
      TIMEOUT        : USART0_IER_LIN_MODE_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Enable
      TXEMPTY        : USART0_IER_LIN_MODE_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. LIN Break Sent or LIN Break Received Interrupt Enable
      LINBK          : USART0_IER_LIN_MODE_LINBK_Field := 16#0#;
      --  Write-only. LIN Identifier Sent or LIN Identifier Received Interrupt
      --  Enable
      LINID          : USART0_IER_LIN_MODE_LINID_Field := 16#0#;
      --  Write-only. LIN Transfer Completed Interrupt Enable
      LINTC          : USART0_IER_LIN_MODE_LINTC_Field := 16#0#;
      --  unspecified
      Reserved_16_24 : ATSAM3X8E.UInt9 := 16#0#;
      --  Write-only. LIN Bus Error Interrupt Enable
      LINBE          : USART0_IER_LIN_MODE_LINBE_Field := 16#0#;
      --  Write-only. LIN Inconsistent Synch Field Error Interrupt Enable
      LINISFE        : USART0_IER_LIN_MODE_LINISFE_Field := 16#0#;
      --  Write-only. LIN Identifier Parity Interrupt Enable
      LINIPE         : USART0_IER_LIN_MODE_LINIPE_Field := 16#0#;
      --  Write-only. LIN Checksum Error Interrupt Enable
      LINCE          : USART0_IER_LIN_MODE_LINCE_Field := 16#0#;
      --  Write-only. LIN Slave Not Responding Error Interrupt Enable
      LINSNRE        : USART0_IER_LIN_MODE_LINSNRE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IER_LIN_MODE_Register use record
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

   subtype USART0_IDR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_RXBRK_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_ITER_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_NACK_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_CTSIC_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_MANE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type USART0_IDR_Register is record
      --  Write-only. RXRDY Interrupt Disable
      RXRDY          : USART0_IDR_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Disable
      TXRDY          : USART0_IDR_TXRDY_Field := 16#0#;
      --  Write-only. Receiver Break Interrupt Disable
      RXBRK          : USART0_IDR_RXBRK_Field := 16#0#;
      --  Write-only. End of Receive Transfer Interrupt Disable (available in
      --  all USART modes of operation)
      ENDRX          : USART0_IDR_ENDRX_Field := 16#0#;
      --  Write-only. End of Transmit Interrupt Disable (available in all USART
      --  modes of operation)
      ENDTX          : USART0_IDR_ENDTX_Field := 16#0#;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE           : USART0_IDR_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Disable
      FRAME          : USART0_IDR_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Disable
      PARE           : USART0_IDR_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Disable
      TIMEOUT        : USART0_IDR_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Disable
      TXEMPTY        : USART0_IDR_TXEMPTY_Field := 16#0#;
      --  Write-only. Max number of Repetitions Reached Interrupt Disable
      ITER           : USART0_IDR_ITER_Field := 16#0#;
      --  Write-only. Buffer Empty Interrupt Disable (available in all USART
      --  modes of operation)
      TXBUFE         : USART0_IDR_TXBUFE_Field := 16#0#;
      --  Write-only. Buffer Full Interrupt Disable (available in all USART
      --  modes of operation)
      RXBUFF         : USART0_IDR_RXBUFF_Field := 16#0#;
      --  Write-only. Non Acknowledge Interrupt Disable
      NACK           : USART0_IDR_NACK_Field := 16#0#;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5 := 16#0#;
      --  Write-only. Clear to Send Input Change Interrupt Disable
      CTSIC          : USART0_IDR_CTSIC_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Write-only. Manchester Error Interrupt Disable
      MANE           : USART0_IDR_MANE_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IDR_Register use record
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

   subtype USART0_IDR_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type USART0_IDR_SPI_MODE_Register is record
      --  Write-only. RXRDY Interrupt Disable
      RXRDY          : USART0_IDR_SPI_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Disable
      TXRDY          : USART0_IDR_SPI_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE           : USART0_IDR_SPI_MODE_OVRE_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. TXEMPTY Interrupt Disable
      TXEMPTY        : USART0_IDR_SPI_MODE_TXEMPTY_Field := 16#0#;
      --  Write-only. SPI Underrun Error Interrupt Disable
      UNRE           : USART0_IDR_SPI_MODE_UNRE_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IDR_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype USART0_IDR_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype USART0_IDR_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Disable Register
   type USART0_IDR_LIN_MODE_Register is record
      --  Write-only. RXRDY Interrupt Disable
      RXRDY          : USART0_IDR_LIN_MODE_RXRDY_Field := 16#0#;
      --  Write-only. TXRDY Interrupt Disable
      TXRDY          : USART0_IDR_LIN_MODE_TXRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE           : USART0_IDR_LIN_MODE_OVRE_Field := 16#0#;
      --  Write-only. Framing Error Interrupt Disable
      FRAME          : USART0_IDR_LIN_MODE_FRAME_Field := 16#0#;
      --  Write-only. Parity Error Interrupt Disable
      PARE           : USART0_IDR_LIN_MODE_PARE_Field := 16#0#;
      --  Write-only. Time-out Interrupt Disable
      TIMEOUT        : USART0_IDR_LIN_MODE_TIMEOUT_Field := 16#0#;
      --  Write-only. TXEMPTY Interrupt Disable
      TXEMPTY        : USART0_IDR_LIN_MODE_TXEMPTY_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3 := 16#0#;
      --  Write-only. LIN Break Sent or LIN Break Received Interrupt Disable
      LINBK          : USART0_IDR_LIN_MODE_LINBK_Field := 16#0#;
      --  Write-only. LIN Identifier Sent or LIN Identifier Received Interrupt
      --  Disable
      LINID          : USART0_IDR_LIN_MODE_LINID_Field := 16#0#;
      --  Write-only. LIN Transfer Completed Interrupt Disable
      LINTC          : USART0_IDR_LIN_MODE_LINTC_Field := 16#0#;
      --  unspecified
      Reserved_16_24 : ATSAM3X8E.UInt9 := 16#0#;
      --  Write-only. LIN Bus Error Interrupt Disable
      LINBE          : USART0_IDR_LIN_MODE_LINBE_Field := 16#0#;
      --  Write-only. LIN Inconsistent Synch Field Error Interrupt Disable
      LINISFE        : USART0_IDR_LIN_MODE_LINISFE_Field := 16#0#;
      --  Write-only. LIN Identifier Parity Interrupt Disable
      LINIPE         : USART0_IDR_LIN_MODE_LINIPE_Field := 16#0#;
      --  Write-only. LIN Checksum Error Interrupt Disable
      LINCE          : USART0_IDR_LIN_MODE_LINCE_Field := 16#0#;
      --  Write-only. LIN Slave Not Responding Error Interrupt Disable
      LINSNRE        : USART0_IDR_LIN_MODE_LINSNRE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IDR_LIN_MODE_Register use record
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

   subtype USART0_IMR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_RXBRK_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_ITER_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_NACK_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_CTSIC_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_MANE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type USART0_IMR_Register is record
      --  Read-only. RXRDY Interrupt Mask
      RXRDY          : USART0_IMR_RXRDY_Field;
      --  Read-only. TXRDY Interrupt Mask
      TXRDY          : USART0_IMR_TXRDY_Field;
      --  Read-only. Receiver Break Interrupt Mask
      RXBRK          : USART0_IMR_RXBRK_Field;
      --  Read-only. End of Receive Transfer Interrupt Mask (available in all
      --  USART modes of operation)
      ENDRX          : USART0_IMR_ENDRX_Field;
      --  Read-only. End of Transmit Interrupt Mask (available in all USART
      --  modes of operation)
      ENDTX          : USART0_IMR_ENDTX_Field;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : USART0_IMR_OVRE_Field;
      --  Read-only. Framing Error Interrupt Mask
      FRAME          : USART0_IMR_FRAME_Field;
      --  Read-only. Parity Error Interrupt Mask
      PARE           : USART0_IMR_PARE_Field;
      --  Read-only. Time-out Interrupt Mask
      TIMEOUT        : USART0_IMR_TIMEOUT_Field;
      --  Read-only. TXEMPTY Interrupt Mask
      TXEMPTY        : USART0_IMR_TXEMPTY_Field;
      --  Read-only. Max number of Repetitions Reached Interrupt Mask
      ITER           : USART0_IMR_ITER_Field;
      --  Read-only. Buffer Empty Interrupt Mask (available in all USART modes
      --  of operation)
      TXBUFE         : USART0_IMR_TXBUFE_Field;
      --  Read-only. Buffer Full Interrupt Mask (available in all USART modes
      --  of operation)
      RXBUFF         : USART0_IMR_RXBUFF_Field;
      --  Read-only. Non Acknowledge Interrupt Mask
      NACK           : USART0_IMR_NACK_Field;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5;
      --  Read-only. Clear to Send Input Change Interrupt Mask
      CTSIC          : USART0_IMR_CTSIC_Field;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4;
      --  Read-only. Manchester Error Interrupt Mask
      MANE           : USART0_IMR_MANE_Field;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IMR_Register use record
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

   subtype USART0_IMR_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type USART0_IMR_SPI_MODE_Register is record
      --  Read-only. RXRDY Interrupt Mask
      RXRDY          : USART0_IMR_SPI_MODE_RXRDY_Field;
      --  Read-only. TXRDY Interrupt Mask
      TXRDY          : USART0_IMR_SPI_MODE_TXRDY_Field;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : USART0_IMR_SPI_MODE_OVRE_Field;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3;
      --  Read-only. TXEMPTY Interrupt Mask
      TXEMPTY        : USART0_IMR_SPI_MODE_TXEMPTY_Field;
      --  Read-only. SPI Underrun Error Interrupt Mask
      UNRE           : USART0_IMR_SPI_MODE_UNRE_Field;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IMR_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype USART0_IMR_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype USART0_IMR_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Interrupt Mask Register
   type USART0_IMR_LIN_MODE_Register is record
      --  Read-only. RXRDY Interrupt Mask
      RXRDY          : USART0_IMR_LIN_MODE_RXRDY_Field;
      --  Read-only. TXRDY Interrupt Mask
      TXRDY          : USART0_IMR_LIN_MODE_TXRDY_Field;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE           : USART0_IMR_LIN_MODE_OVRE_Field;
      --  Read-only. Framing Error Interrupt Mask
      FRAME          : USART0_IMR_LIN_MODE_FRAME_Field;
      --  Read-only. Parity Error Interrupt Mask
      PARE           : USART0_IMR_LIN_MODE_PARE_Field;
      --  Read-only. Time-out Interrupt Mask
      TIMEOUT        : USART0_IMR_LIN_MODE_TIMEOUT_Field;
      --  Read-only. TXEMPTY Interrupt Mask
      TXEMPTY        : USART0_IMR_LIN_MODE_TXEMPTY_Field;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3;
      --  Read-only. LIN Break Sent or LIN Break Received Interrupt Mask
      LINBK          : USART0_IMR_LIN_MODE_LINBK_Field;
      --  Read-only. LIN Identifier Sent or LIN Identifier Received Interrupt
      --  Mask
      LINID          : USART0_IMR_LIN_MODE_LINID_Field;
      --  Read-only. LIN Transfer Completed Interrupt Mask
      LINTC          : USART0_IMR_LIN_MODE_LINTC_Field;
      --  unspecified
      Reserved_16_24 : ATSAM3X8E.UInt9;
      --  Read-only. LIN Bus Error Interrupt Mask
      LINBE          : USART0_IMR_LIN_MODE_LINBE_Field;
      --  Read-only. LIN Inconsistent Synch Field Error Interrupt Mask
      LINISFE        : USART0_IMR_LIN_MODE_LINISFE_Field;
      --  Read-only. LIN Identifier Parity Interrupt Mask
      LINIPE         : USART0_IMR_LIN_MODE_LINIPE_Field;
      --  Read-only. LIN Checksum Error Interrupt Mask
      LINCE          : USART0_IMR_LIN_MODE_LINCE_Field;
      --  Read-only. LIN Slave Not Responding Error Interrupt Mask
      LINSNRE        : USART0_IMR_LIN_MODE_LINSNRE_Field;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IMR_LIN_MODE_Register use record
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

   subtype USART0_CSR_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_RXBRK_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_ENDRX_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_ENDTX_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_ITER_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_TXBUFE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_RXBUFF_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_NACK_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_CTSIC_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_CTS_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_MANERR_Field is ATSAM3X8E.Bit;

   --  Channel Status Register
   type USART0_CSR_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : USART0_CSR_RXRDY_Field;
      --  Read-only. Transmitter Ready
      TXRDY          : USART0_CSR_TXRDY_Field;
      --  Read-only. Break Received/End of Break
      RXBRK          : USART0_CSR_RXBRK_Field;
      --  Read-only. End of Receiver Transfer
      ENDRX          : USART0_CSR_ENDRX_Field;
      --  Read-only. End of Transmitter Transfer
      ENDTX          : USART0_CSR_ENDTX_Field;
      --  Read-only. Overrun Error
      OVRE           : USART0_CSR_OVRE_Field;
      --  Read-only. Framing Error
      FRAME          : USART0_CSR_FRAME_Field;
      --  Read-only. Parity Error
      PARE           : USART0_CSR_PARE_Field;
      --  Read-only. Receiver Time-out
      TIMEOUT        : USART0_CSR_TIMEOUT_Field;
      --  Read-only. Transmitter Empty
      TXEMPTY        : USART0_CSR_TXEMPTY_Field;
      --  Read-only. Max number of Repetitions Reached
      ITER           : USART0_CSR_ITER_Field;
      --  Read-only. Transmission Buffer Empty
      TXBUFE         : USART0_CSR_TXBUFE_Field;
      --  Read-only. Reception Buffer Full
      RXBUFF         : USART0_CSR_RXBUFF_Field;
      --  Read-only. Non Acknowledge Interrupt
      NACK           : USART0_CSR_NACK_Field;
      --  unspecified
      Reserved_14_18 : ATSAM3X8E.UInt5;
      --  Read-only. Clear to Send Input Change Flag
      CTSIC          : USART0_CSR_CTSIC_Field;
      --  unspecified
      Reserved_20_22 : ATSAM3X8E.UInt3;
      --  Read-only. Image of CTS Input
      CTS            : USART0_CSR_CTS_Field;
      --  Read-only. Manchester Error
      MANERR         : USART0_CSR_MANERR_Field;
      --  unspecified
      Reserved_25_31 : ATSAM3X8E.UInt7;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_CSR_Register use record
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

   subtype USART0_CSR_SPI_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_SPI_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_SPI_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_SPI_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_SPI_MODE_UNRE_Field is ATSAM3X8E.Bit;

   --  Channel Status Register
   type USART0_CSR_SPI_MODE_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : USART0_CSR_SPI_MODE_RXRDY_Field;
      --  Read-only. Transmitter Ready
      TXRDY          : USART0_CSR_SPI_MODE_TXRDY_Field;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error
      OVRE           : USART0_CSR_SPI_MODE_OVRE_Field;
      --  unspecified
      Reserved_6_8   : ATSAM3X8E.UInt3;
      --  Read-only. Transmitter Empty
      TXEMPTY        : USART0_CSR_SPI_MODE_TXEMPTY_Field;
      --  Read-only. Underrun Error
      UNRE           : USART0_CSR_SPI_MODE_UNRE_Field;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_CSR_SPI_MODE_Register use record
      RXRDY          at 0 range 0 .. 0;
      TXRDY          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      OVRE           at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      TXEMPTY        at 0 range 9 .. 9;
      UNRE           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype USART0_CSR_LIN_MODE_RXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_TXRDY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_OVRE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_FRAME_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_PARE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_TIMEOUT_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_TXEMPTY_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINBK_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINID_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINTC_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINBLS_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINBE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINISFE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINIPE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINCE_Field is ATSAM3X8E.Bit;
   subtype USART0_CSR_LIN_MODE_LINSNRE_Field is ATSAM3X8E.Bit;

   --  Channel Status Register
   type USART0_CSR_LIN_MODE_Register is record
      --  Read-only. Receiver Ready
      RXRDY          : USART0_CSR_LIN_MODE_RXRDY_Field;
      --  Read-only. Transmitter Ready
      TXRDY          : USART0_CSR_LIN_MODE_TXRDY_Field;
      --  unspecified
      Reserved_2_4   : ATSAM3X8E.UInt3;
      --  Read-only. Overrun Error
      OVRE           : USART0_CSR_LIN_MODE_OVRE_Field;
      --  Read-only. Framing Error
      FRAME          : USART0_CSR_LIN_MODE_FRAME_Field;
      --  Read-only. Parity Error
      PARE           : USART0_CSR_LIN_MODE_PARE_Field;
      --  Read-only. Receiver Time-out
      TIMEOUT        : USART0_CSR_LIN_MODE_TIMEOUT_Field;
      --  Read-only. Transmitter Empty
      TXEMPTY        : USART0_CSR_LIN_MODE_TXEMPTY_Field;
      --  unspecified
      Reserved_10_12 : ATSAM3X8E.UInt3;
      --  Read-only. LIN Break Sent or LIN Break Received
      LINBK          : USART0_CSR_LIN_MODE_LINBK_Field;
      --  Read-only. LIN Identifier Sent or LIN Identifier Received
      LINID          : USART0_CSR_LIN_MODE_LINID_Field;
      --  Read-only. LIN Transfer Completed
      LINTC          : USART0_CSR_LIN_MODE_LINTC_Field;
      --  unspecified
      Reserved_16_22 : ATSAM3X8E.UInt7;
      --  Read-only. LIN Bus Line Status
      LINBLS         : USART0_CSR_LIN_MODE_LINBLS_Field;
      --  unspecified
      Reserved_24_24 : ATSAM3X8E.Bit;
      --  Read-only. LIN Bit Error
      LINBE          : USART0_CSR_LIN_MODE_LINBE_Field;
      --  Read-only. LIN Inconsistent Synch Field Error
      LINISFE        : USART0_CSR_LIN_MODE_LINISFE_Field;
      --  Read-only. LIN Identifier Parity Error
      LINIPE         : USART0_CSR_LIN_MODE_LINIPE_Field;
      --  Read-only. LIN Checksum Error
      LINCE          : USART0_CSR_LIN_MODE_LINCE_Field;
      --  Read-only. LIN Slave Not Responding Error
      LINSNRE        : USART0_CSR_LIN_MODE_LINSNRE_Field;
      --  unspecified
      Reserved_30_31 : ATSAM3X8E.UInt2;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_CSR_LIN_MODE_Register use record
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

   subtype USART0_RHR_RXCHR_Field is ATSAM3X8E.UInt9;
   subtype USART0_RHR_RXSYNH_Field is ATSAM3X8E.Bit;

   --  Receiver Holding Register
   type USART0_RHR_Register is record
      --  Read-only. Received Character
      RXCHR          : USART0_RHR_RXCHR_Field;
      --  unspecified
      Reserved_9_14  : ATSAM3X8E.UInt6;
      --  Read-only. Received Sync
      RXSYNH         : USART0_RHR_RXSYNH_Field;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_RHR_Register use record
      RXCHR          at 0 range 0 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      RXSYNH         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USART0_THR_TXCHR_Field is ATSAM3X8E.UInt9;
   subtype USART0_THR_TXSYNH_Field is ATSAM3X8E.Bit;

   --  Transmitter Holding Register
   type USART0_THR_Register is record
      --  Write-only. Character to be Transmitted
      TXCHR          : USART0_THR_TXCHR_Field := 16#0#;
      --  unspecified
      Reserved_9_14  : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Sync Field to be transmitted
      TXSYNH         : USART0_THR_TXSYNH_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_THR_Register use record
      TXCHR          at 0 range 0 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      TXSYNH         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USART0_BRGR_CD_Field is ATSAM3X8E.UInt16;
   subtype USART0_BRGR_FP_Field is ATSAM3X8E.UInt3;

   --  Baud Rate Generator Register
   type USART0_BRGR_Register is record
      --  Clock Divider
      CD             : USART0_BRGR_CD_Field := 16#0#;
      --  Fractional Part
      FP             : USART0_BRGR_FP_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : ATSAM3X8E.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_BRGR_Register use record
      CD             at 0 range 0 .. 15;
      FP             at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype USART0_RTOR_TO_Field is ATSAM3X8E.UInt17;

   --  Receiver Time-out Register
   type USART0_RTOR_Register is record
      --  Time-out Value
      TO             : USART0_RTOR_TO_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_RTOR_Register use record
      TO             at 0 range 0 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype USART0_TTGR_TG_Field is ATSAM3X8E.Byte;

   --  Transmitter Timeguard Register
   type USART0_TTGR_Register is record
      --  Timeguard Value
      TG            : USART0_TTGR_TG_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_TTGR_Register use record
      TG            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USART0_FIDI_FI_DI_RATIO_Field is ATSAM3X8E.UInt11;

   --  FI DI Ratio Register
   type USART0_FIDI_Register is record
      --  FI Over DI Ratio Value
      FI_DI_RATIO    : USART0_FIDI_FI_DI_RATIO_Field := 16#174#;
      --  unspecified
      Reserved_11_31 : ATSAM3X8E.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_FIDI_Register use record
      FI_DI_RATIO    at 0 range 0 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype USART0_NER_NB_ERRORS_Field is ATSAM3X8E.Byte;

   --  Number of Errors Register
   type USART0_NER_Register is record
      --  Read-only. Number of Errors
      NB_ERRORS     : USART0_NER_NB_ERRORS_Field;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_NER_Register use record
      NB_ERRORS     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USART0_IF_IRDA_FILTER_Field is ATSAM3X8E.Byte;

   --  IrDA Filter Register
   type USART0_IF_Register is record
      --  IrDA Filter
      IRDA_FILTER   : USART0_IF_IRDA_FILTER_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_IF_Register use record
      IRDA_FILTER   at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USART0_MAN_TX_PL_Field is ATSAM3X8E.UInt4;

   --  Transmitter Preamble Pattern
   type MAN_TX_PP_Field is
     (--  The preamble is composed of '1's
      ALL_ONE,
      --  The preamble is composed of '0's
      ALL_ZERO,
      --  The preamble is composed of '01's
      ZERO_ONE,
      --  The preamble is composed of '10's
      ONE_ZERO)
     with Size => 2;
   for MAN_TX_PP_Field use
     (ALL_ONE => 0,
      ALL_ZERO => 1,
      ZERO_ONE => 2,
      ONE_ZERO => 3);

   subtype USART0_MAN_TX_MPOL_Field is ATSAM3X8E.Bit;
   subtype USART0_MAN_RX_PL_Field is ATSAM3X8E.UInt4;

   --  Receiver Preamble Pattern detected
   type MAN_RX_PP_Field is
     (--  The preamble is composed of '1's
      ALL_ONE,
      --  The preamble is composed of '0's
      ALL_ZERO,
      --  The preamble is composed of '01's
      ZERO_ONE,
      --  The preamble is composed of '10's
      ONE_ZERO)
     with Size => 2;
   for MAN_RX_PP_Field use
     (ALL_ONE => 0,
      ALL_ZERO => 1,
      ZERO_ONE => 2,
      ONE_ZERO => 3);

   subtype USART0_MAN_RX_MPOL_Field is ATSAM3X8E.Bit;
   subtype USART0_MAN_ONE_Field is ATSAM3X8E.Bit;
   subtype USART0_MAN_DRIFT_Field is ATSAM3X8E.Bit;

   --  Manchester Encoder Decoder Register
   type USART0_MAN_Register is record
      --  Transmitter Preamble Length
      TX_PL          : USART0_MAN_TX_PL_Field := 16#4#;
      --  unspecified
      Reserved_4_7   : ATSAM3X8E.UInt4 := 16#0#;
      --  Transmitter Preamble Pattern
      TX_PP          : MAN_TX_PP_Field := ATSAM3X8E.USART.ALL_ONE;
      --  unspecified
      Reserved_10_11 : ATSAM3X8E.UInt2 := 16#0#;
      --  Transmitter Manchester Polarity
      TX_MPOL        : USART0_MAN_TX_MPOL_Field := 16#1#;
      --  unspecified
      Reserved_13_15 : ATSAM3X8E.UInt3 := 16#0#;
      --  Receiver Preamble Length
      RX_PL          : USART0_MAN_RX_PL_Field := 16#1#;
      --  unspecified
      Reserved_20_23 : ATSAM3X8E.UInt4 := 16#0#;
      --  Receiver Preamble Pattern detected
      RX_PP          : MAN_RX_PP_Field := ATSAM3X8E.USART.ALL_ONE;
      --  unspecified
      Reserved_26_27 : ATSAM3X8E.UInt2 := 16#0#;
      --  Receiver Manchester Polarity
      RX_MPOL        : USART0_MAN_RX_MPOL_Field := 16#1#;
      --  Must Be Set to 1
      ONE            : USART0_MAN_ONE_Field := 16#1#;
      --  Drift compensation
      DRIFT          : USART0_MAN_DRIFT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : ATSAM3X8E.Bit := 16#1#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_MAN_Register use record
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

   --  LIN Node Action
   type LINMR_NACT_Field is
     (--  The USART transmits the response.
      PUBLISH,
      --  The USART receives the response.
      SUBSCRIBE,
      --  The USART does not transmit and does not receive the response.
      IGNORE)
     with Size => 2;
   for LINMR_NACT_Field use
     (PUBLISH => 0,
      SUBSCRIBE => 1,
      IGNORE => 2);

   subtype USART0_LINMR_PARDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_LINMR_CHKDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_LINMR_CHKTYP_Field is ATSAM3X8E.Bit;
   subtype USART0_LINMR_DLM_Field is ATSAM3X8E.Bit;
   subtype USART0_LINMR_FSDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_LINMR_WKUPTYP_Field is ATSAM3X8E.Bit;
   subtype USART0_LINMR_DLC_Field is ATSAM3X8E.Byte;
   subtype USART0_LINMR_PDCM_Field is ATSAM3X8E.Bit;

   --  LIN Mode Register
   type USART0_LINMR_Register is record
      --  LIN Node Action
      NACT           : LINMR_NACT_Field := ATSAM3X8E.USART.PUBLISH;
      --  Parity Disable
      PARDIS         : USART0_LINMR_PARDIS_Field := 16#0#;
      --  Checksum Disable
      CHKDIS         : USART0_LINMR_CHKDIS_Field := 16#0#;
      --  Checksum Type
      CHKTYP         : USART0_LINMR_CHKTYP_Field := 16#0#;
      --  Data Length Mode
      DLM            : USART0_LINMR_DLM_Field := 16#0#;
      --  Frame Slot Mode Disable
      FSDIS          : USART0_LINMR_FSDIS_Field := 16#0#;
      --  Wakeup Signal Type
      WKUPTYP        : USART0_LINMR_WKUPTYP_Field := 16#0#;
      --  Data Length Control
      DLC            : USART0_LINMR_DLC_Field := 16#0#;
      --  PDC Mode
      PDCM           : USART0_LINMR_PDCM_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : ATSAM3X8E.UInt15 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_LINMR_Register use record
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

   subtype USART0_LINIR_IDCHR_Field is ATSAM3X8E.Byte;

   --  LIN Identifier Register
   type USART0_LINIR_Register is record
      --  Identifier Character
      IDCHR         : USART0_LINIR_IDCHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : ATSAM3X8E.UInt24 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_LINIR_Register use record
      IDCHR         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USART0_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype USART0_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type USART0_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : USART0_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : USART0_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype USART0_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype USART0_WPSR_WPVSRC_Field is ATSAM3X8E.UInt16;

   --  Write Protect Status Register
   type USART0_WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : USART0_WPSR_WPVS_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : USART0_WPSR_WPVSRC_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype USART0_RCR_RXCTR_Field is ATSAM3X8E.UInt16;

   --  Receive Counter Register
   type USART0_RCR_Register is record
      --  Receive Counter Register
      RXCTR          : USART0_RCR_RXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_RCR_Register use record
      RXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USART0_TCR_TXCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Counter Register
   type USART0_TCR_Register is record
      --  Transmit Counter Register
      TXCTR          : USART0_TCR_TXCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_TCR_Register use record
      TXCTR          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USART0_RNCR_RXNCTR_Field is ATSAM3X8E.UInt16;

   --  Receive Next Counter Register
   type USART0_RNCR_Register is record
      --  Receive Next Counter
      RXNCTR         : USART0_RNCR_RXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_RNCR_Register use record
      RXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USART0_TNCR_TXNCTR_Field is ATSAM3X8E.UInt16;

   --  Transmit Next Counter Register
   type USART0_TNCR_Register is record
      --  Transmit Counter Next
      TXNCTR         : USART0_TNCR_TXNCTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : ATSAM3X8E.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_TNCR_Register use record
      TXNCTR         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USART0_PTCR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype USART0_PTCR_RXTDIS_Field is ATSAM3X8E.Bit;
   subtype USART0_PTCR_TXTEN_Field is ATSAM3X8E.Bit;
   subtype USART0_PTCR_TXTDIS_Field is ATSAM3X8E.Bit;

   --  Transfer Control Register
   type USART0_PTCR_Register is record
      --  Write-only. Receiver Transfer Enable
      RXTEN          : USART0_PTCR_RXTEN_Field := 16#0#;
      --  Write-only. Receiver Transfer Disable
      RXTDIS         : USART0_PTCR_RXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : ATSAM3X8E.UInt6 := 16#0#;
      --  Write-only. Transmitter Transfer Enable
      TXTEN          : USART0_PTCR_TXTEN_Field := 16#0#;
      --  Write-only. Transmitter Transfer Disable
      TXTDIS         : USART0_PTCR_TXTDIS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : ATSAM3X8E.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_PTCR_Register use record
      RXTEN          at 0 range 0 .. 0;
      RXTDIS         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      TXTEN          at 0 range 8 .. 8;
      TXTDIS         at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype USART0_PTSR_RXTEN_Field is ATSAM3X8E.Bit;
   subtype USART0_PTSR_TXTEN_Field is ATSAM3X8E.Bit;

   --  Transfer Status Register
   type USART0_PTSR_Register is record
      --  Read-only. Receiver Transfer Enable
      RXTEN         : USART0_PTSR_RXTEN_Field;
      --  unspecified
      Reserved_1_7  : ATSAM3X8E.UInt7;
      --  Read-only. Transmitter Transfer Enable
      TXTEN         : USART0_PTSR_TXTEN_Field;
      --  unspecified
      Reserved_9_31 : ATSAM3X8E.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for USART0_PTSR_Register use record
      RXTEN         at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      TXTEN         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type USART0_Disc is
     (Default,
      SPI_MODE,
      LIN_MODE);

   --  Universal Synchronous Asynchronous Receiver Transmitter 0
   type USART_Peripheral
     (Discriminent : USART0_Disc := Default)
   is record
      --  Receiver Holding Register
      RHR          : aliased USART0_RHR_Register;
      pragma Volatile_Full_Access (RHR);
      --  Transmitter Holding Register
      THR          : aliased USART0_THR_Register;
      pragma Volatile_Full_Access (THR);
      --  Baud Rate Generator Register
      BRGR         : aliased USART0_BRGR_Register;
      pragma Volatile_Full_Access (BRGR);
      --  Receiver Time-out Register
      RTOR         : aliased USART0_RTOR_Register;
      pragma Volatile_Full_Access (RTOR);
      --  Transmitter Timeguard Register
      TTGR         : aliased USART0_TTGR_Register;
      pragma Volatile_Full_Access (TTGR);
      --  FI DI Ratio Register
      FIDI         : aliased USART0_FIDI_Register;
      pragma Volatile_Full_Access (FIDI);
      --  Number of Errors Register
      NER          : aliased USART0_NER_Register;
      pragma Volatile_Full_Access (NER);
      --  IrDA Filter Register
      IF_k         : aliased USART0_IF_Register;
      pragma Volatile_Full_Access (IF_k);
      --  Manchester Encoder Decoder Register
      MAN          : aliased USART0_MAN_Register;
      pragma Volatile_Full_Access (MAN);
      --  LIN Mode Register
      LINMR        : aliased USART0_LINMR_Register;
      pragma Volatile_Full_Access (LINMR);
      --  LIN Identifier Register
      LINIR        : aliased USART0_LINIR_Register;
      pragma Volatile_Full_Access (LINIR);
      --  Write Protect Mode Register
      WPMR         : aliased USART0_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  Write Protect Status Register
      WPSR         : aliased USART0_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
      --  Receive Pointer Register
      RPR          : aliased ATSAM3X8E.UInt32;
      --  Receive Counter Register
      RCR          : aliased USART0_RCR_Register;
      pragma Volatile_Full_Access (RCR);
      --  Transmit Pointer Register
      TPR          : aliased ATSAM3X8E.UInt32;
      --  Transmit Counter Register
      TCR          : aliased USART0_TCR_Register;
      pragma Volatile_Full_Access (TCR);
      --  Receive Next Pointer Register
      RNPR         : aliased ATSAM3X8E.UInt32;
      --  Receive Next Counter Register
      RNCR         : aliased USART0_RNCR_Register;
      pragma Volatile_Full_Access (RNCR);
      --  Transmit Next Pointer Register
      TNPR         : aliased ATSAM3X8E.UInt32;
      --  Transmit Next Counter Register
      TNCR         : aliased USART0_TNCR_Register;
      pragma Volatile_Full_Access (TNCR);
      --  Transfer Control Register
      PTCR         : aliased USART0_PTCR_Register;
      pragma Volatile_Full_Access (PTCR);
      --  Transfer Status Register
      PTSR         : aliased USART0_PTSR_Register;
      pragma Volatile_Full_Access (PTSR);
      case Discriminent is
         when Default =>
            --  Control Register
            CR : aliased USART0_CR_Register;
            pragma Volatile_Full_Access (CR);
            --  Mode Register
            MR : aliased USART0_MR_Register;
            pragma Volatile_Full_Access (MR);
            --  Interrupt Enable Register
            IER : aliased USART0_IER_Register;
            pragma Volatile_Full_Access (IER);
            --  Interrupt Disable Register
            IDR : aliased USART0_IDR_Register;
            pragma Volatile_Full_Access (IDR);
            --  Interrupt Mask Register
            IMR : aliased USART0_IMR_Register;
            pragma Volatile_Full_Access (IMR);
            --  Channel Status Register
            CSR : aliased USART0_CSR_Register;
            pragma Volatile_Full_Access (CSR);
         when SPI_MODE =>
            --  Control Register
            CR_SPI_MODE : aliased USART0_CR_SPI_MODE_Register;
            pragma Volatile_Full_Access (CR_SPI_MODE);
            --  Mode Register
            MR_SPI_MODE : aliased USART0_MR_SPI_MODE_Register;
            pragma Volatile_Full_Access (MR_SPI_MODE);
            --  Interrupt Enable Register
            IER_SPI_MODE : aliased USART0_IER_SPI_MODE_Register;
            pragma Volatile_Full_Access (IER_SPI_MODE);
            --  Interrupt Disable Register
            IDR_SPI_MODE : aliased USART0_IDR_SPI_MODE_Register;
            pragma Volatile_Full_Access (IDR_SPI_MODE);
            --  Interrupt Mask Register
            IMR_SPI_MODE : aliased USART0_IMR_SPI_MODE_Register;
            pragma Volatile_Full_Access (IMR_SPI_MODE);
            --  Channel Status Register
            CSR_SPI_MODE : aliased USART0_CSR_SPI_MODE_Register;
            pragma Volatile_Full_Access (CSR_SPI_MODE);
         when LIN_MODE =>
            --  Interrupt Enable Register
            IER_LIN_MODE : aliased USART0_IER_LIN_MODE_Register;
            pragma Volatile_Full_Access (IER_LIN_MODE);
            --  Interrupt Disable Register
            IDR_LIN_MODE : aliased USART0_IDR_LIN_MODE_Register;
            pragma Volatile_Full_Access (IDR_LIN_MODE);
            --  Interrupt Mask Register
            IMR_LIN_MODE : aliased USART0_IMR_LIN_MODE_Register;
            pragma Volatile_Full_Access (IMR_LIN_MODE);
            --  Channel Status Register
            CSR_LIN_MODE : aliased USART0_CSR_LIN_MODE_Register;
            pragma Volatile_Full_Access (CSR_LIN_MODE);
      end case;
   end record
     with Unchecked_Union, Volatile;

   for USART_Peripheral use record
      RHR          at 16#18# range 0 .. 31;
      THR          at 16#1C# range 0 .. 31;
      BRGR         at 16#20# range 0 .. 31;
      RTOR         at 16#24# range 0 .. 31;
      TTGR         at 16#28# range 0 .. 31;
      FIDI         at 16#40# range 0 .. 31;
      NER          at 16#44# range 0 .. 31;
      IF_k         at 16#4C# range 0 .. 31;
      MAN          at 16#50# range 0 .. 31;
      LINMR        at 16#54# range 0 .. 31;
      LINIR        at 16#58# range 0 .. 31;
      WPMR         at 16#E4# range 0 .. 31;
      WPSR         at 16#E8# range 0 .. 31;
      RPR          at 16#100# range 0 .. 31;
      RCR          at 16#104# range 0 .. 31;
      TPR          at 16#108# range 0 .. 31;
      TCR          at 16#10C# range 0 .. 31;
      RNPR         at 16#110# range 0 .. 31;
      RNCR         at 16#114# range 0 .. 31;
      TNPR         at 16#118# range 0 .. 31;
      TNCR         at 16#11C# range 0 .. 31;
      PTCR         at 16#120# range 0 .. 31;
      PTSR         at 16#124# range 0 .. 31;
      CR           at 16#0# range 0 .. 31;
      MR           at 16#4# range 0 .. 31;
      IER          at 16#8# range 0 .. 31;
      IDR          at 16#C# range 0 .. 31;
      IMR          at 16#10# range 0 .. 31;
      CSR          at 16#14# range 0 .. 31;
      CR_SPI_MODE  at 16#0# range 0 .. 31;
      MR_SPI_MODE  at 16#4# range 0 .. 31;
      IER_SPI_MODE at 16#8# range 0 .. 31;
      IDR_SPI_MODE at 16#C# range 0 .. 31;
      IMR_SPI_MODE at 16#10# range 0 .. 31;
      CSR_SPI_MODE at 16#14# range 0 .. 31;
      IER_LIN_MODE at 16#8# range 0 .. 31;
      IDR_LIN_MODE at 16#C# range 0 .. 31;
      IMR_LIN_MODE at 16#10# range 0 .. 31;
      CSR_LIN_MODE at 16#14# range 0 .. 31;
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
