--  Copyright (C) 2016 Free Software Foundation, Inc.
--
--  This file is part of the Cortex GNAT RTS project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

pragma Restrictions (No_Elaboration_Code);

package System.FreeRTOS.Queues is
   pragma Preelaborate;

   type Queue (<>) is private;
   type Queue_Handle is access all Queue;

   generic
      type Item is private;
   package Generic_Queues is

      function Create (Length : Positive) return not null Queue_Handle;

      procedure Send (To            : not null Queue_Handle;
                      The_Item      : Item;
                      Ticks_To_Wait : Natural := 0);
      --  Ticks_To_Wait of 0 means "until there is room"

      procedure Send_From_ISR
        (To       : not null Queue_Handle;
         The_Item : Item);

      procedure Overwrite (To       : not null Queue_Handle;
                           The_Item : Item);
      --  Only valid for Queues of length 1.

      function Read (From          : not null Queue_Handle;
                     Ticks_To_Wait : Natural := 0) return Item;
      --  Ticks_To_Wait of 0 means "until there is something to read"

   end Generic_Queues;

private

   type Queue is null record;
   --  Of course it isn't really, but it is opaque to us.

end System.FreeRTOS.Queues;
