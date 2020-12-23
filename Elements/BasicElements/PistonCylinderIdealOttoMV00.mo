within PropulsionSystem.Elements.BasicElements;

model PistonCylinderIdealOttoMV00
  extends PropulsionSystem.BaseClasses.BasicElements.PistonCylinderBase00;
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
  parameter Real CR_paramInput = 10.0 "compression ratio";
  parameter Modelica.SIunits.Volume VolDisp_paramInput = 100.0 * 10.0 ^ (-6.0) "displacement";
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 43.4 * 10.0 ^ 6.0 "lower heating value of fuel";
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
  parameter Modelica.SIunits.Power pwr_cmp_init = 100 "power of compression" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Power pwr_exp_init = -100 "power of expansion" annotation(
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
  parameter Modelica.SIunits.HeatFlowRate Q_add_init = 100 "heat added into fluid" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.HeatFlowRate Q_reject_init = -100 "heat rejected from fluid" annotation(
    Dialog(tab = "Initialization", group = "others"));
  /* ---------------------------------------------
                  Internal variables
        --------------------------------------------- */
  /*
    
    */
  Modelica.SIunits.AngularVelocity omega(start = Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start = Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Angle phi(start = phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Torque trq(start = trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Torque trqOut(start = -1.0 * trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.MassFlowRate m_flow_fuel "mass flow rate of fuel";
  Modelica.SIunits.MassFlowRate m_flow_max(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.MassFlowRate m_flow_min(start = m_flow2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.VolumeFlowRate V_flow "volume flow rate through piston-cylinder";
  Modelica.SIunits.MassFlowRate m_flow "mass flow rate through piston-cylinder";
  Modelica.SIunits.Volume VolDisp "displacement";
  Modelica.SIunits.Volume VolBDC "volume, at BDC(bottom dead center)";
  Modelica.SIunits.Volume VolTDC "volume, at TDC(top dead center)";
  Real CR "Compression Ratio";
  Modelica.SIunits.Work WoutCycle "work output, single cycle";
  Modelica.SIunits.Power pwr(start = pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrOut(start = -1.0 * pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwr_cmp(start = pwr_cmp_init) "power of compression" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwr_exp(start = pwr_exp_init) "power of expansion" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.HeatFlowRate Q_add(start = Q_add_init) "heat added into fluid" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.HeatFlowRate Q_reject(start = Q_reject_init) "heat rejected from fluid" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.EnthalpyFlowRate dH_1_2_cycle "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.EnergyFlowRate dU_1_2_cycle "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /* ---------------------------------------------
                  Internal objects
        --------------------------------------------- */
  /**/
  PropulsionSystem.Subelements.OttoCycleIdeal00 OttoCycle(redeclare package Medium = Medium, switch_u_thermoState = PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of inlet";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), state.p(start = p2_init, min = 0.0 + 1.0e-10), state.T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of outlet";
  /* ---------------------------------------------
                  Interface
        --------------------------------------------- */
  /*
    
    */
  Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") annotation(
    Placement(visible = true, transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(tau(start = tau1_init), phi(start = phi1_init)) "" annotation(
    Placement(visible = true, transformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(tau(start = tau2_init), phi(start = phi2_init)) "" annotation(
    Placement(visible = true, transformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //******************************************************************************************
equation
  connect(u_fracFuel, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-120, 30}, {-70, 30}, {-70, 31}, {-24, 31}}, color = {0, 0, 127}));
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  VolBDC = VolTDC + VolDisp;
  CR= VolBDC / VolTDC;
  V_flow = 1.0 / 2.0 * VolDisp * Nmech * 1.0 / 60.0;
  m_flow = fluid_1.d * V_flow;
  m_flow_fuel = m_flow * u_fracFuel;
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
// distinguish inlet side
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
  if allowFlowReversal == false then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  else
    if m_flow_max == port_1.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    elseif m_flow_max == port_2.m_flow then
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    else
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    end if;
  end if;
//---
  OttoCycle.u_p_fluidState_1 = fluid_1.p;
  OttoCycle.u_u_fluidState_1 = fluid_1.u;
  OttoCycle.u_Xi_fluidState_1[1:Medium.nXi] = fluid_1.Xi;
//---
  fluid_2.Xi = OttoCycle.y_Xi_fluidState_4;
  fluid_2.p = OttoCycle.y_p_fluidState_4;
  fluid_2.u = OttoCycle.y_u_fluidState_4;
//-- shaft --
  flange_1.phi = phi;
  flange_2.phi = phi;
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
//--- mass conservation ---
  port_1.m_flow = m_flow;
  port_1.m_flow + port_2.m_flow = 0.0;
//---
  pwr = 1.0 / 2.0 * (-1.0) * WoutCycle * Nmech * 1.0 / 60.0;
  pwrOut = -1.0 * pwr;
  pwr_exp = 1.0 / 2.0 * OttoCycle.W_3_4 * Nmech * 1.0 / 60.0;
  pwr_cmp = 1.0 / 2.0 * OttoCycle.W_1_2 * Nmech * 1.0 / 60.0;
  Q_add = 1.0 / 2.0 * OttoCycle.y_Q_2_3 * Nmech * 1.0 / 60.0;
  Q_reject = 1.0 / 2.0 * OttoCycle.y_Q_4_1 * Nmech * 1.0 / 60.0;
  dH_1_2_cycle = (VolBDC*fluid_1.d*1.0/2.0*Nmech*1.0/60.0) * (fluid_2.h - fluid_1.h);
  dU_1_2_cycle = (VolBDC*fluid_1.d*1.0/2.0*Nmech*1.0/60.0) * (fluid_2.u - fluid_1.u);
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = omega * 60.0 / (2.0 * Modelica.Constants.pi);
  trqOut = -1.0 * trq;
  trq = flange_1.tau + flange_2.tau;
  
  annotation(
    defaultComponentName = "PistonCylinder",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Icon(coordinateSystem(extent = {{-100, -120}, {100, 120}})));
end PistonCylinderIdealOttoMV00;
