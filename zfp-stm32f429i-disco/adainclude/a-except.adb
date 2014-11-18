with Last_Chance_Handler;

package body Ada.Exceptions is

   procedure Raise_Exception (E : Exception_Id; Message : String := "")
   is
      pragma Unreferenced (E);
   begin
      pragma Warnings (Off);
      Last_Chance_Handler (Message'Address, 0);
      pragma Warnings (On);
   end Raise_Exception;

end Ada.Exceptions;
