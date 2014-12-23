pragma Warnings (Off);

package body System.Tasking.Protected_Objects.Single_Entry is

   procedure Initialize_Protection_Entry
     (Object            : Protection_Entry_Access;
      Ceiling_Priority  : Integer;
      Compiler_Info     : System.Address;
      Entry_Body        : Entry_Body_Access) is
   begin
      null;
   end Initialize_Protection_Entry;

   procedure Lock_Entry (Object : Protection_Entry_Access) is
   begin
      null;
   end Lock_Entry;

   procedure Service_Entry (Object : Protection_Entry_Access) is
   begin
      null;
   end Service_Entry;

end System.Tasking.Protected_Objects.Single_Entry;
