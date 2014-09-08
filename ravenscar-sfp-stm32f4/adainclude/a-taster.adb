------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                 A D A . T A S K _ T E R M I N A T I O N                  --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--         Copyright (C) 2005-2014, Free Software Foundation, Inc.          --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This is a simplified version of this package body to be used in when the
--  Ravenscar profile and there are no exception handlers present (either of
--  the restrictions No_Exception_Handlers or No_Exception_Propagation are in
--  effect). This means that the only task termination cause that need to be
--  taken into account is normal task termination (abort is not allowed by
--  the Ravenscar profile and the restricted exception support does not
--  include Exception_Occurrence).

with System.Tasking;
--  used for Task_Id
--           Self
--           Fall_Back_Handler

with System.Task_Primitives.Operations;
--  Used for Self
--           Set_Priority
--           Get_Priority

with Unchecked_Conversion;

package body Ada.Task_Termination is

   use System.Task_Primitives.Operations;

   use type Ada.Task_Identification.Task_Id;

   function To_TT is new Unchecked_Conversion
     (System.Tasking.Termination_Handler, Termination_Handler);

   function To_ST is new Unchecked_Conversion
     (Termination_Handler, System.Tasking.Termination_Handler);

   -----------------------------------
   -- Current_Task_Fallback_Handler --
   -----------------------------------

   function Current_Task_Fallback_Handler return Termination_Handler is
      Self_Id         : constant System.Tasking.Task_Id := Self;
      Caller_Priority : constant System.Any_Priority := Get_Priority (Self_Id);

      Result : Termination_Handler;

   begin
      --  Raise the priority to prevent race conditions when modifying
      --  System.Tasking.Fall_Back_Handler.

      Set_Priority (Self_Id, System.Any_Priority'Last);

      Result := To_TT (System.Tasking.Fall_Back_Handler);

      --  Restore the original priority

      Set_Priority (Self_Id, Caller_Priority);

      return Result;
   end Current_Task_Fallback_Handler;

   -------------------------------------
   -- Set_Dependents_Fallback_Handler --
   -------------------------------------

   procedure Set_Dependents_Fallback_Handler (Handler : Termination_Handler) is
      Self_Id         : constant System.Tasking.Task_Id := Self;
      Caller_Priority : constant System.Any_Priority := Get_Priority (Self_Id);

   begin
      --  Raise the priority to prevent race conditions when modifying
      --  System.Tasking.Fall_Back_Handler.

      Set_Priority (Self_Id, System.Any_Priority'Last);

      System.Tasking.Fall_Back_Handler := To_ST (Handler);

      --  Restore the original priority

      Set_Priority (Self_Id, Caller_Priority);
   end Set_Dependents_Fallback_Handler;

end Ada.Task_Termination;
