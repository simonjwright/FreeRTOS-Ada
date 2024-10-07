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

with Board_Support;
with Interfaces.C;
with System.Machine_Code;
with System.Parameters;
with System.Storage_Elements;

--  For environment task creation
with Environment_Task;
with System.FreeRTOS.Tasks;

package body Startup is

   --  Program_Entry is the program entry point.
   pragma Warnings (Off, """Program_Entry"" is marked as No_Return");
   procedure Program_Entry
   with
     Export,
     Convention => Ada,
     External_Name => "program_entry",
     Linker_Section => ".program_entry",
     No_Return;
   pragma Machine_Attribute (Program_Entry, "naked");

   procedure Program_Entry is
   begin
      --  This is called at program entry, before the stack pointer is
      --  set up, which is why it's 'naked'. We can't call any
      --  subprograms until some assembly-level initialization has
      --  been done, in particular the stack pointer.

      --  See, for example, https://five-embeddev.com/baremetal/startup_c/.

      System.Machine_Code.Asm
        (
         ".option push;" & ASCII.LF &
           ".option norelax;" & ASCII.LF &
           "la    gp, __global_pointer$;" & ASCII.LF &
           ".option pop;" & ASCII.LF &
           "la    sp, __freertos_irq_stack_top;" & ASCII.LF &
           "jal   zero, startup__program_initialization"
         ,
         --  no input, output, or clobbers
         Volatile => True);

   end Program_Entry;

   pragma Warnings (Off, "not referenced");
   pragma Warnings (Off, """Program_Initialization"" is marked as No_Return");
   procedure Program_Initialization
   with No_Return;
   pragma Warnings (On, "not referenced");

   --  Used in Program_Initialization to copy rw data from flash to sram.
   --  Modelled after memcpy().
   --  Needed because of GCC PR 115591.
   procedure Copy (Dst : out System.Storage_Elements.Storage_Array;
                   Src :     System.Storage_Elements.Storage_Array);

   --  Used in Program_Initialization to initialise bss.
   --  Modelled after memset().
   --  Needed because of GCC PR 115591.
   procedure Set (Dst : out System.Storage_Elements.Storage_Array;
                  To  :     System.Storage_Elements.Storage_Element);

   procedure Set_Up_Heap;
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

   procedure Set_Up_Interrupt_Vector with Inline_Always;
   --  For RISC-V, we have to set up 'mtvec'.
   procedure Set_Up_Interrupt_Vector is
   begin
      --  The 'mtvec' register holds the address of the vector table
      --  (the bottom 8 bits are ignored); bit 0 is the Mode bit, if
      --  set the machine uses vectored interrupts.
      System.Machine_Code.Asm
        ("la t0, _isr_vector_table" & ASCII.LF &
           "ori t0, t0, 1" & ASCII.LF &
           "csrw mtvec, t0",
         Clobber => "t0",
         Volatile => True);
   end Set_Up_Interrupt_Vector;

   --  Separate to reduce the complexity of this file.
   procedure Set_Up_Heap is separate;

   procedure Set_Up_Clock;
   --  Separate to reduce the complexity of this file.
   procedure Set_Up_Clock is separate;

   procedure Initialize_Watchdog
   with
     Export,
     Convention => Ada,
     External_Name => "initialize_watchdog";
   pragma Weak_External (Initialize_Watchdog);
   procedure Initialize_Watchdog is separate;

   procedure Program_Initialization is
      --  The following symbols are set up in the linker script:
      --
      --  _start_flash_data: the start of read/write data in Flash, to be
      --           copied to SRAM
      --  _start_sram_data:  where read/write data is to be copied to
      --  _end_sram_data:    the first address after read/write data in SRAM
      --  _start_bss:        the start of BSS (to be initialized to zero)
      --  _end_bss:          the first address after BSS.
      --
      --  _isr_vector_table is set up in interrupt_vectors.S.

      use System.Storage_Elements;

      Start_Sram_Data : Storage_Element
        with Import, Convention => Asm, External_Name => "_start_sram_data";
      End_Sram_Data   : Storage_Element
        with Import, Convention => Asm, External_Name => "_end_sram_data";
      Start_Bss       : Storage_Element
        with Import, Convention => Asm, External_Name => "_start_bss";
      End_Bss         : Storage_Element
        with Import, Convention => Asm, External_Name => "_end_bss";

      Data_Size : constant Storage_Offset
        := End_Sram_Data'Address - Start_Sram_Data'Address;

      --  Index from 1 so as to avoid subtracting 1 from the size
      subtype Data_Storage_Array is Storage_Array (1 .. Data_Size);

      Data_In_Flash : Data_Storage_Array
        with Import, Convention => Asm, External_Name => "_start_flash_data";

      Data_In_Sram : Data_Storage_Array
        with Import, Convention => Asm, External_Name => "_start_sram_data";

      Bss_Size : constant Storage_Offset
        := End_Bss'Address - Start_Bss'Address;

      subtype Bss_Storage_Array is Storage_Array (1 .. Bss_Size);

      Bss : Bss_Storage_Array
        with Import, Convention => Ada, External_Name => "_start_bss";

   begin

      --  Copy data to SRAM
      Copy (Src => Data_In_Flash,
            Dst => Data_In_Sram);

      --  Initialize BSS in SRAM
      Set (Dst => Bss,
           To => 0);

      Initialize_Watchdog;

      Set_Up_Interrupt_Vector;
      Set_Up_Heap;

      Board_Support.Initialize;

      Set_Up_Clock;

      Environment_Task.Create;

      --  Start the scheduler, which will run the environment task to
      --  perform elaboration and then execute the Ada main program.
      System.FreeRTOS.Tasks.Start_Scheduler;
   end Program_Initialization;

   procedure Copy (Dst : out System.Storage_Elements.Storage_Array;
                   Src :     System.Storage_Elements.Storage_Array)
   is
   begin
      Dst := Src;
   end Copy;

   procedure Set (Dst : out System.Storage_Elements.Storage_Array;
                  To  :     System.Storage_Elements.Storage_Element)
   is
   begin
      Dst := (others => To);
   end Set;

end Startup;
