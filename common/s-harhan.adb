--  Copyright (C) 2017-2020 Free Software Foundation, Inc.
--
--  This file is part of the FreeRTOS-Ada project. This file is
--  free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 3, or (at your option) any
--  later version. This file is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the implied
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

--  Handler is translated from https://community.nxp.com/thread/389002.

--  See the ARMv7M reference manual.

with Interfaces;
with System.Machine_Code;

package body System.Hardfault_Handling is

   procedure Handler is
   begin
      System.Machine_Code.Asm
        (
         "movs r0, #4" & ASCII.LF &
           "mov r1, lr" & ASCII.LF &
           "tst r0, r1" & ASCII.LF &
           "beq _msp" & ASCII.LF &
           "mrs r0, psp" & ASCII.LF &
           "b hardfault_handling__breakpoint" & ASCII.LF &
           "_msp:" & ASCII.LF &
           "mrs r0, msp" & ASCII.LF &
           "b hardfault_handling__breakpoint" & ASCII.LF,
         Volatile => True
        );
   end Handler;

   type Bit is mod 2 with Size => 1;

   --  Configurable Fault Status Register

   type MMFSR_Register is record
      ACCVIOL      : Bit;
      DACCVIOL     : Bit;
      MUNSTKERR    : Bit;
      MSTKERR      : Bit;
      MLSPERR      : Bit;
      MMARVALID    : Bit;
   end record with Size => 8;
   for MMFSR_Register use record
      ACCVIOL      at 0 range 0 .. 0;
      DACCVIOL     at 0 range 1 .. 1;
      MUNSTKERR    at 0 range 3 .. 3;
      MSTKERR      at 0 range 4 .. 4;
      MLSPERR      at 0 range 5 .. 5;
      MMARVALID    at 0 range 7 .. 7;
   end record;

   type BFSR_Register is record
      IBUSERR      : Bit;
      PRECISERR    : Bit;
      IMPRECISERR  : Bit;
      UNSTKERR     : Bit;
      STKERR       : Bit;
      LSPERR       : Bit;
      BFARVALID    : Bit;
   end record with Size => 8;
   for BFSR_Register use record
      IBUSERR      at 0 range 0 .. 0;
      PRECISERR    at 0 range 1 .. 1;
      IMPRECISERR  at 0 range 2 .. 2;
      UNSTKERR     at 0 range 3 .. 3;
      STKERR       at 0 range 4 .. 4;
      LSPERR       at 0 range 5 .. 5;
      BFARVALID    at 0 range 7 .. 7;
   end record;

   type USFR_Register is record
      UNDEFINSTR : Bit;
      INVSTATE   : Bit;
      INVPC      : Bit;
      NOCP       : Bit;
      UNALIGNED  : Bit;
      DIVBYZERO  : Bit;
   end record with Size => 16;
   for USFR_Register use record
      UNDEFINSTR at 0 range 0 .. 0;
      INVSTATE   at 0 range 1 .. 1;
      INVPC      at 0 range 2 .. 2;
      NOCP       at 0 range 3 .. 3;
      UNALIGNED  at 0 range 8 .. 8;
      DIVBYZERO  at 0 range 9 .. 9;
   end record;

   type CFSR_Register is record
      MMFSR : MMFSR_Register;
      BFSR  : BFSR_Register;
      USFR  : USFR_Register;
   end record with Size => 32;
   for CFSR_Register use record
      MMFSR at 0 range 0 .. 7;
      BFSR  at 0 range 8 .. 15;
      USFR  at 0 range 16 .. 31;
   end record;

   --  Hard Fault Status Register

   type HFSR_Register is record
      VECTTBL  : Bit;
      FORCED   : Bit;
      DEBUGEVT : Bit;
   end record with Size => 32;
   for HFSR_Register use record
      VECTTBL  at 0 range 1 .. 1;
      FORCED   at 0 range 30 .. 30;
      DEBUGEVT at 0 range 31 .. 31;
   end record;

   --  Debug Fault Status Register

   type DFSR_Register is record
      HALTED   : Bit;
      BKPT     : Bit;
      DWTTRAP  : Bit;
      VCATCH   : Bit;
      EXTERNAL : Bit;
   end record with Size => 32;
   for DFSR_Register use record
      HALTED   at 0 range 0 .. 0;
      BKPT     at 0 range 1 .. 1;
      DWTTRAP  at 0 range 2 .. 2;
      VCATCH   at 0 range 3 .. 3;
      EXTERNAL at 0 range 4 .. 4;
   end record;

   type Machine_State is record
      R0  : Interfaces.Unsigned_32;
      R1  : Interfaces.Unsigned_32;
      R2  : Interfaces.Unsigned_32;
      R3  : Interfaces.Unsigned_32;
      R12 : Interfaces.Unsigned_32;
      LR  : Interfaces.Unsigned_32;
      PC  : Interfaces.Unsigned_32;
      PSR : Interfaces.Unsigned_32;
   end record;

   procedure Breakpoint (State : Machine_State)
   with
     Export,
     External_Name => "hardfault_handling__breakpoint";
   --  Breakpoint needs to be exported, so as not to be elided under
   --  higher levels of optimisation.

   procedure Breakpoint (State : Machine_State) is
      pragma Unreferenced (State);
      --  Configurable Fault Status Register
      CFSR : CFSR_Register
      with Address => System'To_Address (16#E000ED28#);
      --  Hard Fault Status Register
      HFSR : HFSR_Register
      with Address => System'To_Address (16#E000ED2C#);
      --  Debug Fault Status Register
      DFSR : DFSR_Register
      with Address => System'To_Address (16#E000ED30#);
      --  Auxiliary Fault Status Register
      AFSR : Interfaces.Unsigned_32
      with Address => System'To_Address (16#E000ED3C#);
      --  MemManage Fault Address Register
      MMAR : Interfaces.Unsigned_32
      with Address => System'To_Address (16#E000ED34#);
      --  Bus Fault Address Register
      BFAR : Interfaces.Unsigned_32
      with Address => System'To_Address (16#E000ED38#);
   begin
      System.Machine_Code.Asm ("bkpt #0" & ASCII.LF, Volatile => True);
   end Breakpoint;

end System.Hardfault_Handling;
