package Time is

   type Time is mod 2 ** 32;

   function Clock return Time;

end Time;
