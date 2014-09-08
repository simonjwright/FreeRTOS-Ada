------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--    S Y S T E M . M U L T I P R O C E S S O R S . S P I N  _ L O C K S    --
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

package System.Multiprocessors.Spin_Locks is
   pragma Preelaborate;

   ---------------
   -- Spin lock --
   ---------------

   type Atomic_Flag is mod 2**8;
   pragma Atomic (Atomic_Flag);

   Unlocked : constant Atomic_Flag := 0;

   type Spin_Lock is limited record
      Flag : aliased Atomic_Flag := Unlocked;
   end record;

   procedure Lock (Slock : in out Spin_Lock);
   pragma Inline (Lock);
   --  Loop until lock is acquired

   function Locked (Slock : Spin_Lock) return Boolean;
   pragma Inline (Locked);
   --  Return the current state of the lock

   procedure Try_Lock (Slock : in out Spin_Lock; Succeeded : out Boolean);
   pragma Inline (Try_Lock);
   --  Return True if the lock has been acquired, otherwise don't wait for the
   --  lock and return False.

   procedure Unlock (Slock : in out Spin_Lock);
   pragma Inline (Unlock);
   --  Release the lock

end System.Multiprocessors.Spin_Locks;
