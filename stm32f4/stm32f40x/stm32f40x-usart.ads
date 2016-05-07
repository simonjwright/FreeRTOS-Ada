--  This spec has been automatically generated from STM32F40x.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package STM32F40x.USART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_PE_Field is STM32F40x.Bit;
   subtype SR_FE_Field is STM32F40x.Bit;
   subtype SR_NF_Field is STM32F40x.Bit;
   subtype SR_ORE_Field is STM32F40x.Bit;
   subtype SR_IDLE_Field is STM32F40x.Bit;
   subtype SR_RXNE_Field is STM32F40x.Bit;
   subtype SR_TC_Field is STM32F40x.Bit;
   subtype SR_TXE_Field is STM32F40x.Bit;
   subtype SR_LBD_Field is STM32F40x.Bit;
   subtype SR_CTS_Field is STM32F40x.Bit;

   --  Status register
   type SR_Register is record
      --  Read-only. Parity error
      PE             : SR_PE_Field := 16#0#;
      --  Read-only. Framing error
      FE             : SR_FE_Field := 16#0#;
      --  Read-only. Noise detected flag
      NF             : SR_NF_Field := 16#0#;
      --  Read-only. Overrun error
      ORE            : SR_ORE_Field := 16#0#;
      --  Read-only. IDLE line detected
      IDLE           : SR_IDLE_Field := 16#0#;
      --  Read data register not empty
      RXNE           : SR_RXNE_Field := 16#0#;
      --  Transmission complete
      TC             : SR_TC_Field := 16#0#;
      --  Read-only. Transmit data register empty
      TXE            : SR_TXE_Field := 16#0#;
      --  LIN break detection flag
      LBD            : SR_LBD_Field := 16#0#;
      --  CTS flag
      CTS            : SR_CTS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32F40x.UInt22 := 16#3000#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      PE             at 0 range 0 .. 0;
      FE             at 0 range 1 .. 1;
      NF             at 0 range 2 .. 2;
      ORE            at 0 range 3 .. 3;
      IDLE           at 0 range 4 .. 4;
      RXNE           at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TXE            at 0 range 7 .. 7;
      LBD            at 0 range 8 .. 8;
      CTS            at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- DR_Register --
   -----------------

   subtype DR_DR_Field is STM32F40x.UInt9;

   --  Data register
   type DR_Register is record
      --  Data value
      DR            : DR_DR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32F40x.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DR            at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   ------------------
   -- BRR_Register --
   ------------------

   subtype BRR_DIV_Fraction_Field is STM32F40x.UInt4;
   subtype BRR_DIV_Mantissa_Field is STM32F40x.UInt12;

   --  Baud rate register
   type BRR_Register is record
      --  fraction of USARTDIV
      DIV_Fraction   : BRR_DIV_Fraction_Field := 16#0#;
      --  mantissa of USARTDIV
      DIV_Mantissa   : BRR_DIV_Mantissa_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32F40x.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register use record
      DIV_Fraction   at 0 range 0 .. 3;
      DIV_Mantissa   at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- CR1_Register --
   ------------------

   subtype CR1_SBK_Field is STM32F40x.Bit;
   subtype CR1_RWU_Field is STM32F40x.Bit;
   subtype CR1_RE_Field is STM32F40x.Bit;
   subtype CR1_TE_Field is STM32F40x.Bit;
   subtype CR1_IDLEIE_Field is STM32F40x.Bit;
   subtype CR1_RXNEIE_Field is STM32F40x.Bit;
   subtype CR1_TCIE_Field is STM32F40x.Bit;
   subtype CR1_TXEIE_Field is STM32F40x.Bit;
   subtype CR1_PEIE_Field is STM32F40x.Bit;
   subtype CR1_PS_Field is STM32F40x.Bit;
   subtype CR1_PCE_Field is STM32F40x.Bit;
   subtype CR1_WAKE_Field is STM32F40x.Bit;
   subtype CR1_M_Field is STM32F40x.Bit;
   subtype CR1_UE_Field is STM32F40x.Bit;
   subtype CR1_OVER8_Field is STM32F40x.Bit;

   --  Control register 1
   type CR1_Register is record
      --  Send break
      SBK            : CR1_SBK_Field := 16#0#;
      --  Receiver wakeup
      RWU            : CR1_RWU_Field := 16#0#;
      --  Receiver enable
      RE             : CR1_RE_Field := 16#0#;
      --  Transmitter enable
      TE             : CR1_TE_Field := 16#0#;
      --  IDLE interrupt enable
      IDLEIE         : CR1_IDLEIE_Field := 16#0#;
      --  RXNE interrupt enable
      RXNEIE         : CR1_RXNEIE_Field := 16#0#;
      --  Transmission complete interrupt enable
      TCIE           : CR1_TCIE_Field := 16#0#;
      --  TXE interrupt enable
      TXEIE          : CR1_TXEIE_Field := 16#0#;
      --  PE interrupt enable
      PEIE           : CR1_PEIE_Field := 16#0#;
      --  Parity selection
      PS             : CR1_PS_Field := 16#0#;
      --  Parity control enable
      PCE            : CR1_PCE_Field := 16#0#;
      --  Wakeup method
      WAKE           : CR1_WAKE_Field := 16#0#;
      --  Word length
      M              : CR1_M_Field := 16#0#;
      --  USART enable
      UE             : CR1_UE_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32F40x.Bit := 16#0#;
      --  Oversampling mode
      OVER8          : CR1_OVER8_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32F40x.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      SBK            at 0 range 0 .. 0;
      RWU            at 0 range 1 .. 1;
      RE             at 0 range 2 .. 2;
      TE             at 0 range 3 .. 3;
      IDLEIE         at 0 range 4 .. 4;
      RXNEIE         at 0 range 5 .. 5;
      TCIE           at 0 range 6 .. 6;
      TXEIE          at 0 range 7 .. 7;
      PEIE           at 0 range 8 .. 8;
      PS             at 0 range 9 .. 9;
      PCE            at 0 range 10 .. 10;
      WAKE           at 0 range 11 .. 11;
      M              at 0 range 12 .. 12;
      UE             at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      OVER8          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- CR2_Register --
   ------------------

   subtype CR2_ADD_Field is STM32F40x.UInt4;
   subtype CR2_LBDL_Field is STM32F40x.Bit;
   subtype CR2_LBDIE_Field is STM32F40x.Bit;
   subtype CR2_LBCL_Field is STM32F40x.Bit;
   subtype CR2_CPHA_Field is STM32F40x.Bit;
   subtype CR2_CPOL_Field is STM32F40x.Bit;
   subtype CR2_CLKEN_Field is STM32F40x.Bit;
   subtype CR2_STOP_Field is STM32F40x.UInt2;
   subtype CR2_LINEN_Field is STM32F40x.Bit;

   --  Control register 2
   type CR2_Register is record
      --  Address of the USART node
      ADD            : CR2_ADD_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : STM32F40x.Bit := 16#0#;
      --  lin break detection length
      LBDL           : CR2_LBDL_Field := 16#0#;
      --  LIN break detection interrupt enable
      LBDIE          : CR2_LBDIE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  Last bit clock pulse
      LBCL           : CR2_LBCL_Field := 16#0#;
      --  Clock phase
      CPHA           : CR2_CPHA_Field := 16#0#;
      --  Clock polarity
      CPOL           : CR2_CPOL_Field := 16#0#;
      --  Clock enable
      CLKEN          : CR2_CLKEN_Field := 16#0#;
      --  STOP bits
      STOP           : CR2_STOP_Field := 16#0#;
      --  LIN mode enable
      LINEN          : CR2_LINEN_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32F40x.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      ADD            at 0 range 0 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      LBDL           at 0 range 5 .. 5;
      LBDIE          at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      LBCL           at 0 range 8 .. 8;
      CPHA           at 0 range 9 .. 9;
      CPOL           at 0 range 10 .. 10;
      CLKEN          at 0 range 11 .. 11;
      STOP           at 0 range 12 .. 13;
      LINEN          at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   ------------------
   -- CR3_Register --
   ------------------

   subtype CR3_EIE_Field is STM32F40x.Bit;
   subtype CR3_IREN_Field is STM32F40x.Bit;
   subtype CR3_IRLP_Field is STM32F40x.Bit;
   subtype CR3_HDSEL_Field is STM32F40x.Bit;
   subtype CR3_NACK_Field is STM32F40x.Bit;
   subtype CR3_SCEN_Field is STM32F40x.Bit;
   subtype CR3_DMAR_Field is STM32F40x.Bit;
   subtype CR3_DMAT_Field is STM32F40x.Bit;
   subtype CR3_RTSE_Field is STM32F40x.Bit;
   subtype CR3_CTSE_Field is STM32F40x.Bit;
   subtype CR3_CTSIE_Field is STM32F40x.Bit;
   subtype CR3_ONEBIT_Field is STM32F40x.Bit;

   --  Control register 3
   type CR3_Register is record
      --  Error interrupt enable
      EIE            : CR3_EIE_Field := 16#0#;
      --  IrDA mode enable
      IREN           : CR3_IREN_Field := 16#0#;
      --  IrDA low-power
      IRLP           : CR3_IRLP_Field := 16#0#;
      --  Half-duplex selection
      HDSEL          : CR3_HDSEL_Field := 16#0#;
      --  Smartcard NACK enable
      NACK           : CR3_NACK_Field := 16#0#;
      --  Smartcard mode enable
      SCEN           : CR3_SCEN_Field := 16#0#;
      --  DMA enable receiver
      DMAR           : CR3_DMAR_Field := 16#0#;
      --  DMA enable transmitter
      DMAT           : CR3_DMAT_Field := 16#0#;
      --  RTS enable
      RTSE           : CR3_RTSE_Field := 16#0#;
      --  CTS enable
      CTSE           : CR3_CTSE_Field := 16#0#;
      --  CTS interrupt enable
      CTSIE          : CR3_CTSIE_Field := 16#0#;
      --  One sample bit method enable
      ONEBIT         : CR3_ONEBIT_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register use record
      EIE            at 0 range 0 .. 0;
      IREN           at 0 range 1 .. 1;
      IRLP           at 0 range 2 .. 2;
      HDSEL          at 0 range 3 .. 3;
      NACK           at 0 range 4 .. 4;
      SCEN           at 0 range 5 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      RTSE           at 0 range 8 .. 8;
      CTSE           at 0 range 9 .. 9;
      CTSIE          at 0 range 10 .. 10;
      ONEBIT         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -------------------
   -- GTPR_Register --
   -------------------

   subtype GTPR_PSC_Field is STM32F40x.Byte;
   subtype GTPR_GT_Field is STM32F40x.Byte;

   --  Guard time and prescaler register
   type GTPR_Register is record
      --  Prescaler value
      PSC            : GTPR_PSC_Field := 16#0#;
      --  Guard time value
      GT             : GTPR_GT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32F40x.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GTPR_Register use record
      PSC            at 0 range 0 .. 7;
      GT             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   --  Status register
   type SR_Register_1 is record
      --  Read-only. Parity error
      PE            : SR_PE_Field := 16#0#;
      --  Read-only. Framing error
      FE            : SR_FE_Field := 16#0#;
      --  Read-only. Noise detected flag
      NF            : SR_NF_Field := 16#0#;
      --  Read-only. Overrun error
      ORE           : SR_ORE_Field := 16#0#;
      --  Read-only. IDLE line detected
      IDLE          : SR_IDLE_Field := 16#0#;
      --  Read data register not empty
      RXNE          : SR_RXNE_Field := 16#0#;
      --  Transmission complete
      TC            : SR_TC_Field := 16#0#;
      --  Read-only. Transmit data register empty
      TXE           : SR_TXE_Field := 16#0#;
      --  LIN break detection flag
      LBD           : SR_LBD_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32F40x.UInt23 := 16#6000#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_1 use record
      PE            at 0 range 0 .. 0;
      FE            at 0 range 1 .. 1;
      NF            at 0 range 2 .. 2;
      ORE           at 0 range 3 .. 3;
      IDLE          at 0 range 4 .. 4;
      RXNE          at 0 range 5 .. 5;
      TC            at 0 range 6 .. 6;
      TXE           at 0 range 7 .. 7;
      LBD           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   ------------------
   -- CR2_Register --
   ------------------

   --  Control register 2
   type CR2_Register_1 is record
      --  Address of the USART node
      ADD            : CR2_ADD_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : STM32F40x.Bit := 16#0#;
      --  lin break detection length
      LBDL           : CR2_LBDL_Field := 16#0#;
      --  LIN break detection interrupt enable
      LBDIE          : CR2_LBDIE_Field := 16#0#;
      --  unspecified
      Reserved_7_11  : STM32F40x.UInt5 := 16#0#;
      --  STOP bits
      STOP           : CR2_STOP_Field := 16#0#;
      --  LIN mode enable
      LINEN          : CR2_LINEN_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32F40x.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      ADD            at 0 range 0 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      LBDL           at 0 range 5 .. 5;
      LBDIE          at 0 range 6 .. 6;
      Reserved_7_11  at 0 range 7 .. 11;
      STOP           at 0 range 12 .. 13;
      LINEN          at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   ------------------
   -- CR3_Register --
   ------------------

   --  Control register 3
   type CR3_Register_1 is record
      --  Error interrupt enable
      EIE            : CR3_EIE_Field := 16#0#;
      --  IrDA mode enable
      IREN           : CR3_IREN_Field := 16#0#;
      --  IrDA low-power
      IRLP           : CR3_IRLP_Field := 16#0#;
      --  Half-duplex selection
      HDSEL          : CR3_HDSEL_Field := 16#0#;
      --  unspecified
      Reserved_4_5   : STM32F40x.UInt2 := 16#0#;
      --  DMA enable receiver
      DMAR           : CR3_DMAR_Field := 16#0#;
      --  DMA enable transmitter
      DMAT           : CR3_DMAT_Field := 16#0#;
      --  unspecified
      Reserved_8_10  : STM32F40x.UInt3 := 16#0#;
      --  One sample bit method enable
      ONEBIT         : CR3_ONEBIT_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register_1 use record
      EIE            at 0 range 0 .. 0;
      IREN           at 0 range 1 .. 1;
      IRLP           at 0 range 2 .. 2;
      HDSEL          at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      Reserved_8_10  at 0 range 8 .. 10;
      ONEBIT         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Universal synchronous asynchronous receiver transmitter
   type USART2_Peripheral is record
      --  Status register
      SR   : SR_Register;
      --  Data register
      DR   : DR_Register;
      --  Baud rate register
      BRR  : BRR_Register;
      --  Control register 1
      CR1  : CR1_Register;
      --  Control register 2
      CR2  : CR2_Register;
      --  Control register 3
      CR3  : CR3_Register;
      --  Guard time and prescaler register
      GTPR : GTPR_Register;
   end record
     with Volatile;

   for USART2_Peripheral use record
      SR   at 0 range 0 .. 31;
      DR   at 4 range 0 .. 31;
      BRR  at 8 range 0 .. 31;
      CR1  at 12 range 0 .. 31;
      CR2  at 16 range 0 .. 31;
      CR3  at 20 range 0 .. 31;
      GTPR at 24 range 0 .. 31;
   end record;

   --  Universal synchronous asynchronous receiver transmitter
   USART2_Periph : aliased USART2_Peripheral
     with Import, Address => USART2_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART3_Periph : aliased USART2_Peripheral
     with Import, Address => USART3_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART1_Periph : aliased USART2_Peripheral
     with Import, Address => USART1_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART6_Periph : aliased USART2_Peripheral
     with Import, Address => USART6_Base;

   --  Universal synchronous asynchronous receiver transmitter
   type UART4_Peripheral is record
      --  Status register
      SR  : SR_Register_1;
      --  Data register
      DR  : DR_Register;
      --  Baud rate register
      BRR : BRR_Register;
      --  Control register 1
      CR1 : CR1_Register;
      --  Control register 2
      CR2 : CR2_Register_1;
      --  Control register 3
      CR3 : CR3_Register_1;
   end record
     with Volatile;

   for UART4_Peripheral use record
      SR  at 0 range 0 .. 31;
      DR  at 4 range 0 .. 31;
      BRR at 8 range 0 .. 31;
      CR1 at 12 range 0 .. 31;
      CR2 at 16 range 0 .. 31;
      CR3 at 20 range 0 .. 31;
   end record;

   --  Universal synchronous asynchronous receiver transmitter
   UART4_Periph : aliased UART4_Peripheral
     with Import, Address => UART4_Base;

   --  Universal synchronous asynchronous receiver transmitter
   UART5_Periph : aliased UART4_Peripheral
     with Import, Address => UART5_Base;

end STM32F40x.USART;
