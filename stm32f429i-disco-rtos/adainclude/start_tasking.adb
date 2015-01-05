--  Copyright Simon Wright <simon@pushface.org>
--
--  This file is free software; you can redistribute it and/or modify
--  it under terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3, or (at your
--  option) any later version. This file is distributed in the hope
--  that it will be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
--  PURPOSE.
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

with CMSIS_OS;
with System;

procedure Start_Tasking is
   Status : CMSIS_OS.osStatus;
   use type CMSIS_OS.osStatus;
begin

   Status := CMSIS_OS.osKernelStart (null, System.Null_Address);
   if Status /= CMSIS_OS.osOK then
      raise Program_Error with "osKernelStart failed";
   else
      raise Program_Error with "osKernelStart shouldn't have returned";
   end if;

end Start_Tasking;
