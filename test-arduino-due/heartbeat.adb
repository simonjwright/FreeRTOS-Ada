--  Copyright (C) 2016 Free Software Foundation, Inc.

--  This file is part of the Cortex GNAT RTS package.
--
--  The Cortex GNAT RTS package is free software; you can redistribute
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

with Ada.Interrupts.Names;
with Ada.Real_Time;
with ATSAM3X8E.PIO; use ATSAM3X8E.PIO;
with ATSAM3X8E.PMC; use ATSAM3X8E.PMC;

package body Heartbeat is

   --  The onboard LED is PB27.

   task Beat;
   task body Beat is
      use type Ada.Real_Time.Time;
   begin
      --  flash for 1 second at startup
      for J in 1 .. 5 loop
         PIOB_Periph.CODR := (As_Array => True, Arr => (27 => 1, others => 0));
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
         PIOB_Periph.SODR := (As_Array => True, Arr => (27 => 1, others => 0));
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end loop;

      --  flash every second while running
      loop
         PIOB_Periph.CODR := (As_Array => True, Arr => (27 => 1, others => 0));
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (900);
         PIOB_Periph.SODR := (As_Array => True, Arr => (27 => 1, others => 0));
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end loop;
   end Beat;

begin
   --  Enable PIOB
   PMC_Periph.PMC_PCER0 :=
     (PID =>
        (As_Array => True,
         Arr => (Ada.Interrupts.Names.PIOB_IRQ => 1, others => 0)),
      others => <>);
   --  Enable PB27 ..
   PIOB_Periph.PER := (As_Array => True, Arr => (27 => 1, others => 0));
   --  .. as output.
   PIOB_Periph.OER := (As_Array => True, Arr => (27 => 1, others => 0));
end Heartbeat;
