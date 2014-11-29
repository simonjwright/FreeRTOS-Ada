with System;

procedure Last_Chance_Handler
  (Message : System.Address; Line : Integer);
pragma Export (C, Last_Chance_Handler, "__gnat_last_chance_handler");
pragma Preelaborate (Last_Chance_Handler);
