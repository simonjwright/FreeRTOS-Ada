# Copyright (C) 2016-2024 Free Software Foundation, Inc.
#
# This file is part of the FreeRTOS-Ada package.
#
# The FreeRTOS-Ada package is free software; you can redistribute
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

build: esp32h2_svd force
	gprbuild -p -P build_runtime.gpr -XARCH=riscv

# SVD2Ada generates peripheral definitions and interrupt names. It
# also generates an assembler file to handle the interrupts - but
# assuming the machine is a Cortex-M.
esp32h2_svd: svd/esp32h2.svd
	rm -rf $@
	$(SVD2ADA)				\
	  --output=$@				\
	  --package=ESP32_H2			\
	  --gen-interrupts			\
	  $<
	rm $@/handler.S

install: all
	gprinstall -p -P build_runtime.gpr -f

clean:
	-gprclean -P build_runtime.gpr
	rm -rf esp32h2_svd

.PHONY: all force install clean
