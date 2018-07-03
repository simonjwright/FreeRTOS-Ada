--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.NVMC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --------------------
   -- READY_Register --
   --------------------

   --  NVMC ready.
   type READY_Field is
     (
      --  NVMC is busy (on-going write or erase operation).
      Busy,
      --  NVMC is ready.
      Ready)
     with Size => 1;
   for READY_Field use
     (Busy => 0,
      Ready => 1);

   --  Ready flag.
   type READY_Register is record
      --  Read-only. NVMC ready.
      READY         : READY_Field;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for READY_Register use record
      READY         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- CONFIG_Register --
   ---------------------

   --  Program write enable.
   type WEN_Field is
     (
      --  Read only access.
      Ren,
      --  Write enabled.
      Wen,
      --  Erase enabled.
      Een)
     with Size => 2;
   for WEN_Field use
     (Ren => 0,
      Wen => 1,
      Een => 2);

   --  Configuration register.
   type CONFIG_Register is record
      --  Program write enable.
      WEN           : WEN_Field := Ren;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CONFIG_Register use record
      WEN           at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------------
   -- ERASEALL_Register --
   -----------------------

   --  Starts the erasing of all user NVM (code region 0/1 and UICR registers).
   type ERASEALL_Field is
     (
      --  No operation.
      Nooperation,
      --  Start chip erase.
      Erase)
     with Size => 1;
   for ERASEALL_Field use
     (Nooperation => 0,
      Erase => 1);

   --  Register for erasing all non-volatile user memory.
   type ERASEALL_Register is record
      --  Starts the erasing of all user NVM (code region 0/1 and UICR
      --  registers).
      ERASEALL      : ERASEALL_Field := Nooperation;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ERASEALL_Register use record
      ERASEALL      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- ERASEUICR_Register --
   ------------------------

   --  It can only be used when all contents of code region 1 are erased.
   type ERASEUICR_Field is
     (
      --  No operation.
      Nooperation,
      --  Start UICR erase.
      Erase)
     with Size => 1;
   for ERASEUICR_Field use
     (Nooperation => 0,
      Erase => 1);

   --  Register for start erasing User Information Congfiguration Registers.
   type ERASEUICR_Register is record
      --  It can only be used when all contents of code region 1 are erased.
      ERASEUICR     : ERASEUICR_Field := Nooperation;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ERASEUICR_Register use record
      ERASEUICR     at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type NVMC_Disc is
     (
      Age,
      Cr1);

   --  Non Volatile Memory Controller.
   type NVMC_Peripheral
     (Discriminent : NVMC_Disc := Age)
   is record
      --  Ready flag.
      READY     : READY_Register;
      --  Configuration register.
      CONFIG    : CONFIG_Register;
      --  Register for erasing all non-volatile user memory.
      ERASEALL  : ERASEALL_Register;
      --  Register for erasing a protected non-volatile memory page.
      ERASEPCR0 : nrf51.Word;
      --  Register for start erasing User Information Congfiguration Registers.
      ERASEUICR : ERASEUICR_Register;
      case Discriminent is
         when Age =>
            --  Register for erasing a non-protected non-volatile memory page.
            ERASEPAGE : nrf51.Word;
         when Cr1 =>
            --  Register for erasing a non-protected non-volatile memory page.
            ERASEPCR1 : nrf51.Word;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for NVMC_Peripheral use record
      READY     at 1024 range 0 .. 31;
      CONFIG    at 1284 range 0 .. 31;
      ERASEALL  at 1292 range 0 .. 31;
      ERASEPCR0 at 1296 range 0 .. 31;
      ERASEUICR at 1300 range 0 .. 31;
      ERASEPAGE at 1288 range 0 .. 31;
      ERASEPCR1 at 1288 range 0 .. 31;
   end record;

   --  Non Volatile Memory Controller.
   NVMC_Periph : aliased NVMC_Peripheral
     with Import, Address => NVMC_Base;

end nrf51.NVMC;
