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

package System.Tasking.Protected_Objects.Single_Entry with Elaborate_Body is

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

   procedure Service_Entry (Object : Protection_Entry_Access);
   --  Service the entry queue of the specified object, executing the
   --  corresponding body of any queued entry call that is waiting on True
   --  barrier. This is used when the state of a protected object may have
   --  changed, in particular after the execution of the statement sequence
   --  of a protected procedure.
   --
   --  This must be called with abort deferred and with the corresponding
   --  object locked. Object is unlocked on return.

private

   type Protection_Entry is limited null record;

end System.Tasking.Protected_Objects.Single_Entry;
