/*
 * Copyright Simon Wright <simon@pushface.org>
 *
 * GNAT is free software; you can redistribute it and/or modify it
 * under terms of the GNU General Public License as published by the
 * Free Soft- ware Foundation; either version 3, or (at your option)
 * any later ver- sion.  GNAT is distributed in the hope that it will
 * be useful, but WITH- OUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * As a special exception under Section 7 of GPL version 3, you are
 * granted additional permissions described in the GCC Runtime Library
 * Exception, version 3.1, as published by the Free Software
 * Foundation.
 *
 * You should have received a copy of the GNU General Public License
 * and a copy of the GCC Runtime Library Exception along with this
 * program; see the files COPYING3 and COPYING.RUNTIME respectively.
 * If not, see <http://www.gnu.org/licenses/>.
 */

#ifdef __cplusplus
extern "C" {
#endif

/*
 * This is needed because it's called by newlib's __libc_init_array, in init.c.
 * A strong symbol will be provided in C++ code.
 */

__attribute__((weak)) void _init(void)
{
}

#ifdef __cplusplus
}
#endif
