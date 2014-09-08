------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--    S Y S T E M . M U L T I P R O C E S S O R S . F A I R _ L O C K S     --
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

with System.OS_Interface;

package body System.Multiprocessors.Fair_Locks is

   use System.Multiprocessors.Spin_Locks;

   Multiprocessor : constant Boolean := CPU'Range_Length /= 1;
   --  Set true if on multiprocessor (more than one CPU)

   function Next_Spinning (Flock : Fair_Lock) return CPU;
   pragma Inline (Next_Spinning);
   --  Search for the next spinning CPU. If no one is spinning return the
   --  current CPU.

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Flock : in out Fair_Lock) is
   begin
      Unlock (Flock.Lock);
      Flock.Spinning := (others => False);
   end Initialize;

   ----------
   -- Lock --
   ----------

   procedure Lock (Flock : in out Fair_Lock) is
      CPU_Id    : constant CPU := System.OS_Interface.Current_CPU;
      Succeeded : Boolean;

   begin
      --  Notify we are waiting for the lock

      Flock.Spinning (CPU_Id) := True;

      loop
         Try_Lock (Flock.Lock, Succeeded);
         if Succeeded then

            --  We have the lock

            Flock.Spinning (CPU_Id) := False;
            return;

         else
            loop
               if not Flock.Spinning (CPU_Id) then

                  --  Lock's owner gives us the lock

                  return;
               end if;

               --  Lock's owner left but didn't wake us up, retry to get lock

               exit when not Locked (Flock.Lock);
            end loop;
         end if;
      end loop;
   end Lock;

   ------------
   -- Locked --
   ------------

   function Locked (Flock : Fair_Lock) return Boolean is
   begin
      return Locked (Flock.Lock);
   end Locked;

   -------------------
   -- Next_Spinning --
   -------------------

   function Next_Spinning (Flock : Fair_Lock) return CPU is
      Current : constant CPU := System.OS_Interface.Current_CPU;
      CPU_Id  : CPU := Current;

   begin

      if Multiprocessor then

         --  Only for multiprocessor

         loop
            if CPU_Id = CPU'Last then
               CPU_Id := CPU'First;
            else
               CPU_Id := CPU_Id + 1;
            end if;

            exit when Flock.Spinning (CPU_Id) or else CPU_Id = Current;
         end loop;
      end if;

      return CPU_Id;
   end Next_Spinning;

   --------------
   -- Try_Lock --
   --------------

   procedure Try_Lock (Flock : in out Fair_Lock; Succeeded : out Boolean) is
   begin
      Try_Lock (Flock.Lock, Succeeded);
   end Try_Lock;

   ------------
   -- Unlock --
   ------------

   procedure Unlock (Flock : in out Fair_Lock) is
      CPU_Id : constant CPU := Next_Spinning (Flock);

   begin
      if CPU_Id /= System.OS_Interface.Current_CPU then

         --  Wake up the next spinning CPU

         Flock.Spinning (CPU_Id) := False;

      else
         --  Nobody is waiting for the Lock

         Unlock (Flock.Lock);
      end if;
   end Unlock;

end System.Multiprocessors.Fair_Locks;
