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

build: nrf51 force
	gprbuild -p -P build_runtime.gpr

nrf51: ../svd2ada/CMSIS-SVD/Nordic/nrf51.svd
	$(SVD2ADA)				\
	  --output=nrf51			\
	  $<
# would have liked to specify --no-vfa-on-types but this suppresses the use
# of arrays.

install: all
	gprinstall -p -P build_runtime.gpr -f

clean:
	-gprclean -P build_runtime.gpr
	rm -rf nrf51

.PHONY: all force install clean
