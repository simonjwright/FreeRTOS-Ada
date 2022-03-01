--  Copyright (C) 2016-2021 Free Software Foundation, Inc.
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

with Interfaces;
with System.Machine_Code;
with System.Parameters;
with System.Storage_Elements;

--  For environment task creation
with Environment_Task;
with System.FreeRTOS.Tasks;

package body Startup is

   --  Program_Initialization is the program entry point.
   procedure Program_Initialization
   with
     Export,
     Convention => Ada,
     External_Name => "program_initialization",
     No_Return;

   --  If the link includes a symbol _default_initial_stack,
   --  use this as the storage size: otherwise, use 1024.
   --
   --  Used in Set_Up_Heap, but declared here because the argument for
   --  pragma "Weak_External" must be a library-level entity.
   Default_Initial_Stack : constant System.Parameters.Size_Type
   with
     Import,
     Convention => Ada,
     External_Name => "_default_initial_stack";
   pragma Weak_External (Default_Initial_Stack);

   procedure Set_Up_Heap;
   --  Separate to reduce the complexity of this file.
   procedure Set_Up_Heap is separate;

   procedure Set_Up_Clock;
   --  Separate to reduce the complexity of this file.
   procedure Set_Up_Clock is separate;

   procedure Program_Initialization is
      --  The following symbols are set up in the linker script:
      --
      --  _sidata: the start of read/write data in Flash, to be copied
      --           to SRAM
      --  _sdata:  where read/write data is to be copied to
      --  _edata:  the first address after read/write data in SRAM
      --  _sbss:   the start of BSS (to be initialized to zero)
      --  _ebss:   the first address after BSS.
      --
      --  _isr_vector is set up in interrupt_vectors.s.

      use System.Storage_Elements;

      Sdata : Storage_Element
        with Import, Convention => Asm, External_Name => "_sdata";
      Edata : Storage_Element
        with Import, Convention => Asm, External_Name => "_edata";
      Sbss : Storage_Element
        with Import, Convention => Asm, External_Name => "_sbss";
      Ebss : Storage_Element
        with Import, Convention => Asm, External_Name => "_ebss";

      Data_Size : constant Storage_Offset := Edata'Address - Sdata'Address;

      --  Index from 1 so as to avoid subtracting 1 from the size
      Data_In_Flash : Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "_sidata";

      Data_In_Sram : Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "_sdata";

      Bss_Size : constant Storage_Offset := Ebss'Address - Sbss'Address;

      Bss : Storage_Array (1 .. Bss_Size)
        with Import, Convention => Ada, External_Name => "_sbss";

   begin
      --  Copy data to SRAM
      Data_In_Sram := Data_In_Flash;
      --  Initialize BSS in SRAM
      Bss := (others => 0);

      Set_Up_Heap;
      Set_Up_Clock;

      Environment_Task.Create;

      --  Start the scheduler, which will run the environment task to
      --  perform elaboration and then execute the Ada main program.
      System.FreeRTOS.Tasks.Start_Scheduler;
   end Program_Initialization;

   --------------------------
   --  Interrupt Handlers  --
   --------------------------

   --  The interrupt vector is set up in interrupt_vectors.s, using
   --  the handlers defined here.

   --  These handlers are all defined as Weak so that they can be
   --  replaced by real handlers at link time.

   --  If we defined the weak handlers in interrupt_vectors.s, the
   --  references would be satisfied internally and so couldn't be
   --  replaced by the real handler.

   procedure HardFault_Handler
   with Export, Convention => Ada, External_Name => "HardFault_Handler";
   pragma Weak_External (HardFault_Handler);
   procedure HardFault_Handler is
   begin
      loop
         null;
      end loop;
   end HardFault_Handler;

   --  Provided by FreeRTOS.
   procedure SVC_Handler
   with Export, Convention => Ada, External_Name => "SVC_Handler";
   pragma Weak_External (SVC_Handler);
   procedure SVC_Handler is
   begin
      loop
         null;
      end loop;
   end SVC_Handler;

   --  Provided by FreeRTOS.
   procedure PendSV_Handler
   with Export, Convention => Ada, External_Name => "PendSV_Handler";
   pragma Weak_External (PendSV_Handler);
   procedure PendSV_Handler is
   begin
      loop
         null;
      end loop;
   end PendSV_Handler;

   --  Provided by FreeRTOS.
   procedure SysTick_Handler
   with Export, Convention => Ada, External_Name => "SysTick_Handler";
   pragma Weak_External (SysTick_Handler);
   procedure SysTick_Handler is
   begin
      loop
         null;
      end loop;
   end SysTick_Handler;

   procedure RTC1_IRQHandler
   with Export, Convention => Ada, External_Name => "RTC1_IRQHandler";
   pragma Weak_External (RTC1_IRQHandler);
   procedure RTC1_IRQHandler is
   begin
      loop
         null;
      end loop;
   end RTC1_IRQHandler;

   --  The real IRQ_Handler, in System.Interrupts, uses ipsr to find
   --  which interrupt happened.
   procedure IRQ_Handler
   with Export, Convention => Ada, External_Name => "IRQ_Handler";
   pragma Weak_External (IRQ_Handler);
   procedure IRQ_Handler is
      IPSR : Interfaces.Unsigned_32
        with Volatile; -- don't want it to be optimised away
   begin
      System.Machine_Code.Asm
        ("mrs %0, ipsr",
         Outputs => Interfaces.Unsigned_32'Asm_Output ("=r", IPSR),
         Volatile => True);
      loop
         null;
      end loop;
   end IRQ_Handler;

end Startup;
