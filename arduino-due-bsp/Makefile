all::

all:: adalib/libarduino-due-bsp.a

adalib/libarduino-due-bsp.a: force
	gprbuild -p -P arduino_due_bsp.gpr

clean::
	-gprclean -P arduino_due_bsp.gpr
	-rm -rf .build

.PHONY: all clean force
