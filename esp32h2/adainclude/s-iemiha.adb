--  with Ada.Interrupts.Names;
--  with ESP32_H2.INTMTX_CORE0;
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

   --  use Ada.Interrupts.Names;
   use ESP32_H2;
   --  use ESP32_H2.INTMTX_CORE0;
   use ESP32_H2.INTPRI;

   Saved_MIE : UInt32;
begin
   --  Procedure for setting interrupt info, per TRM 1.6.3.2; with
   --  omissions rectified.

   --  1. save the state of MIE and clear MIE to 0
   --  I think this should be in one instruction.             XXXXX
   System.Machine_Code.Asm
     ("csrr %0, mie" & ASCII.LF
        & "csrc mie, %1",
      Outputs  => UInt32'Asm_Output ("=r", Saved_MIE),
      Inputs   => UInt32'Asm_Input ("r", 16#FFFF_FFFF#),
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
      type Priority_Map_Register is record
         Priority : UInt4 := 0;
         Reserved : UInt28 := 0;
      end record
      with Volatile_Full_Access, Object_Size => 32,
        Bit_Order => System.Low_Order_First;
      for Priority_Map_Register use record
         Priority at 0 range 0 .. 3;
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
         Priority_Map_Registers at 16#C# range 0 .. 32 * 32 - 1;
      end record;
      Peripheral_With_Array : aliased INTPRI_Peripheral_With_Array
        with Import, Address => INTPRI_Base;
   begin
      Peripheral_With_Array.Priority_Map_Registers (Using_Machine_Interrupt)
        := (Priority => UInt4 (At_Priority),
            others   => <>);
   end Priority_Map;

   --  4. set the nth bit of INTPRI_CORE0_CPU_INT_ENABLE_REG
   INTPRI_Periph.CPU_INT_ENABLE :=
     @ or Shift_Left (1, Integer (Using_Machine_Interrupt));

   --  From answer in Espressif forum,
   --  INTERRUPT_CORE0_Periph.CPU_INTR_FROM_CPU_0_MAP :=
   --    (CPU_INTR_FROM_CPU_0_MAP => 1, others => <>);
   --  INTPRI_Periph.CPU_INTR_FROM_CPU_0 :=
   --    (CPU_INTR_FROM_CPU_0 => 1,
   --     others => <>);

   --  4A. assign the source to the interrupt. Not mentioned in TRM
   --  1.3.6.2, but clearly necessary!
   --  See TRM 9.5.3.
   Interrupt_Map :
   declare
      Number_Of_Sources : constant
      := Interrupt_ID'Last - Interrupt_ID'First + 1;
      type Source_Map_Register is record
         Machine_Interrupt_ID : UInt5  := 0;
         Reserved             : UInt27 := 0;
      end record
      with Volatile_Full_Access, Object_Size => 32,
        Bit_Order => System.Low_Order_First;
      for Source_Map_Register use record
         Machine_Interrupt_ID at 0 range 0 .. 4;
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
            others               => <>);
   end Interrupt_Map;

   --  5. execute FENCE instruction
   System.Machine_Code.Asm
     ("fence",
      Volatile => True);

   --  6. restore the state of MIE + _this_ machine interrupt.
   Saved_MIE :=
     @ or Shift_Left (1, Integer (Using_Machine_Interrupt));
   System.Machine_Code.Asm
     ("csrs mie, %0",
      Inputs   => UInt32'Asm_Input ("r", Saved_MIE),
      Volatile => True);

   --  diagnostic
   declare
      Current_MIE : UInt32;
   begin
      System.Machine_Code.Asm
        ("csrr %0, mie",
         Outputs  => UInt32'Asm_Output ("=r", Current_MIE),
         Volatile => True);
      null;
   end;
end Enable_Machine_Interrupt_Handler;
