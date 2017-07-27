# This file is part of the Cortex GNAT RTS package.
#
# Copyright (C) 2016 Free Software Foundation, Inc.
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
# along with this program; see the file COPYING3.  If not, see
# <http://www.gnu.org/licenses/>.

first:
	@echo "\t'make all' to build the runtimes,"
	@echo "\t'make dist' to build a distribution package."

runtimes = arduino-due stm32f4 stm32f429i

all:
	for f in $(runtimes); do		\
	  make -w -C $$f;				\
	done

# Distributions

NAME ?= cortex-gnat-rts

TOP_LEVEL_FILES = INSTALL README FreeRTOS.gpr

subdirs =					\
  common					\
  test-common

subdirs +=					\
  arduino-due					\
  test-arduino-due

subdirs +=					\
  stm32f4					\
  test-stm32f4

subdirs +=					\
  stm32f429i					\
  test-stm32f429i

# Used to construct release IDs (eg, $(NAME)-20100731). You can
# set the whole thing from the command line -- for example, if
# creating a patch release.
DATE = $(shell date +%Y%m%d)

dist:: $(NAME)-$(DATE).tar.gz

$(NAME)-$(DATE).tar.gz: $(NAME)-$(DATE)
	rm -f $@
	tar zcvf $@ $</

$(NAME)-$(DATE): force
	rm -rf $@
	mkdir $@
	cp $(TOP_LEVEL_FILES) $@/
	for sub in $(subdirs); do				\
	  make -C $$sub -f Makefile.dist dist DIST=$(PWD)/$@;	\
	done

.PHONY: first all dist force
