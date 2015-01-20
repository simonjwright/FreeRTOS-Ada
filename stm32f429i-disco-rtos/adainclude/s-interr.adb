with Ada.Interrupts.Names;
with Ada.Unchecked_Conversion;

package body System.Interrupts is

   type Handler_Wrapper is access procedure (Obj : System.Address);

   Interrupt_Handlers : array (Interrupt_ID) of Handler_Wrapper
     with
       Import,
       Convention => C,
       External_Name => "_gnat_interrupt_handlers";
   --  Defined in stm32f4xx_it.c

   Interrupt_Handler_Parameters : array (Interrupt_ID) of System.Address
     with
       Import,
       Convention => C,
       External_Name => "_gnat_interrupt_handler_parameters";
   --  Defined in stm32f4xx_it.c

   type Parameterless_Handler_Impl is record
      Object : System.Address;
      Wrapper : Handler_Wrapper;
   end record
   with
     Size => 64;

   function To_Impl_View
     is new Ada.Unchecked_Conversion (Parameterless_Handler,
                                      Parameterless_Handler_Impl);

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : New_Handler_Array) is
      pragma Unreferenced (Prio);
   begin
      for H of Handlers loop
         declare
            Impl : constant Parameterless_Handler_Impl :=
              To_Impl_View (H.Handler);
         begin
            if Interrupt_Handlers (H.Interrupt) /= null then
               raise Program_Error with "interrupt already registered";
            end if;
            Interrupt_Handlers (H.Interrupt) := Impl.Wrapper;
            Interrupt_Handler_Parameters (H.Interrupt) := Impl.Object;
         end;
      end loop;
   end Install_Restricted_Handlers;

end System.Interrupts;
