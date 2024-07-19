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
      --  UGH
      when 0 =>
         INTPRI_Periph.CPU_INT_PRI_0 :=
           (CPU_PRI_0_MAP => UInt4 (At_Priority), others => <>);
      when 1 =>
         INTPRI_Periph.CPU_INT_PRI_1 :=
           (CPU_PRI_1_MAP => UInt4 (At_Priority), others => <>);
      when 2 =>
         INTPRI_Periph.CPU_INT_PRI_2 :=
           (CPU_PRI_2_MAP => UInt4 (At_Priority), others => <>);
      when 3 =>
         INTPRI_Periph.CPU_INT_PRI_3 :=
           (CPU_PRI_3_MAP => UInt4 (At_Priority), others => <>);
      when 4 =>
         INTPRI_Periph.CPU_INT_PRI_4 :=
           (CPU_PRI_4_MAP => UInt4 (At_Priority), others => <>);
      when 5 =>
         INTPRI_Periph.CPU_INT_PRI_5 :=
           (CPU_PRI_5_MAP => UInt4 (At_Priority), others => <>);
      when 6 =>
         INTPRI_Periph.CPU_INT_PRI_6 :=
           (CPU_PRI_6_MAP => UInt4 (At_Priority), others => <>);
      when 7 =>
         INTPRI_Periph.CPU_INT_PRI_7 :=
           (CPU_PRI_7_MAP => UInt4 (At_Priority), others => <>);
      when 8 =>
         INTPRI_Periph.CPU_INT_PRI_8 :=
           (CPU_PRI_8_MAP => UInt4 (At_Priority), others => <>);
      when 9 =>
         INTPRI_Periph.CPU_INT_PRI_9 :=
           (CPU_PRI_9_MAP => UInt4 (At_Priority), others => <>);
      when 10 =>
         INTPRI_Periph.CPU_INT_PRI_10 :=
           (CPU_PRI_10_MAP => UInt4 (At_Priority), others => <>);
      when 11 =>
         INTPRI_Periph.CPU_INT_PRI_11 :=
           (CPU_PRI_11_MAP => UInt4 (At_Priority), others => <>);
      when 12 =>
         INTPRI_Periph.CPU_INT_PRI_12 :=
           (CPU_PRI_12_MAP => UInt4 (At_Priority), others => <>);
      when 13 =>
         INTPRI_Periph.CPU_INT_PRI_13 :=
           (CPU_PRI_13_MAP => UInt4 (At_Priority), others => <>);
      when 14 =>
         INTPRI_Periph.CPU_INT_PRI_14 :=
           (CPU_PRI_14_MAP => UInt4 (At_Priority), others => <>);
      when 15 =>
         INTPRI_Periph.CPU_INT_PRI_15 :=
           (CPU_PRI_15_MAP => UInt4 (At_Priority), others => <>);
      when 16 =>
         INTPRI_Periph.CPU_INT_PRI_16 :=
           (CPU_PRI_16_MAP => UInt4 (At_Priority), others => <>);
      when 17 =>
         INTPRI_Periph.CPU_INT_PRI_17 :=
           (CPU_PRI_17_MAP => UInt4 (At_Priority), others => <>);
      when 18 =>
         INTPRI_Periph.CPU_INT_PRI_18 :=
           (CPU_PRI_18_MAP => UInt4 (At_Priority), others => <>);
      when 19 =>
         INTPRI_Periph.CPU_INT_PRI_19 :=
           (CPU_PRI_19_MAP => UInt4 (At_Priority), others => <>);
      when 20 =>
         INTPRI_Periph.CPU_INT_PRI_20 :=
           (CPU_PRI_20_MAP => UInt4 (At_Priority), others => <>);
      when 21 =>
         INTPRI_Periph.CPU_INT_PRI_21 :=
           (CPU_PRI_21_MAP => UInt4 (At_Priority), others => <>);
      when 22 =>
         INTPRI_Periph.CPU_INT_PRI_22 :=
           (CPU_PRI_22_MAP => UInt4 (At_Priority), others => <>);
      when 23 =>
         INTPRI_Periph.CPU_INT_PRI_23 :=
           (CPU_PRI_23_MAP => UInt4 (At_Priority), others => <>);
      when 24 =>
         INTPRI_Periph.CPU_INT_PRI_24 :=
           (CPU_PRI_24_MAP => UInt4 (At_Priority), others => <>);
      when 25 =>
         INTPRI_Periph.CPU_INT_PRI_25 :=
           (CPU_PRI_25_MAP => UInt4 (At_Priority), others => <>);
      when 26 =>
         INTPRI_Periph.CPU_INT_PRI_26 :=
           (CPU_PRI_26_MAP => UInt4 (At_Priority), others => <>);
      when 27 =>
         INTPRI_Periph.CPU_INT_PRI_27 :=
           (CPU_PRI_27_MAP => UInt4 (At_Priority), others => <>);
      when 28 =>
         INTPRI_Periph.CPU_INT_PRI_28 :=
           (CPU_PRI_28_MAP => UInt4 (At_Priority), others => <>);
      when 29 =>
         INTPRI_Periph.CPU_INT_PRI_29 :=
           (CPU_PRI_29_MAP => UInt4 (At_Priority), others => <>);
      when 30 =>
         INTPRI_Periph.CPU_INT_PRI_30 :=
           (CPU_PRI_30_MAP => UInt4 (At_Priority), others => <>);
      when 31 =>
         INTPRI_Periph.CPU_INT_PRI_31 :=
           (CPU_PRI_31_MAP => UInt4 (At_Priority), others => <>);
   end case;

   --  4. set the nth bit of INTPRI_CORE0_CPU_INT_ENABLE_REG
   INTPRI_Periph.CPU_INT_ENABLE :=
     @ or Shift_Left (1, Integer (Using_Machine_Interrupt));

   --  4A. assign the source to the interrupt. Not mentioned in TRM
   --  1.3.6.2, but clearly necessary!
   --  Guessing here that it's the machine interrupt # that has to be
   --  stored.
   case For_Interrupt is
      when GPIO_Interrupt =>
         INTERRUPT_CORE0_Periph.GPIO_INTERRUPT_PRO_MAP :=
           (GPIO_INTERRUPT_PRO_MAP => UInt5 (Using_Machine_Interrupt),
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
