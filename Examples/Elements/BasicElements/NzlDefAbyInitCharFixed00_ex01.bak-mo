within PropulsionSystem.Examples.Elements.BasicElements;

model NzlDefAbyInitCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {40, 7.10543e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 5 * 101.3 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pin(duration = 10, height = 1.0 * 101.325 * 1000, offset = 3.0 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tin(duration = 10, height = 200, offset = 800, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.MassFlowAtInit MassFlowAtInit(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(MassFlowAtInit.port_2, Nzl.port_1) annotation(
    Line(points = {{0, 16}, {20, 16}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowAtInit.port_1) annotation(
    Line(points = {{-40, 16}, {-20, 16}}, color = {0, 127, 255}));
  connect(ramp_Tin.y, boundary.T_in) annotation(
    Line(points = {{-78, 0}, {-74, 0}, {-74, 20}, {-62, 20}, {-62, 20}}, color = {0, 0, 127}));
  connect(ramp_pin.y, boundary.p_in) annotation(
    Line(points = {{-78, 30}, {-70, 30}, {-70, 24}, {-62, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{60, 16}, {60, 16}, {60, 40}, {60, 40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end NzlDefAbyInitCharFixed00_ex01;
