--  Modified from the GCC 4.9.1 version for the STM32F4 GNAT RTS
--  project.

package body Ada.Interrupts is

   use System;

   pragma Warnings (Off, "formal parameter*");

   function Is_Reserved (Interrupt : Interrupt_ID) return Boolean is
   begin
      return False;
   end Is_Reserved;

   function Is_Attached (Interrupt : Interrupt_ID) return Boolean is
   begin
      return False;
   end Is_Attached;

   function Current_Handler
     (Interrupt : Interrupt_ID) return Parameterless_Handler is
   begin
      raise Program_Error with "illegal Current_Handler";
      return null;
   end Current_Handler;

   procedure Attach_Handler
     (New_Handler : Parameterless_Handler;
      Interrupt   : Interrupt_ID) is
   begin
      raise Program_Error with "illegal Attach_Handler";
   end Attach_Handler;

   procedure Exchange_Handler
     (Old_Handler : out Parameterless_Handler;
      New_Handler : Parameterless_Handler;
      Interrupt   : Interrupt_ID) is
   begin
      raise Program_Error with "illegal Exchange_Handler";
   end Exchange_Handler;

   procedure Detach_Handler (Interrupt : Interrupt_ID) is
   begin
      raise Program_Error with "illegal Detach_Handler";
   end Detach_Handler;

   function Reference (Interrupt : Interrupt_ID) return Address is
   begin
      raise Program_Error with "illegal Reference";
      return Null_Address;
   end Reference;

   pragma Warnings (On, "formal parameter*");

end Ada.Interrupts;
