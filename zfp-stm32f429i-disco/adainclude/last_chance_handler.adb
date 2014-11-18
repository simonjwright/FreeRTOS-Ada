procedure Last_Chance_Handler
  (Message : System.Address; Line : Integer)
is
   pragma Unreferenced (Message, Line);
begin
   --  TODO: Add in code to dump the info to serial/screen which
   --  is obviously board specific.
   loop
      null;
   end loop;
end Last_Chance_Handler;
