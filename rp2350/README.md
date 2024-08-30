This is an Ada Runtime System (RTS) for the GCC Ada compiler (GNAT), targeted to the [RP2350](https://datasheets.raspberrypi.com/rp2350/rp2350-datasheet.pdf) running a single RISC-V core.

The RTS supports Ravenscar tasking. Package `System` contains the following additional restrictions:

```
pragma Restrictions (No_Exception_Propagation);
pragma Restrictions (No_Exception_Registration);
pragma Restrictions (No_Finalization);
```

The RTS is intended to support commercial binary distributions. The Ada source code has either been derived from FSF GCC (4.9.1 or later) or written for this work; see the files COPYING3 and COPYING.RUNTIME.

The RTS is based on [FreeRTOS](http://www.freertos.org). See COPYING.FreeRTOS.

Board support (spec files only) is generated using svd2ada from the [RP2350 SVD generated for Rust](https://github.com/rp-rs/rp235x-pac/tree/main/svd) at commit `42b279c`. See COPYING.RaspberryPi.

The following non-original files don't form part of a binary deliverable, so don't affect the status of the binary:

* `build_runtime.gpr` and `runtime.xml` originated in AdaCore's GNAT GPL 2014 arm-eabi distribution (for Linux).

* The linker scripts `rp2350-flash.ld`, `rp2350-ram.ld` are under an MIT licence: see COPYING.MIT.
