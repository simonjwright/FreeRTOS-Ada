--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with Interfaces;  use Interfaces;
with System;

--  Atmel ATSAM3X8E device: Cortex-M3 Microcontroller with 2x256 KB Flash, HS
--  USB, 144 Pins (refer to http://www.atmel.com/devices/SAM3X8E.aspx for more)
package ATSAM3X8E is
   pragma Preelaborate;

   ---------------
   -- Base type --
   ---------------

   subtype Word is Interfaces.Unsigned_32;
   subtype Short is Interfaces.Unsigned_16;
   subtype Byte is Interfaces.Unsigned_8;
   type Bit is mod 2**1
     with Size => 1;
   type UInt2 is mod 2**2
     with Size => 2;
   type UInt3 is mod 2**3
     with Size => 3;
   type UInt4 is mod 2**4
     with Size => 4;
   type UInt5 is mod 2**5
     with Size => 5;
   type UInt6 is mod 2**6
     with Size => 6;
   type UInt7 is mod 2**7
     with Size => 7;
   type UInt9 is mod 2**9
     with Size => 9;
   type UInt10 is mod 2**10
     with Size => 10;
   type UInt11 is mod 2**11
     with Size => 11;
   type UInt12 is mod 2**12
     with Size => 12;
   type UInt13 is mod 2**13
     with Size => 13;
   type UInt14 is mod 2**14
     with Size => 14;
   type UInt15 is mod 2**15
     with Size => 15;
   type UInt17 is mod 2**17
     with Size => 17;
   type UInt18 is mod 2**18
     with Size => 18;
   type UInt19 is mod 2**19
     with Size => 19;
   type UInt20 is mod 2**20
     with Size => 20;
   type UInt21 is mod 2**21
     with Size => 21;
   type UInt22 is mod 2**22
     with Size => 22;
   type UInt23 is mod 2**23
     with Size => 23;
   type UInt24 is mod 2**24
     with Size => 24;
   type UInt25 is mod 2**25
     with Size => 25;
   type UInt26 is mod 2**26
     with Size => 26;
   type UInt27 is mod 2**27
     with Size => 27;
   type UInt28 is mod 2**28
     with Size => 28;
   type UInt29 is mod 2**29
     with Size => 29;
   type UInt30 is mod 2**30
     with Size => 30;
   type UInt31 is mod 2**31
     with Size => 31;

   --------------------
   -- Base addresses --
   --------------------

   HSMCI_Base : constant System.Address :=
     System'To_Address (16#40000000#);
   SSC_Base : constant System.Address :=
     System'To_Address (16#40004000#);
   SPI0_Base : constant System.Address :=
     System'To_Address (16#40008000#);
   TC0_Base : constant System.Address :=
     System'To_Address (16#40080000#);
   TC1_Base : constant System.Address :=
     System'To_Address (16#40084000#);
   TC2_Base : constant System.Address :=
     System'To_Address (16#40088000#);
   TWI0_Base : constant System.Address :=
     System'To_Address (16#4008C000#);
   TWI1_Base : constant System.Address :=
     System'To_Address (16#40090000#);
   PWM_Base : constant System.Address :=
     System'To_Address (16#40094000#);
   USART0_Base : constant System.Address :=
     System'To_Address (16#40098000#);
   USART1_Base : constant System.Address :=
     System'To_Address (16#4009C000#);
   USART2_Base : constant System.Address :=
     System'To_Address (16#400A0000#);
   USART3_Base : constant System.Address :=
     System'To_Address (16#400A4000#);
   UOTGHS_Base : constant System.Address :=
     System'To_Address (16#400AC000#);
   EMAC_Base : constant System.Address :=
     System'To_Address (16#400B0000#);
   CAN0_Base : constant System.Address :=
     System'To_Address (16#400B4000#);
   CAN1_Base : constant System.Address :=
     System'To_Address (16#400B8000#);
   TRNG_Base : constant System.Address :=
     System'To_Address (16#400BC000#);
   ADC_Base : constant System.Address :=
     System'To_Address (16#400C0000#);
   DMAC_Base : constant System.Address :=
     System'To_Address (16#400C4000#);
   DACC_Base : constant System.Address :=
     System'To_Address (16#400C8000#);
   SMC_Base : constant System.Address :=
     System'To_Address (16#400E0000#);
   MATRIX_Base : constant System.Address :=
     System'To_Address (16#400E0400#);
   PMC_Base : constant System.Address :=
     System'To_Address (16#400E0600#);
   UART_Base : constant System.Address :=
     System'To_Address (16#400E0800#);
   CHIPID_Base : constant System.Address :=
     System'To_Address (16#400E0940#);
   EFC0_Base : constant System.Address :=
     System'To_Address (16#400E0A00#);
   EFC1_Base : constant System.Address :=
     System'To_Address (16#400E0C00#);
   PIOA_Base : constant System.Address :=
     System'To_Address (16#400E0E00#);
   PIOB_Base : constant System.Address :=
     System'To_Address (16#400E1000#);
   PIOC_Base : constant System.Address :=
     System'To_Address (16#400E1200#);
   PIOD_Base : constant System.Address :=
     System'To_Address (16#400E1400#);
   RSTC_Base : constant System.Address :=
     System'To_Address (16#400E1A00#);
   SUPC_Base : constant System.Address :=
     System'To_Address (16#400E1A10#);
   RTT_Base : constant System.Address :=
     System'To_Address (16#400E1A30#);
   WDT_Base : constant System.Address :=
     System'To_Address (16#400E1A50#);
   RTC_Base : constant System.Address :=
     System'To_Address (16#400E1A60#);
   GPBR_Base : constant System.Address :=
     System'To_Address (16#400E1A90#);

end ATSAM3X8E;
