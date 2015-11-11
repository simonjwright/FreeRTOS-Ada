--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Finalization;
package Finalizing is

   type F is new Ada.Finalization.Controlled with record
      V : Integer;
   end record;

   overriding
   procedure Adjust (Obj : in out F);

   overriding
   procedure Finalize (Obj : in out F);

end Finalizing;
