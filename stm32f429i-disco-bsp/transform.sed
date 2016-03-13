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

# This sed script processes the raw output of arm-eabi-gcc
# -fdump-ada-spec run on STMicroelectronics' Cube headers into
# something more useful; especially, turns most "unsupported macros"
# into appropriate Ada code.

# Named untyped constants are used (using types proved difficult):
# this means that the C "|" operator has been translated as "+", which
# isn't really appropriate but will most likely work, and "<< n" and
# ">> n" are translated as "* 2 ** n" and "/ 2 ** n" respectively.

# Ada 2012
s/pragma Ada_2005/pragma Ada_2012/

# Don't need stdint.h
/with (sys_u)?stdint_h;/d

# Need to 'use' stm32f429xx_h
s/with stm32f429xx_h;/with stm32f429xx_h; use stm32f429xx_h;/

# Don't understand when 'limited with' is used but it's wrong
s/limited with/with/

# stm32f429xx_h needs System.Storage_Elements
/package stm32f429xx_h/ {
i\
with System.Storage_Elements; use System.Storage_Elements;
}

# Other packages need stm32f429xx_h
/package/ {
s/stm32f429xx_h/stm32f429xx_h/
t done
i\
with stm32f429xx_h; use stm32f429xx_h;
:done
}

# Don't need trailing (line-reference) comments (very noisy);
# Mac OS X-specific
s/  -- \/Users.*//

# Out-of-order alias definitions in stm32f429xx.h
/FSMC_IRQn/d
/FSMC_IRQHandler/d

# NULL
/NULL/d

# Remove typecasts
s/\(uint(8|16|32|64)_t[ ]*\)//g

# Pipe (assuming no bit overlap)
s/[ ]*\|[ ]*/ + /g

# Shift left
s/[ ]*<<[ ]*([0-9]+)/ * 2 ** \1/g

# Shift right
s/[ ]*>>[ ]*([0-9]+)/ \/ 2 ** \1/g

# Hex constants
s/0x([a-fA-F0-9]+)U?/16#\1#/g

# Make all records volatile
s/end record/end record with Volatile/

# Aliased objects of a type (to hold space)
/--  unsupported macro: ([a-zA-Z0-9_]+) \(\(([a-zA-Z0-9_]+TypeDef) \*\)[ ]*([a-zA-Z0-9_]+)\)/ {
s/--  unsupported macro: ([a-zA-Z0-9_]+) \(\(([a-zA-Z0-9_]+TypeDef) \*\)[ ]*([a-zA-Z0-9_]+)\)/\1 : aliased \2\
     with Import,\
     Convention => Ada,\
     Address => To_Address (\3);/
H
d
}
# Aliased objects inserted at package end
/^end/ {
x
p
x
}

# Typedefs that are type renamings
s/--  unsupported macro: ([a-zA-Z0-9_]+_TypeDef) ([a-zA-Z0-9_]+_TypeDef)/subtype \1 is \2;/

# Constants defined as names
s/--  unsupported macro: ([a-zA-Z0-9_]+) ([a-zA-Z][a-zA-Z0-9_]*)/\1 : constant := \2;/

# Remaining constants
s/--  unsupported macro: ([a-zA-Z0-9_]+) ([^U]*)U?/\1 : constant := \2;/

# Unsigned types in parameters/record components
s/(sys_u)?stdint_h.uint(8|16|32|64)_t/Interfaces.Unsigned_\2/g

# Case collision in stm32f4xx_ll_fmc_h.ads
s/(FMC_NAND_ECC_(DIS|EN)ABLE)/\1_C/
