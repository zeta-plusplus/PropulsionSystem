within PropulsionSystem.BaseClasses.BasicElements;

partial model NozzleBase02
  /********************************************************
                imports
      ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import PropulsionSystem.Types.switches;
  import units = Modelica.Units.SI;
  /********************************************************
                       Declaration
      ********************************************************/
  /* ---------------------------------------------
              Type definitions
                only valid in this class
      --------------------------------------------- */
  type switchDefineFg = enumeration(FullyExpandedFlow "Fg:= m_flow*V2", ThroatFlowAndPressure "Fg:= m_flow*V_th +A*(p_th - p2) ");
  /* ---------------------------------------------
              switch
      --------------------------------------------- */
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  parameter switchDefineFg switch_defineFg = switchDefineFg.FullyExpandedFlow "definition of Fg. influence on Cv definition" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean use_flangeThrust = false "" annotation(
    Dialog(group = "switch"),
    Evaluate = true);
  parameter Boolean show_divergentSection = false "" annotation(
    Dialog(group = "switch"),
    Evaluate = true);
  
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  /* ---------------------------------------------
              Package
      --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
              parameters
          --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter units.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Pressure p1_init(displayUnit = "Pa") = PR_init*p2_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Temperature T1_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init*1.004*1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter units.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0*m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Pressure p2_init(displayUnit = "Pa") = 101.3*1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Temperature T2_init(displayUnit = "K") = 300 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init*1.004*1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- others ---
  parameter Real PR_init = 2.5 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real Cv_init = 0.99 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real CdTh_init = 0.99 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real MNth_init = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity V_2is_init = 480.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity V_2_init = Cv_init*V_2is_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity V_th_choked_init = 410.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity V_th_fullExp_init = V_2_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Velocity V_th_init = V_th_choked_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEnthalpy h_2is_init = h1_init - 1.0/2.0*V_2is_init^2.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Force Fg_init = m_flow1_init*V_2_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Area AeTh_init = 0.0014*m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Area AmechTh_init = AeTh_init/CdTh_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEntropy s_fluid_1_init = 7100.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEntropy s_fluid_2_init = 7200.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  /* ---------------------------------------------
              Internal variables
      --------------------------------------------- */
  units.SpecificEntropy s_fluid_1(start = s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_2(start = s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_th(start = s_fluid_2_init) "specific entropy, fluid_th" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_2Tot(start = s_fluid_2_init) "specific entropy, fluid_2Tot" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_max(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_min(start = m_flow2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity V_2(start = V_2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity Vsound2(start = V_2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity VsoundAmb(start = V_2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity V_2is(start = V_2is_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real PR(start = PR_init, min = if allowFlowReversal then -Constants.inf else 0.0 + 1.0e-10) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real CdTh(start = CdTh_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real Cd2(start = CdTh_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real Cv(start = Cv_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEnthalpy h_2is(start = h_2is_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Force Fg(start = Fg_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //-throat-
  units.MassFlowRate m_flow_th(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0 + 1.0e-10) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Area AmechTh(start = AmechTh_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Area AeTh(start = AeTh_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Area Amech2(start = AmechTh_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Area Ae2(start = AeTh_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity V_th(start = V_th_init, min = if allowFlowReversal then -Constants.inf else 0.0 + 1.0e-10) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Velocity VsoundTh(start = V_th_init, min = if allowFlowReversal then -Constants.inf else 0.0 + 1.0e-10) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real MNth(start = MNth_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real MN2(start = MNth_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real MN2wrtAmb(start = MNth_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //--full expansion--
  units.Velocity V_th_fullExp(start = V_th_fullExp_init, min = if allowFlowReversal then -Constants.inf else 0.0 + 1.0e-10) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //--choked--
  units.Velocity V_th_choked(start = V_th_choked_init, min = if allowFlowReversal then -Constants.inf else 0.0 + 1.0e-10) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real CdThDes;
  Real Cd2des;
  Real CvDes;
  
  /* ---------------------------------------------
              Internal objects
          --------------------------------------------- */
  outer EngineSimEnvironment environment annotation(
    Placement(transformation(origin = {-50, 78}, extent = {{-10, -10}, {10, 10}})));
  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of inlet";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of sink after expansion";
  Medium.BaseProperties fluid_amb(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of ambient";
  Medium.BaseProperties fluid_2Tot(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of outlet, total";
  Medium.BaseProperties fluidStat_th(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "static flow station of throat";
  Medium.BaseProperties fluid_th(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of throat";
  Medium.BaseProperties fluidStat_th_fullExp(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluidStat_th_choked(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "";
  
  
  /* ---------------------------------------------
              Interface
          --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-120, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) "flow sink port after expansion" annotation(
    Placement(transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {119, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_amb(redeclare package Medium = Medium, h_outflow(min = 0.0 + 1.0e-10, start = h2_init), m_flow(max = if allowFlowReversal then +Constants.inf else 0.0, start = m_flow2_init), p(min = 0.0 + 1.0e-10, start = p2_init)) "fluid node of ambient air" annotation(
    Placement(transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {80, 100}, extent = {{-10, -10}, {10, 10}})));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flangeThrust if (use_flangeThrust == true) annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -1}, extent = {{-10, -10}, {10, 10}})));
  
  //********************************************************************************
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
  //-- fluidPort_amb --
  fluid_amb.p = port_amb.p;
  port_amb.h_outflow = fluid_amb.h;
  port_amb.Xi_outflow= fluid_amb.Xi;
  fluid_amb.h = actualStream(port_amb.h_outflow);
  fluid_amb.Xi = actualStream(port_amb.Xi_outflow);
  port_amb.m_flow = 1.0;
  
//----- distinguish inlet side
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
  //-----
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
  //-----
  if (use_flangeThrust == true) then
    flangeThrust.f = -1*Fg;
  end if;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
  fluid_2Tot.Xi = fluid_1.Xi;
  fluidStat_th.Xi = fluid_1.Xi;
  fluid_th.Xi = fluid_1.Xi;
  fluidStat_th_fullExp.Xi = fluid_1.Xi;
  fluidStat_th_choked.Xi = fluid_1.Xi;
  fluid_2Tot.p = fluid_1.p;
//-- energy conservation --
  port_1.m_flow*fluid_1.h + port_2.m_flow*fluid_2Tot.h = 0;
  PR = fluid_1.p/fluid_2.p;
//-- full expansion --
  fluid_1.h = h_2is + sign(V_2is)*abs(V_2is)^2.0*(1.0/2.0);
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  V_2 = Cv*V_2is;
  fluid_1.h = fluid_2.h + sign(V_2)*abs(V_2)^2.0/2.0;
//--- throat, p, T ---
  fluid_th.p = fluid_1.p;
  fluid_th.h = fluid_1.h;
//--- throat, static, p, T ---
  fluidStat_th_fullExp.p = fluid_2.p;
  fluidStat_th_choked.p = fluid_2.p;
//V_th_fullExp= sqrt( 2.0*(fluid_1.h - fluidStat_th_fullExp.h ) );
  fluid_1.h - fluidStat_th_fullExp.h = 1.0/2.0*(sign(V_th_fullExp)*abs(V_th_fullExp)^2.0);
//--- velocity if choked state ---
  V_th_choked = 1.0*Medium.velocityOfSound(fluidStat_th_choked.state);
  fluidStat_th_choked.h = fluid_1.h - 1.0/2.0*(sign(V_th_choked)*abs(V_th_choked)^2.0);
//--- throat fully-expanded ---
  fluidStat_th_fullExp.h = Medium.isentropicEnthalpy(fluidStat_th_fullExp.p, fluid_1.state);
/*--------------------
  evaluate choked or not
  --------------------*/
  if V_th_fullExp >= V_th_choked then
    V_th = V_th_choked;
//case of choked
  else
    V_th = V_th_fullExp;
//case of unchoked
  end if;
//--- throat state ---
  VsoundTh= Medium.velocityOfSound(fluidStat_th.state);
  MNth = V_th/VsoundTh;
  fluidStat_th.h = fluid_1.h - 1.0/2.0*(sign(V_th)*abs(V_th)^2.0);
  fluidStat_th.h = Medium.isentropicEnthalpy(fluidStat_th.p, fluid_1.state);
  m_flow_th = fluid_th.d*V_th*AeTh;
  m_flow_th = port_1.m_flow;
  m_flow_th = fluid_2.d*V_2*Ae2;
  AeTh = AmechTh*CdTh;
  //-----
  Vsound2= Medium.velocityOfSound(fluid_2.state);
  MN2 = V_2/Vsound2;
  VsoundAmb= Medium.velocityOfSound(fluid_amb.state);
  MN2wrtAmb = V_2/VsoundAmb;
  Ae2 = Amech2*Cd2;
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  s_fluid_th = Medium.specificEntropy(fluid_th.state);
  s_fluid_2Tot = Medium.specificEntropy(fluid_2Tot.state);
/*--------------------
  performance variables
  --------------------*/
  if switch_defineFg == switchDefineFg.FullyExpandedFlow then
    Fg = (-1)*port_2.m_flow*V_2;
  elseif switch_defineFg == switchDefineFg.ThroatFlowAndPressure then
    Fg = Cv*V_th*m_flow_th + (fluidStat_th.p - fluid_2.p)*AeTh;
  end if;
/********************************************************
    Graphics
  ********************************************************/
  annotation(
    Icon(graphics = {Text(origin = {-74, 130}, extent = {{-26, -8}, {174, -28}}, textString = "%name"), Text(origin = {139, 69}, extent = {{-17, -1}, {15, -14}}, textString = "sink"), Line(origin = {123.16, -2.13}, points = {{-145, 2}, {-3, 2}, {-3, 82}}, pattern = LinePattern.Dash, thickness = 1), Text(origin = {55, 101}, extent = {{-19, -1}, {17, -14}}, textString = "amb"), Rectangle(origin = {-112, 80}, rotation = 180, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{3, 66}, {7, 4}}), Polygon(origin = {-40, 10}, fillColor = {255, 250, 80}, fillPattern = FillPattern.HorizontalCylinder, points = {{-80, 50}, {-80, -70}, {20, -30}, {20, 10}, {-80, 50}}), Line(origin = {33, 20}, points = {{-33, 0}, {27, 0}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 6), Line(origin = {33, -20}, points = {{-33, 0}, {27, 0}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 6), Line(origin = {33, 0}, points = {{-33, 0}, {27, 0}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 6), Polygon(visible = show_divergentSection, origin = {124, -20}, fillColor = {255, 250, 80}, fillPattern = FillPattern.HorizontalCylinder, points = {{-144, 40}, {-144, 0}, {-24, -60}, {-24, 102}, {-144, 40}}), Line(origin = {30, 0}, points = {{-30, 0}, {30, 0}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 6)}, coordinateSystem(preserveAspectRatio=false,initialScale = 0.1, extent = {{-120, -100}, {120, 100}})),
  Diagram(graphics));
end NozzleBase02;
