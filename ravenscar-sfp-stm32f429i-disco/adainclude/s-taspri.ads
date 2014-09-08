------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                 S Y S T E M . T A S K _ P R I M I T I V E S              --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--          Copyright (C) 2001-2010, Free Software Foundation, Inc.         --
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
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This is the version of this package for Ravenscar bare board targets

pragma Polling (Off);
--  Turn off polling, we do not want ATC polling to take place during tasking
--  operations. It causes infinite loops and other problems.

with System.OS_Interface;

package System.Task_Primitives is
   pragma Preelaborate;

   type Task_Body_Access is access procedure;
   --  Pointer to the task body's entry point (or possibly a wrapper
   --  declared local to the GNARL).

   type Private_Data is limited private;
   --  Any information that the GNULLI needs maintained on a per-task
   --  basis.  A component of this type is guaranteed to be included
   --  in the Ada_Task_Control_Block.

   subtype Task_Address is System.Address;
   --  In some versions of Task_Primitives, notably for VMS, Task_Address is
   --  the short version of address defined in System.Aux_DEC. To avoid
   --  dragging Aux_DEC into tasking packages a tasking specific subtype is
   --  defined here.

   Task_Address_Size : constant := Standard'Address_Size;
   --  The size of Task_Address

   Alternate_Stack_Size : constant := 0;
   --  No alternate signal stack is used on this platform

private

   type Private_Data is record
      Thread_Desc : aliased System.OS_Interface.Thread_Descriptor;
      --  Thread descriptor associated to the ATCB to which it belongs

      Thread : aliased System.OS_Interface.Thread_Id :=
                 System.OS_Interface.Null_Thread_Id;
      --  Thread Id associated to the ATCB to which it belongs.
      --  ??? It is mostly used by GDB, so we may want to remove it at some
      --  point.
      pragma Atomic (Thread);
      --  Thread field may be updated by two different threads of control.
      --  (See, Enter_Task and Create_Task in s-taprop.adb).
      --  They put the same value (thr_self value). We do not want to
      --  use lock on those operations and the only thing we have to
      --  make sure is that they are updated in atomic fashion.

      Lwp : aliased System.Address := System.Null_Address;
      --  This element duplicates the Thread element. It is read by gdb when
      --  the remote protocol is used.
   end record;

end System.Task_Primitives;
