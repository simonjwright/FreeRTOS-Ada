package body System.Parameters is

   function Adjust_Storage_Size (Size : Size_Type) return Size_Type is
     (if Size = Unspecified_Size then
        Default_Stack_Size
      elsif Size < Minimum_Stack_Size then
        Minimum_Stack_Size
      else
        Size);

   function Default_Stack_Size return Size_Type is (256);

   function Minimum_Stack_Size return Size_Type is (128);

end System.Parameters;
