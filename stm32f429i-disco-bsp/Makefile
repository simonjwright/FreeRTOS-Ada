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
