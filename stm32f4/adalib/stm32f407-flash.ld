/* The MIT License
 *
 * Copyright (c) 2007, 2008, 2009, 2010 Dado Sutter and Bogdan Marinescu
 * Copyright (c) 2012-2020 Simon Wright <simon@pushface.org>
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
 */

/* Entry Point */
ENTRY(program_initialization)

/* Force linking of syscalls.o. The reason this is needed is that the
   symbols in it are only referenced later on in the linking order
   (from libc.a, typically). */
EXTERN(_sbrk)

/* For the same reason, force linking of _init.o (in case the
   application has failed to provide a real _init; _init.o contains a
   weak version). */
EXTERN(_init)

/* This is used in Certyflie to cause the crazyflie executable to load
   above the normal STM32F4 start address; the bootloader sits at the
   beginning of flash memory and the board always boots into it. It
   either loads a new crazyflie executable over the radio or executes
   an existing one.

   See https://wiki.bitcraze.io/doc:crazyflie:bootloader:protocol */

START_OFFSET = DEFINED (START_OFFSET) ? START_OFFSET : 0;

/* Pick up the interrupt vectors from interrupt_vectors.s */

MEMORY
{
    flash (RX)  : ORIGIN = 0x08000000 + START_OFFSET,
                  LENGTH = 1024K - START_OFFSET
    ccmram (rw) : ORIGIN = 0x10000000, LENGTH = 64K
    sram (RWX)  : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
    .text :
    {
        . = ALIGN(4);
        *(.isr_vector)
        . = ALIGN(512);

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
    } >flash

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
    } > flash

    .ARM.extab :
    {
        *(.ARM.extab*)
        *(.gnu.linkonce.armextab.*)
    } >flash

    .ARM.exidx :
    {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } >flash

    .init_array :
    {
        PROVIDE(__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array*))             /* why the final *? */
        PROVIDE(__init_array_end = .);
    } >flash

    .fini_array :
    {
        PROVIDE(__fini_array_start = .);
        KEEP(*(SORT(.fini_array.*)))
        KEEP(*(.fini_array*))             /* why the final *? */
        PROVIDE(__fini_array_end = .);
    } >flash

    /* Where .data will actually be loaded */
    _sidata = LOADADDR(.data);

    /* Initialized data copied from flash to sram at startup */
    .data :
    {
        . = ALIGN(4);
        _sdata = .;
        *(.ramfunc)
        *(.ramfunc.*)
        *(.fastrun)
        *(.fastrun.*)
        *(.data)
        *(.data.*)
        *(.gnu.linkonce.d.*)
        . = ALIGN(4);
        _edata = .;
    } >sram AT>flash

    .bss (NOLOAD) : {
	. = ALIGN(4);
        /* This is used by the startup in order to initialize the .bss secion */
        _sbss = .;
        __bss_start__ = _sbss;
        *(.bss)
        *(.bss.*)
        *(.gnu.linkonce.b.*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
        __bss_end__ = _ebss;
    } >sram

    end = .;
    PROVIDE( _estack = 0x20020000);

    /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }

}
