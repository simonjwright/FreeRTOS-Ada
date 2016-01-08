// Copyright (C) 2016 Free Software Foundation, Inc.
//
// GNAT is free software;  you can  redistribute it  and/or modify it under
// terms of the  GNU General Public License as published  by the Free Soft-
// ware  Foundation;  either version 3,  or (at your option) any later ver-
// sion.  GNAT is distributed in the hope that it will be useful, but WITH-
// OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.
//
// As a special exception under Section 7 of GPL version 3, you are granted
// additional permissions described in the GCC Runtime Library Exception,
// version 3.1, as published by the Free Software Foundation.
//
// You should have received a copy of the GNU General Public License and
// a copy of the GCC Runtime Library Exception along with this program;
// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
// <http://www.gnu.org/licenses/>.
//
// This version of last_chance_handler is written in C, because that
// is the interface expected by a-except.adb; and we can do nothing
// but loop.
//
// Note, the function name is exported as a weak symbol, so you can
// write your own version, in Ada if you like, perhaps to output the
// exception message to LCD.

#include <FreeRTOS.h>
#include <task.h>

__attribute__((weak))
void __gnat_last_chance_handler(const char *message, int line) {
  taskDISABLE_INTERRUPTS();
  vTaskSuspendAll();
  // Loop indefinitely: use the debugger to examine the backtrace.
  while (1) {}
}
