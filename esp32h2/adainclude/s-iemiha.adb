--  Copyright (C) 2024 Free Software Foundation, Inc.
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

--  This is the ESP32-H2 (Risc-V) version.

with ESP32_H2.INTPRI;

separate (System.Interrupts)
procedure Enable_Machine_Interrupt_Handler
  (For_Interrupt           : Interrupt_ID;
   Using_Machine_Interrupt : Machine_Interrupt_ID;
   At_Priority             : Machine_Interrupt_Priority)
is
   --  For_Interrupt is the peripheral interrupt source to be
   --  connected to the CPU peripheral interrupt
   --  Using_Machine_Interrupt, at At_Priority.
   --
   --  We use Edge interrupts only (for now).

   use ESP32_H2;
   use ESP32_H2.INTPRI;

   Saved_MSTATUS : UInt32;
begin
   --  Procedure for setting interrupt info, per TRM 1.6.3.2; with
   --  omissions rectified.

   --  1. save the state of MSTATUS and clear MSTATUS.MIE (bit 3).
   System.Machine_Code.Asm
     ("csrrc %1, mstatus, %0",
      Outputs  => UInt32'Asm_Output ("=r", Saved_MSTATUS),
      Inputs   => UInt32'Asm_Input ("r", 2#1000#),
      Volatile => True);

   --  2. depending upon the type of the interrupt (edge/level),
   --  set/unset the nth bit of INTPRI_CORE0_CPU_INT_TYPE_REG
   --  We use EDGE, so set the bit.
   INTPRI_Periph.CPU_INT_TYPE :=
     @ or (Shift_Left (1, Integer (Using_Machine_Interrupt)));

   --  3. set the priority by writing a value to
   --  INTPRI_CORE0_CPU_INT_PRI_n_REG in range 1 (lowest) to 15
   --  (highest)
   Priority_Map :
   declare
      --  These declarations take the place of the 16 distinct
      --  register declarations in the SVD.
      type Priority_Map_Register is record
         Priority : UInt4  := 0;
         Reserved : UInt28 := 0;
      end record
      with Volatile_Full_Access, Object_Size => 32,
        Bit_Order                            => System.Low_Order_First;
      for Priority_Map_Register use record
         Priority at 0 range 0 ..  3;
         Reserved at 0 range 4 .. 31;
      end record;
      type Priority_Map_Register_Array
      is array (Machine_Interrupt_ID) of Priority_Map_Register
          with Component_Size => 32, Object_Size => 32 * 32;
      type INTPRI_Peripheral_With_Array is record
         Priority_Map_Registers : Priority_Map_Register_Array;
      end record
      with Volatile;
      for INTPRI_Peripheral_With_Array use record
         --  See TRM 9.6.2, INTPRI_CORE0_CPU_INT_PRI_0_REG is at offset
         --  0x000C from the interrupt priority base address.
         Priority_Map_Registers at 16#C# range 0 .. 32 * 32 - 1;
      end record;
      Peripheral_With_Array : aliased INTPRI_Peripheral_With_Array
      with Import, Address => INTPRI_Base;
   begin
      Peripheral_With_Array.Priority_Map_Registers (Using_Machine_Interrupt)
        := (Priority => UInt4 (At_Priority),
         others => <>);
   end Priority_Map;

   --  4. set the nth bit of INTPRI_CORE0_CPU_INT_ENABLE_REG
   INTPRI_Periph.CPU_INT_ENABLE :=
     @ or Shift_Left (1, Integer (Using_Machine_Interrupt));

   --  4A. assign the source to the interrupt. Not mentioned in TRM
   --  1.3.6.2, but clearly necessary!
   --  See TRM 9.5.3.
   Interrupt_Map :
   declare
      --  These declarations take the place of the 65 distinct mapping
      --  registers described in TRM 9.6.1.
      Number_Of_Sources : constant
      := Interrupt_ID'Last - Interrupt_ID'First + 1;
      type Source_Map_Register is record
         Machine_Interrupt_ID : UInt5  := 0;
         Reserved             : UInt27 := 0;
      end record
      with Volatile_Full_Access, Object_Size => 32,
        Bit_Order                            => System.Low_Order_First;
      for Source_Map_Register use record
         Machine_Interrupt_ID at 0 range 0 ..  4;
         Reserved             at 0 range 5 .. 31;
      end record;
      type Source_Map_Register_Array
      is array (Interrupt_ID) of Source_Map_Register
          with Component_Size => 32, Object_Size => 32 * Number_Of_Sources;
      type INTERRUPT_CORE0_Peripheral_With_Array is record
         Source_Map_Registers : Source_Map_Register_Array;
      end record
      with Volatile;
      for INTERRUPT_CORE0_Peripheral_With_Array use record
         Source_Map_Registers at 0 range 0 .. 32 * Number_Of_Sources - 1;
      end record;
      Peripheral_With_Array : aliased INTERRUPT_CORE0_Peripheral_With_Array
      with Import, Address => INTERRUPT_CORE0_Base;
   begin
      Peripheral_With_Array.Source_Map_Registers (For_Interrupt)
        := (Machine_Interrupt_ID => UInt5 (Using_Machine_Interrupt),
         others => <>);
   end Interrupt_Map;

   --  Set this machine interrupt's bit in MIE.
   System.Machine_Code.Asm
     ("csrs mie, %0",
      Inputs   => UInt32'Asm_Input
        ("r", Shift_Left (1, Integer (Using_Machine_Interrupt))),
      Volatile => True);

   --  5. execute FENCE instruction
   System.Machine_Code.Asm
     ("fence.i",
      Volatile => True);

   --  6. If it was previously set, set MSTATUS.MIE. Assume no one has
   --  changed any of the other bits in MSTATUS while interrupts were
   --  inhibited.
   System.Machine_Code.Asm
     ("csrs mstatus, %0",
      Inputs   => UInt32'Asm_Input ("r", Saved_MSTATUS),
      Volatile => True);

   --  Clear MSTATUS.MPIE. This probably isn't necessary, since we
   --  aren't in an interrupt at this point and aren't about to
   --  execute an mret (which would copy mpie into mie).
   System.Machine_Code.Asm
     ("csrc mstatus, %0",
      Inputs   => UInt32'Asm_Input ("r", 2#1000_0000#),
      Volatile => True);

end Enable_Machine_Interrupt_Handler;
