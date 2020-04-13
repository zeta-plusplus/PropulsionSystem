within PropulsionSystem.BaseClasses.BasicElements;

model IdealSplitterBase00
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
  /* ---------------------------------------------
                     switch
    --------------------------------------------- */
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  
  parameter Boolean use_u_BPR = false "get BPR from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
                      parameters
    --------------------------------------------- */
  parameter Real BPR_paramInput = 10.0 "bypass ratio, valid only when use_u_BPR==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  
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
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 *(1.0-0.5)* m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluid_3, port_3 ---
  parameter Modelica.SIunits.MassFlowRate m_flow3_init(displayUnit = "kg/s") = -1.0 *(0.5)* m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.Pressure p3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.Temperature T3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h3_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  
  
  /* ---------------------------------------------
                 Internal variables
    --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow_max;
  Modelica.SIunits.MassFlowRate m_flow_min;
  Real BPR "ratio of m_flow, port_3 to port_2";
  Real BPRdes "BPR, design point";
  
  
  /* ---------------------------------------------
             Internal objects
    --------------------------------------------- */
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_2(p.start = p2_init, T.start = T2_init, state.p.start = p2_init, state.T.start = T2_init, h.start = h2_init) "flow station of inlet";
  Medium.BaseProperties fluid_3(p.start = p3_init, T.start = T3_init, state.p.start = p3_init, state.T.start = T3_init, h.start = h3_init) "flow station of outlet";
  
  
  /* ---------------------------------------------
                   Interface
    --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init), h_outflow.start = h1_init) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init), h_outflow.start = h2_init) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_3(redeclare package Medium = Medium, m_flow(start = m_flow3_init), h_outflow.start = h3_init) annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u_BPR if use_u_BPR annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  //********************************************************************************
initial algorithm
/* ---------------------------------------------
    debug print, command window  
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("---initialization---" + "\n");
    print("instance:" + String(getInstanceName()) + "\n");
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
  
  //-- fluidPort_1 --
  fluid_1.p := port_1.p;
  fluid_1.h := actualStream(port_1.h_outflow);
  fluid_1.Xi := actualStream(port_1.Xi_outflow);
  port_1.h_outflow := fluid_1.h;
  port_1.Xi_outflow := fluid_1.Xi;
    
  
    
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  fluid_2.Xi := fluid_1.Xi;
  fluid_2.h := fluid_1.h;
  fluid_3.Xi := fluid_1.Xi;
  fluid_3.h := fluid_1.h;
  
  port_2.m_flow:= (-1.0)*1.0/(1.0+BPR)*port_1.m_flow;
  port_3.m_flow:= (-1.0)*BPR/(1.0+BPR)*port_1.m_flow;
  fluid_3.p := fluid_1.p;
  fluid_2.p := fluid_1.p;
  
  
  //-- fluidPort_2 --
  port_2.p:= fluid_2.p;
  port_2.h_outflow:= fluid_2.h;
  port_2.Xi_outflow:= fluid_2.Xi;
  //-- fluidPort_3 --
  port_3.p:= fluid_3.p;
  port_3.h_outflow:= fluid_3.h;
  port_3.Xi_outflow:= fluid_3.Xi;
  
  
  
  /* ---------------------------------------------
    debug print, command window   
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("instance:" + String(getInstanceName()) + "\n");
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
  
  
  
  //--------------------
  if use_u_BPR == false then
    BPR = BPR_paramInput;
  elseif use_u_BPR==true then
    BPR = u_BPR;
  end if; 
  //--------------------
  
  
  BPRdes=BPR;
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Splt",
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {238, 238, 238}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-100, 40}, {100, -80}}), Text(origin = {-8, -50}, extent = {{-72, 10}, {88, -10}}, textString = "%name"), Line(origin = {22.24, -1.07}, points = {{-54, 0}, {54, 0}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Line(origin = {79.9452, 50.0754}, points = {{-62, -46}, {-34, -12}, {-4, -12}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14)}, coordinateSystem(extent = {{-100, -60}, {100, 60}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(graphics = {Line(origin = {-67.7241, 57.1891}, points = {{74, -50}, {93, 15}, {144, 16}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-68.3891, -45.4632}, points = {{-18, 40}, {148, 40}}, arrow = {Arrow.None, Arrow.Filled})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
  
  
end IdealSplitterBase00;
