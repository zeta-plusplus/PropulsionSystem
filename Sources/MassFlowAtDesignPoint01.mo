within PropulsionSystem.Sources;

model MassFlowAtDesignPoint01
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
  parameter Boolean use_u_m_flow_des = false "get m_flow_des from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  /* ---------------------------------------------
                parameters
    --------------------------------------------- */
  parameter Modelica.SIunits.MassFlowRate m_flow_des_paramInput = 10.0 "" annotation(
    Dialog(group = "Component characteristics"));
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = m_flow_des_paramInput "" annotation(
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
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  discrete Real auxVar[2];
  
  
  /* ---------------------------------------------
        Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_2(p.start = p2_init, T.start = T2_init, state.p.start = p2_init, state.T.start = T2_init, h.start = h2_init) "flow station of outlet";
  
  
  /* ---------------------------------------------
              Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, m_flow(fixed = true, start = m_flow1_init, min = if allowFlowReversal then -Modelica.Constants.inf else 0.0), h_outflow(start = h1_init), p(start = p1_init)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Modelica.Constants.inf else 0.0), h_outflow(start = h2_init), p(start = p2_init)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput u_m_flow_des if use_u_m_flow_des==true annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  //****************************************************************************************************
protected
  parameter Modelica.SIunits.MassFlowRate m_flow_des(fixed=false) "mass flow rate, design point value" annotation(HideResult=false);
  
  //****************************************************************************************************
initial equation
  if(use_u_m_flow_des==true)then
    m_flow_des= u_m_flow_des;
    m_flow= u_m_flow_des;
  else
    m_flow_des= m_flow_des_paramInput;
    m_flow= m_flow_des_paramInput;
  end if;
  
  auxVar[1]=1;
  auxVar[2]=0;
  
  //****************************************************************************************************
equation
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    auxVar[1]=1;
  else
    auxVar[1]=0;
  end if;
  
  m_flow=m_flow_des*auxVar[1]+auxVar[2];
  
  //-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
  port_1.h_outflow= fluid_1.h;
  port_1.Xi_outflow= fluid_1.Xi; 
  
  //-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
  
  port_1.m_flow= m_flow;
  
  //-- pressure --
  fluid_2.p = fluid_1.p;
  //-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
  //-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
  
  
  annotation(
    defaultComponentName = "MassFlowDes",
    Icon(graphics = {Rectangle(origin = {0, 2}, fillColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 48}, {100, -52}}), Ellipse(origin = {19, -9}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-89, 79}, {51, -61}}, endAngle = 360), Polygon(origin = {14, 1}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-56, 55}, {-56, -57}, {56, -1}, {-56, 55}}), Text(origin = {-19, 25}, lineColor = {255, 0, 0}, lineThickness = 0.5, extent = {{-23, 15}, {47, -55}}, textString = "m"), Ellipse(origin = {-4, 20}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-8, 8}, {4, -4}}, endAngle = 360), Text(origin = {-21, -53}, lineColor = {255, 0, 0}, lineThickness = 0.5, extent = {{-79, -15}, {121, -47}}, textString = "Des. Pt."), Text(origin = {1, 80}, extent = {{-101, 10}, {99, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    
  
end MassFlowAtDesignPoint01;
