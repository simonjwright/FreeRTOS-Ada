------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--    S Y S T E M . M U L T I P R O C E S S O R S . F A I R _ L O C K S     --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--                       Copyright (C) 2010, AdaCore                        --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion. GNARL is distributed in the hope that it will be useful, but WITH- --
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
------------------------------------------------------------------------------

with System.Multiprocessors.Spin_Locks;

package System.Multiprocessors.Fair_Locks is
   pragma Preelaborate;

   --  The locks implemented in this package are fair among CPUs and must not
   --  be used to synchronize tasks assigned to the same CPU.

   ---------------
   -- Fair lock --
   ---------------

   type Spinning_Array is array (CPU) of Boolean;
   pragma Volatile_Components (Spinning_Array);

   type Fair_Lock is limited record
      Spinning : Spinning_Array := (others => False);
      Lock     : Spin_Locks.Spin_Lock;
   end record;

   procedure Initialize (Flock : in out Fair_Lock);
   pragma Inline (Initialize);
   --  Initialize the lock

   procedure Lock (Flock : in out Fair_Lock);
   pragma Inline (Lock);
   --  Loop until lock is acquired

   function Locked (Flock : Fair_Lock) return Boolean;
   pragma Inline (Locked);
   --  Return the current state of the lock

   procedure Try_Lock (Flock : in out Fair_Lock; Succeeded : out Boolean);
   pragma Inline (Try_Lock);
   --  Return True if the lock has been acquired, otherwise don't wait for the
   --  lock and return False.

   procedure Unlock (Flock : in out Fair_Lock);
   pragma Inline (Unlock);
   --  Release the lock and wake up the next waiting CPU (if any)

end System.Multiprocessors.Fair_Locks;
