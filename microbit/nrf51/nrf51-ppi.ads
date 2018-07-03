--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.PPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Channel group tasks.

   --  Channel group tasks.
   type TASKS_CHG_Registers is array (0 .. 3) of nrf51.Word;

   -------------------
   -- CHEN_Register --
   -------------------

   --  Enable PPI channel 0.
   type CH0_Field is
     (
      --  Channel disabled.
      Disabled,
      --  Channel enabled.
      Enabled)
     with Size => 1;
   for CH0_Field use
     (Disabled => 0,
      Enabled => 1);

   -------------
   -- CHEN.CH --
   -------------

   --  CHEN_CH array
   type CHEN_CH_Field_Array is array (0 .. 2) of CH0_Field
     with Component_Size => 1, Size => 3;

   --  Type definition for CHEN_CH
   type CHEN_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.UInt3;
         when True =>
            --  CH as an array
            Arr : CHEN_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for CHEN_CH_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Enable PPI channel 3.
   type CH3_Field is
     (
      --  Channel disabled
      Disabled,
      --  Channel enabled
      Enabled)
     with Size => 1;
   for CH3_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable PPI channel 4.
   type CH4_Field is
     (
      --  Channel disabled.
      Disabled,
      --  Channel enabled.
      Enabled)
     with Size => 1;
   for CH4_Field use
     (Disabled => 0,
      Enabled => 1);

   -------------
   -- CHEN.CH --
   -------------

   --  CHEN_CH array
   type CHEN_CH_Field_Array_1 is array (4 .. 15) of CH4_Field
     with Component_Size => 1, Size => 12;

   --  Type definition for CHEN_CH
   type CHEN_CH_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.UInt12;
         when True =>
            --  CH as an array
            Arr : CHEN_CH_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for CHEN_CH_Field_1 use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Enable PPI channel 20.
   type CH20_Field is
     (
      --  Channel disabled.
      Disabled,
      --  Channel enabled.
      Enabled)
     with Size => 1;
   for CH20_Field use
     (Disabled => 0,
      Enabled => 1);

   -------------
   -- CHEN.CH --
   -------------

   --  CHEN_CH array
   type CHEN_CH_Field_Array_2 is array (20 .. 31) of CH20_Field
     with Component_Size => 1, Size => 12;

   --  Type definition for CHEN_CH
   type CHEN_CH_Field_2
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.UInt12;
         when True =>
            --  CH as an array
            Arr : CHEN_CH_Field_Array_2;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for CHEN_CH_Field_2 use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Channel enable.
   type CHEN_Register is record
      --  Enable PPI channel 0.
      CH0            : CHEN_CH_Field := (As_Array => False, Val => 16#0#);
      --  Enable PPI channel 3.
      CH3            : CH3_Field := Disabled;
      --  Enable PPI channel 4.
      CH4            : CHEN_CH_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_19 : nrf51.UInt4 := 16#0#;
      --  Enable PPI channel 20.
      CH20           : CHEN_CH_Field_2 := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHEN_Register use record
      CH0            at 0 range 0 .. 2;
      CH3            at 0 range 3 .. 3;
      CH4            at 0 range 4 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CH20           at 0 range 20 .. 31;
   end record;

   ----------------------
   -- CHENSET_Register --
   ----------------------

   --  Enable PPI channel 0.
   type CH0_Field_1 is
     (
      --  Reset value for the field
      Ch0_Field_Reset,
      --  Enable channel on write.
      Set)
     with Size => 1;
   for CH0_Field_1 use
     (Ch0_Field_Reset => 0,
      Set => 1);

   ----------------
   -- CHENSET.CH --
   ----------------

   --  CHENSET_CH array
   type CHENSET_CH_Field_Array is array (0 .. 15) of CH0_Field_1
     with Component_Size => 1, Size => 16;

   --  Type definition for CHENSET_CH
   type CHENSET_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.Short;
         when True =>
            --  CH as an array
            Arr : CHENSET_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CHENSET_CH_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Enable PPI channel 20.
   type CH20_Field_1 is
     (
      --  Reset value for the field
      Ch20_Field_Reset,
      --  Enable channel on write.
      Set)
     with Size => 1;
   for CH20_Field_1 use
     (Ch20_Field_Reset => 0,
      Set => 1);

   ----------------
   -- CHENSET.CH --
   ----------------

   --  CHENSET_CH array
   type CHENSET_CH_Field_Array_1 is array (20 .. 31) of CH20_Field_1
     with Component_Size => 1, Size => 12;

   --  Type definition for CHENSET_CH
   type CHENSET_CH_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.UInt12;
         when True =>
            --  CH as an array
            Arr : CHENSET_CH_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for CHENSET_CH_Field_1 use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Channel enable set.
   type CHENSET_Register is record
      --  Enable PPI channel 0.
      CH0            : CHENSET_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_19 : nrf51.UInt4 := 16#0#;
      --  Enable PPI channel 20.
      CH20           : CHENSET_CH_Field_1 :=
                        (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHENSET_Register use record
      CH0            at 0 range 0 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CH20           at 0 range 20 .. 31;
   end record;

   ----------------------
   -- CHENCLR_Register --
   ----------------------

   --  Disable PPI channel 0.
   type CH0_Field_2 is
     (
      --  Reset value for the field
      Ch0_Field_Reset,
      --  Disable channel on write.
      Clear)
     with Size => 1;
   for CH0_Field_2 use
     (Ch0_Field_Reset => 0,
      Clear => 1);

   ----------------
   -- CHENCLR.CH --
   ----------------

   --  CHENCLR_CH array
   type CHENCLR_CH_Field_Array is array (0 .. 15) of CH0_Field_2
     with Component_Size => 1, Size => 16;

   --  Type definition for CHENCLR_CH
   type CHENCLR_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.Short;
         when True =>
            --  CH as an array
            Arr : CHENCLR_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CHENCLR_CH_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Disable PPI channel 20.
   type CH20_Field_2 is
     (
      --  Reset value for the field
      Ch20_Field_Reset,
      --  Disable channel on write.
      Clear)
     with Size => 1;
   for CH20_Field_2 use
     (Ch20_Field_Reset => 0,
      Clear => 1);

   ----------------
   -- CHENCLR.CH --
   ----------------

   --  CHENCLR_CH array
   type CHENCLR_CH_Field_Array_1 is array (20 .. 31) of CH20_Field_2
     with Component_Size => 1, Size => 12;

   --  Type definition for CHENCLR_CH
   type CHENCLR_CH_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.UInt12;
         when True =>
            --  CH as an array
            Arr : CHENCLR_CH_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for CHENCLR_CH_Field_1 use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Channel enable clear.
   type CHENCLR_Register is record
      --  Disable PPI channel 0.
      CH0            : CHENCLR_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_19 : nrf51.UInt4 := 16#0#;
      --  Disable PPI channel 20.
      CH20            : CHENCLR_CH_Field_1 :=
                        (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHENCLR_Register use record
      CH0            at 0 range 0 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CH20           at 0 range 20 .. 31;
   end record;

   --  PPI Channel.

   --  PPI Channel.
   type CH_Registers is array (0 .. 15) of nrf51.Word;

   ------------------
   -- CHG_Register --
   ------------------

   --  Include CH0 in channel group.
   type CH0_Field_3 is
     (
      --  Channel excluded.
      Excluded,
      --  Channel included.
      Included)
     with Size => 1;
   for CH0_Field_3 use
     (Excluded => 0,
      Included => 1);

   ------------
   -- CHG.CH --
   ------------

   --  CHG_CH array
   type CHG_CH_Field_Array is array (0 .. 15) of CH0_Field_3
     with Component_Size => 1, Size => 16;

   --  Type definition for CHG_CH
   type CHG_CH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.Short;
         when True =>
            --  CH as an array
            Arr : CHG_CH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CHG_CH_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Include CH20 in channel group.
   type CH20_Field_3 is
     (
      --  Channel excluded.
      Excluded,
      --  Channel included.
      Included)
     with Size => 1;
   for CH20_Field_3 use
     (Excluded => 0,
      Included => 1);

   ------------
   -- CHG.CH --
   ------------

   --  CHG_CH array
   type CHG_CH_Field_Array_1 is array (20 .. 31) of CH20_Field_3
     with Component_Size => 1, Size => 12;

   --  Type definition for CHG_CH
   type CHG_CH_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CH as a value
            Val : nrf51.UInt12;
         when True =>
            --  CH as an array
            Arr : CHG_CH_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for CHG_CH_Field_1 use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Channel group configuration.
   type CHG_Register is record
      --  Include CH0 in channel group.
      CH0            : CHG_CH_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_19 : nrf51.UInt4 := 16#0#;
      --  Include CH20 in channel group.
      CH20           : CHG_CH_Field_1 := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHG_Register use record
      CH0            at 0 range 0 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CH20           at 0 range 20 .. 31;
   end record;

   --  Channel group configuration.
   type CHG_Registers is array (0 .. 3) of CHG_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  PPI controller.
   type PPI_Peripheral is record
      --  Channel group tasks.
      TASKS_CHG : TASKS_CHG_Registers;
      --  Channel enable.
      CHEN      : CHEN_Register;
      --  Channel enable set.
      CHENSET   : CHENSET_Register;
      --  Channel enable clear.
      CHENCLR   : CHENCLR_Register;
      --  PPI Channel.
      CH        : CH_Registers;
      --  Channel group configuration.
      CHG       : CHG_Registers;
   end record
     with Volatile;

   for PPI_Peripheral use record
      pragma Warnings (Off, "bits of*unused");
      TASKS_CHG at 0 range 0 .. 255;
      CHEN      at 1280 range 0 .. 31;
      CHENSET   at 1284 range 0 .. 31;
      CHENCLR   at 1288 range 0 .. 31;
      CH        at 1296 range 0 .. 1023;
      CHG       at 2048 range 0 .. 127;
      pragma Warnings (On, "bits of*unused");
   end record;

   --  PPI controller.
   PPI_Periph : aliased PPI_Peripheral
     with Import, Address => PPI_Base;

end nrf51.PPI;
