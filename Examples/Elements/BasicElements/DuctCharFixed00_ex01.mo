within PropulsionSystem.Examples.Elements.BasicElements;

model DuctCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 1.5 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_dPqP(duration = 10, height = 0.005, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-16, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct(redeclare package Medium = engineAir, use_u_dPqP = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_dPqP.y, Duct.u_dPqP) annotation(
    Line(points = {{-16, 1}, {-16, 24}}, color = {0, 0, 127}));
  connect(Duct.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 30}, {40, 30}, {40, 30}, {40, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Duct.port_1) annotation(
    Line(points = {{-60, 30}, {-20, 30}, {-20, 30}, {-20, 30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

end DuctCharFixed00_ex01;
