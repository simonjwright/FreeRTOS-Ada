--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.RADIO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between READY event and START task.
   type READY_START_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for READY_START_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between END event and DISABLE task.
   type END_DISABLE_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for END_DISABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between DISABLED event and TXEN task.
   type DISABLED_TXEN_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for DISABLED_TXEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between DISABLED event and RXEN task.
   type DISABLED_RXEN_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for DISABLED_RXEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between ADDRESS event and RSSISTART task.
   type ADDRESS_RSSISTART_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for ADDRESS_RSSISTART_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between END event and START task.
   type END_START_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for END_START_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between ADDRESS event and BCSTART task.
   type ADDRESS_BCSTART_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for ADDRESS_BCSTART_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between DISABLED event and RSSISTOP task.
   type DISABLED_RSSISTOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for DISABLED_RSSISTOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for the radio.
   type SHORTS_Register is record
      --  Shortcut between READY event and START task.
      READY_START       : READY_START_Field := Disabled;
      --  Shortcut between END event and DISABLE task.
      END_DISABLE       : END_DISABLE_Field := Disabled;
      --  Shortcut between DISABLED event and TXEN task.
      DISABLED_TXEN     : DISABLED_TXEN_Field := Disabled;
      --  Shortcut between DISABLED event and RXEN task.
      DISABLED_RXEN     : DISABLED_RXEN_Field := Disabled;
      --  Shortcut between ADDRESS event and RSSISTART task.
      ADDRESS_RSSISTART : ADDRESS_RSSISTART_Field := Disabled;
      --  Shortcut between END event and START task.
      END_START         : END_START_Field := Disabled;
      --  Shortcut between ADDRESS event and BCSTART task.
      ADDRESS_BCSTART   : ADDRESS_BCSTART_Field := Disabled;
      --  unspecified
      Reserved_7_7      : nrf51.Bit := 16#0#;
      --  Shortcut between DISABLED event and RSSISTOP task.
      DISABLED_RSSISTOP : DISABLED_RSSISTOP_Field := Disabled;
      --  unspecified
      Reserved_9_31     : nrf51.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      READY_START       at 0 range 0 .. 0;
      END_DISABLE       at 0 range 1 .. 1;
      DISABLED_TXEN     at 0 range 2 .. 2;
      DISABLED_RXEN     at 0 range 3 .. 3;
      ADDRESS_RSSISTART at 0 range 4 .. 4;
      END_START         at 0 range 5 .. 5;
      ADDRESS_BCSTART   at 0 range 6 .. 6;
      Reserved_7_7      at 0 range 7 .. 7;
      DISABLED_RSSISTOP at 0 range 8 .. 8;
      Reserved_9_31     at 0 range 9 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on READY event.
   type READY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for READY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on READY event.
   type READY_Field_1 is
     (
      --  Reset value for the field
      Ready_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for READY_Field_1 use
     (Ready_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ADDRESS event.
   type ADDRESS_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ADDRESS_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ADDRESS event.
   type ADDRESS_Field_1 is
     (
      --  Reset value for the field
      Address_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ADDRESS_Field_1 use
     (Address_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on PAYLOAD event.
   type PAYLOAD_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for PAYLOAD_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on PAYLOAD event.
   type PAYLOAD_Field_1 is
     (
      --  Reset value for the field
      Payload_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for PAYLOAD_Field_1 use
     (Payload_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on END event.
   type END_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for END_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on END event.
   type END_Field_1 is
     (
      --  Reset value for the field
      End_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for END_Field_1 use
     (End_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on DISABLED event.
   type DISABLED_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for DISABLED_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on DISABLED event.
   type DISABLED_Field_1 is
     (
      --  Reset value for the field
      Disabled_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for DISABLED_Field_1 use
     (Disabled_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on DEVMATCH event.
   type DEVMATCH_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for DEVMATCH_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on DEVMATCH event.
   type DEVMATCH_Field_1 is
     (
      --  Reset value for the field
      Devmatch_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for DEVMATCH_Field_1 use
     (Devmatch_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on DEVMISS event.
   type DEVMISS_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for DEVMISS_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on DEVMISS event.
   type DEVMISS_Field_1 is
     (
      --  Reset value for the field
      Devmiss_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for DEVMISS_Field_1 use
     (Devmiss_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on RSSIEND event.
   type RSSIEND_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for RSSIEND_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on RSSIEND event.
   type RSSIEND_Field_1 is
     (
      --  Reset value for the field
      Rssiend_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for RSSIEND_Field_1 use
     (Rssiend_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on BCMATCH event.
   type BCMATCH_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for BCMATCH_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on BCMATCH event.
   type BCMATCH_Field_1 is
     (
      --  Reset value for the field
      Bcmatch_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for BCMATCH_Field_1 use
     (Bcmatch_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on READY event.
      READY          : READY_Field_1 := Ready_Field_Reset;
      --  Enable interrupt on ADDRESS event.
      ADDRESS        : ADDRESS_Field_1 := Address_Field_Reset;
      --  Enable interrupt on PAYLOAD event.
      PAYLOAD        : PAYLOAD_Field_1 := Payload_Field_Reset;
      --  Enable interrupt on END event.
      END_k          : END_Field_1 := End_Field_Reset;
      --  Enable interrupt on DISABLED event.
      DISABLED       : DISABLED_Field_1 := Disabled_Field_Reset;
      --  Enable interrupt on DEVMATCH event.
      DEVMATCH       : DEVMATCH_Field_1 := Devmatch_Field_Reset;
      --  Enable interrupt on DEVMISS event.
      DEVMISS        : DEVMISS_Field_1 := Devmiss_Field_Reset;
      --  Enable interrupt on RSSIEND event.
      RSSIEND        : RSSIEND_Field_1 := Rssiend_Field_Reset;
      --  unspecified
      Reserved_8_9   : nrf51.UInt2 := 16#0#;
      --  Enable interrupt on BCMATCH event.
      BCMATCH        : BCMATCH_Field_1 := Bcmatch_Field_Reset;
      --  unspecified
      Reserved_11_31 : nrf51.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      READY          at 0 range 0 .. 0;
      ADDRESS        at 0 range 1 .. 1;
      PAYLOAD        at 0 range 2 .. 2;
      END_k          at 0 range 3 .. 3;
      DISABLED       at 0 range 4 .. 4;
      DEVMATCH       at 0 range 5 .. 5;
      DEVMISS        at 0 range 6 .. 6;
      RSSIEND        at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      BCMATCH        at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on READY event.
   type READY_Field_2 is
     (
      --  Reset value for the field
      Ready_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for READY_Field_2 use
     (Ready_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ADDRESS event.
   type ADDRESS_Field_2 is
     (
      --  Reset value for the field
      Address_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ADDRESS_Field_2 use
     (Address_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on PAYLOAD event.
   type PAYLOAD_Field_2 is
     (
      --  Reset value for the field
      Payload_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for PAYLOAD_Field_2 use
     (Payload_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on END event.
   type END_Field_2 is
     (
      --  Reset value for the field
      End_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for END_Field_2 use
     (End_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on DISABLED event.
   type DISABLED_Field_2 is
     (
      --  Reset value for the field
      Disabled_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for DISABLED_Field_2 use
     (Disabled_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on DEVMATCH event.
   type DEVMATCH_Field_2 is
     (
      --  Reset value for the field
      Devmatch_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for DEVMATCH_Field_2 use
     (Devmatch_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on DEVMISS event.
   type DEVMISS_Field_2 is
     (
      --  Reset value for the field
      Devmiss_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for DEVMISS_Field_2 use
     (Devmiss_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on RSSIEND event.
   type RSSIEND_Field_2 is
     (
      --  Reset value for the field
      Rssiend_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for RSSIEND_Field_2 use
     (Rssiend_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on BCMATCH event.
   type BCMATCH_Field_2 is
     (
      --  Reset value for the field
      Bcmatch_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for BCMATCH_Field_2 use
     (Bcmatch_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on READY event.
      READY          : READY_Field_2 := Ready_Field_Reset;
      --  Disable interrupt on ADDRESS event.
      ADDRESS        : ADDRESS_Field_2 := Address_Field_Reset;
      --  Disable interrupt on PAYLOAD event.
      PAYLOAD        : PAYLOAD_Field_2 := Payload_Field_Reset;
      --  Disable interrupt on END event.
      END_k          : END_Field_2 := End_Field_Reset;
      --  Disable interrupt on DISABLED event.
      DISABLED       : DISABLED_Field_2 := Disabled_Field_Reset;
      --  Disable interrupt on DEVMATCH event.
      DEVMATCH       : DEVMATCH_Field_2 := Devmatch_Field_Reset;
      --  Disable interrupt on DEVMISS event.
      DEVMISS        : DEVMISS_Field_2 := Devmiss_Field_Reset;
      --  Disable interrupt on RSSIEND event.
      RSSIEND        : RSSIEND_Field_2 := Rssiend_Field_Reset;
      --  unspecified
      Reserved_8_9   : nrf51.UInt2 := 16#0#;
      --  Disable interrupt on BCMATCH event.
      BCMATCH        : BCMATCH_Field_2 := Bcmatch_Field_Reset;
      --  unspecified
      Reserved_11_31 : nrf51.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      READY          at 0 range 0 .. 0;
      ADDRESS        at 0 range 1 .. 1;
      PAYLOAD        at 0 range 2 .. 2;
      END_k          at 0 range 3 .. 3;
      DISABLED       at 0 range 4 .. 4;
      DEVMATCH       at 0 range 5 .. 5;
      DEVMISS        at 0 range 6 .. 6;
      RSSIEND        at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      BCMATCH        at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   ------------------------
   -- CRCSTATUS_Register --
   ------------------------

   --  CRC status of received packet.
   type CRCSTATUS_Field is
     (
      --  Packet received with CRC error.
      Crcerror,
      --  Packet received with CRC ok.
      Crcok)
     with Size => 1;
   for CRCSTATUS_Field use
     (Crcerror => 0,
      Crcok => 1);

   --  CRC status of received packet.
   type CRCSTATUS_Register is record
      --  Read-only. CRC status of received packet.
      CRCSTATUS     : CRCSTATUS_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCSTATUS_Register use record
      CRCSTATUS     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ----------------------
   -- RXMATCH_Register --
   ----------------------

   subtype RXMATCH_RXMATCH_Field is nrf51.UInt3;

   --  Received address.
   type RXMATCH_Register is record
      --  Read-only. Logical address in which previous packet was received.
      RXMATCH       : RXMATCH_RXMATCH_Field;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXMATCH_Register use record
      RXMATCH       at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --------------------
   -- RXCRC_Register --
   --------------------

   subtype RXCRC_RXCRC_Field is nrf51.UInt24;

   --  Received CRC.
   type RXCRC_Register is record
      --  Read-only. CRC field of previously received packet.
      RXCRC          : RXCRC_RXCRC_Field;
      --  unspecified
      Reserved_24_31 : nrf51.Byte;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXCRC_Register use record
      RXCRC          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ------------------
   -- DAI_Register --
   ------------------

   subtype DAI_DAI_Field is nrf51.UInt3;

   --  Device address match index.
   type DAI_Register is record
      --  Read-only. Index (n) of device address (see DAB[n] and DAP[n]) that
      --  obtained an address match.
      DAI           : DAI_DAI_Field;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAI_Register use record
      DAI           at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------------
   -- FREQUENCY_Register --
   ------------------------

   subtype FREQUENCY_FREQUENCY_Field is nrf51.UInt7;

   --  Frequency.
   type FREQUENCY_Register is record
      --  Radio channel frequency offset in MHz: RF Frequency = 2400 +
      --  FREQUENCY (MHz). Decision point: TXEN or RXEN task.
      FREQUENCY     : FREQUENCY_FREQUENCY_Field := 16#2#;
      --  unspecified
      Reserved_7_31 : nrf51.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FREQUENCY_Register use record
      FREQUENCY     at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   ----------------------
   -- TXPOWER_Register --
   ----------------------

   --  Radio output power. Decision point: TXEN task.
   type TXPOWER_Field is
     (
      --  0dBm.
      TXPOWER_Field_0DBm,
      --  +4dBm.
      Pos4DBm,
      --  -30dBm.
      Neg30DBm,
      --  -20dBm.
      Neg20DBm,
      --  -16dBm.
      Neg16DBm,
      --  -12dBm.
      Neg12DBm,
      --  -8dBm.
      Neg8DBm,
      --  -4dBm.
      Neg4DBm)
     with Size => 8;
   for TXPOWER_Field use
     (TXPOWER_Field_0DBm => 0,
      Pos4DBm => 4,
      Neg30DBm => 216,
      Neg20DBm => 236,
      Neg16DBm => 240,
      Neg12DBm => 244,
      Neg8DBm => 248,
      Neg4DBm => 252);

   --  Output power.
   type TXPOWER_Register is record
      --  Radio output power. Decision point: TXEN task.
      TXPOWER       : TXPOWER_Field := TXPOWER_Field_0DBm;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXPOWER_Register use record
      TXPOWER       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------
   -- MODE_Register --
   -------------------

   --  Radio data rate and modulation setting. Decision point: TXEN or RXEN
   --  task.
   type MODE_Field is
     (
      --  1Mbit/s Nordic propietary radio mode.
      Nrf_1Mbit,
      --  2Mbit/s Nordic propietary radio mode.
      Nrf_2Mbit,
      --  250kbit/s Nordic propietary radio mode.
      Nrf_250Kbit,
      --  1Mbit/s Bluetooth Low Energy
      Ble_1Mbit)
     with Size => 2;
   for MODE_Field use
     (Nrf_1Mbit => 0,
      Nrf_2Mbit => 1,
      Nrf_250Kbit => 2,
      Ble_1Mbit => 3);

   --  Data rate and modulation.
   type MODE_Register is record
      --  Radio data rate and modulation setting. Decision point: TXEN or RXEN
      --  task.
      MODE          : MODE_Field := Nrf_1Mbit;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MODE_Register use record
      MODE          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --------------------
   -- PCNF0_Register --
   --------------------

   subtype PCNF0_LFLEN_Field is nrf51.UInt4;
   subtype PCNF0_S0LEN_Field is nrf51.Bit;
   subtype PCNF0_S1LEN_Field is nrf51.UInt4;

   --  Packet configuration 0.
   type PCNF0_Register is record
      --  Length of length field in number of bits. Decision point: START task.
      LFLEN          : PCNF0_LFLEN_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : nrf51.UInt4 := 16#0#;
      --  Length of S0 field in number of bytes. Decision point: START task.
      S0LEN          : PCNF0_S0LEN_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : nrf51.UInt7 := 16#0#;
      --  Length of S1 field in number of bits. Decision point: START task.
      S1LEN          : PCNF0_S1LEN_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : nrf51.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCNF0_Register use record
      LFLEN          at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      S0LEN          at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      S1LEN          at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --------------------
   -- PCNF1_Register --
   --------------------

   subtype PCNF1_MAXLEN_Field is nrf51.Byte;
   subtype PCNF1_STATLEN_Field is nrf51.Byte;
   subtype PCNF1_BALEN_Field is nrf51.UInt3;

   --  On air endianness of packet length field. Decision point: START task.
   type ENDIAN_Field is
     (
      --  Least significant bit on air first
      Little,
      --  Most significant bit on air first
      Big)
     with Size => 1;
   for ENDIAN_Field use
     (Little => 0,
      Big => 1);

   --  Packet whitening enable.
   type WHITEEN_Field is
     (
      --  Whitening disabled.
      Disabled,
      --  Whitening enabled.
      Enabled)
     with Size => 1;
   for WHITEEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Packet configuration 1.
   type PCNF1_Register is record
      --  Maximum length of packet payload in number of bytes.
      MAXLEN         : PCNF1_MAXLEN_Field := 16#0#;
      --  Static length in number of bytes. Decision point: START task.
      STATLEN        : PCNF1_STATLEN_Field := 16#0#;
      --  Base address length in number of bytes. Decision point: START task.
      BALEN          : PCNF1_BALEN_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : nrf51.UInt5 := 16#0#;
      --  On air endianness of packet length field. Decision point: START task.
      ENDIAN         : ENDIAN_Field := Little;
      --  Packet whitening enable.
      WHITEEN        : WHITEEN_Field := Disabled;
      --  unspecified
      Reserved_26_31 : nrf51.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCNF1_Register use record
      MAXLEN         at 0 range 0 .. 7;
      STATLEN        at 0 range 8 .. 15;
      BALEN          at 0 range 16 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      ENDIAN         at 0 range 24 .. 24;
      WHITEEN        at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   ----------------------
   -- PREFIX0_Register --
   ----------------------

   --  PREFIX0_AP array element
   subtype PREFIX0_AP_Element is nrf51.Byte;

   --  PREFIX0_AP array
   type PREFIX0_AP_Field_Array is array (0 .. 3) of PREFIX0_AP_Element
     with Component_Size => 8, Size => 32;

   --  Prefixes bytes for logical addresses 0 to 3.
   type PREFIX0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AP as a value
            Val : nrf51.Word;
         when True =>
            --  AP as an array
            Arr : PREFIX0_AP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for PREFIX0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ----------------------
   -- PREFIX1_Register --
   ----------------------

   --  PREFIX1_AP array element
   subtype PREFIX1_AP_Element is nrf51.Byte;

   --  PREFIX1_AP array
   type PREFIX1_AP_Field_Array is array (4 .. 7) of PREFIX1_AP_Element
     with Component_Size => 8, Size => 32;

   --  Prefixes bytes for logical addresses 4 to 7.
   type PREFIX1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AP as a value
            Val : nrf51.Word;
         when True =>
            --  AP as an array
            Arr : PREFIX1_AP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for PREFIX1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------------
   -- TXADDRESS_Register --
   ------------------------

   subtype TXADDRESS_TXADDRESS_Field is nrf51.UInt3;

   --  Transmit address select.
   type TXADDRESS_Register is record
      --  Logical address to be used when transmitting a packet. Decision
      --  point: START task.
      TXADDRESS     : TXADDRESS_TXADDRESS_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXADDRESS_Register use record
      TXADDRESS     at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --------------------------
   -- RXADDRESSES_Register --
   --------------------------

   --  Enable reception on logical address 0. Decision point: START task.
   type ADDR0_Field is
     (
      --  Reception disabled.
      Disabled,
      --  Reception enabled.
      Enabled)
     with Size => 1;
   for ADDR0_Field use
     (Disabled => 0,
      Enabled => 1);

   ----------------------
   -- RXADDRESSES.ADDR --
   ----------------------

   --  RXADDRESSES_ADDR array
   type RXADDRESSES_ADDR_Field_Array is array (0 .. 7) of ADDR0_Field
     with Component_Size => 1, Size => 8;

   --  Type definition for RXADDRESSES_ADDR
   type RXADDRESSES_ADDR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ADDR as a value
            Val : nrf51.Byte;
         when True =>
            --  ADDR as an array
            Arr : RXADDRESSES_ADDR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RXADDRESSES_ADDR_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Receive address select.
   type RXADDRESSES_Register is record
      --  Enable reception on logical address 0. Decision point: START task.
      ADDR          : RXADDRESSES_ADDR_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXADDRESSES_Register use record
      ADDR          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ---------------------
   -- CRCCNF_Register --
   ---------------------

   --  CRC length. Decision point: START task.
   type LEN_Field is
     (
      --  CRC calculation disabled.
      Disabled,
      --  One byte long CRC.
      One,
      --  Two bytes long CRC.
      Two,
      --  Three bytes long CRC.
      Three)
     with Size => 2;
   for LEN_Field use
     (Disabled => 0,
      One => 1,
      Two => 2,
      Three => 3);

   --  Leave packet address field out of the CRC calculation. Decision point:
   --  START task.
   type SKIPADDR_Field is
     (
      --  Include packet address in CRC calculation.
      Include,
      --  Packet address is skipped in CRC calculation. The CRC calculation
      --  will start at the first byte after the address.
      Skip)
     with Size => 1;
   for SKIPADDR_Field use
     (Include => 0,
      Skip => 1);

   --  CRC configuration.
   type CRCCNF_Register is record
      --  CRC length. Decision point: START task.
      LEN           : LEN_Field := Disabled;
      --  unspecified
      Reserved_2_7  : nrf51.UInt6 := 16#0#;
      --  Leave packet address field out of the CRC calculation. Decision
      --  point: START task.
      SKIPADDR      : SKIPADDR_Field := Include;
      --  unspecified
      Reserved_9_31 : nrf51.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCCNF_Register use record
      LEN           at 0 range 0 .. 1;
      Reserved_2_7  at 0 range 2 .. 7;
      SKIPADDR      at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   ----------------------
   -- CRCPOLY_Register --
   ----------------------

   subtype CRCPOLY_CRCPOLY_Field is nrf51.UInt24;

   --  CRC polynomial.
   type CRCPOLY_Register is record
      --  CRC polynomial. Decision point: START task.
      CRCPOLY        : CRCPOLY_CRCPOLY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : nrf51.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCPOLY_Register use record
      CRCPOLY        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   ----------------------
   -- CRCINIT_Register --
   ----------------------

   subtype CRCINIT_CRCINIT_Field is nrf51.UInt24;

   --  CRC initial value.
   type CRCINIT_Register is record
      --  Initial value for CRC calculation. Decision point: START task.
      CRCINIT        : CRCINIT_CRCINIT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : nrf51.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCINIT_Register use record
      CRCINIT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -------------------
   -- TEST_Register --
   -------------------

   --  Constant carrier. Decision point: TXEN task.
   type CONSTCARRIER_Field is
     (
      --  Constant carrier disabled.
      Disabled,
      --  Constant carrier enabled.
      Enabled)
     with Size => 1;
   for CONSTCARRIER_Field use
     (Disabled => 0,
      Enabled => 1);

   --  PLL lock. Decision point: TXEN or RXEN task.
   type PLLLOCK_Field is
     (
      --  PLL lock disabled.
      Disabled,
      --  PLL lock enabled.
      Enabled)
     with Size => 1;
   for PLLLOCK_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Test features enable register.
   type TEST_Register is record
      --  Constant carrier. Decision point: TXEN task.
      CONSTCARRIER  : CONSTCARRIER_Field := Disabled;
      --  PLL lock. Decision point: TXEN or RXEN task.
      PLLLOCK       : PLLLOCK_Field := Disabled;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TEST_Register use record
      CONSTCARRIER  at 0 range 0 .. 0;
      PLLLOCK       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -------------------
   -- TIFS_Register --
   -------------------

   subtype TIFS_TIFS_Field is nrf51.Byte;

   --  Inter Frame Spacing in microseconds.
   type TIFS_Register is record
      --  Inter frame spacing in microseconds. Decision point: START rask
      TIFS          : TIFS_TIFS_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIFS_Register use record
      TIFS          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------------------
   -- RSSISAMPLE_Register --
   -------------------------

   subtype RSSISAMPLE_RSSISAMPLE_Field is nrf51.UInt7;

   --  RSSI sample.
   type RSSISAMPLE_Register is record
      --  Read-only. RSSI sample result. The result is read as a positive value
      --  so that ReceivedSignalStrength = -RSSISAMPLE dBm
      RSSISAMPLE    : RSSISAMPLE_RSSISAMPLE_Field;
      --  unspecified
      Reserved_7_31 : nrf51.UInt25;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RSSISAMPLE_Register use record
      RSSISAMPLE    at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --------------------
   -- STATE_Register --
   --------------------

   --  Current radio state.
   type STATE_Field is
     (
      --  Radio is in the Disabled state.
      Disabled,
      --  Radio is in the Rx Ramp Up state.
      Rxru,
      --  Radio is in the Rx Idle state.
      Rxidle,
      --  Radio is in the Rx state.
      Rx,
      --  Radio is in the Rx Disable state.
      Rxdisable,
      --  Radio is in the Tx Ramp Up state.
      Txru,
      --  Radio is in the Tx Idle state.
      Txidle,
      --  Radio is in the Tx state.
      Tx,
      --  Radio is in the Tx Disable state.
      Txdisable)
     with Size => 4;
   for STATE_Field use
     (Disabled => 0,
      Rxru => 1,
      Rxidle => 2,
      Rx => 3,
      Rxdisable => 4,
      Txru => 9,
      Txidle => 10,
      Tx => 11,
      Txdisable => 12);

   --  Current radio state.
   type STATE_Register is record
      --  Read-only. Current radio state.
      STATE         : STATE_Field;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STATE_Register use record
      STATE         at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --------------------------
   -- DATAWHITEIV_Register --
   --------------------------

   subtype DATAWHITEIV_DATAWHITEIV_Field is nrf51.UInt7;

   --  Data whitening initial value.
   type DATAWHITEIV_Register is record
      --  Data whitening initial value. Bit 0 corresponds to Position 0 of the
      --  LSFR, Bit 1 to position 5... Decision point: TXEN or RXEN task.
      DATAWHITEIV   : DATAWHITEIV_DATAWHITEIV_Field := 16#40#;
      --  unspecified
      Reserved_7_31 : nrf51.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DATAWHITEIV_Register use record
      DATAWHITEIV   at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Device address base segment.

   --  Device address base segment.
   type DAB_Registers is array (0 .. 7) of nrf51.Word;

   ------------------
   -- DAP_Register --
   ------------------

   subtype DAP_DAP_Field is nrf51.Short;

   --  Device address prefix.
   type DAP_Register is record
      --  Device address prefix.
      DAP            : DAP_DAP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : nrf51.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DAP_Register use record
      DAP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Device address prefix.
   type DAP_Registers is array (0 .. 7) of DAP_Register;

   --------------------
   -- DACNF_Register --
   --------------------

   --  Enable or disable device address matching using device address 0.
   type ENA0_Field is
     (
      --  Disabled.
      Disabled,
      --  Enabled.
      Enabled)
     with Size => 1;
   for ENA0_Field use
     (Disabled => 0,
      Enabled => 1);

   ---------------
   -- DACNF.ENA --
   ---------------

   --  DACNF_ENA array
   type DACNF_ENA_Field_Array is array (0 .. 7) of ENA0_Field
     with Component_Size => 1, Size => 8;

   --  Type definition for DACNF_ENA
   type DACNF_ENA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENA as a value
            Val : nrf51.Byte;
         when True =>
            --  ENA as an array
            Arr : DACNF_ENA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for DACNF_ENA_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   -----------------
   -- DACNF.TXADD --
   -----------------

   --  DACNF_TXADD array element
   subtype DACNF_TXADD_Element is nrf51.Bit;

   --  DACNF_TXADD array
   type DACNF_TXADD_Field_Array is array (0 .. 7) of DACNF_TXADD_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for DACNF_TXADD
   type DACNF_TXADD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TXADD as a value
            Val : nrf51.Byte;
         when True =>
            --  TXADD as an array
            Arr : DACNF_TXADD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for DACNF_TXADD_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Device address match configuration.
   type DACNF_Register is record
      --  Enable or disable device address matching using device address 0.
      ENA            : DACNF_ENA_Field := (As_Array => False, Val => 16#0#);
      --  TxAdd for device address 0.
      TXADD          : DACNF_TXADD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : nrf51.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DACNF_Register use record
      ENA            at 0 range 0 .. 7;
      TXADD          at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------------
   -- OVERRIDE4_Register --
   ------------------------

   subtype OVERRIDE4_OVERRIDE4_Field is nrf51.UInt28;

   --  Enable or disable override of default trim values.
   type ENABLE_Field is
     (
      --  Override trim values disabled.
      Disabled,
      --  Override trim values enabled.
      Enabled)
     with Size => 1;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Trim value override register 4.
   type OVERRIDE4_Register is record
      --  Trim value override 4.
      OVERRIDE4      : OVERRIDE4_OVERRIDE4_Field := 16#0#;
      --  unspecified
      Reserved_28_30 : nrf51.UInt3 := 16#0#;
      --  Enable or disable override of default trim values.
      ENABLE         : ENABLE_Field := Disabled;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OVERRIDE4_Register use record
      OVERRIDE4      at 0 range 0 .. 27;
      Reserved_28_30 at 0 range 28 .. 30;
      ENABLE         at 0 range 31 .. 31;
   end record;

   --------------------
   -- POWER_Register --
   --------------------

   --  Peripheral power control.
   type POWER_Field is
     (
      --  Module power disabled.
      Disabled,
      --  Module power enabled.
      Enabled)
     with Size => 1;
   for POWER_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Peripheral power control.
   type POWER_Register is record
      --  Peripheral power control.
      POWER         : POWER_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_Register use record
      POWER         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  The radio.
   type RADIO_Peripheral is record
      --  Enable radio in TX mode.
      TASKS_TXEN      : nrf51.Word;
      --  Enable radio in RX mode.
      TASKS_RXEN      : nrf51.Word;
      --  Start radio.
      TASKS_START     : nrf51.Word;
      --  Stop radio.
      TASKS_STOP      : nrf51.Word;
      --  Disable radio.
      TASKS_DISABLE   : nrf51.Word;
      --  Start the RSSI and take one sample of the receive signal strength.
      TASKS_RSSISTART : nrf51.Word;
      --  Stop the RSSI measurement.
      TASKS_RSSISTOP  : nrf51.Word;
      --  Start the bit counter.
      TASKS_BCSTART   : nrf51.Word;
      --  Stop the bit counter.
      TASKS_BCSTOP    : nrf51.Word;
      --  Ready event.
      EVENTS_READY    : nrf51.Word;
      --  Address event.
      EVENTS_ADDRESS  : nrf51.Word;
      --  Payload event.
      EVENTS_PAYLOAD  : nrf51.Word;
      --  End event.
      EVENTS_END      : nrf51.Word;
      --  Disable event.
      EVENTS_DISABLED : nrf51.Word;
      --  A device address match occurred on the last received packet.
      EVENTS_DEVMATCH : nrf51.Word;
      --  No device address match occurred on the last received packet.
      EVENTS_DEVMISS  : nrf51.Word;
      --  Sampling of the receive signal strength complete. A new RSSI sample
      --  is ready for readout at the RSSISAMPLE register.
      EVENTS_RSSIEND  : nrf51.Word;
      --  Bit counter reached bit count value specified in BCC register.
      EVENTS_BCMATCH  : nrf51.Word;
      --  Shortcuts for the radio.
      SHORTS          : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET        : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR        : INTENCLR_Register;
      --  CRC status of received packet.
      CRCSTATUS       : CRCSTATUS_Register;
      --  Received address.
      RXMATCH         : RXMATCH_Register;
      --  Received CRC.
      RXCRC           : RXCRC_Register;
      --  Device address match index.
      DAI             : DAI_Register;
      --  Packet pointer. Decision point: START task.
      PACKETPTR       : nrf51.Word;
      --  Frequency.
      FREQUENCY       : FREQUENCY_Register;
      --  Output power.
      TXPOWER         : TXPOWER_Register;
      --  Data rate and modulation.
      MODE            : MODE_Register;
      --  Packet configuration 0.
      PCNF0           : PCNF0_Register;
      --  Packet configuration 1.
      PCNF1           : PCNF1_Register;
      --  Radio base address 0. Decision point: START task.
      BASE0           : nrf51.Word;
      --  Radio base address 1. Decision point: START task.
      BASE1           : nrf51.Word;
      --  Prefixes bytes for logical addresses 0 to 3.
      PREFIX0         : PREFIX0_Register;
      --  Prefixes bytes for logical addresses 4 to 7.
      PREFIX1         : PREFIX1_Register;
      --  Transmit address select.
      TXADDRESS       : TXADDRESS_Register;
      --  Receive address select.
      RXADDRESSES     : RXADDRESSES_Register;
      --  CRC configuration.
      CRCCNF          : CRCCNF_Register;
      --  CRC polynomial.
      CRCPOLY         : CRCPOLY_Register;
      --  CRC initial value.
      CRCINIT         : CRCINIT_Register;
      --  Test features enable register.
      TEST            : TEST_Register;
      --  Inter Frame Spacing in microseconds.
      TIFS            : TIFS_Register;
      --  RSSI sample.
      RSSISAMPLE      : RSSISAMPLE_Register;
      --  Current radio state.
      STATE           : STATE_Register;
      --  Data whitening initial value.
      DATAWHITEIV     : DATAWHITEIV_Register;
      --  Bit counter compare.
      BCC             : nrf51.Word;
      --  Device address base segment.
      DAB             : DAB_Registers;
      --  Device address prefix.
      DAP             : DAP_Registers;
      --  Device address match configuration.
      DACNF           : DACNF_Register;
      --  Trim value override register 0.
      OVERRIDE0       : nrf51.Word;
      --  Trim value override register 1.
      OVERRIDE1       : nrf51.Word;
      --  Trim value override register 2.
      OVERRIDE2       : nrf51.Word;
      --  Trim value override register 3.
      OVERRIDE3       : nrf51.Word;
      --  Trim value override register 4.
      OVERRIDE4       : OVERRIDE4_Register;
      --  Peripheral power control.
      POWER           : POWER_Register;
   end record
     with Volatile;

   for RADIO_Peripheral use record
      TASKS_TXEN      at 0 range 0 .. 31;
      TASKS_RXEN      at 4 range 0 .. 31;
      TASKS_START     at 8 range 0 .. 31;
      TASKS_STOP      at 12 range 0 .. 31;
      TASKS_DISABLE   at 16 range 0 .. 31;
      TASKS_RSSISTART at 20 range 0 .. 31;
      TASKS_RSSISTOP  at 24 range 0 .. 31;
      TASKS_BCSTART   at 28 range 0 .. 31;
      TASKS_BCSTOP    at 32 range 0 .. 31;
      EVENTS_READY    at 256 range 0 .. 31;
      EVENTS_ADDRESS  at 260 range 0 .. 31;
      EVENTS_PAYLOAD  at 264 range 0 .. 31;
      EVENTS_END      at 268 range 0 .. 31;
      EVENTS_DISABLED at 272 range 0 .. 31;
      EVENTS_DEVMATCH at 276 range 0 .. 31;
      EVENTS_DEVMISS  at 280 range 0 .. 31;
      EVENTS_RSSIEND  at 284 range 0 .. 31;
      EVENTS_BCMATCH  at 296 range 0 .. 31;
      SHORTS          at 512 range 0 .. 31;
      INTENSET        at 772 range 0 .. 31;
      INTENCLR        at 776 range 0 .. 31;
      CRCSTATUS       at 1024 range 0 .. 31;
      RXMATCH         at 1032 range 0 .. 31;
      RXCRC           at 1036 range 0 .. 31;
      DAI             at 1040 range 0 .. 31;
      PACKETPTR       at 1284 range 0 .. 31;
      FREQUENCY       at 1288 range 0 .. 31;
      TXPOWER         at 1292 range 0 .. 31;
      MODE            at 1296 range 0 .. 31;
      PCNF0           at 1300 range 0 .. 31;
      PCNF1           at 1304 range 0 .. 31;
      BASE0           at 1308 range 0 .. 31;
      BASE1           at 1312 range 0 .. 31;
      PREFIX0         at 1316 range 0 .. 31;
      PREFIX1         at 1320 range 0 .. 31;
      TXADDRESS       at 1324 range 0 .. 31;
      RXADDRESSES     at 1328 range 0 .. 31;
      CRCCNF          at 1332 range 0 .. 31;
      CRCPOLY         at 1336 range 0 .. 31;
      CRCINIT         at 1340 range 0 .. 31;
      TEST            at 1344 range 0 .. 31;
      TIFS            at 1348 range 0 .. 31;
      RSSISAMPLE      at 1352 range 0 .. 31;
      STATE           at 1360 range 0 .. 31;
      DATAWHITEIV     at 1364 range 0 .. 31;
      BCC             at 1376 range 0 .. 31;
      DAB             at 1536 range 0 .. 255;
      DAP             at 1568 range 0 .. 255;
      DACNF           at 1600 range 0 .. 31;
      OVERRIDE0       at 1828 range 0 .. 31;
      OVERRIDE1       at 1832 range 0 .. 31;
      OVERRIDE2       at 1836 range 0 .. 31;
      OVERRIDE3       at 1840 range 0 .. 31;
      OVERRIDE4       at 1844 range 0 .. 31;
      POWER           at 4092 range 0 .. 31;
   end record;

   --  The radio.
   RADIO_Periph : aliased RADIO_Peripheral
     with Import, Address => RADIO_Base;

end nrf51.RADIO;
