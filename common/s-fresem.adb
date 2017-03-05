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

package body System.FreeRTOS.Semaphores is

   function Create_Semaphore return not null Semaphore_Handle is
      function xSemaphoreCreateBinary return Semaphore_Handle
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreCreateBinary";
      Result : constant Semaphore_Handle := xSemaphoreCreateBinary;
   begin
      if Result = null then
         raise Program_Error with "couldn't create semaphore";
      end if;
      return Result;
   end Create_Semaphore;

   procedure Give (The_Semaphore : not null Semaphore_Handle) is
      function xSemaphoreGive (Semaphore : Semaphore_Handle) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreGive";
      Status : Status_Code;
   begin
      Status := xSemaphoreGive (Semaphore => The_Semaphore);

      if Status /= Pass then
         raise Program_Error with "error giving semaphore";
      end if;
   end Give;

   procedure Take (The_Semaphore : not null Semaphore_Handle) is
      function xSemaphoreTake
        (Semaphore  : Semaphore_Handle;
         Block_Time : Tick_Type) return Status_Code
      with
        Import,
        Convention => C,
        External_Name => "_gnat_xSemaphoreTake";
      Status : Status_Code;
   begin
      Status := xSemaphoreTake (Semaphore  => The_Semaphore,
                                Block_Time => Max_Delay);

      if Status /= Pass then
         raise Program_Error with "error taking semaphore";
      end if;
   end Take;

end System.FreeRTOS.Semaphores;
