--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

package Dispatching is

private

   type Base is abstract tagged null record;
   function Value (B : Base) return Integer is abstract;
   function Basis (B : Base) return Character;

   type Derived is new Base with null record;
   overriding
   function Value (D : Derived) return Integer;

end Dispatching;
