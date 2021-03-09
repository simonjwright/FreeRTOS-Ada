# STM32F4 tests and demos #

There are four programs built by `make` or `gprbuild`.

* `testbed` runs several tasks, each of which repeatedly tests a language or library feature:
  * Containers
  * Dispatching
  * Floating Point
  * `'Image`
  * Can build with `Interfaces.C.Strings`
  * Interrupts
  * Generalized iteration
  * `Ada.Numerics.Elementary_Functions`
  * Suspension Objects
  * Streams
  * Secondary Stack
* `action_after_delay` demonstrates that, given two tasks of the same priority, if one of them loops indefinitely without reaching a dispatching point, the other never runs
* `delay_in_po` demonstrates that it's illegal to execute a `delay` inside a protected subprogram
* `generate_hard_fault` demonstrates HardFault decoding

The tests interact with the STM32F4 hardware using the [Ada\_Drivers\_Library](https://github.com/AdaCore/Ada_Drivers_Library). Configure it using that library's `project_wizard.py`:
```
Welcome to the Ada Drivers Library (ADL) project wizard. This script will
ask you some questions to define the ADL configuration of your project. It will
then generate the different files required to use ADL based on this
configuration.
Board
 - (0) Custom_Board
 - (1) STM32F407_Discovery
 - (2) STM32F429_Discovery
 - (3) STM32F469_Discovery
 - (4) STM32F746_Discovery
 - (5) STM32F769_Discovery
 - (6) STM32_H405
 - (7) NUCLEO_F446ZE
 - (8) Crazyflie
 - (9) Feather_STM32F405
 - (10) OpenMV2
 - (11) MicroBit
 - (12) NRF52_DK
 - (13) HiFive1
 - (14) HiFive1_rev_B
 - (15) Unleashed
 - (16) Native
? 1
For key 'Architecture', take value 'ARM' from board definition
For key 'Vendor', take value 'STMicro' from board definition
For key 'Device_Family', take value 'STM32F4' from board definition
For key 'Device_Name', take value 'STM32F407VGTx' from board definition
For key 'High_Speed_External_Clock', take value '8000000' from board definition
Number_Of_Interrupts [default: 0]
82
For key 'Has_ZFP_Runtime', take value 'False' from board definition
For key 'Has_Ravenscar_SFP_Runtime', take value 'True' from board definition
For key 'Has_Ravenscar_Full_Runtime', take value 'True' from board definition
Runtime_Profile
 - (0) ravenscar-full
 - (1) ravenscar-sfp
? 0
For key 'Runtime_Name_Suffix', take value 'stm32f4' from board definition
Runtime_Name [default: 'ravenscar-full-stm32f4']
? ../../../local/stm32f4
Use_Startup_Gen [y/N]

Max_Path_Length [default: 1024]

Max_Mount_Points [default: 2]

Max_Mount_Name_Length [default: 128]

The configuration is now finished.
Let's generate some files:
 -> Writing gprbuild project file.
 -> Writing the Ada configuration file.
Your Ada Drivers Library project is now ready to use.
```
After selecting the `STM32F407_Discovery`, the default (RET) is OK for most answers. The only odd one is that for `Runtime_Name`; the output files are created in the directory `Ada_Drivers_Library`, so the generated `ada_drivers_library.gpr` is one level down, and to select the locally-installed runtime you have to go up three levels and down 2.
