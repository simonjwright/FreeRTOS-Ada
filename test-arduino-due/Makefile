all:: testbed

programs = first testbed program

testbed: force
	gprbuild -p -P testbed.gpr

first: force
	gprbuild -p -P first.gpr

program: force
	gprbuild -p -P program.gpr

%.bin: %
	arm-eabi-objcopy -O binary $< $@

clean:
	for p in $(programs); do		\
	  (gprclean -P $$p || true); \
	done
	rm -f *.bin

.PHONY: all build clean force
