****************************************************************************
*
* WARNING : please consider following remarks before usage
*
* 1) All models are a tradeoff between accuracy and complexity (ie. simulation
*    time).
*
* 2) Macromodels are not a substitute to breadboarding, they rather confirm the
*    validity of a design approach and help to select surrounding component values.
*
* 3) A macromodel emulates the NOMINAL performance of a TYPICAL device within
*    SPECIFIED OPERATING CONDITIONS (ie. temperature, supply voltage, etc.).
*    Thus the macromodel is often not as exhaustive as the datasheet, its goal
*    is to illustrate the main parameters of the product.
*
* 4) Data issued from macromodels used outside of its specified conditions
*    (Vcc, Temperature, etc) or even worse: outside of the device operating
*    conditions (Vcc, Vicm, etc) are not reliable in any way.
*
****************************************************************************
****
***  TSX631 Spice macromodel subckt 
***
***   February 2014
****                      
************ CONNECTIONS: 
****                  NON-INVERTING INPUT
****                    |  INVERTING INPUT
****                    |   |     POSITIVE POWER SUPPLY
****                    |   |      |      NEGATIVE POWER SUPPLY
****                    |   |      |       |     OUTPUT  
****                    |   |      |       |      |     
****                    |   |      |       |      |  
.SUBCKT TSX631   VP  VM  VCCP VCCN  VS
     LOUT VZOUT 0 {LOUT}
    FIOUT 0 VZOUT VREADIO 1.0
    M_NMOS2 VO_DIFF_MINUS VM VEE_N VCCN_ENHANCED MOS_N L={L} W={W}
    M_NMOS1 VO_DIFF_PLUS NET0283 VEE_N VCCN_ENHANCED MOS_N L={L} W={W}
    IEE_N VEE_N VCCN_ENHANCED DC {IEE}
    V57 NET0242 NET0244 DC {VD_COMPENSAZIONE}
    VREADI_R1 VB NET386 DC 0
    V56 NET0280 NET0254 DC {VD_COMPENSAZIONE}
    VOS NET0283 VP DC 0
    VPROT_IN_P_VCCP NET246 NET279 DC {V_DPROT}
    V_ENHANCE_VCCN VCCN_ENHANCED VCCN DC {VCCN_ENHANCE}
    VREADIO NET0341 VS DC 0
    V_ENHANCE_VCCP VCCP_ENHANCED VCCP DC {VCCP_ENHANCE}
    V_OUTVLIM_LOW NET256 NET257 DC {VD_COMPENSAZIONE}
    VPROT_IN_M_VCCN NET258 NET448 DC {V_DPROT}
    V_OUTVLIM_HIGH NET285 NET261 DC {VD_COMPENSAZIONE}
    VPROT_IN_P_VCCN NET262 NET263 DC {V_DPROT}
    VPROT_IN_M_VCCP NET434 NET269 DC {V_DPROT}
    D29 NET0244 VB DIODE_NOVd
    D28 VB NET0280 DIODE_NOVd
    DPROT_IN_M_VCCP VM NET269 DIODE_VLIM
    DPROT_IN_M_VCCN NET258 VM DIODE_VLIM
    DILIM_SINK VB_3_SINK VB_3 DIODE_ILIM
    D_OUTVLIM_LOW NET257 VB_3 DIODE_NOVd
    DPROT_IN_P_VCCP NET0283 NET279 DIODE_VLIM
    DILIM_SOURCE VB_3 VB_3_SOURCE DIODE_ILIM
    DPROT_IN_P_VCCN NET262 NET0283 DIODE_VLIM
    D_OUTVLIM_HIGH VB_3 NET285 DIODE_NOVd
    CZOUT_IOUT_COEFF VZOUT_IOUT_COEFF 0 1n
    COUT2 VZOUT 0 {COUT2}
    CIN_CM_VM VM VREF {CIN_CM_VM}
    CIN_CM_VP VP VREF {CIN_CM_VP}
    CIN_DIFF VM VP {CIN_DIFF}
    C_RO2_1 VB_2 VREF 10p
    COUT NET427 0 {COUT}
    CDIFF_PARASITIC VO_DIFF_PLUS VO_DIFF_MINUS 225p
    CCOMP VB VB_2 {CCOMP}
    E60 NET0242 0 VALUE={V(Vref) - alpha_desat_time*V(Vccp,Vccn) } 
    E62 NET0254 0 VALUE={V(Vref) + alpha_desat_time*V(Vccp,Vccn) }
    EZOUT_VCC_COEFF VZOUT_VCC_COEFF 0 VALUE={1}
    EZOUT_IOUT_COEFF NET310 0 VALUE={IF( I(VreadIo)>=0 , (
+Zout_Iout_coeff_MIN + (1.0 -
+Zout_Iout_coeff_MIN)*exp(-abs(I(VreadIo)/Iout_dc_tau__source)) ) , (
+Zout_Iout_coeff_MIN + (1.0 -
+Zout_Iout_coeff_MIN)*exp(-abs(I(VreadIo)/Iout_dc_tau__sink)) ) )}
    EZOUT VB_3 NET0341
