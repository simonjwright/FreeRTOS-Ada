--  Copyright (C) Simon Wright <simon@pushface.org>

--  This unit is free software; you can redistribute it and/or modify it
--  as you wish. This unit is distributed in the hope that it will be
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Real_Time;
with Ada.Unchecked_Deallocation;
package body Finalizing is

   Finalize_Called : Boolean := False;

   type F_P is access F;
   procedure Delete
     is new Ada.Unchecked_Deallocation (F, F_P);

   type F_Classwide_P is access F'Class;
   procedure Delete_Classwide
     is new Ada.Unchecked_Deallocation (F'Class, F_Classwide_P);

   task T;
   task body T is
      use type Ada.Real_Time.Time;
      An_F : constant F := (Ada.Finalization.Controlled with V => 42);
   begin
      loop
         begin
            declare
               Another_F : F := (Ada.Finalization.Controlled with V => 0);
            begin
               Finalize_Called := False;
               Another_F := An_F;
               pragma Assert (Another_F.V = 42, "wrong V");
            end;
            pragma Assert (Finalize_Called, "Finalize not called");
         end;
         declare
            Another_F_P : F_P :=
              new F'(Ada.Finalization.Controlled with V => 0);
         begin
            Finalize_Called := False;
            Another_F_P.all := An_F;
            pragma Assert (Another_F_P.V = 42, "wrong V");
            Delete (Another_F_P);
            pragma Assert (Finalize_Called, "Finalize not called");
         end;
         declare
            Another_F_Classwide_P : F_Classwide_P :=
              new F'(Ada.Finalization.Controlled with V => 0);
         begin
            Finalize_Called := False;
            Another_F_Classwide_P.all := F'Class (An_F);
            pragma Assert (Another_F_Classwide_P.V = 42, "wrong V");
            Delete_Classwide (Another_F_Classwide_P);
            pragma Assert (Finalize_Called, "Finalize not called");
         end;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Seconds (2);
      end loop;
   end T;

   procedure Adjust (Obj : in out F) is
   begin
      null;
   end Adjust;

   procedure Finalize (Obj : in out F) is
      pragma Unreferenced (Obj);
   begin
      Finalize_Called := True;
   end Finalize;

end Finalizing;
