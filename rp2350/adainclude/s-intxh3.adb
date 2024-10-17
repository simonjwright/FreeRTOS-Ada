--  Supports the RP2350 extended CSRs detailed in Datasheet 3.8.6.1.

--  The type CSR_Array is the argument for the *A CSRs (MEIEA, MEIPA, MEIFA,
--  MEIPRA). INDEX is the interrupt number mod 16, the index in WINDOW is
--  interrupt number / 16.

--  Of eventual interest: MEICONTEXT (related to interrupt priority, but
--  complicated).

with RP2350; use RP2350;
with System.Machine_Code;

package body System.Interrupts.Xh3irq is
   --  MEINEXT always displays the next interrupt that should be handled,
   --  taking priority order into account.

   subtype MEINEXT_IRQ_Field is RP2350.UInt9;

   type MEINEXT_Register is record
      UPDATE     : Boolean           := False;
      Reserved_1 : RP2350.Bit        := 0;
      IRQ        : MEINEXT_IRQ_Field := 0;
      Reserved_2 : RP2350.UInt20     := 0;
      NOIRQ      : Boolean           := False;
   end record with
     Size => 32;

   for MEINEXT_Register use record
      UPDATE     at 0 range  0 ..  0;
      Reserved_1 at 0 range  1 ..  1;
      IRQ        at 0 range  2 .. 10;
      Reserved_2 at 0 range 11 .. 30;
      NOIRQ      at 0 range 31 .. 31;
   end record;

   function Get_Next_Interrupt return Next_Interrupt_Info is

      Next_Interrupt : MEINEXT_Register;

   begin
      --  This sets UPDATE before reading the register.
      System.Machine_Code.Asm
        ("csrrs %0, meinext, 1",
         Outputs  => Xh3irq.MEINEXT_Register'Asm_Output ("=r", Next_Interrupt),
         Volatile => True);

      return
        Result : Next_Interrupt_Info (Valid => not Next_Interrupt.NOIRQ) do
         if Result.Valid then
            Result.ID := Interrupt_ID (Next_Interrupt.IRQ);
         end if;
      end return;
   end Get_Next_Interrupt;
   --  This type is subtyped for MEIEA, MEIPA, MEIFA.

   type Bit_Window_Content is array (0 .. 15) of Boolean with
     Pack, Size => 16;

   type CSR_Bit_Data is record
      INDEX    : RP2350.UInt5       := 0;
      Reserved : RP2350.UInt11      := 0;
      WINDOW   : Bit_Window_Content := (others => False);
   end record with
     Size => 32;

   for CSR_Bit_Data use record
      INDEX    at 0 range  0 ..  4;
      Reserved at 0 range  5 .. 15;
      WINDOW   at 0 range 16 .. 31;
   end record;
   subtype MEIEA_Data is CSR_Bit_Data;
   subtype MEIPA_Data is CSR_Bit_Data;
   subtype MEIFA_Data is CSR_Bit_Data;

   procedure Enable_Interrupt (ID : Interrupt_ID) is

      Data : MEIEA_Data;

   begin
      Data.INDEX                        := UInt5 (ID / 16);
      Data.WINDOW (Integer (ID mod 16)) := True;
      System.Machine_Code.Asm
        ("csrs meiea, %0",
         Inputs   => Xh3irq.MEIEA_Data'Asm_Input ("r", Data),
         Volatile => True);
   end Enable_Interrupt;

   function Enable_Interrupt (ID : Interrupt_ID) return Boolean is

      Data : MEIEA_Data;

   begin
      System.Machine_Code.Asm
        ("csrrs %1, meiea, %0",
         Inputs   => UInt5'Asm_Input ("r", UInt5 (ID / 16)),
         Outputs  => Xh3irq.MEIEA_Data'Asm_Output ("=r", Data),
         Volatile => True);
      return Data.WINDOW (Integer (ID mod 16));
   end Enable_Interrupt;

   procedure Force_Interrupt (ID : Interrupt_ID) is

      Data : MEIFA_Data;

   begin
      Data.INDEX                        := UInt5 (ID / 16);
      Data.WINDOW (Integer (ID mod 16)) := True;
      System.Machine_Code.Asm
        ("csrs meifa, %0",
         Inputs   => Xh3irq.MEIFA_Data'Asm_Input ("r", Data),
         Volatile => True);
   end Force_Interrupt;

   function Force_Interrupt (ID : Interrupt_ID) return Boolean is

      Data : MEIFA_Data;

   begin
      System.Machine_Code.Asm
        ("csrrs %1, meifa, %0",
         Inputs   => UInt5'Asm_Input ("r", UInt5 (ID / 16)),
         Outputs  => Xh3irq.MEIFA_Data'Asm_Output ("=r", Data),
         Volatile => True);
      return Data.WINDOW (Integer (ID mod 16));
   end Force_Interrupt;

   procedure Pending_Interrupt (ID : Interrupt_ID) is

      Data : MEIPA_Data;

   begin
      Data.INDEX                        := UInt5 (ID / 16);
      Data.WINDOW (Integer (ID mod 16)) := True;
      System.Machine_Code.Asm
        ("csrs meipa, %0",
         Inputs   => Xh3irq.MEIPA_Data'Asm_Input ("r", Data),
         Volatile => True);
   end Pending_Interrupt;

   function Pending_Interrupt (ID : Interrupt_ID) return Boolean is

      Data : MEIPA_Data;

   begin
      System.Machine_Code.Asm
        ("csrrs %1, meipa, %0",
         Inputs   => UInt5'Asm_Input ("r", UInt5 (ID / 16)),
         Outputs  => Xh3irq.MEIPA_Data'Asm_Output ("=r", Data),
         Volatile => True);
      return Data.WINDOW (Integer (ID mod 16));
   end Pending_Interrupt;

   subtype Priority is RP2350.UInt4;
   type Priority_Window_Content is array (0 .. 3) of Priority with
     Pack, Size => 16;

   type MEIPRA_Data is record
      INDEX    : RP2350.UInt5            := 0;
      Reserved : RP2350.UInt11           := 0;
      WINDOW   : Priority_Window_Content := (others => 0);
   end record with
     Size => 32;

   for MEIPRA_Data use record
      INDEX    at 0 range  0 ..  4;
      Reserved at 0 range  5 .. 15;
      WINDOW   at 0 range 16 .. 31;
   end record;

   procedure Set_Priority (ID : Interrupt_ID; To : System.Interrupt_Priority)
   is

      Data : MEIPRA_Data;

   begin
      Data.INDEX                       := UInt5 (ID / 4);
      Data.WINDOW (Integer (ID mod 4)) := RP2350.UInt4 (To);
      System.Machine_Code.Asm
        ("csrs meipra, %0",
         Inputs   => Xh3irq.MEIPRA_Data'Asm_Input ("r", Data),
         Volatile => True);
   end Set_Priority;
   --  This is for checking out what happens with the array of 512 bits.

   procedure Read_Bit_Array is

      type Bit_Array is array (0 .. 15) of RP2350.Bit with
        Pack, Size => 16, Default_Component_Value => 0;
      Bit_Array_Array : array (0 .. 31) of Bit_Array with
        Size => 512;

   begin
      for Index in Bit_Array_Array'Range loop
         System.Machine_Code.Asm
           ("csrrs %1, meiea, %0",
            Inputs   => Integer'Asm_Input ("r", Index),
            Outputs  => Bit_Array'Asm_Output ("=r", Bit_Array_Array (Index)),
            Volatile => True);
      end loop;
   end Read_Bit_Array;

end System.Interrupts.Xh3irq;
