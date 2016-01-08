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

package body System.FreeRTOS.Mutexes is

   function Create_Mutex return not null Mutex_Handle is
      function xSemaphoreCreateMutex return Mutex_Handle
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreCreateMutex";
      Result : constant Mutex_Handle := xSemaphoreCreateMutex;
   begin
      if Result = null then
         raise Program_Error with "couldn't create mutex";
      end if;
      return Result;
   end Create_Mutex;

   procedure Give (The_Mutex : not null Mutex_Handle) is
      function xSemaphoreGive (Semaphore : Mutex_Handle) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreGive";
      Status : Status_Code;
   begin
      Status := xSemaphoreGive (Semaphore => The_Mutex);

      if Status /= Pass then
         raise Program_Error with "error giving mutex";
      end if;
   end Give;

   procedure Take (The_Mutex : not null Mutex_Handle) is
      function xSemaphoreTake
        (Semaphore  : Mutex_Handle;
         Block_Time : Tick_Type) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreTake";
      Status : Status_Code;
   begin
      Status := xSemaphoreTake (Semaphore  => The_Mutex,
                                Block_Time => Max_Delay);

      if Status /= Pass then
         raise Program_Error with "error taking mutex";
      end if;
   end Take;

end System.FreeRTOS.Mutexes;
