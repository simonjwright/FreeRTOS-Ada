# Copyright (C) 2018 Free Software Foundation, Inc.

# This file is part of the Cortex GNAT RTS package.

# The Cortex GNAT RTS package is free software; you can redistribute
# it and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING3.  If not, see
# <http://www.gnu.org/licenses/>.

# The purpose of this script is to provide a new command 'stacks' to a
# Python-enabled GDB to report the minimum free stack space for all
# tasks in the system, by
# (a) using a chain in the RTS linking all tasks
# (b) using FreeRTOS task data to access Task Control Block
#     information
# (c) checking the task stack to see where the initialised value
#     changes.
#
# Requirements:
# (a) FreeRTOSConfig.h must contain one or more of
#       configCHECK_FOR_STACK_OVERFLOW > 1
#       configUSE_TRACE_FACILITY == 1
#       INCLUDE_uxTaskGetStackHighWaterMark == 1
# (b) The RTS must be compiled for debugging (-XBUILD=Debug, the default)
#
# Usage:
# (gdb) source /where/ever/stacks.py
# (gdb) stacks
# min free:  2880 , tag:  0x2000a9dc <ada.real_time.timing_events.timer+4>
# min free:  1304 , tag:  0x2000ad9c <environment_task.environment_tcb>
#
# where
# 'min free' is the minimum free stack ever used
# 'tag' indicates the task (it's the address of the procedure created
#   by the compiler to initiate the task)
#
# Inspired by github.com:girtsf/FreeRTOS-GDB.git

import gdb

class Stacks(gdb.Command):
    """stacks: report Ada task free stacks."""

    tcb_t = gdb.lookup_type("TCB_t")
    int_t = gdb.lookup_type("int")

    def __init__(self):
        super(Stacks, self).__init__("stacks", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        # Have to use the symbol corresponding to the variable
        # System.Tasking.Task_Chain, because the GDB language is
        # 'auto' at this point, and we'll be as like as not in the
        # idle task, language C.
        # Contains a System.Tasking.Task_Id (access all ATCB).
        atcb = gdb.parse_and_eval("system__tasking__task_chain")
        while atcb != 0:
            # Get <ATCB>.Common.Thread.
            thread = atcb["common"]["thread"]

            tcb = thread.cast(Stacks.tcb_t.pointer()).dereference()
            stk = tcb["pxStack"].cast(Stacks.int_t.pointer())

            free = 0
            while stk[free] == 0xa5a5a5a5:
                free = free + 1

            print "min free: ", free * 4, \
                ", tag: ", tcb["pxTaskTag"]

            # Fetch the next ATCB in the chain, if any, from
            # <ATCB>.Common.All_Tasks_Link.
            atcb = atcb["common"]["all_tasks_link"]

Stacks()
