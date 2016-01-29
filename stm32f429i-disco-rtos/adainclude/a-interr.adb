------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                     S Y S T E M . T A S K _ I N F O                      --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--         Copyright (C) 2007-2012, 2016, Free Software Foundation, Inc.    --
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

--  This package contains the definitions and routines associated with the
--  implementation and use of the Task_Info pragma. It is specialized
--  appropriately for targets that make use of this pragma.

--  Note: the compiler generates direct calls to this interface, via Rtsfind.
--  Any changes to this interface may require corresponding compiler changes.

--  This unit may be used directly from an application program by providing
--  an appropriate WITH, and the interface can be expected to remain stable.

--  Modified from the GCC 4.9.1 version for the Cortex GNAT RTS
--  project, for STM32F4.

package body Ada.Interrupts is

   use System;

   pragma Warnings (Off, "formal parameter*");

   function Is_Reserved (Interrupt : Interrupt_ID) return Boolean is
   begin
      return False;
   end Is_Reserved;

   function Is_Attached (Interrupt : Interrupt_ID) return Boolean is
   begin
      return False;
   end Is_Attached;

   function Current_Handler
     (Interrupt : Interrupt_ID) return Parameterless_Handler is
   begin
      raise Program_Error with "illegal Current_Handler";
      return null;
   end Current_Handler;

   procedure Attach_Handler
     (New_Handler : Parameterless_Handler;
      Interrupt   : Interrupt_ID) is
   begin
      raise Program_Error with "illegal Attach_Handler";
   end Attach_Handler;

   procedure Exchange_Handler
     (Old_Handler : out Parameterless_Handler;
      New_Handler : Parameterless_Handler;
      Interrupt   : Interrupt_ID) is
   begin
      raise Program_Error with "illegal Exchange_Handler";
   end Exchange_Handler;

   procedure Detach_Handler (Interrupt : Interrupt_ID) is
   begin
      raise Program_Error with "illegal Detach_Handler";
   end Detach_Handler;

   function Reference (Interrupt : Interrupt_ID) return Address is
   begin
      raise Program_Error with "illegal Reference";
      return Null_Address;
   end Reference;

   pragma Warnings (On, "formal parameter*");

end Ada.Interrupts;
