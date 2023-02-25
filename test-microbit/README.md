# micro:bit tests and demos #

There are four programs built by `make` (or `gprbuild`, but `make` goes on to build hex files that can be dropped onto the micro:bit):

* `circle` displays a circle running round the LEDs: pressing button A alters the speed, button B alters the direction (clockwise/anticlockwise). The buttons are interrupt-driven.

* `events` demonstrates `Timing_Events`. The top-left LED (row 1, column 1) flashes every 2 seconds, the LED in row 4, column 5 flashes every 5 seconds. _Why not the bottom right LED? because of the complicated mapping of GPIOs to LEDS_.

* `seconds` checks out `Clock` functionality by flashing the centre LED once a second. You get to time a number of flashes with a stopwatch to make sure it really is once a second.

* `accelerometer` displays a single LED: if the card is level, in the centre; as the card is tilted, the lit LED moves to the lowest edge.

The tests interact with the micro:bit hardware using the [Ada\_Drivers\_Library](https://github.com/AdaCore/Ada_Drivers_Library). Configure it using that library's `project_wizard.py`:
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
? 11
For key 'Architecture', take value 'ARM' from board definition
For key 'Vendor', take value 'Nordic' from board definition
For key 'Device_Family', take value 'nRF51' from board definition
For key 'Device_Name', take value 'nRF51822xxAA' from board definition
For key 'Number_Of_Interrupts', take value '32' from MCU definition
For key 'Has_ZFP_Runtime', take value 'True' from board definition
For key 'Has_Ravenscar_SFP_Runtime', take value 'False' from board definition
For key 'Has_Ravenscar_Full_Runtime', take value 'False' from board definition
Runtime_Profile
 - (0) zfp
?
For key 'Runtime_Name_Suffix', take value 'cortex-m0' from board definition
Runtime_Name [default: 'zfp-cortex-m0']
? ../../../local/microbit
Use_Startup_Gen [y/N]

Boot_Memory [default: 'flash']
?
Max_Path_Length [default: 1024]

Max_Mount_Points [default: 2]

Max_Mount_Name_Length [default: 128]

The configuration is now finished.
Let's generate some files:
 -> Writing gprbuild project file.
 -> Writing the Ada configuration file.
Your Ada Drivers Library project is now ready to use.
```
After selecting the `MicroBit`, the default (RET) is OK for most answers. The only odd one is that for `Runtime_Name`; the output files are created in the directory `Ada_Drivers_Library`, so the generated `ada_drivers_library.gpr` is one level down, and to select the locally-installed runtime you have to go up three levels and down 2.
