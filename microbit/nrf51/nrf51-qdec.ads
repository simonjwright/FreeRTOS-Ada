--  This spec has been automatically generated from nrf51.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package nrf51.QDEC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ---------------------
   -- SHORTS_Register --
   ---------------------

   --  Shortcut between REPORTRDY event and READCLRACC task.
   type REPORTRDY_READCLRACC_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for REPORTRDY_READCLRACC_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcut between SAMPLERDY event and STOP task.
   type SAMPLERDY_STOP_Field is
     (
      --  Shortcut disabled.
      Disabled,
      --  Shortcut enabled.
      Enabled)
     with Size => 1;
   for SAMPLERDY_STOP_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Shortcuts for the QDEC.
   type SHORTS_Register is record
      --  Shortcut between REPORTRDY event and READCLRACC task.
      REPORTRDY_READCLRACC : REPORTRDY_READCLRACC_Field := Disabled;
      --  Shortcut between SAMPLERDY event and STOP task.
      SAMPLERDY_STOP       : SAMPLERDY_STOP_Field := Disabled;
      --  unspecified
      Reserved_2_31        : nrf51.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHORTS_Register use record
      REPORTRDY_READCLRACC at 0 range 0 .. 0;
      SAMPLERDY_STOP       at 0 range 1 .. 1;
      Reserved_2_31        at 0 range 2 .. 31;
   end record;

   -----------------------
   -- INTENSET_Register --
   -----------------------

   --  Enable interrupt on SAMPLERDY event.
   type SAMPLERDY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for SAMPLERDY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on SAMPLERDY event.
   type SAMPLERDY_Field_1 is
     (
      --  Reset value for the field
      Samplerdy_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for SAMPLERDY_Field_1 use
     (Samplerdy_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on REPORTRDY event.
   type REPORTRDY_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for REPORTRDY_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on REPORTRDY event.
   type REPORTRDY_Field_1 is
     (
      --  Reset value for the field
      Reportrdy_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for REPORTRDY_Field_1 use
     (Reportrdy_Field_Reset => 0,
      Set => 1);

   --  Enable interrupt on ACCOF event.
   type ACCOF_Field is
     (
      --  Interrupt disabled.
      Disabled,
      --  Interrupt enabled.
      Enabled)
     with Size => 1;
   for ACCOF_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable interrupt on ACCOF event.
   type ACCOF_Field_1 is
     (
      --  Reset value for the field
      Accof_Field_Reset,
      --  Enable interrupt on write.
      Set)
     with Size => 1;
   for ACCOF_Field_1 use
     (Accof_Field_Reset => 0,
      Set => 1);

   --  Interrupt enable set register.
   type INTENSET_Register is record
      --  Enable interrupt on SAMPLERDY event.
      SAMPLERDY     : SAMPLERDY_Field_1 := Samplerdy_Field_Reset;
      --  Enable interrupt on REPORTRDY event.
      REPORTRDY     : REPORTRDY_Field_1 := Reportrdy_Field_Reset;
      --  Enable interrupt on ACCOF event.
      ACCOF         : ACCOF_Field_1 := Accof_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENSET_Register use record
      SAMPLERDY     at 0 range 0 .. 0;
      REPORTRDY     at 0 range 1 .. 1;
      ACCOF         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------------
   -- INTENCLR_Register --
   -----------------------

   --  Disable interrupt on SAMPLERDY event.
   type SAMPLERDY_Field_2 is
     (
      --  Reset value for the field
      Samplerdy_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for SAMPLERDY_Field_2 use
     (Samplerdy_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on REPORTRDY event.
   type REPORTRDY_Field_2 is
     (
      --  Reset value for the field
      Reportrdy_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for REPORTRDY_Field_2 use
     (Reportrdy_Field_Reset => 0,
      Clear => 1);

   --  Disable interrupt on ACCOF event.
   type ACCOF_Field_2 is
     (
      --  Reset value for the field
      Accof_Field_Reset,
      --  Disable interrupt on write.
      Clear)
     with Size => 1;
   for ACCOF_Field_2 use
     (Accof_Field_Reset => 0,
      Clear => 1);

   --  Interrupt enable clear register.
   type INTENCLR_Register is record
      --  Disable interrupt on SAMPLERDY event.
      SAMPLERDY     : SAMPLERDY_Field_2 := Samplerdy_Field_Reset;
      --  Disable interrupt on REPORTRDY event.
      REPORTRDY     : REPORTRDY_Field_2 := Reportrdy_Field_Reset;
      --  Disable interrupt on ACCOF event.
      ACCOF         : ACCOF_Field_2 := Accof_Field_Reset;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INTENCLR_Register use record
      SAMPLERDY     at 0 range 0 .. 0;
      REPORTRDY     at 0 range 1 .. 1;
      ACCOF         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ---------------------
   -- ENABLE_Register --
   ---------------------

   --  Enable or disable QDEC.
   type ENABLE_Field is
     (
      --  Disabled QDEC.
      Disabled,
      --  Enable QDEC.
      Enabled)
     with Size => 1;
   for ENABLE_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable the QDEC.
   type ENABLE_Register is record
      --  Enable or disable QDEC.
      ENABLE        : ENABLE_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ENABLE_Register use record
      ENABLE        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- LEDPOL_Register --
   ---------------------

   --  LED output pin polarity.
   type LEDPOL_Field is
     (
      --  LED output is active low.
      Activelow,
      --  LED output is active high.
      Activehigh)
     with Size => 1;
   for LEDPOL_Field use
     (Activelow => 0,
      Activehigh => 1);

   --  LED output pin polarity.
   type LEDPOL_Register is record
      --  LED output pin polarity.
      LEDPOL        : LEDPOL_Field := Activelow;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LEDPOL_Register use record
      LEDPOL        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ------------------------
   -- SAMPLEPER_Register --
   ------------------------

   --  Sample period.
   type SAMPLEPER_Field is
     (
      --  128us sample period.
      SAMPLEPER_Field_128US,
      --  256us sample period.
      SAMPLEPER_Field_256US,
      --  512us sample period.
      SAMPLEPER_Field_512US,
      --  1024us sample period.
      SAMPLEPER_Field_1024US,
      --  2048us sample period.
      SAMPLEPER_Field_2048US,
      --  4096us sample period.
      SAMPLEPER_Field_4096US,
      --  8192us sample period.
      SAMPLEPER_Field_8192US,
      --  16384us sample period.
      SAMPLEPER_Field_16384US)
     with Size => 3;
   for SAMPLEPER_Field use
     (SAMPLEPER_Field_128US => 0,
      SAMPLEPER_Field_256US => 1,
      SAMPLEPER_Field_512US => 2,
      SAMPLEPER_Field_1024US => 3,
      SAMPLEPER_Field_2048US => 4,
      SAMPLEPER_Field_4096US => 5,
      SAMPLEPER_Field_8192US => 6,
      SAMPLEPER_Field_16384US => 7);

   --  Sample period.
   type SAMPLEPER_Register is record
      --  Sample period.
      SAMPLEPER     : SAMPLEPER_Field := SAMPLEPER_Field_128US;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SAMPLEPER_Register use record
      SAMPLEPER     at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------------
   -- REPORTPER_Register --
   ------------------------

   --  Number of samples to generate an EVENT_REPORTRDY.
   type REPORTPER_Field is
     (
      --  10 samples per report.
      REPORTPER_Field_10Smpl,
      --  40 samples per report.
      REPORTPER_Field_40Smpl,
      --  80 samples per report.
      REPORTPER_Field_80Smpl,
      --  120 samples per report.
      REPORTPER_Field_120Smpl,
      --  160 samples per report.
      REPORTPER_Field_160Smpl,
      --  200 samples per report.
      REPORTPER_Field_200Smpl,
      --  240 samples per report.
      REPORTPER_Field_240Smpl,
      --  280 samples per report.
      REPORTPER_Field_280Smpl)
     with Size => 3;
   for REPORTPER_Field use
     (REPORTPER_Field_10Smpl => 0,
      REPORTPER_Field_40Smpl => 1,
      REPORTPER_Field_80Smpl => 2,
      REPORTPER_Field_120Smpl => 3,
      REPORTPER_Field_160Smpl => 4,
      REPORTPER_Field_200Smpl => 5,
      REPORTPER_Field_240Smpl => 6,
      REPORTPER_Field_280Smpl => 7);

   --  Number of samples to generate an EVENT_REPORTRDY.
   type REPORTPER_Register is record
      --  Number of samples to generate an EVENT_REPORTRDY.
      REPORTPER     : REPORTPER_Field := REPORTPER_Field_10Smpl;
      --  unspecified
      Reserved_3_31 : nrf51.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for REPORTPER_Register use record
      REPORTPER     at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --------------------
   -- DBFEN_Register --
   --------------------

   --  Enable debounce input filters.
   type DBFEN_Field is
     (
      --  Debounce input filters disabled.
      Disabled,
      --  Debounce input filters enabled.
      Enabled)
     with Size => 1;
   for DBFEN_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Enable debouncer input filters.
   type DBFEN_Register is record
      --  Enable debounce input filters.
      DBFEN         : DBFEN_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBFEN_Register use record
      DBFEN         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   ---------------------
   -- LEDPRE_Register --
   ---------------------

   subtype LEDPRE_LEDPRE_Field is nrf51.UInt9;

   --  Time LED is switched ON before the sample.
   type LEDPRE_Register is record
      --  Period in us the LED in switched on prior to sampling.
      LEDPRE        : LEDPRE_LEDPRE_Field := 16#10#;
      --  unspecified
      Reserved_9_31 : nrf51.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LEDPRE_Register use record
      LEDPRE        at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   ---------------------
   -- ACCDBL_Register --
   ---------------------

   subtype ACCDBL_ACCDBL_Field is nrf51.UInt4;

   --  Accumulated double (error) transitions register.
   type ACCDBL_Register is record
      --  Read-only. Accumulated double (error) transitions.
      ACCDBL        : ACCDBL_ACCDBL_Field;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACCDBL_Register use record
      ACCDBL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -------------------------
   -- ACCDBLREAD_Register --
   -------------------------

   subtype ACCDBLREAD_ACCDBLREAD_Field is nrf51.UInt4;

   --  Snapshot of ACCDBL register. Value generated by the TASKS_READCLEACC
   --  task.
   type ACCDBLREAD_Register is record
      --  Read-only. Snapshot of accumulated double (error) transitions.
      ACCDBLREAD    : ACCDBLREAD_ACCDBLREAD_Field;
      --  unspecified
      Reserved_4_31 : nrf51.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACCDBLREAD_Register use record
      ACCDBLREAD    at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --------------------
   -- POWER_Register --
   --------------------

   --  Peripheral power control.
   type POWER_Field is
     (
      --  Module power disabled.
      Disabled,
      --  Module power enabled.
      Enabled)
     with Size => 1;
   for POWER_Field use
     (Disabled => 0,
      Enabled => 1);

   --  Peripheral power control.
   type POWER_Register is record
      --  Peripheral power control.
      POWER         : POWER_Field := Disabled;
      --  unspecified
      Reserved_1_31 : nrf51.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_Register use record
      POWER         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Rotary decoder.
   type QDEC_Peripheral is record
      --  Start the quadrature decoder.
      TASKS_START      : nrf51.Word;
      --  Stop the quadrature decoder.
      TASKS_STOP       : nrf51.Word;
      --  Transfers the content from ACC registers to ACCREAD registers, and
      --  clears the ACC registers.
      TASKS_READCLRACC : nrf51.Word;
      --  A new sample is written to the sample register.
      EVENTS_SAMPLERDY : nrf51.Word;
      --  REPORTPER number of samples accumulated in ACC register, and ACC
      --  register different than zero.
      EVENTS_REPORTRDY : nrf51.Word;
      --  ACC or ACCDBL register overflow.
      EVENTS_ACCOF     : nrf51.Word;
      --  Shortcuts for the QDEC.
      SHORTS           : SHORTS_Register;
      --  Interrupt enable set register.
      INTENSET         : INTENSET_Register;
      --  Interrupt enable clear register.
      INTENCLR         : INTENCLR_Register;
      --  Enable the QDEC.
      ENABLE           : ENABLE_Register;
      --  LED output pin polarity.
      LEDPOL           : LEDPOL_Register;
      --  Sample period.
      SAMPLEPER        : SAMPLEPER_Register;
      --  Motion sample value.
      SAMPLE           : nrf51.Word;
      --  Number of samples to generate an EVENT_REPORTRDY.
      REPORTPER        : REPORTPER_Register;
      --  Accumulated valid transitions register.
      ACC              : nrf51.Word;
      --  Snapshot of ACC register. Value generated by the TASKS_READCLEACC
      --  task.
      ACCREAD          : nrf51.Word;
      --  Pin select for LED output.
      PSELLED          : nrf51.Word;
      --  Pin select for phase A input.
      PSELA            : nrf51.Word;
      --  Pin select for phase B input.
      PSELB            : nrf51.Word;
      --  Enable debouncer input filters.
      DBFEN            : DBFEN_Register;
      --  Time LED is switched ON before the sample.
      LEDPRE           : LEDPRE_Register;
      --  Accumulated double (error) transitions register.
      ACCDBL           : ACCDBL_Register;
      --  Snapshot of ACCDBL register. Value generated by the TASKS_READCLEACC
      --  task.
      ACCDBLREAD       : ACCDBLREAD_Register;
      --  Peripheral power control.
      POWER            : POWER_Register;
   end record
     with Volatile;

   for QDEC_Peripheral use record
      TASKS_START      at 0 range 0 .. 31;
      TASKS_STOP       at 4 range 0 .. 31;
      TASKS_READCLRACC at 8 range 0 .. 31;
      EVENTS_SAMPLERDY at 256 range 0 .. 31;
      EVENTS_REPORTRDY at 260 range 0 .. 31;
      EVENTS_ACCOF     at 264 range 0 .. 31;
      SHORTS           at 512 range 0 .. 31;
      INTENSET         at 772 range 0 .. 31;
      INTENCLR         at 776 range 0 .. 31;
      ENABLE           at 1280 range 0 .. 31;
      LEDPOL           at 1284 range 0 .. 31;
      SAMPLEPER        at 1288 range 0 .. 31;
      SAMPLE           at 1292 range 0 .. 31;
      REPORTPER        at 1296 range 0 .. 31;
      ACC              at 1300 range 0 .. 31;
      ACCREAD          at 1304 range 0 .. 31;
      PSELLED          at 1308 range 0 .. 31;
      PSELA            at 1312 range 0 .. 31;
      PSELB            at 1316 range 0 .. 31;
      DBFEN            at 1320 range 0 .. 31;
      LEDPRE           at 1344 range 0 .. 31;
      ACCDBL           at 1348 range 0 .. 31;
      ACCDBLREAD       at 1352 range 0 .. 31;
      POWER            at 4092 range 0 .. 31;
   end record;

   --  Rotary decoder.
   QDEC_Periph : aliased QDEC_Peripheral
     with Import, Address => QDEC_Base;

end nrf51.QDEC;
