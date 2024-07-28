--  Copyright (C) 2016-2024 Free Software Foundation, Inc.
--
--  This file is part of the FreeRTOS-Ada project. This file is
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

with Interfaces;

package body System.FreeRTOS.Tasks is

   --  from portmacro.h,
   --  portSTACK_TYPE is unsigned long (stack size units)

   Stack_Unit_Size : constant := 4;

   function Create_Task
     (Code        : Task_Code;
      Name        : String;
      Stack_Depth : Natural;                       -- in bytes
      Parameters  : System.Address;                -- passed to Code
      Priority    : System.Any_Priority)
     return not null Task_Handle is
      --  Code: the procedure to be executed
      --  Name: of task
      --  Stack_Depth: in bytes
      --  Parameters: passed to Code
      --  Priority: of task
      --  May raise Program_Error if the task couldn't be created.

      function xTaskCreate
        (Code          :     Task_Code;
         Name          :     System.Address;         -- null-terminated
         Stack_Depth   :     Interfaces.Unsigned_16; -- in stack size units
         Parameters    :     System.Address;
         Priority      :     Unsigned_Base_Type;
         Created_Task  : out Task_Handle)
        return Status_Code with
          Import,
          Convention => C,
          External_Name => "xTaskCreate";

      Task_Name : constant String := Name & ASCII.NUL;
      Status : Status_Code := Fail;
      Result : Task_Handle;

   begin
      Status :=
        xTaskCreate
          (Code          => Code,
           Name          => Task_Name (Task_Name'First)'Address,
           Stack_Depth   => Interfaces.Unsigned_16
             ((Stack_Depth + Stack_Unit_Size - 1) / Stack_Unit_Size),
           Parameters    => Parameters,
           Priority      => Unsigned_Base_Type (Priority),
           Created_Task  => Result);

      if Status /= Pass then
         raise Program_Error with "couldn't create task";
      end if;

      return Result;
   end Create_Task;

   function Get_Priority
     (T : Task_Handle) return System.Any_Priority is
      function uxTaskPriorityGet (T : Task_Handle) return Unsigned_Base_Type
      with
        Import,
        Convention => C,
        External_Name => "uxTaskPriorityGet";
   begin
      return System.Any_Priority (uxTaskPriorityGet (T));
   end Get_Priority;

   procedure Set_Priority (T  : Task_Handle;
                           To : System.Any_Priority) is
      procedure vTaskPrioritySet (T            : Task_Handle;
                                  New_Priority : Unsigned_Base_Type)
      with
        Import,
        Convention => C,
        External_Name => "vTaskPrioritySet";
   begin
      vTaskPrioritySet (T            => T,
                        New_Priority => Unsigned_Base_Type (To));
   end Set_Priority;

   function In_ISR return Boolean is separate;
   --  Cortex/RiscV versions supported.

   function Scheduler_Is_Running return Boolean is
      function XTaskGetSchedulerState return Base_Type
      with
        Import,
        Convention => C,
        External_Name => "xTaskGetSchedulerState";
      --  Possible values are (FreeRTOS 8.1.2, checked in 11.1.0)
      --  #define taskSCHEDULER_SUSPENDED       ( ( BaseType_t ) 0 )
      --  #define taskSCHEDULER_NOT_STARTED     ( ( BaseType_t ) 1 )
      --  #define taskSCHEDULER_RUNNING         ( ( BaseType_t ) 2 )
   begin
      return XTaskGetSchedulerState = 2;
   end Scheduler_Is_Running;

end System.FreeRTOS.Tasks;
