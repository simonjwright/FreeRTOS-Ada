--  Copyright (C) 2017-2024 Free Software Foundation, Inc.
--
--  This file is part of the FreeRTOS-Ada project. This file is
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

--  This procedure configures the FreeRTOS implementation in heap_5.c,
--  q.v.

--  The following symbols must be exported from the linker script:
--
--  _start_flash_data: where rw data to be copied to sram starts in flash
--  _start_sram_data:  where rw data is to be copied to in sram
--  _end_sram_data:    first free location after rw data in sram
--  _start_bss:        where to start initializing bss to zero
--  _end_bss:          first free location after bss
--  _end_stack:        first free location after stack

with Interfaces.C;
with System.Parameters;

separate (Startup)
procedure Set_Up_Heap is

   type Heap_Region is record
      Start_Address : System.Address;
      Size_In_Bytes : Interfaces.C.size_t;
   end record
   with Convention => C;

   type Heap_Regions is array (Natural range <>) of Heap_Region
   with Convention => C;

   procedure Define_Heap_Regions (Heaps : Heap_Regions)
   with
     Import,
     Convention => C,
     External_Name => "vPortDefineHeapRegions";

   use System.Storage_Elements;

   End_Of_Bss : Storage_Element
     with Import, Convention => Asm, External_Name => "_end_bss";

   End_Of_Stack : Storage_Element
     with Import, Convention => Asm, External_Name => "_end_stack";

   use type System.Address;

   Heaps : constant Heap_Regions
     := ((Start_Address => End_Of_Bss'Address,
          Size_In_Bytes =>
            Interfaces.C.size_t
              (End_Of_Stack'Address
                 - End_Of_Bss'Address
                 - (if Default_Initial_Stack'Address = System.Null_Address
                    then 1024
                    else Storage_Offset (Default_Initial_Stack)))),
         (Start_Address => System.Null_Address,
          Size_In_Bytes => 0));

begin
   Define_Heap_Regions (Heaps);
end Set_Up_Heap;
