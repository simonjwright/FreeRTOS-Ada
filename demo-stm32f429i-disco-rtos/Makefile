# Copyright Simon Wright <simon@pushface.org>
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

all::

include ../stm32f429i-disco-rtos/Makefile.inc

# Definitions for C, C++
INCLUDES += -I$(STM32CUBE)/Projects/STM32F429I-Discovery/Examples/BSP/Inc
DEBUG     = -g -O0
CFLAGS    = $(INCLUDES) $(DEFINES) $(DEBUG) $(EXTRA_CFLAGS) $(TARGET_OPTS)
CXXFLAGS  = $(INCLUDES) $(DEFINES) $(DEBUG) $(EXTRA_CFLAGS) $(TARGET_OPTS)

demo_tasking: force
	gprbuild -p -P $@ -largs $(LDFLAGS)
all:: demo_tasking.bin

demo_cmsis: force
	gprbuild -p -P $@ -largs $(LDFLAGS)
all:: demo_cmsis.bin

lcd: force
	gprbuild -p -P $@ -largs $(LDFLAGS)
all:: lcd.bin

main: force
	gprbuild -p -P $@			\
	  -XCFLAGS="$(CFLAGS)"			\
	  -XLDFLAGS="$(LDFLAGS)"
all:: main.bin

clean:
	rm -f main
	rm -f *~ *.bin *.o
	-gprclean -P demo_tasking
	-gprclean -P demo_cmsis
	-gprclean -P main
	rm -rf .build*

.PHONY: clean force
