# -*- Makefile -*-

STM32CUBE ?= $(HOME)/STM32Cube_FW_F4_V1.7.0

# Work out the location of this file (the top level of rtos),
# without the trailing /. Must be before other includes.
RTOS := $(shell echo $(dir $(abspath $(lastword $(MAKEFILE_LIST)))) \
	| sed -e "s;/$$;;")
BSP := $(RTOS)

# Target-related; arm-eabi is AdaCore's setting, the rest are
# Cortex-M4 as in STM32F4 boards.
TARGET ?= arm-eabi
TARGET_OPTS ?= -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16

# STM32F429I-Disco specific

# for CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h
DEFINES = -DSTM32F429xx=1 -DUSE_HAL_DRIVER=1
# for stm32f4xx_hal_conf.h, stm32f429i-disco
DEFINES += -DHSE_VALUE=8000000 -DLSI_VALUE=40000

STM32INCLUDES = $(STM32CUBE)/Drivers/BSP/STM32F429I-Discovery

# BSP Components, except Common, contain headers and source.
# Gyroscope.
BSP_COMPONENTS =  $(STM32CUBE)/Drivers/BSP/Components/l3gd20
# LCD
BSP_COMPONENTS += $(STM32CUBE)/Drivers/BSP/Components/ili9341
# Touchscreen
BSP_COMPONENTS += $(STM32CUBE)/Drivers/BSP/Components/stmpe811

# Everything below here should be common.

# Various definitions of STM32F4/FreeRTOS locations in
# the STM32CUBE firmware support package.

STM32INCLUDES += 						\
  $(STM32CUBE)/Drivers/CMSIS/Device/ST/STM32F4xx/Include	\
  $(STM32CUBE)/Drivers/CMSIS/Include				\
  $(STM32CUBE)/Drivers/STM32F4xx_HAL_Driver/Inc

# BSP Common
BSP_COMPONENTS_INCLUDES = $(BSP_COMPONENTS) 	\
  $(STM32CUBE)/Drivers/BSP/Components/Common

STM32INCLUDES += $(BSP_COMPONENTS_INCLUDES)

# FreeRTOS
FREERTOS = $(STM32CUBE)/Middlewares/Third_Party/FreeRTOS/Source

FREERTOSINCLUDES = $(FREERTOS)/CMSIS_RTOS \
  $(FREERTOS)/include \
  $(FREERTOS)/portable/GCC/ARM_CM4F

INCLUDES = $(patsubst %,-I%,$(STM32INCLUDES) $(FREERTOSINCLUDES) $(BSP)/include)

# Generally useful target for creating a binary image downloadable
# with st-flash.
%.bin: %
	$(TARGET)-objcopy -O binary $^ $@
