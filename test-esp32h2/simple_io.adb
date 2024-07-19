with Ada.Real_Time;
with ESP32_H2.GPIO; use ESP32_H2.GPIO;
with ESP32_H2.IO_MUX; use ESP32_H2.IO_MUX;

procedure Simple_IO is
   procedure Turn_On_GPIO0;
   procedure Turn_Off_GPIO0;
   procedure Turn_On_GPIO0 is
   begin
      GPIO_Periph.OUT_W1TS := 2#1#;
   end Turn_On_GPIO0;
   procedure Turn_Off_GPIO0 is
   begin
      GPIO_Periph.OUT_W1TC := 2#1#;
   end Turn_Off_GPIO0;

   use type ESP32_H2.UInt32;
   use type Ada.Real_Time.Time;
begin
   GPIO_Periph.ENABLE_W1TS := 2#1#; --  Enable GPIO0 output.

   --  TRM 6.4.4, simple GPIO Input
   IO_MUX_Periph.GPIO_1.FUN_IE  := 1; -- Enable GPIO1 input
   IO_MUX_Periph.GPIO_1.FUN_WPU := 1; -- Enable GPIO1 pull-up

   loop
      if (GPIO_Periph.IN_k and 2#10#) = 0 then
         Turn_On_GPIO0;
      else
         Turn_Off_GPIO0;
      end if;
      delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (25);

   end loop;

end Simple_IO;
