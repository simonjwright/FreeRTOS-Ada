package FreeRTOS.Queues with Preelaborate is

   type Queue (<>) is private;
   type Queue_Handle is access all Queue;

   generic
      type Item is private;
   package Generic_Queues is

      function Create (Length : Positive) return not null Queue_Handle;

      procedure Send (To : not null Queue_Handle;
                      The_Item : Item;
                      Ticks_To_Wait : Natural := 0);
      --  Ticks_To_Wait of 0 means "until there is room"

      procedure Send_From_ISR (To : not null Queue_Handle;
                               The_Item : Item;
                               Higher_Priority_Task_Woken : out Boolean);

      procedure Overwrite (To : not null Queue_Handle;
                           The_Item : Item);
      --  Only valid for Queues of length 1.

      function Read (From : not null Queue_Handle;
                     Ticks_To_Wait : Natural := 0) return Item;
      --  Ticks_To_Wait of 0 means "until there is something to read"

   end Generic_Queues;

private

   type Queue is null record;
   --  Of course it isn't really, but it is opaque to us.

end FreeRTOS.Queues;
