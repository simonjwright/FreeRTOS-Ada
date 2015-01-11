package FreeRTOS.Mutexes with Preelaborate is

   type Mutex_Handle is private;
   Null_Mutex_Handle : constant Mutex_Handle;

   function Create_Mutex return Mutex_Handle;

   procedure Give (The_Mutex : Mutex_Handle);

   procedure Take (The_Mutex : Mutex_Handle);

private

   type Mutex_Handle is mod 2 ** Standard'Address_Size;
   Null_Mutex_Handle : constant Mutex_Handle := 0;

end FreeRTOS.Mutexes;
