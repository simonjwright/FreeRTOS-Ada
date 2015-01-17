package FreeRTOS.Mutexes with Preelaborate is

   type Mutex (<>) is limited private;
   type Mutex_Handle is access all Mutex;

   function Create_Mutex return not null Mutex_Handle;

   procedure Give (The_Mutex : not null Mutex_Handle);

   procedure Take (The_Mutex : not null Mutex_Handle);

private

   type Mutex is null record;
   --  Of course it isn't really, but it is opaque to us.

end FreeRTOS.Mutexes;
