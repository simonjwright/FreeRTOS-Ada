--  Copyright (C) 2018, 2020 Free Software Foundation, Inc.

--  This file is part of the FreeRTOS-Ada package.
--
--  The FreeRTOS-Ada package is free software; you can redistribute
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
with nRF.GPIO.Tasks_And_Events;

package body Buttons is

   type Button_Rep is (Button_A, Button_B);
   for Button_Rep use (Button_A => 17, Button_B => 26);

   type Button_Data is record
      Point : nRF.GPIO.GPIO_Point;
      State : Toggle := Off;
      Last_Time : Ada.Real_Time.Time := Ada.Real_Time.Time_First;
   end record;

   type Buttons_Data is array (Button_Rep) of Button_Data;

   protected Button_Handler is
      --  Only call one of these.
      procedure Enable_Channel_Interrupts;
      procedure Enable_Port_Interrupts;

      function Button_State (Btn : Button_Rep) return Toggle;
   private
      State : Buttons_Data :=
        (Button_A => (Point => (Pin => Button_A'Enum_Rep),
                      others => <>),
         Button_B => (Point => (Pin => Button_B'Enum_Rep),
                      others => <>));
      procedure Handler
      with Attach_Handler => Ada.Interrupts.Names.GPIOTE_IRQ;
   end Button_Handler;

   function Button_State (Btn : Button) return Toggle is
     (Button_Handler.Button_State (case Btn is
                                      when A => Button_A,
                                      when B => Button_B));

   protected body Button_Handler is

      procedure Enable_Channel_Interrupts is
         use nRF.GPIO.Tasks_And_Events;
      begin
         Enable_Event (Chan => 0,
                       GPIO_Pin => Button_A'Enum_Rep,
                       Polarity => Falling_Edge);
         Enable_Channel_Interrupt (Chan => 0);
         Enable_Event (Chan => 1,
                       GPIO_Pin => Button_B'Enum_Rep,
                       Polarity => Falling_Edge);
         Enable_Channel_Interrupt (Chan => 1);
      end Enable_Channel_Interrupts;

      procedure Enable_Port_Interrupts is
      begin
         nRF.GPIO.Tasks_And_Events.Enable_Port_Interrupt;
      end Enable_Port_Interrupts;

      function Button_State (Btn : Button_Rep) return Toggle is
        (State (Btn).State);

      procedure Handler is
         use nRF.GPIO;
         procedure Process_Event (For_Button : Button_Rep);
         procedure Process_Event (For_Button : Button_Rep) is
            Now   : constant Ada.Real_Time.Time := Ada.Real_Time.Clock;
            Other : constant array (Toggle) of Toggle := (Off => On,
                                                          On  => Off);
            use type Ada.Real_Time.Time;
            use type Ada.Real_Time.Time_Span;
         begin
            if not State (For_Button).Point.Set
              and then Now - State (For_Button).Last_Time
              > Ada.Real_Time.Milliseconds (50)  -- debouncing
            then
               State (For_Button).State := Other (State (For_Button).State);
               State (For_Button).Last_Time := Now;
            end if;
         end Process_Event;
      begin
         if Tasks_And_Events.Channel_Event_Set (Chan => 0) then
            Tasks_And_Events.Acknowledge_Channel_Interrupt (Chan => 0);
            Process_Event (Button_A);
         end if;
         if Tasks_And_Events.Channel_Event_Set (Chan => 1) then
            Tasks_And_Events.Acknowledge_Channel_Interrupt (Chan => 1);
            Process_Event (Button_B);
         end if;
         if Tasks_And_Events.Port_Event_Set then
            Tasks_And_Events.Acknowledge_Port_Interrupt;
            Process_Event (Button_A);
            Process_Event (Button_B);
         end if;
      end Handler;
   end Button_Handler;

   procedure Initialize;
   procedure Initialize is
      use nRF.GPIO;
      Config : constant GPIO_Configuration :=
        (Mode         => Mode_In,
         Resistors    => Pull_Up,
         Input_Buffer => Input_Buffer_Connect,
         Sense        => Sense_For_Low_Level,
         others       => <>);
   begin
      --  Buttons
      Configure_IO (This   => (Pin => Button_A'Enum_Rep),
                    Config => Config);
      Configure_IO (This   => (Pin => Button_B'Enum_Rep),
                    Config => Config);

      Button_Handler.Enable_Channel_Interrupts;
   end Initialize;

begin
   Initialize;
end Buttons;
