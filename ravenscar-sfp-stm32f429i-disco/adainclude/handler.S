## -*- asm -*- ##############################################################
#                                                                           #
#                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                  #
#                                                                           #
#                               H A N D L E R                               #
#                                                                           #
#                               Assembly File                               #
#                                                                           #
#                      Copyright (C) 2012-2013 AdaCore                      #
#                                                                           #
#  GNAT is free software;  you can  redistribute it  and/or modify it under #
#  terms of the  GNU General Public License as published  by the Free Soft- #
#  ware  Foundation;  either version 3,  or (at your option) any later ver- #
#  sion.  GNAT is distributed in the hope that it will be useful, but WITH- #
#  OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY #
#  or FITNESS FOR A PARTICULAR PURPOSE.                                     #
#                                                                           #
#  As a special exception under Section 7 of GPL version 3, you are granted #
#  additional permissions described in the GCC Runtime Library Exception,   #
#  version 3.1, as published by the Free Software Foundation.               #
#                                                                           #
#  You should have received a copy of the GNU General Public License and    #
#  a copy of the GCC Runtime Library Exception along with this program;     #
#  see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    #
#  <http://www.gnu.org/licenses/>.                                          #
#                                                                           #
#############################################################################

	.syntax unified
	.cpu cortex-m4
	.thumb

	/* Vector table installed by the ravenscar runtime. According to
	   the arm v7m manual (B1.5.3 The vector table):

	   The Vector table must be naturally aligned to a power of two whose
	   alignment value is greater than or equal to (Number of Exceptions
	   supported x 4), with a minimum alignment of 128 bytes.

	   There are 98 entries, and as 98 * 4 = 392 the table should be
	   aligned to 512 = 2 ** 9.

	   ??? Because of this alignment constraint, we should avoid the
	   hole in memory before this table. */

	.section .vectors,"a"
	.globl	__vectors
	.p2align 9
