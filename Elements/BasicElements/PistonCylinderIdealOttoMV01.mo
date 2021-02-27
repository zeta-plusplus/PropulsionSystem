within PropulsionSystem.Elements.BasicElements;

model PistonCylinderIdealOttoMV01
  extends PropulsionSystem.BaseClasses.BasicElements.PistonCylinder4strkBase00;
  /********************************************************
                imports
            ********************************************************/
  import Modelica.Constants;
  /********************************************************
                Declaration
            ********************************************************/
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
  
  Real pwrPumpingqPwrCycle "|pwrPumping / pwrCycle|";
  
  
  /* ---------------------------------------------
                    Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.OttoCycleIdeal00 OttoCycle(redeclare package Medium = Medium, switch_u_thermoState = PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  
  
  /* ---------------------------------------------
                    Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") annotation(
    Placement(visible = true, transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //******************************************************************************************
equation
  connect(u_fracFuel, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-120, 30}, {-70, 30}, {-70, 31}, {-24, 31}}, color = {0, 0, 127}));
  
  
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
  dh_state4_port2= fluid_2.h - OttoCycle.y_h_fluidState_4;
  
  WintkCycle= fluid_1.p*(-1.0)*VolDisp;
  WexhCycle= fluid_2.p*VolDisp;
  pwrIntk= (1.0/2.0* Nmech* 1.0/60.0)*WintkCycle;
  pwrExh= (1.0/2.0* Nmech* 1.0/60.0)*WexhCycle;
  pwrPumping= pwrIntk + pwrExh;
  pwrPumpingqPwrCycle= pwrPumping / (-1.0*pwrCycle);
  //---
  fluid_2.h= OttoCycle.y_h_fluidState_4 + pwrPumping/(-1.0*port_2.m_flow);  
  
  //---
  pwrCycle= 1.0 / 2.0 * (-1.0) * WoutCycle * Nmech * 1.0 / 60.0;
  pwr = pwrCycle + pwrPumping;
  
  pwr_exp = 1.0 / 2.0 * OttoCycle.W_3_4 * Nmech * 1.0 / 60.0;
  pwr_cmp = 1.0 / 2.0 * OttoCycle.W_1_2 * Nmech * 1.0 / 60.0;
  Q_add = 1.0 / 2.0 * OttoCycle.y_Q_2_3 * Nmech * 1.0 / 60.0;
  Q_reject = 1.0 / 2.0 * OttoCycle.y_Q_4_1 * Nmech * 1.0 / 60.0;
  
  
  annotation(
    defaultComponentName = "PistonCylinder",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Icon(coordinateSystem(extent = {{-100, -120}, {100, 120}})));
end PistonCylinderIdealOttoMV01;
