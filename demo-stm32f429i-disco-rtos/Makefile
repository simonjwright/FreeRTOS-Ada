all: demo_tasking.bin

include ../stm32f429i-disco-rtos/Makefile.inc

# Definitions for all links
LDFLAGS = -Wl,-v
LDFLAGS += -nostdlib
LDFLAGS += -nodefaultlibs

demo_tasking: force
	gprbuild -p -P $@ -largs $(LDFLAGS)

%.bin: %
	arm-eabi-objcopy -O binary $< $@

clean:
	rm -f main
	rm -f *~ *.bin *.o
	gprclean -P demo_tasking

.PHONY: clean force
