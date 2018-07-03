--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.FICR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -------------------
   -- PPFC_Register --
   -------------------

   --  Pre-programmed factory code present.
   type PPFC_Field is
     (
      --  Present.
      Present,
      --  Not present.
      Notpresent)
     with Size => 8;
   for PPFC_Field use
     (Present => 0,
      Notpresent => 255);

   --  Pre-programmed factory code present.
   type PPFC_Register is record
      --  Read-only. Pre-programmed factory code present.
      PPFC          : PPFC_Field;
      --  unspecified
      Reserved_8_31 : nrf51.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PPFC_Register use record
      PPFC          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------------
   -- CONFIGID_Register --
   -----------------------

   subtype CONFIGID_HWID_Field is nrf51.Short;
   subtype CONFIGID_FWID_Field is nrf51.Short;

   --  Configuration identifier.
   type CONFIGID_Register is record
      --  Read-only. Hardware Identification Number.
      HWID : CONFIGID_HWID_Field;
      --  Read-only. Firmware Identification Number pre-loaded into the flash.
      FWID : CONFIGID_FWID_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIGID_Register use record
      HWID at 0 range 0 .. 15;
      FWID at 0 range 16 .. 31;
   end record;

   --  Device identifier.

   --  Device identifier.
   type DEVICEID_Registers is array (0 .. 1) of nrf51.Word;

   --  Encryption root.

   --  Encryption root.
   type ER_Registers is array (0 .. 3) of nrf51.Word;

   --  Identity root.

   --  Identity root.
   type IR_Registers is array (0 .. 3) of nrf51.Word;

   -----------------------------
   -- DEVICEADDRTYPE_Register --
   -----------------------------

   --  Device address type.
   type DEVICEADDRTYPE_Field is
     (
      --  Public address.
      Public,
      --  Random address.
      Random)
     with Size => 1;
   for DEVICEADDRTYPE_Field use
     (Public => 0,
      Random => 1);

   --  Device address type.
   type DEVICEADDRTYPE_Register is record
      --  Read-only. Device address type.
      DEVICEADDRTYPE : DEVICEADDRTYPE_Field;
      --  unspecified
      Reserved_1_31  : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEVICEADDRTYPE_Register use record
      DEVICEADDRTYPE at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   --  Device address.

   --  Device address.
   type DEVICEADDR_Registers is array (0 .. 1) of nrf51.Word;

   -------------------------
   -- OVERRIDEEN_Register --
   -------------------------

   --  Override default values for NRF_1Mbit mode.
   type NRF_1MBIT_Field is
     (
      --  Override the default values for NRF_1Mbit mode.
      Override,
      --  Do not override the default values for NRF_1Mbit mode.
      Notoverride)
     with Size => 1;
   for NRF_1MBIT_Field use
     (Override => 0,
      Notoverride => 1);

   --  Override default values for BLE_1Mbit mode.
   type BLE_1MBIT_Field is
     (
      --  Override the default values for BLE_1Mbit mode.
      Override,
      --  Do not override the default values for BLE_1Mbit mode.
      Notoverride)
     with Size => 1;
   for BLE_1MBIT_Field use
     (Override => 0,
      Notoverride => 1);

   --  Radio calibration override enable.
   type OVERRIDEEN_Register is record
      --  Read-only. Override default values for NRF_1Mbit mode.
      NRF_1MBIT     : NRF_1MBIT_Field;
      --  unspecified
      Reserved_1_2  : nrf51.UInt2;
      --  Read-only. Override default values for BLE_1Mbit mode.
      BLE_1MBIT     : BLE_1MBIT_Field;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OVERRIDEEN_Register use record
      NRF_1MBIT     at 0 range 0 .. 0;
      Reserved_1_2  at 0 range 1 .. 2;
      BLE_1MBIT     at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Override values for the OVERRIDEn registers in RADIO for NRF_1Mbit mode.

   --  Override values for the OVERRIDEn registers in RADIO for NRF_1Mbit mode.
   type NRF_1MBIT_Registers is array (0 .. 4) of nrf51.Word;

   --  Override values for the OVERRIDEn registers in RADIO for BLE_1Mbit mode.

   --  Override values for the OVERRIDEn registers in RADIO for BLE_1Mbit mode.
   type BLE_1MBIT_Registers is array (0 .. 4) of nrf51.Word;

   -----------------
   -- Peripherals --
   -----------------

   --  Factory Information Configuration.
   type FICR_Peripheral is record
      --  Code memory page size in bytes.
      CODEPAGESIZE   : nrf51.Word;
      --  Code memory size in pages.
      CODESIZE       : nrf51.Word;
      --  Length of code region 0 in bytes.
      CLENR0         : nrf51.Word;
      --  Pre-programmed factory code present.
      PPFC           : PPFC_Register;
      --  Number of individualy controllable RAM blocks.
      NUMRAMBLOCK    : nrf51.Word;
      --  Size of RAM blocks in bytes.
      SIZERAMBLOCKS  : nrf51.Word;
      --  Configuration identifier.
      CONFIGID       : CONFIGID_Register;
      --  Device identifier.
      DEVICEID       : DEVICEID_Registers;
      --  Encryption root.
      ER             : ER_Registers;
      --  Identity root.
      IR             : IR_Registers;
      --  Device address type.
      DEVICEADDRTYPE : DEVICEADDRTYPE_Register;
      --  Device address.
      DEVICEADDR     : DEVICEADDR_Registers;
      --  Radio calibration override enable.
      OVERRIDEEN     : OVERRIDEEN_Register;
      --  Override values for the OVERRIDEn registers in RADIO for NRF_1Mbit
      --  mode.
      NRF_1MBIT      : NRF_1MBIT_Registers;
      --  Override values for the OVERRIDEn registers in RADIO for BLE_1Mbit
      --  mode.
      BLE_1MBIT      : BLE_1MBIT_Registers;
   end record
     with Volatile;

   for FICR_Peripheral use record
      CODEPAGESIZE   at 16 range 0 .. 31;
      CODESIZE       at 20 range 0 .. 31;
      CLENR0         at 40 range 0 .. 31;
      PPFC           at 44 range 0 .. 31;
      NUMRAMBLOCK    at 52 range 0 .. 31;
      SIZERAMBLOCKS  at 56 range 0 .. 31;
      CONFIGID       at 92 range 0 .. 31;
      DEVICEID       at 96 range 0 .. 63;
      ER             at 128 range 0 .. 127;
      IR             at 144 range 0 .. 127;
      DEVICEADDRTYPE at 160 range 0 .. 31;
      DEVICEADDR     at 164 range 0 .. 63;
      OVERRIDEEN     at 172 range 0 .. 31;
      NRF_1MBIT      at 176 range 0 .. 159;
      BLE_1MBIT      at 236 range 0 .. 159;
   end record;

   --  Factory Information Configuration.
   FICR_Periph : aliased FICR_Peripheral
     with Import, Address => FICR_Base;

end nrf51.FICR;
