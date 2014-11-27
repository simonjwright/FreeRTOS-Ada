/* The MIT License
 *
 * Copyright (c) 2007, 2008, 2009, 2010 Dado Sutter and Bogdan Marinescu
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

MEMORY
{
    sram (W!RX) : ORIGIN = 0x20000000, LENGTH = 128K
    CCMRAM (xrw) : ORIGIN = 0x10000000, LENGTH = 64K
    flash (RX) : ORIGIN = 0x08000000, LENGTH = 1024K
}

SECTIONS
{
    .text :
    {
        . = ALIGN(4);
        _text = .;
        PROVIDE(stext = .);
        KEEP(*(.isr_vector))
        *(.text .text.*)
        *(.rodata .rodata.*)
        *(.gnu.linkonce.t.*)
        *(.glue_7)
        *(.glue_7t)
        *(.gcc_except_table)
        *(.gnu.linkonce.r.*)
        . = ALIGN(4);
        _etext = .;
		_sidata = _etext;
        PROVIDE(etext = .);
     		_fini = . ;
				*(.fini)

    } >flash

    .data : AT (_etext)
    {
        . = ALIGN(4);
        _sdata = .;
        *(.ramfunc .ramfunc.* .fastrun .fastrun.*)
        *(.data .data.*)
        *(.gnu.linkonce.d.*)
        . = ALIGN(4);
        _edata = .;
    } >sram

		.ARM.extab :
		{
		    *(.ARM.extab*)
		} >sram

		__exidx_start = .;
		.ARM.exidx :
		{
		    *(.ARM.exidx*)
		} >sram
		__exidx_end = .;

    PROVIDE( flash_used_size = SIZEOF(.text) + SIZEOF(.data) + SIZEOF(.ARM.extab) + SIZEOF(.ARM.exidx) );

    .bss (NOLOAD) : {
		. = ALIGN(4);
        /* This is used by the startup in order to initialize the .bss secion */
        _sbss = .;
        *(.bss .bss.*)
        *(.gnu.linkonce.b.*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } >sram

    end = .;
    PROVIDE( _estack = 0x20020000 );
}
