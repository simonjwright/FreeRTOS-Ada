--  Copyright Simon Wright <simon@pushface.org>
--
--  This file is part of the Cortex GNAT RTS project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.
------------------------------------------------------------------------------

--  Modified from the GCC 4.9.1 version for the Cortex GNAT RTS
--  project, for STM32F4.

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