+VALUE={V(VZout)*V(VZout_Iout_coeff)*V(VZout_Vcc_coeff)}
    E_SR_VCC_MODULATION VOUT_DIFF__SR_VCC 0 VOUT_DIFF 0 1
    E_ICCSAT_HIGH ICC_OUT_HIGH 0 VALUE={0}
    E_RO1_VOL RO1_VOL 0 POLY(1) VCCP VCCN 359.0289837257432
+-99.19724864708631 12.629932015104508 -0.7291576867748092
+0.015648577785370054
    E_ICCSAT_LOW ICC_OUT_LOW 0 VALUE={0}
    E_READIO V_IO_VAL 0 VALUE={I(VreadIo)}
    E58 VB_2_VREF 0 VB_2 VREF 1.0
    EILIM_SINK VB_3_SINK VDEP_SINK VB_3 0 1.0
    E_RO1_VOH RO1_VOH 0 POLY(1) VCCP VCCN 532.6471144805088
+-139.5635711881178 16.56856830915354 -0.8778272267854438
+0.017095899327075923
    EMEAS_VB_VREF VB_VREF 0 VB VREF 1.0
    EMEAS_VOUT_DIFF VOUT_DIFF 0 VO_DIFF_PLUS VO_DIFF_MINUS 1.0
    E_VDEP_SOURCE_2 VAL_VDEP_SOURCE_FILTERED 0
+VALUE={IF(V(val_vdep_source)>=0, 0, V(val_vdep_source))}
    E_VDEP_SOURCE_1 VAL_VDEP_SOURCE 0 VALUE={ ( -33.180068854430914 +
+12.062434050640288*V(Vccp,Vccn) + 1.3688746046180766*PWR(V(Vccp,Vccn),2)
+-0.01483173211377962*PWR(V(Vccp,Vccn),3) )  -5000*I(VreadIo)}
    EVLIM_HIGH_VOUT NET261 0 VALUE={V(VCCP) - V(Ro1_Voh)*I(VreadIo)}
    EVLIM_LOW_VOUT NET256 0 VALUE={V(VCCN) - V(Ro1_Vol)*I(VreadIo) +
+V(VOL_noRL) }
    E_VDEP_SOURCE_3 VDEP_SOURCE 0 VALUE={IF( V(Vccp,Vccn)<VCC_MIN , 0 ,
+V(val_vdep_source_filtered))}
    E_VDEP_SINK_2 VAL_VDEP_SINK_FILTERED 0
