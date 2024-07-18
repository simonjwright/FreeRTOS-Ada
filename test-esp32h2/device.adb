package body Device is
   protected body Handler is
      entry Wait when Triggered is
      begin
         Triggered := False;
      end Wait;
      procedure Handler is
      begin
         Triggered := True;
      end Handler;
   end Handler;
end Device;
