------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                    S Y S T E M . P A R A M E T E R S                     --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--       Copyright (C) 1992-2013, 2016, Free Software Foundation, Inc.      --
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

--  This package defines some system dependent parameters for GNAT. These
--  are values that are referenced by the runtime library and are therefore
--  relevant to the target machine.

--  The parameters whose value is defined in the spec are not generally
--  expected to be changed. If they are changed, it will be necessary to
--  recompile the run-time library.

--  The parameters which are defined by functions can be changed by modifying
--  the body of System.Parameters in file s-parame.adb. A change to this body
--  requires only rebinding and relinking of the application.

--  Note: do not introduce any pragma Inline statements into this unit, since
--  otherwise the relinking and rebinding capability would be deactivated.

--  Modified from GCC 4.9.1 for Cortex GNAT RTS.

package System.Parameters is
   pragma Pure;

   type Size_Type is new Integer;

   Unspecified_Size : constant Size_Type := Size_Type'First;
   --  Type used to provide task storage size to runtime

   function Default_Stack_Size return Size_Type;
   --  Default task stack size used if none is specified

   function Minimum_Stack_Size return Size_Type;
   --  Minimum task stack size permitted

   function Adjust_Storage_Size (Size : Size_Type) return Size_Type;
   --  Given the storage size specified, return the Storage_Size value
   --  required by the RM for the Storage_Size attribute. The required
   --  adjustment is as follows:
   --
   --    when Size = Unspecified_Size, return Default_Stack_Size
   --    when Size < Minimum_Stack_Size, return Minimum_Stack_Size
   --    otherwise return given Size

   function Secondary_Stack_Size (Stack_Size : Size_Type) return Size_Type;
   --  The secondary stack is allocated as part of the task's stack,
   --  whose size is passed in Stack_Size.

end System.Parameters;
