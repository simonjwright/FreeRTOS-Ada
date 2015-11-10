include ../stm32f429i-disco-rtos/Makefile.inc

all: testbed.bin

testbed: force
	gprbuild -p -P testbed
clean::
	gprclean -P testbed

clean::
	-rm *~ *.ali *.o *.bin
	-rm -rf .build

.PHONY: all clean force
