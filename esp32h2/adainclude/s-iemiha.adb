with Ada.Interrupts.Names;
with ESP32_H2.INTMTX_CORE0;
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
   --  We use Level interrupts; Edge interrupts are, I think, somewhat
   --  limited.

   use Ada.Interrupts.Names;
   use ESP32_H2;
   use ESP32_H2.INTMTX_CORE0;
   use ESP32_H2.INTPRI;

   Saved_MIE : UInt32;
begin
   --  Procedure for setting interrupt info, per TRM 1.6.3.2; with
   --  omissions rectified.

   --  1. save the state of MIE and clear MIE to 0
   System.Machine_Code.Asm
     ("csrr %0, mie" & ASCII.LF
        & "csrc mie, %1",
      Outputs  => UInt32'Asm_Output ("=r", Saved_MIE),
      Inputs   => UInt32'Asm_Input ("r", 16#FFFF_FFFF#),
      Volatile => True);

   --  2. depending upon the type of the interrupt (edge/level),
   --  set/unset the nth bit of INTPRI_CORE0_CPU_INT_TYPE_REG
   --  We use LEVEL, so clear the bit.

   INTPRI_Periph.CPU_INT_TYPE :=
     @ and not (Shift_Left (1, Integer (Using_Machine_Interrupt)));

   --  3. set the priority by writing a value to
   --  INTPRI_CORE0_CPU_INT_PRI_n_REG in range 1 (lowest) to 15
   --  (highest)

   case Using_Machine_Interrupt is
      when 1 =>
         INTPRI_Periph.CPU_INT_PRI_22 :=
           (CPU_PRI_22_MAP => UInt4 (At_Priority), others => <>);
      when others =>
         raise Program_Error
           with "unhandled machine interrupt" & Using_Machine_Interrupt'Image;
   end case;

   --  4. set the nth bit of INTPRI_CORE0_CPU_INT_ENABLE_REG
   INTPRI_Periph.CPU_INT_ENABLE :=
     @ or Shift_Left (1, Integer (Using_Machine_Interrupt));

   --  4A. assign the source to the interrupt. Not mentioned in TRM
   --  1.3.6.2, but clearly necessary!
   case For_Interrupt is
      when GPIO_Interrupt =>
         INTERRUPT_CORE0_Periph.GPIO_INTERRUPT_PRO_MAP :=
           (GPIO_INTERRUPT_PRO_MAP => UInt5 (For_Interrupt),
            others => <>);
      when others =>
         raise Program_Error
           with "unhandled peripheral interrupt" & For_Interrupt'Image;
   end case;

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

end Enable_Machine_Interrupt_Handler;
