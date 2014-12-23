with CMSIS_OS;
with STM32F429I_Discovery.HAL;
with STM32F429I_Discovery.LEDs;
with System;

procedure Demo_Cmsis is
   procedure Do_Green (Arg : System.Address) with Convention => C;
   procedure Do_Red (Arg : System.Address) with Convention => C;

   procedure Do_Green (Arg : System.Address) is
      pragma Unreferenced (Arg);
      Status : CMSIS_OS.osStatus;
      use type CMSIS_OS.osStatus;
   begin
      Status := CMSIS_OS.osDelay (Millisec => 250);
      if Status /= CMSIS_OS.osOK then
         raise Program_Error;
      end if;
      loop
         Status := CMSIS_OS.osDelay (Millisec => 500);
         if Status /= CMSIS_OS.osOK then
            raise Program_Error;
         end if;
         STM32F429I_Discovery.LEDs.Toggle (STM32F429I_Discovery.LEDs.Green);
      end loop;
   end Do_Green;

   procedure Do_Red (Arg : System.Address) is
      pragma Unreferenced (Arg);
      Status : CMSIS_OS.osStatus;
      use type CMSIS_OS.osStatus;
   begin
      loop
         Status := CMSIS_OS.osDelay (Millisec => 1000);
         if Status /= CMSIS_OS.osOK then
            raise Program_Error;
         end if;
         STM32F429I_Discovery.LEDs.Toggle (STM32F429I_Discovery.LEDs.Red);
      end loop;
   end Do_Red;

   Green_Name : aliased constant String := "green" & ASCII.Nul;

   Green_Def : aliased CMSIS_OS.osThreadDef_t :=
     (Name      => Green_Name (1)'Address,
      Pthread   => Do_Green'Unrestricted_Access,
      Tpriority => CMSIS_OS.osPriorityNormal,
      Instances => 0,
      Stacksize => 256);

   Green : CMSIS_OS.osThreadId :=
     CMSIS_OS.osThreadCreate (Thread_Def => Green_Def'Access,
                              Argument   => System.Null_Address);

   Red_Name : aliased constant String := "red" & ASCII.Nul;

   Red_Def : aliased CMSIS_OS.osThreadDef_t :=
     (Name      => Red_Name (1)'Address,
      Pthread   => Do_Red'Unrestricted_Access,
      Tpriority => CMSIS_OS.osPriorityNormal,
      Instances => 0,
      Stacksize => 256);

   Red : CMSIS_OS.osThreadId :=
     CMSIS_OS.osThreadCreate (Thread_Def => Red_Def'Access,
                              Argument   => System.Null_Address);

   Status : CMSIS_OS.osStatus;
   use type CMSIS_OS.osStatus;
begin
   STM32F429I_Discovery.HAL.Initialize;
   STM32F429I_Discovery.LEDs.Initialize;

   Status := CMSIS_OS.osKernelStart (null, System.Null_Address);
   if Status /= CMSIS_OS.osOK then
      raise Program_Error with "osKernelStart failed";
   else
      raise Program_Error with "osKernelStart shouldn't have returned";
   end if;
end Demo_Cmsis;
