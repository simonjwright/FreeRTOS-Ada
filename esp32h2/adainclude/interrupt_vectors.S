        /*
        * Copyright (C) 2024 Free Software Foundation, Inc.

        * This file is part of the FreeRTOS-Ada project. This file is
        * free software; you can redistribute it and/or modify it under
        * terms of the GNU General Public License as published by the Free
        * Software Foundation; either version 3, or (at your option) any
        * later version. This file is distributed in the hope that it will
        * be useful, but WITHOUT ANY WARRANTY; without even the implied
        * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

        * As a special exception under Section 7 of GPL version 3, you are
        * granted additional permissions described in the GCC Runtime
        * Library Exception, version 3.1, as published by the Free Software
        * Foundation.

        * You should have received a copy of the GNU General Public License
        * and a copy of the GCC Runtime Library Exception along with this
        * program; see the files COPYING3 and COPYING.RUNTIME respectively.
        * If not, see <http://www.gnu.org/licenses/>.

        * This is the Vector Table, described in ESP32-H2 Technical Reference
        * Manual.
        * The CSR mtvec points here.
        */

        .balign 0x100
        .global _isr_vector_table
        .type _isr_vector_table, @function
_isr_vector_table:
        .option push
        .option norvc

        /* 32 identical entries, all pointing to the
        FreeRTOS-supplied trap handler.  */
        .rept 32
        j freertos_risc_v_trap_handler
        .endr

        .option pop
        .size _isr_vector_table, .-_isr_vector_table
