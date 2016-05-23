# Copyright (C) 2016 Free Software Foundation, Inc.
#
# This file is part of the Cortex GNAT RTS package.
#
# The Cortex GNAT RTS package is free software; you can redistribute
# it and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation; either version
# 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; see the file COPYING3.  If not, see
#  <http://www.gnu.org/licenses/>.

all::

include Makefile.inc

OPTFLAGS ?= -Og
DEBFLAGS = -g

CC = $(TARGET)-gcc
CFLAGS = -c $(TARGET_OPTS) $(OPTFLAGS) $(DEBFLAGS) $(INCLUDES) $(DEFINES)

AS = $(TARGET)-gcc
ASFLAGS = -c $(TARGET_OPTS) $(OPTFLAGS) $(DEBFLAGS)

AR = $(TARGET)-ar
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

# Add stack overflow checking hook (in src/, already on VPATH)
C_SOURCES += vApplicationStackOverflowHook.c

# Set up the C/ASM target object files, in the OBJ directory
OBJ := .build-c
BARE_OBJS := $(patsubst %.c,%.o,$(C_SOURCES)) $(patsubst %.s,%.o,$(S_SOURCES))
OBJECTS := $(patsubst %,$(OBJ)/%,$(BARE_OBJS))

$(OBJ):
	mkdir $(OBJ)

$(OBJ)/%.o: %.c
	$(CC) $(CFLAGS) $< -o $@
$(OBJ)/%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

all:: adalib/libbsp-rtos.a

adalib/libbsp-rtos.a:: $(OBJ)
adalib/libbsp-rtos.a:: $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

clean::
	-rm -f *~ *.orig adalib/libbsp-rtos.a
	-rm -rf $(OBJ)

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
	  -XTARGET=$(TARGET)			\
	  -XTARGET_OPTS="$(TARGET_OPTS)"	\
	  -XBUILD=$(build)			\
	  -XINCLUDES="$(INCLUDES)"

clean::
	-gprclean -P build_runtime.gpr
	-rm adalib/libgnat.a adalib/*.ali
	-rm -rf .build

.PHONY: all clean force
