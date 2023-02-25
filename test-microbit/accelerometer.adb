with MMA8653;
with MicroBit.I2C;
with LEDs;
with Ada.Real_Time;

procedure Accelerometer is
   Acc : MMA8653.MMA8653_Accelerometer (Port => MicroBit.I2C.Controller);
begin
   if not MicroBit.I2C.Initialized then
      MicroBit.I2C.Initialize (S => MicroBit.I2C.S400kbps);
   end if;

   if not Acc.Check_Device_Id then
      for R in LEDs.Coord'Range loop
         for C in LEDs.Coord'Range loop
            LEDs.Set_One_LED (R, C);
         end loop;
      end loop;
      delay until Ada.Real_Time.Time_Last;
   end if;

   Acc.Configure (MMA8653.Two_G,
                  MMA8653.High_Resolution,
                  MMA8653.High_Resolution);

   loop
      declare
         Detection_Limit : constant := 75;
         Data : constant MMA8653.All_Axes_Data := Acc.Read_Data;
         use type MMA8653.Axis_Data;
         use type Ada.Real_Time.Time;
      begin
         LEDs.Clear_All_LEDs;
         if Data.X > Detection_Limit then
            LEDs.Set_One_LED (3, 1);
         elsif Data.X < -Detection_Limit then
            LEDs.Set_One_LED (3, 5);
         elsif Data.Y > Detection_Limit then
            LEDs.Set_One_LED (1, 3);
         elsif Data.Y < -Detection_Limit then
            LEDs.Set_One_LED (5, 3);
         else
            LEDs.Set_One_LED (3, 3);
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end;
   end loop;
end Accelerometer;
