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

--  This package is for ESP32-H2.

with Ada.Unchecked_Conversion;
with Interfaces;
with System.Machine_Code;

with ESP32_H2.INTPRI;

package body System.Interrupts is

   type Machine_Interrupt_ID is range 0 .. 31;
   subtype Machine_Interrupt_Priority is Integer range 1 .. 15;
   --  See TRM 9.5.2.

   type Machine_Interrupt_Data (Available : Boolean := True;
                                Allocated : Boolean := False) is
      record
         case Available is
            when True =>
               case Allocated is
                  when True =>
                     Interrupt : Interrupt_ID;
                  when False =>
                     null;
               end case;
            when False =>
               null;
         end case;
      end record;
   --  A particular machine interrupt may be Available (because not
   --  used for core-local interrupts, CLINTs), and if so may be
   --  Allocated to a particular peripheral source (Interrupt_ID).

   Machine_Interrupts : array (Machine_Interrupt_ID)
     of Machine_Interrupt_Data
     := (0 | 3 | 4 | 7 => (Available => False, Allocated => False),
         others => <>);

   type Handler_Wrapper is access procedure (Obj : System.Address);

   type Handler_With_Parameter is record
      Machine_Interrupt : Machine_Interrupt_ID;
      Wrapper           : Handler_Wrapper;
      Parameter         : System.Address;
   end record;

   Interrupt_Handlers : array (Interrupt_ID) of Handler_With_Parameter
     := (others => (0, null, System.Null_Address));

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

   procedure Enable_Machine_Interrupt_Handler
     (For_Interrupt           : Interrupt_ID;
      Using_Machine_Interrupt : Machine_Interrupt_ID;
      At_Priority             : Machine_Interrupt_Priority);

   procedure Enable_Machine_Interrupt_Handler
     (For_Interrupt           : Interrupt_ID;
      Using_Machine_Interrupt : Machine_Interrupt_ID;
      At_Priority             : Machine_Interrupt_Priority) is separate;

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : New_Handler_Array) is
      Machine_Priority : constant Machine_Interrupt_Priority
        := (if Prio in System.Interrupt_Priority
            then Prio - System.Max_Priority
            else raise Program_Error with "not interrupt priority");
   begin
      for H of Handlers loop
         Install_One_Handler :
         declare
            --  Get the implementation view of the actual handler.
            Impl : constant Parameterless_Handler_Impl :=
              To_Impl_View (H.Handler);
            Handler_Installed : Boolean := False;
            --  Check whether we found a free machine interrupt.
            --  Raise PE if the interrupt is already registered.
         begin
            if (for some MI of Machine_Interrupts =>
                  MI.Available
                    and then MI.Allocated
                    and then MI.Interrupt = H.Interrupt)
            then
               raise Program_Error with "interrupt already registered (1)";
            end if;
            if Interrupt_Handlers (H.Interrupt).Wrapper /= null then
               raise Program_Error with "interrupt already registered (2)";
            end if;
            Find_Free_Machine_Interrupt :
            for M in Machine_Interrupts'Range loop
               if Machine_Interrupts (M).Available
                 and then not Machine_Interrupts (M).Allocated
               then
                  Interrupt_Handlers (H.Interrupt) :=
                    (Machine_Interrupt => M,
                     Wrapper           => Impl.Wrapper,
                     Parameter         => Impl.Object);

                  Machine_Interrupts (M) :=
                    (Available => True,
                     Allocated => True,
                     Interrupt => H.Interrupt);

                  Enable_Machine_Interrupt_Handler
                    (For_Interrupt           => H.Interrupt,
                     Using_Machine_Interrupt => M,
                     At_Priority             => Machine_Priority);

                  Handler_Installed := True;
                  exit Find_Free_Machine_Interrupt;
               end if;
            end loop Find_Free_Machine_Interrupt;
            if not Handler_Installed then
               raise Program_Error with "no free machine interrupt";
            end if;
         end Install_One_Handler;
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
      use type Interfaces.Unsigned_32;
      Interrupt_Data : constant Machine_Interrupt_Data
        := Machine_Interrupts (Machine_Interrupt_ID (Cause and 16#1f#));
   begin
      if not Interrupt_Data.Available
      then
         raise Program_Error with "interrupt not available";
      end if;

      if not Interrupt_Data.Allocated then
         raise Program_Error with "interrupt not allocated";
      end if;

      declare
         ID : constant Interrupt_ID := Interrupt_Data.Interrupt;
      begin
         if Interrupt_Handlers (ID).Wrapper = null then
            raise Program_Error with "interrupt not installed";
         end if;

         --  Confusingly, there are level/edge CPU interrupts, and
         --  level/edge GPIO interrupts. I believe that all our
         --  interrupts are going to be edge, so the interrupt must be
         --  cleared here.

         declare
            use ESP32_H2;
            Int_Bit : constant UInt32 := Shift_Left (1, Natural (ID));
            use ESP32_H2.INTPRI;
         begin
            --  TRM 1.6.2(6): set, then clear.
            INTPRI_Periph.CPU_INT_CLEAR := @ or Int_Bit;
            INTPRI_Periph.CPU_INT_CLEAR := @ and not Int_Bit;
         end;

         --  Call the installed handler
         Interrupt_Handlers (ID).Wrapper (Interrupt_Handlers (ID).Parameter);
      end;
   end IRQ_Handler;

begin
   --  The V11.1.0 FreeRTOS xPortStartScheduler sets MIE bit 11, which
   --  in a RISC-V-conforming arcitecture would enable external
   --  interrupts. We need to disable it, because in ESP32-H2 it
   --  enables machine interrupt 11.
   --
   --  XXXX just pro tem, I'm going to clear *all* the bits except bit
   --  7, because of random settings ...
   System.Machine_Code.Asm
     ("csrc mie, %0",
      Inputs   => Interfaces.Unsigned_32'Asm_Input ("r", 16#ffff_ff7f#),
      Volatile => True);

   --  This is just a check.
   declare
      MIE : Interfaces.Unsigned_32;
   begin
      System.Machine_Code.Asm
        ("csrr %0, mie",
         Outputs  => Interfaces.Unsigned_32'Asm_Output ("=r", MIE),
         Volatile => True);
      null;
   end;
end System.Interrupts;
