------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                 A D A . T A S K _ T E R M I N A T I O N                  --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 2005-2014, Free Software Foundation, Inc.         --
--                                                                          --
-- This specification is derived from the Ada Reference Manual for use with --
-- GNAT. The copyright notice above, and the license provisions that follow --
-- apply solely to the  contents of the part following the private keyword. --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This is a simplified version of this package to be used in when the
--  Ravenscar profile and there are no exception handlers present (either of
--  the restrictions No_Exception_Handlers or No_Exception_Propagation are in
--  effect). This means that the only task termination cause that need to be
--  taken into account is normal task termination (abort is not allowed by
--  the Ravenscar profile and the restricted exception support does not
--  include Exception_Occurrence).

with Ada.Task_Identification;

package Ada.Task_Termination is
   pragma Preelaborate (Task_Termination);

   type Termination_Handler is access
     protected procedure (T : Ada.Task_Identification.Task_Id);
   --  ??? This type is not conformant with the RM, as cause and exception
   --  occurrence are missing. Adding cause would be easy, but in the sfp
   --  profile there is no declaration of Exception_Occurrence.

   procedure Set_Dependents_Fallback_Handler
     (Handler : Termination_Handler);
   function Current_Task_Fallback_Handler return Termination_Handler;

end Ada.Task_Termination;
