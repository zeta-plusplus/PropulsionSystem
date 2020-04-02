within PropulsionSystem.Examples.Elements.BasicElements;

model FlightCondition2InletFluid00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {46, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Flt2Fluid.port_fluidAmb, boundary.ports[1]) annotation(
    Line(points = {{-40, 20}, {-40, 20}, {-40, 40}, {-40, 40}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_fluid2Eng, boundary1.ports[1]) annotation(
    Line(points = {{-20, 16}, {36, 16}}, color = {0, 127, 255}));
end FlightCondition2InletFluid00_ex01;
