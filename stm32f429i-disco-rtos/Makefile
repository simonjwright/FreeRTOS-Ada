all::

STM32CUBE = $(HOME)/STM32Cube_FW_F4_V1.3.0

include Makefile.inc

OPTFLAGS ?= -Og
DEBFLAGS = -g

CC = arm-eabi-gcc
CFLAGS = -c $(OPTFLAGS) $(DEBFLAGS) $(INCLUDES) $(DEFINES)

AS = arm-eabi-gcc
ASFLAGS = -c $(OPTFLAGS) $(DEBFLAGS)

AR = arm-eabi-ar
ARFLAGS = -r -s

BSP_SRC   = $(STM32CUBE)/Drivers/BSP/STM32F429I-Discovery
CMSIS_SRC = src
HAL_SRC   = $(STM32CUBE)/Drivers/STM32F4xx_HAL_Driver/Src

# All the sources except MemMang, where there are alternative
# implementations and we can only choose 1. Note the :=, to force
# ordering.
VPATH := $(BSP_SRC) $(BSP_COMPONENTS) $(CMSIS_SRC) $(HAL_SRC)
VPATH += $(FREERTOS) $(FREERTOS)/CMSIS_RTOS $(FREERTOS)/portable/GCC/ARM_CM4F

C_SOURCES := $(notdir $(wildcard $(patsubst %,%/*.c,$(VPATH))))
S_SOURCES := $(notdir $(wildcard $(patsubst %,%/*.s,$(VPATH))))

# Choose the memory manager implementation.
C_SOURCES += heap_4.c
# Now update the VPATH so we can find the source of the memory manager.
VPATH += $(FREERTOS)/portable/MemMang

OBJECTS := $(patsubst %.c,%.o,$(C_SOURCES)) $(patsubst %.s,%.o,$(S_SOURCES))

all:: adalib/libbsp-rtos.a

adalib/libbsp-rtos.a: $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

clean::
	-rm *~ *.orig *.o adalib/libbsp-rtos.a

all:: adalib/libgnat.a

ifeq ($(OPTFLAGS),-O0)
else ifeq ($(OPTFLAGS),-Og)
  build := Debug
else
  build := Production
endif

adalib/libgnat.a: force
	gprbuild -p				\
	  -P build_runtime.gpr			\
	  -XBUILD=$(build)			\
	  -XINCLUDES="$(INCLUDES)"

clean::
	-gprclean -P build_runtime.gpr
	-rm adalib/libgnat.a adalib/*.ali
	-rm -rf .build

.PHONY: all clean force
