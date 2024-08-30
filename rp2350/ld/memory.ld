/*
 * The memory layout for a Pico 2.
 */

/*
 * See https://petewarden.com/2024/01/16/understanding-the-raspberry-pi-picos-memory-layout/
 */

MEMORY
{
    flash (RX)  : ORIGIN = 0x10000000, LENGTH = 0x400000 /* 4096K */
    sram (RW)   : ORIGIN = 0x20000000, LENGTH = 0x82000  /* 520K */
}
