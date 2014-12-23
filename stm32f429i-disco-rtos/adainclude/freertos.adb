package body FreeRTOS is

   --  We need to initialize the memory arena.

   procedure Initialize
   with
     Import,
     Convention => C,
     External_Name => "vPortInitialiseBlocks";

begin
   Initialize;
end FreeRTOS;
