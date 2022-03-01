------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                    S Y S T E M . P A R A M E T E R S                     --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--       Copyright  (C) 2016-2018 Free Software Foundation, Inc.            --
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

--  This is the version for Cortex GNAT RTS.

package body System.Parameters is

   function Adjust_Storage_Size (Size : Size_Type) return Size_Type is
     (if Size = Unspecified_Size then
        Default_Stack_Size
      elsif Size < Minimum_Stack_Size then
        Minimum_Stack_Size
      else
        Size);

   --  If the link includes a symbol _default_storage_size,
   --  use this as the storage size: otherwise, use 1024.
   Default_Storage_Size : constant Size_Type
   with
     Import,
     Convention => Ada,
     External_Name => "_default_storage_size";
   pragma Weak_External (Default_Storage_Size);

   --  If the link includes a symbol _minimum_storage_size,
   --  use this as the minimum storage size: otherwise, use 768.
   Minimum_Storage_Size : constant Size_Type
   with
     Import,
     Convention => Ada,
     External_Name => "_minimum_storage_size";
   pragma Weak_External (Minimum_Storage_Size);

   function Default_Stack_Size return Size_Type is
     (if Default_Storage_Size'Address = System.Null_Address
      then 1024
      else Default_Storage_Size);

   function Minimum_Stack_Size return Size_Type is
      (if Minimum_Storage_Size'Address = System.Null_Address
      then 768
      else Minimum_Storage_Size);

   --  Secondary stack

   Default_Secondary_Stack_Size : Size_Type
   with
     Volatile,
     Export,
     Convention => Ada,
     External_Name => "__gnat_default_ss_size";
   --  Written by the GCC8 binder (unless otherwise specified, to
   --  Runtime_Default_Sec_Stack_Size)

   function Secondary_Stack_Size (Stack_Size : Size_Type) return Size_Type
     is (if Default_Secondary_Stack_Size = 0
         then (Stack_Size * 10) / 100  -- default is 10%
         else Default_Secondary_Stack_Size);

   --  Items referenced by the GCC8 binder, but not used; may need to
   --  go to System.Secondary_Stack eventually.

   Binder_Sec_Stacks_Count : Natural
   with
     Export,
     Convention => Ada,
     External_Name => "__gnat_binder_ss_count";

   Default_Sized_SS_Pool : System.Address
   with
     Export,
     Convention => Ada,
     External_Name => "__gnat_default_ss_pool";

end System.Parameters;
