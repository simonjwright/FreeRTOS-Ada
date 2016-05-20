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

pragma Restrictions (No_Elaboration_Code);

package System.FreeRTOS.Tasks is
   pragma Preelaborate;

   type TCB (<>) is private;
   type Task_Handle is access all TCB;

   type Task_Code is not null access procedure (Arg1 : System.Address)
   with
     Convention => C;

   function Create_Task
     (Code        : Task_Code;
      Name        : String;
      Stack_Depth : Natural;
      Parameters  : System.Address;
      Priority    : System.Any_Priority)
     return not null Task_Handle;
   --  Code: the procedure to be executed
   --  Name: of task
   --  Stack_Depth: in bytes
   --  Parameters: passed to Code
   --  Priority: of task
   --  May raise Program_Error if the task couldn't be created.

   function Get_Priority (T : Task_Handle) return System.Any_Priority;
   --  null T means "current task".

   procedure Set_Priority (T  : Task_Handle;
                           To : System.Any_Priority);
   --  null T means "current task".

   procedure Resume (T : not null Task_Handle)
   with
     Import,
     Convention => C,
     External_Name => "vTaskResume";

   procedure Suspend (T : Task_Handle)
   with
     Import,
     Convention => C,
     External_Name => "vTaskSuspend";
   --  null T means "current task".

   procedure Disable_Interrupts
   with
     Import,
     Convention => C,
     External_Name => "_gnat_disable_interrupts";

   procedure Enable_Interrupts
   with
     Import,
     Convention => C,
     External_Name => "_gnat_enable_interrupts";

   procedure Enter_Critical_Region
   with
     Import,
     Convention => C,
     External_Name => "_gnat_enter_critical";

   procedure Exit_Critical_Region
   with
     Import,
     Convention => C,
     External_Name => "_gnat_exit_critical";

   function In_ISR return Boolean;

   procedure Yield_From_ISR (Higher_Priority_Task_Woken : Integer)
   with
     Import,
     Convention => C,
     External_Name => "_gnat_yield_from_isr";

   function Scheduler_Is_Running return Boolean;

   procedure Start_Scheduler
   with
     Import,
     Convention => C,
     External_Name => "vTaskStartScheduler",
     No_Return;

private

   type TCB is null record;
   --  Of course it isn't really, but it is opaque to us.

end System.FreeRTOS.Tasks;
