--  Copyright (C) 2016-2024 Free Software Foundation, Inc.
--
--  This file is part of the FreeRTOS-Ada package.
--
--  The FreeRTOS-Ada package is free software; you can redistribute
--  it and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; see the file COPYING3.  If not, see
--  <http://www.gnu.org/licenses/>.

with Interfaces.C.Strings;

procedure Last_Chance_Handler
  (Message : Interfaces.C.Strings.chars_ptr; Line : Integer) with
    Preelaborate  => True,
    Export        => True,
    Convention    => C,
    External_Name => "__gnat_last_chance_handler";