+VALUE={IF(V(val_vdep_sink)<=0 , 0 , V(val_vdep_sink))}
    E_R1 NET386 VREF VALUE={I(VreadI_R1)*( R1_sink
++(R1_source-R1_sink)*1/(1+exp(-alpha_switch*(V(v_Io_val)-Io_val_switch) )
+)) }
    E2_REF NET450 0 VCCN 0 1.0
    E_VREF VREF 0 NET444 0 1.0
    E_VOL_NORL VOL_NORL 0 VALUE={0}
    E_VDEP_SINK_3 VDEP_SINK 0 VALUE={IF( V(Vccp,Vccn)<VCC_MIN , 0 ,
+V(val_vdep_sink_filtered))}
    E1_REF NET410 0 VCCP 0 1.0
    E_VDEP_SINK_1 VAL_VDEP_SINK 0 VALUE={ (4.862301507746423 +
+3.9110899458662205*V(Vccp,Vccn) -4.52868808930211*PWR(V(Vccp,Vccn),2) +
+0.1543956079638023*PWR(V(Vccp,Vccn),3) ) -5000*I(VreadIo)}
    EILIM_SOURCE VB_3_SOURCE VDEP_SOURCE VB_3 0 1.0
    RZOUT_IOUT_COEFF VZOUT_IOUT_COEFF NET310 50
    RIN_CM_VP VREF VP {RIN_CM_VP}
    RIN_DIFF VP VM {RIN_DIFF}
    ROUT NET427 VZOUT {ROUT}
    R_ICCSAT_LOW ICC_OUT_LOW 0 1K
    RO2_2 VB_3 VB_2 {RO2_2}
    RPROT_IN_P_VCCP NET246 VCCP 100
    RPROT_IN_M_VCCP VCCP NET434 100
    RO2_1 VB_2 VREF {RO2_1}
    RD1 VCCP_ENHANCED VO_DIFF_PLUS {RD}
    RD2 VCCP_ENHANCED VO_DIFF_MINUS {RD}
    RIN_CM_VM VREF VM {RIN_CM_VM}
    R1_REF NET410 NET444 1Meg
    R_ICCSAT_HIGH ICC_OUT_HIGH 0 1K
    RPROT_IN_M_VCCN VCCN NET448 15K
    R2_REF NET444 NET450 1Meg
    RPROT_IN_P_VCCN NET263 VCCN 15K
    G_ICCSAT_OUTLOW VCCP VCCN VALUE={IF(I(V_OUTVLIM_LOW)>1u ,
+V(Icc_out_low) , 0)}
    G_I_VB VB_2 VREF VB_VREF 0 {GB}
    G_I_IO VB_2 VREF VALUE={V(VB_Vref)*GB*( 20*( 1 -
+exp(-abs(V(v_Io_val))/1.5m )) )  }
    G_IOUT_SOURCED VCCP 0 VALUE={IF(I(VreadIo)>0, I(VreadIo),0)}
    GM1 VREF VB VOUT_DIFF__SR_VCC 0 {1/RD}
    G_IIB_VM VREF VM VALUE={1p}
    G_ICC VCCP VCCN VALUE={44.5e-6}
    G_ICCSAT_OUTHIGH VCCP VCCN VALUE={IF(I(V_OUTVLIM_HIGH)>1u ,
+V(Icc_out_high), 0)}
    G_IIB_VP VREF VP VALUE={1p}
    G_IOUT_SINKED VCCN 0 VALUE={IF(I(VreadIo)>0, 0, I(VreadIo))}

    
*******************************************************************************
*
* MODELS/SUBCKTS and PARAMS used by TSX631 subckt:
*
.PARAM VCC_MIN=3.0
.PARAM RINCM=2.4986E+11
.PARAM CINCM=2.3556E-12
.PARAM RIN_CM_VM={2*RINCM}
.PARAM RIN_CM_VP={2*RINCM}
.PARAM CIN_CM_VM={CINCM/2}
.PARAM CIN_CM_VP={CINCM/2}
.PARAM RINDIFF=2.4990E+11
.PARAM CINDIFF=1.2495E-12
.PARAM RIN_DIFF={(2*RINCM*RINDIFF)/(2*RINCM - RINDIFF)}  
.PARAM CIN_DIFF={CINDIFF - CINCM/2}
.PARAM RD=1k
.PARAM VCCP_enhance=150m
.PARAM VCCN_enhance=-1100m 
.PARAM GB=0.794m 
.PARAM Ro = 2.0996e+06 
.PARAM A0_source = 1.5e+6
.PARAM A0_sink = 5e+6
.PARAM alpha_switch = 1e6
.PARAM Io_val_switch = -7u
.PARAM Ccomp=4.12p 
.PARAM IEE=500n
.PARAM W=0.11u
.PARAM L=1u
.PARAM gm_mos=5.2469E-06  
.PARAM Lout  = 140u
.PARAM Rout  = 2400
.PARAM Cout  = 0.5n
.PARAM Cout2 = 8p
.PARAM Zout_Iout_coeff_MIN= 1.0
.PARAM Iout_dc_tau__source = 0.03m 
.PARAM Iout_dc_tau__sink   = 0.03m 
.PARAM alpha_desat_time = 0.37
.PARAM Ro2_2=1e-3 
.PARAM Ro2_1={ Ro - Ro2_2} 
.PARAM R1_sink={A0_sink/(gm_mos*GB*Ro2_1)}
.PARAM R1_source={A0_source/(gm_mos*GB*Ro2_1)}
.PARAM V_DPROT=150m
.PARAM Vd_compensazione=-788.4u

.MODEL MOS_N  NMOS LEVEL=1  VTO=+0.65  KP=500E-6 
.MODEL DIODE_NOVd D LEVEL=1  IS=10E-15 N=0.001
.MODEL DIODE_VLIM D LEVEL=1  IS=0.8E-15   
.MODEL DIODE_ILIM D LEVEL=1  IS=0.8E-15  
*
*******************************************************************************

.ENDS TSX631
*** End of subcircuit definition.


