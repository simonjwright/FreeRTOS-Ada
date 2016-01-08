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

--  The FreeRTOS scheduler is actually started in
--  System.FreeRTOS.Tasks.Start_Scheduler, but if we make users call
--  that they will get the warning that System.FreeRTOS.Tasks is an
--  implementation unit. This procedure is provided so they don't have
--  to say "-gnatwI" to suppress the warning.

--  The behaviour of the watchdog feature is board-dependent. On
--  Arduino Due (and probably boards using other Atmel chips), the
--  watchdog is initially enabled; on STM32F4 it is not. In both
--  cases, the watchdog settings can only be changed once (after each
--  reset), so if your aplication needs to use the watchdog you should
--  set Disable_Watchdog False.
procedure Start_FreeRTOS_Scheduler (Disable_Watchdog : Boolean := True)
with
  No_Return;
