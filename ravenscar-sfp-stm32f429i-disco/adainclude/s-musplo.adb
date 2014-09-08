------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--    S Y S T E M . M U L T I P R O C E S S O R S . S P I N _ L O C K S     --
--                                                                          --
--                                 B o d y                                  --
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

with Interfaces;

package body System.Multiprocessors.Spin_Locks is

   use Interfaces;

   ----------
   -- Lock --
   ----------

   procedure Lock (Slock : in out Spin_Lock) is
      Succeeded : Boolean;

   begin
      --  Loop until we can get the lock

      loop
         Try_Lock (Slock, Succeeded);
         exit when Succeeded;
      end loop;
   end Lock;

   ------------
   -- Locked --
   ------------

   function Locked (Slock : Spin_Lock) return Boolean is
   begin
      return Slock.Flag /= Unlocked;
   end Locked;

   --------------
   -- Try_Lock --
   --------------

   procedure Try_Lock (Slock : in out Spin_Lock; Succeeded : out Boolean) is

      function Lock_Test_And_Set
        (Ptr   : access Atomic_Flag;
         Value : Atomic_Flag)
        return Atomic_Flag;
      pragma Import (Intrinsic, Lock_Test_And_Set,
                       "__sync_lock_test_and_set_1");
   begin
      Succeeded := (Lock_Test_And_Set (Slock.Flag'Access, 1) = Unlocked);
   end Try_Lock;

   ------------
   -- Unlock --
   ------------

   procedure Unlock (Slock : in out Spin_Lock) is

      procedure Lock_Release (Ptr : access Atomic_Flag);
      pragma Import (Intrinsic, Lock_Release,
                       "__sync_lock_release_1");

   begin
      Lock_Release (Slock.Flag'Access);
   end Unlock;

end System.Multiprocessors.Spin_Locks;
