------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                   S Y S T E M . B B . P A R A M E T E R S                --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2013, AdaCore                     --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

--  This package defines basic parameters used by the low level tasking system

--  This is the TMS570 (ARMv7) version of this package

pragma Restrictions (No_Elaboration_Code);

package System.BB.Parameters is
   pragma Pure;

   Clock_Frequency : constant := 168_000_000;

   ----------------
   -- Interrupts --
   ----------------

   --  These definitions are in this package in order to isolate target
   --  dependencies.

   Number_Of_Interrupt_ID : constant := 85;
   --  Number of interrupts (for both the interrupt controller and the
   --  Sys_Tick_Trap). This static constant is used to declare a type, and
   --  the handler table.

   Trap_Vectors : constant := 16;
   --  While on this target there is little difference between interrupts
   --  and traps, we consider the following traps:
   --
   --    Name                        Nr
   --
   --    Reset_Vector                 1
   --    NMI_Vector                   2
   --    Hard_Fault_Vector            3
   --    Mem_Manage_Vector            4
   --    Bus_Fault_Vector             5
   --    Usage_Fault_Vector           6
   --    SVC_Vector                  10
   --    Debug_Mon_Vector            11
   --    Pend_SV_Vector              13
   --    Sys_Tick_Vector             14
   --    Interrupt_Request_Vector    15
   --
   --  These trap vectors correspond to different low-level trap handlers in
   --  the run time. Note that as all interrupt requests (IRQs) will use the
   --  same interrupt wrapper, there is no benefit to consider using separate
   --  vectors for each.

   Context_Buffer_Capacity : constant := 10;
   --  The context buffer contains registers r4 .. r11 and the SP_process
   --  (PSP). The size is rounded up to an even number for alignment

   ------------
   -- Stacks --
   ------------

   Interrupt_Stack_Size : constant := 2 * 1024;
   --  Size of each of the interrupt stacks in bytes. While there nominally is
   --  an interrupt stack per interrupt priority, the entire space is used as a
   --  single stack.

   ----------
   -- CPUS --
   ----------

   Max_Number_Of_CPUs : constant := 1;
   --  Maximum number of CPUs

   Multiprocessor : constant Boolean := Max_Number_Of_CPUs /= 1;
   --  Are we on a multiprocessor board?

end System.BB.Parameters;
