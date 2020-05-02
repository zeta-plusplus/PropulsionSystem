within PropulsionSystem.Sources;

model MassFlowSource
  import Modelica.Constants;
  
  /********************************************************
   Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium= Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching= true);
  //********** Parameters **********
  parameter Boolean use_m_flow_in = false
    "Get the mass flow rate from the input connector"
    annotation(
            Evaluate=true, HideResult=true, choices(checkBox=true));
  
  parameter Medium.MassFlowRate m_flow = 1
    "Fixed mass flow rate going out of the fluid port"
    annotation (
            Evaluate = true,Dialog(enable = not use_m_flow_in));
  
  //********** Internal variables **********
  Medium.BaseProperties fluid_I "flow station of inlet with isentropic compression";
  Medium.MassFlowRate m_flow_internal(start=m_flow) "";
  
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_b port_b   
    (
      redeclare package Medium = Medium
    )
    annotation(
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput m_flow_in if  use_m_flow_in
    "Prescribed mass flow rate"
    annotation (
      Placement(visible = true,transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0), iconTransformation(extent = {{-140, -20}, {-100, 20}},   rotation = 0)));
  //********** Initialization **********

//##### none #####
  //********** Protected objects **********
protected
  
  
/********************************************************
  Model coding
********************************************************/
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  if (use_m_flow_in==true) then
    m_flow_internal= m_flow_in;
  end if;
  
  port_b.m_flow= -m_flow_internal;
  fluid_I.p= port_b.p;
  fluid_I.h= actualStream(port_b.h_outflow);
  port_b.h_outflow= fluid_I.h;
  fluid_I.Xi= actualStream(port_b.Xi_outflow);
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/

annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {70, 0}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 40}, {30, -40}}), Ellipse(origin = {-45, 13}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-55, 47}, {71, -73}}, endAngle = 360), Polygon(origin = {-32, -2}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, points = {{-40, 52}, {-40, -48}, {58, 2}, {-40, 52}}), Text(origin = {-50, 10}, lineColor = {255, 85, 0}, extent = {{-20, 18}, {64, -32}}, textString = "mass source"), Text(origin = {-27, -71}, extent = {{-73, 11}, {127, -29}}, textString = "%name"),
    
    
    Rectangle(lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, lineThickness = 4, extent = {{-100, 100}, {100, -100}}), Line(points = {{-100, 100}, {100, -100}}, color = {255, 0, 0}, thickness = 4)
    
    
    }));

end MassFlowSource;
