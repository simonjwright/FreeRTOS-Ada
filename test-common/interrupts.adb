--  Copyright (C) 2016-2018 Free Software Foundation, Inc.

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

with Ada.Interrupts;
with Ada.Real_Time;
with System;

package body Interrupts is

   --  Interrupt names are different on different MCUs.
   use type Ada.Interrupts.Interrupt_ID;
   First_Interrupt_ID  : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Interrupt_ID'First + 10;
   Second_Interrupt_ID : constant Ada.Interrupts.Interrupt_ID :=
     First_Interrupt_ID + 10;
   Third_Interrupt_ID  : constant Ada.Interrupts.Interrupt_ID :=
     First_Interrupt_ID + 20;

   procedure Trigger_Interrupt (IRQ : Ada.Interrupts.Interrupt_ID);

   protected First_Interrupt_Handler
   with
     Interrupt_Priority => System.Interrupt_Priority'First is
   private
      pragma Style_Checks (Off);  -- bad casing warning on Handler
      procedure Handler
      with
        Unreferenced,
        Attach_Handler => First_Interrupt_ID;
      pragma Style_Checks (On);
   end First_Interrupt_Handler;

   protected Second_Interrupt_Handler
   with
     Interrupt_Priority => System.Interrupt_Priority'First + 1 is
      entry Wait;
   private
      pragma Style_Checks (Off);  -- bad casing warning on Handler
      procedure Handler
      with
        Unreferenced,
        Attach_Handler => Second_Interrupt_ID;
      pragma Style_Checks (On);
      Triggered : Boolean := False;
   end Second_Interrupt_Handler;

   protected Third_Interrupt_Handler
   with
     Interrupt_Priority => System.Interrupt_Priority'First + 2 is
   private
      pragma Style_Checks (Off);  -- bad casing warning on Handler
      procedure Handler
      with
        Unreferenced,
        Attach_Handler => Third_Interrupt_ID;
      pragma Style_Checks (On);
   end Third_Interrupt_Handler;

   task Receiver_Task
   with
     Priority => System.Default_Priority + 1,
     Storage_Size => 1024
   is
      pragma Task_Name ("interrupts.receiver_task");
   end Receiver_Task;

   task Sender_Task
   with
     Priority => System.Default_Priority,
     Storage_Size => 1024
   is
     pragma Task_Name ("interrupts.sender_task");
   end Sender_Task;

   --  The plan is that the second interrupt handler will trigger both
   --  the first interrupt (at lower priority) and the third (at
   --  higher priority): the first interrupt handler should not run
   --  until after the second has finished, while the third interrupt
   --  handler should run immediately.

   type Count_Type is (First, Second, Third, Receiver);
   type Count_Data is array (Count_Type) of Natural
   with Volatile_Components;
   Counters : Count_Data := (others => 0);
   Previous_Counters : Count_Data := (others => 0);

   protected body First_Interrupt_Handler is
      procedure Handler is
      begin
         Counters (First) := Counters (First) + 1;
      end Handler;
   end First_Interrupt_Handler;

   protected body Second_Interrupt_Handler is
      entry Wait when Triggered is
      begin
         Triggered := False;
      end Wait;
      procedure Handler is
      begin
         Triggered := True;
         Counters (Second) := Counters (Second) + 1;
         Trigger_Interrupt (First_Interrupt_ID);
         --  handler should NOT have been called
         pragma Assert (Counters (First) = Previous_Counters (First),
                        "first handler ran before second was finished");
         Trigger_Interrupt (Third_Interrupt_ID);
         --  handler SHOULD have been called
         pragma Assert (Counters (Third) = Previous_Counters (Third) + 1,
                        "third handler didn't run");
      end Handler;
   end Second_Interrupt_Handler;

   protected body Third_Interrupt_Handler is
      procedure Handler is
      begin
         Counters (Third) := Counters (Third) + 1;
      end Handler;
   end Third_Interrupt_Handler;

   task body Receiver_Task is
   begin
      loop
         Second_Interrupt_Handler.Wait;
         Counters (Receiver) := Counters (Receiver) + 1;
      end loop;
   end Receiver_Task;

   task body Sender_Task is
      use type Ada.Real_Time.Time;
   begin
      loop
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
         Previous_Counters := Counters;
         Trigger_Interrupt (Second_Interrupt_ID);
         pragma Assert (Counters (First) = Previous_Counters (First) + 1,
                          "first handler didn't run at all");
         pragma Assert (Counters (Second) = Previous_Counters (Second) + 1,
                          "second handler didn't run at all");
         pragma Assert (Counters (Third) = Previous_Counters (Third) + 1,
                          "second handler didn't run at all");
         pragma Assert (Counters (Receiver) = Previous_Counters (Receiver) + 1,
                          "receiver task didn't run");
      end loop;
   end Sender_Task;

   procedure Trigger_Interrupt (IRQ : Ada.Interrupts.Interrupt_ID) is
      --  The Software Trigger Interrupt Register.
      NVIC_STIR : Integer
      with
        Import,
        Atomic,
        Size    => 32,
        Address => System'To_Address (16#e000_ef00#);
   begin
      --  ARM says Interrupt_ID is an implementation-defined discrete
      --  type; ours are all *small* integers.
      NVIC_STIR := Integer (IRQ);
   end Trigger_Interrupt;

   pragma Unreferenced (First_Interrupt_Handler);
   pragma Unreferenced (Third_Interrupt_Handler);

end Interrupts;
