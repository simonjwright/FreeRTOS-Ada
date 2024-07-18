/* The MIT License
 *
 * Copyright (c) 2007, 2008, 2009, 2010 Dado Sutter and Bogdan Marinescu
 * Copyright (c) 2012-2024 Simon Wright <simon@pushface.org>
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * Originally copied from https://github.com/\
 * jsnyder/elua/blob/bikeNomad-master/src/platform/stm32f4/stm32.ld
 *
 * Additions from https://github.com/espressif/esp32c3-direct-boot-example/\
 * tree/main/ld/esp32h2 for esp32-h2.
 */

/*
 * The following symbols are exported for use by the program startup code:
 *
 * _start_flash_data: where rw data to be copied to sram starts in flash
 * _start_sram_data:  where rw data is to be copied to in sram
 * _end_sram_data:    first free location after rw data in sram
 * _start_bss:        where to start initializing bss to zero
 * _end_bss:          first free location after bss
 * _end_stack:        first free location after stack
 */

/* Entry Point */
ENTRY(program_entry)

/* Force linking of syscalls.o. The reason this is needed is that the
   symbols in it are only referenced later on in the linking order
   (from libc.a, typically). */
EXTERN(_sbrk)

/* For the same reason, force linking of _init.o (in case the
   application has failed to provide a real _init; _init.o contains a
   weak version). */
EXTERN(_init)

INCLUDE memory.ld

SECTIONS
{
    /*
     * See information on the "direct boot" feature:
     * https://github.com/espressif/esp32c3-direct-boot-example/blob/main/\
     * README.md.
     */

/*
    .header :
    {
        _rom_start = .;
        LONG(0xaedb041d)
        LONG(0xaedb041d)
    } >flash

    .text.entry ORIGIN(flash) + 8 :
    {
        KEEP(*(.program_entry))
    } >flash
*/

    .text.entry ORIGIN(sram) :
    {
        KEEP(*(.program_entry))
    } >sram

    .text :
    {
        . = ALIGN(4);
        *(.text)
        *(.text.*)
        *(.gnu.linkonce.t.*)
        *(.glue_7)
        *(.glue_7t)
        *(.gcc_except_table)
        *(.gnu.linkonce.r.*)
        *(.eh_frame)
        KEEP(*(.init))
        KEEP(*(.fini))
        . = ALIGN(4);
        _etext = .;
    } >sram

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata.*)
        *(.srodata)
        *(.srodata.*)
        . = ALIGN(4);
    } >sram

    .init_array :
    {
        PROVIDE(__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array*))             /* why the final *? */
        PROVIDE(__init_array_end = .);
    } >sram

    .fini_array :
    {
        PROVIDE(__fini_array_start = .);
        KEEP(*(SORT(.fini_array.*)))
        KEEP(*(.fini_array*))             /* why the final *? */
        PROVIDE(__fini_array_end = .);
    } >sram

    /* Where .data starts in sram */
    _start_flash_data = LOADADDR(.data);

    /* Initialized data copied from "flash" to sram at startup */
    .data :
    {
        . = ALIGN(4);
        _start_sram_data = .;
        *(.sdata)
        *(.sdata.*)
        *(.gnu.linkonce.s.*)
        *(.data)
        *(.data.*)
        *(.gnu.linkonce.d.*)
        . = ALIGN(4);
        _end_sram_data = .;
    } >sram /* AT>flash */

    .bss (NOLOAD) : {
	. = ALIGN(4);
        /* This is used by the startup in order to initialize the .bss secion */
        _start_bss = .;
        *(.dynsbss)
        *(.sbss)
        *(.sbss.*)
        *(.gnu.linkonce.sb.*)
        *(.scommon)
        *(.bss)
        *(.bss.*)
        *(.gnu.linkonce.b.*)
        *(COMMON)
        . = ALIGN(4);
        _end_bss = .;
    } >sram

    /* end = .; */

    /* Top of stack for main and (after main finishes) interrupts. */
    PROVIDE(__freertos_irq_stack_top =  ORIGIN(sram) + LENGTH(sram));

    /* Top of stack for tasks. Reserves 1k for interrupt stack.
     * THIS IS NOT FINAL.
     *
     * DO NOT define configISR_STACK_SIZE_WORDS in FreeRTOSConfig.h. */
    PROVIDE(_end_stack = __freertos_irq_stack_top - 1K);

    /* This is to do with riscv 'relax' processing.
     * See https://github.com/espressif/esp32c3-direct-boot-example/blob/\
     * main/ld/esp32h2/common.ld for more (inscrutable) suggestions. */
    __global_pointer$ = _start_sram_data + 0x800;

    /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }

}
