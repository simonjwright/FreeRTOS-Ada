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

with System.FreeRTOS.Tasks;

package body System.FreeRTOS.Queues is

   package body Generic_Queues is

      function Create (Length : Positive) return not null Queue_Handle is
         function xQueueCreate
           (Queue_Length : Unsigned_Base_Type;
            Item_Size    : Unsigned_Base_Type) return Queue_Handle
         with
           Import,
           Convention => C,
           External_Name => "_gnat_xQueueCreate";
         Result : constant Queue_Handle :=
           xQueueCreate (Queue_Length => Unsigned_Base_Type (Length),
                         Item_Size    => Item'Max_Size_In_Storage_Elements);
      begin
         if Result = null then
            raise Program_Error with "couldn't create queue";
         end if;
         return Result;
      end Create;

      procedure Send (To            : not null Queue_Handle;
                      The_Item      : Item;
                      Ticks_To_Wait : Natural := 0) is
         function xQueueSend
           (Queue         :        Queue_Handle;
            Item_To_Queue : access Item;
            Ticks_To_Wait :        Tick_Type) return Status_Code
         with
           Import,
           Convention => C,
           External_Name => "_gnat_xQueueSend";
         Item_To_Pass : aliased Item := The_Item;
         Status : Status_Code;
      begin
         Status :=
           xQueueSend (Queue         => To,
                       Item_To_Queue => Item_To_Pass'Access,
                       Ticks_To_Wait => (if Ticks_To_Wait = 0
                                         then Max_Delay
                                         else Tick_Type (Ticks_To_Wait)));
         if Status /= Pass then
            raise Program_Error with "error sending item";
         end if;
      end Send;

      procedure Send_From_ISR (To       : not null Queue_Handle;
                               The_Item : Item) is
         function xQueueSendFromISR
           (Queue                      :        Queue_Handle;
            Item_To_Queue              : access Item;
            Higher_Priority_Task_Woken : out    Base_Type) return Status_Code
         with
           Import,
           Convention => C,
           External_Name => "_gnat_xQueueSendFromISR";
         Item_To_Pass : aliased Item := The_Item;
         Task_Needs_Waking : Base_Type := 0;
         Status : Status_Code;
      begin
         Status :=
           xQueueSendFromISR
             (Queue                      => To,
              Item_To_Queue              => Item_To_Pass'Access,
              Higher_Priority_Task_Woken => Task_Needs_Waking);
         if Status /= Pass then
            raise Program_Error with "error sending item from isr";
         end if;
         Tasks.Yield_From_ISR (Integer (Task_Needs_Waking));
      end Send_From_ISR;

      procedure Overwrite (To       : not null Queue_Handle;
                           The_Item : Item) is
         function xQueueOverwrite
           (Queue         :        Queue_Handle;
            Item_To_Queue : access Item) return Status_Code
         with
           Import,
           Convention => C,
           External_Name => "_gnat_xQueueOverwrite";
         Item_To_Pass : aliased Item := The_Item;
         Status : Status_Code;
      begin
         Status :=
           xQueueOverwrite (Queue         => To,
                            Item_To_Queue => Item_To_Pass'Access);
         if Status /= Pass then
            raise Program_Error with "error overwriting item";
         end if;
      end Overwrite;

      function Read (From          : not null Queue_Handle;
                     Ticks_To_Wait : Natural := 0) return Item is
         function XQueueReceive
           (Queue         :     Queue_Handle;
            Buffer        : out Item;
            Ticks_To_Wait :     Tick_Type) return Status_Code
         with
           Import,
           Convention => C,
           External_Name => "_gnat_xQueueReceive";
         Result : Item;
         Status : Status_Code;
      begin
         Status :=
           XQueueReceive
             (Queue         => From,
              Buffer        => Result,
              Ticks_To_Wait => (if Ticks_To_Wait = 0
                                then Max_Delay
                                else Tick_Type (Ticks_To_Wait)));
         if Status /= Pass then
            raise Program_Error with "error reading item";
         end if;
         return Result;
      end Read;

   end Generic_Queues;

end System.FreeRTOS.Queues;
