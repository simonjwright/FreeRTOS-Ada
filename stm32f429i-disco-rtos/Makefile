all::

STM32CUBE = $(HOME)/STM32Cube_FW_F4_V1.3.0

include Makefile.inc

OPTFLAGS = -O0
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

VPATH = $(BSP_SRC) $(BSP_COMPONENTS) $(CMSIS_SRC) $(HAL_SRC)

BSP_SOURCES =  $(notdir $(wildcard $(BSP_SRC)/*.c))
BSP_SOURCES += $(notdir $(wildcard $(patsubst %,%/*.c,$(BSP_COMPONENTS))))
BSP_OBJECTS =  $(patsubst %.c,%.o,$(notdir $(BSP_SOURCES)))
bsp-stamp: $(BSP_OBJECTS)
	touch $@

CMSIS_C_SOURCES = $(notdir $(wildcard $(CMSIS_SRC)/*.c))
CMSIS_S_SOURCES = $(notdir $(wildcard $(CMSIS_SRC)/*.s))
CMSIS_OBJECTS = $(patsubst %.c,%.o,$(notdir $(CMSIS_C_SOURCES))) \
                $(patsubst %.s,%.o,$(notdir $(CMSIS_S_SOURCES)))
cmsis-stamp: $(CMSIS_OBJECTS)
	touch $@

HAL_SOURCES = $(notdir $(wildcard $(HAL_SRC)/*.c))
HAL_OBJECTS = $(patsubst %.c,%.o,$(notdir $(HAL_SOURCES)))
hal-stamp: $(HAL_OBJECTS)
	touch $@

all:: adalib/libbsp.a

adalib/libbsp.a: $(BSP_OBJECTS) $(CMSIS_OBJECTS) $(HAL_OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

clean::
	-rm -f *~ *-stamp *.o adalib/libbsp.a

all:: adalib/libgnat.a

ifeq ($(OPTFLAGS),-O0)
  build := Debug
else
  build := Production
endif

adalib/libgnat.a: force
	gprbuild -p -P build_runtime.gpr -XBUILD=$(build)

clean::
	-gprclean -P build_runtime.gpr

.PHONY: all clean force
