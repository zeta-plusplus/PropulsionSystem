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
      switch
  --------------------------------------------- */
  parameter Boolean allowFlowReversal= false
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
      Dialog(tab="Assumptions"), Evaluate=true);
  
  
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
  
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = BPRdes_paramInput) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(
    redeclare package Medium = Medium,
    port_a.m_flow.start= (-1.0)*m_flow3_init,
    port_a.p.start= p3_init,
    port_a.h_outflow.start= h3_init,
    port_b.m_flow.start= m_flow3_init,
    port_b.p.start= p3_init,
    port_b.h_outflow.start= h3_init
  ) annotation(
    Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(
    redeclare package Medium = Medium,
    port_a.m_flow.start= (-1.0)*m_flow2_init,
    port_a.p.start= p2_init,
    port_a.h_outflow.start= h2_init,
    port_b.m_flow.start= m_flow2_init,
    port_b.p.start= p2_init,
    port_b.h_outflow.start= h2_init
  ) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(
    redeclare package Medium = Medium, 
    T1_init = T1_init, T2_init = T2_init, T3_init = T3_init, 
    h1_init = h1_init, h2_init = h2_init, h3_init = h3_init, 
    m_flow1_init = m_flow1_init, 
    m_flow2_init = m_flow2_init, 
    m_flow3_init = m_flow3_init, 
    p1_init = p1_init, p2_init = p2_init, p3_init = p3_init, 
    use_u_BPR = true
  )  annotation(
    Placement(visible = true, transformation(origin = {14, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10)  annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  
  
  
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
equation
  connect(VarBySolver.y_independent, Splt.u_BPR) annotation(
    Line(points = {{2, 20}, {14, 20}, {14, 8}, {14, 8}}, color = {0, 0, 127}));
  connect(Splt.port_3, massFlowRate3.port_a) annotation(
    Line(points = {{20, 4}, {50, 4}, {50, 80}, {60, 80}, {60, 80}}, color = {0, 127, 255}));
  connect(Splt.port_2, massFlowRate2.port_a) annotation(
    Line(points = {{20, 0}, {60, 0}, {60, 0}, {60, 0}}, color = {0, 127, 255}));
  connect(port_1, Splt.port_1) annotation(
    Line(points = {{-100, 0}, {8, 0}, {8, 0}, {8, 0}}, color = {0, 127, 255}));
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-79, 60}, {-73, 60}}, color = {0, 0, 127}));
  connect(ConstraintDesPt.u_variable, division1.y) annotation(
    Line(points = {{-49, 60}, {-41, 60}}, color = {0, 0, 127}));
  connect(division1.u1, massFlowRate3.m_flow) annotation(
    Line(points = {{-18, 66}, {70, 66}, {70, 70}}, color = {0, 0, 127}));
  connect(division1.u2, limiter1.y) annotation(
    Line(points = {{-18, 54}, {-8, 54}, {-8, 50}, {-2, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(limiter1.u, massFlowRate2.m_flow) annotation(
    Line(points = {{22, 50}, {70, 50}, {70, 12}}, color = {0, 0, 127}));
  connect(massFlowRate2.port_b, port_2) annotation(
    Line(points = {{80, 0}, {100, 0}}, color = {0, 127, 255}));
  connect(massFlowRate3.port_b, port_3) annotation(
    Line(points = {{80, 80}, {100, 80}, {100, 80}, {100, 80}}, color = {0, 127, 255}));
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "SpltDesPt",
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {238, 238, 238}, fillPattern = FillPattern.Solid, lineThickness = 1.5, extent = {{-60, 40}, {60, -80}}), Text(origin = {-8, 70}, extent = {{-52, 10}, {68, -8}}, textString = "%name"), Line(origin = {6.82, 0.4}, points = {{-44, 0}, {40, 0}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {55.43, 52.72}, points = {{-62, -46}, {-42, -12}, {-8, -12}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-8, -26}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-52, 10}, {68, -10}}, textString = "BPR"), Text(origin = {-8, -46}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-52, 10}, {68, -10}}, textString = "Des. Pt.")}, coordinateSystem(extent = {{-60, -60}, {60, 60}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end IdealSpliterBPRatDesignPoint;
