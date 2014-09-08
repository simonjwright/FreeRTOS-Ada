------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--               S Y S T E M . B B . C P U _ P R I M I T I V E S            --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2013, AdaCore                     --
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

--  This version is for ARM bareboard targets using the ARMv7-M targets,
--  which only use Thumb2 instructions.

with Ada.Unchecked_Conversion; use Ada;

with System.Storage_Elements;
with System.Multiprocessors;
with System.BB.Board_Support;
with System.BB.Threads;
with System.BB.Threads.Queues;
with System.BB.Time;
with System.Machine_Code; use System.Machine_Code;

package body System.BB.CPU_Primitives is
   use Parameters;
   use Threads;
   use Queues;
   use Board_Support;
   use Time;
   use System.Multiprocessors;

   package SSE renames System.Storage_Elements;
   use type SSE.Integer_Address;
   use type SSE.Storage_Offset;

   NL : constant String := ASCII.LF & ASCII.HT;
   --  New line separator in Asm templates

   No_Floating_Point : constant Boolean := False;
   --  Set True iff the FPU should not be used

   -----------
   -- Traps --
   -----------

   Reset_Vector             : constant Vector_Id :=  1;
   NMI_Vector               : constant Vector_Id :=  2;
   Hard_Fault_Vector        : constant Vector_Id :=  3;
   --  Mem_Manage_Vector    : constant Vector_Id :=  4; --  Never referenced
   Bus_Fault_Vector         : constant Vector_Id :=  5;
   Usage_Fault_Vector       : constant Vector_Id :=  6;
   SV_Call_Vector           : constant Vector_Id := 10;
   --  Debug_Mon_Vector     : constant Vector_Id := 11; --  Never referenced
   Pend_SV_Vector           : constant Vector_Id := 13;
   Sys_Tick_Vector          : constant Vector_Id := 14;
   Interrupt_Request_Vector : constant Vector_Id := 15;

   pragma Assert (Interrupt_Request_Vector = Vector_Id'Last);

   type Trap_Handler_Ptr is access procedure (Id : Vector_Id);
   function To_Pointer is new Unchecked_Conversion (Address, Trap_Handler_Ptr);

   type Trap_Handler_Table is array (Vector_Id) of Trap_Handler_Ptr;
   pragma Suppress_Initialization (Trap_Handler_Table);

   Trap_Handlers : Trap_Handler_Table;
   pragma Export (C, Trap_Handlers, "__gnat_bb_exception_handlers");

   System_Vectors : constant System.Address;
   pragma Import (Asm, System_Vectors, "__vectors");

   --  As ARMv7M does not directly provide a single-shot alarm timer, and
   --  we have to use Sys_Tick for that, we need to have this clock generate
   --  interrupts at a relatively high rate. To avoid unnecessary overhead
   --  when no alarms are requested, we'll only call the alarm handler if
   --  the current time exceeds the Alarm_Time by at most half the modulus
   --  of Timer_Interval.

   Alarm_Time      :  Board_Support.Timer_Interval;
   pragma Volatile (Alarm_Time);
   pragma Import (C, Alarm_Time, "__gnat_alarm_time");

   procedure SV_Call_Handler;
   pragma Export (Asm, SV_Call_Handler, "__gnat_sv_call_trap");

   procedure Pend_SV_Handler;
   pragma Machine_Attribute (Pend_SV_Handler, "naked");
   pragma Export (Asm, Pend_SV_Handler, "__gnat_pend_sv_trap");
   --  This assembly routine needs to save and restore registers without
   --  interference. The "naked" machine attribute communicates this to GCC.

   procedure Sys_Tick_Handler;
   pragma Export (Asm, Sys_Tick_Handler, "__gnat_sys_tick_trap");

   procedure Interrupt_Request_Handler;
   pragma Export (Asm, Interrupt_Request_Handler, "__gnat_irq_trap");

   procedure GNAT_Error_Handler (Trap : Vector_Id);
   pragma No_Return (GNAT_Error_Handler);

   -----------------------
   -- Context Switching --
   -----------------------

   --  This port uses the ARMv7-M hardware for saving volatile context for
   --  interrupts, see the Hardware_Context type below for details. Any
   --  non-volatile registers will be preserved by the interrupt handler in
   --  the same way as it happens for ordinary procedure calls.

   --  The non-volatile registers, as well as the value of the stack pointer
   --  (SP_process) are saved in the Context buffer of the Thread_Descriptor.
   --  Any non-volatile floating-point registers are saved on the stack.

   --  R4 .. R11 are at offset 0 .. 7

   SP_process : constant Context_Id := 8;

   type Hardware_Context is record
      R0, R1, R2, R3   : Word;
      R12, LR, PC, PSR : Word;
   end record;

   ICSR : Word with Volatile, Address   => 16#E000_ED04#; -- Int. Control/State

   ICSR_Pend_SV_Set : constant Word := 2**28;

   VTOR : Address with Volatile, Address => 16#E000_ED08#; -- Vec. Table Offset

   AIRCR : Word with Volatile, Address => 16#E000_ED0C#; -- App Int/Reset Ctrl
   CCR   : Word with Volatile, Address => 16#E000_ED14#; -- Config. Control
   SHPR1 : Word with Volatile, Address => 16#E000_ED18#; -- Sys Hand  4- 7 Prio
   SHPR2 : Word with Volatile, Address => 16#E000_ED1C#; -- Sys Hand  8-11 Prio
   SHPR3 : Word with Volatile, Address => 16#E000_ED20#; -- Sys Hand 12-15 Prio
   SHCSR : Word with Volatile, Address => 16#E000_ED24#; -- Sys Hand Ctrl/State

   function PRIMASK return Word with Inline, Export, Convention => C;
   --  Function returning the contents of the PRIMASK register

   procedure Initialize_CPU;
   --  Set the CPU up to use the proper stack for interrupts, initialize and
   --  enable system trap handlers.

   -------------
   -- PRIMASK --
   -------------

   function PRIMASK return Word is
      R : Word;
   begin
      Asm ("mrs %0, PRIMASK", Outputs => Word'Asm_Output ("=r", R),
           Volatile => True);
      return R;
   end PRIMASK;

   --------------------
   -- Initialize_CPU --
   --------------------

   procedure Initialize_CPU is
      Interrupt_Stack_Table : array (System.Multiprocessors.CPU)
        of System.Address;
      pragma Import (Asm, Interrupt_Stack_Table, "interrupt_stack_table");
      --  Table containing a pointer to the top of the stack for each processor

   begin
      --  Switch the stack pointer to SP_process (PSP)

      Asm ("mrs r0, MSP" & NL &
           "msr PSP, r0" & NL &
           "mrs r0, CONTROL" & NL &
           "orr r0,r0,2" & NL &
           "msr CONTROL,r0",
           Clobber => "r0",
           Volatile => True);

      --  Initialize SP_main (MSP)

      Asm ("msr MSP, %0",
           Inputs => Address'Asm_Input ("r", Interrupt_Stack_Table (1)),
           Volatile => True);

      --  Initialize vector table

      VTOR := System_Vectors'Address;

      --  Set configuration: stack is 8 byte aligned, trap on divide by 0,
      --  no trap on unaligned access, can enter thread mode from any level.

      CCR := CCR or 16#211#;

      --  Set priorities of system handlers. The Pend_SV handler runs at the
      --  lowest priority, so context switching does not block higher priority
      --  interrupt handlers. All other system handlers run at the highest
      --  priority (0), so they will not be interrupted. This is also true for
      --  the SysTick interrupt, as this interrupt must be serviced promptly in
      --  order to avoid losing track of time.

      SHPR1 := 0;
      SHPR2 := 0;
      SHPR3 := 16#00_FF_00_00#;

      --  Write the required key (16#05FA#) and desired PRIGROUP value. We
      --  configure this to 3, to have 16 group priorities

      AIRCR := 16#05FA_0300#;
      pragma Assert (AIRCR = 16#FA05_0300#); --  Key value is swapped

      --  Enable usage, bus and memory management fault

      SHCSR := SHCSR or 16#7_000#;

      --  Unmask Fault

      Asm ("cpsie f", Volatile => True);
   end Initialize_CPU;

   --------------------
   -- Context_Switch --
   --------------------

   procedure Context_Switch is
   begin
      --  Interrupts must be disabled at this point

      pragma Assert (PRIMASK = 1);

      --  Make deferred supervisor call pending

      ICSR := ICSR_Pend_SV_Set;

      --  The context switch better be pending, as otherwise it means
      --  interrupts were not disabled.

      pragma Assert ((ICSR and ICSR_Pend_SV_Set) /= 0);

      --  Memory must be clobbered, as task switching causes a task to signal,
      --  which means its memory changes must be visible to all other tasks.

      Asm ("", Volatile => True, Clobber => "memory");
   end Context_Switch;

   -----------------
   -- Get_Context --
   -----------------

   function Get_Context
     (Context : Context_Buffer;
      Index   : Context_Id) return Word
   is
      (Word (Context (Index)));

   ------------------------
   -- GNAT_Error_Handler --
   ------------------------

   procedure GNAT_Error_Handler (Trap : Vector_Id) is
   begin
      case Trap is
         when Reset_Vector =>
            raise Program_Error with "unexpected reset";
         when NMI_Vector =>
            raise Program_Error with "non-maskable interrupt";
         when Hard_Fault_Vector =>
            raise Program_Error with "hard fault";
         when Bus_Fault_Vector  =>
            raise Program_Error with "bus fault";
         when Usage_Fault_Vector =>
            raise Constraint_Error with "usage fault";
         when others =>
            raise Program_Error with "unhandled trap";
      end case;
   end GNAT_Error_Handler;

   ----------------------------------
   -- Interrupt_Request_Handler -- --
   ----------------------------------

   procedure Interrupt_Request_Handler is
   begin
      --  Call the handler (System.BB.Interrupts.Interrupt_Wrapper)

      Trap_Handlers (Interrupt_Request_Vector)(Interrupt_Request_Vector);

      --  The handler has changed the current priority (BASEPRI), although
      --  being useless on ARMv7m. We need to revert it.

      --  The interrupt handler may have scheduled a new task, so we need to
      --  check whether a context switch is needed.

      if Context_Switch_Needed then

         --  Perform a context switch because the currently executing thread is
         --  no longer the one with the highest priority.

         --  No need to update execution time. Already done in the wrapper.

         --  Note that the following context switch is not immediate, but
         --  will only take effect after interrupts are enabled.

         Context_Switch;
      end if;

      --  Restore interrupt masking of interrupted thread

      Enable_Interrupts (Running_Thread.Active_Priority);
   end Interrupt_Request_Handler;

   ---------------------
   -- Pend_SV_Handler --
   ---------------------

   procedure Pend_SV_Handler is
   begin
      --  At most one instance of this handler can run at a time, and
      --  interrupts will preserve all state, so interrupts can be left
      --  enabled. Note the invariant that at all times the active context is
      --  in the ("__gnat_running_thread_table"). Only this handler may update
      --  that variable.

      Asm
        (Template =>
         "movw r2, #:lower16:__gnat_running_thread_table" & NL &
         "movt r2, #:upper16:__gnat_running_thread_table" & NL &
         "mrs  r12, PSP "       & NL & -- Retrieve current PSP
         "ldr  r3, [r2]"        & NL & -- Load address of running context

         --  If floating point is enabled, we may have to save the non-volatile
         --  floating point registers, and save bit 4 of the LR register, as
         --  this will indicate whether the floating point context was saved
         --  or not.

         (if No_Floating_Point then "" -- No FP context to save
          else
            "tst  lr, #16"            & NL &  -- if FPCA flag was set,
            "itte  eq"                & NL &  -- then
            "vstmdbeq r12!,{s16-s31}" & NL &  --   save FP context below PSP
            "addeq  r12, #1"          & NL &  --   save flag in bit 0 of PSP
            "subne  lr, #16"          & NL) & -- else set FPCA flag in LR

         --  Swap R4-R11 and PSP (stored in R12)

         "stm  r3, {r4-r12}"        & NL & -- Save context
         "movw r3, #:lower16:first_thread_table" & NL &
         "movt r3, #:upper16:first_thread_table" & NL &
         "ldr  r3, [r3]"            & NL & -- Load address of new context
         "str  r3, [r2]"            & NL & -- Update value of Pend_SV_Context
         "ldm  r3, {r4-r12}"        & NL & -- Load context and new PSP

         --  If floating point is enabled, check bit 0 of PSP to see if we
         --  need to restore the floating point context.

         (if No_Floating_Point then ""     -- No FP context to restore
          else
            "tst  r12, #1"            & NL &  -- if FPCA was set,
            "itte  ne"                & NL &  -- then
            "subne r12, #1"           & NL &  --   remove flag from PSP
            "vldmiane r12!,{s16-s31}" & NL &  --   Restore FP context
            "addeq lr, #16"           & NL) & -- else clear FPCA flag in LR

         --  Finally, update PSP and perform the exception return

         "msr  PSP, r12" & NL &        -- Update PSP
         "bx   lr",                    -- return to caller
         Volatile => True);
   end Pend_SV_Handler;

   ---------------------
   -- SV_Call_Handler --
   ---------------------

   procedure SV_Call_Handler is
   begin
      GNAT_Error_Handler (SV_Call_Vector);
   end SV_Call_Handler;

   -----------------
   -- Set_Context --
   -----------------

   procedure Set_Context
     (Context : in out Context_Buffer;
      Index   : Context_Id;
      Value   : Word) is
   begin
      Context (Index) := Address (Value);
   end Set_Context;

   ----------------------
   -- Sys_Tick_Handler --
   ----------------------

   procedure Sys_Tick_Handler is
      Max_Alarm_Interval : constant Timer_Interval := Timer_Interval'Last / 2;
      Now : constant Timer_Interval := Read_Clock;

   begin
      --  The following allows max. efficiency for "useless" tick interrupts

      if Alarm_Time - Now <= Max_Alarm_Interval then

         --  Alarm is still in the future, nothing to do, so return quickly

         return;
      end if;

      Alarm_Time := Now + Max_Alarm_Interval;

      --  Call the alarm handler

      Trap_Handlers (Sys_Tick_Vector)(Sys_Tick_Vector);

      --  The interrupt handler may have scheduled a new task

      if Context_Switch_Needed then
         Context_Switch;
      end if;

      Enable_Interrupts (Running_Thread.Active_Priority);
   end Sys_Tick_Handler;

   ------------------------
   -- Initialize_Context --
   ------------------------

   procedure Initialize_Context
     (Buffer          : not null access Context_Buffer;
      Program_Counter : System.Address;
      Argument        : System.Address;
      Stack_Pointer   : System.Address)
   is
      HW_Ctx_Bytes : constant System.Address := Hardware_Context'Size / 8;
      New_SP       : constant System.Address :=
                       (Stack_Pointer - HW_Ctx_Bytes) and not 4;

      HW_Ctx : Hardware_Context with Address => New_SP;

   begin
      --  No need to initialize the context of the environment task

      if Program_Counter = Null_Address then
         return;
      end if;

      HW_Ctx := (R0     => Word (Argument),
                 PC     => Word (Program_Counter),
                 PSR    => 2**24, -- Set thumb bit
                 others => 0);

      Buffer.all := (SP_process => New_SP, others => 0);
   end Initialize_Context;

   ----------------------------
   -- Install_Error_Handlers --
   ----------------------------

   procedure Install_Error_Handlers is
      EH : constant Address := GNAT_Error_Handler'Address;
   begin
      Install_Trap_Handler (EH, Reset_Vector);
      Install_Trap_Handler (EH, NMI_Vector);
      Install_Trap_Handler (EH, Hard_Fault_Vector);
      Install_Trap_Handler (EH, Bus_Fault_Vector);
      Install_Trap_Handler (EH, Usage_Fault_Vector);
      Install_Trap_Handler (EH, Sys_Tick_Vector);
      Install_Trap_Handler (EH, Pend_SV_Vector);
      Install_Trap_Handler (EH, SV_Call_Vector);
   end Install_Error_Handlers;

   --------------------------
   -- Install_Trap_Handler --
   --------------------------

   procedure Install_Trap_Handler
     (Service_Routine : System.Address;
      Vector          : Vector_Id;
      Synchronous     : Boolean := False)
   is
      pragma Unreferenced (Synchronous);
   begin
      Trap_Handlers (Vector) := To_Pointer (Service_Routine);
   end Install_Trap_Handler;

   ------------------------
   -- Disable_Interrupts --
   ------------------------

   procedure Disable_Interrupts is
   begin
      Asm ("cpsid i", Volatile => True);
   end Disable_Interrupts;

   -----------------------
   -- Enable_Interrupts --
   -----------------------

   procedure Enable_Interrupts (Level : System.Any_Priority) is
   begin
      --  Set the BASEPRI according to the specified level. PRIMASK is still
      --  set, so the change does not take effect until the next Asm.

      Set_Current_Priority (Level);

      --  The following enables interrupts and will cause any pending
      --  interrupts to take effect. The barriers and their placing are
      --  essential, otherwise a blocking operation might not cause an
      --  immediate context switch, violating mutual exclusion.

      Asm ("cpsie i" & NL
         & "dsb"     & NL
         & "isb",
           Clobber => "memory", Volatile => True);
   end Enable_Interrupts;

   -------------------------------
   -- Initialize_Floating_Point --
   -------------------------------

   procedure Initialize_Floating_Point renames Initialize_CPU;
end System.BB.CPU_Primitives;
