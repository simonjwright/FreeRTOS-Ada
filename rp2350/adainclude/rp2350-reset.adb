with RP2350.RESETS;

package body RP2350.Reset is

   type Subsystem_Array is array (Subsystem) of Boolean
   with Pack, Size => 29;
   type Reset_Register is record
      Subsystems     : Subsystem_Array := (others => False);
      Reserved_29_31 : RP2350.UInt3 := 0;
   end record
   with Volatile_Full_Access, Object_Size => 32,
     Bit_Order => System.Low_Order_First;
   for Reset_Register use record
      Subsystems     at 0 range 0 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;
   type RESETS_Peripheral is record
      RESET      : aliased Reset_Register;
      WDSEL      : aliased Reset_Register;
      RESET_DONE : aliased Reset_Register;
   end record
   with Volatile;
   for RESETS_Peripheral use record
      RESET      at 0 range 0 .. 31;
      WDSEL      at 4 range 0 .. 31;
      RESET_DONE at 8 range 0 .. 31;
   end record;
   RESETS_Periph : aliased RESETS_Peripheral
     with Import, Address => RP2350.RESETS.RESETS_Periph'Address;

   procedure Reset_Subsystem (S : Subsystem) is
   begin
      RESETS_Periph.RESET.Subsystems (S) := True;
   end Reset_Subsystem;

   procedure Release_Subsystem (S : Subsystem) is
   begin
      RESETS_Periph.RESET.Subsystems (S) := False;
      loop
         exit when RESETS_Periph.RESET_DONE.Subsystems (S);
      end loop;
   end Release_Subsystem;

end RP2350.Reset;
