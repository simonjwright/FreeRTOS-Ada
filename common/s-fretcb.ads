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

package System.FreeRTOS.TCB is
   pragma Preelaborate;

   --  Requires configUSE_APPLICATION_TASK_TAG to be set in
   --  FreeRTOSConfig.h.

   --  Return the parameter saved in the current task's FreeRTOS
   --  TCB. In our case, this will be the corresponding ATCB.
   function Get_Application_Parameter return System.Address;

   --  Save Parameter in the current task's FreeRTOS TCB. In our case,
   --  this will be the corresponding ATCB.
   procedure Set_Application_Parameter (Parameter : System.Address);

end System.FreeRTOS.TCB;
