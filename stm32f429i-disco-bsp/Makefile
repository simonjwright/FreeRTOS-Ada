all::

include ../stm32f429i-disco-rtos/Makefile.inc

all:: adalib/libstm32f429i-disco-bsp.a

adalib/libstm32f429i-disco-bsp.a: adainclude/stm32f429xx_h.ads force
	gprbuild -p -P stm32f429i_disco_bsp.gpr

adainclude/stm32f429xx_h.ads: transform.sed
	[ -d .build ] || mkdir .build
	(cd .build;							\
	 echo "#include <stm32f429xx.h>" >main.h;			\
	 arm-eabi-gcc -fdump-ada-spec -c $(INCLUDES) $(DEFINES) main.h;	\
	 sed -E -f ../transform.sed <$(notdir $@) >../$@)

clean::
	-gprclean -P stm32f429i_disco_bsp.gpr
	-rm -f adainclude/stm32f429xx_h.ads
	-rm -rf .build

.PHONY: all clean force
