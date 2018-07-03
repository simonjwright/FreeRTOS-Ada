--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

--  with System;

package nrf51.AMLI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- Peripherals --
   -----------------

   --  AHB Multi-Layer Interface.
   type AMLI_Peripheral is record
      --  RAM configurable priority configuration structure.
      RAMPRI : nrf51.Word;
   end record
     with Volatile;

   for AMLI_Peripheral use record
      RAMPRI at 3584 range 0 .. 31;
   end record;

   --  AHB Multi-Layer Interface.
   AMLI_Periph : aliased AMLI_Peripheral
     with Import, Address => AMLI_Base;

end nrf51.AMLI;
