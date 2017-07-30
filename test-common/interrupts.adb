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

with Ada.Interrupts;
with Ada.Real_Time;
with System;

package body Interrupts is

   pragma Warnings (Off, "bad casing of ""Handler""");
   use type Ada.Interrupts.Interrupt_ID;

   --  The Software Trigger Interrupt Register.
   NVIC_STIR : Ada.Interrupts.Interrupt_ID
   with
     Import,
     Volatile,
     Address => System'To_Address (16#e000_ef00#);

   --  The Interrupt Set Pending Register.
   type IRQs is array (Ada.Interrupts.Interrupt_ID) of Boolean
   with
     Component_Size => 1;

   NVIC_ISPR : IRQs
   with
     Import,
     Volatile,
     Address => System'To_Address (16#e000_e200#);

   --  Interrupt names are different on different MCUs.
   First_Interrupt_ID  : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Interrupt_ID'First;
   Second_Interrupt_ID : constant Ada.Interrupts.Interrupt_ID :=
     First_Interrupt_ID + 10;
   Third_Interrupt_ID  : constant Ada.Interrupts.Interrupt_ID :=
     First_Interrupt_ID + 20;

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

   task Receiver
   with
     Priority => System.Default_Priority + 1,
     Storage_Size => 1024
   is
      pragma Task_Name ("interrupts.receiver");
   end Receiver;

   task Sender
   with
     Priority => System.Default_Priority,
     Storage_Size => 1024
   is
     pragma Task_Name ("interrupts.sender");
   end Sender;

   --  The plan is that the second interrupt handler will trigger both
   --  the first interrupt (at lower priority) and the third (at
   --  higher priority): the first interrupt handler should not run
   --  until after the second has finished, while the third interrupt
   --  handler should run immediately.

   type Count_Data is array (1 .. 4) of Natural
   with Volatile_Components;
   Counters : Count_Data := (others => 0);
   Previous_Counters : Count_Data := (others => 0);

   protected body First_Interrupt_Handler is
      procedure Handler is
      begin
         Counters (1) := Counters (1) + 1;
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
         Counters (2) := Counters (2) + 1;
         --  NVIC_STIR := First_Interrupt_ID;
         NVIC_ISPR (First_Interrupt_ID) := True;
         --  handler should NOT have been called
         pragma Assert (Counters (1) = Previous_Counters (1),
                        "first handler ran before second was finished");
         --  NVIC_STIR := Third_Interrupt_ID;
         NVIC_ISPR (Third_Interrupt_ID) := True;
         --  handler SHOULD have been called
         pragma Assert (Counters (3) = Previous_Counters (3) + 1,
                        "third handler didn't run");
      end Handler;
   end Second_Interrupt_Handler;

   protected body Third_Interrupt_Handler is
      procedure Handler is
      begin
         Counters (3) := Counters (3) + 1;
      end Handler;
   end Third_Interrupt_Handler;

   task body Receiver is
   begin
      loop
         Second_Interrupt_Handler.Wait;
         Counters (4) := Counters (4) + 1;
      end loop;
   end Receiver;

   task body Sender is
      use type Ada.Real_Time.Time;
   begin
      loop
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
         Previous_Counters := Counters;
         --  NVIC_STIR := Second_Interrupt_ID;
         NVIC_ISPR (Second_Interrupt_ID) := True;
         pragma Assert (Counters (1) = Previous_Counters (1) + 1,
                          "first handler didn't run at all");
         pragma Assert (Counters (2) = Previous_Counters (2) + 1,
                          "second handler didn't run at all");
         pragma Assert (Counters (3) = Previous_Counters (3) + 1,
                          "second handler didn't run at all");
         pragma Assert (Counters (4) = Previous_Counters (4) + 1,
                          "receiver task didn't run");
      end loop;
   end Sender;

end Interrupts;
