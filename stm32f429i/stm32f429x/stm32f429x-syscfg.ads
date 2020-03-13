pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F429x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F429x.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype MEMRM_MEM_MODE_Field is STM32F429x.UInt3;
   subtype MEMRM_FB_MODE_Field is STM32F429x.Bit;
   subtype MEMRM_SWP_FMC_Field is STM32F429x.UInt2;

   --  memory remap register
   type MEMRM_Register is record
      --  Memory mapping selection
      MEM_MODE       : MEMRM_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : STM32F429x.UInt5 := 16#0#;
      --  Flash bank mode selection
      FB_MODE        : MEMRM_FB_MODE_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : STM32F429x.Bit := 16#0#;
      --  FMC memory mapping swap
      SWP_FMC        : MEMRM_SWP_FMC_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F429x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for MEMRM_Register use record
      MEM_MODE       at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      FB_MODE        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      SWP_FMC        at 0 range 10 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype PMC_ADC1DC2_Field is STM32F429x.Bit;
   subtype PMC_ADC2DC2_Field is STM32F429x.Bit;
   subtype PMC_ADC3DC2_Field is STM32F429x.Bit;
   subtype PMC_MII_RMII_SEL_Field is STM32F429x.Bit;

   --  peripheral mode configuration register
   type PMC_Register is record
      --  unspecified
      Reserved_0_15  : STM32F429x.UInt16 := 16#0#;
      --  ADC1DC2
      ADC1DC2        : PMC_ADC1DC2_Field := 16#0#;
      --  ADC2DC2
      ADC2DC2        : PMC_ADC2DC2_Field := 16#0#;
      --  ADC3DC2
      ADC3DC2        : PMC_ADC3DC2_Field := 16#0#;
      --  unspecified
      Reserved_19_22 : STM32F429x.UInt4 := 16#0#;
      --  Ethernet PHY interface selection
      MII_RMII_SEL   : PMC_MII_RMII_SEL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32F429x.Byte := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PMC_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      ADC1DC2        at 0 range 16 .. 16;
      ADC2DC2        at 0 range 17 .. 17;
      ADC3DC2        at 0 range 18 .. 18;
      Reserved_19_22 at 0 range 19 .. 22;
      MII_RMII_SEL   at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  EXTICR1_EXTI array element
   subtype EXTICR1_EXTI_Element is STM32F429x.UInt4;

   --  EXTICR1_EXTI array
   type EXTICR1_EXTI_Field_Array is array (0 .. 3) of EXTICR1_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR1_EXTI
   type EXTICR1_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32F429x.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR1_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR1_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 1
   type EXTICR1_Register is record
      --  EXTI x configuration (x = 0 to 3)
      EXTI           : EXTICR1_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32F429x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EXTICR1_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR2_EXTI array element
   subtype EXTICR2_EXTI_Element is STM32F429x.UInt4;

   --  EXTICR2_EXTI array
   type EXTICR2_EXTI_Field_Array is array (4 .. 7) of EXTICR2_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR2_EXTI
   type EXTICR2_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32F429x.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR2_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR2_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 2
   type EXTICR2_Register is record
      --  EXTI x configuration (x = 4 to 7)
      EXTI           : EXTICR2_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32F429x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EXTICR2_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR3_EXTI array element
   subtype EXTICR3_EXTI_Element is STM32F429x.UInt4;

   --  EXTICR3_EXTI array
   type EXTICR3_EXTI_Field_Array is array (8 .. 11) of EXTICR3_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR3_EXTI
   type EXTICR3_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32F429x.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR3_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR3_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 3
   type EXTICR3_Register is record
      --  EXTI x configuration (x = 8 to 11)
      EXTI           : EXTICR3_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32F429x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EXTICR3_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR4_EXTI array element
   subtype EXTICR4_EXTI_Element is STM32F429x.UInt4;

   --  EXTICR4_EXTI array
   type EXTICR4_EXTI_Field_Array is array (12 .. 15) of EXTICR4_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR4_EXTI
   type EXTICR4_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32F429x.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR4_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR4_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 4
   type EXTICR4_Register is record
      --  EXTI x configuration (x = 12 to 15)
      EXTI           : EXTICR4_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32F429x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for EXTICR4_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CMPCR_CMP_PD_Field is STM32F429x.Bit;
   subtype CMPCR_READY_Field is STM32F429x.Bit;

   --  Compensation cell control register
   type CMPCR_Register is record
      --  Read-only. Compensation cell power-down
      CMP_PD        : CMPCR_CMP_PD_Field;
      --  unspecified
      Reserved_1_7  : STM32F429x.UInt7;
      --  Read-only. READY
      READY         : CMPCR_READY_Field;
      --  unspecified
      Reserved_9_31 : STM32F429x.UInt23;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CMPCR_Register use record
      CMP_PD        at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      READY         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System configuration controller
   type SYSCFG_Peripheral is record
      --  memory remap register
      MEMRM   : aliased MEMRM_Register;
      pragma Volatile_Full_Access (MEMRM);
      --  peripheral mode configuration register
      PMC     : aliased PMC_Register;
      pragma Volatile_Full_Access (PMC);
      --  external interrupt configuration register 1
      EXTICR1 : aliased EXTICR1_Register;
      pragma Volatile_Full_Access (EXTICR1);
      --  external interrupt configuration register 2
      EXTICR2 : aliased EXTICR2_Register;
      pragma Volatile_Full_Access (EXTICR2);
      --  external interrupt configuration register 3
      EXTICR3 : aliased EXTICR3_Register;
      pragma Volatile_Full_Access (EXTICR3);
      --  external interrupt configuration register 4
      EXTICR4 : aliased EXTICR4_Register;
      pragma Volatile_Full_Access (EXTICR4);
      --  Compensation cell control register
      CMPCR   : aliased CMPCR_Register;
      pragma Volatile_Full_Access (CMPCR);
   end record
     with Volatile;

   for SYSCFG_Peripheral use record
      MEMRM   at 16#0# range 0 .. 31;
      PMC     at 16#4# range 0 .. 31;
      EXTICR1 at 16#8# range 0 .. 31;
      EXTICR2 at 16#C# range 0 .. 31;
      EXTICR3 at 16#10# range 0 .. 31;
      EXTICR4 at 16#14# range 0 .. 31;
      CMPCR   at 16#20# range 0 .. 31;
   end record;

   --  System configuration controller
   SYSCFG_Periph : aliased SYSCFG_Peripheral
     with Import, Address => SYSCFG_Base;

end STM32F429x.SYSCFG;
