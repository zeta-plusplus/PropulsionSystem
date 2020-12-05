within PropulsionSystem.Elements.BasicElements;

model PistonCylinderIdealOttoMV00
  /********************************************************
      imports
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
      Declaration
  ********************************************************/
  /* ---------------------------------------------
      Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  /* ---------------------------------------------
          switch
      --------------------------------------------- */
  /* ---------------------------------------------
          parameters
      --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 20 * 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluidState_1 ---
  parameter Modelica.SIunits.Pressure p_state1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.Temperature T_state1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state1_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  //--- fluidState_2 ---
  parameter Modelica.SIunits.Pressure p_state2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.Temperature T_state2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state2_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  //--- fluidState_3 ---
  parameter Modelica.SIunits.Pressure p_state3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.Temperature T_state3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state3_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  //--- fluidState_4 ---
  parameter Modelica.SIunits.Pressure p_state4_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.Temperature T_state4_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state4_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  //--- flange_1 ---
  parameter Modelica.SIunits.Torque tau1_init = 0.1 "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  parameter Modelica.SIunits.Angle phi1_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  //--- flange_2 ---
  parameter Modelica.SIunits.Torque tau2_init = pwr_init / (Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  parameter Modelica.SIunits.Angle phi2_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  //--- others ---
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init = 3000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Power pwr_init = -5.0 * 10.0 ^ 5 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Torque trq_init = pwr_init / (Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Angle phi_init = 0.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_1_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_3_init = 8000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_4_init = 8000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  Modelica.SIunits.Power pwr(start = pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrOut(start = -1.0*pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  Modelica.SIunits.Torque trq(start = trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Torque trqOut(start = -1.0*trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  Modelica.SIunits.AngularVelocity omega(start = Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Angle phi(start = phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /**/
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start = Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Volume VolDisp "displacement";
  Modelica.SIunits.Volume Vol1 "volume, state 1";
  Modelica.SIunits.Volume Vol2 "volume, state 2";
  Modelica.SIunits.Volume Vol3 "volume, state 3";
  Modelica.SIunits.Volume Vol4 "volume, state 4";
  Modelica.SIunits.SpecificEntropy s_state_1(start = s_state_1_init) "specific entropy, state 1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_state_2(start = s_state_2_init) "specific entropy, state 2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_state_3(start = s_state_3_init) "specific entropy, state 3" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_state_4(start = s_state_4_init) "specific entropy, state 4" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.VolumeFlowRate V_flow "volume flow rate through piston-cylinder";
  Modelica.SIunits.MassFlowRate m_flow "mass flow rate through piston-cylinder";
  Modelica.SIunits.Mass massFluidCycle "mass of fluid in single cycle in cylinder";
  Modelica.SIunits.Mass massFuelCycle "mass of fuel in single cycle in cylinder";
  Modelica.SIunits.Heat Q_2_3 "heat injected into fluid by combustion";
  Modelica.SIunits.Heat Q_4_1 "heat rejected from fluid by exhaust";
  Modelica.SIunits.SpecificEnthalpy LHV_fuel;
  Modelica.SIunits.Work WoutCycle "work output, single cycle";
  Modelica.SIunits.Work W_1_2 "work, compression, state 1 -> 2";
  Modelica.SIunits.Work W_3_4 "work, expansion, state 3 -> 4";
  Real CR "Compression Ratio";
  Real fracFuel "Fraction of fuel in fluid";
  /* ---------------------------------------------
          Internal objects
      --------------------------------------------- */
  Medium.BaseProperties fluidState_1(p(start = p_state1_init, min = 0.0 + 1.0e-10), T(start = T_state1_init, min = 0.0 + 1.0e-10), state.p(start = p_state1_init, min = 0.0 + 1.0e-10), state.T(start = T_state1_init, min = 0.0 + 1.0e-10), h(start = h_state1_init, min = 0.0 + 1.0e-10)) "fluid state 1";
  Medium.BaseProperties fluidState_2(p(start = p_state2_init, min = 0.0 + 1.0e-10), T(start = T_state2_init, min = 0.0 + 1.0e-10), state.p(start = p_state2_init, min = 0.0 + 1.0e-10), state.T(start = T_state2_init, min = 0.0 + 1.0e-10), h(start = h_state2_init, min = 0.0 + 1.0e-10)) "fluid state 2";
  Medium.BaseProperties fluidState_3(p(start = p_state3_init, min = 0.0 + 1.0e-10), T(start = T_state3_init, min = 0.0 + 1.0e-10), state.p(start = p_state3_init, min = 0.0 + 1.0e-10), state.T(start = T_state3_init, min = 0.0 + 1.0e-10), h(start = h_state3_init, min = 0.0 + 1.0e-10)) "fluid state 3";
  Medium.BaseProperties fluidState_4(p(start = p_state4_init, min = 0.0 + 1.0e-10), T(start = T_state4_init, min = 0.0 + 1.0e-10), state.p(start = p_state4_init, min = 0.0 + 1.0e-10), state.T(start = T_state4_init, min = 0.0 + 1.0e-10), h(start = h_state4_init, min = 0.0 + 1.0e-10)) "fluid state 4";
          Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_state1(duration = 10, height = 100 * 1000, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_state1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.Constant const_CR(k = 8.0) annotation(
    Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_VolDisp(k = 100 * 10.0 ^ (-6.0)) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_LHV_fuel(k = 43.4 * 10.0 ^ 6.0) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//******************************************************************************************
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  fracFuel = ramp_fracFuel.y;
  Nmech = ramp_Nmech.y;
  fluidState_1.p = ramp_p_state1.y;
  fluidState_1.T = ramp_T_state1.y;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- component characteristics --
  CR = const_CR.y;
  VolDisp = const_VolDisp.y;
  LHV_fuel = const_LHV_fuel.y;
  V_flow = 1.0 / 2.0 * VolDisp * Nmech * 1.0 / 60.0;
  Vol1 = Vol2 + VolDisp;
  m_flow = fluidState_1.d * V_flow;
//fracFuel= u_m_flow_fuel / m_flow;
  massFluidCycle = fluidState_1.d * Vol1;
  massFuelCycle = fracFuel * massFluidCycle;
//--- state1 <-> state2 ---
  CR = Vol1 / Vol2;
  s_state_1 = Medium.specificEntropy(fluidState_1.state);
  fluidState_2.d = massFluidCycle / Vol2;
  s_state_2 = Medium.specificEntropy(fluidState_2.state);
  s_state_2 = s_state_1;
  W_1_2 = massFluidCycle * (fluidState_2.u - fluidState_1.u);
//--- state2 <-> state3 ---
  Vol3 = Vol2;
  fluidState_3.d = massFluidCycle / Vol3;
  Q_2_3 = massFuelCycle * LHV_fuel;
  Q_2_3 = massFluidCycle * (fluidState_3.u - fluidState_2.u);
  s_state_3 = Medium.specificEntropy(fluidState_3.state);
//--- state3 <-> state4 ---
  Vol4 / Vol3 = CR;
  fluidState_4.d = massFluidCycle / Vol4;
  s_state_4 = Medium.specificEntropy(fluidState_4.state);
  s_state_4 = s_state_3;
  W_3_4 = massFluidCycle * (fluidState_4.u - fluidState_3.u);
//--- state4 <-> state1 ---
  Q_4_1 = massFluidCycle * (fluidState_1.u - fluidState_4.u);
//---
  WoutCycle = (-1.0) * (W_1_2 + W_3_4);
  pwr = 1.0 / 2.0 * (-1.0) * WoutCycle * Nmech * 1.0 / 60.0;
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = omega * 60.0 / (2.0 * Modelica.Constants.pi);
  pwrOut= -1.0*pwr;
  trqOut= -1.0*trq;
  
  
annotation(
  defaultComponentName = "PistonCylinder",
  Icon(graphics = {Line(origin = {1.54381, 1.6701}, points = {{-88, -102}, {86, -102}}, thickness = 6), Line(origin = {0.38918, -10.2841}, points = {{-60, -40}, {-60, 60}, {-60, 100}, {60, 100}, {60, 60}, {60, -40}}, thickness = 2), Rectangle(origin = {-1, 41}, fillPattern = FillPattern.Solid, extent = {{-56, -1}, {58, -33}}), Line(origin = {13.78, -87.87}, points = {{-13.7819, 111.869}, {16.2181, 27.8688}, {-13.7819, -12.1312}}, thickness = 2.5), Line(origin = {-40, 89}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {-45.6153, 104.79}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {39.3395, 91}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {34.3847, 124.112}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {-61, 89.6778}, points = {{-39, 10}, {21, 10}, {21, -12}}, pattern = LinePattern.Dot, thickness = 1), Line(origin = {-51, 99.661}, points = {{151, 0}, {91, 0}, {91, -20}}, pattern = LinePattern.Dot, thickness = 1), Text(origin = {-29, 112}, extent = {{-51, 8}, {109, -6}}, textString = "%name")}, coordinateSystem(extent = {{-100, -120}, {100, 120}}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "");

end PistonCylinderIdealOttoMV00;
