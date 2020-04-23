within PropulsionSystem.Examples.Elements.BasicElements;

model InltCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir, use_u_effRam = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_V_infini(duration = 10, height = 10, offset = 230, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effRam(duration = 10, height = 0.05, offset = 0.90, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ramp_effRam.y, Inlt.u_effRam) annotation(
    Line(points = {{-10, -8}, {-10, -8}, {-10, 14}, {-10, 14}}, color = {0, 0, 127}));
  connect(ramp_V_infini.y, Inlt.u_V_infini) annotation(
    Line(points = {{-39, 0}, {-30, 0}, {-30, 18}, {-17, 18}}, color = {0, 0, 127}));
  connect(Inlt.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 30}, {40, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Inlt.port_1) annotation(
    Line(points = {{-60, 30}, {-20, 30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end InltCharFixed00_ex01;
