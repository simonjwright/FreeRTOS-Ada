with Ada.Real_Time;

with Heartbeat;
pragma Unreferenced (Heartbeat);

with ESP32_H2.GPIO; use ESP32_H2.GPIO;
with ESP32_H2.IO_MUX; use ESP32_H2.IO_MUX;

procedure Simple_IO is
   --  It seems that Risc-V needs more than normal task storage size.
   Default_Storage_Size : constant Natural := 2048
   with
     Export,
     Convention => Ada,
     External_Name => "_default_storage_size";

   use ESP32_H2;
   Signal_Pin_Bit : constant UInt32 := Shift_Left (1, 2);

   procedure Turn_On_Signal_Pin;
   procedure Turn_Off_Signal_Pin;

   procedure Turn_On_Signal_Pin is
   begin
      GPIO_Periph.OUT_W1TS := Signal_Pin_Bit;
   end Turn_On_Signal_Pin;
   procedure Turn_Off_Signal_Pin is
   begin
      GPIO_Periph.OUT_W1TC := Signal_Pin_Bit;
   end Turn_Off_Signal_Pin;

   use type Ada.Real_Time.Time;
begin

   GPIO_Periph.ENABLE_W1TS := Signal_Pin_Bit; --  Enable signal pin output.

   --  Try setting function 1 so pin actually corresponds to the
   --  external GPIO (TRM ???)
   IO_MUX_Periph.GPIO_2.MCU_SEL := 1; -- GPIO_2 function 1 - ??? cf decln

   --  TRM 6.4.4, simple GPIO Input
   IO_MUX_Periph.GPIO_1.FUN_IE  := 1; -- Enable GPIO_1 input
   IO_MUX_Periph.GPIO_1.FUN_WPU := 1; -- Enable GPIO_1 pull-up

   loop
      if (GPIO_Periph.IN_k and 2#10#) = 0 then
         Turn_On_Signal_Pin;
      else
         Turn_Off_Signal_Pin;
      end if;
      delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (25);

   end loop;

end Simple_IO;
