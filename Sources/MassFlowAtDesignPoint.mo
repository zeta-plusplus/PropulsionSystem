within PropulsionSystem.Sources;

model MassFlowAtDesignPoint
  /********************************************************
                       Declaration
  ********************************************************/
  /* ---------------------------------------------
            Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  /* ---------------------------------------------
              switches
  --------------------------------------------- */
  parameter Boolean allowFlowReversal= false
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
      Dialog(tab="Assumptions"), Evaluate=true);
  
  
  /* ---------------------------------------------
              parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.MassFlowRate m_flow_des_paramInput=1.0 "" annotation(
    Dialog(group = "Component characteristics"));
  
  
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = m_flow_des_paramInput "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = m_flow_des_paramInput)  annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  
  
  
  /* ---------------------------------------------
            Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(fixed=true, start = m_flow1_init, min=if (allowFlowReversal) then -Modelica.Constants.inf else 0.0), 
    h_outflow(start = h1_init),
    p(start=p1_init)
  )
    "" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, max=if allowFlowReversal then +Modelica.Constants.inf else 0.0), 
    h_outflow(start = h2_init),
    p(start=p2_init)
  )
    "" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
//****************************************************************************************************
equation
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-9, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(massFlowRate1.port_b, port_2) annotation(
    Line(points = {{40, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {0, 127, 255}));
  connect(port_1, massFlowRate1.port_a) annotation(
    Line(points = {{-100, 0}, {20, 0}, {20, 0}, {20, 0}}, color = {0, 127, 255}));
  connect(ConstraintDesPt.u_variable, massFlowRate1.m_flow) annotation(
    Line(points = {{22, 30}, {30, 30}, {30, 12}, {30, 12}}, color = {0, 0, 127}));
  
  
annotation(
    defaultComponentName="MassFlowDes",
    Icon(graphics = {Rectangle(origin = {0, 2}, fillColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 48}, {100, -52}}), Ellipse(origin = {19, -9}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-89, 79}, {51, -61}}, endAngle = 360), Polygon(origin = {14, 1}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-56, 55}, {-56, -57}, {56, -1}, {-56, 55}}), Text(origin = {-19, 25}, lineColor = {255, 0, 0}, lineThickness = 0.5, extent = {{-23, 15}, {47, -55}}, textString = "m"), Ellipse(origin = {-4, 20}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-8, 8}, {4, -4}}, endAngle = 360), Text(origin = {-21, -53}, lineColor = {255, 0, 0}, lineThickness = 0.5, extent = {{-79, -15}, {121, -47}}, textString = "Des. Pt."), Text(origin = {1, 80}, extent = {{-101, 10}, {99, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    
  
end MassFlowAtDesignPoint;
