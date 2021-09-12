within PropulsionSystem.BaseClasses.BasicElements;

model NonidealMixerBase00
  /********************************************************
              imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import units= Modelica.SIunits;
  
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
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  
  
  /* ---------------------------------------------
                      parameters
  --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluid_3, port_3 ---
  parameter Modelica.SIunits.MassFlowRate m_flow3_init(displayUnit = "kg/s") = -1.0 * (m_flow1_init + m_flow2_init) "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.Pressure p3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.Temperature T3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h3_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  //-----
  parameter Modelica.SIunits.SpecificEntropy s_fluid_1_init = 6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_fluid_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_fluid_3_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  //-----
  /* ---------------------------------------------
                   Internal variables
  --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow_max(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.MassFlowRate m_flow_min(start = m_flow2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //-----
  Modelica.SIunits.SpecificEntropy s_fluid_1(start = s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_fluid_2(start = s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.SpecificEntropy s_fluid_3(start = s_fluid_3_init) "specific entropy, fluid_3" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //-----
  Real n_fluid_1 "mol/s (mole/kg*kg/s)";
  Real n_fluid_2 "mol/s (mole/kg*kg/s)";
  Real n_fluid_3 "mol/s (mole/kg*kg/s)";
  
  
  /* ---------------------------------------------
               Internal objects
  --------------------------------------------- */
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_2(p.start = p2_init, T.start = T2_init, state.p.start = p2_init, state.T.start = T2_init, h.start = h2_init) "flow station of inlet";
  Medium.BaseProperties fluid_3(p.start = p3_init, T.start = T3_init, state.p.start = p3_init, state.T.start = T3_init, h.start = h3_init) "flow station of outlet";
  Medium.BaseProperties fluid_1afterMix(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  
  
  /* ---------------------------------------------
                     Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow.start = h1_init) annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow.start = h2_init) annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_3(redeclare package Medium = Medium, m_flow(start = m_flow3_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow.start = h3_init) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
initial algorithm
  /* ---------------------------------------------
    debug print, command window  
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("---initialization---" + "\n");
    print("instance:" + getInstanceName() + "\n");
    print("port_1.m_flow= " + String(port_1.m_flow) + "\n");
    print("port_1.p= " + String(port_1.p) + "\n");
    print("port_1.h_outflow= " + String(port_1.h_outflow) + "\n");
    print("port_2.m_flow= " + String(port_2.m_flow) + "\n");
    print("port_2.p= " + String(port_2.p) + "\n");
    print("port_2.h_outflow= " + String(port_2.h_outflow) + "\n");
    print("port_3.m_flow= " + String(port_3.m_flow) + "\n");
    print("port_3.p= " + String(port_3.p) + "\n");
    print("port_3.h_outflow= " + String(port_3.h_outflow) + "\n");
  end if;
algorithm
  /* ---------------------------------------------
    debug print, command window   
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("instance:" + getInstanceName() + "\n");
    print("port_1.m_flow= " + String(port_1.m_flow) + "\n");
    print("port_1.p= " + String(port_1.p) + "\n");
    print("port_1.h_outflow= " + String(port_1.h_outflow) + "\n");
    print("port_2.m_flow= " + String(port_2.m_flow) + "\n");
    print("port_2.p= " + String(port_2.p) + "\n");
    print("port_2.h_outflow= " + String(port_2.h_outflow) + "\n");
    print("port_3.m_flow= " + String(port_3.m_flow) + "\n");
    print("port_3.p= " + String(port_3.p) + "\n");
    print("port_3.h_outflow= " + String(port_3.h_outflow) + "\n");
  end if;
equation
/* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
// distinguish inlet side
  m_flow_max = max({port_1.m_flow, port_2.m_flow, port_3.m_flow});
  m_flow_min = min({port_1.m_flow, port_2.m_flow, port_3.m_flow});
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
//-- fluidPort_3 --
  fluid_3.p = port_3.p;
  fluid_3.h = actualStream(port_3.h_outflow);
  fluid_3.Xi = actualStream(port_3.Xi_outflow);
//-----
  if allowFlowReversal == false then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
    port_2.h_outflow = fluid_2.h;
    port_2.Xi_outflow = fluid_2.Xi;
  else
    if m_flow_min == port_3.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    elseif m_flow_min == port_2.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
      port_3.h_outflow = fluid_3.h;
      port_3.Xi_outflow = fluid_3.Xi;
    elseif m_flow_min == port_1.m_flow then
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
      port_3.h_outflow = fluid_3.h;
      port_3.Xi_outflow = fluid_3.Xi;
    else
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    end if;
  end if;
/* ---------------------------------------------
    Eqns describing physics
  --------------------------------------------- */
//----- mixing -----
// mass conservation
// energy conservation
  if port_2.m_flow > 0.0 then
    fluid_1afterMix.Xi * (port_1.m_flow + port_2.m_flow) = port_1.m_flow * fluid_1.Xi + port_2.m_flow * fluid_2.Xi;
    fluid_1afterMix.p = fluid_1.p;
    fluid_1afterMix.h * (port_1.m_flow + port_2.m_flow) = port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h;
    fluid_3.Xi = fluid_1afterMix.Xi;
    fluid_3.h = fluid_1afterMix.h;
    port_3.m_flow + port_1.m_flow + port_2.m_flow = 0.0;
  else
    fluid_1afterMix.Xi = fluid_1.Xi;
    fluid_1afterMix.p = fluid_1.p;
    fluid_1afterMix.h = fluid_1.h;
    fluid_3.Xi = fluid_1afterMix.Xi;
    fluid_3.h = fluid_1afterMix.h;
    port_3.m_flow = -1.0 * port_1.m_flow;
  end if;
//----------
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  s_fluid_3 = Medium.specificEntropy(fluid_3.state);
//----------
  n_fluid_1 = abs(port_1.m_flow) * 1.0 / fluid_1.MM;
  n_fluid_2= abs(port_2.m_flow)*1.0/fluid_2.MM;
  n_fluid_3= abs(port_3.m_flow)*1.0/fluid_3.MM;
  
  
/********************************************************
  Graphics
********************************************************/
  
  annotation(
    defaultComponentName = "Mixer",
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {238, 238, 238}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 60}, {100, -100}}), Text(origin = {-16, -68}, extent = {{-72, 10}, {88, -10}}, textString = "%name"), Line(origin = {15.6396, -0.897098}, points = {{-24, 0}, {54, 0}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Line(origin = {-47.46, 48.58}, points = {{-36, 0}, {20, -42}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8), Line(origin = {-49.57, -4}, points = {{-34, -44}, {22, -6}}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 8)}, coordinateSystem(extent = {{-100, -80}, {100, 80}})),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end NonidealMixerBase00;
