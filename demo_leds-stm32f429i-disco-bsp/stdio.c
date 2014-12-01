/*
 * Check that we can still link if we include stdio.h.
 * Actual I/O isn't supported (yet).
 */

#include <stdio.h>

static int foo = 42;
static char foos[50];

void do_foo(int n) {
  snprintf(foos, 50, "foo is %d", n);
}
