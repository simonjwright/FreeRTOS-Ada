--  Copyright (C) 2016 Free Software Foundation, Inc.
--
--  This file is part of the FreeRTOS-Ada project. This file is
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

package body System.FreeRTOS.TCB is

   function Get_Application_Parameter return System.Address is
      function xTaskGetApplicationTaskTag
        (xTask : System.Address) return System.Address
      with
        Import,
        Convention => C,
        External_Name => "xTaskGetApplicationTaskTag";
   begin
      return xTaskGetApplicationTaskTag (System.Null_Address);
   end Get_Application_Parameter;

   procedure Set_Application_Parameter (Parameter : System.Address) is
      procedure vTaskSetApplicationTaskTag (xTask : System.Address;
                                            pxHookFunction : System.Address)
      with
        Import,
        Convention => C,
        External_Name => "vTaskSetApplicationTaskTag";
   begin
      vTaskSetApplicationTaskTag (System.Null_Address, Parameter);
   end Set_Application_Parameter;

end System.FreeRTOS.TCB;
