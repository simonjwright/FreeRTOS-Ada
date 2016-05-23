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

   --  The Software Trigger Interrupt Register.
   NVIC_STIR : Ada.Interrupts.Interrupt_ID
     with
       Import,
       Volatile,
       Address => System'To_Address (16#e000_ef00#);

   --  Interrupt names are different on different MCUs.
   First_Interrupt_ID : constant Ada.Interrupts.Interrupt_ID :=
     Ada.Interrupts.Interrupt_ID'First;

   protected First_Interrupt_Handler
   with
     Interrupt_Priority => System.Interrupt_Priority'First is
      entry Wait;
   private
      procedure Handler
      with
        Unreferenced,
        Attach_Handler => First_Interrupt_ID;
      Triggered : Boolean := False;
   end First_Interrupt_Handler;

   task Receiver with Priority => System.Default_Priority + 1;
   task Sender;

   protected body First_Interrupt_Handler is
      entry Wait when Triggered is
      begin
         Triggered := False;
      end Wait;
      procedure Handler is
      begin
         Triggered := True;
      end Handler;
   end First_Interrupt_Handler;

   Counter : Natural := 0 with Volatile;

   task body Receiver is
   begin
      loop
         First_Interrupt_Handler.Wait;
         Counter := Counter + 1;
      end loop;
   end Receiver;

   task body Sender is
      use type Ada.Real_Time.Time;
      Previous_Counter : Natural;
   begin
      loop
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
         Previous_Counter := Counter;
         NVIC_STIR := First_Interrupt_ID;
         pragma Assert (Counter = Previous_Counter + 1,
                          "receiver task didn't run");
      end loop;
   end Sender;

end Interrupts;
