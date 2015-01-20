package System.Interrupts is

   Default_Interrupt_Priority : constant System.Interrupt_Priority :=
     System.Interrupt_Priority'Last;
   --  Used (via rtsfind) when Interrupt_Priority isn't specified for
   --  a PO. This can only happen if the pragma form is used.

   type Interrupt_ID is range 0 .. 90;
   --  Has to match Ada.Interrupts.Interrupt_ID.

   subtype System_Interrupt_ID is Interrupt_ID;
   --  This synonym is introduced so that the type is accessible through
   --  rtsfind, otherwise the name clashes with its homonym in Ada.Interrupts.
   --
   --  i.e. this is necessary to support compiler mechanisms.

   type Parameterless_Handler is access protected procedure;
   --  This is actually a fat pointer, containing (a) the address of
   --  the protected object, (b) access to a wrapper procedure
   --  handlerP which takes the PO as an in out parameter and performs
   --  the locking, operation (in handlerN), and servicing.

   type New_Handler_Item is record
      Interrupt : Interrupt_ID;
      Handler   : Parameterless_Handler;
   end record;
   --  Contains all the information from an Attach_Handler pragma

   type New_Handler_Array is array (Positive range <>) of New_Handler_Item;
   --  All the handlers to be registered for one PO.

   procedure Install_Restricted_Handlers
     (Prio     : Any_Priority;
      Handlers : New_Handler_Array);
   --  Install the static Handlers for the given interrupts and do not
   --  store previously installed handlers. This procedure is used when
   --  the Ravenscar restrictions are in place since in that case there
   --  are only library-level protected handlers that will be installed
   --  at initialization and never be replaced.

end System.Interrupts;
