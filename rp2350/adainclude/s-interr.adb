--  Copyright (C) 2016-2024 Free Software Foundation, Inc.
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

--  This package is for RP2350.

--  with Ada.Interrupts.Names;

with Ada.Unchecked_Conversion;
with Interfaces;
with System.Interrupts.Xh3irq;

package body System.Interrupts is

   type Handler_Wrapper is access procedure (Obj : System.Address);

   type Handler_With_Parameter is record
      Wrapper           : Handler_Wrapper;
      Parameter         : System.Address;
   end record;

   Interrupt_Handlers : array (Interrupt_ID) of Handler_With_Parameter
      := (others => (null, System.Null_Address));

   type Parameterless_Handler_Impl is record
      Object  : System.Address;
      Wrapper : Handler_Wrapper;
   end record
   with
     Size => 64;
   --  This is the blob the compiler gives us:
   --  Wrapper is the address of the handler procedure.
   --  Object contains any parameters it might take.

   function To_Impl_View
     is new Ada.Unchecked_Conversion (Parameterless_Handler,
                                      Parameterless_Handler_Impl);

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : New_Handler_Array) is
   begin
      for H of Handlers loop
         declare
            --  Get the implementation view of the actual handler.
            Impl : constant Parameterless_Handler_Impl :=
              To_Impl_View (H.Handler);
         begin
            if Interrupt_Handlers (H.Interrupt).Wrapper /= null then
               raise Program_Error with "interrupt already registered";
            end if;
            Interrupt_Handlers (H.Interrupt) := (Impl.Wrapper, Impl.Object);

            Xh3irq.Enable_Interrupt (H.Interrupt);
            Xh3irq.Set_Priority (H.Interrupt, Prio - Interrupt_Priority'First);
         end;
      end loop;
   end Install_Restricted_Handlers;

   --  IRQ_Handler is called for all peripheral interrupts.

   --  The parameter Cause, from the MCAUSE register, will have bit 31
   --  set; the lower 5 bits are the machine interrupt, 0 .. 31.
   procedure IRQ_Handler (Cause : Interfaces.Unsigned_32)
   with Export,
     Convention => C,
     External_Name => "freertos_risc_v_application_interrupt_handler";

   procedure IRQ_Handler (Cause : Interfaces.Unsigned_32) is
      pragma Unreferenced (Cause);
      Next_Interrupt : Xh3irq.Next_Interrupt_Info;
   begin
      Get_Next_Interrupt :
      loop
         Next_Interrupt := Xh3irq.Get_Next_Interrupt;
         exit Get_Next_Interrupt when not Next_Interrupt.Valid;

         --  Is there a handler installed?
         if Interrupt_Handlers (Next_Interrupt.ID).Wrapper = null then
            Xh3irq.Read_Bit_Array;
            raise Program_Error with "interrupt not installed";
         end if;

         --  Call the installed handler
         Interrupt_Handlers (Next_Interrupt.ID)
           .Wrapper (Interrupt_Handlers (Next_Interrupt.ID).Parameter);
      end loop Get_Next_Interrupt;
   end IRQ_Handler;

begin
   null;
end System.Interrupts;
