--  Copyright (C) 2016 Free Software Foundation, Inc.

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

--  This package is only to be used to check the ability to override
--  the default arduino-due runtime behaviour, which is to disable the
--  watchdog.

package Watchdog_Check is

   --  The RTS includes (in startup.adb) a version of this procedure
   --  with pragma Weak_External. This means that if the user code
   --  includes a procedure with this profile it will be linked
   --  instead of the RTS version. Since the RTS version disables the
   --  watchdog, and this version does not, the watchdog will be
   --  running, and after 16 seconds the MCU will reset (and the
   --  orange LED will blink rapidly 5 times before reverting to its
   --  once-per-second behaviour).
   procedure Initialize_Watchdog
     is null
   with
     Export,
     Convention => Ada,
     External_Name => "initialize_watchdog";

end Watchdog_Check;
