package System.Tasking.Protected_Objects is

   ----------------------------------------------------------------------------
   --                         copied from GCC 4.9.1                          --
   ----------------------------------------------------------------------------

   Null_Protected_Entry : constant := Null_Entry;

   Max_Protected_Entry : constant := Max_Entry;

   type Protected_Entry_Index is new Entry_Index
     range Null_Protected_Entry .. Max_Protected_Entry;

   type Barrier_Function_Pointer is access
     function
       (O    : System.Address;
        E    : Protected_Entry_Index)
        return Boolean;
   --  Pointer to a function which evaluates the barrier of a protected
   --  entry body. O is a pointer to the compiler-generated record
   --  representing the protected object, and E is the index of the
   --  entry serviced by the body.

   type Entry_Action_Pointer is access
     procedure
       (O : System.Address;
        P : System.Address;
        E : Protected_Entry_Index);
   --  Pointer to a procedure which executes the sequence of statements
   --  of a protected entry body. O is a pointer to the compiler-generated
   --  record representing the protected object, P is a pointer to the
   --  record of entry parameters, and E is the index of the
   --  entry serviced by the body.

   type Entry_Body is record
      Barrier : Barrier_Function_Pointer;
      Action  : Entry_Action_Pointer;
   end record;
   --  The compiler-generated code passes objects of this type to the GNARL
   --  to allow it to access the executable code of an entry body.

   type Entry_Body_Access is access all Entry_Body;

   ----------------------------------------------------------------------------
   --                    compiler interface for FreeRTOS                     --
   ----------------------------------------------------------------------------

end System.Tasking.Protected_Objects;
