within PropulsionSystem.Elements.BasicElements;

model PistonCylinderNonidealOttoMV01
  extends PropulsionSystem.BaseClasses.BasicElements.PistonCylinder4strkBase00;
  /********************************************************
                  imports
              ********************************************************/
  import Modelica.Constants;
  /********************************************************
                  Declaration
  ********************************************************/
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switch_fuel switchFuelType = PropulsionSystem.Types.switches.switch_fuel.gasoline 
    "switch, fuel type, determines function used in effComb calculation."
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  /* ---------------------------------------------
                      parameters
  --------------------------------------------- */
  parameter Real CR_paramInput = 12.0 "compression ratio";
  parameter Modelica.SIunits.Volume VolDisp_paramInput = 100.0 * 10.0 ^ (-6.0) "displacement";
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 43.4 * 10.0 ^ 6.0 "lower heating value of fuel";
  /* ---------------------------------------------
                      Internal variables
  --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow_fuel "mass flow rate of fuel" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEnthalpy dh_state4_port2 "enthalpy change by puming, state4 to port2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrPumping "power of pumping, positive== pwr into fluid, or loss for 'engine'" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrIntk "power of intake stroke, positive== pwr into fluid, or loss for 'engine'" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrExh "power of exhaust stroke, positive== pwr into fluid, or loss for 'engine'" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrCycle "power by cycle, negative==pwr outof component" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Work WintkCycle "work of intake stroke, single cycle, positive== into fluid";
  Modelica.SIunits.Work WexhCycle "work of exhaust stroke, single cycle, positive== into fluid";
  Real pwrPumpingqPwrCycle "pwrPumping / pwrCycle, positive==loss";
  Modelica.SIunits.Pressure arr_p[8];
  Modelica.SIunits.Volume arr_V[8];
  
  
  /* ---------------------------------------------
                      Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.OttoCycleNonideal00 OttoCycle(redeclare package Medium = Medium, switch_u_thermoState =  PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {3.55271e-15, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Subelements.CombustionEfficiency00 calcEffComb(switchFuel= switchFuelType) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  /* ---------------------------------------------
                      Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") annotation(
    Placement(visible = true, transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_fracAir annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //******************************************************************************************
equation
  connect(u_fracFuel, calcEffComb.u_fracFuel) annotation(
    Line(points = {{-120, 0}, {-92, 0}, {-92, 24}, {-62, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(u_fracAir, calcEffComb.u_fracAir) annotation(
    Line(points = {{-120, 40}, {-70, 40}, {-70, 36}, {-62, 36}, {-62, 36}}, color = {0, 0, 127}));
  connect(u_fracFuel, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-120, 0}, {-71.5, 0}, {-71.5, -12}, {-23, -12}}, color = {0, 0, 127}));
  connect(calcEffComb.y_effComb, OttoCycle.u_effComb) annotation(
    Line(points = {{-38, 36}, {-30, 36}, {-30, -4}, {-22, -4}, {-22, -4}}, color = {0, 0, 127}));
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  m_flow_fuel = m_flow * u_fracFuel;
//---
  OttoCycle.u_p_fluidState_1 = fluid_1.p;
  OttoCycle.u_u_fluidState_1 = fluid_1.u;
  OttoCycle.u_Xi_fluidState_1[1:Medium.nXi] = fluid_1.Xi;
//---
//---
  OttoCycle.par_CR = CR_paramInput;
  OttoCycle.par_VolDisp = VolDisp;
  OttoCycle.par_LHV_fuel = LHV_fuel_paramInput;
//---
  WoutCycle = OttoCycle.y_WoutCycle;
  y_m_flow_fuel = m_flow_fuel;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//---
  CR = CR_paramInput;
  VolDisp = VolDisp_paramInput;
//---
  fluid_2.Xi = OttoCycle.y_Xi_fluidState_4;
  dh_state4_port2 = fluid_2.h - OttoCycle.y_h_fluidState_4;
  WintkCycle = fluid_1.p * (-1.0) * VolDisp;
  WexhCycle = fluid_2.p * VolDisp;
  pwrIntk = 1.0 / 2.0 * Nmech * 1.0 / 60.0 * WintkCycle;
  pwrExh = 1.0 / 2.0 * Nmech * 1.0 / 60.0 * WexhCycle;
  pwrPumping = pwrIntk + pwrExh;
  pwrPumpingqPwrCycle = pwrPumping / (-1.0 * pwrCycle);
//---
  fluid_2.h = OttoCycle.y_h_fluidState_4 + pwrPumping / (-1.0 * port_2.m_flow);
//---
  pwrCycle = 1.0 / 2.0 * (-1.0) * WoutCycle * Nmech * 1.0 / 60.0;
  pwr = pwrCycle + pwrPumping;
  pwr_exp = 1.0 / 2.0 * OttoCycle.W_3_4 * Nmech * 1.0 / 60.0;
  pwr_cmp = 1.0 / 2.0 * OttoCycle.W_1_2 * Nmech * 1.0 / 60.0;
  Q_add = 1.0 / 2.0 * OttoCycle.y_Q_2_3 * Nmech * 1.0 / 60.0;
  Q_reject = 1.0 / 2.0 * OttoCycle.y_Q_4_1 * Nmech * 1.0 / 60.0;
//---
  arr_V[1] = OttoCycle.Vol1;
  arr_V[2] = OttoCycle.Vol2;
  arr_V[3] = OttoCycle.Vol3;
  arr_V[4] = OttoCycle.Vol4;
  arr_V[5] = OttoCycle.Vol4;
  arr_V[6] = OttoCycle.Vol2;
  arr_V[7] = OttoCycle.Vol2;
  arr_V[8] = OttoCycle.Vol1;
//---
  arr_p[1] = OttoCycle.fluidState_1.p;
  arr_p[2] = OttoCycle.fluidState_2.p;
  arr_p[3] = OttoCycle.fluidState_3.p;
  arr_p[4] = OttoCycle.fluidState_4.p;
  arr_p[5] = fluid_2.p;
  arr_p[6] = fluid_2.p;
  arr_p[7] = fluid_1.p;
  arr_p[8] = fluid_1.p;
//---
  annotation(
    defaultComponentName = "PistonCylinder",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Icon(coordinateSystem(extent = {{-100, -120}, {100, 120}})));
  
end PistonCylinderNonidealOttoMV01;
