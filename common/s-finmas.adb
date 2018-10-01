------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--           S Y S T E M . F I N A L I Z A T I O N _ M A S T E R S          --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--             Copyright (C) 2011, Free Software Foundation, Inc.           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Modified from GCC 4.9.1 for STM32F4 GNAT RTS.

--  with Ada.Exceptions; use Ada.Exceptions;

with System.FreeRTOS.Tasks;
with System.HTable;           use System.HTable;
with System.Storage_Elements; use System.Storage_Elements;

package body System.Finalization_Masters is

   --  Finalize_Address hash table types. In general, masters are homogeneous
   --  collections of controlled objects. Rare cases such as allocations on a
   --  subpool require heterogeneous masters. The following table provides a
   --  relation between object address and its Finalize_Address routine.

   type Header_Num is range 0 .. 127;

   function Hash (Key : System.Address) return Header_Num;

   --  Address --> Finalize_Address_Ptr

   package Finalize_Address_Table is new Simple_HTable
     (Header_Num => Header_Num,
      Element    => Finalize_Address_Ptr,
      No_Element => null,
      Key        => System.Address,
      Hash       => Hash,
      Equal      => "=");

   ---------------------------
   -- Add_Offset_To_Address --
   ---------------------------

   function Add_Offset_To_Address
     (Addr   : System.Address;
      Offset : System.Storage_Elements.Storage_Offset) return System.Address
   is
   begin
      return System.Storage_Elements."+" (Addr, Offset);
   end Add_Offset_To_Address;

   ------------
   -- Attach --
   ------------

   procedure Attach (N : not null FM_Node_Ptr; L : not null FM_Node_Ptr) is
   begin
      FreeRTOS.Tasks.Enter_Critical_Region;  -- ??? interrupts
      Attach_Unprotected (N, L);
      FreeRTOS.Tasks.Exit_Critical_Region;

      --  Note: No need to unlock in case of an exception because the above
      --  code can never raise one.
   end Attach;

   ------------------------
   -- Attach_Unprotected --
   ------------------------

   procedure Attach_Unprotected
     (N : not null FM_Node_Ptr;
      L : not null FM_Node_Ptr)
   is
   begin
      L.Next.Prev := N;
      N.Next := L.Next;
      L.Next := N;
      N.Prev := L;
   end Attach_Unprotected;

   ---------------
   -- Base_Pool --
   ---------------

   function Base_Pool
     (Master : Finalization_Master) return Any_Storage_Pool_Ptr
   is
   begin
      return Master.Base_Pool;
   end Base_Pool;

   -----------------------------------------
   -- Delete_Finalize_Address_Unprotected --
   -----------------------------------------

   procedure Delete_Finalize_Address_Unprotected (Obj : System.Address) is
   begin
      Finalize_Address_Table.Remove (Obj);
   end Delete_Finalize_Address_Unprotected;

   ------------
   -- Detach --
   ------------

   procedure Detach (N : not null FM_Node_Ptr) is
   begin
      FreeRTOS.Tasks.Enter_Critical_Region;
      Detach_Unprotected (N);
      FreeRTOS.Tasks.Exit_Critical_Region;

      --  Note: No need to unlock in case of an exception because the above
      --  code can never raise one.
   end Detach;

   ------------------------
   -- Detach_Unprotected --
   ------------------------

   procedure Detach_Unprotected (N : not null FM_Node_Ptr) is
   begin
      if N.Prev /= null and then N.Next /= null then
         N.Prev.Next := N.Next;
         N.Next.Prev := N.Prev;
         N.Prev := null;
         N.Next := null;
      end if;
   end Detach_Unprotected;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (Master : in out Finalization_Master) is
      Cleanup  : Finalize_Address_Ptr;
      Curr_Ptr : FM_Node_Ptr;
      Obj_Addr : Address;

      function Is_Empty_List (L : not null FM_Node_Ptr) return Boolean;
      --  Determine whether a list contains only one element, the dummy head

      -------------------
      -- Is_Empty_List --
      -------------------

      function Is_Empty_List (L : not null FM_Node_Ptr) return Boolean is
      begin
         return L.Next = L and then L.Prev = L;
      end Is_Empty_List;

   --  Start of processing for Finalize

   begin
      FreeRTOS.Tasks.Enter_Critical_Region;

      --  Synchronization:
      --    Read  - allocation, finalization
      --    Write - finalization

      if Master.Finalization_Started then
         FreeRTOS.Tasks.Exit_Critical_Region;

         --  Double finalization may occur during the handling of stand alone
         --  libraries or the finalization of a pool with subpools. Due to the
         --  potential aliasing of masters in these two cases, do not process
         --  the same master twice.

         return;
      end if;

      --  Lock the master to prevent any allocations while the objects are
      --  being finalized. The master remains locked because either the master
      --  is explicitly deallocated or the associated access type is about to
      --  go out of scope.

      --  Synchronization:
      --    Read  - allocation, finalization
      --    Write - finalization

      Master.Finalization_Started := True;

      while not Is_Empty_List (Master.Objects'Unchecked_Access) loop
         Curr_Ptr := Master.Objects.Next;

         --  Synchronization:
         --    Write - allocation, deallocation, finalization

         Detach_Unprotected (Curr_Ptr);

         --  Skip the list header in order to offer proper object layout for
         --  finalization.

         Obj_Addr := Curr_Ptr.all'Address + Header_Offset;

         --  Retrieve TSS primitive Finalize_Address depending on the master's
         --  mode of operation.

         --  Synchronization:
         --    Read  - allocation, finalization
         --    Write - outside

         if Master.Is_Homogeneous then

            --  Synchronization:
            --    Read  - finalization
            --    Write - allocation, outside

            Cleanup := Master.Finalize_Address;

         else
            --  Synchronization:
            --    Read  - finalization
            --    Write - allocation, deallocation

            Cleanup := Finalize_Address_Unprotected (Obj_Addr);
         end if;

         Cleanup (Obj_Addr);

         --  When the master is a heterogeneous collection, destroy the object
         --  - Finalize_Address pair since it is no longer needed.

         --  Synchronization:
         --    Read  - finalization
         --    Write - outside

         if not Master.Is_Homogeneous then

            --  Synchronization:
            --    Read  - finalization
            --    Write - allocation, deallocation, finalization

            Delete_Finalize_Address_Unprotected (Obj_Addr);
         end if;
      end loop;

      FreeRTOS.Tasks.Exit_Critical_Region;

   end Finalize;

   ----------------------
   -- Finalize_Address --
   ----------------------

   function Finalize_Address
     (Master : Finalization_Master) return Finalize_Address_Ptr
   is
   begin
      return Master.Finalize_Address;
   end Finalize_Address;

   ----------------------------------
   -- Finalize_Address_Unprotected --
   ----------------------------------

   function Finalize_Address_Unprotected
     (Obj : System.Address) return Finalize_Address_Ptr
   is
   begin
      return Finalize_Address_Table.Get (Obj);
   end Finalize_Address_Unprotected;

   --------------------------
   -- Finalization_Started --
   --------------------------

   function Finalization_Started
     (Master : Finalization_Master) return Boolean
   is
   begin
      return Master.Finalization_Started;
   end Finalization_Started;

   ----------
   -- Hash --
   ----------

   function Hash (Key : System.Address) return Header_Num is
   begin
      return
        Header_Num
          (To_Integer (Key) mod Integer_Address (Header_Num'Range_Length));
   end Hash;

   -----------------
   -- Header_Size --
   -----------------

   function Header_Size return System.Storage_Elements.Storage_Count is
   begin
      return FM_Node'Size / Storage_Unit;
   end Header_Size;

   -------------------
   -- Header_Offset --
   -------------------

   function Header_Offset return System.Storage_Elements.Storage_Offset is
   begin
      return FM_Node'Size / Storage_Unit;
   end Header_Offset;

   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize (Master : in out Finalization_Master) is
   begin
      --  The dummy head must point to itself in both directions

      Master.Objects.Next := Master.Objects'Unchecked_Access;
      Master.Objects.Prev := Master.Objects'Unchecked_Access;
   end Initialize;

   --------------------
   -- Is_Homogeneous --
   --------------------

   function Is_Homogeneous (Master : Finalization_Master) return Boolean is
   begin
      return Master.Is_Homogeneous;
   end Is_Homogeneous;

   -------------
   -- Objects --
   -------------

   function Objects (Master : Finalization_Master) return FM_Node_Ptr is
   begin
      return Master.Objects'Unrestricted_Access;
   end Objects;

   -------------------
   -- Set_Base_Pool --
   -------------------

   procedure Set_Base_Pool
     (Master   : in out Finalization_Master;
      Pool_Ptr : Any_Storage_Pool_Ptr)
   is
   begin
      Master.Base_Pool := Pool_Ptr;
   end Set_Base_Pool;

   --------------------------
   -- Set_Finalize_Address --
   --------------------------

   procedure Set_Finalize_Address
     (Master       : in out Finalization_Master;
      Fin_Addr_Ptr : Finalize_Address_Ptr)
   is
   begin
      --  Synchronization:
      --    Read  - finalization
      --    Write - allocation, outside

      FreeRTOS.Tasks.Enter_Critical_Region;
      Set_Finalize_Address_Unprotected (Master, Fin_Addr_Ptr);
      FreeRTOS.Tasks.Exit_Critical_Region;
   end Set_Finalize_Address;

   --------------------------------------
   -- Set_Finalize_Address_Unprotected --
   --------------------------------------

   procedure Set_Finalize_Address_Unprotected
     (Master       : in out Finalization_Master;
      Fin_Addr_Ptr : Finalize_Address_Ptr)
   is
   begin
      if Master.Finalize_Address = null then
         Master.Finalize_Address := Fin_Addr_Ptr;
      end if;
   end Set_Finalize_Address_Unprotected;

   ----------------------------------------------------
   -- Set_Heterogeneous_Finalize_Address_Unprotected --
   ----------------------------------------------------

   procedure Set_Heterogeneous_Finalize_Address_Unprotected
     (Obj          : System.Address;
      Fin_Addr_Ptr : Finalize_Address_Ptr)
   is
   begin
      Finalize_Address_Table.Set (Obj, Fin_Addr_Ptr);
   end Set_Heterogeneous_Finalize_Address_Unprotected;

   --------------------------
   -- Set_Is_Heterogeneous --
   --------------------------

   procedure Set_Is_Heterogeneous (Master : in out Finalization_Master) is
   begin
      --  Synchronization:
      --    Read  - finalization
      --    Write - outside

      FreeRTOS.Tasks.Enter_Critical_Region;
      Master.Is_Homogeneous := False;
      FreeRTOS.Tasks.Exit_Critical_Region;
   end Set_Is_Heterogeneous;

end System.Finalization_Masters;
