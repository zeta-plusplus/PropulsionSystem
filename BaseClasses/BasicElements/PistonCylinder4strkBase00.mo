within PropulsionSystem.BaseClasses.BasicElements;

partial model PistonCylinder4strkBase00
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
  parameter Modelica.SIunits.HeatFlowRate Q_add_init = 100 "heat added into fluid" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.HeatFlowRate Q_reject_init = -100 "heat rejected from fluid" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_fluid_1_init = 6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_fluid_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  /* ---------------------------------------------
                    Internal variables
    --------------------------------------------- */
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
  Modelica.SIunits.Work Wout "";
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
  Modelica.SIunits.SpecificEntropy s_fluid_1(start = s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_fluid_2(start = s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //-----
  Modelica.SIunits.SpecificEnergy pwrQm "specific power, pwr/m_flow";
  Modelica.SIunits.SpecificEnergy pwrQmOut "specific power, pwrOut/m_flow";
  Real trqQm "specific torque, trq/m_flow";
  Real trqQmOut "specific torque, trqOut/m_flow";
  
  /* ---------------------------------------------
                    Internal objects
    --------------------------------------------- */
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of inlet";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), state.p(start = p2_init, min = 0.0 + 1.0e-10), state.T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of outlet";
  /* ---------------------------------------------
                    Interface
          --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(tau(start = tau1_init), phi(start = phi1_init)) "" annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(tau(start = tau2_init), phi(start = phi2_init)) "" annotation(
    Placement(visible = true, transformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  VolBDC = VolTDC + VolDisp;
  CR = VolBDC / VolTDC;
  V_flow = 1.0 / 2.0 * VolDisp * Nmech * 1.0 / 60.0;
  m_flow = fluid_1.d * V_flow;
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
//-- shaft --
  flange_1.phi = phi;
  flange_2.phi = phi;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//--- mass conservation ---
  port_1.m_flow = m_flow;
  port_1.m_flow + port_2.m_flow = 0.0;
  pwrOut = -1.0 * pwr;
  
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = omega * 60.0 / (2.0 * Modelica.Constants.pi);
  trqOut = -1.0 * trq;
  trq = flange_1.tau + flange_2.tau;
  dH_1_2_cycle = VolBDC * fluid_1.d * 1.0 / 2.0 * Nmech * 1.0 / 60.0 * (fluid_2.h - fluid_1.h);
  dU_1_2_cycle = VolBDC * fluid_1.d * 1.0 / 2.0 * Nmech * 1.0 / 60.0 * (fluid_2.u - fluid_1.u);
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  //-----
  pwrQm= pwr/m_flow;
  pwrQmOut= pwrOut/m_flow;
  trqQm= trq/m_flow;
  trqQmOut= trqOut/m_flow;
  pwrOut = 1.0 / 2.0  * Wout * Nmech * 1.0 / 60.0;
  
  annotation(
    defaultComponentName = "PistonCylinder",
  Icon(graphics = {Line(origin = {0.39, -10.28}, points = {{-60, -30}, {-60, 60}, {-60, 100}, {60, 100}, {60, 60}, {60, -30}}, thickness = 1.5), Line(origin = {-40, 89}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {-45.6153, 104.79}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {39.3395, 91}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {34.3847, 107.112}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {-61, 89.6778}, points = {{-39, 10}, {21, 10}, {21, -12}}, pattern = LinePattern.Dot, thickness = 1), Line(origin = {-51, 99.661}, points = {{151, 0}, {91, 0}, {91, -20}}, pattern = LinePattern.Dot, thickness = 1), Text(origin = {-29, -150}, extent = {{-71, 8}, {129, -6}}, textString = "%name"), Rectangle(origin = {47, -94}, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-27, 11}, {53, -3}}), Line(origin = {-61.4274, 108.581}, points = {{-17, 0}, {7, 0}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Line(origin = {71.2041, 108.581}, points = {{-17, 0}, {7, 0}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Open}, arrowSize = 4), Rectangle(origin = {14, -54}, rotation = 100, fillPattern = FillPattern.HorizontalCylinder, extent = {{-42, 7}, {89, -7}}), Rectangle(origin = {-1, 40}, fillColor = {85, 0, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-54, -1}, {56, -33}}), Ellipse(origin = {15, -90}, fillColor = {170, 0, 127}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 50}, {12, -50}}), Rectangle(origin = {3, -90}, fillColor = {170, 0, 127}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-13, 50}, {13, -50}}), Ellipse(origin = {-9, -90}, fillColor = {170, 0, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-12, 50}, {12, -50}}), Rectangle(origin = {-70, -94}, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-28, 11}, {56, -3}}), Ellipse(origin = {-14, -90}, fillColor = {170, 0, 127}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-5, 7}, {5, -7}})}, coordinateSystem(extent = {{-100, -140}, {100, 120}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -140}, {100, 120}}, initialScale = 0.1)));
end PistonCylinder4strkBase00;
