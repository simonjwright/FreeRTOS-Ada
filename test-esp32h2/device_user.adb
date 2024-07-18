with Device;
with Heartbeat;
pragma Unreferenced (Heartbeat);
procedure Device_User is

   --  It seems that Risc-V needs more than normal task storage size.
   Default_Storage_Size : constant Natural := 2048
   with
     Export,
     Convention => Ada,
     External_Name => "_default_storage_size";

begin
   loop
      Device.Handler.Wait;
   end loop;
end Device_User;
