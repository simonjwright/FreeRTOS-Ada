/*
 * The memory layout for an ESP32-H2.
 */

MEMORY
{
    flash (RX)  : ORIGIN = 0x42000000, LENGTH = 0x400000 /* 4096K */
    sram (RW)   : ORIGIN = 0x40800000, LENGTH = 0x40000  /* 256K */
}
