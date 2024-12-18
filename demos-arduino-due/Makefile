# This file is part of the FreeRTOS-Ada package.
#
# Copyright (C) 2016 Free Software Foundation, Inc.
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
#  You should have received a copy of the GNU General Public License
#  along with this program; see the file COPYING3.  If not, see
#  <http://www.gnu.org/licenses/>.

all:: first

first: force
	gprbuild -p -P first.gpr

debounce: debounce_software debounce_hardware

debounce_software: force
	gprbuild -p -P debounce.gpr -XIMPL=software

debounce_hardware: force
	gprbuild -p -P debounce.gpr -XIMPL=hardware

%.bin: %
	arm-eabi-objcopy -O binary $< $@

clean:
	-gprclean -P first
	-gprclean -P debounce -XIMPL=software
	-gprclean -P debounce -XIMPL=hardware
	rm -f *.bin

.PHONY: all build clean force
