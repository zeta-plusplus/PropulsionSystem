within PropulsionSystem.Sources;

model IdealSpliterBPRatDesignPoint
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
                        parameters
    --------------------------------------------- */
  parameter Real BPRdes_paramInput = 10.0 "bypass ratio, valid only when use_u_BPR==false, value fixed through simulation" annotation(
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
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * (1.0 - 0.5) * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluid_3, port_3 ---
  parameter Modelica.SIunits.MassFlowRate m_flow3_init(displayUnit = "kg/s") = -1.0 * 0.5 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.Pressure p3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.Temperature T3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h3_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_3"));
  /* ---------------------------------------------
        Internal objects
    --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  /* ---------------------------------------------
        Interface
    --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_3(redeclare package Medium = Medium, m_flow(start = m_flow3_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h3_init, min = 0.0 + 1.0e-10), p(start = p3_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //*********************************************************************************************************
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = BPRdes_paramInput) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3 annotation(
    Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2 annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(port_1, massFlowRate3.port_a) annotation(
    Line(points = {{-100, 0}, {54, 0}, {54, 80}, {60, 80}, {60, 80}}, color = {0, 127, 255}));
  connect(port_1, massFlowRate2.port_a) annotation(
    Line(points = {{-100, 0}, {60, 0}, {60, 0}, {60, 0}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, port_2) annotation(
    Line(points = {{80, 0}, {100, 0}}, color = {0, 127, 255}));
  connect(massFlowRate3.port_b, port_3) annotation(
    Line(points = {{80, 80}, {100, 80}, {100, 80}, {100, 80}}, color = {0, 127, 255}));
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-58, 30}, {-42, 30}, {-42, 30}, {-42, 30}}, color = {0, 0, 127}));
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Splt",
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {238, 238, 238}, fillPattern = FillPattern.Solid, lineThickness = 1.75, extent = {{-60, 40}, {60, -80}}), Text(origin = {-8, 50}, extent = {{-52, 10}, {68, -8}}, textString = "%name"), Line(origin = {6.82, 0.4}, points = {{-44, 0}, {40, 0}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {55.43, 52.72}, points = {{-62, -46}, {-42, -12}, {-8, -12}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-8, -28}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-52, 10}, {68, -10}}, textString = "BPR"), Text(origin = {-8, -50}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-52, 10}, {68, -10}}, textString = "Des. Pt.")}, coordinateSystem(extent = {{-60, -60}, {60, 60}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end IdealSpliterBPRatDesignPoint;
