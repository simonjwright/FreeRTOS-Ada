#  This package is free software; you can redistribute it and/or
#  modify it under terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 3, or
#  (at your option) any later version.  It is distributed in the
#  hope that it will be useful, but WITHOUT ANY WARRANTY; without
#  even the implied warranty of MERCHANTABILITY or FITNESS FOR A
#  PARTICULAR PURPOSE.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; see the file COPYING3.  If not, see
#  <http://www.gnu.org/licenses/>.
#
#  Copyright Simon Wright <simon@pushface.org>

all: ; $(error This makefile is only for building distributions,	\
	("make dist"))

NAME ?= stm32f4-gnat-rts

# Note the order, which is necssary.
subdirs :=					\
  stm32f429i-disco-rtos				\
  stm32f429i-disco-bsp				\
  demo-stm32f429i-disco-rtos

TOP_LEVEL_FILES = INSTALL README

dist::

# Used to construct release IDs (eg, $(NAME)-20100731). You can
# set the whole thing from the command line -- for example, if
# creating a patch release.
DATE = $(shell date +%Y%m%d)

dist:: $(NAME)-$(DATE).tar.gz

$(NAME)-$(DATE).tar.gz: $(NAME)-$(DATE)
	rm -f $@
	tar zcvf $@ $</

$(NAME)-$(DATE):
	rm -rf $@
	mkdir $@
	cp INSTALL $@/
	cp README-for-distribution $@/README
	for sub in $(subdirs); do				\
	  make -C $$sub -f Makefile.dist dist DIST=$(PWD)/$@;	\
	done

.PHONY: all dist
