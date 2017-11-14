//  Copyright (C) 2017 Free Software Foundation, Inc.

//  This file is part of the Cortex GNAT RTS package.
//
//  The Cortex GNAT RTS package is free software; you can redistribute
//  it and/or modify it under the terms of the GNU General Public
//  License as published by the Free Software Foundation; either
//  version 3 of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//  General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; see the file COPYING3.  If not, see
//  <http://www.gnu.org/licenses/>.

//  The purpose of this is to actually perform a division even if rho
//  is 0, so that a HardFault will occur (if enabled, of course)

int div(int lho, int rho)
{
    return lho/rho;
}
