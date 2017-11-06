--  Copyright (C) 2016 Free Software Foundation, Inc.
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

with Ada.Unchecked_Conversion;
with Interfaces;
with System.Machine_Code;

package body System.Interrupts is

   type Handler_Wrapper is access procedure (Obj : System.Address);

   type Handler_With_Parameter is record
      Wrapper   : Handler_Wrapper;
      Parameter : System.Address;
   end record;

   Interrupt_Handlers : array (Interrupt_ID) of Handler_With_Parameter
     := (others => (null, System.Null_Address));

   type Parameterless_Handler_Impl is record
      Object  : System.Address;
      Wrapper : Handler_Wrapper;
   end record
   with
     Size => 64;

   function To_Impl_View
     is new Ada.Unchecked_Conversion (Parameterless_Handler,
                                      Parameterless_Handler_Impl);

   --  Nested Vectored Interrupt Controller, 11057 23-Mar-15, Chapter 10.20;
   --  more detail at http://infocenter.arm.com/

   type Bits_1 is mod 2   with Size => 1;
   type Bits_8 is mod 256 with Size => 8;

   type Bits_32x1 is array (0 .. 31) of Bits_1 with Pack, Size => 32;
   type Bits_32x8 is array (0 .. 3)  of Bits_8 with Pack, Size => 32;

   type Bits_32x1_Array is array (Natural range <>) of Bits_32x1;
   type Bits_32x8_Array is array (Natural range <>) of Bits_32x8;

   type NVIC_T is record
      ISER : Bits_32x1_Array (0 .. 7);
      ICER : Bits_32x1_Array (0 .. 7);
      ISPR : Bits_32x1_Array (0 .. 7);
      ICPR : Bits_32x1_Array (0 .. 7);
      IABR : Bits_32x1_Array (0 .. 7);
      IPR  : Bits_32x8_Array (0 .. 59);
      STIR : Interfaces.Unsigned_32;
   end record
   with Convention => Ada, Volatile, Size => 8 * (16#0E00# + 4);
   --  See ARMv7M Architecture Reference Manual, 2 Dec 2014, Table B3-8

   for NVIC_T use record
      ISER at 16#0000# range 0 .. 255;
      ICER at 16#0080# range 0 .. 255;
      ISPR at 16#0100# range 0 .. 255;
      ICPR at 16#0180# range 0 .. 255;
      IABR at 16#0200# range 0 .. 255;
      IPR  at 16#0300# range 0 .. 1919;
      STIR at 16#0E00# range 0 .. 31;
   end record;

   NVIC : NVIC_T
     with
       Import,
       Convention => Ada,
       Address => System'To_Address (16#E000E100#);

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : New_Handler_Array) is
      --  Note, because the NVIC is configured to have 4 priority bits
      --  and no subpriority bits, the actual interrupt priority is to
      --  be held in the top 4 bits of NVIC.IPR (n).
      --
      --  The lowest interrupt priority is 15, the highest permissible
      --  one to avoid trampling on FreeRTOS is 5 (see
      --  FreeRTOSConfig.h).
   begin
      for H of Handlers loop
         declare
            Impl : constant Parameterless_Handler_Impl :=
              To_Impl_View (H.Handler);
            Interrupt : constant Natural := Natural (H.Interrupt);
         begin
            if Interrupt_Handlers (H.Interrupt).Wrapper /= null then
               raise Program_Error with "interrupt already registered";
            end if;
            Interrupt_Handlers (H.Interrupt) := (Impl.Wrapper, Impl.Object);
            declare
               Index    : constant Natural := Interrupt / 4;
               Position : constant Natural := Interrupt mod 4;
               IPR      : Bits_32x8        := NVIC.IPR (Index);
            begin
               IPR (Position) :=
                 Bits_8 (15 - (Prio - System.Interrupt_Priority'First))
                 * 16; -- top 4 bits
               NVIC.IPR (Index) := IPR;
            end;
            declare
               Index    : constant Natural := Interrupt / 32;
               Position : constant Natural := Interrupt mod 32;
               Setting  : Bits_32x1        := (others => 0);
            begin
               Setting (Position) := 1;
               NVIC.ISER (Index) := Setting;
            end;
         end;
      end loop;
   end Install_Restricted_Handlers;

   procedure Install_Restricted_Handlers_Sequential is
   begin
      null;
   end Install_Restricted_Handlers_Sequential;

   --  Startup contains a weak definition of this symbol; so when this
   --  package is called in, during the link of user code that
   --  actually uses interrupts, this definition will be used instead.
   --
   --  IRQ_Handler is called for all peripheral interrupts.
   procedure IRQ_Handler
   with Export, Convention => Ada, External_Name => "IRQ_Handler";

   procedure IRQ_Handler is
      IPSR : Interfaces.Unsigned_32;
      ID : Interrupt_ID;
--        with Volatile; -- don't want it to be optimised away
      use type Interfaces.Unsigned_32;
   begin
      System.Machine_Code.Asm
        ("mrs %0, ipsr",
         Outputs => Interfaces.Unsigned_32'Asm_Output ("=r", IPSR),
         Volatile => True);

      --  The IPSR is the offset in the interrupt vector, which
      --  includes all the hardware/RTOS interrupts. We only care
      --  about peripheral interrupts.
      ID := Interrupt_ID (IPSR - 16);

      --  Is there a handler installed?
      if Interrupt_Handlers (ID).Wrapper = null then
         raise Program_Error with "interrupt not installed";
      end if;

      --  Call the installed handler
      Interrupt_Handlers (ID).Wrapper (Interrupt_Handlers (ID).Parameter);
   end IRQ_Handler;

end System.Interrupts;
