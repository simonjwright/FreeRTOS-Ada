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

package System.FreeRTOS.Mutexes is
   pragma Preelaborate;

   type Mutex (<>) is limited private;
   type Mutex_Handle is access all Mutex;

   function Create_Mutex return not null Mutex_Handle;

   procedure Give (The_Mutex : not null Mutex_Handle);

   procedure Take (The_Mutex : not null Mutex_Handle);

private

   type Mutex is null record;
   --  Of course it isn't really, but it is opaque to us.

end System.FreeRTOS.Mutexes;
