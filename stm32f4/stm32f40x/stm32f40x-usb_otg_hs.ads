pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F40x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F40x.USB_OTG_HS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype OTG_HS_DCFG_DSPD_Field is STM32F40x.UInt2;
   subtype OTG_HS_DCFG_NZLSOHSK_Field is STM32F40x.Bit;
   subtype OTG_HS_DCFG_DAD_Field is STM32F40x.UInt7;
   subtype OTG_HS_DCFG_PFIVL_Field is STM32F40x.UInt2;
   subtype OTG_HS_DCFG_PERSCHIVL_Field is STM32F40x.UInt2;

   --  OTG_HS device configuration register
   type OTG_HS_DCFG_Register is record
      --  Device speed
      DSPD           : OTG_HS_DCFG_DSPD_Field := 16#0#;
      --  Nonzero-length status OUT handshake
      NZLSOHSK       : OTG_HS_DCFG_NZLSOHSK_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : STM32F40x.Bit := 16#0#;
      --  Device address
      DAD            : OTG_HS_DCFG_DAD_Field := 16#0#;
      --  Periodic (micro)frame interval
      PFIVL          : OTG_HS_DCFG_PFIVL_Field := 16#0#;
      --  unspecified
      Reserved_13_23 : STM32F40x.UInt11 := 16#100#;
      --  Periodic scheduling interval
      PERSCHIVL      : OTG_HS_DCFG_PERSCHIVL_Field := 16#2#;
      --  unspecified
      Reserved_26_31 : STM32F40x.UInt6 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DCFG_Register use record
      DSPD           at 0 range 0 .. 1;
      NZLSOHSK       at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      DAD            at 0 range 4 .. 10;
      PFIVL          at 0 range 11 .. 12;
      Reserved_13_23 at 0 range 13 .. 23;
      PERSCHIVL      at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype OTG_HS_DCTL_RWUSIG_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_SDIS_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_GINSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_GONSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_TCTL_Field is STM32F40x.UInt3;
   subtype OTG_HS_DCTL_SGINAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_CGINAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_SGONAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_CGONAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DCTL_POPRGDNE_Field is STM32F40x.Bit;

   --  OTG_HS device control register
   type OTG_HS_DCTL_Register is record
      --  Remote wakeup signaling
      RWUSIG         : OTG_HS_DCTL_RWUSIG_Field := 16#0#;
      --  Soft disconnect
      SDIS           : OTG_HS_DCTL_SDIS_Field := 16#0#;
      --  Read-only. Global IN NAK status
      GINSTS         : OTG_HS_DCTL_GINSTS_Field := 16#0#;
      --  Read-only. Global OUT NAK status
      GONSTS         : OTG_HS_DCTL_GONSTS_Field := 16#0#;
      --  Test control
      TCTL           : OTG_HS_DCTL_TCTL_Field := 16#0#;
      --  Write-only. Set global IN NAK
      SGINAK         : OTG_HS_DCTL_SGINAK_Field := 16#0#;
      --  Write-only. Clear global IN NAK
      CGINAK         : OTG_HS_DCTL_CGINAK_Field := 16#0#;
      --  Write-only. Set global OUT NAK
      SGONAK         : OTG_HS_DCTL_SGONAK_Field := 16#0#;
      --  Write-only. Clear global OUT NAK
      CGONAK         : OTG_HS_DCTL_CGONAK_Field := 16#0#;
      --  Power-on programming done
      POPRGDNE       : OTG_HS_DCTL_POPRGDNE_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DCTL_Register use record
      RWUSIG         at 0 range 0 .. 0;
      SDIS           at 0 range 1 .. 1;
      GINSTS         at 0 range 2 .. 2;
      GONSTS         at 0 range 3 .. 3;
      TCTL           at 0 range 4 .. 6;
      SGINAK         at 0 range 7 .. 7;
      CGINAK         at 0 range 8 .. 8;
      SGONAK         at 0 range 9 .. 9;
      CGONAK         at 0 range 10 .. 10;
      POPRGDNE       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype OTG_HS_DSTS_SUSPSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DSTS_ENUMSPD_Field is STM32F40x.UInt2;
   subtype OTG_HS_DSTS_EERR_Field is STM32F40x.Bit;
   subtype OTG_HS_DSTS_FNSOF_Field is STM32F40x.UInt14;

   --  OTG_HS device status register
   type OTG_HS_DSTS_Register is record
      --  Read-only. Suspend status
      SUSPSTS        : OTG_HS_DSTS_SUSPSTS_Field;
      --  Read-only. Enumerated speed
      ENUMSPD        : OTG_HS_DSTS_ENUMSPD_Field;
      --  Read-only. Erratic error
      EERR           : OTG_HS_DSTS_EERR_Field;
      --  unspecified
      Reserved_4_7   : STM32F40x.UInt4;
      --  Read-only. Frame number of the received SOF
      FNSOF          : OTG_HS_DSTS_FNSOF_Field;
      --  unspecified
      Reserved_22_31 : STM32F40x.UInt10;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DSTS_Register use record
      SUSPSTS        at 0 range 0 .. 0;
      ENUMSPD        at 0 range 1 .. 2;
      EERR           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      FNSOF          at 0 range 8 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype OTG_HS_DIEPMSK_XFRCM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_EPDM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_TOM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_ITTXFEMSK_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_INEPNMM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_INEPNEM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_TXFURM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPMSK_BIM_Field is STM32F40x.Bit;

   --  OTG_HS device IN endpoint common interrupt mask register
   type OTG_HS_DIEPMSK_Register is record
      --  Transfer completed interrupt mask
      XFRCM          : OTG_HS_DIEPMSK_XFRCM_Field := 16#0#;
      --  Endpoint disabled interrupt mask
      EPDM           : OTG_HS_DIEPMSK_EPDM_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32F40x.Bit := 16#0#;
      --  Timeout condition mask (nonisochronous endpoints)
      TOM            : OTG_HS_DIEPMSK_TOM_Field := 16#0#;
      --  IN token received when TxFIFO empty mask
      ITTXFEMSK      : OTG_HS_DIEPMSK_ITTXFEMSK_Field := 16#0#;
      --  IN token received with EP mismatch mask
      INEPNMM        : OTG_HS_DIEPMSK_INEPNMM_Field := 16#0#;
      --  IN endpoint NAK effective mask
      INEPNEM        : OTG_HS_DIEPMSK_INEPNEM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  FIFO underrun mask
      TXFURM         : OTG_HS_DIEPMSK_TXFURM_Field := 16#0#;
      --  BNA interrupt mask
      BIM            : OTG_HS_DIEPMSK_BIM_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32F40x.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPMSK_Register use record
      XFRCM          at 0 range 0 .. 0;
      EPDM           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      TOM            at 0 range 3 .. 3;
      ITTXFEMSK      at 0 range 4 .. 4;
      INEPNMM        at 0 range 5 .. 5;
      INEPNEM        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TXFURM         at 0 range 8 .. 8;
      BIM            at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype OTG_HS_DOEPMSK_XFRCM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPMSK_EPDM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPMSK_STUPM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPMSK_OTEPDM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPMSK_B2BSTUP_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPMSK_OPEM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPMSK_BOIM_Field is STM32F40x.Bit;

   --  OTG_HS device OUT endpoint common interrupt mask register
   type OTG_HS_DOEPMSK_Register is record
      --  Transfer completed interrupt mask
      XFRCM          : OTG_HS_DOEPMSK_XFRCM_Field := 16#0#;
      --  Endpoint disabled interrupt mask
      EPDM           : OTG_HS_DOEPMSK_EPDM_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32F40x.Bit := 16#0#;
      --  SETUP phase done mask
      STUPM          : OTG_HS_DOEPMSK_STUPM_Field := 16#0#;
      --  OUT token received when endpoint disabled mask
      OTEPDM         : OTG_HS_DOEPMSK_OTEPDM_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32F40x.Bit := 16#0#;
      --  Back-to-back SETUP packets received mask
      B2BSTUP        : OTG_HS_DOEPMSK_B2BSTUP_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  OUT packet error mask
      OPEM           : OTG_HS_DOEPMSK_OPEM_Field := 16#0#;
      --  BNA interrupt mask
      BOIM           : OTG_HS_DOEPMSK_BOIM_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32F40x.UInt22 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPMSK_Register use record
      XFRCM          at 0 range 0 .. 0;
      EPDM           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      STUPM          at 0 range 3 .. 3;
      OTEPDM         at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      B2BSTUP        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      OPEM           at 0 range 8 .. 8;
      BOIM           at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype OTG_HS_DAINT_IEPINT_Field is STM32F40x.UInt16;
   subtype OTG_HS_DAINT_OEPINT_Field is STM32F40x.UInt16;

   --  OTG_HS device all endpoints interrupt register
   type OTG_HS_DAINT_Register is record
      --  Read-only. IN endpoint interrupt bits
      IEPINT : OTG_HS_DAINT_IEPINT_Field;
      --  Read-only. OUT endpoint interrupt bits
      OEPINT : OTG_HS_DAINT_OEPINT_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DAINT_Register use record
      IEPINT at 0 range 0 .. 15;
      OEPINT at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_DAINTMSK_IEPM_Field is STM32F40x.UInt16;
   subtype OTG_HS_DAINTMSK_OEPM_Field is STM32F40x.UInt16;

   --  OTG_HS all endpoints interrupt mask register
   type OTG_HS_DAINTMSK_Register is record
      --  IN EP interrupt mask bits
      IEPM : OTG_HS_DAINTMSK_IEPM_Field := 16#0#;
      --  OUT EP interrupt mask bits
      OEPM : OTG_HS_DAINTMSK_OEPM_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DAINTMSK_Register use record
      IEPM at 0 range 0 .. 15;
      OEPM at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_DVBUSDIS_VBUSDT_Field is STM32F40x.UInt16;

   --  OTG_HS device VBUS discharge time register
   type OTG_HS_DVBUSDIS_Register is record
      --  Device VBUS discharge time
      VBUSDT         : OTG_HS_DVBUSDIS_VBUSDT_Field := 16#17D7#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DVBUSDIS_Register use record
      VBUSDT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_DVBUSPULSE_DVBUSP_Field is STM32F40x.UInt12;

   --  OTG_HS device VBUS pulsing time register
   type OTG_HS_DVBUSPULSE_Register is record
      --  Device VBUS pulsing time
      DVBUSP         : OTG_HS_DVBUSPULSE_DVBUSP_Field := 16#5B8#;
      --  unspecified
      Reserved_12_31 : STM32F40x.UInt20 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DVBUSPULSE_Register use record
      DVBUSP         at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype OTG_HS_DTHRCTL_NONISOTHREN_Field is STM32F40x.Bit;
   subtype OTG_HS_DTHRCTL_ISOTHREN_Field is STM32F40x.Bit;
   subtype OTG_HS_DTHRCTL_TXTHRLEN_Field is STM32F40x.UInt9;
   subtype OTG_HS_DTHRCTL_RXTHREN_Field is STM32F40x.Bit;
   subtype OTG_HS_DTHRCTL_RXTHRLEN_Field is STM32F40x.UInt9;
   subtype OTG_HS_DTHRCTL_ARPEN_Field is STM32F40x.Bit;

   --  OTG_HS Device threshold control register
   type OTG_HS_DTHRCTL_Register is record
      --  Nonisochronous IN endpoints threshold enable
      NONISOTHREN    : OTG_HS_DTHRCTL_NONISOTHREN_Field := 16#0#;
      --  ISO IN endpoint threshold enable
      ISOTHREN       : OTG_HS_DTHRCTL_ISOTHREN_Field := 16#0#;
      --  Transmit threshold length
      TXTHRLEN       : OTG_HS_DTHRCTL_TXTHRLEN_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32F40x.UInt5 := 16#0#;
      --  Receive threshold enable
      RXTHREN        : OTG_HS_DTHRCTL_RXTHREN_Field := 16#0#;
      --  Receive threshold length
      RXTHRLEN       : OTG_HS_DTHRCTL_RXTHRLEN_Field := 16#0#;
      --  unspecified
      Reserved_26_26 : STM32F40x.Bit := 16#0#;
      --  Arbiter parking enable
      ARPEN          : OTG_HS_DTHRCTL_ARPEN_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32F40x.UInt4 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DTHRCTL_Register use record
      NONISOTHREN    at 0 range 0 .. 0;
      ISOTHREN       at 0 range 1 .. 1;
      TXTHRLEN       at 0 range 2 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      RXTHREN        at 0 range 16 .. 16;
      RXTHRLEN       at 0 range 17 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      ARPEN          at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype OTG_HS_DIEPEMPMSK_INEPTXFEM_Field is STM32F40x.UInt16;

   --  OTG_HS device IN endpoint FIFO empty interrupt mask register
   type OTG_HS_DIEPEMPMSK_Register is record
      --  IN EP Tx FIFO empty interrupt mask bits
      INEPTXFEM      : OTG_HS_DIEPEMPMSK_INEPTXFEM_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPEMPMSK_Register use record
      INEPTXFEM      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_DEACHINT_IEP1INT_Field is STM32F40x.Bit;
   subtype OTG_HS_DEACHINT_OEP1INT_Field is STM32F40x.Bit;

   --  OTG_HS device each endpoint interrupt register
   type OTG_HS_DEACHINT_Register is record
      --  unspecified
      Reserved_0_0   : STM32F40x.Bit := 16#0#;
      --  IN endpoint 1interrupt bit
      IEP1INT        : OTG_HS_DEACHINT_IEP1INT_Field := 16#0#;
      --  unspecified
      Reserved_2_16  : STM32F40x.UInt15 := 16#0#;
      --  OUT endpoint 1 interrupt bit
      OEP1INT        : OTG_HS_DEACHINT_OEP1INT_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : STM32F40x.UInt14 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DEACHINT_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      IEP1INT        at 0 range 1 .. 1;
      Reserved_2_16  at 0 range 2 .. 16;
      OEP1INT        at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype OTG_HS_DEACHINTMSK_IEP1INTM_Field is STM32F40x.Bit;
   subtype OTG_HS_DEACHINTMSK_OEP1INTM_Field is STM32F40x.Bit;

   --  OTG_HS device each endpoint interrupt register mask
   type OTG_HS_DEACHINTMSK_Register is record
      --  unspecified
      Reserved_0_0   : STM32F40x.Bit := 16#0#;
      --  IN Endpoint 1 interrupt mask bit
      IEP1INTM       : OTG_HS_DEACHINTMSK_IEP1INTM_Field := 16#0#;
      --  unspecified
      Reserved_2_16  : STM32F40x.UInt15 := 16#0#;
      --  OUT Endpoint 1 interrupt mask bit
      OEP1INTM       : OTG_HS_DEACHINTMSK_OEP1INTM_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : STM32F40x.UInt14 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DEACHINTMSK_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      IEP1INTM       at 0 range 1 .. 1;
      Reserved_2_16  at 0 range 2 .. 16;
      OEP1INTM       at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype OTG_HS_DIEPEACHMSK1_XFRCM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_EPDM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_TOM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_ITTXFEMSK_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_INEPNMM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_INEPNEM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_TXFURM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_BIM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPEACHMSK1_NAKM_Field is STM32F40x.Bit;

   --  OTG_HS device each in endpoint-1 interrupt register
   type OTG_HS_DIEPEACHMSK1_Register is record
      --  Transfer completed interrupt mask
      XFRCM          : OTG_HS_DIEPEACHMSK1_XFRCM_Field := 16#0#;
      --  Endpoint disabled interrupt mask
      EPDM           : OTG_HS_DIEPEACHMSK1_EPDM_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32F40x.Bit := 16#0#;
      --  Timeout condition mask (nonisochronous endpoints)
      TOM            : OTG_HS_DIEPEACHMSK1_TOM_Field := 16#0#;
      --  IN token received when TxFIFO empty mask
      ITTXFEMSK      : OTG_HS_DIEPEACHMSK1_ITTXFEMSK_Field := 16#0#;
      --  IN token received with EP mismatch mask
      INEPNMM        : OTG_HS_DIEPEACHMSK1_INEPNMM_Field := 16#0#;
      --  IN endpoint NAK effective mask
      INEPNEM        : OTG_HS_DIEPEACHMSK1_INEPNEM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  FIFO underrun mask
      TXFURM         : OTG_HS_DIEPEACHMSK1_TXFURM_Field := 16#0#;
      --  BNA interrupt mask
      BIM            : OTG_HS_DIEPEACHMSK1_BIM_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : STM32F40x.UInt3 := 16#0#;
      --  NAK interrupt mask
      NAKM           : OTG_HS_DIEPEACHMSK1_NAKM_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32F40x.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPEACHMSK1_Register use record
      XFRCM          at 0 range 0 .. 0;
      EPDM           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      TOM            at 0 range 3 .. 3;
      ITTXFEMSK      at 0 range 4 .. 4;
      INEPNMM        at 0 range 5 .. 5;
      INEPNEM        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TXFURM         at 0 range 8 .. 8;
      BIM            at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      NAKM           at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype OTG_HS_DOEPEACHMSK1_XFRCM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_EPDM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_TOM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_ITTXFEMSK_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_INEPNMM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_INEPNEM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_TXFURM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_BIM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_BERRM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_NAKM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPEACHMSK1_NYETM_Field is STM32F40x.Bit;

   --  OTG_HS device each OUT endpoint-1 interrupt register
   type OTG_HS_DOEPEACHMSK1_Register is record
      --  Transfer completed interrupt mask
      XFRCM          : OTG_HS_DOEPEACHMSK1_XFRCM_Field := 16#0#;
      --  Endpoint disabled interrupt mask
      EPDM           : OTG_HS_DOEPEACHMSK1_EPDM_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32F40x.Bit := 16#0#;
      --  Timeout condition mask
      TOM            : OTG_HS_DOEPEACHMSK1_TOM_Field := 16#0#;
      --  IN token received when TxFIFO empty mask
      ITTXFEMSK      : OTG_HS_DOEPEACHMSK1_ITTXFEMSK_Field := 16#0#;
      --  IN token received with EP mismatch mask
      INEPNMM        : OTG_HS_DOEPEACHMSK1_INEPNMM_Field := 16#0#;
      --  IN endpoint NAK effective mask
      INEPNEM        : OTG_HS_DOEPEACHMSK1_INEPNEM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  OUT packet error mask
      TXFURM         : OTG_HS_DOEPEACHMSK1_TXFURM_Field := 16#0#;
      --  BNA interrupt mask
      BIM            : OTG_HS_DOEPEACHMSK1_BIM_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : STM32F40x.UInt2 := 16#0#;
      --  Bubble error interrupt mask
      BERRM          : OTG_HS_DOEPEACHMSK1_BERRM_Field := 16#0#;
      --  NAK interrupt mask
      NAKM           : OTG_HS_DOEPEACHMSK1_NAKM_Field := 16#0#;
      --  NYET interrupt mask
      NYETM          : OTG_HS_DOEPEACHMSK1_NYETM_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32F40x.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPEACHMSK1_Register use record
      XFRCM          at 0 range 0 .. 0;
      EPDM           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      TOM            at 0 range 3 .. 3;
      ITTXFEMSK      at 0 range 4 .. 4;
      INEPNMM        at 0 range 5 .. 5;
      INEPNEM        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TXFURM         at 0 range 8 .. 8;
      BIM            at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      BERRM          at 0 range 12 .. 12;
      NAKM           at 0 range 13 .. 13;
      NYETM          at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype OTG_HS_DIEPCTL_MPSIZ_Field is STM32F40x.UInt11;
   subtype OTG_HS_DIEPCTL_USBAEP_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_EONUM_DPID_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_NAKSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_EPTYP_Field is STM32F40x.UInt2;
   subtype OTG_HS_DIEPCTL_Stall_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_TXFNUM_Field is STM32F40x.UInt4;
   subtype OTG_HS_DIEPCTL_CNAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_SNAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_SD0PID_SEVNFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_SODDFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_EPDIS_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPCTL_EPENA_Field is STM32F40x.Bit;

   --  OTG device endpoint-0 control register
   type OTG_HS_DIEPCTL_Register is record
      --  Maximum packet size
      MPSIZ          : OTG_HS_DIEPCTL_MPSIZ_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : STM32F40x.UInt4 := 16#0#;
      --  USB active endpoint
      USBAEP         : OTG_HS_DIEPCTL_USBAEP_Field := 16#0#;
      --  Read-only. Even/odd frame
      EONUM_DPID     : OTG_HS_DIEPCTL_EONUM_DPID_Field := 16#0#;
      --  Read-only. NAK status
      NAKSTS         : OTG_HS_DIEPCTL_NAKSTS_Field := 16#0#;
      --  Endpoint type
      EPTYP          : OTG_HS_DIEPCTL_EPTYP_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : STM32F40x.Bit := 16#0#;
      --  STALL handshake
      Stall          : OTG_HS_DIEPCTL_Stall_Field := 16#0#;
      --  TxFIFO number
      TXFNUM         : OTG_HS_DIEPCTL_TXFNUM_Field := 16#0#;
      --  Write-only. Clear NAK
      CNAK           : OTG_HS_DIEPCTL_CNAK_Field := 16#0#;
      --  Write-only. Set NAK
      SNAK           : OTG_HS_DIEPCTL_SNAK_Field := 16#0#;
      --  Write-only. Set DATA0 PID
      SD0PID_SEVNFRM : OTG_HS_DIEPCTL_SD0PID_SEVNFRM_Field := 16#0#;
      --  Write-only. Set odd frame
      SODDFRM        : OTG_HS_DIEPCTL_SODDFRM_Field := 16#0#;
      --  Endpoint disable
      EPDIS          : OTG_HS_DIEPCTL_EPDIS_Field := 16#0#;
      --  Endpoint enable
      EPENA          : OTG_HS_DIEPCTL_EPENA_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPCTL_Register use record
      MPSIZ          at 0 range 0 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      USBAEP         at 0 range 15 .. 15;
      EONUM_DPID     at 0 range 16 .. 16;
      NAKSTS         at 0 range 17 .. 17;
      EPTYP          at 0 range 18 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      Stall          at 0 range 21 .. 21;
      TXFNUM         at 0 range 22 .. 25;
      CNAK           at 0 range 26 .. 26;
      SNAK           at 0 range 27 .. 27;
      SD0PID_SEVNFRM at 0 range 28 .. 28;
      SODDFRM        at 0 range 29 .. 29;
      EPDIS          at 0 range 30 .. 30;
      EPENA          at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_DIEPINT_XFRC_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_EPDISD_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_TOC_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_ITTXFE_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_INEPNE_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_TXFE_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_TXFIFOUDRN_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_BNA_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_PKTDRPSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_BERR_Field is STM32F40x.Bit;
   subtype OTG_HS_DIEPINT_NAK_Field is STM32F40x.Bit;

   --  OTG device endpoint-0 interrupt register
   type OTG_HS_DIEPINT_Register is record
      --  Transfer completed interrupt
      XFRC           : OTG_HS_DIEPINT_XFRC_Field := 16#0#;
      --  Endpoint disabled interrupt
      EPDISD         : OTG_HS_DIEPINT_EPDISD_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32F40x.Bit := 16#0#;
      --  Timeout condition
      TOC            : OTG_HS_DIEPINT_TOC_Field := 16#0#;
      --  IN token received when TxFIFO is empty
      ITTXFE         : OTG_HS_DIEPINT_ITTXFE_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32F40x.Bit := 16#0#;
      --  IN endpoint NAK effective
      INEPNE         : OTG_HS_DIEPINT_INEPNE_Field := 16#0#;
      --  Read-only. Transmit FIFO empty
      TXFE           : OTG_HS_DIEPINT_TXFE_Field := 16#1#;
      --  Transmit Fifo Underrun
      TXFIFOUDRN     : OTG_HS_DIEPINT_TXFIFOUDRN_Field := 16#0#;
      --  Buffer not available interrupt
      BNA            : OTG_HS_DIEPINT_BNA_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : STM32F40x.Bit := 16#0#;
      --  Packet dropped status
      PKTDRPSTS      : OTG_HS_DIEPINT_PKTDRPSTS_Field := 16#0#;
      --  Babble error interrupt
      BERR           : OTG_HS_DIEPINT_BERR_Field := 16#0#;
      --  NAK interrupt
      NAK            : OTG_HS_DIEPINT_NAK_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32F40x.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPINT_Register use record
      XFRC           at 0 range 0 .. 0;
      EPDISD         at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      TOC            at 0 range 3 .. 3;
      ITTXFE         at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      INEPNE         at 0 range 6 .. 6;
      TXFE           at 0 range 7 .. 7;
      TXFIFOUDRN     at 0 range 8 .. 8;
      BNA            at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      PKTDRPSTS      at 0 range 11 .. 11;
      BERR           at 0 range 12 .. 12;
      NAK            at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype OTG_HS_DIEPTSIZ0_XFRSIZ_Field is STM32F40x.UInt7;
   subtype OTG_HS_DIEPTSIZ0_PKTCNT_Field is STM32F40x.UInt2;

   --  OTG_HS device IN endpoint 0 transfer size register
   type OTG_HS_DIEPTSIZ0_Register is record
      --  Transfer size
      XFRSIZ         : OTG_HS_DIEPTSIZ0_XFRSIZ_Field := 16#0#;
      --  unspecified
      Reserved_7_18  : STM32F40x.UInt12 := 16#0#;
      --  Packet count
      PKTCNT         : OTG_HS_DIEPTSIZ0_PKTCNT_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : STM32F40x.UInt11 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPTSIZ0_Register use record
      XFRSIZ         at 0 range 0 .. 6;
      Reserved_7_18  at 0 range 7 .. 18;
      PKTCNT         at 0 range 19 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype OTG_HS_DTXFSTS_INEPTFSAV_Field is STM32F40x.UInt16;

   --  OTG_HS device IN endpoint transmit FIFO status register
   type OTG_HS_DTXFSTS_Register is record
      --  Read-only. IN endpoint TxFIFO space avail
      INEPTFSAV      : OTG_HS_DTXFSTS_INEPTFSAV_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DTXFSTS_Register use record
      INEPTFSAV      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_DIEPTSIZ_XFRSIZ_Field is STM32F40x.UInt19;
   subtype OTG_HS_DIEPTSIZ_PKTCNT_Field is STM32F40x.UInt10;
   subtype OTG_HS_DIEPTSIZ_MCNT_Field is STM32F40x.UInt2;

   --  OTG_HS device endpoint transfer size register
   type OTG_HS_DIEPTSIZ_Register is record
      --  Transfer size
      XFRSIZ         : OTG_HS_DIEPTSIZ_XFRSIZ_Field := 16#0#;
      --  Packet count
      PKTCNT         : OTG_HS_DIEPTSIZ_PKTCNT_Field := 16#0#;
      --  Multi count
      MCNT           : OTG_HS_DIEPTSIZ_MCNT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32F40x.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPTSIZ_Register use record
      XFRSIZ         at 0 range 0 .. 18;
      PKTCNT         at 0 range 19 .. 28;
      MCNT           at 0 range 29 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_DOEPCTL0_MPSIZ_Field is STM32F40x.UInt2;
   subtype OTG_HS_DOEPCTL0_USBAEP_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_NAKSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_EPTYP_Field is STM32F40x.UInt2;
   subtype OTG_HS_DOEPCTL0_SNPM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_Stall_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_CNAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_SNAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_EPDIS_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL0_EPENA_Field is STM32F40x.Bit;

   --  OTG_HS device control OUT endpoint 0 control register
   type OTG_HS_DOEPCTL0_Register is record
      --  Read-only. Maximum packet size
      MPSIZ          : OTG_HS_DOEPCTL0_MPSIZ_Field := 16#0#;
      --  unspecified
      Reserved_2_14  : STM32F40x.UInt13 := 16#0#;
      --  Read-only. USB active endpoint
      USBAEP         : OTG_HS_DOEPCTL0_USBAEP_Field := 16#1#;
      --  unspecified
      Reserved_16_16 : STM32F40x.Bit := 16#0#;
      --  Read-only. NAK status
      NAKSTS         : OTG_HS_DOEPCTL0_NAKSTS_Field := 16#0#;
      --  Read-only. Endpoint type
      EPTYP          : OTG_HS_DOEPCTL0_EPTYP_Field := 16#0#;
      --  Snoop mode
      SNPM           : OTG_HS_DOEPCTL0_SNPM_Field := 16#0#;
      --  STALL handshake
      Stall          : OTG_HS_DOEPCTL0_Stall_Field := 16#0#;
      --  unspecified
      Reserved_22_25 : STM32F40x.UInt4 := 16#0#;
      --  Write-only. Clear NAK
      CNAK           : OTG_HS_DOEPCTL0_CNAK_Field := 16#0#;
      --  Write-only. Set NAK
      SNAK           : OTG_HS_DOEPCTL0_SNAK_Field := 16#0#;
      --  unspecified
      Reserved_28_29 : STM32F40x.UInt2 := 16#0#;
      --  Read-only. Endpoint disable
      EPDIS          : OTG_HS_DOEPCTL0_EPDIS_Field := 16#0#;
      --  Write-only. Endpoint enable
      EPENA          : OTG_HS_DOEPCTL0_EPENA_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPCTL0_Register use record
      MPSIZ          at 0 range 0 .. 1;
      Reserved_2_14  at 0 range 2 .. 14;
      USBAEP         at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      NAKSTS         at 0 range 17 .. 17;
      EPTYP          at 0 range 18 .. 19;
      SNPM           at 0 range 20 .. 20;
      Stall          at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      CNAK           at 0 range 26 .. 26;
      SNAK           at 0 range 27 .. 27;
      Reserved_28_29 at 0 range 28 .. 29;
      EPDIS          at 0 range 30 .. 30;
      EPENA          at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_DOEPINT_XFRC_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPINT_EPDISD_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPINT_STUP_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPINT_OTEPDIS_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPINT_B2BSTUP_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPINT_NYET_Field is STM32F40x.Bit;

   --  OTG_HS device endpoint-0 interrupt register
   type OTG_HS_DOEPINT_Register is record
      --  Transfer completed interrupt
      XFRC           : OTG_HS_DOEPINT_XFRC_Field := 16#0#;
      --  Endpoint disabled interrupt
      EPDISD         : OTG_HS_DOEPINT_EPDISD_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32F40x.Bit := 16#0#;
      --  SETUP phase done
      STUP           : OTG_HS_DOEPINT_STUP_Field := 16#0#;
      --  OUT token received when endpoint disabled
      OTEPDIS        : OTG_HS_DOEPINT_OTEPDIS_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32F40x.Bit := 16#0#;
      --  Back-to-back SETUP packets received
      B2BSTUP        : OTG_HS_DOEPINT_B2BSTUP_Field := 16#0#;
      --  unspecified
      Reserved_7_13  : STM32F40x.UInt7 := 16#1#;
      --  NYET interrupt
      NYET           : OTG_HS_DOEPINT_NYET_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32F40x.UInt17 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPINT_Register use record
      XFRC           at 0 range 0 .. 0;
      EPDISD         at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      STUP           at 0 range 3 .. 3;
      OTEPDIS        at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      B2BSTUP        at 0 range 6 .. 6;
      Reserved_7_13  at 0 range 7 .. 13;
      NYET           at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype OTG_HS_DOEPTSIZ0_XFRSIZ_Field is STM32F40x.UInt7;
   subtype OTG_HS_DOEPTSIZ0_PKTCNT_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPTSIZ0_STUPCNT_Field is STM32F40x.UInt2;

   --  OTG_HS device endpoint-1 transfer size register
   type OTG_HS_DOEPTSIZ0_Register is record
      --  Transfer size
      XFRSIZ         : OTG_HS_DOEPTSIZ0_XFRSIZ_Field := 16#0#;
      --  unspecified
      Reserved_7_18  : STM32F40x.UInt12 := 16#0#;
      --  Packet count
      PKTCNT         : OTG_HS_DOEPTSIZ0_PKTCNT_Field := 16#0#;
      --  unspecified
      Reserved_20_28 : STM32F40x.UInt9 := 16#0#;
      --  SETUP packet count
      STUPCNT        : OTG_HS_DOEPTSIZ0_STUPCNT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32F40x.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPTSIZ0_Register use record
      XFRSIZ         at 0 range 0 .. 6;
      Reserved_7_18  at 0 range 7 .. 18;
      PKTCNT         at 0 range 19 .. 19;
      Reserved_20_28 at 0 range 20 .. 28;
      STUPCNT        at 0 range 29 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_DOEPCTL_MPSIZ_Field is STM32F40x.UInt11;
   subtype OTG_HS_DOEPCTL_USBAEP_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_EONUM_DPID_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_NAKSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_EPTYP_Field is STM32F40x.UInt2;
   subtype OTG_HS_DOEPCTL_SNPM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_Stall_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_CNAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_SNAK_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_SD0PID_SEVNFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_SODDFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_EPDIS_Field is STM32F40x.Bit;
   subtype OTG_HS_DOEPCTL_EPENA_Field is STM32F40x.Bit;

   --  OTG device endpoint-1 control register
   type OTG_HS_DOEPCTL_Register is record
      --  Maximum packet size
      MPSIZ          : OTG_HS_DOEPCTL_MPSIZ_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : STM32F40x.UInt4 := 16#0#;
      --  USB active endpoint
      USBAEP         : OTG_HS_DOEPCTL_USBAEP_Field := 16#0#;
      --  Read-only. Even odd frame/Endpoint data PID
      EONUM_DPID     : OTG_HS_DOEPCTL_EONUM_DPID_Field := 16#0#;
      --  Read-only. NAK status
      NAKSTS         : OTG_HS_DOEPCTL_NAKSTS_Field := 16#0#;
      --  Endpoint type
      EPTYP          : OTG_HS_DOEPCTL_EPTYP_Field := 16#0#;
      --  Snoop mode
      SNPM           : OTG_HS_DOEPCTL_SNPM_Field := 16#0#;
      --  STALL handshake
      Stall          : OTG_HS_DOEPCTL_Stall_Field := 16#0#;
      --  unspecified
      Reserved_22_25 : STM32F40x.UInt4 := 16#0#;
      --  Write-only. Clear NAK
      CNAK           : OTG_HS_DOEPCTL_CNAK_Field := 16#0#;
      --  Write-only. Set NAK
      SNAK           : OTG_HS_DOEPCTL_SNAK_Field := 16#0#;
      --  Write-only. Set DATA0 PID/Set even frame
      SD0PID_SEVNFRM : OTG_HS_DOEPCTL_SD0PID_SEVNFRM_Field := 16#0#;
      --  Write-only. Set odd frame
      SODDFRM        : OTG_HS_DOEPCTL_SODDFRM_Field := 16#0#;
      --  Endpoint disable
      EPDIS          : OTG_HS_DOEPCTL_EPDIS_Field := 16#0#;
      --  Endpoint enable
      EPENA          : OTG_HS_DOEPCTL_EPENA_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPCTL_Register use record
      MPSIZ          at 0 range 0 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      USBAEP         at 0 range 15 .. 15;
      EONUM_DPID     at 0 range 16 .. 16;
      NAKSTS         at 0 range 17 .. 17;
      EPTYP          at 0 range 18 .. 19;
      SNPM           at 0 range 20 .. 20;
      Stall          at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      CNAK           at 0 range 26 .. 26;
      SNAK           at 0 range 27 .. 27;
      SD0PID_SEVNFRM at 0 range 28 .. 28;
      SODDFRM        at 0 range 29 .. 29;
      EPDIS          at 0 range 30 .. 30;
      EPENA          at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_DOEPTSIZ_XFRSIZ_Field is STM32F40x.UInt19;
   subtype OTG_HS_DOEPTSIZ_PKTCNT_Field is STM32F40x.UInt10;
   subtype OTG_HS_DOEPTSIZ_RXDPID_STUPCNT_Field is STM32F40x.UInt2;

   --  OTG_HS device endpoint-2 transfer size register
   type OTG_HS_DOEPTSIZ_Register is record
      --  Transfer size
      XFRSIZ         : OTG_HS_DOEPTSIZ_XFRSIZ_Field := 16#0#;
      --  Packet count
      PKTCNT         : OTG_HS_DOEPTSIZ_PKTCNT_Field := 16#0#;
      --  Received data PID/SETUP packet count
      RXDPID_STUPCNT : OTG_HS_DOEPTSIZ_RXDPID_STUPCNT_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32F40x.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DOEPTSIZ_Register use record
      XFRSIZ         at 0 range 0 .. 18;
      PKTCNT         at 0 range 19 .. 28;
      RXDPID_STUPCNT at 0 range 29 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_GOTGCTL_SRQSCS_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_SRQ_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_HNGSCS_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_HNPRQ_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_HSHNPEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_DHNPEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_CIDSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_DBCT_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_ASVLD_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGCTL_BSVLD_Field is STM32F40x.Bit;

   --  OTG_HS control and status register
   type OTG_HS_GOTGCTL_Register is record
      --  Read-only. Session request success
      SRQSCS         : OTG_HS_GOTGCTL_SRQSCS_Field := 16#0#;
      --  Session request
      SRQ            : OTG_HS_GOTGCTL_SRQ_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : STM32F40x.UInt6 := 16#0#;
      --  Read-only. Host negotiation success
      HNGSCS         : OTG_HS_GOTGCTL_HNGSCS_Field := 16#0#;
      --  HNP request
      HNPRQ          : OTG_HS_GOTGCTL_HNPRQ_Field := 16#0#;
      --  Host set HNP enable
      HSHNPEN        : OTG_HS_GOTGCTL_HSHNPEN_Field := 16#0#;
      --  Device HNP enabled
      DHNPEN         : OTG_HS_GOTGCTL_DHNPEN_Field := 16#1#;
      --  unspecified
      Reserved_12_15 : STM32F40x.UInt4 := 16#0#;
      --  Read-only. Connector ID status
      CIDSTS         : OTG_HS_GOTGCTL_CIDSTS_Field := 16#0#;
      --  Read-only. Long/short debounce time
      DBCT           : OTG_HS_GOTGCTL_DBCT_Field := 16#0#;
      --  Read-only. A-session valid
      ASVLD          : OTG_HS_GOTGCTL_ASVLD_Field := 16#0#;
      --  Read-only. B-session valid
      BSVLD          : OTG_HS_GOTGCTL_BSVLD_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : STM32F40x.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GOTGCTL_Register use record
      SRQSCS         at 0 range 0 .. 0;
      SRQ            at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      HNGSCS         at 0 range 8 .. 8;
      HNPRQ          at 0 range 9 .. 9;
      HSHNPEN        at 0 range 10 .. 10;
      DHNPEN         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CIDSTS         at 0 range 16 .. 16;
      DBCT           at 0 range 17 .. 17;
      ASVLD          at 0 range 18 .. 18;
      BSVLD          at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype OTG_HS_GOTGINT_SEDET_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGINT_SRSSCHG_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGINT_HNSSCHG_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGINT_HNGDET_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGINT_ADTOCHG_Field is STM32F40x.Bit;
   subtype OTG_HS_GOTGINT_DBCDNE_Field is STM32F40x.Bit;

   --  OTG_HS interrupt register
   type OTG_HS_GOTGINT_Register is record
      --  unspecified
      Reserved_0_1   : STM32F40x.UInt2 := 16#0#;
      --  Session end detected
      SEDET          : OTG_HS_GOTGINT_SEDET_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : STM32F40x.UInt5 := 16#0#;
      --  Session request success status change
      SRSSCHG        : OTG_HS_GOTGINT_SRSSCHG_Field := 16#0#;
      --  Host negotiation success status change
      HNSSCHG        : OTG_HS_GOTGINT_HNSSCHG_Field := 16#0#;
      --  unspecified
      Reserved_10_16 : STM32F40x.UInt7 := 16#0#;
      --  Host negotiation detected
      HNGDET         : OTG_HS_GOTGINT_HNGDET_Field := 16#0#;
      --  A-device timeout change
      ADTOCHG        : OTG_HS_GOTGINT_ADTOCHG_Field := 16#0#;
      --  Debounce done
      DBCDNE         : OTG_HS_GOTGINT_DBCDNE_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : STM32F40x.UInt12 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GOTGINT_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      SEDET          at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      SRSSCHG        at 0 range 8 .. 8;
      HNSSCHG        at 0 range 9 .. 9;
      Reserved_10_16 at 0 range 10 .. 16;
      HNGDET         at 0 range 17 .. 17;
      ADTOCHG        at 0 range 18 .. 18;
      DBCDNE         at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype OTG_HS_GAHBCFG_GINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GAHBCFG_HBSTLEN_Field is STM32F40x.UInt4;
   subtype OTG_HS_GAHBCFG_DMAEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GAHBCFG_TXFELVL_Field is STM32F40x.Bit;
   subtype OTG_HS_GAHBCFG_PTXFELVL_Field is STM32F40x.Bit;

   --  OTG_HS AHB configuration register
   type OTG_HS_GAHBCFG_Register is record
      --  Global interrupt mask
      GINT          : OTG_HS_GAHBCFG_GINT_Field := 16#0#;
      --  Burst length/type
      HBSTLEN       : OTG_HS_GAHBCFG_HBSTLEN_Field := 16#0#;
      --  DMA enable
      DMAEN         : OTG_HS_GAHBCFG_DMAEN_Field := 16#0#;
      --  unspecified
      Reserved_6_6  : STM32F40x.Bit := 16#0#;
      --  TxFIFO empty level
      TXFELVL       : OTG_HS_GAHBCFG_TXFELVL_Field := 16#0#;
      --  Periodic TxFIFO empty level
      PTXFELVL      : OTG_HS_GAHBCFG_PTXFELVL_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32F40x.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GAHBCFG_Register use record
      GINT          at 0 range 0 .. 0;
      HBSTLEN       at 0 range 1 .. 4;
      DMAEN         at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      TXFELVL       at 0 range 7 .. 7;
      PTXFELVL      at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype OTG_HS_GUSBCFG_TOCAL_Field is STM32F40x.UInt3;
   subtype OTG_HS_GUSBCFG_PHYSEL_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_SRPCAP_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_HNPCAP_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_TRDT_Field is STM32F40x.UInt4;
   subtype OTG_HS_GUSBCFG_PHYLPCS_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_ULPIFSLS_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_ULPIAR_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_ULPICSM_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_ULPIEVBUSD_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_ULPIEVBUSI_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_TSDPS_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_PCCI_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_PTCI_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_ULPIIPD_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_FHMOD_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_FDMOD_Field is STM32F40x.Bit;
   subtype OTG_HS_GUSBCFG_CTXPKT_Field is STM32F40x.Bit;

   --  OTG_HS USB configuration register
   type OTG_HS_GUSBCFG_Register is record
      --  FS timeout calibration
      TOCAL          : OTG_HS_GUSBCFG_TOCAL_Field := 16#0#;
      --  unspecified
      Reserved_3_5   : STM32F40x.UInt3 := 16#0#;
      --  Write-only. USB 2.0 high-speed ULPI PHY or USB 1.1 full-speed serial
      --  transceiver select
      PHYSEL         : OTG_HS_GUSBCFG_PHYSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32F40x.Bit := 16#0#;
      --  SRP-capable
      SRPCAP         : OTG_HS_GUSBCFG_SRPCAP_Field := 16#0#;
      --  HNP-capable
      HNPCAP         : OTG_HS_GUSBCFG_HNPCAP_Field := 16#1#;
      --  USB turnaround time
      TRDT           : OTG_HS_GUSBCFG_TRDT_Field := 16#2#;
      --  unspecified
      Reserved_14_14 : STM32F40x.Bit := 16#0#;
      --  PHY Low-power clock select
      PHYLPCS        : OTG_HS_GUSBCFG_PHYLPCS_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : STM32F40x.Bit := 16#0#;
      --  ULPI FS/LS select
      ULPIFSLS       : OTG_HS_GUSBCFG_ULPIFSLS_Field := 16#0#;
      --  ULPI Auto-resume
      ULPIAR         : OTG_HS_GUSBCFG_ULPIAR_Field := 16#0#;
      --  ULPI Clock SuspendM
      ULPICSM        : OTG_HS_GUSBCFG_ULPICSM_Field := 16#0#;
      --  ULPI External VBUS Drive
      ULPIEVBUSD     : OTG_HS_GUSBCFG_ULPIEVBUSD_Field := 16#0#;
      --  ULPI external VBUS indicator
      ULPIEVBUSI     : OTG_HS_GUSBCFG_ULPIEVBUSI_Field := 16#0#;
      --  TermSel DLine pulsing selection
      TSDPS          : OTG_HS_GUSBCFG_TSDPS_Field := 16#0#;
      --  Indicator complement
      PCCI           : OTG_HS_GUSBCFG_PCCI_Field := 16#0#;
      --  Indicator pass through
      PTCI           : OTG_HS_GUSBCFG_PTCI_Field := 16#0#;
      --  ULPI interface protect disable
      ULPIIPD        : OTG_HS_GUSBCFG_ULPIIPD_Field := 16#0#;
      --  unspecified
      Reserved_26_28 : STM32F40x.UInt3 := 16#0#;
      --  Forced host mode
      FHMOD          : OTG_HS_GUSBCFG_FHMOD_Field := 16#0#;
      --  Forced peripheral mode
      FDMOD          : OTG_HS_GUSBCFG_FDMOD_Field := 16#0#;
      --  Corrupt Tx packet
      CTXPKT         : OTG_HS_GUSBCFG_CTXPKT_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GUSBCFG_Register use record
      TOCAL          at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      PHYSEL         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      SRPCAP         at 0 range 8 .. 8;
      HNPCAP         at 0 range 9 .. 9;
      TRDT           at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      PHYLPCS        at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      ULPIFSLS       at 0 range 17 .. 17;
      ULPIAR         at 0 range 18 .. 18;
      ULPICSM        at 0 range 19 .. 19;
      ULPIEVBUSD     at 0 range 20 .. 20;
      ULPIEVBUSI     at 0 range 21 .. 21;
      TSDPS          at 0 range 22 .. 22;
      PCCI           at 0 range 23 .. 23;
      PTCI           at 0 range 24 .. 24;
      ULPIIPD        at 0 range 25 .. 25;
      Reserved_26_28 at 0 range 26 .. 28;
      FHMOD          at 0 range 29 .. 29;
      FDMOD          at 0 range 30 .. 30;
      CTXPKT         at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_GRSTCTL_CSRST_Field is STM32F40x.Bit;
   subtype OTG_HS_GRSTCTL_HSRST_Field is STM32F40x.Bit;
   subtype OTG_HS_GRSTCTL_FCRST_Field is STM32F40x.Bit;
   subtype OTG_HS_GRSTCTL_RXFFLSH_Field is STM32F40x.Bit;
   subtype OTG_HS_GRSTCTL_TXFFLSH_Field is STM32F40x.Bit;
   subtype OTG_HS_GRSTCTL_TXFNUM_Field is STM32F40x.UInt5;
   subtype OTG_HS_GRSTCTL_DMAREQ_Field is STM32F40x.Bit;
   subtype OTG_HS_GRSTCTL_AHBIDL_Field is STM32F40x.Bit;

   --  OTG_HS reset register
   type OTG_HS_GRSTCTL_Register is record
      --  Core soft reset
      CSRST          : OTG_HS_GRSTCTL_CSRST_Field := 16#0#;
      --  HCLK soft reset
      HSRST          : OTG_HS_GRSTCTL_HSRST_Field := 16#0#;
      --  Host frame counter reset
      FCRST          : OTG_HS_GRSTCTL_FCRST_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : STM32F40x.Bit := 16#0#;
      --  RxFIFO flush
      RXFFLSH        : OTG_HS_GRSTCTL_RXFFLSH_Field := 16#0#;
      --  TxFIFO flush
      TXFFLSH        : OTG_HS_GRSTCTL_TXFFLSH_Field := 16#0#;
      --  TxFIFO number
      TXFNUM         : OTG_HS_GRSTCTL_TXFNUM_Field := 16#0#;
      --  unspecified
      Reserved_11_29 : STM32F40x.UInt19 := 16#40000#;
      --  Read-only. DMA request signal
      DMAREQ         : OTG_HS_GRSTCTL_DMAREQ_Field := 16#0#;
      --  Read-only. AHB master idle
      AHBIDL         : OTG_HS_GRSTCTL_AHBIDL_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GRSTCTL_Register use record
      CSRST          at 0 range 0 .. 0;
      HSRST          at 0 range 1 .. 1;
      FCRST          at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      RXFFLSH        at 0 range 4 .. 4;
      TXFFLSH        at 0 range 5 .. 5;
      TXFNUM         at 0 range 6 .. 10;
      Reserved_11_29 at 0 range 11 .. 29;
      DMAREQ         at 0 range 30 .. 30;
      AHBIDL         at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_GINTSTS_CMOD_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_MMIS_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_OTGINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_SOF_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_RXFLVL_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_NPTXFE_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_GINAKEFF_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_BOUTNAKEFF_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_ESUSP_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_USBSUSP_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_USBRST_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_ENUMDNE_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_ISOODRP_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_EOPF_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_IEPINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_OEPINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_IISOIXFR_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_PXFR_INCOMPISOOUT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_DATAFSUSP_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_HPRTINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_HCINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_PTXFE_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_CIDSCHG_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_DISCINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_SRQINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTSTS_WKUINT_Field is STM32F40x.Bit;

   --  OTG_HS core interrupt register
   type OTG_HS_GINTSTS_Register is record
      --  Read-only. Current mode of operation
      CMOD              : OTG_HS_GINTSTS_CMOD_Field := 16#0#;
      --  Mode mismatch interrupt
      MMIS              : OTG_HS_GINTSTS_MMIS_Field := 16#0#;
      --  Read-only. OTG interrupt
      OTGINT            : OTG_HS_GINTSTS_OTGINT_Field := 16#0#;
      --  Start of frame
      SOF               : OTG_HS_GINTSTS_SOF_Field := 16#0#;
      --  Read-only. RxFIFO nonempty
      RXFLVL            : OTG_HS_GINTSTS_RXFLVL_Field := 16#0#;
      --  Read-only. Nonperiodic TxFIFO empty
      NPTXFE            : OTG_HS_GINTSTS_NPTXFE_Field := 16#1#;
      --  Read-only. Global IN nonperiodic NAK effective
      GINAKEFF          : OTG_HS_GINTSTS_GINAKEFF_Field := 16#0#;
      --  Read-only. Global OUT NAK effective
      BOUTNAKEFF        : OTG_HS_GINTSTS_BOUTNAKEFF_Field := 16#0#;
      --  unspecified
      Reserved_8_9      : STM32F40x.UInt2 := 16#0#;
      --  Early suspend
      ESUSP             : OTG_HS_GINTSTS_ESUSP_Field := 16#0#;
      --  USB suspend
      USBSUSP           : OTG_HS_GINTSTS_USBSUSP_Field := 16#0#;
      --  USB reset
      USBRST            : OTG_HS_GINTSTS_USBRST_Field := 16#0#;
      --  Enumeration done
      ENUMDNE           : OTG_HS_GINTSTS_ENUMDNE_Field := 16#0#;
      --  Isochronous OUT packet dropped interrupt
      ISOODRP           : OTG_HS_GINTSTS_ISOODRP_Field := 16#0#;
      --  End of periodic frame interrupt
      EOPF              : OTG_HS_GINTSTS_EOPF_Field := 16#0#;
      --  unspecified
      Reserved_16_17    : STM32F40x.UInt2 := 16#0#;
      --  Read-only. IN endpoint interrupt
      IEPINT            : OTG_HS_GINTSTS_IEPINT_Field := 16#0#;
      --  Read-only. OUT endpoint interrupt
      OEPINT            : OTG_HS_GINTSTS_OEPINT_Field := 16#0#;
      --  Incomplete isochronous IN transfer
      IISOIXFR          : OTG_HS_GINTSTS_IISOIXFR_Field := 16#0#;
      --  Incomplete periodic transfer
      PXFR_INCOMPISOOUT : OTG_HS_GINTSTS_PXFR_INCOMPISOOUT_Field := 16#0#;
      --  Data fetch suspended
      DATAFSUSP         : OTG_HS_GINTSTS_DATAFSUSP_Field := 16#0#;
      --  unspecified
      Reserved_23_23    : STM32F40x.Bit := 16#0#;
      --  Read-only. Host port interrupt
      HPRTINT           : OTG_HS_GINTSTS_HPRTINT_Field := 16#0#;
      --  Read-only. Host channels interrupt
      HCINT             : OTG_HS_GINTSTS_HCINT_Field := 16#0#;
      --  Read-only. Periodic TxFIFO empty
      PTXFE             : OTG_HS_GINTSTS_PTXFE_Field := 16#1#;
      --  unspecified
      Reserved_27_27    : STM32F40x.Bit := 16#0#;
      --  Connector ID status change
      CIDSCHG           : OTG_HS_GINTSTS_CIDSCHG_Field := 16#0#;
      --  Disconnect detected interrupt
      DISCINT           : OTG_HS_GINTSTS_DISCINT_Field := 16#0#;
      --  Session request/new session detected interrupt
      SRQINT            : OTG_HS_GINTSTS_SRQINT_Field := 16#0#;
      --  Resume/remote wakeup detected interrupt
      WKUINT            : OTG_HS_GINTSTS_WKUINT_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GINTSTS_Register use record
      CMOD              at 0 range 0 .. 0;
      MMIS              at 0 range 1 .. 1;
      OTGINT            at 0 range 2 .. 2;
      SOF               at 0 range 3 .. 3;
      RXFLVL            at 0 range 4 .. 4;
      NPTXFE            at 0 range 5 .. 5;
      GINAKEFF          at 0 range 6 .. 6;
      BOUTNAKEFF        at 0 range 7 .. 7;
      Reserved_8_9      at 0 range 8 .. 9;
      ESUSP             at 0 range 10 .. 10;
      USBSUSP           at 0 range 11 .. 11;
      USBRST            at 0 range 12 .. 12;
      ENUMDNE           at 0 range 13 .. 13;
      ISOODRP           at 0 range 14 .. 14;
      EOPF              at 0 range 15 .. 15;
      Reserved_16_17    at 0 range 16 .. 17;
      IEPINT            at 0 range 18 .. 18;
      OEPINT            at 0 range 19 .. 19;
      IISOIXFR          at 0 range 20 .. 20;
      PXFR_INCOMPISOOUT at 0 range 21 .. 21;
      DATAFSUSP         at 0 range 22 .. 22;
      Reserved_23_23    at 0 range 23 .. 23;
      HPRTINT           at 0 range 24 .. 24;
      HCINT             at 0 range 25 .. 25;
      PTXFE             at 0 range 26 .. 26;
      Reserved_27_27    at 0 range 27 .. 27;
      CIDSCHG           at 0 range 28 .. 28;
      DISCINT           at 0 range 29 .. 29;
      SRQINT            at 0 range 30 .. 30;
      WKUINT            at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_GINTMSK_MMISM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_OTGINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_SOFM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_RXFLVLM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_NPTXFEM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_GINAKEFFM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_GONAKEFFM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_ESUSPM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_USBSUSPM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_USBRST_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_ENUMDNEM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_ISOODRPM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_EOPFM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_EPMISM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_IEPINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_OEPINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_IISOIXFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_PXFRM_IISOOXFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_FSUSPM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_PRTIM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_HCIM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_PTXFEM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_CIDSCHGM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_DISCINT_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_SRQIM_Field is STM32F40x.Bit;
   subtype OTG_HS_GINTMSK_WUIM_Field is STM32F40x.Bit;

   --  OTG_HS interrupt mask register
   type OTG_HS_GINTMSK_Register is record
      --  unspecified
      Reserved_0_0    : STM32F40x.Bit := 16#0#;
      --  Mode mismatch interrupt mask
      MMISM           : OTG_HS_GINTMSK_MMISM_Field := 16#0#;
      --  OTG interrupt mask
      OTGINT          : OTG_HS_GINTMSK_OTGINT_Field := 16#0#;
      --  Start of frame mask
      SOFM            : OTG_HS_GINTMSK_SOFM_Field := 16#0#;
      --  Receive FIFO nonempty mask
      RXFLVLM         : OTG_HS_GINTMSK_RXFLVLM_Field := 16#0#;
      --  Nonperiodic TxFIFO empty mask
      NPTXFEM         : OTG_HS_GINTMSK_NPTXFEM_Field := 16#0#;
      --  Global nonperiodic IN NAK effective mask
      GINAKEFFM       : OTG_HS_GINTMSK_GINAKEFFM_Field := 16#0#;
      --  Global OUT NAK effective mask
      GONAKEFFM       : OTG_HS_GINTMSK_GONAKEFFM_Field := 16#0#;
      --  unspecified
      Reserved_8_9    : STM32F40x.UInt2 := 16#0#;
      --  Early suspend mask
      ESUSPM          : OTG_HS_GINTMSK_ESUSPM_Field := 16#0#;
      --  USB suspend mask
      USBSUSPM        : OTG_HS_GINTMSK_USBSUSPM_Field := 16#0#;
      --  USB reset mask
      USBRST          : OTG_HS_GINTMSK_USBRST_Field := 16#0#;
      --  Enumeration done mask
      ENUMDNEM        : OTG_HS_GINTMSK_ENUMDNEM_Field := 16#0#;
      --  Isochronous OUT packet dropped interrupt mask
      ISOODRPM        : OTG_HS_GINTMSK_ISOODRPM_Field := 16#0#;
      --  End of periodic frame interrupt mask
      EOPFM           : OTG_HS_GINTMSK_EOPFM_Field := 16#0#;
      --  unspecified
      Reserved_16_16  : STM32F40x.Bit := 16#0#;
      --  Endpoint mismatch interrupt mask
      EPMISM          : OTG_HS_GINTMSK_EPMISM_Field := 16#0#;
      --  IN endpoints interrupt mask
      IEPINT          : OTG_HS_GINTMSK_IEPINT_Field := 16#0#;
      --  OUT endpoints interrupt mask
      OEPINT          : OTG_HS_GINTMSK_OEPINT_Field := 16#0#;
      --  Incomplete isochronous IN transfer mask
      IISOIXFRM       : OTG_HS_GINTMSK_IISOIXFRM_Field := 16#0#;
      --  Incomplete periodic transfer mask
      PXFRM_IISOOXFRM : OTG_HS_GINTMSK_PXFRM_IISOOXFRM_Field := 16#0#;
      --  Data fetch suspended mask
      FSUSPM          : OTG_HS_GINTMSK_FSUSPM_Field := 16#0#;
      --  unspecified
      Reserved_23_23  : STM32F40x.Bit := 16#0#;
      --  Read-only. Host port interrupt mask
      PRTIM           : OTG_HS_GINTMSK_PRTIM_Field := 16#0#;
      --  Host channels interrupt mask
      HCIM            : OTG_HS_GINTMSK_HCIM_Field := 16#0#;
      --  Periodic TxFIFO empty mask
      PTXFEM          : OTG_HS_GINTMSK_PTXFEM_Field := 16#0#;
      --  unspecified
      Reserved_27_27  : STM32F40x.Bit := 16#0#;
      --  Connector ID status change mask
      CIDSCHGM        : OTG_HS_GINTMSK_CIDSCHGM_Field := 16#0#;
      --  Disconnect detected interrupt mask
      DISCINT         : OTG_HS_GINTMSK_DISCINT_Field := 16#0#;
      --  Session request/new session detected interrupt mask
      SRQIM           : OTG_HS_GINTMSK_SRQIM_Field := 16#0#;
      --  Resume/remote wakeup detected interrupt mask
      WUIM            : OTG_HS_GINTMSK_WUIM_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GINTMSK_Register use record
      Reserved_0_0    at 0 range 0 .. 0;
      MMISM           at 0 range 1 .. 1;
      OTGINT          at 0 range 2 .. 2;
      SOFM            at 0 range 3 .. 3;
      RXFLVLM         at 0 range 4 .. 4;
      NPTXFEM         at 0 range 5 .. 5;
      GINAKEFFM       at 0 range 6 .. 6;
      GONAKEFFM       at 0 range 7 .. 7;
      Reserved_8_9    at 0 range 8 .. 9;
      ESUSPM          at 0 range 10 .. 10;
      USBSUSPM        at 0 range 11 .. 11;
      USBRST          at 0 range 12 .. 12;
      ENUMDNEM        at 0 range 13 .. 13;
      ISOODRPM        at 0 range 14 .. 14;
      EOPFM           at 0 range 15 .. 15;
      Reserved_16_16  at 0 range 16 .. 16;
      EPMISM          at 0 range 17 .. 17;
      IEPINT          at 0 range 18 .. 18;
      OEPINT          at 0 range 19 .. 19;
      IISOIXFRM       at 0 range 20 .. 20;
      PXFRM_IISOOXFRM at 0 range 21 .. 21;
      FSUSPM          at 0 range 22 .. 22;
      Reserved_23_23  at 0 range 23 .. 23;
      PRTIM           at 0 range 24 .. 24;
      HCIM            at 0 range 25 .. 25;
      PTXFEM          at 0 range 26 .. 26;
      Reserved_27_27  at 0 range 27 .. 27;
      CIDSCHGM        at 0 range 28 .. 28;
      DISCINT         at 0 range 29 .. 29;
      SRQIM           at 0 range 30 .. 30;
      WUIM            at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_GRXSTSR_Host_CHNUM_Field is STM32F40x.UInt4;
   subtype OTG_HS_GRXSTSR_Host_BCNT_Field is STM32F40x.UInt11;
   subtype OTG_HS_GRXSTSR_Host_DPID_Field is STM32F40x.UInt2;
   subtype OTG_HS_GRXSTSR_Host_PKTSTS_Field is STM32F40x.UInt4;

   --  OTG_HS Receive status debug read register (host mode)
   type OTG_HS_GRXSTSR_Host_Register is record
      --  Read-only. Channel number
      CHNUM          : OTG_HS_GRXSTSR_Host_CHNUM_Field;
      --  Read-only. Byte count
      BCNT           : OTG_HS_GRXSTSR_Host_BCNT_Field;
      --  Read-only. Data PID
      DPID           : OTG_HS_GRXSTSR_Host_DPID_Field;
      --  Read-only. Packet status
      PKTSTS         : OTG_HS_GRXSTSR_Host_PKTSTS_Field;
      --  unspecified
      Reserved_21_31 : STM32F40x.UInt11;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GRXSTSR_Host_Register use record
      CHNUM          at 0 range 0 .. 3;
      BCNT           at 0 range 4 .. 14;
      DPID           at 0 range 15 .. 16;
      PKTSTS         at 0 range 17 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype OTG_HS_GRXSTSR_Peripheral_EPNUM_Field is STM32F40x.UInt4;
   subtype OTG_HS_GRXSTSR_Peripheral_BCNT_Field is STM32F40x.UInt11;
   subtype OTG_HS_GRXSTSR_Peripheral_DPID_Field is STM32F40x.UInt2;
   subtype OTG_HS_GRXSTSR_Peripheral_PKTSTS_Field is STM32F40x.UInt4;
   subtype OTG_HS_GRXSTSR_Peripheral_FRMNUM_Field is STM32F40x.UInt4;

   --  OTG_HS Receive status debug read register (peripheral mode mode)
   type OTG_HS_GRXSTSR_Peripheral_Register is record
      --  Read-only. Endpoint number
      EPNUM          : OTG_HS_GRXSTSR_Peripheral_EPNUM_Field;
      --  Read-only. Byte count
      BCNT           : OTG_HS_GRXSTSR_Peripheral_BCNT_Field;
      --  Read-only. Data PID
      DPID           : OTG_HS_GRXSTSR_Peripheral_DPID_Field;
      --  Read-only. Packet status
      PKTSTS         : OTG_HS_GRXSTSR_Peripheral_PKTSTS_Field;
      --  Read-only. Frame number
      FRMNUM         : OTG_HS_GRXSTSR_Peripheral_FRMNUM_Field;
      --  unspecified
      Reserved_25_31 : STM32F40x.UInt7;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GRXSTSR_Peripheral_Register use record
      EPNUM          at 0 range 0 .. 3;
      BCNT           at 0 range 4 .. 14;
      DPID           at 0 range 15 .. 16;
      PKTSTS         at 0 range 17 .. 20;
      FRMNUM         at 0 range 21 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype OTG_HS_GRXSTSP_Host_CHNUM_Field is STM32F40x.UInt4;
   subtype OTG_HS_GRXSTSP_Host_BCNT_Field is STM32F40x.UInt11;
   subtype OTG_HS_GRXSTSP_Host_DPID_Field is STM32F40x.UInt2;
   subtype OTG_HS_GRXSTSP_Host_PKTSTS_Field is STM32F40x.UInt4;

   --  OTG_HS status read and pop register (host mode)
   type OTG_HS_GRXSTSP_Host_Register is record
      --  Read-only. Channel number
      CHNUM          : OTG_HS_GRXSTSP_Host_CHNUM_Field;
      --  Read-only. Byte count
      BCNT           : OTG_HS_GRXSTSP_Host_BCNT_Field;
      --  Read-only. Data PID
      DPID           : OTG_HS_GRXSTSP_Host_DPID_Field;
      --  Read-only. Packet status
      PKTSTS         : OTG_HS_GRXSTSP_Host_PKTSTS_Field;
      --  unspecified
      Reserved_21_31 : STM32F40x.UInt11;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GRXSTSP_Host_Register use record
      CHNUM          at 0 range 0 .. 3;
      BCNT           at 0 range 4 .. 14;
      DPID           at 0 range 15 .. 16;
      PKTSTS         at 0 range 17 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype OTG_HS_GRXSTSP_Peripheral_EPNUM_Field is STM32F40x.UInt4;
   subtype OTG_HS_GRXSTSP_Peripheral_BCNT_Field is STM32F40x.UInt11;
   subtype OTG_HS_GRXSTSP_Peripheral_DPID_Field is STM32F40x.UInt2;
   subtype OTG_HS_GRXSTSP_Peripheral_PKTSTS_Field is STM32F40x.UInt4;
   subtype OTG_HS_GRXSTSP_Peripheral_FRMNUM_Field is STM32F40x.UInt4;

   --  OTG_HS status read and pop register (peripheral mode)
   type OTG_HS_GRXSTSP_Peripheral_Register is record
      --  Read-only. Endpoint number
      EPNUM          : OTG_HS_GRXSTSP_Peripheral_EPNUM_Field;
      --  Read-only. Byte count
      BCNT           : OTG_HS_GRXSTSP_Peripheral_BCNT_Field;
      --  Read-only. Data PID
      DPID           : OTG_HS_GRXSTSP_Peripheral_DPID_Field;
      --  Read-only. Packet status
      PKTSTS         : OTG_HS_GRXSTSP_Peripheral_PKTSTS_Field;
      --  Read-only. Frame number
      FRMNUM         : OTG_HS_GRXSTSP_Peripheral_FRMNUM_Field;
      --  unspecified
      Reserved_25_31 : STM32F40x.UInt7;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GRXSTSP_Peripheral_Register use record
      EPNUM          at 0 range 0 .. 3;
      BCNT           at 0 range 4 .. 14;
      DPID           at 0 range 15 .. 16;
      PKTSTS         at 0 range 17 .. 20;
      FRMNUM         at 0 range 21 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype OTG_HS_GRXFSIZ_RXFD_Field is STM32F40x.UInt16;

   --  OTG_HS Receive FIFO size register
   type OTG_HS_GRXFSIZ_Register is record
      --  RxFIFO depth
      RXFD           : OTG_HS_GRXFSIZ_RXFD_Field := 16#200#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GRXFSIZ_Register use record
      RXFD           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_GNPTXFSIZ_Host_NPTXFSA_Field is STM32F40x.UInt16;
   subtype OTG_HS_GNPTXFSIZ_Host_NPTXFD_Field is STM32F40x.UInt16;

   --  OTG_HS nonperiodic transmit FIFO size register (host mode)
   type OTG_HS_GNPTXFSIZ_Host_Register is record
      --  Nonperiodic transmit RAM start address
      NPTXFSA : OTG_HS_GNPTXFSIZ_Host_NPTXFSA_Field := 16#200#;
      --  Nonperiodic TxFIFO depth
      NPTXFD  : OTG_HS_GNPTXFSIZ_Host_NPTXFD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GNPTXFSIZ_Host_Register use record
      NPTXFSA at 0 range 0 .. 15;
      NPTXFD  at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_TX0FSIZ_Peripheral_TX0FSA_Field is STM32F40x.UInt16;
   subtype OTG_HS_TX0FSIZ_Peripheral_TX0FD_Field is STM32F40x.UInt16;

   --  Endpoint 0 transmit FIFO size (peripheral mode)
   type OTG_HS_TX0FSIZ_Peripheral_Register is record
      --  Endpoint 0 transmit RAM start address
      TX0FSA : OTG_HS_TX0FSIZ_Peripheral_TX0FSA_Field := 16#200#;
      --  Endpoint 0 TxFIFO depth
      TX0FD  : OTG_HS_TX0FSIZ_Peripheral_TX0FD_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_TX0FSIZ_Peripheral_Register use record
      TX0FSA at 0 range 0 .. 15;
      TX0FD  at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_GNPTXSTS_NPTXFSAV_Field is STM32F40x.UInt16;
   subtype OTG_HS_GNPTXSTS_NPTQXSAV_Field is STM32F40x.Byte;
   subtype OTG_HS_GNPTXSTS_NPTXQTOP_Field is STM32F40x.UInt7;

   --  OTG_HS nonperiodic transmit FIFO/queue status register
   type OTG_HS_GNPTXSTS_Register is record
      --  Read-only. Nonperiodic TxFIFO space available
      NPTXFSAV       : OTG_HS_GNPTXSTS_NPTXFSAV_Field;
      --  Read-only. Nonperiodic transmit request queue space available
      NPTQXSAV       : OTG_HS_GNPTXSTS_NPTQXSAV_Field;
      --  Read-only. Top of the nonperiodic transmit request queue
      NPTXQTOP       : OTG_HS_GNPTXSTS_NPTXQTOP_Field;
      --  unspecified
      Reserved_31_31 : STM32F40x.Bit;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GNPTXSTS_Register use record
      NPTXFSAV       at 0 range 0 .. 15;
      NPTQXSAV       at 0 range 16 .. 23;
      NPTXQTOP       at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_GCCFG_PWRDWN_Field is STM32F40x.Bit;
   subtype OTG_HS_GCCFG_I2CPADEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GCCFG_VBUSASEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GCCFG_VBUSBSEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GCCFG_SOFOUTEN_Field is STM32F40x.Bit;
   subtype OTG_HS_GCCFG_NOVBUSSENS_Field is STM32F40x.Bit;

   --  OTG_HS general core configuration register
   type OTG_HS_GCCFG_Register is record
      --  unspecified
      Reserved_0_15  : STM32F40x.UInt16 := 16#0#;
      --  Power down
      PWRDWN         : OTG_HS_GCCFG_PWRDWN_Field := 16#0#;
      --  Enable I2C bus connection for the external I2C PHY interface
      I2CPADEN       : OTG_HS_GCCFG_I2CPADEN_Field := 16#0#;
      --  Enable the VBUS sensing device
      VBUSASEN       : OTG_HS_GCCFG_VBUSASEN_Field := 16#0#;
      --  Enable the VBUS sensing device
      VBUSBSEN       : OTG_HS_GCCFG_VBUSBSEN_Field := 16#0#;
      --  SOF output enable
      SOFOUTEN       : OTG_HS_GCCFG_SOFOUTEN_Field := 16#0#;
      --  VBUS sensing disable option
      NOVBUSSENS     : OTG_HS_GCCFG_NOVBUSSENS_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : STM32F40x.UInt10 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_GCCFG_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      PWRDWN         at 0 range 16 .. 16;
      I2CPADEN       at 0 range 17 .. 17;
      VBUSASEN       at 0 range 18 .. 18;
      VBUSBSEN       at 0 range 19 .. 19;
      SOFOUTEN       at 0 range 20 .. 20;
      NOVBUSSENS     at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype OTG_HS_HPTXFSIZ_PTXSA_Field is STM32F40x.UInt16;
   subtype OTG_HS_HPTXFSIZ_PTXFD_Field is STM32F40x.UInt16;

   --  OTG_HS Host periodic transmit FIFO size register
   type OTG_HS_HPTXFSIZ_Register is record
      --  Host periodic TxFIFO start address
      PTXSA : OTG_HS_HPTXFSIZ_PTXSA_Field := 16#600#;
      --  Host periodic TxFIFO depth
      PTXFD : OTG_HS_HPTXFSIZ_PTXFD_Field := 16#200#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HPTXFSIZ_Register use record
      PTXSA at 0 range 0 .. 15;
      PTXFD at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_DIEPTXF_INEPTXSA_Field is STM32F40x.UInt16;
   subtype OTG_HS_DIEPTXF_INEPTXFD_Field is STM32F40x.UInt16;

   --  OTG_HS device IN endpoint transmit FIFO size register
   type OTG_HS_DIEPTXF_Register is record
      --  IN endpoint FIFOx transmit RAM start address
      INEPTXSA : OTG_HS_DIEPTXF_INEPTXSA_Field := 16#400#;
      --  IN endpoint TxFIFO depth
      INEPTXFD : OTG_HS_DIEPTXF_INEPTXFD_Field := 16#200#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_DIEPTXF_Register use record
      INEPTXSA at 0 range 0 .. 15;
      INEPTXFD at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_HCFG_FSLSPCS_Field is STM32F40x.UInt2;
   subtype OTG_HS_HCFG_FSLSS_Field is STM32F40x.Bit;

   --  OTG_HS host configuration register
   type OTG_HS_HCFG_Register is record
      --  FS/LS PHY clock select
      FSLSPCS       : OTG_HS_HCFG_FSLSPCS_Field := 16#0#;
      --  Read-only. FS- and LS-only support
      FSLSS         : OTG_HS_HCFG_FSLSS_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32F40x.UInt29 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HCFG_Register use record
      FSLSPCS       at 0 range 0 .. 1;
      FSLSS         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype OTG_HS_HFIR_FRIVL_Field is STM32F40x.UInt16;

   --  OTG_HS Host frame interval register
   type OTG_HS_HFIR_Register is record
      --  Frame interval
      FRIVL          : OTG_HS_HFIR_FRIVL_Field := 16#EA60#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HFIR_Register use record
      FRIVL          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_HFNUM_FRNUM_Field is STM32F40x.UInt16;
   subtype OTG_HS_HFNUM_FTREM_Field is STM32F40x.UInt16;

   --  OTG_HS host frame number/frame time remaining register
   type OTG_HS_HFNUM_Register is record
      --  Read-only. Frame number
      FRNUM : OTG_HS_HFNUM_FRNUM_Field;
      --  Read-only. Frame time remaining
      FTREM : OTG_HS_HFNUM_FTREM_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HFNUM_Register use record
      FRNUM at 0 range 0 .. 15;
      FTREM at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_HPTXSTS_PTXFSAVL_Field is STM32F40x.UInt16;
   subtype OTG_HS_HPTXSTS_PTXQSAV_Field is STM32F40x.Byte;
   subtype OTG_HS_HPTXSTS_PTXQTOP_Field is STM32F40x.Byte;

   --  OTG_HS_Host periodic transmit FIFO/queue status register
   type OTG_HS_HPTXSTS_Register is record
      --  Periodic transmit data FIFO space available
      PTXFSAVL : OTG_HS_HPTXSTS_PTXFSAVL_Field := 16#100#;
      --  Read-only. Periodic transmit request queue space available
      PTXQSAV  : OTG_HS_HPTXSTS_PTXQSAV_Field := 16#8#;
      --  Read-only. Top of the periodic transmit request queue
      PTXQTOP  : OTG_HS_HPTXSTS_PTXQTOP_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HPTXSTS_Register use record
      PTXFSAVL at 0 range 0 .. 15;
      PTXQSAV  at 0 range 16 .. 23;
      PTXQTOP  at 0 range 24 .. 31;
   end record;

   subtype OTG_HS_HAINT_HAINT_Field is STM32F40x.UInt16;

   --  OTG_HS Host all channels interrupt register
   type OTG_HS_HAINT_Register is record
      --  Read-only. Channel interrupts
      HAINT          : OTG_HS_HAINT_HAINT_Field;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HAINT_Register use record
      HAINT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_HAINTMSK_HAINTM_Field is STM32F40x.UInt16;

   --  OTG_HS host all channels interrupt mask register
   type OTG_HS_HAINTMSK_Register is record
      --  Channel interrupt mask
      HAINTM         : OTG_HS_HAINTMSK_HAINTM_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32F40x.UInt16 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HAINTMSK_Register use record
      HAINTM         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OTG_HS_HPRT_PCSTS_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PCDET_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PENA_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PENCHNG_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_POCA_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_POCCHNG_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PRES_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PSUSP_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PRST_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PLSTS_Field is STM32F40x.UInt2;
   subtype OTG_HS_HPRT_PPWR_Field is STM32F40x.Bit;
   subtype OTG_HS_HPRT_PTCTL_Field is STM32F40x.UInt4;
   subtype OTG_HS_HPRT_PSPD_Field is STM32F40x.UInt2;

   --  OTG_HS host port control and status register
   type OTG_HS_HPRT_Register is record
      --  Read-only. Port connect status
      PCSTS          : OTG_HS_HPRT_PCSTS_Field := 16#0#;
      --  Port connect detected
      PCDET          : OTG_HS_HPRT_PCDET_Field := 16#0#;
      --  Port enable
      PENA           : OTG_HS_HPRT_PENA_Field := 16#0#;
      --  Port enable/disable change
      PENCHNG        : OTG_HS_HPRT_PENCHNG_Field := 16#0#;
      --  Read-only. Port overcurrent active
      POCA           : OTG_HS_HPRT_POCA_Field := 16#0#;
      --  Port overcurrent change
      POCCHNG        : OTG_HS_HPRT_POCCHNG_Field := 16#0#;
      --  Port resume
      PRES           : OTG_HS_HPRT_PRES_Field := 16#0#;
      --  Port suspend
      PSUSP          : OTG_HS_HPRT_PSUSP_Field := 16#0#;
      --  Port reset
      PRST           : OTG_HS_HPRT_PRST_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : STM32F40x.Bit := 16#0#;
      --  Read-only. Port line status
      PLSTS          : OTG_HS_HPRT_PLSTS_Field := 16#0#;
      --  Port power
      PPWR           : OTG_HS_HPRT_PPWR_Field := 16#0#;
      --  Port test control
      PTCTL          : OTG_HS_HPRT_PTCTL_Field := 16#0#;
      --  Read-only. Port speed
      PSPD           : OTG_HS_HPRT_PSPD_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : STM32F40x.UInt13 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HPRT_Register use record
      PCSTS          at 0 range 0 .. 0;
      PCDET          at 0 range 1 .. 1;
      PENA           at 0 range 2 .. 2;
      PENCHNG        at 0 range 3 .. 3;
      POCA           at 0 range 4 .. 4;
      POCCHNG        at 0 range 5 .. 5;
      PRES           at 0 range 6 .. 6;
      PSUSP          at 0 range 7 .. 7;
      PRST           at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      PLSTS          at 0 range 10 .. 11;
      PPWR           at 0 range 12 .. 12;
      PTCTL          at 0 range 13 .. 16;
      PSPD           at 0 range 17 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype OTG_HS_HCCHAR_MPSIZ_Field is STM32F40x.UInt11;
   subtype OTG_HS_HCCHAR_EPNUM_Field is STM32F40x.UInt4;
   subtype OTG_HS_HCCHAR_EPDIR_Field is STM32F40x.Bit;
   subtype OTG_HS_HCCHAR_LSDEV_Field is STM32F40x.Bit;
   subtype OTG_HS_HCCHAR_EPTYP_Field is STM32F40x.UInt2;
   subtype OTG_HS_HCCHAR_MC_Field is STM32F40x.UInt2;
   subtype OTG_HS_HCCHAR_DAD_Field is STM32F40x.UInt7;
   subtype OTG_HS_HCCHAR_ODDFRM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCCHAR_CHDIS_Field is STM32F40x.Bit;
   subtype OTG_HS_HCCHAR_CHENA_Field is STM32F40x.Bit;

   --  OTG_HS host channel-0 characteristics register
   type OTG_HS_HCCHAR_Register is record
      --  Maximum packet size
      MPSIZ          : OTG_HS_HCCHAR_MPSIZ_Field := 16#0#;
      --  Endpoint number
      EPNUM          : OTG_HS_HCCHAR_EPNUM_Field := 16#0#;
      --  Endpoint direction
      EPDIR          : OTG_HS_HCCHAR_EPDIR_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : STM32F40x.Bit := 16#0#;
      --  Low-speed device
      LSDEV          : OTG_HS_HCCHAR_LSDEV_Field := 16#0#;
      --  Endpoint type
      EPTYP          : OTG_HS_HCCHAR_EPTYP_Field := 16#0#;
      --  Multi Count (MC) / Error Count (EC)
      MC             : OTG_HS_HCCHAR_MC_Field := 16#0#;
      --  Device address
      DAD            : OTG_HS_HCCHAR_DAD_Field := 16#0#;
      --  Odd frame
      ODDFRM         : OTG_HS_HCCHAR_ODDFRM_Field := 16#0#;
      --  Channel disable
      CHDIS          : OTG_HS_HCCHAR_CHDIS_Field := 16#0#;
      --  Channel enable
      CHENA          : OTG_HS_HCCHAR_CHENA_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HCCHAR_Register use record
      MPSIZ          at 0 range 0 .. 10;
      EPNUM          at 0 range 11 .. 14;
      EPDIR          at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      LSDEV          at 0 range 17 .. 17;
      EPTYP          at 0 range 18 .. 19;
      MC             at 0 range 20 .. 21;
      DAD            at 0 range 22 .. 28;
      ODDFRM         at 0 range 29 .. 29;
      CHDIS          at 0 range 30 .. 30;
      CHENA          at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_HCSPLT_PRTADDR_Field is STM32F40x.UInt7;
   subtype OTG_HS_HCSPLT_HUBADDR_Field is STM32F40x.UInt7;
   subtype OTG_HS_HCSPLT_XACTPOS_Field is STM32F40x.UInt2;
   subtype OTG_HS_HCSPLT_COMPLSPLT_Field is STM32F40x.Bit;
   subtype OTG_HS_HCSPLT_SPLITEN_Field is STM32F40x.Bit;

   --  OTG_HS host channel-0 split control register
   type OTG_HS_HCSPLT_Register is record
      --  Port address
      PRTADDR        : OTG_HS_HCSPLT_PRTADDR_Field := 16#0#;
      --  Hub address
      HUBADDR        : OTG_HS_HCSPLT_HUBADDR_Field := 16#0#;
      --  XACTPOS
      XACTPOS        : OTG_HS_HCSPLT_XACTPOS_Field := 16#0#;
      --  Do complete split
      COMPLSPLT      : OTG_HS_HCSPLT_COMPLSPLT_Field := 16#0#;
      --  unspecified
      Reserved_17_30 : STM32F40x.UInt14 := 16#0#;
      --  Split enable
      SPLITEN        : OTG_HS_HCSPLT_SPLITEN_Field := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HCSPLT_Register use record
      PRTADDR        at 0 range 0 .. 6;
      HUBADDR        at 0 range 7 .. 13;
      XACTPOS        at 0 range 14 .. 15;
      COMPLSPLT      at 0 range 16 .. 16;
      Reserved_17_30 at 0 range 17 .. 30;
      SPLITEN        at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_HCINT_XFRC_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_CHH_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_AHBERR_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_STALL_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_NAK_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_ACK_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_NYET_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_TXERR_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_BBERR_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_FRMOR_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINT_DTERR_Field is STM32F40x.Bit;

   --  OTG_HS host channel-11 interrupt register
   type OTG_HS_HCINT_Register is record
      --  Transfer completed
      XFRC           : OTG_HS_HCINT_XFRC_Field := 16#0#;
      --  Channel halted
      CHH            : OTG_HS_HCINT_CHH_Field := 16#0#;
      --  AHB error
      AHBERR         : OTG_HS_HCINT_AHBERR_Field := 16#0#;
      --  STALL response received interrupt
      STALL          : OTG_HS_HCINT_STALL_Field := 16#0#;
      --  NAK response received interrupt
      NAK            : OTG_HS_HCINT_NAK_Field := 16#0#;
      --  ACK response received/transmitted interrupt
      ACK            : OTG_HS_HCINT_ACK_Field := 16#0#;
      --  Response received interrupt
      NYET           : OTG_HS_HCINT_NYET_Field := 16#0#;
      --  Transaction error
      TXERR          : OTG_HS_HCINT_TXERR_Field := 16#0#;
      --  Babble error
      BBERR          : OTG_HS_HCINT_BBERR_Field := 16#0#;
      --  Frame overrun
      FRMOR          : OTG_HS_HCINT_FRMOR_Field := 16#0#;
      --  Data toggle error
      DTERR          : OTG_HS_HCINT_DTERR_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32F40x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HCINT_Register use record
      XFRC           at 0 range 0 .. 0;
      CHH            at 0 range 1 .. 1;
      AHBERR         at 0 range 2 .. 2;
      STALL          at 0 range 3 .. 3;
      NAK            at 0 range 4 .. 4;
      ACK            at 0 range 5 .. 5;
      NYET           at 0 range 6 .. 6;
      TXERR          at 0 range 7 .. 7;
      BBERR          at 0 range 8 .. 8;
      FRMOR          at 0 range 9 .. 9;
      DTERR          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype OTG_HS_HCINTMSK_XFRCM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_CHHM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_AHBERR_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_STALLM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_NAKM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_ACKM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_NYET_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_TXERRM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_BBERRM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_FRMORM_Field is STM32F40x.Bit;
   subtype OTG_HS_HCINTMSK_DTERRM_Field is STM32F40x.Bit;

   --  OTG_HS host channel-11 interrupt mask register
   type OTG_HS_HCINTMSK_Register is record
      --  Transfer completed mask
      XFRCM          : OTG_HS_HCINTMSK_XFRCM_Field := 16#0#;
      --  Channel halted mask
      CHHM           : OTG_HS_HCINTMSK_CHHM_Field := 16#0#;
      --  AHB error
      AHBERR         : OTG_HS_HCINTMSK_AHBERR_Field := 16#0#;
      --  STALL response received interrupt mask
      STALLM         : OTG_HS_HCINTMSK_STALLM_Field := 16#0#;
      --  NAK response received interrupt mask
      NAKM           : OTG_HS_HCINTMSK_NAKM_Field := 16#0#;
      --  ACK response received/transmitted interrupt mask
      ACKM           : OTG_HS_HCINTMSK_ACKM_Field := 16#0#;
      --  response received interrupt mask
      NYET           : OTG_HS_HCINTMSK_NYET_Field := 16#0#;
      --  Transaction error mask
      TXERRM         : OTG_HS_HCINTMSK_TXERRM_Field := 16#0#;
      --  Babble error mask
      BBERRM         : OTG_HS_HCINTMSK_BBERRM_Field := 16#0#;
      --  Frame overrun mask
      FRMORM         : OTG_HS_HCINTMSK_FRMORM_Field := 16#0#;
      --  Data toggle error mask
      DTERRM         : OTG_HS_HCINTMSK_DTERRM_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32F40x.UInt21 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HCINTMSK_Register use record
      XFRCM          at 0 range 0 .. 0;
      CHHM           at 0 range 1 .. 1;
      AHBERR         at 0 range 2 .. 2;
      STALLM         at 0 range 3 .. 3;
      NAKM           at 0 range 4 .. 4;
      ACKM           at 0 range 5 .. 5;
      NYET           at 0 range 6 .. 6;
      TXERRM         at 0 range 7 .. 7;
      BBERRM         at 0 range 8 .. 8;
      FRMORM         at 0 range 9 .. 9;
      DTERRM         at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype OTG_HS_HCTSIZ_XFRSIZ_Field is STM32F40x.UInt19;
   subtype OTG_HS_HCTSIZ_PKTCNT_Field is STM32F40x.UInt10;
   subtype OTG_HS_HCTSIZ_DPID_Field is STM32F40x.UInt2;

   --  OTG_HS host channel-11 transfer size register
   type OTG_HS_HCTSIZ_Register is record
      --  Transfer size
      XFRSIZ         : OTG_HS_HCTSIZ_XFRSIZ_Field := 16#0#;
      --  Packet count
      PKTCNT         : OTG_HS_HCTSIZ_PKTCNT_Field := 16#0#;
      --  Data PID
      DPID           : OTG_HS_HCTSIZ_DPID_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32F40x.Bit := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_HCTSIZ_Register use record
      XFRSIZ         at 0 range 0 .. 18;
      PKTCNT         at 0 range 19 .. 28;
      DPID           at 0 range 29 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype OTG_HS_PCGCR_STPPCLK_Field is STM32F40x.Bit;
   subtype OTG_HS_PCGCR_GATEHCLK_Field is STM32F40x.Bit;
   subtype OTG_HS_PCGCR_PHYSUSP_Field is STM32F40x.Bit;

   --  Power and clock gating control register
   type OTG_HS_PCGCR_Register is record
      --  Stop PHY clock
      STPPCLK       : OTG_HS_PCGCR_STPPCLK_Field := 16#0#;
      --  Gate HCLK
      GATEHCLK      : OTG_HS_PCGCR_GATEHCLK_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : STM32F40x.UInt2 := 16#0#;
      --  PHY suspended
      PHYSUSP       : OTG_HS_PCGCR_PHYSUSP_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : STM32F40x.UInt27 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for OTG_HS_PCGCR_Register use record
      STPPCLK       at 0 range 0 .. 0;
      GATEHCLK      at 0 range 1 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      PHYSUSP       at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USB on the go high speed
   type OTG_HS_DEVICE_Peripheral is record
      --  OTG_HS device configuration register
      OTG_HS_DCFG         : aliased OTG_HS_DCFG_Register;
      pragma Volatile_Full_Access (OTG_HS_DCFG);
      --  OTG_HS device control register
      OTG_HS_DCTL         : aliased OTG_HS_DCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DCTL);
      --  OTG_HS device status register
      OTG_HS_DSTS         : aliased OTG_HS_DSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DSTS);
      --  OTG_HS device IN endpoint common interrupt mask register
      OTG_HS_DIEPMSK      : aliased OTG_HS_DIEPMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPMSK);
      --  OTG_HS device OUT endpoint common interrupt mask register
      OTG_HS_DOEPMSK      : aliased OTG_HS_DOEPMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPMSK);
      --  OTG_HS device all endpoints interrupt register
      OTG_HS_DAINT        : aliased OTG_HS_DAINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DAINT);
      --  OTG_HS all endpoints interrupt mask register
      OTG_HS_DAINTMSK     : aliased OTG_HS_DAINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_DAINTMSK);
      --  OTG_HS device VBUS discharge time register
      OTG_HS_DVBUSDIS     : aliased OTG_HS_DVBUSDIS_Register;
      pragma Volatile_Full_Access (OTG_HS_DVBUSDIS);
      --  OTG_HS device VBUS pulsing time register
      OTG_HS_DVBUSPULSE   : aliased OTG_HS_DVBUSPULSE_Register;
      pragma Volatile_Full_Access (OTG_HS_DVBUSPULSE);
      --  OTG_HS Device threshold control register
      OTG_HS_DTHRCTL      : aliased OTG_HS_DTHRCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DTHRCTL);
      --  OTG_HS device IN endpoint FIFO empty interrupt mask register
      OTG_HS_DIEPEMPMSK   : aliased OTG_HS_DIEPEMPMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPEMPMSK);
      --  OTG_HS device each endpoint interrupt register
      OTG_HS_DEACHINT     : aliased OTG_HS_DEACHINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DEACHINT);
      --  OTG_HS device each endpoint interrupt register mask
      OTG_HS_DEACHINTMSK  : aliased OTG_HS_DEACHINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_DEACHINTMSK);
      --  OTG_HS device each in endpoint-1 interrupt register
      OTG_HS_DIEPEACHMSK1 : aliased OTG_HS_DIEPEACHMSK1_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPEACHMSK1);
      --  OTG_HS device each OUT endpoint-1 interrupt register
      OTG_HS_DOEPEACHMSK1 : aliased OTG_HS_DOEPEACHMSK1_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPEACHMSK1);
      --  OTG device endpoint-0 control register
      OTG_HS_DIEPCTL0     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL0);
      --  OTG device endpoint-0 interrupt register
      OTG_HS_DIEPINT0     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT0);
      --  OTG_HS device IN endpoint 0 transfer size register
      OTG_HS_DIEPTSIZ0    : aliased OTG_HS_DIEPTSIZ0_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTSIZ0);
      --  OTG_HS device endpoint-1 DMA address register
      OTG_HS_DIEPDMA1     : aliased STM32F40x.UInt32;
      --  OTG_HS device IN endpoint transmit FIFO status register
      OTG_HS_DTXFSTS0     : aliased OTG_HS_DTXFSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DTXFSTS0);
      --  OTG device endpoint-1 control register
      OTG_HS_DIEPCTL1     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL1);
      --  OTG device endpoint-1 interrupt register
      OTG_HS_DIEPINT1     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT1);
      --  OTG_HS device endpoint transfer size register
      OTG_HS_DIEPTSIZ1    : aliased OTG_HS_DIEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTSIZ1);
      --  OTG_HS device endpoint-2 DMA address register
      OTG_HS_DIEPDMA2     : aliased STM32F40x.UInt32;
      --  OTG_HS device IN endpoint transmit FIFO status register
      OTG_HS_DTXFSTS1     : aliased OTG_HS_DTXFSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DTXFSTS1);
      --  OTG device endpoint-2 control register
      OTG_HS_DIEPCTL2     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL2);
      --  OTG device endpoint-2 interrupt register
      OTG_HS_DIEPINT2     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT2);
      --  OTG_HS device endpoint transfer size register
      OTG_HS_DIEPTSIZ2    : aliased OTG_HS_DIEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTSIZ2);
      --  OTG_HS device endpoint-3 DMA address register
      OTG_HS_DIEPDMA3     : aliased STM32F40x.UInt32;
      --  OTG_HS device IN endpoint transmit FIFO status register
      OTG_HS_DTXFSTS2     : aliased OTG_HS_DTXFSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DTXFSTS2);
      --  OTG device endpoint-3 control register
      OTG_HS_DIEPCTL3     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL3);
      --  OTG device endpoint-3 interrupt register
      OTG_HS_DIEPINT3     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT3);
      --  OTG_HS device endpoint transfer size register
      OTG_HS_DIEPTSIZ3    : aliased OTG_HS_DIEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTSIZ3);
      --  OTG_HS device endpoint-4 DMA address register
      OTG_HS_DIEPDMA4     : aliased STM32F40x.UInt32;
      --  OTG_HS device IN endpoint transmit FIFO status register
      OTG_HS_DTXFSTS3     : aliased OTG_HS_DTXFSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DTXFSTS3);
      --  OTG device endpoint-4 control register
      OTG_HS_DIEPCTL4     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL4);
      --  OTG device endpoint-4 interrupt register
      OTG_HS_DIEPINT4     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT4);
      --  OTG_HS device endpoint transfer size register
      OTG_HS_DIEPTSIZ4    : aliased OTG_HS_DIEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTSIZ4);
      --  OTG_HS device endpoint-5 DMA address register
      OTG_HS_DIEPDMA5     : aliased STM32F40x.UInt32;
      --  OTG_HS device IN endpoint transmit FIFO status register
      OTG_HS_DTXFSTS4     : aliased OTG_HS_DTXFSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DTXFSTS4);
      --  OTG device endpoint-5 control register
      OTG_HS_DIEPCTL5     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL5);
      --  OTG device endpoint-5 interrupt register
      OTG_HS_DIEPINT5     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT5);
      --  OTG_HS device endpoint transfer size register
      OTG_HS_DIEPTSIZ5    : aliased OTG_HS_DIEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTSIZ5);
      --  OTG_HS device IN endpoint transmit FIFO status register
      OTG_HS_DTXFSTS5     : aliased OTG_HS_DTXFSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_DTXFSTS5);
      --  OTG device endpoint-6 control register
      OTG_HS_DIEPCTL6     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL6);
      --  OTG device endpoint-6 interrupt register
      OTG_HS_DIEPINT6     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT6);
      --  OTG device endpoint-7 control register
      OTG_HS_DIEPCTL7     : aliased OTG_HS_DIEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPCTL7);
      --  OTG device endpoint-7 interrupt register
      OTG_HS_DIEPINT7     : aliased OTG_HS_DIEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPINT7);
      --  OTG_HS device control OUT endpoint 0 control register
      OTG_HS_DOEPCTL0     : aliased OTG_HS_DOEPCTL0_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPCTL0);
      --  OTG_HS device endpoint-0 interrupt register
      OTG_HS_DOEPINT0     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT0);
      --  OTG_HS device endpoint-1 transfer size register
      OTG_HS_DOEPTSIZ0    : aliased OTG_HS_DOEPTSIZ0_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPTSIZ0);
      --  OTG device endpoint-1 control register
      OTG_HS_DOEPCTL1     : aliased OTG_HS_DOEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPCTL1);
      --  OTG_HS device endpoint-1 interrupt register
      OTG_HS_DOEPINT1     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT1);
      --  OTG_HS device endpoint-2 transfer size register
      OTG_HS_DOEPTSIZ1    : aliased OTG_HS_DOEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPTSIZ1);
      --  OTG device endpoint-2 control register
      OTG_HS_DOEPCTL2     : aliased OTG_HS_DOEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPCTL2);
      --  OTG_HS device endpoint-2 interrupt register
      OTG_HS_DOEPINT2     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT2);
      --  OTG_HS device endpoint-3 transfer size register
      OTG_HS_DOEPTSIZ2    : aliased OTG_HS_DOEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPTSIZ2);
      --  OTG device endpoint-3 control register
      OTG_HS_DOEPCTL3     : aliased OTG_HS_DOEPCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPCTL3);
      --  OTG_HS device endpoint-3 interrupt register
      OTG_HS_DOEPINT3     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT3);
      --  OTG_HS device endpoint-4 transfer size register
      OTG_HS_DOEPTSIZ3    : aliased OTG_HS_DOEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPTSIZ3);
      --  OTG_HS device endpoint-4 interrupt register
      OTG_HS_DOEPINT4     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT4);
      --  OTG_HS device endpoint-5 transfer size register
      OTG_HS_DOEPTSIZ4    : aliased OTG_HS_DOEPTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPTSIZ4);
      --  OTG_HS device endpoint-5 interrupt register
      OTG_HS_DOEPINT5     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT5);
      --  OTG_HS device endpoint-6 interrupt register
      OTG_HS_DOEPINT6     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT6);
      --  OTG_HS device endpoint-7 interrupt register
      OTG_HS_DOEPINT7     : aliased OTG_HS_DOEPINT_Register;
      pragma Volatile_Full_Access (OTG_HS_DOEPINT7);
   end record
     with Volatile;

   for OTG_HS_DEVICE_Peripheral use record
      OTG_HS_DCFG         at 16#0# range 0 .. 31;
      OTG_HS_DCTL         at 16#4# range 0 .. 31;
      OTG_HS_DSTS         at 16#8# range 0 .. 31;
      OTG_HS_DIEPMSK      at 16#10# range 0 .. 31;
      OTG_HS_DOEPMSK      at 16#14# range 0 .. 31;
      OTG_HS_DAINT        at 16#18# range 0 .. 31;
      OTG_HS_DAINTMSK     at 16#1C# range 0 .. 31;
      OTG_HS_DVBUSDIS     at 16#28# range 0 .. 31;
      OTG_HS_DVBUSPULSE   at 16#2C# range 0 .. 31;
      OTG_HS_DTHRCTL      at 16#30# range 0 .. 31;
      OTG_HS_DIEPEMPMSK   at 16#34# range 0 .. 31;
      OTG_HS_DEACHINT     at 16#38# range 0 .. 31;
      OTG_HS_DEACHINTMSK  at 16#3C# range 0 .. 31;
      OTG_HS_DIEPEACHMSK1 at 16#40# range 0 .. 31;
      OTG_HS_DOEPEACHMSK1 at 16#80# range 0 .. 31;
      OTG_HS_DIEPCTL0     at 16#100# range 0 .. 31;
      OTG_HS_DIEPINT0     at 16#108# range 0 .. 31;
      OTG_HS_DIEPTSIZ0    at 16#110# range 0 .. 31;
      OTG_HS_DIEPDMA1     at 16#114# range 0 .. 31;
      OTG_HS_DTXFSTS0     at 16#118# range 0 .. 31;
      OTG_HS_DIEPCTL1     at 16#120# range 0 .. 31;
      OTG_HS_DIEPINT1     at 16#128# range 0 .. 31;
      OTG_HS_DIEPTSIZ1    at 16#130# range 0 .. 31;
      OTG_HS_DIEPDMA2     at 16#134# range 0 .. 31;
      OTG_HS_DTXFSTS1     at 16#138# range 0 .. 31;
      OTG_HS_DIEPCTL2     at 16#140# range 0 .. 31;
      OTG_HS_DIEPINT2     at 16#148# range 0 .. 31;
      OTG_HS_DIEPTSIZ2    at 16#150# range 0 .. 31;
      OTG_HS_DIEPDMA3     at 16#154# range 0 .. 31;
      OTG_HS_DTXFSTS2     at 16#158# range 0 .. 31;
      OTG_HS_DIEPCTL3     at 16#160# range 0 .. 31;
      OTG_HS_DIEPINT3     at 16#168# range 0 .. 31;
      OTG_HS_DIEPTSIZ3    at 16#170# range 0 .. 31;
      OTG_HS_DIEPDMA4     at 16#174# range 0 .. 31;
      OTG_HS_DTXFSTS3     at 16#178# range 0 .. 31;
      OTG_HS_DIEPCTL4     at 16#180# range 0 .. 31;
      OTG_HS_DIEPINT4     at 16#188# range 0 .. 31;
      OTG_HS_DIEPTSIZ4    at 16#190# range 0 .. 31;
      OTG_HS_DIEPDMA5     at 16#194# range 0 .. 31;
      OTG_HS_DTXFSTS4     at 16#198# range 0 .. 31;
      OTG_HS_DIEPCTL5     at 16#1A0# range 0 .. 31;
      OTG_HS_DIEPINT5     at 16#1A8# range 0 .. 31;
      OTG_HS_DIEPTSIZ5    at 16#1B0# range 0 .. 31;
      OTG_HS_DTXFSTS5     at 16#1B8# range 0 .. 31;
      OTG_HS_DIEPCTL6     at 16#1C0# range 0 .. 31;
      OTG_HS_DIEPINT6     at 16#1C8# range 0 .. 31;
      OTG_HS_DIEPCTL7     at 16#1E0# range 0 .. 31;
      OTG_HS_DIEPINT7     at 16#1E8# range 0 .. 31;
      OTG_HS_DOEPCTL0     at 16#300# range 0 .. 31;
      OTG_HS_DOEPINT0     at 16#308# range 0 .. 31;
      OTG_HS_DOEPTSIZ0    at 16#310# range 0 .. 31;
      OTG_HS_DOEPCTL1     at 16#320# range 0 .. 31;
      OTG_HS_DOEPINT1     at 16#328# range 0 .. 31;
      OTG_HS_DOEPTSIZ1    at 16#330# range 0 .. 31;
      OTG_HS_DOEPCTL2     at 16#340# range 0 .. 31;
      OTG_HS_DOEPINT2     at 16#348# range 0 .. 31;
      OTG_HS_DOEPTSIZ2    at 16#350# range 0 .. 31;
      OTG_HS_DOEPCTL3     at 16#360# range 0 .. 31;
      OTG_HS_DOEPINT3     at 16#368# range 0 .. 31;
      OTG_HS_DOEPTSIZ3    at 16#370# range 0 .. 31;
      OTG_HS_DOEPINT4     at 16#388# range 0 .. 31;
      OTG_HS_DOEPTSIZ4    at 16#390# range 0 .. 31;
      OTG_HS_DOEPINT5     at 16#3A8# range 0 .. 31;
      OTG_HS_DOEPINT6     at 16#3C8# range 0 .. 31;
      OTG_HS_DOEPINT7     at 16#3E8# range 0 .. 31;
   end record;

   --  USB on the go high speed
   OTG_HS_DEVICE_Periph : aliased OTG_HS_DEVICE_Peripheral
     with Import, Address => OTG_HS_DEVICE_Base;

   type OTG_HS_GLOBAL_Disc is
     (Host,
      Peripheral,
      Gnptxfsiz_Host,
      Tx0Fsiz_Peripheral);

   --  USB on the go high speed
   type OTG_HS_GLOBAL_Peripheral
     (Discriminent : OTG_HS_GLOBAL_Disc := Host)
   is record
      --  OTG_HS control and status register
      OTG_HS_GOTGCTL            : aliased OTG_HS_GOTGCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_GOTGCTL);
      --  OTG_HS interrupt register
      OTG_HS_GOTGINT            : aliased OTG_HS_GOTGINT_Register;
      pragma Volatile_Full_Access (OTG_HS_GOTGINT);
      --  OTG_HS AHB configuration register
      OTG_HS_GAHBCFG            : aliased OTG_HS_GAHBCFG_Register;
      pragma Volatile_Full_Access (OTG_HS_GAHBCFG);
      --  OTG_HS USB configuration register
      OTG_HS_GUSBCFG            : aliased OTG_HS_GUSBCFG_Register;
      pragma Volatile_Full_Access (OTG_HS_GUSBCFG);
      --  OTG_HS reset register
      OTG_HS_GRSTCTL            : aliased OTG_HS_GRSTCTL_Register;
      pragma Volatile_Full_Access (OTG_HS_GRSTCTL);
      --  OTG_HS core interrupt register
      OTG_HS_GINTSTS            : aliased OTG_HS_GINTSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_GINTSTS);
      --  OTG_HS interrupt mask register
      OTG_HS_GINTMSK            : aliased OTG_HS_GINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_GINTMSK);
      --  OTG_HS Receive FIFO size register
      OTG_HS_GRXFSIZ            : aliased OTG_HS_GRXFSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_GRXFSIZ);
      --  OTG_HS nonperiodic transmit FIFO/queue status register
      OTG_HS_GNPTXSTS           : aliased OTG_HS_GNPTXSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_GNPTXSTS);
      --  OTG_HS general core configuration register
      OTG_HS_GCCFG              : aliased OTG_HS_GCCFG_Register;
      pragma Volatile_Full_Access (OTG_HS_GCCFG);
      --  OTG_HS core ID register
      OTG_HS_CID                : aliased STM32F40x.UInt32;
      --  OTG_HS Host periodic transmit FIFO size register
      OTG_HS_HPTXFSIZ           : aliased OTG_HS_HPTXFSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HPTXFSIZ);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF1           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF1);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF2           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF2);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF3           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF3);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF4           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF4);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF5           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF5);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF6           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF6);
      --  OTG_HS device IN endpoint transmit FIFO size register
      OTG_HS_DIEPTXF7           : aliased OTG_HS_DIEPTXF_Register;
      pragma Volatile_Full_Access (OTG_HS_DIEPTXF7);
      case Discriminent is
         when Host =>
            --  OTG_HS Receive status debug read register (host mode)
            OTG_HS_GRXSTSR_Host : aliased OTG_HS_GRXSTSR_Host_Register;
            pragma Volatile_Full_Access (OTG_HS_GRXSTSR_Host);
            --  OTG_HS status read and pop register (host mode)
            OTG_HS_GRXSTSP_Host : aliased OTG_HS_GRXSTSP_Host_Register;
            pragma Volatile_Full_Access (OTG_HS_GRXSTSP_Host);
         when Peripheral =>
            --  OTG_HS Receive status debug read register (peripheral mode
            --  mode)
            OTG_HS_GRXSTSR_Peripheral : aliased OTG_HS_GRXSTSR_Peripheral_Register;
            pragma Volatile_Full_Access (OTG_HS_GRXSTSR_Peripheral);
            --  OTG_HS status read and pop register (peripheral mode)
            OTG_HS_GRXSTSP_Peripheral : aliased OTG_HS_GRXSTSP_Peripheral_Register;
            pragma Volatile_Full_Access (OTG_HS_GRXSTSP_Peripheral);
         when Gnptxfsiz_Host =>
            --  OTG_HS nonperiodic transmit FIFO size register (host mode)
            OTG_HS_GNPTXFSIZ_Host : aliased OTG_HS_GNPTXFSIZ_Host_Register;
            pragma Volatile_Full_Access (OTG_HS_GNPTXFSIZ_Host);
         when Tx0Fsiz_Peripheral =>
            --  Endpoint 0 transmit FIFO size (peripheral mode)
            OTG_HS_TX0FSIZ_Peripheral : aliased OTG_HS_TX0FSIZ_Peripheral_Register;
            pragma Volatile_Full_Access (OTG_HS_TX0FSIZ_Peripheral);
      end case;
   end record
     with Unchecked_Union, Volatile;

   for OTG_HS_GLOBAL_Peripheral use record
      OTG_HS_GOTGCTL            at 16#0# range 0 .. 31;
      OTG_HS_GOTGINT            at 16#4# range 0 .. 31;
      OTG_HS_GAHBCFG            at 16#8# range 0 .. 31;
      OTG_HS_GUSBCFG            at 16#C# range 0 .. 31;
      OTG_HS_GRSTCTL            at 16#10# range 0 .. 31;
      OTG_HS_GINTSTS            at 16#14# range 0 .. 31;
      OTG_HS_GINTMSK            at 16#18# range 0 .. 31;
      OTG_HS_GRXFSIZ            at 16#24# range 0 .. 31;
      OTG_HS_GNPTXSTS           at 16#2C# range 0 .. 31;
      OTG_HS_GCCFG              at 16#38# range 0 .. 31;
      OTG_HS_CID                at 16#3C# range 0 .. 31;
      OTG_HS_HPTXFSIZ           at 16#100# range 0 .. 31;
      OTG_HS_DIEPTXF1           at 16#104# range 0 .. 31;
      OTG_HS_DIEPTXF2           at 16#108# range 0 .. 31;
      OTG_HS_DIEPTXF3           at 16#11C# range 0 .. 31;
      OTG_HS_DIEPTXF4           at 16#120# range 0 .. 31;
      OTG_HS_DIEPTXF5           at 16#124# range 0 .. 31;
      OTG_HS_DIEPTXF6           at 16#128# range 0 .. 31;
      OTG_HS_DIEPTXF7           at 16#12C# range 0 .. 31;
      OTG_HS_GRXSTSR_Host       at 16#1C# range 0 .. 31;
      OTG_HS_GRXSTSP_Host       at 16#20# range 0 .. 31;
      OTG_HS_GRXSTSR_Peripheral at 16#1C# range 0 .. 31;
      OTG_HS_GRXSTSP_Peripheral at 16#20# range 0 .. 31;
      OTG_HS_GNPTXFSIZ_Host     at 16#28# range 0 .. 31;
      OTG_HS_TX0FSIZ_Peripheral at 16#28# range 0 .. 31;
   end record;

   --  USB on the go high speed
   OTG_HS_GLOBAL_Periph : aliased OTG_HS_GLOBAL_Peripheral
     with Import, Address => OTG_HS_GLOBAL_Base;

   --  USB on the go high speed
   type OTG_HS_HOST_Peripheral is record
      --  OTG_HS host configuration register
      OTG_HS_HCFG       : aliased OTG_HS_HCFG_Register;
      pragma Volatile_Full_Access (OTG_HS_HCFG);
      --  OTG_HS Host frame interval register
      OTG_HS_HFIR       : aliased OTG_HS_HFIR_Register;
      pragma Volatile_Full_Access (OTG_HS_HFIR);
      --  OTG_HS host frame number/frame time remaining register
      OTG_HS_HFNUM      : aliased OTG_HS_HFNUM_Register;
      pragma Volatile_Full_Access (OTG_HS_HFNUM);
      --  OTG_HS_Host periodic transmit FIFO/queue status register
      OTG_HS_HPTXSTS    : aliased OTG_HS_HPTXSTS_Register;
      pragma Volatile_Full_Access (OTG_HS_HPTXSTS);
      --  OTG_HS Host all channels interrupt register
      OTG_HS_HAINT      : aliased OTG_HS_HAINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HAINT);
      --  OTG_HS host all channels interrupt mask register
      OTG_HS_HAINTMSK   : aliased OTG_HS_HAINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HAINTMSK);
      --  OTG_HS host port control and status register
      OTG_HS_HPRT       : aliased OTG_HS_HPRT_Register;
      pragma Volatile_Full_Access (OTG_HS_HPRT);
      --  OTG_HS host channel-0 characteristics register
      OTG_HS_HCCHAR0    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR0);
      --  OTG_HS host channel-0 split control register
      OTG_HS_HCSPLT0    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT0);
      --  OTG_HS host channel-11 interrupt register
      OTG_HS_HCINT0     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT0);
      --  OTG_HS host channel-11 interrupt mask register
      OTG_HS_HCINTMSK0  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK0);
      --  OTG_HS host channel-11 transfer size register
      OTG_HS_HCTSIZ0    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ0);
      --  OTG_HS host channel-0 DMA address register
      OTG_HS_HCDMA0     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-1 characteristics register
      OTG_HS_HCCHAR1    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR1);
      --  OTG_HS host channel-1 split control register
      OTG_HS_HCSPLT1    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT1);
      --  OTG_HS host channel-1 interrupt register
      OTG_HS_HCINT1     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT1);
      --  OTG_HS host channel-1 interrupt mask register
      OTG_HS_HCINTMSK1  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK1);
      --  OTG_HS host channel-1 transfer size register
      OTG_HS_HCTSIZ1    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ1);
      --  OTG_HS host channel-1 DMA address register
      OTG_HS_HCDMA1     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-2 characteristics register
      OTG_HS_HCCHAR2    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR2);
      --  OTG_HS host channel-2 split control register
      OTG_HS_HCSPLT2    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT2);
      --  OTG_HS host channel-2 interrupt register
      OTG_HS_HCINT2     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT2);
      --  OTG_HS host channel-2 interrupt mask register
      OTG_HS_HCINTMSK2  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK2);
      --  OTG_HS host channel-2 transfer size register
      OTG_HS_HCTSIZ2    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ2);
      --  OTG_HS host channel-2 DMA address register
      OTG_HS_HCDMA2     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-3 characteristics register
      OTG_HS_HCCHAR3    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR3);
      --  OTG_HS host channel-3 split control register
      OTG_HS_HCSPLT3    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT3);
      --  OTG_HS host channel-3 interrupt register
      OTG_HS_HCINT3     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT3);
      --  OTG_HS host channel-3 interrupt mask register
      OTG_HS_HCINTMSK3  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK3);
      --  OTG_HS host channel-3 transfer size register
      OTG_HS_HCTSIZ3    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ3);
      --  OTG_HS host channel-3 DMA address register
      OTG_HS_HCDMA3     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-4 characteristics register
      OTG_HS_HCCHAR4    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR4);
      --  OTG_HS host channel-4 split control register
      OTG_HS_HCSPLT4    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT4);
      --  OTG_HS host channel-4 interrupt register
      OTG_HS_HCINT4     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT4);
      --  OTG_HS host channel-4 interrupt mask register
      OTG_HS_HCINTMSK4  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK4);
      --  OTG_HS host channel-4 transfer size register
      OTG_HS_HCTSIZ4    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ4);
      --  OTG_HS host channel-4 DMA address register
      OTG_HS_HCDMA4     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-5 characteristics register
      OTG_HS_HCCHAR5    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR5);
      --  OTG_HS host channel-5 split control register
      OTG_HS_HCSPLT5    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT5);
      --  OTG_HS host channel-5 interrupt register
      OTG_HS_HCINT5     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT5);
      --  OTG_HS host channel-5 interrupt mask register
      OTG_HS_HCINTMSK5  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK5);
      --  OTG_HS host channel-5 transfer size register
      OTG_HS_HCTSIZ5    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ5);
      --  OTG_HS host channel-5 DMA address register
      OTG_HS_HCDMA5     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-6 characteristics register
      OTG_HS_HCCHAR6    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR6);
      --  OTG_HS host channel-6 split control register
      OTG_HS_HCSPLT6    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT6);
      --  OTG_HS host channel-6 interrupt register
      OTG_HS_HCINT6     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT6);
      --  OTG_HS host channel-6 interrupt mask register
      OTG_HS_HCINTMSK6  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK6);
      --  OTG_HS host channel-6 transfer size register
      OTG_HS_HCTSIZ6    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ6);
      --  OTG_HS host channel-6 DMA address register
      OTG_HS_HCDMA6     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-7 characteristics register
      OTG_HS_HCCHAR7    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR7);
      --  OTG_HS host channel-7 split control register
      OTG_HS_HCSPLT7    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT7);
      --  OTG_HS host channel-7 interrupt register
      OTG_HS_HCINT7     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT7);
      --  OTG_HS host channel-7 interrupt mask register
      OTG_HS_HCINTMSK7  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK7);
      --  OTG_HS host channel-7 transfer size register
      OTG_HS_HCTSIZ7    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ7);
      --  OTG_HS host channel-7 DMA address register
      OTG_HS_HCDMA7     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-8 characteristics register
      OTG_HS_HCCHAR8    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR8);
      --  OTG_HS host channel-8 split control register
      OTG_HS_HCSPLT8    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT8);
      --  OTG_HS host channel-8 interrupt register
      OTG_HS_HCINT8     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT8);
      --  OTG_HS host channel-8 interrupt mask register
      OTG_HS_HCINTMSK8  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK8);
      --  OTG_HS host channel-8 transfer size register
      OTG_HS_HCTSIZ8    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ8);
      --  OTG_HS host channel-8 DMA address register
      OTG_HS_HCDMA8     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-9 characteristics register
      OTG_HS_HCCHAR9    : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR9);
      --  OTG_HS host channel-9 split control register
      OTG_HS_HCSPLT9    : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT9);
      --  OTG_HS host channel-9 interrupt register
      OTG_HS_HCINT9     : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT9);
      --  OTG_HS host channel-9 interrupt mask register
      OTG_HS_HCINTMSK9  : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK9);
      --  OTG_HS host channel-9 transfer size register
      OTG_HS_HCTSIZ9    : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ9);
      --  OTG_HS host channel-9 DMA address register
      OTG_HS_HCDMA9     : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-10 characteristics register
      OTG_HS_HCCHAR10   : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR10);
      --  OTG_HS host channel-10 split control register
      OTG_HS_HCSPLT10   : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT10);
      --  OTG_HS host channel-10 interrupt register
      OTG_HS_HCINT10    : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT10);
      --  OTG_HS host channel-10 interrupt mask register
      OTG_HS_HCINTMSK10 : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK10);
      --  OTG_HS host channel-10 transfer size register
      OTG_HS_HCTSIZ10   : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ10);
      --  OTG_HS host channel-10 DMA address register
      OTG_HS_HCDMA10    : aliased STM32F40x.UInt32;
      --  OTG_HS host channel-11 characteristics register
      OTG_HS_HCCHAR11   : aliased OTG_HS_HCCHAR_Register;
      pragma Volatile_Full_Access (OTG_HS_HCCHAR11);
      --  OTG_HS host channel-11 split control register
      OTG_HS_HCSPLT11   : aliased OTG_HS_HCSPLT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCSPLT11);
      --  OTG_HS host channel-11 interrupt register
      OTG_HS_HCINT11    : aliased OTG_HS_HCINT_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINT11);
      --  OTG_HS host channel-11 interrupt mask register
      OTG_HS_HCINTMSK11 : aliased OTG_HS_HCINTMSK_Register;
      pragma Volatile_Full_Access (OTG_HS_HCINTMSK11);
      --  OTG_HS host channel-11 transfer size register
      OTG_HS_HCTSIZ11   : aliased OTG_HS_HCTSIZ_Register;
      pragma Volatile_Full_Access (OTG_HS_HCTSIZ11);
      --  OTG_HS host channel-11 DMA address register
      OTG_HS_HCDMA11    : aliased STM32F40x.UInt32;
   end record
     with Volatile;

   for OTG_HS_HOST_Peripheral use record
      OTG_HS_HCFG       at 16#0# range 0 .. 31;
      OTG_HS_HFIR       at 16#4# range 0 .. 31;
      OTG_HS_HFNUM      at 16#8# range 0 .. 31;
      OTG_HS_HPTXSTS    at 16#10# range 0 .. 31;
      OTG_HS_HAINT      at 16#14# range 0 .. 31;
      OTG_HS_HAINTMSK   at 16#18# range 0 .. 31;
      OTG_HS_HPRT       at 16#40# range 0 .. 31;
      OTG_HS_HCCHAR0    at 16#100# range 0 .. 31;
      OTG_HS_HCSPLT0    at 16#104# range 0 .. 31;
      OTG_HS_HCINT0     at 16#108# range 0 .. 31;
      OTG_HS_HCINTMSK0  at 16#10C# range 0 .. 31;
      OTG_HS_HCTSIZ0    at 16#110# range 0 .. 31;
      OTG_HS_HCDMA0     at 16#114# range 0 .. 31;
      OTG_HS_HCCHAR1    at 16#120# range 0 .. 31;
      OTG_HS_HCSPLT1    at 16#124# range 0 .. 31;
      OTG_HS_HCINT1     at 16#128# range 0 .. 31;
      OTG_HS_HCINTMSK1  at 16#12C# range 0 .. 31;
      OTG_HS_HCTSIZ1    at 16#130# range 0 .. 31;
      OTG_HS_HCDMA1     at 16#134# range 0 .. 31;
      OTG_HS_HCCHAR2    at 16#140# range 0 .. 31;
      OTG_HS_HCSPLT2    at 16#144# range 0 .. 31;
      OTG_HS_HCINT2     at 16#148# range 0 .. 31;
      OTG_HS_HCINTMSK2  at 16#14C# range 0 .. 31;
      OTG_HS_HCTSIZ2    at 16#150# range 0 .. 31;
      OTG_HS_HCDMA2     at 16#154# range 0 .. 31;
      OTG_HS_HCCHAR3    at 16#160# range 0 .. 31;
      OTG_HS_HCSPLT3    at 16#164# range 0 .. 31;
      OTG_HS_HCINT3     at 16#168# range 0 .. 31;
      OTG_HS_HCINTMSK3  at 16#16C# range 0 .. 31;
      OTG_HS_HCTSIZ3    at 16#170# range 0 .. 31;
      OTG_HS_HCDMA3     at 16#174# range 0 .. 31;
      OTG_HS_HCCHAR4    at 16#180# range 0 .. 31;
      OTG_HS_HCSPLT4    at 16#184# range 0 .. 31;
      OTG_HS_HCINT4     at 16#188# range 0 .. 31;
      OTG_HS_HCINTMSK4  at 16#18C# range 0 .. 31;
      OTG_HS_HCTSIZ4    at 16#190# range 0 .. 31;
      OTG_HS_HCDMA4     at 16#194# range 0 .. 31;
      OTG_HS_HCCHAR5    at 16#1A0# range 0 .. 31;
      OTG_HS_HCSPLT5    at 16#1A4# range 0 .. 31;
      OTG_HS_HCINT5     at 16#1A8# range 0 .. 31;
      OTG_HS_HCINTMSK5  at 16#1AC# range 0 .. 31;
      OTG_HS_HCTSIZ5    at 16#1B0# range 0 .. 31;
      OTG_HS_HCDMA5     at 16#1B4# range 0 .. 31;
      OTG_HS_HCCHAR6    at 16#1C0# range 0 .. 31;
      OTG_HS_HCSPLT6    at 16#1C4# range 0 .. 31;
      OTG_HS_HCINT6     at 16#1C8# range 0 .. 31;
      OTG_HS_HCINTMSK6  at 16#1CC# range 0 .. 31;
      OTG_HS_HCTSIZ6    at 16#1D0# range 0 .. 31;
      OTG_HS_HCDMA6     at 16#1D4# range 0 .. 31;
      OTG_HS_HCCHAR7    at 16#1E0# range 0 .. 31;
      OTG_HS_HCSPLT7    at 16#1E4# range 0 .. 31;
      OTG_HS_HCINT7     at 16#1E8# range 0 .. 31;
      OTG_HS_HCINTMSK7  at 16#1EC# range 0 .. 31;
      OTG_HS_HCTSIZ7    at 16#1F0# range 0 .. 31;
      OTG_HS_HCDMA7     at 16#1F4# range 0 .. 31;
      OTG_HS_HCCHAR8    at 16#200# range 0 .. 31;
      OTG_HS_HCSPLT8    at 16#204# range 0 .. 31;
      OTG_HS_HCINT8     at 16#208# range 0 .. 31;
      OTG_HS_HCINTMSK8  at 16#20C# range 0 .. 31;
      OTG_HS_HCTSIZ8    at 16#210# range 0 .. 31;
      OTG_HS_HCDMA8     at 16#214# range 0 .. 31;
      OTG_HS_HCCHAR9    at 16#220# range 0 .. 31;
      OTG_HS_HCSPLT9    at 16#224# range 0 .. 31;
      OTG_HS_HCINT9     at 16#228# range 0 .. 31;
      OTG_HS_HCINTMSK9  at 16#22C# range 0 .. 31;
      OTG_HS_HCTSIZ9    at 16#230# range 0 .. 31;
      OTG_HS_HCDMA9     at 16#234# range 0 .. 31;
      OTG_HS_HCCHAR10   at 16#240# range 0 .. 31;
      OTG_HS_HCSPLT10   at 16#244# range 0 .. 31;
      OTG_HS_HCINT10    at 16#248# range 0 .. 31;
      OTG_HS_HCINTMSK10 at 16#24C# range 0 .. 31;
      OTG_HS_HCTSIZ10   at 16#250# range 0 .. 31;
      OTG_HS_HCDMA10    at 16#254# range 0 .. 31;
      OTG_HS_HCCHAR11   at 16#260# range 0 .. 31;
      OTG_HS_HCSPLT11   at 16#264# range 0 .. 31;
      OTG_HS_HCINT11    at 16#268# range 0 .. 31;
      OTG_HS_HCINTMSK11 at 16#26C# range 0 .. 31;
      OTG_HS_HCTSIZ11   at 16#270# range 0 .. 31;
      OTG_HS_HCDMA11    at 16#274# range 0 .. 31;
   end record;

   --  USB on the go high speed
   OTG_HS_HOST_Periph : aliased OTG_HS_HOST_Peripheral
     with Import, Address => OTG_HS_HOST_Base;

   --  USB on the go high speed
   type OTG_HS_PWRCLK_Peripheral is record
      --  Power and clock gating control register
      OTG_HS_PCGCR : aliased OTG_HS_PCGCR_Register;
      pragma Volatile_Full_Access (OTG_HS_PCGCR);
   end record
     with Volatile;

   for OTG_HS_PWRCLK_Peripheral use record
      OTG_HS_PCGCR at 0 range 0 .. 31;
   end record;

   --  USB on the go high speed
   OTG_HS_PWRCLK_Periph : aliased OTG_HS_PWRCLK_Peripheral
     with Import, Address => OTG_HS_PWRCLK_Base;

end STM32F40x.USB_OTG_HS;
