all:

include ../stm32f429i-disco-rtos/Makefile.inc

# Definitions for C, C++
INCLUDES += -I$(STM32CUBE)/Projects/STM32F429I-Discovery/Examples/BSP/Inc
DEBUG = -g -O0
CC = arm-eabi-gcc
CXX = arm-eabi-g++
CFLAGS = $(INCLUDES) $(DEFINES) $(DEBUG) $(EXTRA_CFLAGS)
CXXFLAGS = $(INCLUDES) $(DEFINES) $(DEBUG) $(EXTRA_CFLAGS)
LIBS    = -L$(BSP)/adalib -lbsp-rtos
LDC     = stm32f429i-flash.ld

# Definitions for all links
LDFLAGS = -Wl,-v
LDFLAGS += -nostdlib
LDFLAGS += -nodefaultlibs

# Omitted eeprom.c
# Omitted log.c, $(STM32CUBE)/Utilities/Log/lcd_log.c (because stdio)
MAIN_SRC =					\
  main.c

MAIN_OBJ = \
  $(addsuffix .o,$(basename $(MAIN_SRC)))

main: $(MAIN_OBJ)
	$(CC) $(DEBUG) $^ -o $@			\
	  $(LIBS) $(LDFLAGS)			\
	  -Wl,-T,$(LDC) -Wl,-Map,$@.map
main.c: main.h

demo_cmsis: force
	gprbuild -p -P $@ -largs $(LDFLAGS)

demo_tasking: force
	gprbuild -p -P $@ -largs $(LDFLAGS)

%.bin: %
	arm-eabi-objcopy -O binary $< $@

clean:
	rm -f main
	rm -f *~ *.bin *.o
	gprclean -P demo_cmsis
	gprclean -P demo_tasking

.PHONY: clean force
