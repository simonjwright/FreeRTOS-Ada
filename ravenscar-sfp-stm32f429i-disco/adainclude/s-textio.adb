------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                       S Y S T E M . T E X T _ I O                        --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--          Copyright (C) 1992-2013, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Minimal version of Text_IO body for use on STM32F4xxx, using USART1

with Interfaces; use Interfaces;

package body System.Text_IO is

   USART1_Base : constant := 16#4001_1000#;

   type USART_Registers is record
      SR         : Unsigned_16; -- USART Status register
      Reserved_0 : Unsigned_16;
      DR         : Unsigned_16; -- USART Data register
      Reserved_1 : Unsigned_16;
      BRR        : Unsigned_16; -- USART Baud rate register
      Reserved_2 : Unsigned_16;
      CR1        : Unsigned_16; -- USART Control register 1
      Reserved_3 : Unsigned_16;
      CR2        : Unsigned_16; -- USART Control register 2
      Reserved_4 : Unsigned_16;
      CR3        : Unsigned_16; -- USART Control register 3
      Reserved_5 : Unsigned_16;
      GTPR       : Unsigned_16; -- USART Guard time and prescaler register
      Reserved_6 : Unsigned_16;
   end record;

   USART1 : USART_Registers;
   for USART1'Address use USART1_Base;
   pragma Volatile (USART1);

   TX_Ready : constant := 2**6;
   RX_Ready : constant := 2**5;

   ---------
   -- Get --
   ---------

   function Get return Character is (Character'Val (USART1.DR and 16#FF#));

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Initialized := True;
   end Initialize;

   -----------------
   -- Is_Tx_Ready --
   -----------------

   function Is_Tx_Ready return Boolean is ((USART1.SR and TX_Ready) /= 0);

   -----------------
   -- Is_Rx_Ready --
   -----------------

   function Is_Rx_Ready return Boolean is ((USART1.SR and RX_Ready) /= 0);

   ---------
   -- Put --
   ---------

   procedure Put (C : Character) is
   begin
      USART1.DR := Character'Pos (C);
   end Put;

   ----------------------------
   -- Use_Cr_Lf_For_New_Line --
   ----------------------------

   function Use_Cr_Lf_For_New_Line return Boolean is (True);
end System.Text_IO;
