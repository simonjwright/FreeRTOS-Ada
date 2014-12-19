// Copyright Simon Wright <simon@pushface.org>
//
// This package is free software; you can redistribute it and/or
// modify it under terms of the GNU General Public License as
// published by the Free Software Foundation; either version 3, or (at
// your option) any later version.  It is distributed in the hope that
// it will be useful, but WITHOUT ANY WARRANTY; without even the
// implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE.
//
// As a special exception under Section 7 of GPL version 3, you are
// granted additional permissions described in the GCC Runtime Library
// Exception, version 3.1, as published by the Free Software
// Foundation.
//
// You should have received a copy of the GNU General Public License
// and a copy of the GCC Runtime Library Exception along with this
// program; see the files COPYING3 and COPYING.RUNTIME respectively.
// If not, see <http://www.gnu.org/licenses/>.

// System calls for newlib.
//
// _getpid() returns 1.
// _isatty() returns 0.
// All others return -1.
// _read() and _write() with a negative file descriptor set errno to EINVAL.
// _sbrk() sets errno to ENOMEM.
// In all other cases, errno is set to ENOTSUP (not supported).

#include <sys/stat.h>
#include <errno.h>
#include <sys/times.h>

int _getpid(void)
{
  return 1;
}

int _kill(int pid, int sig)
{
  errno = ENOTSUP;
  return -1;
}

void _exit (int status)
{
  _kill(status, -1);
  while (1) {}
}

int _read (int file, char *ptr, int len)
{
  errno = file < 0 ? EINVAL : ENOTSUP;
  return -1;
}

int _write(int file, char *ptr, int len)
{
  errno = file < 0 ? EINVAL : ENOTSUP;
  return -1;
}

caddr_t _sbrk(int incr)
{
  errno = ENOMEM;
  return (caddr_t)-1;
}

int _close(int file)
{
  errno = ENOTSUP;
  return -1;
}


int _fstat(int file, struct stat *st)
{
  errno = ENOTSUP;
  return -1;
}

int _isatty(int file)
{
  return 0;
}

int _lseek(int file, int ptr, int dir)
{
  errno = ENOTSUP;
  return -1;
}

int _open(char *path, int flags, ...)
{
  errno = ENOTSUP;
  return -1;
}

int _wait(int *status)
{
  errno = ENOTSUP;
  return -1;
}

int _unlink(char *name)
{
  errno = ENOTSUP;
  return -1;
}

int _times(struct tms *buf)
{
  errno = ENOTSUP;
  return -1;
}

int _stat(char *file, struct stat *st)
{
  errno = ENOTSUP;
  return -1;
}

int _link(char *old, char *new)
{
  errno = ENOTSUP;
  return -1;
}

int _fork(void)
{
  errno = ENOTSUP;
  return -1;
}

int _execve(char *name, char **argv, char **env)
{
  errno = ENOTSUP;
  return -1;
}
