# -*- Makefile -*-

# Various definitions of STM32F429I-Discovery locations in the
# STM32CUBE firmware support package.

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

# Work out the location of this file (the top level of stm32f429i-disco-bsp),
# without the trailing /.
BSP := $(shell echo $(dir $(abspath $(lastword $(MAKEFILE_LIST)))) \
	| sed -e "s;/$$;;")

INCLUDES = $(patsubst %,-I%,$(STM32INCLUDES) $(BSP)/include)

# for CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h
DEFINES = -DSTM32F429xx=1 -DUSE_HAL_DRIVER=1

CC = arm-eabi-gcc
CFLAGS = -c -g -O0 $(INCLUDES) $(DEFINES)
