with Ada.Interrupts.Names;
with Ada.Unchecked_Conversion;
with Interfaces;

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
      Object  : System.Address;
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
      procedure HAL_NVIC_SetPriority
        (IRQ_N            : Interfaces.Unsigned_32;
         Preempt_Priority : Interfaces.Unsigned_32;
         Subpriority      : Interfaces.Unsigned_32)
      with
        Import,
        Convention => C,
        External_Name => "HAL_NVIC_SetPriority";
      --  Defined in stm32f4xx_hal_cortex.h.
      --
      --  Note, because HAL configures the NVIC to have 4 priority bits
      --  and no subpriority bits, Subpriority should always be 0.
      --
      --  The lowest interrupt priority is 15, the highest permissible
      --  one to avoid trampling on FreeRTOS is 5 (see
      --  include/FreeRTOSConfig.h).
      procedure HAL_NVIC_EnableIRQ (IRQ_N : Interfaces.Unsigned_32)
      with
        Import,
        Convention => C,
        External_Name => "HAL_NVIC_EnableIRQ";
      --  Defined in stm32f4xx_hal_cortex.h.
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
            HAL_NVIC_SetPriority
              (IRQ_N => Interfaces.Unsigned_32 (H.Interrupt),
               Preempt_Priority => Interfaces.Unsigned_32
                 (15 - (Prio - System.Interrupt_Priority'First)),
               Subpriority => 0);
            HAL_NVIC_EnableIRQ (Interfaces.Unsigned_32 (H.Interrupt));
         end;
      end loop;
   end Install_Restricted_Handlers;

end System.Interrupts;
