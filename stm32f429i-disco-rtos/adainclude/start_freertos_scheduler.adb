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

--  This is the STM32F4 version.

with System.FreeRTOS.Tasks;

procedure Start_FreeRTOS_Scheduler (Disable_Watchdog : Boolean := True) is
   --  On STM32F4, the watchdog isn't enabled by default (I think
   --  there may be some NVRAM settings you can change to alter this).
   pragma Unreferenced (Disable_Watchdog);
begin
   System.FreeRTOS.Tasks.Start_Scheduler;
   raise Program_Error with "Start_Scheduler returned";
end Start_FreeRTOS_Scheduler;
