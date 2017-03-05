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

with Interfaces;

package System.FreeRTOS is
   pragma Pure;

   --  from portmacro.h,
   --  portBASE_TYPE is long

   type Base_Type is new Interfaces.Integer_32;
   type Unsigned_Base_Type is new Interfaces.Unsigned_32;

   subtype Tick_Type is Unsigned_Base_Type;

   Max_Delay : constant Tick_Type := 16#ffff_ffff#;

   --  From projdefs.h.

   subtype Status_Code is Base_Type;

   Fail                               : constant Status_Code := 0;
   Pass                               : constant Status_Code := 1;
   --  Queue_Empty                        : constant Status_Code := 0;
   --  Queue_Full                         : constant Status_Code := 0;
   --  Could_Not_Allocate_Required_Memory : constant Status_Code := -1;
   --  No_Task_To_Run                     : constant Status_Code := -2;
   --  Queue_Blocked                      : constant Status_Code := -4;
   --  Queue_Yield                        : constant Status_Code := -5;

end System.FreeRTOS;
