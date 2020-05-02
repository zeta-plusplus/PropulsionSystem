within PropulsionSystem.Sources;

model FlowSink
  import Modelica.Constants;
  /********************************************************
     Declaration
    ********************************************************/
  //********** Package **********
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //********** Parameters **********
  //##### none #####
  //********** Internal variables **********
  Medium.BaseProperties fluid_I "flow station of inlet with isentropic compression";
  Medium.MassFlowRate m_flow(start = 1.0) "";
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********** Initialization **********
  //##### none #####
protected
  //********** Protected objects **********
  //##### none #####
equation
/********************************************************
  Model coding
********************************************************/
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  port_a.m_flow = -m_flow;
  fluid_I.p = port_a.p;
  fluid_I.h = actualStream(port_a.h_outflow);
  port_a.h_outflow = fluid_I.h;
  fluid_I.Xi = actualStream(port_a.Xi_outflow);
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-50, 0}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-50, 60}, {150, -60}}), Polygon(origin = {-56, -1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-40, 41}, {-40, -39}, {92, 1}, {-40, 41}}), Text(origin = {3, -82}, extent = {{-103, 22}, {97, -18}}, textString = "%name"), Text(origin = {65, 3}, lineColor = {255, 255, 255}, extent = {{-33, 15}, {33, -15}}, textString = "sink"),
    
    
    Rectangle(lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, lineThickness = 4, extent = {{-100, 100}, {100, -100}}), Line(points = {{-100, 100}, {100, -100}}, color = {255, 0, 0}, thickness = 4)
    
    
    }));
end FlowSink;
