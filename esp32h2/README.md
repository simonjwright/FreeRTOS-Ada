This is an Ada Runtime System (RTS) for the GCC Ada compiler (GNAT), targeted to the [ESP32 H2 board](https://www.espressif.com/sites/default/files/documentation/esp32-h2_datasheet_en.pdf).

The RTS supports Ravenscar tasking. Package `System` contains the following additional restrictions:

```
pragma Restrictions (No_Exception_Propagation);
pragma Restrictions (No_Exception_Registration);
pragma Restrictions (No_Finalization);
```

The RTS is intended to support commercial binary distributions. The Ada source code has either been derived from FSF GCC (4.9.1 or later) or written for this work; see the files COPYING3 and COPYING.RUNTIME.

The RTS is based on [FreeRTOS](http://www.freertos.org). See COPYING.FreeRTOS.

Board support (spec files only) is generated using svd2ada from the ESP32 H2 SVD. See COPYING.Atmel.

The following non-original files don't form part of a binary deliverable, so don't affect the status of the binary:

* `build_runtime.gpr` and `runtime.xml` originated in AdaCore's GNAT GPL 2014 arm-eabi distribution (for Linux).

* The linker scripts `esp32h2-flash.ld`, `esp32h2-ram.ld` are under an MIT licence: see COPYING.MIT.
