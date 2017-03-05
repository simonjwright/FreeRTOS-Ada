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

with System.Parameters;
with System.Tasking.Restricted.Stages;
with System.Task_Info;

package body Environment_Task is

   procedure Environment_Task (Arg : System.Address);
   procedure Environment_Task (Arg : System.Address) is
      pragma Unreferenced (Arg);
      --  Generated by gnatbind.
      procedure Main
      with
        Import,
        Convention => C,
        External_Name => "main";
   begin
      Main; -- should not return;
   end Environment_Task;

   --  For creating the environment task; declared here to avoid
   --  accessibility level issues.
   Environment_Task_Elaborated : aliased Boolean;
   Activation_Chain_Dummy : System.Tasking.Activation_Chain
     with Suppress_Initialization;
   Environment_TCB : aliased System.Tasking.Ada_Task_Control_Block
     (System.Tasking.Null_Entry);

   procedure Create is
   begin
      System.Tasking.Restricted.Stages.Create_Restricted_Task
        (Priority      => System.Tasking.Unspecified_Priority,
         Stack_Address => System.Null_Address,
         Size          => System.Parameters.Unspecified_Size,
         Task_Info     => System.Task_Info.Unspecified_Task_Info,
         CPU           => System.Tasking.Unspecified_CPU,
         State         => Environment_Task'Access,
         Discriminants => System.Null_Address,
         Elaborated    => Environment_Task_Elaborated'Access,
         Chain         => Activation_Chain_Dummy,
         Task_Image    => "",
         Created_Task  => Environment_TCB'Access);
   end Create;

end Environment_Task;
