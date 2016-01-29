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

package body Ada.Synchronous_Task_Control is

   procedure Set_True (S : in out Suspension_Object) is
   begin
      S.Set_True;
   end Set_True;

   procedure Set_False (S : in out Suspension_Object) is
   begin
      S.Set_False;
   end Set_False;

   function Current_State (S : Suspension_Object) return Boolean is
     (S.Current_State);

   procedure Suspend_Until_True (S : in out Suspension_Object) is
   begin
      S.Suspend_Until_True;
   end Suspend_Until_True;

   protected body Suspension_Object is

      procedure Set_True is
      begin
         State := True;
      end Set_True;

      procedure Set_False is
      begin
         State := False;
      end Set_False;

      function Current_State return Boolean is (State);

      entry Suspend_Until_True when State is
      begin
         State := False;
      end Suspend_Until_True;

   end Suspension_Object;

end Ada.Synchronous_Task_Control;
