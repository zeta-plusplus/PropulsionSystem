within PropulsionSystem.Subelements;

block DieselCycleIdeal01
  extends PropulsionSystem.Icons.Icon_DieselCycle;
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
  parameter switches.switch_input_ThermodynamicState switch_u_thermoState = switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  /* ---------------------------------------------
                  parameters
          --------------------------------------------- */
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
  Modelica.SIunits.Mass massFuelCycle "mass of fuel in single cycle in cylinder";
  Modelica.SIunits.Heat Q_2_3 "heat injected into fluid by combustion";
  Modelica.SIunits.Heat Q_4_1 "heat rejected from fluid by exhaust";
  Modelica.SIunits.Work WoutCycle "work output, single cycle";
  Modelica.SIunits.Work W_1_2 "work, compression, state 1 -> 2";
  Modelica.SIunits.Work W_2_3 "work, expansion, state 2 -> 3";
  Modelica.SIunits.Work W_3_4 "work, expansion, state 3 -> 4";
  Modelica.SIunits.SpecificEnergy WqmOutCycle "WoutCycle/mass";
  Modelica.SIunits.SpecificEnergy Wqm_1_2 "W_1_2/mass";
  Modelica.SIunits.SpecificEnergy Wqm_2_3 "W_2_3/mass";
  Modelica.SIunits.SpecificEnergy Wqm_3_4 "W_3_4/mass";
  Modelica.SIunits.SpecificEnergy Qqm_2_3 "Q_2_3/mass";
  Modelica.SIunits.SpecificEnergy Qqm_4_1 "Q_4_1/mass";
  Real CR "Compression Ratio";
  Real ER_2_3 "Expansion Ratio, state 2 -> 3";
  Real ER_3_4 "Expansion Ratio, state 3 -> 4";
  Real fracFuel "Fraction of fuel in fluid";
  Real effThermal "Thermal efficiency";
  Modelica.SIunits.SpecificEnthalpy arr_h[5];
  Modelica.SIunits.SpecificEnergy arr_u[5];
  Modelica.SIunits.SpecificEntropy arr_s[5];
  Modelica.SIunits.Pressure arr_p[5];
  Modelica.SIunits.Volume arr_V[5];
  Modelica.SIunits.SpecificVolume arr_v[5];
  Modelica.SIunits.Temperature arr_T[5];
  Real alpha "cutoff ratio, v3/v2";
  Modelica.SIunits.Pressure pme "mean effective pressure of cycle";
  Boolean flag_Wexp_gt_Q23 "flag, true if |Q_2_3|<|W_2_3+W_3_4|";
  /* ---------------------------------------------
                  Internal objects
              --------------------------------------------- */
  Medium.BaseProperties fluidState_1(p(start = p_state1_init, min = 0.0 + 1.0e-10), T(start = T_state1_init, min = 0.0 + 1.0e-10), state.p(start = p_state1_init, min = 0.0 + 1.0e-10), state.T(start = T_state1_init, min = 0.0 + 1.0e-10), h(start = h_state1_init, min = 0.0 + 1.0e-10)) "fluid state 1";
  Medium.BaseProperties fluidState_2(p(start = p_state2_init, min = 0.0 + 1.0e-10), T(start = T_state2_init, min = 0.0 + 1.0e-10), state.p(start = p_state2_init, min = 0.0 + 1.0e-10), state.T(start = T_state2_init, min = 0.0 + 1.0e-10), h(start = h_state2_init, min = 0.0 + 1.0e-10)) "fluid state 2";
  Medium.BaseProperties fluidState_3(p(start = p_state3_init, min = 0.0 + 1.0e-10), T(start = T_state3_init, min = 0.0 + 1.0e-10), state.p(start = p_state3_init, min = 0.0 + 1.0e-10), state.T(start = T_state3_init, min = 0.0 + 1.0e-10), h(start = h_state3_init, min = 0.0 + 1.0e-10)) "fluid state 3";
  Medium.BaseProperties fluidState_4(p(start = p_state4_init, min = 0.0 + 1.0e-10), T(start = T_state4_init, min = 0.0 + 1.0e-10), state.p(start = p_state4_init, min = 0.0 + 1.0e-10), state.T(start = T_state4_init, min = 0.0 + 1.0e-10), h(start = h_state4_init, min = 0.0 + 1.0e-10)) "fluid state 4";
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_p_fluidState_1(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_T_fluidState_1(unit = "K", displayUnit = "K") if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState annotation(
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_h_fluidState_1(unit = "J/kg", displayUnit = "J/kg") if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_h_for_ThermodynamicState annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_u_fluidState_1(unit = "J/kg", displayUnit = "J/kg") if switch_u_thermoState == switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState annotation(
    Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Xi_fluidState_1[Medium.nXi] annotation(
    Placement(visible = true, transformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Qin annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-114, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput par_CR annotation(
    Placement(visible = true, transformation(origin = {-90, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-80, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput par_VolDisp(unit = "m3", displayUnit = "m3") annotation(
    Placement(visible = true, transformation(origin = {-50, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_WoutCycle(unit = "J", displayUnit = "J") annotation(
    Placement(visible = true, transformation(origin = {20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {40, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_p_fluidState_4(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluidState_4(unit = "K", displayUnit = "K") annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Xi_fluidState_4[Medium.nXi] annotation(
    Placement(visible = true, transformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_fuel(quantity = "Mass", unit = "kg", displayUnit = "kg") annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {114, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_h_fluidState_4(unit = "J/kg", displayUnit = "J/kg") annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_u_fluidState_4(unit = "J/kg", displayUnit = "J/kg") annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_fluid(quantity = "Mass", unit = "kg", displayUnit = "kg") annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {114, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluidState_3(unit = "K", displayUnit = "K") annotation(
    Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-10, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluidState_2(unit = "K", displayUnit = "K") annotation(
    Placement(visible = true, transformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-60, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_p_fluidState_2(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-80, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_p_fluidState_3(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-30, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_Q_4_1(displayUnit = "J", unit = "J") annotation(
    Placement(visible = true, transformation(origin = {50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {60, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y_Q_2_3(displayUnit = "J", unit = "J") annotation(
    Placement(visible = true, transformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {80, -118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
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
  y_m_fuel = massFuelCycle;
  y_WoutCycle = WoutCycle;
  y_Q_4_1 = Q_4_1;
  y_Q_2_3 = Q_2_3;
  y_p_fluidState_2 = fluidState_2.p;
  y_T_fluidState_2 = fluidState_2.T;
  y_p_fluidState_3 = fluidState_3.p;
  y_T_fluidState_3 = fluidState_3.T;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- component characteristics --
  Vol1 = Vol2 + VolDisp;
  massFluidCycle = fluidState_1.d * Vol1;
  v1 = 1.0 / fluidState_1.d;
  massFuelCycle = fracFuel * massFluidCycle;
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
  fluidState_3.p = fluidState_2.p;
  fluidState_3.d = massFluidCycle / Vol3;
  fluidState_3.Xi = fluidState_2.Xi;
  Q_2_3 = massFluidCycle * (fluidState_3.h - fluidState_2.h);
  W_2_3 = (-1.0) * fluidState_2.p * (Vol3 - Vol2);
  Vol3 / Vol2 = ER_2_3;
  v3 = 1.0 / fluidState_3.d;
  s_state_3 = Medium.specificEntropy(fluidState_3.state);
  alpha= v3/v2;
//--- state3 <-> state4 ---
  Vol4 / Vol3 = ER_3_4;
  fluidState_4.d = massFluidCycle / Vol4;
  v4 = 1.0 / fluidState_4.d;
  s_state_4 = Medium.specificEntropy(fluidState_4.state);
  fluidState_4.Xi = fluidState_3.Xi;
  s_state_4 = s_state_3;
  W_3_4 = massFluidCycle * (fluidState_4.u - fluidState_3.u);
//--- state4 <-> state1 ---
  Vol1 = Vol4;
  Q_4_1 = massFluidCycle * (fluidState_1.u - fluidState_4.u);
//---
  WoutCycle = (-1.0) * (W_2_3 + W_3_4 + W_1_2);
  WqmOutCycle= WoutCycle/massFluidCycle;
  Wqm_1_2= W_1_2/massFluidCycle;
  Wqm_2_3= W_2_3/massFluidCycle;
  Wqm_3_4= W_3_4/massFluidCycle;
  Qqm_2_3= Q_2_3/massFluidCycle;
  Qqm_4_1= Q_4_1/massFluidCycle;
  pme= WoutCycle/VolDisp;
//---
  if Q_2_3 < (-1.0) * (W_2_3 + W_3_4) then
    flag_Wexp_gt_Q23 = true;
  else
    flag_Wexp_gt_Q23 = false;
  end if;
//---
  if 0.0 <= massFuelCycle then
    effThermal = WoutCycle / u_Qin;
  else
    effThermal = 0.0;
  end if;
//---
  arr_h[1] = fluidState_1.h;
  arr_h[2] = fluidState_2.h;
  arr_h[3] = fluidState_3.h;
  arr_h[4] = fluidState_4.h;
  arr_h[5] = fluidState_1.h;
  arr_u[1] = fluidState_1.u;
  arr_u[2] = fluidState_2.u;
  arr_u[3] = fluidState_3.u;
  arr_u[4] = fluidState_4.u;
  arr_u[5] = fluidState_1.u;
  arr_p[1] = fluidState_1.p;
  arr_p[2] = fluidState_2.p;
  arr_p[3] = fluidState_3.p;
  arr_p[4] = fluidState_4.p;
  arr_p[5] = fluidState_1.p;
  arr_T[1] = fluidState_1.T;
  arr_T[2] = fluidState_2.T;
  arr_T[3] = fluidState_3.T;
  arr_T[4] = fluidState_4.T;
  arr_T[5] = fluidState_1.T;
  arr_s[1] = s_state_1;
  arr_s[2] = s_state_2;
  arr_s[3] = s_state_3;
  arr_s[4] = s_state_4;
  arr_s[5] = s_state_1;
  arr_V[1] = Vol1;
  arr_V[2] = Vol2;
  arr_V[3] = Vol3;
  arr_V[4] = Vol4;
  arr_V[5] = Vol1;
  arr_v[1] = v1;
  arr_v[2] = v2;
  arr_v[3] = v3;
  arr_v[4] = v4;
  arr_v[5] = v1;
  annotation(
    defaultComponentName = "DieselCycle",
    Icon(graphics = {Text(origin = {4, -78}, extent = {{-104, 8}, {96, -12}}, textString = "%name"), Rectangle(origin = {120, -41}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-12, 75}, {12, -73}}), Rectangle(origin = {98, -65}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{2, 65}, {10, 5}}), Rectangle(origin = {-120, -41}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-12, 75}, {12, -73}}), Rectangle(origin = {-96, -75}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-12, 75}, {-4, 15}}), Rectangle(origin = {36, -63}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-8, -43}, {58, -67}}), Rectangle(origin = {54, -153}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, 53}, {26, 47}}), Rectangle(origin = {-84, -63}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-8, -43}, {36, -67}}), Rectangle(origin = {-34, -63}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-8, -43}, {36, -67}}), Rectangle(origin = {-66, -153}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, 53}, {6, 47}}), Rectangle(origin = {-16, -153}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-14, 53}, {6, 47}})}, coordinateSystem(initialScale = 0.1)),
    Diagram);
end DieselCycleIdeal01;
