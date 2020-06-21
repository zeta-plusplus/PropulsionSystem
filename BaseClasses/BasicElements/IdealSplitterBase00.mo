within PropulsionSystem.BaseClasses.BasicElements;

partial model IdealSplitterBase00
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
  Real BPR "ratio of m_flow, port_3 to port_2";
  
  
  
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
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init), h_outflow.start = h2_init) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_3(redeclare package Medium = Medium, m_flow(start = m_flow3_init), h_outflow.start = h3_init) annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-32, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//********************************************************************************
protected
  /* ---------------------------------------------
          Non-modifiable parameters
    --------------------------------------------- */
  parameter Real BPRdes(fixed=false) "BPR, design point" annotation(
    HideResult=false);
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
  
  //********************************************************************************
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
  
  //********************************************************************************
equation
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */  
  //-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
  port_1.h_outflow = fluid_1.h;
  port_1.Xi_outflow = fluid_1.Xi;
  
  //-- fluidPort_2 --
  port_2.p = fluid_2.p;
  port_2.h_outflow = fluid_2.h;
  port_2.Xi_outflow = fluid_2.Xi;
  
  //-- fluidPort_3 --
  port_3.p = fluid_3.p;
  port_3.h_outflow = fluid_3.h;
  port_3.Xi_outflow = fluid_3.Xi;
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */  
  fluid_2.Xi = fluid_1.Xi;
  fluid_2.h = fluid_1.h;
  fluid_3.Xi = fluid_1.Xi;
  fluid_3.h = fluid_1.h;
  
  port_2.m_flow= (-1.0)*1.0/(1.0+BPR)*port_1.m_flow;
  port_3.m_flow= (-1.0)*BPR/(1.0+BPR)*port_1.m_flow;
  fluid_3.p= fluid_1.p;
  fluid_2.p= fluid_1.p;
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Splt",
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {238, 238, 238}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-60, 40}, {60, -80}}), Text(origin = {-8, -30}, extent = {{-52, 10}, {68, -10}}, textString = "%name"), Line(origin = {0.817218, 0.397314}, points = {{-44, 0}, {40, 0}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Line(origin = {49.4251, 52.7166}, points = {{-62, -46}, {-42, -12}, {-8, -12}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14)}, coordinateSystem(extent = {{-60, -60}, {60, 60}})),
    __OpenModelica_commandLineOptions = "",
    Diagram(graphics = {Line(origin = {-67.7241, 57.1891}, points = {{74, -50}, {93, 15}, {144, 16}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-68.3891, -45.4632}, points = {{-18, 40}, {148, 40}}, arrow = {Arrow.None, Arrow.Filled})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
  
  
end IdealSplitterBase00;
