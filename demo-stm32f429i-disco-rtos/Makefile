all::

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

demo_tasking: force
	gprbuild -p -P $@ -largs $(LDFLAGS)
all:: demo_tasking.bin

demo_cmsis: force
	gprbuild -p -P $@ -largs $(LDFLAGS)
all:: demo_cmsis.bin

lcd:force
	gprbuild -p -P $@ -largs $(LDFLAGS)
all:: lcd.bin

main: main.o
	$(CC) $(DEBUG) $^ -o $@			\
	  $(LIBS) $(LDFLAGS)			\
	  -Wl,-T,$(LDC) -Wl,-Map,$@.map
main.c: main.h
all:: main.bin

#%.bin: %
#	arm-eabi-objcopy -O binary $< $@

clean:
	rm -f main
	rm -f *~ *.bin *.o
	gprclean -P demo_tasking
	gprclean -P demo_cmsis

.PHONY: clean force
