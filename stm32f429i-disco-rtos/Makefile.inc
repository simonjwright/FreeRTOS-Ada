# -*- Makefile -*-

# Various definitions of STM32F429I-Discovery/FreeRTOS locations in
# the STM32CUBE firmware support package.

# Work out the location of this file (the top level of rtos),
# without the trailing /. Must be before other includes.
RTOS := $(shell echo $(dir $(abspath $(lastword $(MAKEFILE_LIST)))) \
	| sed -e "s;/$$;;")
BSP := $(RTOS)

STM32CUBE ?= $(HOME)/STM32Cube_FW_F4_V1.3.0

STM32INCLUDES = $(STM32CUBE)/Drivers/BSP/STM32F429I-Discovery	\
  $(STM32CUBE)/Drivers/CMSIS/Device/ST/STM32F4xx/Include	\
  $(STM32CUBE)/Drivers/CMSIS/Include				\
  $(STM32CUBE)/Drivers/STM32F4xx_HAL_Driver/Inc

# Components, except Common, contain headers and source
# Gyroscope
BSP_COMPONENTS =  $(STM32CUBE)/Drivers/BSP/Components/l3gd20
# LCD
BSP_COMPONENTS += $(STM32CUBE)/Drivers/BSP/Components/ili9341
# Touchscreen
BSP_COMPONENTS += $(STM32CUBE)/Drivers/BSP/Components/stmpe811

# Common
BSP_COMPONENTS_INCLUDES = $(BSP_COMPONENTS) 	\
  $(STM32CUBE)/Drivers/BSP/Components/Common

STM32INCLUDES += $(BSP_COMPONENTS_INCLUDES)

FREERTOS = $(STM32CUBE)/Middlewares/Third_Party/FreeRTOS/Source

FREERTOSINCLUDES = $(FREERTOS)/CMSIS_RTOS \
  $(FREERTOS)/include \
  $(FREERTOS)/portable/GCC/ARM_CM4F

INCLUDES = $(patsubst %,-I%,$(STM32INCLUDES) $(FREERTOSINCLUDES) $(BSP)/include)

# for CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h
DEFINES = -DSTM32F429xx=1 -DUSE_HAL_DRIVER=1

# Generally useful target for creating a binary image downloadable
# with st-flash.
%.bin: %
	arm-eabi-objcopy -O binary $^ $@
