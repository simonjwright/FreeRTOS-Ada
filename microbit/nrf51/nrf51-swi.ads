--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

--  with System;

package nrf51.SWI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- Peripherals --
   -----------------

   --  SW Interrupts.
   type SWI_Peripheral is record
      --  Unused.
      UNUSED : nrf51.Word;
   end record
     with Volatile;

   for SWI_Peripheral use record
      UNUSED at 0 range 0 .. 31;
   end record;

   --  SW Interrupts.
   SWI_Periph : aliased SWI_Peripheral
     with Import, Address => SWI_Base;

end nrf51.SWI;
