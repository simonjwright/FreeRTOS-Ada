gnat-stm32f429i-disco
=====================

Portage of Ada run-time library from STM32F4DISCOVERY to 32F429IDISCOVERY.


Abstract
--------
The GNAT Ada GPL 2014 is provided with an ARM cross compiler. The toolchain is delivered with an Ada runtime library and examples for "STM32F4 Discovery" kit. This project ports the provided Ada runtime library for the "STM32F429I Discovery" kit. It contains the modified Ada runtime library and the associated "demo_leds" project.


Description
-----------
The repository contains the original Ada runtime profile (ravenscar-sfp-stm32f4) and "demo_leds" example (demo_leds-stm32f4). These directory are originally located in "<GNATPATH>/lib/gnat/arm-eabi/" and "<GNATPATH>/share/examples/gnat-cross/" of NAT Ada GPL 2014 for ARM ELF. The fork of these directories are respectively "ravenscar-sfp-stm32f429i-disco" and "demo_leds-stm32f429i-disco".

You have to built the provided Ada runtime library:
- Enter the Ada runtime library directory.
- Create the "obj" directory.
- Start the build process by launching the command "gprbuild".

The "demo_leds" example was modified due to the hardware differences. The STM32F4DISCOVERY board contains 4 LEDs which was successively lighted. The USER button allowed to change the direction of the light. Because the 32F429IDISCOVERY board has only 2 LEDs, the previous example was not visually observable. As a consequence the USER button function was changed to modify the period of the blinking instead of the direction of the light.
Notice the "obj" directory must be also created and the the RTS path in gpr project file updated.


The GNAT Ada GPL 2014 for ARM ELF format is available at http://libre.adacore.com.
