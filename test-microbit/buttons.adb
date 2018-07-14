--  Copyright (C) 2018 Free Software Foundation, Inc.

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

with Ada.Interrupts.Names;
with Ada.Real_Time;
with nrf51.GPIO;
with nrf51.GPIOTE;

package body Buttons is

   type Button_Rep is (Button_A, Button_B);
   for Button_Rep use (Button_A => 17, Button_B => 26);

   type Button_Data is record
      State : Toggle := Off;
      Last_Time : Ada.Real_Time.Time := Ada.Real_Time.Time_First;
   end record;

   type Buttons_Data is array (Button_Rep) of Button_Data;

   protected Button_Handler is
      function Button_State (Btn : Button_Rep) return Toggle;
   private
      State : Buttons_Data;
      procedure Handler
      with Attach_Handler => Ada.Interrupts.Names.GPIOTE_IRQ;
   end Button_Handler;

   function Button_State (Btn : Button) return Toggle is
     (Button_Handler.Button_State (case Btn is
                                      when A => Button_A,
                                      when B => Button_B));

   protected body Button_Handler is
      function Button_State (Btn : Button_Rep) return Toggle is
        (State (Btn).State);

      procedure Handler is
      begin
         nrf51.GPIOTE.GPIOTE_Periph.EVENTS_PORT := 0;
         declare
            Now   : constant Ada.Real_Time.Time := Ada.Real_Time.Clock;
            Other : constant array (Toggle) of Toggle := (Off => On,
                                                          On  => Off);
            use nrf51.GPIO;
            use type Ada.Real_Time.Time;
            use type Ada.Real_Time.Time_Span;
         begin
            for B in State'Range loop
               if GPIO_Periph.IN_k.Arr (B'Enum_Rep) = Low
                 and then Now - State (B).Last_Time
                 > Ada.Real_Time.Milliseconds (25)
               then
                  State (B).State := Other (State (B).State);
                  State (B).Last_Time := Now;
               end if;
            end loop;
         end;
      end Handler;
   end Button_Handler;

   procedure Initialize;
   procedure Initialize is
      use nrf51.GPIO;
      use nrf51.GPIOTE;
   begin
      --  Buttons
      GPIO_Periph.PIN_CNF (Button_A'Enum_Rep) := (DIR    => Input,
                                                  INPUT  => Connect,
                                                  PULL   => Pullup,
                                                  SENSE  => Low,
                                                  others => <>);
      GPIO_Periph.PIN_CNF (Button_B'Enum_Rep) := (DIR    => Input,
                                                  INPUT  => Connect,
                                                  PULL   => Pullup,
                                                  SENSE  => Low,
                                                  others => <>);

      GPIOTE_Periph.INTENSET.PORT := Set;
   end Initialize;

begin
   Initialize;
end Buttons;
