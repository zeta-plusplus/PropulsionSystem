within PropulsionSystem.Sources;

model IdealSpliterBPRatDesignPoint01
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
  parameter Boolean use_u_BPRdes = false "get BPRdes from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  
  
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
            Internal variables
  --------------------------------------------- */
  Real BPR "";
  discrete Real auxVar[2] "";
  
  
  /* ---------------------------------------------
            Internal objects
    --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(redeclare package Medium = Medium, T1_init = T1_init, T2_init = T2_init, T3_init = T3_init, h1_init = h1_init, h2_init = h2_init, h3_init = h3_init, m_flow1_init = m_flow1_init, m_flow2_init = m_flow2_init, m_flow3_init = m_flow3_init, p1_init = p1_init, p2_init = p2_init, p3_init = p3_init, use_u_BPR = true) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  /* ---------------------------------------------
            Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_3(redeclare package Medium = Medium, m_flow(start = m_flow3_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h3_init, min = 0.0 + 1.0e-10), p(start = p3_init, min = 0.0 + 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_BPRdes if use_u_BPRdes==true annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  //********************************************************************************
protected
  parameter Real BPRdes(fixed = false) "" annotation(
    HideResult = false);
  
  //********************************************************************************
initial equation
  
  if(use_u_BPRdes==true)then
    BPRdes = u_BPRdes;
    BPR= u_BPRdes;
  else
    BPRdes = BPRdes_paramInput;
    BPR= BPRdes_paramInput;
  end if;
  
  auxVar[1]=1;
  auxVar[2]=0;
  
  //*********************************************************************************************************
equation
  connect(port_1, Splt.port_1) annotation(
    Line(points = {{-100, 0}, {0, 0}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, Splt.u_BPR) annotation(
    Line(points = {{1, 50}, {10, 50}, {10, 12}}, color = {0, 0, 127}));
  connect(Splt.port_3, port_3) annotation(
    Line(points = {{20, 7}, {32, 7}, {32, 80}, {100, 80}}, color = {0, 127, 255}));
  connect(Splt.port_2, port_2) annotation(
    Line(points = {{20, 0}, {100, 0}}, color = {0, 127, 255}));
  //--------------------
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    auxVar[1]=1;
  else
    auxVar[1]=0;
  end if;
  //--------------------
  BPR= BPRdes*auxVar[1] + auxVar[2];
  BPR= ((-1.0)*Splt.port_3.m_flow)/((-1.0)*Splt.port_2.m_flow);
  
  
/********************************************************
  Graphics
********************************************************/

  annotation(
    defaultComponentName = "SpltDesPt",
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {238, 238, 238}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-100, 80}, {100, -120}}), Text(origin = {-8, 108}, extent = {{-92, 12}, {108, -6}}, textString = "%name"), Line(origin = {6.82, 0.4}, points = {{-58, 0}, {62, 0}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {55.43, 52.72}, points = {{-62, -46}, {-18, 26}, {14, 26}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-8, -46}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-52, 10}, {68, -16}}, textString = "BPR"), Text(origin = {-8, -76}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-68, 10}, {88, -16}}, textString = "Des. Pt.")}),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end IdealSpliterBPRatDesignPoint01;
