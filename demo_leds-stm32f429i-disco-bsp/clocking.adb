--  Copyright Simon Wright <simon@pushface.org>
--
--  Copying and distribution of this file, with or without
--  modification, are permitted in any medium without royalty provided
--  the copyright notice and this notice are preserved.  This file is
--  offered as-is, without any warranty.

with Interfaces;
package body Clocking is

   --  STM32 Cube drivers provide a weak null version of this
   --  procedure. This overrides that, and gets called every
   --  millisecond.
   procedure HAL_SYSTICK_Callback with
     Export,
     Convention => C,
     External_Name => "HAL_SYSTICK_Callback";

   --  After 18_446_744_073_709_551_616 (2 ** 64) milliseconds the
   --  'mod' operations below will occur at an incorrect interval
   --  (once each).
   --
   --  That interval is half a gigayear; not something we should worry
   --  about.
   --
   --  We could declare Tick as mod (2 ** 32 / 1000) * 1000 (maximum
   --  supportd non-binary modulus is 2**32 - 1), avoiding this
   --  problem but making time roll over after 50 days and probably
   --  hitting performance.

   type Tick is new Interfaces.Unsigned_64;
   Ticks : Tick := 0;

   procedure HAL_SYSTICK_Callback is
   begin
      Ticks := Ticks + 1;
      if Ticks mod 125 = 0 then
         Flag_125 := True;
      end if;
      if Ticks mod 250 = 0 then
         Flag_250 := True;
      end if;
      if Ticks mod 500 = 0 then
         Flag_500 := True;
      end if;
   end HAL_SYSTICK_Callback;
end Clocking;
