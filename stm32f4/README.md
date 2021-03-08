This is an Ada Runtime System (RTS) for the GCC Ada compiler (GNAT), targeted to the STMicroelectronics [STM32F4 Discovery board](https://uk.farnell.com/stmicroelectronics/stm32f407g-disc1/dev-board-foundation-line-mcu/dp/2506840).

The RTS supports Ravenscar tasking. Package System contains the following additional restrictions:

* `pragma Restrictions (No_Exception_Propagation);`
* `pragma Restrictions (No_Finalization);`

The RTS is intended to support commercial binary distributions. The Ada source code has either been derived from FSF GCC (4.9.1 or later) or written for this work; see the files COPYING3 and COPYING.RUNTIME.

The RTS is based on [FreeRTOS](http://www.freertos.org). See COPYING.FreeRTOS.

Board support (spec files only) was generated using [svd2ada](https://github.com/AdaCore/svd2ada).

The following non-original files don't form part of a binary deliverable, so don't affect the status of the binary:

* `build_runtime.gpr` and `runtime.xml` originated in AdaCore's GNAT GPL 2014 arm-eabi distribution (for Linux).

* The linker script `stm32f407-flash.ld` is under an MIT licence: see COPYING.MIT.
