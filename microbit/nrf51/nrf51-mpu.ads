--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.MPU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --------------------
   -- PERR0_Register --
   --------------------

   --  POWER_CLOCK region configuration.
   type POWER_CLOCK_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for POWER_CLOCK_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  RADIO region configuration.
   type RADIO_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for RADIO_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  UART0 region configuration.
   type UART0_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for UART0_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  SPI0 and TWI0 region configuration.
   type SPI0_TWI0_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for SPI0_TWI0_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  SPI1 and TWI1 region configuration.
   type SPI1_TWI1_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for SPI1_TWI1_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  GPIOTE region configuration.
   type GPIOTE_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for GPIOTE_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  ADC region configuration.
   type ADC_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for ADC_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  TIMER0 region configuration.
   type TIMER0_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for TIMER0_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   -----------------
   -- PERR0.TIMER --
   -----------------

   --  PERR0_TIMER array
   type PERR0_TIMER_Field_Array is array (0 .. 2) of TIMER0_Field
     with Component_Size => 1, Size => 3;

   --  Type definition for PERR0_TIMER
   type PERR0_TIMER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TIMER as a value
            Val : nrf51.UInt3;
         when True =>
            --  TIMER as an array
            Arr : PERR0_TIMER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PERR0_TIMER_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  RTC0 region configuration.
   type RTC0_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for RTC0_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  TEMP region configuration.
   type TEMP_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for TEMP_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  RNG region configuration.
   type RNG_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for RNG_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  ECB region configuration.
   type ECB_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for ECB_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  CCM and AAR region configuration.
   type CCM_AAR_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for CCM_AAR_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  WDT region configuration.
   type WDT_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for WDT_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  RTC1 region configuration.
   type RTC1_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for RTC1_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  QDEC region configuration.
   type QDEC_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for QDEC_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  LPCOMP region configuration.
   type LPCOMP_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for LPCOMP_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  NVMC region configuration.
   type NVMC_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for NVMC_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  PPI region configuration.
   type PPI_Field is
     (
      --  Peripheral configured in region 1.
      Inregion1,
      --  Peripheral configured in region 0.
      Inregion0)
     with Size => 1;
   for PPI_Field use
     (Inregion1 => 0,
      Inregion0 => 1);

   --  Configuration of peripherals in mpu regions.
   type PERR0_Register is record
      --  POWER_CLOCK region configuration.
      POWER_CLOCK    : POWER_CLOCK_Field := Inregion1;
      --  RADIO region configuration.
      RADIO          : RADIO_Field := Inregion1;
      --  UART0 region configuration.
      UART0          : UART0_Field := Inregion1;
      --  SPI0 and TWI0 region configuration.
      SPI0_TWI0      : SPI0_TWI0_Field := Inregion1;
      --  SPI1 and TWI1 region configuration.
      SPI1_TWI1      : SPI1_TWI1_Field := Inregion1;
      --  unspecified
      Reserved_5_5   : nrf51.Bit := 16#0#;
      --  GPIOTE region configuration.
      GPIOTE         : GPIOTE_Field := Inregion1;
      --  ADC region configuration.
      ADC            : ADC_Field := Inregion1;
      --  TIMER0 region configuration.
      TIMER          : PERR0_TIMER_Field := (As_Array => False, Val => 16#0#);
      --  RTC0 region configuration.
      RTC0           : RTC0_Field := Inregion1;
      --  TEMP region configuration.
      TEMP           : TEMP_Field := Inregion1;
      --  RNG region configuration.
      RNG            : RNG_Field := Inregion1;
      --  ECB region configuration.
      ECB            : ECB_Field := Inregion1;
      --  CCM and AAR region configuration.
      CCM_AAR        : CCM_AAR_Field := Inregion1;
      --  WDT region configuration.
      WDT            : WDT_Field := Inregion1;
      --  RTC1 region configuration.
      RTC1           : RTC1_Field := Inregion1;
      --  QDEC region configuration.
      QDEC           : QDEC_Field := Inregion1;
      --  LPCOMP region configuration.
      LPCOMP         : LPCOMP_Field := Inregion1;
      --  unspecified
      Reserved_20_29 : nrf51.UInt10 := 16#0#;
      --  NVMC region configuration.
      NVMC           : NVMC_Field := Inregion1;
      --  PPI region configuration.
      PPI            : PPI_Field := Inregion1;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PERR0_Register use record
      POWER_CLOCK    at 0 range 0 .. 0;
      RADIO          at 0 range 1 .. 1;
      UART0          at 0 range 2 .. 2;
      SPI0_TWI0      at 0 range 3 .. 3;
      SPI1_TWI1      at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      GPIOTE         at 0 range 6 .. 6;
      ADC            at 0 range 7 .. 7;
      TIMER          at 0 range 8 .. 10;
      RTC0           at 0 range 11 .. 11;
      TEMP           at 0 range 12 .. 12;
      RNG            at 0 range 13 .. 13;
      ECB            at 0 range 14 .. 14;
      CCM_AAR        at 0 range 15 .. 15;
      WDT            at 0 range 16 .. 16;
      RTC1           at 0 range 17 .. 17;
      QDEC           at 0 range 18 .. 18;
      LPCOMP         at 0 range 19 .. 19;
      Reserved_20_29 at 0 range 20 .. 29;
      NVMC           at 0 range 30 .. 30;
      PPI            at 0 range 31 .. 31;
   end record;

   -------------------------
   -- PROTENSET0_Register --
   -------------------------

   --  Protection enable for region 0.
   type PROTREG0_Field is
     (
      --  Protection disabled.
      Disabled,
      --  Protection enabled.
      Enabled)
     with Size => 1;
   for PROTREG0_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Protection enable for region 0.
   type PROTREG0_Field_1 is
     (
      --  Reset value for the field
      Protreg0_Field_Reset,
      --  Enable protection on write.
      Set)
     with Size => 1;
   for PROTREG0_Field_1 use
     (Protreg0_Field_Reset => 0,
      Set => 1);

   --  PROTENSET0_PROTREG array
   type PROTENSET0_PROTREG_Field_Array is array (0 .. 31) of PROTREG0_Field_1
     with Component_Size => 1, Size => 32;

   --  Erase and write protection bit enable set register.
   type PROTENSET0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROTREG as a value
            Val : nrf51.Word;
         when True =>
            --  PROTREG as an array
            Arr : PROTENSET0_PROTREG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for PROTENSET0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------------
   -- PROTENSET1_Register --
   -------------------------

   --  Protection enable for region 32.
   type PROTREG32_Field is
     (
      --  Protection disabled.
      Disabled,
      --  Protection enabled.
      Enabled)
     with Size => 1;
   for PROTREG32_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Protection enable for region 32.
   type PROTREG32_Field_1 is
     (
      --  Reset value for the field
      Protreg32_Field_Reset,
      --  Enable protection on write.
      Set)
     with Size => 1;
   for PROTREG32_Field_1 use
     (Protreg32_Field_Reset => 0,
      Set => 1);

   --  PROTENSET1_PROTREG array
   type PROTENSET1_PROTREG_Field_Array is array (32 .. 63)
     of PROTREG32_Field_1
     with Component_Size => 1, Size => 32;

   --  Erase and write protection bit enable set register.
   type PROTENSET1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PROTREG as a value
            Val : nrf51.Word;
         when True =>
            --  PROTREG as an array
            Arr : PROTENSET1_PROTREG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for PROTENSET1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -----------------------------
   -- DISABLEINDEBUG_Register --
   -----------------------------

   --  Disable protection mechanism in debug mode.
   type DISABLEINDEBUG_Field is
     (
      --  Protection enabled.
      Enabled,
      --  Protection disabled.
      Disabled)
     with Size => 1;
   for DISABLEINDEBUG_Field use
     (Enabled => 0,
      Disabled => 1);

   --  Disable erase and write protection mechanism in debug mode.
   type DISABLEINDEBUG_Register is record
      --  Disable protection mechanism in debug mode.
      DISABLEINDEBUG : DISABLEINDEBUG_Field := Disabled;
      --  unspecified
      Reserved_1_31  : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DISABLEINDEBUG_Register use record
      DISABLEINDEBUG at 0 range 0 .. 0;
      Reserved_1_31  at 0 range 1 .. 31;
   end record;

   ----------------------------
   -- PROTBLOCKSIZE_Register --
   ----------------------------

   --  Erase and write protection block size.
   type PROTBLOCKSIZE_Field is
     (
      --  Erase and write protection block size is 4k.
      PROTBLOCKSIZE_Field_4K)
     with Size => 2;
   for PROTBLOCKSIZE_Field use
     (PROTBLOCKSIZE_Field_4K => 0);

   --  Erase and write protection block size.
   type PROTBLOCKSIZE_Register is record
      --  Erase and write protection block size.
      PROTBLOCKSIZE : PROTBLOCKSIZE_Field := PROTBLOCKSIZE_Field_4K;
      --  unspecified
      Reserved_2_31 : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PROTBLOCKSIZE_Register use record
      PROTBLOCKSIZE at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Memory Protection Unit.
   type MPU_Peripheral is record
      --  Configuration of peripherals in mpu regions.
      PERR0          : PERR0_Register;
      --  Length of RAM region 0.
      RLENR0         : nrf51.Word;
      --  Erase and write protection bit enable set register.
      PROTENSET0     : PROTENSET0_Register;
      --  Erase and write protection bit enable set register.
      PROTENSET1     : PROTENSET1_Register;
      --  Disable erase and write protection mechanism in debug mode.
      DISABLEINDEBUG : DISABLEINDEBUG_Register;
      --  Erase and write protection block size.
      PROTBLOCKSIZE  : PROTBLOCKSIZE_Register;
   end record
     with Volatile;

   for MPU_Peripheral use record
      PERR0          at 1320 range 0 .. 31;
      RLENR0         at 1324 range 0 .. 31;
      PROTENSET0     at 1536 range 0 .. 31;
      PROTENSET1     at 1540 range 0 .. 31;
      DISABLEINDEBUG at 1544 range 0 .. 31;
      PROTBLOCKSIZE  at 1548 range 0 .. 31;
   end record;

   --  Memory Protection Unit.
   MPU_Periph : aliased MPU_Peripheral
     with Import, Address => MPU_Base;

end nrf51.MPU;
