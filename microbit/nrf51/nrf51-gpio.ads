--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.GPIO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- OUT_Register --
   ------------------

   --  Pin 0.
   type PIN0_Field is
     (
      --  Pin driver is low.
      Low,
      --  Pin driver is high.
      High)
     with Size => 1;
   for PIN0_Field use
     (Low => 0,
      High => 1);

   --  OUT_PIN array
   type OUT_PIN_Field_Array is array (0 .. 31) of PIN0_Field
     with Component_Size => 1, Size => 32;

   --  Write GPIO port.
   type OUT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : OUT_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for OUT_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- OUTSET_Register --
   ---------------------

   --  Pin 0.
   type PIN0_Field_1 is
     (
      --  Reset value for the field
      Pin0_Field_Reset,
      --  Set pin driver high.
      Set)
     with Size => 1;
   for PIN0_Field_1 use
     (Pin0_Field_Reset => 0,
      Set => 1);

   --  OUTSET_PIN array
   type OUTSET_PIN_Field_Array is array (0 .. 31) of PIN0_Field_1
     with Component_Size => 1, Size => 32;

   --  Set individual bits in GPIO port.
   type OUTSET_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : OUTSET_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for OUTSET_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- OUTCLR_Register --
   ---------------------

   --  Pin 0.
   type PIN0_Field_2 is
     (
      --  Reset value for the field
      Pin0_Field_Reset,
      --  Set pin driver low.
      Clear)
     with Size => 1;
   for PIN0_Field_2 use
     (Pin0_Field_Reset => 0,
      Clear => 1);

   --  OUTCLR_PIN array
   type OUTCLR_PIN_Field_Array is array (0 .. 31) of PIN0_Field_2
     with Component_Size => 1, Size => 32;

   --  Clear individual bits in GPIO port.
   type OUTCLR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : OUTCLR_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for OUTCLR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -----------------
   -- IN_Register --
   -----------------

   --  IN_PIN array
   type IN_PIN_Field_Array is array (0 .. 31) of PIN0_Field
     with Component_Size => 1, Size => 32;

   --  Read GPIO port.
   type IN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : IN_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for IN_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ------------------
   -- DIR_Register --
   ------------------

   --  Pin 0.
   type PIN0_Field_3 is
     (
      --  Pin set as input.
      Input,
      --  Pin set as output.
      Output)
     with Size => 1;
   for PIN0_Field_3 use
     (Input => 0,
      Output => 1);

   --  DIR_PIN array
   type DIR_PIN_Field_Array is array (0 .. 31) of PIN0_Field_3
     with Component_Size => 1, Size => 32;

   --  Direction of GPIO pins.
   type DIR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : DIR_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DIR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- DIRSET_Register --
   ---------------------

   --  DIRSET_PIN array
   type DIRSET_PIN_Field_Array is array (0 .. 31) of PIN0_Field_1
     with Component_Size => 1, Size => 32;

   --  DIR set register.
   type DIRSET_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : DIRSET_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DIRSET_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ---------------------
   -- DIRCLR_Register --
   ---------------------

   --  DIRCLR_PIN array
   type DIRCLR_PIN_Field_Array is array (0 .. 31) of PIN0_Field_2
     with Component_Size => 1, Size => 32;

   --  DIR clear register.
   type DIRCLR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIN as a value
            Val : nrf51.Word;
         when True =>
            --  PIN as an array
            Arr : DIRCLR_PIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for DIRCLR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   ----------------------
   -- PIN_CNF_Register --
   ----------------------

   --  Pin direction.
   type DIR_Field is
     (
      --  Configure pin as an input pin.
      Input,
      --  Configure pin as an output pin.
      Output)
     with Size => 1;
   for DIR_Field use
     (Input => 0,
      Output => 1);

   --  Connect or disconnect input path.
   type INPUT_Field is
     (
      --  Connect input pin.
      Connect,
      --  Disconnect input pin.
      Disconnect)
     with Size => 1;
   for INPUT_Field use
     (Connect => 0,
      Disconnect => 1);

   --  Pull-up or -down configuration.
   type PULL_Field is
     (
      --  No pull.
      Disabled,
      --  Pulldown on pin.
      Pulldown,
      --  Pullup on pin.
      Pullup)
     with Size => 2;
   for PULL_Field use
     (Disabled => 0,
      Pulldown => 1,
      Pullup => 3);

   --  Drive configuration.
   type DRIVE_Field is
     (
      --  Standard '0', Standard '1'.
      S0S1,
      --  High '0', Standard '1'.
      H0S1,
      --  Standard '0', High '1'.
      S0H1,
      --  High '0', High '1'.
      H0H1,
      --  Disconnected '0', Standard '1'.
      D0S1,
      --  Disconnected '0', High '1'.
      D0H1,
      --  Standard '0', Disconnected '1'.
      S0D1,
      --  High '0', Disconnected '1'.
      H0D1)
     with Size => 3;
   for DRIVE_Field use
     (S0S1 => 0,
      H0S1 => 1,
      S0H1 => 2,
      H0H1 => 3,
      D0S1 => 4,
      D0H1 => 5,
      S0D1 => 6,
      H0D1 => 7);

   --  Pin sensing mechanism.
   type SENSE_Field is
     (
      --  Disabled.
      Disabled,
      --  Wakeup on high level.
      High,
      --  Wakeup on low level.
      Low)
     with Size => 2;
   for SENSE_Field use
     (Disabled => 0,
      High => 2,
      Low => 3);

   --  Configuration of GPIO pins.
   type PIN_CNF_Register is record
      --  Pin direction.
      DIR            : DIR_Field := Input;
      --  Connect or disconnect input path.
      INPUT          : INPUT_Field := Disconnect;
      --  Pull-up or -down configuration.
      PULL           : PULL_Field := Disabled;
      --  unspecified
      Reserved_4_7   : nrf51.UInt4 := 16#0#;
      --  Drive configuration.
      DRIVE          : DRIVE_Field := S0S1;
      --  unspecified
      Reserved_11_15 : nrf51.UInt5 := 16#0#;
      --  Pin sensing mechanism.
      SENSE          : SENSE_Field := Disabled;
      --  unspecified
      Reserved_18_31 : nrf51.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIN_CNF_Register use record
      DIR            at 0 range 0 .. 0;
      INPUT          at 0 range 1 .. 1;
      PULL           at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DRIVE          at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      SENSE          at 0 range 16 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Configuration of GPIO pins.
   type PIN_CNF_Registers is array (0 .. 31) of PIN_CNF_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  General purpose input and output.
   type GPIO_Peripheral is record
      --  Write GPIO port.
      OUT_k   : OUT_Register;
      --  Set individual bits in GPIO port.
      OUTSET  : OUTSET_Register;
      --  Clear individual bits in GPIO port.
      OUTCLR  : OUTCLR_Register;
      --  Read GPIO port.
      IN_k    : IN_Register;
      --  Direction of GPIO pins.
      DIR     : DIR_Register;
      --  DIR set register.
      DIRSET  : DIRSET_Register;
      --  DIR clear register.
      DIRCLR  : DIRCLR_Register;
      --  Configuration of GPIO pins.
      PIN_CNF : PIN_CNF_Registers;
   end record
     with Volatile;

   for GPIO_Peripheral use record
      OUT_k   at 1284 range 0 .. 31;
      OUTSET  at 1288 range 0 .. 31;
      OUTCLR  at 1292 range 0 .. 31;
      IN_k    at 1296 range 0 .. 31;
      DIR     at 1300 range 0 .. 31;
      DIRSET  at 1304 range 0 .. 31;
      DIRCLR  at 1308 range 0 .. 31;
      PIN_CNF at 1792 range 0 .. 1023;
   end record;

   --  General purpose input and output.
   GPIO_Periph : aliased GPIO_Peripheral
     with Import, Address => GPIO_Base;

end nrf51.GPIO;
