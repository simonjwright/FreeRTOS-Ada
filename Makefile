# This file is part of the FreeRTOS-Ada package.
#
# Copyright (C) 2016-2024 Free Software Foundation, Inc.
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
# along with this program; see the file COPYING3.  If not, see
# <http://www.gnu.org/licenses/>.

first:
	@echo "\t'make all' to build the runtimes,"
	@echo "\t'make install' to install the runtimes."

runtimes = arduino-due microbit stm32f4 stm32f429i

all install clean:
	for f in $(runtimes); do		\
	  make -w -C $$f $@;			\
	done

.PHONY: first all clean install
