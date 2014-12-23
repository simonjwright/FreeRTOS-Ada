with CMSIS_OS;
with STM32F429I_Discovery.HAL;
with STM32F429I_Discovery.LEDs;
with System;
with LEDs;

procedure Demo_Tasking is
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
end Demo_Tasking;
