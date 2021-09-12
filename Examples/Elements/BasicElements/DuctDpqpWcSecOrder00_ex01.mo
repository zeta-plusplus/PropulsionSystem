within PropulsionSystem.Examples.Elements.BasicElements;

model DuctDpqpWcSecOrder00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 1.5 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctDpqpWcSecOrder00 Duct(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = -10, offset = -10, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {90, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(boundary1.m_flow_in, ramp1.y) annotation(
    Line(points = {{60, 38}, {80, 38}, {80, 38}, {78, 38}}, color = {0, 0, 127}));
  connect(Duct.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 30}, {40, 30}, {40, 30}, {40, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Duct.port_1) annotation(
    Line(points = {{-20, 30}, {0, 30}, {0, 30}, {0, 30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end DuctDpqpWcSecOrder00_ex01;
