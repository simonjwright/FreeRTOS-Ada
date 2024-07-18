with Ada.Interrupts.Names;
package Device is

   protected Handler is
      entry Wait;
   private
      Triggered : Boolean := False;
      procedure Handler
      with Attach_Handler => Ada.Interrupts.Names.GPIO_Interrupt;
   end Handler;

end Device;
