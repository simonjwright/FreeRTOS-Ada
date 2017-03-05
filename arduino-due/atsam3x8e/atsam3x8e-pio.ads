--  This spec has been automatically generated from ATSAM3X8E.svd
--  see https://github.com/simonjwright/svd2ada

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package ATSAM3X8E.PIO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- PER_Register --
   ------------------

   --  PER_P array element
   subtype PER_P_Element is ATSAM3X8E.Bit;

   --  PER_P array
   type PER_P_Field_Array is array (0 .. 31) of PER_P_Element
     with Component_Size => 1, Size => 32;

   --  PIO Enable Register
   type PER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- PDR_Register --
   ------------------

   --  PDR_P array element
   subtype PDR_P_Element is ATSAM3X8E.Bit;

   --  PDR_P array
   type PDR_P_Field_Array is array (0 .. 31) of PDR_P_Element
     with Component_Size => 1, Size => 32;

   --  PIO Disable Register
   type PDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- PSR_Register --
   ------------------

   --  PSR_P array element
   subtype PSR_P_Element is ATSAM3X8E.Bit;

   --  PSR_P array
   type PSR_P_Field_Array is array (0 .. 31) of PSR_P_Element
     with Component_Size => 1, Size => 32;

   --  PIO Status Register
   type PSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- OER_Register --
   ------------------

   --  OER_P array element
   subtype OER_P_Element is ATSAM3X8E.Bit;

   --  OER_P array
   type OER_P_Field_Array is array (0 .. 31) of OER_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Enable Register
   type OER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : OER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for OER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- ODR_Register --
   ------------------

   --  ODR_P array element
   subtype ODR_P_Element is ATSAM3X8E.Bit;

   --  ODR_P array
   type ODR_P_Field_Array is array (0 .. 31) of ODR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Disable Register
   type ODR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : ODR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for ODR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- OSR_Register --
   ------------------

   --  OSR_P array element
   subtype OSR_P_Element is ATSAM3X8E.Bit;

   --  OSR_P array
   type OSR_P_Field_Array is array (0 .. 31) of OSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Status Register
   type OSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : OSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for OSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- IFER_Register --
   -------------------

   --  IFER_P array element
   subtype IFER_P_Element is ATSAM3X8E.Bit;

   --  IFER_P array
   type IFER_P_Field_Array is array (0 .. 31) of IFER_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch Input Filter Enable Register
   type IFER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IFER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IFER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- IFDR_Register --
   -------------------

   --  IFDR_P array element
   subtype IFDR_P_Element is ATSAM3X8E.Bit;

   --  IFDR_P array
   type IFDR_P_Field_Array is array (0 .. 31) of IFDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch Input Filter Disable Register
   type IFDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IFDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IFDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- IFSR_Register --
   -------------------

   --  IFSR_P array element
   subtype IFSR_P_Element is ATSAM3X8E.Bit;

   --  IFSR_P array
   type IFSR_P_Field_Array is array (0 .. 31) of IFSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch Input Filter Status Register
   type IFSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IFSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IFSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- SODR_Register --
   -------------------

   --  SODR_P array element
   subtype SODR_P_Element is ATSAM3X8E.Bit;

   --  SODR_P array
   type SODR_P_Field_Array is array (0 .. 31) of SODR_P_Element
     with Component_Size => 1, Size => 32;

   --  Set Output Data Register
   type SODR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : SODR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for SODR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- CODR_Register --
   -------------------

   --  CODR_P array element
   subtype CODR_P_Element is ATSAM3X8E.Bit;

   --  CODR_P array
   type CODR_P_Field_Array is array (0 .. 31) of CODR_P_Element
     with Component_Size => 1, Size => 32;

   --  Clear Output Data Register
   type CODR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : CODR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for CODR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- ODSR_Register --
   -------------------

   --  ODSR_P array element
   subtype ODSR_P_Element is ATSAM3X8E.Bit;

   --  ODSR_P array
   type ODSR_P_Field_Array is array (0 .. 31) of ODSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Data Status Register
   type ODSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : ODSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for ODSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- PDSR_Register --
   -------------------

   --  PDSR_P array element
   subtype PDSR_P_Element is ATSAM3X8E.Bit;

   --  PDSR_P array
   type PDSR_P_Field_Array is array (0 .. 31) of PDSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Pin Data Status Register
   type PDSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PDSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PDSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- IER_Register --
   ------------------

   --  IER_P array element
   subtype IER_P_Element is ATSAM3X8E.Bit;

   --  IER_P array
   type IER_P_Field_Array is array (0 .. 31) of IER_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Enable Register
   type IER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- IDR_Register --
   ------------------

   --  IDR_P array element
   subtype IDR_P_Element is ATSAM3X8E.Bit;

   --  IDR_P array
   type IDR_P_Field_Array is array (0 .. 31) of IDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Disable Register
   type IDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- IMR_Register --
   ------------------

   --  IMR_P array element
   subtype IMR_P_Element is ATSAM3X8E.Bit;

   --  IMR_P array
   type IMR_P_Field_Array is array (0 .. 31) of IMR_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Mask Register
   type IMR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IMR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- ISR_Register --
   ------------------

   --  ISR_P array element
   subtype ISR_P_Element is ATSAM3X8E.Bit;

   --  ISR_P array
   type ISR_P_Field_Array is array (0 .. 31) of ISR_P_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt Status Register
   type ISR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : ISR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- MDER_Register --
   -------------------

   --  MDER_P array element
   subtype MDER_P_Element is ATSAM3X8E.Bit;

   --  MDER_P array
   type MDER_P_Field_Array is array (0 .. 31) of MDER_P_Element
     with Component_Size => 1, Size => 32;

   --  Multi-driver Enable Register
   type MDER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : MDER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for MDER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- MDDR_Register --
   -------------------

   --  MDDR_P array element
   subtype MDDR_P_Element is ATSAM3X8E.Bit;

   --  MDDR_P array
   type MDDR_P_Field_Array is array (0 .. 31) of MDDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Multi-driver Disable Register
   type MDDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : MDDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for MDDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- MDSR_Register --
   -------------------

   --  MDSR_P array element
   subtype MDSR_P_Element is ATSAM3X8E.Bit;

   --  MDSR_P array
   type MDSR_P_Field_Array is array (0 .. 31) of MDSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Multi-driver Status Register
   type MDSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : MDSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for MDSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- PUDR_Register --
   -------------------

   --  PUDR_P array element
   subtype PUDR_P_Element is ATSAM3X8E.Bit;

   --  PUDR_P array
   type PUDR_P_Field_Array is array (0 .. 31) of PUDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Pull-up Disable Register
   type PUDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PUDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PUDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- PUER_Register --
   -------------------

   --  PUER_P array element
   subtype PUER_P_Element is ATSAM3X8E.Bit;

   --  PUER_P array
   type PUER_P_Field_Array is array (0 .. 31) of PUER_P_Element
     with Component_Size => 1, Size => 32;

   --  Pull-up Enable Register
   type PUER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PUER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PUER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- PUSR_Register --
   -------------------

   --  PUSR_P array element
   subtype PUSR_P_Element is ATSAM3X8E.Bit;

   --  PUSR_P array
   type PUSR_P_Field_Array is array (0 .. 31) of PUSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Pad Pull-up Status Register
   type PUSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : PUSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for PUSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- ABSR_Register --
   -------------------

   --  ABSR_P array element
   subtype ABSR_P_Element is ATSAM3X8E.Bit;

   --  ABSR_P array
   type ABSR_P_Field_Array is array (0 .. 31) of ABSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Peripheral AB Select Register
   type ABSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : ABSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for ABSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- SCIFSR_Register --
   ---------------------

   --  SCIFSR_P array element
   subtype SCIFSR_P_Element is ATSAM3X8E.Bit;

   --  SCIFSR_P array
   type SCIFSR_P_Field_Array is array (0 .. 31) of SCIFSR_P_Element
     with Component_Size => 1, Size => 32;

   --  System Clock Glitch Input Filter Select Register
   type SCIFSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : SCIFSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for SCIFSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --------------------
   -- DIFSR_Register --
   --------------------

   --  DIFSR_P array element
   subtype DIFSR_P_Element is ATSAM3X8E.Bit;

   --  DIFSR_P array
   type DIFSR_P_Field_Array is array (0 .. 31) of DIFSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Debouncing Input Filter Select Register
   type DIFSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : DIFSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for DIFSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- IFDGSR_Register --
   ---------------------

   --  IFDGSR_P array element
   subtype IFDGSR_P_Element is ATSAM3X8E.Bit;

   --  IFDGSR_P array
   type IFDGSR_P_Field_Array is array (0 .. 31) of IFDGSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Glitch or Debouncing Input Filter Clock Selection Status Register
   type IFDGSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : IFDGSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for IFDGSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- SCDR_Register --
   -------------------

   subtype SCDR_DIV_Field is ATSAM3X8E.UInt14;

   --  Slow Clock Divider Debouncing Register
   type SCDR_Register is record
      --  Slow Clock Divider Selection for Debouncing
      DIV            : SCDR_DIV_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : ATSAM3X8E.UInt18 := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for SCDR_Register use record
      DIV            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   -------------------
   -- OWER_Register --
   -------------------

   --  OWER_P array element
   subtype OWER_P_Element is ATSAM3X8E.Bit;

   --  OWER_P array
   type OWER_P_Field_Array is array (0 .. 31) of OWER_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Write Enable
   type OWER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : OWER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for OWER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- OWDR_Register --
   -------------------

   --  OWDR_P array element
   subtype OWDR_P_Element is ATSAM3X8E.Bit;

   --  OWDR_P array
   type OWDR_P_Field_Array is array (0 .. 31) of OWDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Write Disable
   type OWDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : OWDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for OWDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- OWSR_Register --
   -------------------

   --  OWSR_P array element
   subtype OWSR_P_Element is ATSAM3X8E.Bit;

   --  OWSR_P array
   type OWSR_P_Field_Array is array (0 .. 31) of OWSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Output Write Status Register
   type OWSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : OWSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for OWSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --------------------
   -- AIMER_Register --
   --------------------

   --  AIMER_P array element
   subtype AIMER_P_Element is ATSAM3X8E.Bit;

   --  AIMER_P array
   type AIMER_P_Field_Array is array (0 .. 31) of AIMER_P_Element
     with Component_Size => 1, Size => 32;

   --  Additional Interrupt Modes Enable Register
   type AIMER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : AIMER_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for AIMER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --------------------
   -- AIMDR_Register --
   --------------------

   --  AIMDR_P array element
   subtype AIMDR_P_Element is ATSAM3X8E.Bit;

   --  AIMDR_P array
   type AIMDR_P_Field_Array is array (0 .. 31) of AIMDR_P_Element
     with Component_Size => 1, Size => 32;

   --  Additional Interrupt Modes Disables Register
   type AIMDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : AIMDR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for AIMDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --------------------
   -- AIMMR_Register --
   --------------------

   --  AIMMR_P array element
   subtype AIMMR_P_Element is ATSAM3X8E.Bit;

   --  AIMMR_P array
   type AIMMR_P_Field_Array is array (0 .. 31) of AIMMR_P_Element
     with Component_Size => 1, Size => 32;

   --  Additional Interrupt Modes Mask Register
   type AIMMR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : AIMMR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for AIMMR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- ESR_Register --
   ------------------

   --  ESR_P array element
   subtype ESR_P_Element is ATSAM3X8E.Bit;

   --  ESR_P array
   type ESR_P_Field_Array is array (0 .. 31) of ESR_P_Element
     with Component_Size => 1, Size => 32;

   --  Edge Select Register
   type ESR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : ESR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for ESR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- LSR_Register --
   ------------------

   --  LSR_P array element
   subtype LSR_P_Element is ATSAM3X8E.Bit;

   --  LSR_P array
   type LSR_P_Field_Array is array (0 .. 31) of LSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Level Select Register
   type LSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : LSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for LSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- ELSR_Register --
   -------------------

   --  ELSR_P array element
   subtype ELSR_P_Element is ATSAM3X8E.Bit;

   --  ELSR_P array
   type ELSR_P_Field_Array is array (0 .. 31) of ELSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Edge/Level Status Register
   type ELSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : ELSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for ELSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- FELLSR_Register --
   ---------------------

   --  FELLSR_P array element
   subtype FELLSR_P_Element is ATSAM3X8E.Bit;

   --  FELLSR_P array
   type FELLSR_P_Field_Array is array (0 .. 31) of FELLSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Falling Edge/Low Level Select Register
   type FELLSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : FELLSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for FELLSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- REHLSR_Register --
   ---------------------

   --  REHLSR_P array element
   subtype REHLSR_P_Element is ATSAM3X8E.Bit;

   --  REHLSR_P array
   type REHLSR_P_Field_Array is array (0 .. 31) of REHLSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Rising Edge/ High Level Select Register
   type REHLSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : REHLSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for REHLSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- FRLHSR_Register --
   ---------------------

   --  FRLHSR_P array element
   subtype FRLHSR_P_Element is ATSAM3X8E.Bit;

   --  FRLHSR_P array
   type FRLHSR_P_Field_Array is array (0 .. 31) of FRLHSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Fall/Rise - Low/High Status Register
   type FRLHSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : FRLHSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for FRLHSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- LOCKSR_Register --
   ---------------------

   --  LOCKSR_P array element
   subtype LOCKSR_P_Element is ATSAM3X8E.Bit;

   --  LOCKSR_P array
   type LOCKSR_P_Field_Array is array (0 .. 31) of LOCKSR_P_Element
     with Component_Size => 1, Size => 32;

   --  Lock Status
   type LOCKSR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : ATSAM3X8E.Word;
         when True =>
            --  P as an array
            Arr : LOCKSR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile,
          Bit_Order => System.Low_Order_First;

   for LOCKSR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -------------------
   -- WPMR_Register --
   -------------------

   subtype WPMR_WPEN_Field is ATSAM3X8E.Bit;
   subtype WPMR_WPKEY_Field is ATSAM3X8E.UInt24;

   --  Write Protect Mode Register
   type WPMR_Register is record
      --  Write Protect Enable
      WPEN         : WPMR_WPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7 : ATSAM3X8E.UInt7 := 16#0#;
      --  Write Protect KEY
      WPKEY        : WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   -------------------
   -- WPSR_Register --
   -------------------

   subtype WPSR_WPVS_Field is ATSAM3X8E.Bit;
   subtype WPSR_WPVSRC_Field is ATSAM3X8E.Short;

   --  Write Protect Status Register
   type WPSR_Register is record
      --  Read-only. Write Protect Violation Status
      WPVS           : WPSR_WPVS_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : ATSAM3X8E.UInt7;
      --  Read-only. Write Protect Violation Source
      WPVSRC         : WPSR_WPVSRC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : ATSAM3X8E.Byte;
   end record
     with Volatile, Size => 32, Bit_Order => System.Low_Order_First;

   for WPSR_Register use record
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
      PER    : PER_Register;
      --  PIO Disable Register
      PDR    : PDR_Register;
      --  PIO Status Register
      PSR    : PSR_Register;
      --  Output Enable Register
      OER    : OER_Register;
      --  Output Disable Register
      ODR    : ODR_Register;
      --  Output Status Register
      OSR    : OSR_Register;
      --  Glitch Input Filter Enable Register
      IFER   : IFER_Register;
      --  Glitch Input Filter Disable Register
      IFDR   : IFDR_Register;
      --  Glitch Input Filter Status Register
      IFSR   : IFSR_Register;
      --  Set Output Data Register
      SODR   : SODR_Register;
      --  Clear Output Data Register
      CODR   : CODR_Register;
      --  Output Data Status Register
      ODSR   : ODSR_Register;
      --  Pin Data Status Register
      PDSR   : PDSR_Register;
      --  Interrupt Enable Register
      IER    : IER_Register;
      --  Interrupt Disable Register
      IDR    : IDR_Register;
      --  Interrupt Mask Register
      IMR    : IMR_Register;
      --  Interrupt Status Register
      ISR    : ISR_Register;
      --  Multi-driver Enable Register
      MDER   : MDER_Register;
      --  Multi-driver Disable Register
      MDDR   : MDDR_Register;
      --  Multi-driver Status Register
      MDSR   : MDSR_Register;
      --  Pull-up Disable Register
      PUDR   : PUDR_Register;
      --  Pull-up Enable Register
      PUER   : PUER_Register;
      --  Pad Pull-up Status Register
      PUSR   : PUSR_Register;
      --  Peripheral AB Select Register
      ABSR   : ABSR_Register;
      --  System Clock Glitch Input Filter Select Register
      SCIFSR : SCIFSR_Register;
      --  Debouncing Input Filter Select Register
      DIFSR  : DIFSR_Register;
      --  Glitch or Debouncing Input Filter Clock Selection Status Register
      IFDGSR : IFDGSR_Register;
      --  Slow Clock Divider Debouncing Register
      SCDR   : SCDR_Register;
      --  Output Write Enable
      OWER   : OWER_Register;
      --  Output Write Disable
      OWDR   : OWDR_Register;
      --  Output Write Status Register
      OWSR   : OWSR_Register;
      --  Additional Interrupt Modes Enable Register
      AIMER  : AIMER_Register;
      --  Additional Interrupt Modes Disables Register
      AIMDR  : AIMDR_Register;
      --  Additional Interrupt Modes Mask Register
      AIMMR  : AIMMR_Register;
      --  Edge Select Register
      ESR    : ESR_Register;
      --  Level Select Register
      LSR    : LSR_Register;
      --  Edge/Level Status Register
      ELSR   : ELSR_Register;
      --  Falling Edge/Low Level Select Register
      FELLSR : FELLSR_Register;
      --  Rising Edge/ High Level Select Register
      REHLSR : REHLSR_Register;
      --  Fall/Rise - Low/High Status Register
      FRLHSR : FRLHSR_Register;
      --  Lock Status
      LOCKSR : LOCKSR_Register;
      --  Write Protect Mode Register
      WPMR   : WPMR_Register;
      --  Write Protect Status Register
      WPSR   : WPSR_Register;
   end record
     with Volatile;

   for PIO_Peripheral use record
      PER    at 0 range 0 .. 31;
      PDR    at 4 range 0 .. 31;
      PSR    at 8 range 0 .. 31;
      OER    at 16 range 0 .. 31;
      ODR    at 20 range 0 .. 31;
      OSR    at 24 range 0 .. 31;
      IFER   at 32 range 0 .. 31;
      IFDR   at 36 range 0 .. 31;
      IFSR   at 40 range 0 .. 31;
      SODR   at 48 range 0 .. 31;
      CODR   at 52 range 0 .. 31;
      ODSR   at 56 range 0 .. 31;
      PDSR   at 60 range 0 .. 31;
      IER    at 64 range 0 .. 31;
      IDR    at 68 range 0 .. 31;
      IMR    at 72 range 0 .. 31;
      ISR    at 76 range 0 .. 31;
      MDER   at 80 range 0 .. 31;
      MDDR   at 84 range 0 .. 31;
      MDSR   at 88 range 0 .. 31;
      PUDR   at 96 range 0 .. 31;
      PUER   at 100 range 0 .. 31;
      PUSR   at 104 range 0 .. 31;
      ABSR   at 112 range 0 .. 31;
      SCIFSR at 128 range 0 .. 31;
      DIFSR  at 132 range 0 .. 31;
      IFDGSR at 136 range 0 .. 31;
      SCDR   at 140 range 0 .. 31;
      OWER   at 160 range 0 .. 31;
      OWDR   at 164 range 0 .. 31;
      OWSR   at 168 range 0 .. 31;
      AIMER  at 176 range 0 .. 31;
      AIMDR  at 180 range 0 .. 31;
      AIMMR  at 184 range 0 .. 31;
      ESR    at 192 range 0 .. 31;
      LSR    at 196 range 0 .. 31;
      ELSR   at 200 range 0 .. 31;
      FELLSR at 208 range 0 .. 31;
      REHLSR at 212 range 0 .. 31;
      FRLHSR at 216 range 0 .. 31;
      LOCKSR at 224 range 0 .. 31;
      WPMR   at 228 range 0 .. 31;
      WPSR   at 232 range 0 .. 31;
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
