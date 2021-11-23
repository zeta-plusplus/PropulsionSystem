within PropulsionSystem.Elements.BasicElements;

model PistonCylinderNonidealDieselMV01
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
  parameter PropulsionSystem.Types.switches.switch_fuel switchFuelType = PropulsionSystem.Types.switches.switch_fuel.diesel "switch, fuel type, determines function used in effComb calculation." annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean use_regcurve_effComb = false "get effComb from regression curve, effComb=1 if false" annotation(
    Evaluate = true,
    HideResult = false,
    choices(checkBox = true), Dialog(group = "switch"));
  
  /* ---------------------------------------------
                          parameters
      --------------------------------------------- */
  parameter Real CR_paramInput = 18.0 "compression ratio";
  parameter Modelica.SIunits.Volume VolDisp_paramInput = 100.0 * 10.0 ^ (-6.0) "displacement";
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 42.6 * 10.0 ^ 6.0 "lower heating value of fuel";
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
  Modelica.SIunits.Power pwrFuelSply "LHV of fuel*m_flow_fuel" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Work WintkCycle "work of intake stroke, single cycle, positive== into fluid";
  Modelica.SIunits.Work WexhCycle "work of exhaust stroke, single cycle, positive== into fluid";
  Real pwrPumpingqPwrCycle "pwrPumping / pwrCycle, positive==loss";
  Modelica.SIunits.Pressure arr_p[8];
  Modelica.SIunits.Volume arr_V[8];
  /* ---------------------------------------------
                          Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.DieselCycleNonideal00 DieselCycle(redeclare package Medium = Medium, switch_u_thermoState = PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Subelements.CombustionEfficiency00 calcEffComb(switchFuel = switchFuelType) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  /* ---------------------------------------------
                          Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") annotation(
    Placement(visible = true, transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_fracAir annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
              Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
//******************************************************************************************
equation
  connect(switch1.y, DieselCycle.u_effComb) annotation(
    Line(points = {{-8, 30}, {4, 30}, {4, -4}, {16, -4}, {16, -2}}, color = {0, 0, 127}));
  connect(calcEffComb.y_effComb, switch1.u1) annotation(
    Line(points = {{-58, 36}, {-48, 36}, {-48, 38}, {-32, 38}, {-32, 38}}, color = {0, 0, 127}));
  connect(const.y, switch1.u3) annotation(
    Line(points = {{-58, -30}, {-46, -30}, {-46, 22}, {-32, 22}, {-32, 22}}, color = {0, 0, 127}));
  connect(u_fracAir, calcEffComb.u_fracAir) annotation(
    Line(points = {{-120, 40}, {-94, 40}, {-94, 36}, {-81, 36}}, color = {0, 0, 127}));
  connect(calcEffComb.y_fracFuelSat, DieselCycle.u_fracFuel) annotation(
    Line(points = {{-59, 32}, {-56, 32}, {-56, -12}, {15, -12}}, color = {0, 0, 127}));
  connect(u_fracFuel, calcEffComb.u_fracFuel) annotation(
    Line(points = {{-120, 0}, {-92, 0}, {-92, 24}, {-81, 24}}, color = {0, 0, 127}));
  connect(elementBus1.pwrFuelSply, pwrFuelSply);
  switch1.u2= use_regcurve_effComb;
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  m_flow_fuel = m_flow * u_fracFuel;
//---
  DieselCycle.u_p_fluidState_1 = fluid_1.p;
  DieselCycle.u_u_fluidState_1 = fluid_1.u;
  DieselCycle.u_Xi_fluidState_1[1:Medium.nXi] = fluid_1.Xi;
//---
//---
  DieselCycle.par_CR = CR_paramInput;
  DieselCycle.par_VolDisp = VolDisp;
  DieselCycle.par_LHV_fuel = LHV_fuel_paramInput;
//---
  WoutCycle = DieselCycle.y_WoutCycle;
  y_m_flow_fuel = m_flow_fuel;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//---
  CR = CR_paramInput;
  VolDisp = VolDisp_paramInput;
//---
  fluid_2.Xi = DieselCycle.y_Xi_fluidState_4;
  dh_state4_port2 = fluid_2.h - DieselCycle.y_h_fluidState_4;
  WintkCycle = fluid_1.p * (-1.0) * VolDisp;
  WexhCycle = fluid_2.p * VolDisp;
  pwrIntk = 1.0 / 2.0 * Nmech * 1.0 / 60.0 * WintkCycle;
  pwrExh = 1.0 / 2.0 * Nmech * 1.0 / 60.0 * WexhCycle;
  pwrPumping = pwrIntk + pwrExh;
  pwrPumpingqPwrCycle = pwrPumping / (-1.0 * pwrCycle);
  pwrFuelSply = DieselCycle.LHV_fuel * m_flow_fuel;
//---
  fluid_2.h = DieselCycle.y_h_fluidState_4 + pwrPumping / (-1.0 * port_2.m_flow);
//---
  pwrCycle = 1.0 / 2.0 * (-1.0) * WoutCycle * Nmech * 1.0 / 60.0;
  pwr = pwrCycle + pwrPumping;
  pwr_exp = 1.0 / 2.0 * DieselCycle.W_3_4 * Nmech * 1.0 / 60.0;
  pwr_cmp = 1.0 / 2.0 * DieselCycle.W_1_2 * Nmech * 1.0 / 60.0;
  Q_add = 1.0 / 2.0 * DieselCycle.y_Q_2_3 * Nmech * 1.0 / 60.0;
  Q_reject = 1.0 / 2.0 * DieselCycle.y_Q_4_1 * Nmech * 1.0 / 60.0;
//---
  arr_V[1] = DieselCycle.Vol1;
  arr_V[2] = DieselCycle.Vol2;
  arr_V[3] = DieselCycle.Vol3;
  arr_V[4] = DieselCycle.Vol4;
  arr_V[5] = DieselCycle.Vol4;
  arr_V[6] = DieselCycle.Vol2;
  arr_V[7] = DieselCycle.Vol2;
  arr_V[8] = DieselCycle.Vol1;
//---
  arr_p[1] = DieselCycle.fluidState_1.p;
  arr_p[2] = DieselCycle.fluidState_2.p;
  arr_p[3] = DieselCycle.fluidState_3.p;
  arr_p[4] = DieselCycle.fluidState_4.p;
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
end PistonCylinderNonidealDieselMV01;
