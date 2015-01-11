------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--                              F R E E R T O S                             --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--           Copyright (C) 2015 Simon Wright <simon@pushface.org>           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- This interface to FreeRTOS is part of the STM32F4 GNAT RTS port.         --
--                                                                          --
------------------------------------------------------------------------------

with Interfaces;

package FreeRTOS with Pure is

private

   --  from portmacro.h,
   --  portBASE_TYPE is long

   type Base_Type is new Interfaces.Integer_32;
   type Unsigned_Base_Type is new Interfaces.Unsigned_32;

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

end FreeRTOS;
