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

SVD2ADA = ~/.alire/bin/svd2ada
# alr get svd2ada; cd svd2ada*; alr build; alr install

all: build

build: stm32f429x force
	gprbuild -p -P build_runtime.gpr

stm32f429x: ../svd2ada//CMSIS-SVD/ST/STM32F429x.svd
	$(SVD2ADA)				\
	  --output=stm32f429x			\
	  --no-vfa-on-types			\
	  $<

svd2ada-stamp:
	cd $(SVD2ADA); alr build
	touch $@

install: all
	gprinstall -p -P build_runtime.gpr -f

clean:
	-gprclean -P build_runtime.gpr

.PHONY: all force install clean
