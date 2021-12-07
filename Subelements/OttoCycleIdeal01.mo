within PropulsionSystem.Subelements;

block OttoCycleIdeal01
  extends PropulsionSystem.Icons.Icon_OttoCycle;
  //******************************************************************************************
  /********************************************************
                    imports
                ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
                    Declaration
                ********************************************************/
  /* ---------------------------------------------
                    Package
                --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
                        parameters
                --------------------------------------------- */
  //********** Others **********
  parameter switches.switch_input_ThermodynamicState switch_u_thermoState = switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = false);
  parameter Integer nPts_hs_par[4] = {10, 10, 10, 10} "" annotation(
    Dialog(group = "Others"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = false);
  parameter Integer nPts_Ts_par[4] = {10, 10, 10, 10} "" annotation(
    Dialog(group = "Others"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = false);
  parameter Integer nPts_pv_par[4] = {10, 10, 10, 10} "" annotation(
    Dialog(group = "Others"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = false);
  parameter Integer nPts_us_par[4] = {10, 10, 10, 10} "" annotation(
    Dialog(group = "Others"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = false);
  parameter Integer nPts_pVol_par[4] = {10, 10, 10, 10} "" annotation(
    Dialog(group = "Others"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = false);
  //********** Initialization Parameters **********
  //--- fluidState_1 ---
  parameter Modelica.SIunits.Pressure p_state1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.Temperature T_state1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state1_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.SpecificEntropy s_state_1_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  //--- fluidState_2 ---
  parameter Modelica.SIunits.Pressure p_state2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.Temperature T_state2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state2_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.SpecificEntropy s_state_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  //--- fluidState_3 ---
  parameter Modelica.SIunits.Pressure p_state3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.Temperature T_state3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state3_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.SpecificEntropy s_state_3_init = 8000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  //--- fluidState_4 ---
  parameter Modelica.SIunits.Pressure p_state4_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.Temperature T_state4_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state4_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.SpecificEntropy s_state_4_init = 8000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  Modelica.SIunits.Volume VolDisp "displacement";
  Modelica.SIunits.Volume Vol1 "volume, state 1";
  Modelica.SIunits.Volume Vol2 "volume, state 2";
  Modelica.SIunits.Volume Vol3 "volume, state 3";
  Modelica.SIunits.Volume Vol4 "volume, state 4";
  Modelica.SIunits.SpecificVolume v1 "specific volume, state 1";
  Modelica.SIunits.SpecificVolume v2 "specific volume, state 2";
  Modelica.SIunits.SpecificVolume v3 "specific volume, state 3";
  Modelica.SIunits.SpecificVolume v4 "specific volume, state 4";
  Modelica.SIunits.SpecificEntropy s_state_1(start = s_state_1_init) "specific entropy, state 1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_state_2(start = s_state_2_init) "specific entropy, state 2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_state_3(start = s_state_3_init) "specific entropy, state 3" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_state_4(start = s_state_4_init) "specific entropy, state 4" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Mass massFluidCycle "mass of fluid in single cycle in cylinder";
  Modelica.SIunits.Heat Q_2_3 "heat injected into fluid by combustion";
  Modelica.SIunits.Heat Q_4_1 "heat rejected from fluid by exhaust";
  Modelica.SIunits.Work WoutCycle "work output, single cycle";
  Modelica.SIunits.Work W_1_2 "work, compression, state 1 -> 2";
  Modelica.SIunits.Work W_3_4 "work, expansion, state 3 -> 4";
  Modelica.SIunits.SpecificEnergy WqmOutCycle "WoutCycle/mass";
  Modelica.SIunits.SpecificEnergy Wqm_1_2 "W_1_2/mass";
  Modelica.SIunits.SpecificEnergy Wqm_3_4 "W_3_4/mass";
  Modelica.SIunits.SpecificEnergy Qqm_2_3 "Q_2_3/mass";
  Modelica.SIunits.SpecificEnergy Qqm_4_1 "Q_4_1/mass";
  Real CR "Compression Ratio";
  Real ER "Expansion Ratio";
  Real effThermal "Thermal efficiency";
  Modelica.SIunits.SpecificEnthalpy arr_h[5];
  Modelica.SIunits.SpecificEnergy arr_u[5];
  Modelica.SIunits.SpecificEntropy arr_s[5];
  Modelica.SIunits.Pressure arr_p[5];
  Modelica.SIunits.Volume arr_V[5];
  Modelica.SIunits.SpecificVolume arr_v[5];
  Modelica.SIunits.Temperature arr_T[5];
  Real PR_1_2 "pressure ratio, compression";
  Real PR_3_4 "pressure ratio, expansion";
  Modelica.SIunits.Pressure pme "mean effective pressure of cycle";
  Boolean flag_W34_gt_Q23 "flag, true if |Q_2_3|<|W_3_4|";
  Modelica.SIunits.SpecificEnthalpy dh_1_2;
  Modelica.SIunits.SpecificEnthalpy dh_2_3;
  Modelica.SIunits.SpecificEnthalpy dh_3_4;
  Modelica.SIunits.SpecificEnthalpy dh_4_1;
  Modelica.SIunits.TemperatureDifference dT_1_2;
  Modelica.SIunits.TemperatureDifference dT_2_3;
  Modelica.SIunits.TemperatureDifference dT_3_4;
  Modelica.SIunits.TemperatureDifference dT_4_1;
  
  
  /* ---------------------------------------------
          Internal objects
      --------------------------------------------- */
  Medium.BaseProperties fluidState_1(p(start = p_state1_init, min = 0.0 + 1.0e-10), T(start = T_state1_init, min = 0.0 + 1.0e-10), state.p(start = p_state1_init, min = 0.0 + 1.0e-10), state.T(start = T_state1_init, min = 0.0 + 1.0e-10), h(start = h_state1_init, min = 0.0 + 1.0e-10)) "fluid state 1";
  Medium.BaseProperties fluidState_2(p(start = p_state2_init, min = 0.0 + 1.0e-10), T(start = T_state2_init, min = 0.0 + 1.0e-10), state.p(start = p_state2_init, min = 0.0 + 1.0e-10), state.T(start = T_state2_init, min = 0.0 + 1.0e-10), h(start = h_state2_init, min = 0.0 + 1.0e-10)) "fluid state 2";
  Medium.BaseProperties fluidState_3(p(start = p_state3_init, min = 0.0 + 1.0e-10), T(start = T_state3_init, min = 0.0 + 1.0e-10), state.p(start = p_state3_init, min = 0.0 + 1.0e-10), state.T(start = T_state3_init, min = 0.0 + 1.0e-10), h(start = h_state3_init, min = 0.0 + 1.0e-10)) "fluid state 3";
  Medium.BaseProperties fluidState_4(p(start = p_state4_init, min = 0.0 + 1.0e-10), T(start = T_state4_init, min = 0.0 + 1.0e-10), state.p(start = p_state4_init, min = 0.0 + 1.0e-10), state.T(start = T_state4_init, min = 0.0 + 1.0e-10), h(start = h_state4_init, min = 0.0 + 1.0e-10)) "fluid state 4";
  PropulsionSystem.Utilities.arr_hs_const_p_00 curve_hs[4](redeclare package Medium = Medium, nPts_par = nPts_hs_par) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.arr_pv_const_s_00 curve_pv[4](redeclare package Medium = Medium, nPts_par = nPts_pv_par) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.arr_Ts_const_p_00 curve_Ts[4](redeclare package Medium = Medium, nPts_par = nPts_Ts_par) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.arr_us_const_p_00 curve_us[4](redeclare package Medium = Medium, nPts_par = nPts_us_par) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.arr_pVol_const_s_00 curve_pVol[4](redeclare package Medium = Medium, nPts_par = nPts_pVol_par) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  /* ---------------------------------------------
          Interface
      --------------------------------------------- */
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_p_fluidState_1(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_T_fluidState_1(unit = "K", displayUnit = "K") if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_h_fluidState_1(unit = "J/kg", displayUnit = "J/kg") if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_h_for_ThermodynamicState annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_u_fluidState_1(unit = "J/kg", displayUnit = "J/kg") if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState annotation(
    Placement(visible = true, transformation(origin = {-120, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Xi_fluidState_1[Medium.nXi] annotation(
    Placement(visible = true, transformation(origin = {-120, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput par_CR annotation(
    Placement(visible = true, transformation(origin = {-90, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-80, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput par_VolDisp(unit = "m3", displayUnit = "m3") annotation(
    Placement(visible = true, transformation(origin = {-50, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_Qin(unit = "J", displayUnit = "J") annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-114, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_WoutCycle(unit = "J", displayUnit = "J") annotation(
    Placement(visible = true, transformation(origin = {20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {40, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_p_fluidState_4(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluidState_4(unit = "K", displayUnit = "K") annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Xi_fluidState_4[Medium.nXi] annotation(
    Placement(visible = true, transformation(origin = {110, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_h_fluidState_4(unit = "J/kg", displayUnit = "J/kg") annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_u_fluidState_4(unit = "J/kg", displayUnit = "J/kg") annotation(
    Placement(visible = true, transformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_fluid(quantity = "Mass", unit = "kg", displayUnit = "kg") annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {114, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluidState_3(unit = "K", displayUnit = "K") annotation(
    Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-10, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluidState_2(unit = "K", displayUnit = "K") annotation(
    Placement(visible = true, transformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-60, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_p_fluidState_2(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-80, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_p_fluidState_3(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-30, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_Q_4_1(displayUnit = "J", unit = "J") annotation(
    Placement(visible = true, transformation(origin = {50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {60, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_Q_2_3(displayUnit = "J", unit = "J") annotation(
    Placement(visible = true, transformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {80, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  //*************************************************************************************
equation
  connect(curve_pVol[4].u_m, massFluidCycle) annotation(
    Line);
  connect(curve_pVol[4].u_Xi, fluidState_4.Xi) annotation(
    Line);
  connect(curve_pVol[4].u_s, s_state_4) annotation(
    Line);
  connect(curve_pVol[4].u_pLower, fluidState_4.p) annotation(
    Line);
  connect(curve_pVol[4].u_pUpper, fluidState_3.p) annotation(
    Line);
  connect(curve_pVol[3].u_m, massFluidCycle) annotation(
    Line);
  connect(curve_pVol[3].u_Xi, fluidState_3.Xi) annotation(
    Line);
  connect(curve_pVol[3].u_s, s_state_3) annotation(
    Line);
  connect(curve_pVol[3].u_pLower, fluidState_4.p) annotation(
    Line);
  connect(curve_pVol[3].u_pUpper, fluidState_3.p) annotation(
    Line);
  connect(curve_pVol[2].u_m, massFluidCycle) annotation(
    Line);
  connect(curve_pVol[2].u_Xi, fluidState_2.Xi) annotation(
    Line);
  connect(curve_pVol[2].u_s, s_state_2) annotation(
    Line);
  connect(curve_pVol[2].u_pLower, fluidState_1.p) annotation(
    Line);
  connect(curve_pVol[2].u_pUpper, fluidState_2.p) annotation(
    Line);
  connect(curve_pVol[1].u_m, massFluidCycle) annotation(
    Line);
  connect(curve_pVol[1].u_Xi, fluidState_1.Xi) annotation(
    Line);
  connect(curve_pVol[1].u_s, s_state_1) annotation(
    Line);
  connect(curve_pVol[1].u_pLower, fluidState_1.p) annotation(
    Line);
  connect(curve_pVol[1].u_pUpper, fluidState_2.p) annotation(
    Line);
  
  connect(curve_hs[4].u_Xi, fluidState_4.Xi) annotation(
    Line);
  connect(curve_hs[4].u_p, fluidState_4.p) annotation(
    Line);
  connect(curve_hs[4].u_sUpper, s_state_4) annotation(
    Line);
  connect(curve_hs[4].u_sLower, s_state_1) annotation(
    Line);
  connect(curve_hs[3].u_Xi, fluidState_3.Xi) annotation(
    Line);
  connect(curve_hs[3].u_p, fluidState_3.p) annotation(
    Line);
  connect(curve_hs[3].u_sUpper, s_state_3) annotation(
    Line);
  connect(curve_hs[3].u_sLower, s_state_2) annotation(
    Line);
  connect(curve_hs[2].u_Xi, fluidState_2.Xi) annotation(
    Line);
  connect(curve_hs[2].u_p, fluidState_2.p) annotation(
    Line);
  connect(curve_hs[2].u_sUpper, s_state_3) annotation(
    Line);
  connect(curve_hs[2].u_sLower, s_state_2) annotation(
    Line);
  connect(curve_hs[1].u_Xi, fluidState_1.Xi) annotation(
    Line);
  connect(curve_hs[1].u_p, fluidState_1.p) annotation(
    Line);
  connect(curve_hs[1].u_sUpper, s_state_4) annotation(
    Line);
  connect(curve_hs[1].u_sLower, s_state_1) annotation(
    Line);
  connect(curve_pv[1].u_pUpper, fluidState_2.p) annotation(
    Line);
  connect(curve_pv[1].u_pLower, fluidState_1.p) annotation(
    Line);
  connect(curve_pv[1].u_s, s_state_1) annotation(
    Line);
  connect(curve_pv[1].u_Xi, fluidState_1.Xi) annotation(
    Line);
  connect(curve_pv[2].u_pUpper, fluidState_2.p) annotation(
    Line);
  connect(curve_pv[2].u_pLower, fluidState_1.p) annotation(
    Line);
  connect(curve_pv[2].u_s, s_state_2) annotation(
    Line);
  connect(curve_pv[2].u_Xi, fluidState_2.Xi) annotation(
    Line);
  connect(curve_pv[3].u_pUpper, fluidState_3.p) annotation(
    Line);
  connect(curve_pv[3].u_pLower, fluidState_4.p) annotation(
    Line);
  connect(curve_pv[3].u_s, s_state_3) annotation(
    Line);
  connect(curve_pv[3].u_Xi, fluidState_3.Xi) annotation(
    Line);
  connect(curve_pv[4].u_pUpper, fluidState_3.p) annotation(
    Line);
  connect(curve_pv[4].u_pLower, fluidState_4.p) annotation(
    Line);
  connect(curve_pv[4].u_s, s_state_4) annotation(
    Line);
  connect(curve_pv[4].u_Xi, fluidState_4.Xi) annotation(
    Line);
  connect(curve_Ts[4].u_Xi, fluidState_4.Xi) annotation(
    Line);
  connect(curve_Ts[4].u_p, fluidState_4.p) annotation(
    Line);
  connect(curve_Ts[4].u_sUpper, s_state_4) annotation(
    Line);
  connect(curve_Ts[4].u_sLower, s_state_1) annotation(
    Line);
  connect(curve_Ts[3].u_Xi, fluidState_3.Xi) annotation(
    Line);
  connect(curve_Ts[3].u_p, fluidState_3.p) annotation(
    Line);
  connect(curve_Ts[3].u_sUpper, s_state_3) annotation(
    Line);
  connect(curve_Ts[3].u_sLower, s_state_2) annotation(
    Line);
  connect(curve_Ts[2].u_Xi, fluidState_2.Xi) annotation(
    Line);
  connect(curve_Ts[2].u_p, fluidState_2.p) annotation(
    Line);
  connect(curve_Ts[2].u_sUpper, s_state_3) annotation(
    Line);
  connect(curve_Ts[2].u_sLower, s_state_2) annotation(
    Line);
  connect(curve_Ts[1].u_Xi, fluidState_1.Xi) annotation(
    Line);
  connect(curve_Ts[1].u_p, fluidState_1.p) annotation(
    Line);
  connect(curve_Ts[1].u_sUpper, s_state_4) annotation(
    Line);
  connect(curve_Ts[1].u_sLower, s_state_1) annotation(
    Line);
  connect(curve_us[4].u_Xi, fluidState_4.Xi) annotation(
    Line);
  connect(curve_us[4].u_p, fluidState_4.p) annotation(
    Line);
  connect(curve_us[4].u_sUpper, s_state_4) annotation(
    Line);
  connect(curve_us[4].u_sLower, s_state_1) annotation(
    Line);
  connect(curve_us[3].u_Xi, fluidState_3.Xi) annotation(
    Line);
  connect(curve_us[3].u_p, fluidState_3.p) annotation(
    Line);
  connect(curve_us[3].u_sUpper, s_state_3) annotation(
    Line);
  connect(curve_us[3].u_sLower, s_state_2) annotation(
    Line);
  connect(curve_us[2].u_Xi, fluidState_2.Xi) annotation(
    Line);
  connect(curve_us[2].u_p, fluidState_2.p) annotation(
    Line);
  connect(curve_us[2].u_sUpper, s_state_3) annotation(
    Line);
  connect(curve_us[2].u_sLower, s_state_2) annotation(
    Line);
  connect(curve_us[1].u_Xi, fluidState_1.Xi) annotation(
    Line);
  connect(curve_us[1].u_p, fluidState_1.p) annotation(
    Line);
  connect(curve_us[1].u_sUpper, s_state_4) annotation(
    Line);
  connect(curve_us[1].u_sLower, s_state_1) annotation(
    Line);
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
//--- u ---
  fluidState_1.p = u_p_fluidState_1;
  fluidState_1.Xi = u_Xi_fluidState_1[1:Medium.nXi];
  if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState then
    fluidState_1.T = u_T_fluidState_1;
  elseif switch_u_thermoState == switches.switch_input_ThermodynamicState.use_h_for_ThermodynamicState then
    fluidState_1.h = u_h_fluidState_1;
  elseif switch_u_thermoState == switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState then
    fluidState_1.u = u_u_fluidState_1;
  end if;
  Q_2_3 = u_Qin;
//--- par ---
  CR = par_CR;
  VolDisp = par_VolDisp;
//--- y ---
  y_p_fluidState_4 = fluidState_4.p;
  y_T_fluidState_4 = fluidState_4.T;
  y_h_fluidState_4 = fluidState_4.h;
  y_u_fluidState_4 = fluidState_4.u;
  y_Xi_fluidState_4[1:Medium.nXi] = fluidState_4.Xi;
  y_m_fluid = massFluidCycle;
  y_WoutCycle = WoutCycle;
  y_Q_4_1 = Q_4_1;
  y_Q_2_3 = Q_2_3;
  y_p_fluidState_2 = fluidState_2.p;
  y_T_fluidState_2 = fluidState_2.T;
  y_p_fluidState_3 = fluidState_3.p;
  y_T_fluidState_3 = fluidState_3.T;
//--- ---
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- component characteristics --
  Vol1 = Vol2 + VolDisp;
  massFluidCycle = fluidState_1.d * Vol1;
  v1 = 1.0 / fluidState_1.d;
//--- state1 <-> state2 ---
  CR = Vol1 / Vol2;
  s_state_1 = Medium.specificEntropy(fluidState_1.state);
  fluidState_2.d = massFluidCycle / Vol2;
  v2 = 1.0 / fluidState_2.d;
  s_state_2 = Medium.specificEntropy(fluidState_2.state);
  fluidState_2.Xi = fluidState_1.Xi;
  s_state_2 = s_state_1;
  W_1_2 = massFluidCycle * (fluidState_2.u - fluidState_1.u);
//--- state2 <-> state3 ---
  Vol3 = Vol2;
  fluidState_3.d = massFluidCycle / Vol3;
  v3 = 1.0 / fluidState_3.d;
  fluidState_3.Xi = fluidState_2.Xi;
  Q_2_3 = massFluidCycle * (fluidState_3.u - fluidState_2.u);
  s_state_3 = Medium.specificEntropy(fluidState_3.state);
//--- state3 <-> state4 ---
  Vol4 / Vol3 = ER;
  fluidState_4.d = massFluidCycle / Vol4;
  v4 = 1.0 / fluidState_4.d;
  s_state_4 = Medium.specificEntropy(fluidState_4.state);
  fluidState_4.Xi = fluidState_3.Xi;
  s_state_4 = s_state_3;
  W_3_4 = massFluidCycle * (fluidState_4.u - fluidState_3.u);
//--- state4 <-> state1 ---
  Vol4 = Vol1;
  Q_4_1 = massFluidCycle * (fluidState_1.u - fluidState_4.u);
//---
  WoutCycle = (-1.0) * (W_1_2 + W_3_4);
  WqmOutCycle= WoutCycle/massFluidCycle;
  Wqm_1_2= W_1_2/massFluidCycle;
  Wqm_3_4= W_3_4/massFluidCycle;
  Qqm_2_3= Q_2_3/massFluidCycle;
  Qqm_4_1= Q_4_1/massFluidCycle;
  pme= WoutCycle/VolDisp;
  dh_1_2= fluidState_2.h - fluidState_1.h;
  dh_2_3= fluidState_3.h - fluidState_2.h;
  dh_3_4= fluidState_4.h - fluidState_3.h;
  dh_4_1= fluidState_1.h - fluidState_4.h;
  dT_1_2= fluidState_2.T - fluidState_1.T;
  dT_2_3= fluidState_3.T - fluidState_2.T;
  dT_3_4= fluidState_4.T - fluidState_3.T;
  dT_4_1= fluidState_1.T - fluidState_4.T;
//---
  if Q_2_3 < (-1.0) * W_3_4 then
    flag_W34_gt_Q23 = true;
  else
    flag_W34_gt_Q23 = false;
  end if;
  
  PR_1_2= fluidState_2.p/fluidState_1.p;
  PR_3_4= fluidState_3.p/fluidState_4.p;
//---
  if 0.0 <= u_Qin then
    effThermal = WoutCycle / Q_2_3;
  else
    effThermal = 0.0;
  end if;
//---
  arr_h[1] = fluidState_1.h;
  arr_h[2] = fluidState_2.h;
  arr_h[3] = fluidState_3.h;
  arr_h[4] = fluidState_4.h;
  arr_h[5] = fluidState_1.h;
//---
  arr_u[1] = fluidState_1.u;
  arr_u[2] = fluidState_2.u;
  arr_u[3] = fluidState_3.u;
  arr_u[4] = fluidState_4.u;
  arr_u[5] = fluidState_1.u;
//---
  arr_p[1] = fluidState_1.p;
  arr_p[2] = fluidState_2.p;
  arr_p[3] = fluidState_3.p;
  arr_p[4] = fluidState_4.p;
  arr_p[5] = fluidState_1.p;
//---
  arr_T[1] = fluidState_1.T;
  arr_T[2] = fluidState_2.T;
  arr_T[3] = fluidState_3.T;
  arr_T[4] = fluidState_4.T;
  arr_T[5] = fluidState_1.T;
//---
  arr_s[1] = s_state_1;
  arr_s[2] = s_state_2;
  arr_s[3] = s_state_3;
  arr_s[4] = s_state_4;
  arr_s[5] = s_state_1;
//---
  arr_V[1] = Vol1;
  arr_V[2] = Vol2;
  arr_V[3] = Vol3;
  arr_V[4] = Vol4;
  arr_V[5] = Vol1;
//---
  arr_v[1] = v1;
  arr_v[2] = v2;
  arr_v[3] = v3;
  arr_v[4] = v4;
  arr_v[5] = v1;
  annotation(
    defaultComponentName = "OttoCycle",
    Icon(graphics = {Text(origin = {4, -80}, extent = {{-104, 8}, {96, -12}}, textString = "%name"), Rectangle(origin = {122, -60}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, 74}, {10, -74}}), Rectangle(origin = {103, -55}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-3, 35}, {5, -35}}), Rectangle(origin = {-118, -62}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-14, 76}, {10, -74}}), Rectangle(origin = {-105, -55}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-3, 35}, {5, -35}}), Rectangle(origin = {-28, -58}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, -50}, {30, -74}}), Rectangle(origin = {-78, -28}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-2, -72}, {18, -80}}), Rectangle(origin = {-78, -58}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, -50}, {30, -74}}), Rectangle(origin = {-28, -28}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-2, -72}, {18, -80}}), Rectangle(origin = {60, -58}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-32, -50}, {32, -74}}), Rectangle(origin = {42, -28}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-2, -72}, {38, -80}})}, coordinateSystem(initialScale = 0.1)),
    Diagram);
end OttoCycleIdeal01;
