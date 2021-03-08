This is an Ada Runtime System (RTS) for the GCC Ada compiler (GNAT), targeted to the [BBC micro:bit board](http://microbit.org/).

The RTS supports Ravenscar tasking. Package System contains the following additional restrictions:

*  `pragma Restrictions (No_Exception_Propagation);`
*  `pragma Restrictions (No_Finalization);`

Aside from the limitations imposed by the small RAM size of the micro:bit (16K), the system clock runs at 100 Hz rather than the 1000 Hz used in the other RTSs in this family.

The RTS is intended to support commercial binary distributions. The Ada source code has either been derived from FSF GCC (4.9.1, in some cases later) or written for this work; see the files `COPYING3` and `COPYING.RUNTIME`.

The RTS is based on [FreeRTOS]( http://www.freertos.org). See `COPYING.FreeRTOS`.

Board support (spec files only) was generated using [svd2ada](https://github.com/AdaCore/svd2ada) at commit `861c829` from the Nordic SVD. See `COPYING.Nordic`.

The following non-original files don't form part of a binary deliverable, so don't affect the status of the binary:

* `build_runtime.gpr` and `runtime.xml` originated in AdaCore's GNAT GPL 2014 arm-eabi distribution (for Linux).
* The linker script `nrf51.ld` is under an MIT licence: see COPYING.MIT.
