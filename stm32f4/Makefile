# Copyright (C) 2016-2024 Free Software Foundation, Inc.
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
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING3. If not, see
# <http://www.gnu.org/licenses/>.

SVD2ADA = ../svd2ada

all: build

build: stm32f40x force
	gprbuild -p -P build_runtime.gpr

stm32f40x: svd2ada-stamp
	$(SVD2ADA)/bin/svd2ada			\
	  --output=stm32f40x			\
	  --no-vfa-on-types			\
	$(SVD2ADA)/CMSIS-SVD/ST/STM32F40x.svd

svd2ada-stamp:
	cd $(SVD2ADA); alr build
	touch $@

install: all
	gprinstall -p -P build_runtime.gpr -f

clean:
	-gprclean -P build_runtime.gpr
	rm -rf stm32f40x

.PHONY: all force install clean
