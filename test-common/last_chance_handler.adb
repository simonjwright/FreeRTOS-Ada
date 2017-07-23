--  Copyright (C) 2016 Free Software Foundation, Inc.
--
--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

procedure Last_Chance_Handler
  (Message : Interfaces.C.Strings.chars_ptr; Line : Integer)
is
   pragma Unreferenced (Message, Line);
   procedure Disable_Interrupts
   with
     Import,
     Convention => C,
     External_Name => "_gnat_disable_interrupts";
   procedure Suspend_All_Tasks
   with
     Import,
     Convention => C,
     External_Name => "vTaskSuspendAll";
begin
   --  TODO: Add in code to dump the info to serial/screen which
   --  is obviously board specific.
   --
   --  At the moment, use the debugger to examine the backtrace.
   Disable_Interrupts;
   --  Suspend_All_Tasks;
   --  This crashes with STM32F4, FreeRTOS v9

   loop
      null;
   end loop;
end Last_Chance_Handler;
