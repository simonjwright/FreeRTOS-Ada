------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--     S Y S T E M . T A S K I N G . P R O T E C T E D _ O B J E C T S .    --
--                          S I N G L E _ E N T R Y                         --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--       Copyright (C) 1992-2013, 2016, Free Software Foundation, Inc.      --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This package provides an optimized version of Protected_Objects.Operations
--  and Protected_Objects.Entries making the following assumptions:

--    PO have only one entry
--    There is only one caller at a time (No_Entry_Queue)
--    There is no dynamic priority support (No_Dynamic_Priorities)
--    No Abort Statements
--      (No_Abort_Statements, Max_Asynchronous_Select_Nesting => 0)
--    PO are at library level
--    None of the tasks will terminate (no need for finalization)

--  This interface is intended to be used in the Ravenscar profile, the
--  compiler is responsible for ensuring that the conditions mentioned above
--  are respected, except for the No_Entry_Queue restriction that is checked
--  dynamically in this package, since the check cannot be performed at compile
--  time, and is relatively cheap (see body).

--  This package is part of the high level tasking interface used by the
--  compiler to expand Ada 95 tasking constructs into simpler run time calls
--  (aka GNARLI, GNU Ada Run-time Library Interface)

--  Note: the compiler generates direct calls to this interface, via Rtsfind.
--  Any changes to this interface may require corresponding compiler changes
--  in exp_ch9.adb and possibly exp_ch7.adb

--  This file has been extensively modified from the GCC 4.9.1 version
--  for the Cortex GNAT RTS project.

pragma Restrictions (No_Elaboration_Code);
package System.Tasking.Protected_Objects.Single_Entry is
   pragma Preelaborate;
   ----------------------------------------------------------------------------
   --                         copied from GCC 4.9.1                          --
   ----------------------------------------------------------------------------

   type Protection_Entry is limited private;
   --  This type contains the GNARL state of a protected object. The
   --  application-defined portion of the state (i.e. private objects)
   --  is maintained by the compiler-generated code.

   type Protection_Entry_Access is access all Protection_Entry;

   procedure Initialize_Protection_Entry
     (Object            : Protection_Entry_Access;
      Ceiling_Priority  : Integer;
      Compiler_Info     : System.Address;
      Entry_Body        : Entry_Body_Access);
   --  Initialize the Object parameter so that it can be used by the run time
   --  to keep track of the runtime state of a protected object.

   procedure Lock_Entry (Object : Protection_Entry_Access);
   --  Lock a protected object for write access. Upon return, the caller owns
   --  the lock to this object, and no other call to Lock or Lock_Read_Only
   --  with the same argument will return until the corresponding call to
   --  Unlock has been made by the caller.

   procedure Lock_Read_Only_Entry
     (Object : Protection_Entry_Access);
   --  Lock a protected object for read access. Upon return, the caller owns
   --  the lock for read access, and no other calls to Lock with the same
   --  argument will return until the corresponding call to Unlock has been
   --  made by the caller. Other calls to Lock_Read_Only may (but need not)
   --  return before the call to Unlock, and the corresponding callers will
   --  also own the lock for read access.

   procedure Unlock_Entry (Object : Protection_Entry_Access);
   --  Relinquish ownership of the lock for the object represented by the
   --  Object parameter. If this ownership was for write access, or if it was
   --  for read access where there are no other read access locks outstanding,
   --  one (or more, in the case of Lock_Read_Only) of the tasks waiting on
   --  this lock (if any) will be given the lock and allowed to return from
   --  the Lock or Lock_Read_Only call.

   procedure Service_Entry (Object : Protection_Entry_Access);
   --  Service the entry queue of the specified object, executing the
   --  corresponding body of any queued entry call that is waiting on True
   --  barrier. This is used when the state of a protected object may have
   --  changed, in particular after the execution of the statement sequence
   --  of a protected procedure.
   --
   --  This must be called with abort deferred and with the corresponding
   --  object locked. Object is unlocked on return.

   procedure Protected_Single_Entry_Call
     (Object              : Protection_Entry_Access;
      Uninterpreted_Data  : System.Address);
   --  Make a protected entry call to the specified object
   --
   --  Pends a protected entry call on the protected object represented by
   --  Object. A pended call is not queued; it may be executed immediately
   --  or queued, depending on the state of the entry barrier.
   --
   --    Uninterpreted_Data
   --      This will be returned by Next_Entry_Call when this call is serviced.
   --      It can be used by the compiler to pass information between the
   --      caller and the server, in particular entry parameters.

   function Protected_Count_Entry (Object : Protection_Entry) return Natural;
   --  Return the number of entry calls on Object (0 or 1)

   function Protected_Single_Entry_Caller
     (Object : Protection_Entry) return Task_Id;
   --  Return value of E'Caller, where E is the protected entry currently being
   --  handled. This will only work if called from within an entry body, as
   --  required by the LRM (C.7.1(14)).

private
   --  The first version of the FreeRTOS-based variant of this package
   --  used task Suspend and Resume to manage blocking of a task on an
   --  entry barrier.
   --
   --  However, given that the Resume call might be made from an ISR (is
   --  that even legal?), there is a race condition where the Suspend
   --  call might happen after the Resume which was supposed to waken the
   --  task.
   --
   --  For this reason, we use a Queue to manage the interaction. The
   --  Queue will remember the Give (actually Give_From_ISR) if the
   --  interrupt happens after the entry has been unlocked but before the
   --  task Takes.
   --
   --  We declare our own interface here, rather than using
   --  System.FreeRTOS.Queues, to avoid the need for elaboration.
   type Queue is null record;  -- not really, but opaque to us
   type Queue_Handle is access all Queue;

   type Protection_Entry is record
      Common : aliased Protection;
      --  State of the protected object. This part is common to any protected
      --  object, including those without entries.

      Compiler_Info : System.Address;
      --  Pointer to compiler-generated record representing protected object

      Call_In_Progress : Entry_Call_Link;
      --  Pointer to the entry call being executed (if any)

      Entry_Body : Entry_Body_Access;
      --  Pointer to executable code for the entry body of the protected type

      Entry_Queue : Entry_Call_Link;
      --  Place to store the waiting entry call (if any)

      Barrier_Queue : Queue_Handle;
      --  Suspend here on the entry barrier
   end record;

end System.Tasking.Protected_Objects.Single_Entry;
