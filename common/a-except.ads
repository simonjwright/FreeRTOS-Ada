--  Copyright (C) 2016 Free Software Foundation, Inc.
--
--  This specification is derived from the Ada Reference Manual for
--  use with GNAT. The copyright notice above, and the license
--  provisions that follow apply solely to the contents of the part
--  following the private keyword.
--
--  This file is free software; you can redistribute it and/or modify
--  it under terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3, or (at your
--  option) any later version. This file is distributed in the hope
--  that it will be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
--  PURPOSE.
--
--  As a special exception under Section 7 of GPL version 3, you are
--  granted additional permissions described in the GCC Runtime
--  Library Exception, version 3.1, as published by the Free Software
--  Foundation.
--
--  You should have received a copy of the GNU General Public License
--  and a copy of the GCC Runtime Library Exception along with this
--  program; see the files COPYING3 and COPYING.RUNTIME respectively.
--  If not, see <http://www.gnu.org/licenses/>.

pragma Restrictions (No_Elaboration_Code);

package Ada.Exceptions is
   pragma Preelaborate;

   type Exception_Id is private
   with
     Preelaborable_Initialization;

   Null_Id : constant Exception_Id;

   procedure Raise_Exception (E : Exception_Id; Message : String := "")
   with
     No_Return;

private

   type Exception_Id is new Integer;
   Null_Id : constant Exception_Id := -1;

end Ada.Exceptions;
