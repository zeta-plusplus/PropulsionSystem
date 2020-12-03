within PropulsionSystem.Examples.temp;

model OttoCycleIdealClosed
  /* ---------------------------------------------
          Interface
      --------------------------------------------- */
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
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
  //replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
  //  choicesAllMatching = true);
  replaceable package Medium = engineAir annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
        switch
    --------------------------------------------- */
  parameter Boolean allowAbnormalOperation = false "= true to allow compressor to operate as 'turbine' where PR<=1, false to restrict 1<PR" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
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
  Modelica.SIunits.Torque trq(start = trq_init) "trq via shaft" annotation(
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
  /**/
  Modelica.SIunits.VolumeFlowRate V_flow "volume flow rate through piston-cylinder";
  Modelica.SIunits.MassFlowRate m_flow "mass flow rate through piston-cylinder";
  /*
    Modelica.SIunits.MassFlowRate m_flow_max(start=m_flow1_init) "" annotation(
      Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
    );
    Modelica.SIunits.MassFlowRate m_flow_min(start=m_flow2_init) "" annotation(
      Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
    );
    */
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
  /**/
  //Modelica.SIunits.MassFlowRate u_m_flow "mass flow rate through piston-cylinder";
  //******************************************************************************************
  Modelica.Blocks.Sources.RealExpression u_fracFuel(y = 0.01)  annotation(
    Placement(visible = true, transformation(origin = {-70, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u_Nmech(y = 3000) annotation(
    Placement(visible = true, transformation(origin = {-70, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u_p_state1(y = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u_T_state1(y = 15 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression param_CR(y = 8.0) annotation(
    Placement(visible = true, transformation(origin = {-10, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression param_VolDisp(y = 100 * 10.0 ^ (-6.0)) annotation(
    Placement(visible = true, transformation(origin = {-10, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression param_LHV_fuel(y = 42.8 * 10.0 ^ 6.0) annotation(
    Placement(visible = true, transformation(origin = {-10, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  fracFuel = u_fracFuel.y;
  Nmech = u_Nmech.y;
  fluidState_1.p = u_p_state1.y;
  fluidState_1.T = u_T_state1.y;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- component characteristics --
  CR = param_CR.y;
  VolDisp = param_VolDisp.y;
  LHV_fuel = param_LHV_fuel.y;
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
end OttoCycleIdealClosed;
