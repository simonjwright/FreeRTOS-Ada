--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

--  Chip Identifier
package ATSAM3X8E.CHIPID is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -------------------
   -- CIDR_Register --
   -------------------

   subtype CIDR_VERSION_Field is ATSAM3X8E.UInt5;

   --  Embedded Processor
   type EPROC_Field is
     (
      --  Reset value for the field
      Eproc_Field_Reset,
      --  ARM946ES
      Arm946Es,
      --  ARM7TDMI
      Arm7Tdmi,
      --  Cortex-M3
      Cm3,
      --  ARM920T
      Arm920T,
      --  ARM926EJS
      Arm926Ejs,
      --  Cortex-A5
      Ca5,
      --  Cortex-M4
      Cm4)
     with Size => 3;
   for EPROC_Field use
     (Eproc_Field_Reset => 0,
      Arm946Es => 1,
      Arm7Tdmi => 2,
      Cm3 => 3,
      Arm920T => 4,
      Arm926Ejs => 5,
      Ca5 => 6,
      Cm4 => 7);

   --  Nonvolatile Program Memory Size
   type NVPSIZ_Field is
     (
      --  None
      None,
      --  8K bytes
      NVPSIZ_Field_8K,
      --  16K bytes
      NVPSIZ_Field_16K,
      --  32K bytes
      NVPSIZ_Field_32K,
      --  64K bytes
      NVPSIZ_Field_64K,
      --  128K bytes
      NVPSIZ_Field_128K,
      --  256K bytes
      NVPSIZ_Field_256K,
      --  512K bytes
      NVPSIZ_Field_512K,
      --  1024K bytes
      NVPSIZ_Field_1024K,
      --  2048K bytes
      NVPSIZ_Field_2048K)
     with Size => 4;
   for NVPSIZ_Field use
     (None => 0,
      NVPSIZ_Field_8K => 1,
      NVPSIZ_Field_16K => 2,
      NVPSIZ_Field_32K => 3,
      NVPSIZ_Field_64K => 5,
      NVPSIZ_Field_128K => 7,
      NVPSIZ_Field_256K => 9,
      NVPSIZ_Field_512K => 10,
      NVPSIZ_Field_1024K => 12,
      NVPSIZ_Field_2048K => 14);

   -----------------
   -- CIDR.NVPSIZ --
   -----------------

   --  CIDR_NVPSIZ array
   type CIDR_NVPSIZ_Field_Array is array (0 .. 1) of NVPSIZ_Field
     with Component_Size => 4, Size => 8;

   --  Type definition for CIDR_NVPSIZ
   type CIDR_NVPSIZ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  NVPSIZ as a value
            Val : ATSAM3X8E.Byte;
         when True =>
            --  NVPSIZ as an array
            Arr : CIDR_NVPSIZ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for CIDR_NVPSIZ_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Internal SRAM Size
   type SRAMSIZ_Field is
     (
      --  48K bytes
      SRAMSIZ_Field_48K,
      --  1K bytes
      SRAMSIZ_Field_1K,
      --  2K bytes
      SRAMSIZ_Field_2K,
      --  6K bytes
      SRAMSIZ_Field_6K,
      --  24K bytes
      SRAMSIZ_Field_24K,
      --  4K bytes
      SRAMSIZ_Field_4K,
      --  80K bytes
      SRAMSIZ_Field_80K,
      --  160K bytes
      SRAMSIZ_Field_160K,
      --  8K bytes
      SRAMSIZ_Field_8K,
      --  16K bytes
      SRAMSIZ_Field_16K,
      --  32K bytes
      SRAMSIZ_Field_32K,
      --  64K bytes
      SRAMSIZ_Field_64K,
      --  128K bytes
      SRAMSIZ_Field_128K,
      --  256K bytes
      SRAMSIZ_Field_256K,
      --  96K bytes
      SRAMSIZ_Field_96K,
      --  512K bytes
      SRAMSIZ_Field_512K)
     with Size => 4;
   for SRAMSIZ_Field use
     (SRAMSIZ_Field_48K => 0,
      SRAMSIZ_Field_1K => 1,
      SRAMSIZ_Field_2K => 2,
      SRAMSIZ_Field_6K => 3,
      SRAMSIZ_Field_24K => 4,
      SRAMSIZ_Field_4K => 5,
      SRAMSIZ_Field_80K => 6,
      SRAMSIZ_Field_160K => 7,
      SRAMSIZ_Field_8K => 8,
      SRAMSIZ_Field_16K => 9,
      SRAMSIZ_Field_32K => 10,
      SRAMSIZ_Field_64K => 11,
      SRAMSIZ_Field_128K => 12,
      SRAMSIZ_Field_256K => 13,
      SRAMSIZ_Field_96K => 14,
      SRAMSIZ_Field_512K => 15);

   --  Architecture Identifier
   type ARCH_Field is
     (
      --  Reset value for the field
      Arch_Field_Reset,
      --  AT91SAM9xx Series
      At91Sam9XX,
      --  AT91SAM9XExx Series
      At91Sam9Xexx,
      --  AT91x34 Series
      At91X34,
      --  CAP7 Series
      Cap7,
      --  CAP9 Series
      Cap9,
      --  CAP11 Series
      Cap11,
      --  AT91x40 Series
      At91X40,
      --  AT91x42 Series
      At91X42,
      --  AT91x55 Series
      At91X55,
      --  AT91SAM7Axx Series
      At91Sam7Axx,
      --  AT91SAM7AQxx Series
      At91Sam7Aqxx,
      --  AT91x63 Series
      At91X63,
      --  AT91SAM7Sxx Series
      At91Sam7Sxx,
      --  AT91SAM7XCxx Series
      At91Sam7Xcxx,
      --  AT91SAM7SExx Series
      At91Sam7Sexx,
      --  AT91SAM7Lxx Series
      At91Sam7Lxx,
      --  AT91SAM7Xxx Series
      At91Sam7Xxx,
      --  AT91SAM7SLxx Series
      At91Sam7Slxx,
      --  SAM3UxC Series (100-pin version)
      Sam3Uxc,
      --  SAM3UxE Series (144-pin version)
      Sam3Uxe,
      --  SAM3AxC/SAM4AxC Series (100-pin version)
      Sam3Axc_Sam4Axc,
      --  SAM3XxC/SAM4XxC Series (100-pin version)
      Sam3Xxc_Sam4Xxc,
      --  SAM3XxE/SAM4XxE Series (144-pin version)
      Sam3Xxe_Sam4Xxe,
      --  SAM3XxG/SAM4XxG Series (208/217-pin version)
      Sam3Xxg_Sam4Xxg,
      --  SAM3SxA/SAM4SxA Series (48-pin version)
      Sam3Sxa_Sam4Sxa,
      --  SAM3SxB/SAM4SxB Series (64-pin version)
      Sam3Sxb_Sam4Sxb,
      --  SAM3SxC/SAM4SxC Series (100-pin version)
      Sam3Sxc_Sam4Sxc,
      --  AT91x92 Series
      At91X92,
      --  SAM3NxA Series (48-pin version)
      Sam3Nxa,
      --  SAM3NxB Series (64-pin version)
      Sam3Nxb,
      --  SAM3NxC Series (100-pin version)
      Sam3Nxc,
      --  SAM3SDxB Series (64-pin version)
      Sam3Sdxb,
      --  SAM3SDxC Series (100-pin version)
      Sam3Sdxc,
      --  SAM5A
      Sam5A,
      --  AT75Cxx Series
      At75Cxx)
     with Size => 8;
   for ARCH_Field use
     (Arch_Field_Reset => 0,
      At91Sam9XX => 25,
      At91Sam9Xexx => 41,
      At91X34 => 52,
      Cap7 => 55,
      Cap9 => 57,
      Cap11 => 59,
      At91X40 => 64,
      At91X42 => 66,
      At91X55 => 85,
      At91Sam7Axx => 96,
      At91Sam7Aqxx => 97,
      At91X63 => 99,
      At91Sam7Sxx => 112,
      At91Sam7Xcxx => 113,
      At91Sam7Sexx => 114,
      At91Sam7Lxx => 115,
      At91Sam7Xxx => 117,
      At91Sam7Slxx => 118,
      Sam3Uxc => 128,
      Sam3Uxe => 129,
      Sam3Axc_Sam4Axc => 131,
      Sam3Xxc_Sam4Xxc => 132,
      Sam3Xxe_Sam4Xxe => 133,
      Sam3Xxg_Sam4Xxg => 134,
      Sam3Sxa_Sam4Sxa => 136,
      Sam3Sxb_Sam4Sxb => 137,
      Sam3Sxc_Sam4Sxc => 138,
      At91X92 => 146,
      Sam3Nxa => 147,
      Sam3Nxb => 148,
      Sam3Nxc => 149,
      Sam3Sdxb => 153,
      Sam3Sdxc => 154,
      Sam5A => 165,
      At75Cxx => 240);

   --  Nonvolatile Program Memory Type
   type NVPTYP_Field is
     (
      --  ROM
      Rom,
      --  ROMless or on-chip Flash
      Romless,
      --  Embedded Flash Memory
      Flash,
      --  ROM and Embedded Flash MemoryNVPSIZ is ROM size NVPSIZ2 is Flash size
      Rom_Flash,
      --  SRAM emulating ROM
      Sram)
     with Size => 3;
   for NVPTYP_Field use
     (Rom => 0,
      Romless => 1,
      Flash => 2,
      Rom_Flash => 3,
      Sram => 4);

   subtype CIDR_EXT_Field is ATSAM3X8E.Bit;

   --  Chip ID Register
   type CIDR_Register is record
      --  Read-only. Version of the Device
      VERSION : CIDR_VERSION_Field := 16#0#;
      --  Read-only. Embedded Processor
      EPROC   : EPROC_Field := Eproc_Field_Reset;
      --  Read-only. Nonvolatile Program Memory Size
      NVPSIZ  : CIDR_NVPSIZ_Field := (As_Array => False, Val => 16#0#);
      --  Read-only. Internal SRAM Size
      SRAMSIZ : SRAMSIZ_Field := SRAMSIZ_Field_48K;
      --  Read-only. Architecture Identifier
      ARCH    : ARCH_Field := Arch_Field_Reset;
      --  Read-only. Nonvolatile Program Memory Type
      NVPTYP  : NVPTYP_Field := Rom;
      --  Read-only. Extension Flag
      EXT     : CIDR_EXT_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for CIDR_Register use record
      VERSION at 0 range 0 .. 4;
      EPROC   at 0 range 5 .. 7;
      NVPSIZ  at 0 range 8 .. 15;
      SRAMSIZ at 0 range 16 .. 19;
      ARCH    at 0 range 20 .. 27;
      NVPTYP  at 0 range 28 .. 30;
      EXT     at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Chip Identifier
   type CHIPID_Peripheral is record
      --  Chip ID Register
      CIDR : CIDR_Register;
      --  Chip ID Extension Register
      EXID : ATSAM3X8E.Word;
   end record
     with Volatile;

   for CHIPID_Peripheral use record
      CIDR at 0 range 0 .. 31;
      EXID at 4 range 0 .. 31;
   end record;

   --  Chip Identifier
   CHIPID_Periph : aliased CHIPID_Peripheral
     with Import, Address => CHIPID_Base;

end ATSAM3X8E.CHIPID;