__vectors:
	.word   0                    /* stack top address */
	.word   fault                /* 1 Reset.  */
	.word   fault                /* 2 NMI.  */
	.word   fault	             /* 3 Hard fault. */
	.word   fault                /* 4 Mem manage.  */
	.word   fault                /* 5 Bus fault.  */
	.word   fault                /* 6 Usage fault.  */
	.word   fault                /* 7 reserved.  */
	.word   fault                /* 8 reserved.  */
	.word   fault                /* 9 reserved.  */
	.word   fault                /* 10 reserved.  */
	.word   __gnat_sv_call_trap  /* 11 SVCall.  */
	.word   fault                /* 12 Reserved for Debug.  */
	.word   fault                /* 13 Reserved.  */
	.word   __gnat_pend_sv_trap  /* 14 PendSV.  */
	.word   __gnat_sys_tick_trap /* 15 Systick.  */
	.word   __gnat_irq_trap      /* 16 IRQ0.  */
	.word   __gnat_irq_trap      /* 17 IRQ1.  */
	.word   __gnat_irq_trap      /* 18 IRQ2.  */
	.word   __gnat_irq_trap      /* 19 IRQ3.  */
	.word   __gnat_irq_trap      /* 20 IRQ4.  */
	.word   __gnat_irq_trap      /* 21 IRQ5.  */
	.word   __gnat_irq_trap      /* 22 IRQ6.  */
	.word   __gnat_irq_trap      /* 23 IRQ7.  */
	.word   __gnat_irq_trap      /* 24 IRQ8.  */
	.word   __gnat_irq_trap      /* 25 IRQ9.  */
	.word   __gnat_irq_trap      /* 26 IRQ10.  */
	.word   __gnat_irq_trap      /* 27 IRQ11.  */
	.word   __gnat_irq_trap      /* 28 IRQ12.  */
	.word   __gnat_irq_trap      /* 29 IRQ13.  */
	.word   __gnat_irq_trap      /* 30 IRQ14.  */
	.word   __gnat_irq_trap      /* 31 IRQ15.  */
	.word   __gnat_irq_trap      /* 32 IRQ16.  */
	.word   __gnat_irq_trap      /* 33 IRQ17.  */
	.word   __gnat_irq_trap      /* 34 IRQ18.  */
	.word   __gnat_irq_trap      /* 35 IRQ19.  */
	.word   __gnat_irq_trap      /* 36 IRQ20.  */
	.word   __gnat_irq_trap      /* 37 IRQ21.  */
	.word   __gnat_irq_trap      /* 38 IRQ22.  */
	.word   __gnat_irq_trap      /* 39 IRQ23.  */
	.word   __gnat_irq_trap      /* 40 IRQ24.  */
	.word   __gnat_irq_trap      /* 41 IRQ25.  */
	.word   __gnat_irq_trap      /* 42 IRQ26.  */
	.word   __gnat_irq_trap      /* 43 IRQ27.  */
	.word   __gnat_irq_trap      /* 44 IRQ28.  */
	.word   __gnat_irq_trap      /* 45 IRQ29.  */
	.word   __gnat_irq_trap      /* 46 IRQ30.  */
	.word   __gnat_irq_trap      /* 47 IRQ31.  */
	.word   __gnat_irq_trap      /* 48 IRQ32.  */
	.word   __gnat_irq_trap      /* 49 IRQ33.  */
	.word   __gnat_irq_trap      /* 50 IRQ34.  */
	.word   __gnat_irq_trap      /* 51 IRQ35.  */
	.word   __gnat_irq_trap      /* 52 IRQ36.  */
	.word   __gnat_irq_trap      /* 53 IRQ37.  */
	.word   __gnat_irq_trap      /* 54 IRQ38.  */
	.word   __gnat_irq_trap      /* 55 IRQ39.  */
	.word   __gnat_irq_trap      /* 56 IRQ40.  */
	.word   __gnat_irq_trap      /* 57 IRQ41.  */
	.word   __gnat_irq_trap      /* 58 IRQ42.  */
	.word   __gnat_irq_trap      /* 59 IRQ43.  */
	.word   __gnat_irq_trap      /* 60 IRQ44.  */
	.word   __gnat_irq_trap      /* 61 IRQ45.  */
	.word   __gnat_irq_trap      /* 62 IRQ46.  */
	.word   __gnat_irq_trap      /* 63 IRQ47.  */
	.word   __gnat_irq_trap      /* 64 IRQ48.  */
	.word   __gnat_irq_trap      /* 65 IRQ49.  */
	.word   __gnat_irq_trap      /* 66 IRQ50.  */
	.word   __gnat_irq_trap      /* 67 IRQ51.  */
	.word   __gnat_irq_trap      /* 68 IRQ52.  */
	.word   __gnat_irq_trap      /* 69 IRQ53.  */
	.word   __gnat_irq_trap      /* 70 IRQ54.  */
	.word   __gnat_irq_trap      /* 71 IRQ55.  */
	.word   __gnat_irq_trap      /* 72 IRQ56.  */
	.word   __gnat_irq_trap      /* 73 IRQ57.  */
	.word   __gnat_irq_trap      /* 74 IRQ58.  */
	.word   __gnat_irq_trap      /* 75 IRQ59.  */
	.word   __gnat_irq_trap      /* 76 IRQ60.  */
	.word   __gnat_irq_trap      /* 77 IRQ61.  */
	.word   __gnat_irq_trap      /* 78 IRQ62.  */
	.word   __gnat_irq_trap      /* 79 IRQ63.  */
	.word   __gnat_irq_trap      /* 80 IRQ64.  */
	.word   __gnat_irq_trap      /* 81 IRQ65.  */
	.word   __gnat_irq_trap      /* 82 IRQ66.  */
	.word   __gnat_irq_trap      /* 83 IRQ67.  */
	.word   __gnat_irq_trap      /* 84 IRQ68.  */
	.word   __gnat_irq_trap      /* 85 IRQ69.  */
	.word   __gnat_irq_trap      /* 86 IRQ70.  */
	.word   __gnat_irq_trap      /* 87 IRQ71.  */
	.word   __gnat_irq_trap      /* 88 IRQ72.  */
	.word   __gnat_irq_trap      /* 89 IRQ73.  */
	.word   __gnat_irq_trap      /* 90 IRQ74.  */
	.word   __gnat_irq_trap      /* 91 IRQ75.  */
	.word   __gnat_irq_trap      /* 92 IRQ76.  */
	.word   __gnat_irq_trap      /* 93 IRQ77.  */
	.word   __gnat_irq_trap      /* 94 IRQ78.  */
	.word   __gnat_irq_trap      /* 95 IRQ79.  */
	.word   __gnat_irq_trap      /* 96 IRQ80.  */
	.word   __gnat_irq_trap      /* 97 IRQ81.  */

	.text

.weak __gnat_irq_trap
.type __gnat_irq_trap, %function
__gnat_irq_trap:
0:	b	0b

	.size __gnat_irq_trap, . - __gnat_irq_trap
  
	.thumb_func
.weak ____gnat_sv_call_trap
.type __gnat_sv_call_trap, %function
__gnat_sv_call_trap:
0:	b	0b
	.size	__gnat_sv_call_trap, . - __gnat_sv_call_trap
  
	.thumb_func
.weak __gnat_pend_sv_trap
.type __gnat_pend_sv_trap, %function
__gnat_pend_sv_trap:
0:	b	0b
	.size	__gnat_pend_sv_trap, . - __gnat_pend_sv_trap

.weak __gnat_sys_tick_trap
.type __gnat_sys_tick_trap, %function
__gnat_sys_tick_trap:

	.thumb_func
fault:	b	fault
