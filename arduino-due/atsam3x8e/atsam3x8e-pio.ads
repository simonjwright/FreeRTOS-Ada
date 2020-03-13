pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAM3X8E.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package ATSAM3X8E.PIO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  PIOA_PER_P array element
   subtype PIOA_PER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PER_P array
   type PIOA_PER_P_Field_Array is array (0 .. 31) of PIOA_PER_P_Element
     with Component_Size => 1, Size => 32;

   --  PIO Enable Register
   type PIOA_PER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_PDR_P array element
   subtype PIOA_PDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PDR_P array
   type PIOA_PDR_P_Field_Array is array (0 .. 31) of PIOA_PDR_P_Element
     with Component_Size => 1, Size => 32;

   --  PIO Disable Register
   type PIOA_PDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_PSR_P array element
   subtype PIOA_PSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PSR_P array
   type PIOA_PSR_P_Field_Array is array (0 .. 31) of PIOA_PSR_P_Element
     with Component_Size => 1, Size => 32;

   --  PIO Status Register
   type PIOA_PSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_OER_P array element
   subtype PIOA_OER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_OER_P array
   type PIOA_OER_P_Field_Array is array (0 .. 31) of PIOA_OER_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Enable Register
   type PIOA_OER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_OER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_OER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_ODR_P array element
   subtype PIOA_ODR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_ODR_P array
   type PIOA_ODR_P_Field_Array is array (0 .. 31) of PIOA_ODR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Disable Register
   type PIOA_ODR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_ODR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_ODR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_OSR_P array element
   subtype PIOA_OSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_OSR_P array
   type PIOA_OSR_P_Field_Array is array (0 .. 31) of PIOA_OSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Status Register
   type PIOA_OSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_OSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_OSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IFER_P array element
   subtype PIOA_IFER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IFER_P array
   type PIOA_IFER_P_Field_Array is array (0 .. 31) of PIOA_IFER_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch Input Filter Enable Register
   type PIOA_IFER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IFER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IFER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IFDR_P array element
   subtype PIOA_IFDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IFDR_P array
   type PIOA_IFDR_P_Field_Array is array (0 .. 31) of PIOA_IFDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch Input Filter Disable Register
   type PIOA_IFDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IFDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IFDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IFSR_P array element
   subtype PIOA_IFSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IFSR_P array
   type PIOA_IFSR_P_Field_Array is array (0 .. 31) of PIOA_IFSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch Input Filter Status Register
   type PIOA_IFSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IFSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IFSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_SODR_P array element
   subtype PIOA_SODR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_SODR_P array
   type PIOA_SODR_P_Field_Array is array (0 .. 31) of PIOA_SODR_P_Element
     with Component_Size => 1, Size => 32;

   --  Set Output Data Register
   type PIOA_SODR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_SODR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_SODR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_CODR_P array element
   subtype PIOA_CODR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_CODR_P array
   type PIOA_CODR_P_Field_Array is array (0 .. 31) of PIOA_CODR_P_Element
     with Component_Size => 1, Size => 32;

   --  Clear Output Data Register
   type PIOA_CODR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_CODR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_CODR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_ODSR_P array element
   subtype PIOA_ODSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_ODSR_P array
   type PIOA_ODSR_P_Field_Array is array (0 .. 31) of PIOA_ODSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Data Status Register
   type PIOA_ODSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_ODSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_ODSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_PDSR_P array element
   subtype PIOA_PDSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PDSR_P array
   type PIOA_PDSR_P_Field_Array is array (0 .. 31) of PIOA_PDSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Pin Data Status Register
   type PIOA_PDSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PDSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PDSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IER_P array element
   subtype PIOA_IER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IER_P array
   type PIOA_IER_P_Field_Array is array (0 .. 31) of PIOA_IER_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Enable Register
   type PIOA_IER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IDR_P array element
   subtype PIOA_IDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IDR_P array
   type PIOA_IDR_P_Field_Array is array (0 .. 31) of PIOA_IDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Disable Register
   type PIOA_IDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IMR_P array element
   subtype PIOA_IMR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IMR_P array
   type PIOA_IMR_P_Field_Array is array (0 .. 31) of PIOA_IMR_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Mask Register
   type PIOA_IMR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IMR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IMR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_ISR_P array element
   subtype PIOA_ISR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_ISR_P array
   type PIOA_ISR_P_Field_Array is array (0 .. 31) of PIOA_ISR_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Status Register
   type PIOA_ISR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_ISR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_ISR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_MDER_P array element
   subtype PIOA_MDER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_MDER_P array
   type PIOA_MDER_P_Field_Array is array (0 .. 31) of PIOA_MDER_P_Element
     with Component_Size => 1, Size => 32;

   --  Multi-driver Enable Register
   type PIOA_MDER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_MDER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_MDER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_MDDR_P array element
   subtype PIOA_MDDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_MDDR_P array
   type PIOA_MDDR_P_Field_Array is array (0 .. 31) of PIOA_MDDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Multi-driver Disable Register
   type PIOA_MDDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_MDDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_MDDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_MDSR_P array element
   subtype PIOA_MDSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_MDSR_P array
   type PIOA_MDSR_P_Field_Array is array (0 .. 31) of PIOA_MDSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Multi-driver Status Register
   type PIOA_MDSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_MDSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_MDSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_PUDR_P array element
   subtype PIOA_PUDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PUDR_P array
   type PIOA_PUDR_P_Field_Array is array (0 .. 31) of PIOA_PUDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Pull-up Disable Register
   type PIOA_PUDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PUDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PUDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_PUER_P array element
   subtype PIOA_PUER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PUER_P array
   type PIOA_PUER_P_Field_Array is array (0 .. 31) of PIOA_PUER_P_Element
     with Component_Size => 1, Size => 32;

   --  Pull-up Enable Register
   type PIOA_PUER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PUER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PUER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_PUSR_P array element
   subtype PIOA_PUSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_PUSR_P array
   type PIOA_PUSR_P_Field_Array is array (0 .. 31) of PIOA_PUSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Pad Pull-up Status Register
   type PIOA_PUSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_PUSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_PUSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_ABSR_P array element
   subtype PIOA_ABSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_ABSR_P array
   type PIOA_ABSR_P_Field_Array is array (0 .. 31) of PIOA_ABSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Peripheral AB Select Register
   type PIOA_ABSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_ABSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_ABSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_SCIFSR_P array element
   subtype PIOA_SCIFSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_SCIFSR_P array
   type PIOA_SCIFSR_P_Field_Array is array (0 .. 31) of PIOA_SCIFSR_P_Element
     with Component_Size => 1, Size => 32;

   --  System Clock Glitch Input Filter Select Register
   type PIOA_SCIFSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_SCIFSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_SCIFSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_DIFSR_P array element
   subtype PIOA_DIFSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_DIFSR_P array
   type PIOA_DIFSR_P_Field_Array is array (0 .. 31) of PIOA_DIFSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Debouncing Input Filter Select Register
   type PIOA_DIFSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_DIFSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_DIFSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_IFDGSR_P array element
   subtype PIOA_IFDGSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_IFDGSR_P array
   type PIOA_IFDGSR_P_Field_Array is array (0 .. 31) of PIOA_IFDGSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch or Debouncing Input Filter Clock Selection Status Register
   type PIOA_IFDGSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_IFDGSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_IFDGSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype PIOA_SCDR_DIV_Field is ATSAM3X8E.UInt14;

   --  Slow Clock Divider Debouncing Register
   type PIOA_SCDR_Register is record
      --  Slow Clock Divider Selection for Debouncing
      DIV            : PIOA_SCDR_DIV_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PIOA_SCDR_Register use record
      DIV            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  PIOA_OWER_P array element
   subtype PIOA_OWER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_OWER_P array
   type PIOA_OWER_P_Field_Array is array (0 .. 31) of PIOA_OWER_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Write Enable
   type PIOA_OWER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_OWER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_OWER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_OWDR_P array element
   subtype PIOA_OWDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_OWDR_P array
   type PIOA_OWDR_P_Field_Array is array (0 .. 31) of PIOA_OWDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Write Disable
   type PIOA_OWDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_OWDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_OWDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_OWSR_P array element
   subtype PIOA_OWSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_OWSR_P array
   type PIOA_OWSR_P_Field_Array is array (0 .. 31) of PIOA_OWSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Write Status Register
   type PIOA_OWSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_OWSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_OWSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_AIMER_P array element
   subtype PIOA_AIMER_P_Element is ATSAM3X8E.Bit;

   --  PIOA_AIMER_P array
   type PIOA_AIMER_P_Field_Array is array (0 .. 31) of PIOA_AIMER_P_Element
     with Component_Size => 1, Size => 32;

   --  Additional Interrupt Modes Enable Register
   type PIOA_AIMER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_AIMER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_AIMER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_AIMDR_P array element
   subtype PIOA_AIMDR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_AIMDR_P array
   type PIOA_AIMDR_P_Field_Array is array (0 .. 31) of PIOA_AIMDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Additional Interrupt Modes Disables Register
   type PIOA_AIMDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_AIMDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_AIMDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_AIMMR_P array element
   subtype PIOA_AIMMR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_AIMMR_P array
   type PIOA_AIMMR_P_Field_Array is array (0 .. 31) of PIOA_AIMMR_P_Element
     with Component_Size => 1, Size => 32;

   --  Additional Interrupt Modes Mask Register
   type PIOA_AIMMR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_AIMMR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_AIMMR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_ESR_P array element
   subtype PIOA_ESR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_ESR_P array
   type PIOA_ESR_P_Field_Array is array (0 .. 31) of PIOA_ESR_P_Element
     with Component_Size => 1, Size => 32;

   --  Edge Select Register
   type PIOA_ESR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_ESR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_ESR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_LSR_P array element
   subtype PIOA_LSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_LSR_P array
   type PIOA_LSR_P_Field_Array is array (0 .. 31) of PIOA_LSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Level Select Register
   type PIOA_LSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_LSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_LSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_ELSR_P array element
   subtype PIOA_ELSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_ELSR_P array
   type PIOA_ELSR_P_Field_Array is array (0 .. 31) of PIOA_ELSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Edge/Level Status Register
   type PIOA_ELSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_ELSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_ELSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_FELLSR_P array element
   subtype PIOA_FELLSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_FELLSR_P array
   type PIOA_FELLSR_P_Field_Array is array (0 .. 31) of PIOA_FELLSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Falling Edge/Low Level Select Register
   type PIOA_FELLSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_FELLSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_FELLSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_REHLSR_P array element
   subtype PIOA_REHLSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_REHLSR_P array
   type PIOA_REHLSR_P_Field_Array is array (0 .. 31) of PIOA_REHLSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Rising Edge/ High Level Select Register
   type PIOA_REHLSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_REHLSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_REHLSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_FRLHSR_P array element
   subtype PIOA_FRLHSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_FRLHSR_P array
   type PIOA_FRLHSR_P_Field_Array is array (0 .. 31) of PIOA_FRLHSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Fall/Rise - Low/High Status Register
   type PIOA_FRLHSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_FRLHSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_FRLHSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PIOA_LOCKSR_P array element
   subtype PIOA_LOCKSR_P_Element is ATSAM3X8E.Bit;

   --  PIOA_LOCKSR_P array
   type PIOA_LOCKSR_P_Field_Array is array (0 .. 31) of PIOA_LOCKSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Lock Status
   type PIOA_LOCKSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.UInt32;
         when True =>
            --  P as an array
            Arr : PIOA_LOCKSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIOA_LOCKSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype PIOA_WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype PIOA_WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type PIOA_WPMR_Register is record
      --  Write Protect Enable
      WPEN         : PIOA_WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : PIOA_WPMR_WPKEY_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PIOA_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype PIOA_WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype PIOA_WPSR_WPVSRC_Field is ATSAM3X8E.UInt16;

   --  Write Protect Status Register
   type PIOA_WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : PIOA_WPSR_WPVS_Field;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : PIOA_WPSR_WPVSRC_Field;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for PIOA_WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Parallel Input/Output Controller A
   type PIO_Peripheral is record
      --  PIO Enable Register
      PER    : aliased PIOA_PER_Register;
      pragma Volatile_Full_Access (PER);
      --  PIO Disable Register
      PDR    : aliased PIOA_PDR_Register;
      pragma Volatile_Full_Access (PDR);
      --  PIO Status Register
      PSR    : aliased PIOA_PSR_Register;
      pragma Volatile_Full_Access (PSR);
      --  Output Enable Register
      OER    : aliased PIOA_OER_Register;
      pragma Volatile_Full_Access (OER);
      --  Output Disable Register
      ODR    : aliased PIOA_ODR_Register;
      pragma Volatile_Full_Access (ODR);
      --  Output Status Register
      OSR    : aliased PIOA_OSR_Register;
      pragma Volatile_Full_Access (OSR);
      --  Glitch Input Filter Enable Register
      IFER   : aliased PIOA_IFER_Register;
      pragma Volatile_Full_Access (IFER);
      --  Glitch Input Filter Disable Register
      IFDR   : aliased PIOA_IFDR_Register;
      pragma Volatile_Full_Access (IFDR);
      --  Glitch Input Filter Status Register
      IFSR   : aliased PIOA_IFSR_Register;
      pragma Volatile_Full_Access (IFSR);
      --  Set Output Data Register
      SODR   : aliased PIOA_SODR_Register;
      pragma Volatile_Full_Access (SODR);
      --  Clear Output Data Register
      CODR   : aliased PIOA_CODR_Register;
      pragma Volatile_Full_Access (CODR);
      --  Output Data Status Register
      ODSR   : aliased PIOA_ODSR_Register;
      pragma Volatile_Full_Access (ODSR);
      --  Pin Data Status Register
      PDSR   : aliased PIOA_PDSR_Register;
      pragma Volatile_Full_Access (PDSR);
      --  Interrupt Enable Register
      IER    : aliased PIOA_IER_Register;
      pragma Volatile_Full_Access (IER);
      --  Interrupt Disable Register
      IDR    : aliased PIOA_IDR_Register;
      pragma Volatile_Full_Access (IDR);
      --  Interrupt Mask Register
      IMR    : aliased PIOA_IMR_Register;
      pragma Volatile_Full_Access (IMR);
      --  Interrupt Status Register
      ISR    : aliased PIOA_ISR_Register;
      pragma Volatile_Full_Access (ISR);
      --  Multi-driver Enable Register
      MDER   : aliased PIOA_MDER_Register;
      pragma Volatile_Full_Access (MDER);
      --  Multi-driver Disable Register
      MDDR   : aliased PIOA_MDDR_Register;
      pragma Volatile_Full_Access (MDDR);
      --  Multi-driver Status Register
      MDSR   : aliased PIOA_MDSR_Register;
      pragma Volatile_Full_Access (MDSR);
      --  Pull-up Disable Register
      PUDR   : aliased PIOA_PUDR_Register;
      pragma Volatile_Full_Access (PUDR);
      --  Pull-up Enable Register
      PUER   : aliased PIOA_PUER_Register;
      pragma Volatile_Full_Access (PUER);
      --  Pad Pull-up Status Register
      PUSR   : aliased PIOA_PUSR_Register;
      pragma Volatile_Full_Access (PUSR);
      --  Peripheral AB Select Register
      ABSR   : aliased PIOA_ABSR_Register;
      pragma Volatile_Full_Access (ABSR);
      --  System Clock Glitch Input Filter Select Register
      SCIFSR : aliased PIOA_SCIFSR_Register;
      pragma Volatile_Full_Access (SCIFSR);
      --  Debouncing Input Filter Select Register
      DIFSR  : aliased PIOA_DIFSR_Register;
      pragma Volatile_Full_Access (DIFSR);
      --  Glitch or Debouncing Input Filter Clock Selection Status Register
      IFDGSR : aliased PIOA_IFDGSR_Register;
      pragma Volatile_Full_Access (IFDGSR);
      --  Slow Clock Divider Debouncing Register
      SCDR   : aliased PIOA_SCDR_Register;
      pragma Volatile_Full_Access (SCDR);
      --  Output Write Enable
      OWER   : aliased PIOA_OWER_Register;
      pragma Volatile_Full_Access (OWER);
      --  Output Write Disable
      OWDR   : aliased PIOA_OWDR_Register;
      pragma Volatile_Full_Access (OWDR);
      --  Output Write Status Register
      OWSR   : aliased PIOA_OWSR_Register;
      pragma Volatile_Full_Access (OWSR);
      --  Additional Interrupt Modes Enable Register
      AIMER  : aliased PIOA_AIMER_Register;
      pragma Volatile_Full_Access (AIMER);
      --  Additional Interrupt Modes Disables Register
      AIMDR  : aliased PIOA_AIMDR_Register;
      pragma Volatile_Full_Access (AIMDR);
      --  Additional Interrupt Modes Mask Register
      AIMMR  : aliased PIOA_AIMMR_Register;
      pragma Volatile_Full_Access (AIMMR);
      --  Edge Select Register
      ESR    : aliased PIOA_ESR_Register;
      pragma Volatile_Full_Access (ESR);
      --  Level Select Register
      LSR    : aliased PIOA_LSR_Register;
      pragma Volatile_Full_Access (LSR);
      --  Edge/Level Status Register
      ELSR   : aliased PIOA_ELSR_Register;
      pragma Volatile_Full_Access (ELSR);
      --  Falling Edge/Low Level Select Register
      FELLSR : aliased PIOA_FELLSR_Register;
      pragma Volatile_Full_Access (FELLSR);
      --  Rising Edge/ High Level Select Register
      REHLSR : aliased PIOA_REHLSR_Register;
      pragma Volatile_Full_Access (REHLSR);
      --  Fall/Rise - Low/High Status Register
      FRLHSR : aliased PIOA_FRLHSR_Register;
      pragma Volatile_Full_Access (FRLHSR);
      --  Lock Status
      LOCKSR : aliased PIOA_LOCKSR_Register;
      pragma Volatile_Full_Access (LOCKSR);
      --  Write Protect Mode Register
      WPMR   : aliased PIOA_WPMR_Register;
      pragma Volatile_Full_Access (WPMR);
      --  Write Protect Status Register
      WPSR   : aliased PIOA_WPSR_Register;
      pragma Volatile_Full_Access (WPSR);
   end record
     with Volatile;

   for PIO_Peripheral use record
      PER    at 16#0# range 0 .. 31;
      PDR    at 16#4# range 0 .. 31;
      PSR    at 16#8# range 0 .. 31;
      OER    at 16#10# range 0 .. 31;
      ODR    at 16#14# range 0 .. 31;
      OSR    at 16#18# range 0 .. 31;
      IFER   at 16#20# range 0 .. 31;
      IFDR   at 16#24# range 0 .. 31;
      IFSR   at 16#28# range 0 .. 31;
      SODR   at 16#30# range 0 .. 31;
      CODR   at 16#34# range 0 .. 31;
      ODSR   at 16#38# range 0 .. 31;
      PDSR   at 16#3C# range 0 .. 31;
      IER    at 16#40# range 0 .. 31;
      IDR    at 16#44# range 0 .. 31;
      IMR    at 16#48# range 0 .. 31;
      ISR    at 16#4C# range 0 .. 31;
      MDER   at 16#50# range 0 .. 31;
      MDDR   at 16#54# range 0 .. 31;
      MDSR   at 16#58# range 0 .. 31;
      PUDR   at 16#60# range 0 .. 31;
      PUER   at 16#64# range 0 .. 31;
      PUSR   at 16#68# range 0 .. 31;
      ABSR   at 16#70# range 0 .. 31;
      SCIFSR at 16#80# range 0 .. 31;
      DIFSR  at 16#84# range 0 .. 31;
      IFDGSR at 16#88# range 0 .. 31;
      SCDR   at 16#8C# range 0 .. 31;
      OWER   at 16#A0# range 0 .. 31;
      OWDR   at 16#A4# range 0 .. 31;
      OWSR   at 16#A8# range 0 .. 31;
      AIMER  at 16#B0# range 0 .. 31;
      AIMDR  at 16#B4# range 0 .. 31;
      AIMMR  at 16#B8# range 0 .. 31;
      ESR    at 16#C0# range 0 .. 31;
      LSR    at 16#C4# range 0 .. 31;
      ELSR   at 16#C8# range 0 .. 31;
      FELLSR at 16#D0# range 0 .. 31;
      REHLSR at 16#D4# range 0 .. 31;
      FRLHSR at 16#D8# range 0 .. 31;
      LOCKSR at 16#E0# range 0 .. 31;
      WPMR   at 16#E4# range 0 .. 31;
      WPSR   at 16#E8# range 0 .. 31;
   end record;

   --  Parallel Input/Output Controller A
   PIOA_Periph : aliased PIO_Peripheral
     with Import, Address => PIOA_Base;

   --  Parallel Input/Output Controller B
   PIOB_Periph : aliased PIO_Peripheral
     with Import, Address => PIOB_Base;

   --  Parallel Input/Output Controller C
   PIOC_Periph : aliased PIO_Peripheral
     with Import, Address => PIOC_Base;

   --  Parallel Input/Output Controller D
   PIOD_Periph : aliased PIO_Peripheral
     with Import, Address => PIOD_Base;

end ATSAM3X8E.PIO;
