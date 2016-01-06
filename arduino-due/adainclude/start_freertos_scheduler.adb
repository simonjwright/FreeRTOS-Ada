--  Copyright Simon Wright <simon@pushface.org>
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

--  This is the Arduino Due version.

with Interfaces;
with System.FreeRTOS.Tasks;

procedure Start_FreeRTOS_Scheduler (Disable_Watchdog : Boolean := True) is
   --  The Watchdog Timer Mode Register. See
   --  Atmel-11057C-ATARM-SAM3X-SAM3A-Datasheet_23-Mar-15, section
   --  15.5.2.
   WDT_MR : Interfaces.Unsigned_32
     with
       Import,
       Convention => Ada,
       Volatile,
       Address => System'To_Address (16#400E1A54#);
   WDT_MR_WDDIS : constant Interfaces.Unsigned_32 := 16#0000_8000#; -- bit 15
begin
   if Disable_Watchdog then
      WDT_MR := WDT_MR_WDDIS;
   end if;
   System.FreeRTOS.Tasks.Start_Scheduler;
   raise Program_Error with "Start_Scheduler returned";
end Start_FreeRTOS_Scheduler;
