package System.Interrupts.Xh3irq is

   --  We're required to loop until there are no more interrupts.
   type Next_Interrupt_Info (Valid : Boolean := False) is record
      case Valid is
         when True =>
            ID : Interrupt_ID;
         when False =>
            null;
      end case;
   end record;

   function Get_Next_Interrupt return Next_Interrupt_Info;

   procedure Enable_Interrupt (ID : Interrupt_ID);
   function Enable_Interrupt (ID : Interrupt_ID) return Boolean;

   procedure Force_Interrupt (ID : Interrupt_ID);
   function Force_Interrupt (ID : Interrupt_ID) return Boolean;

   procedure Pending_Interrupt (ID : Interrupt_ID);
   function Pending_Interrupt (ID : Interrupt_ID) return Boolean;

   procedure Set_Priority (ID : Interrupt_ID; To : System.Interrupt_Priority);

   --  This is for checking out what happens with the array of 512 bits.
   procedure Read_Bit_Array;

end System.Interrupts.Xh3irq;
