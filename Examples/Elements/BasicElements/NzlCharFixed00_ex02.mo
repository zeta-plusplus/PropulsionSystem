within PropulsionSystem.Examples.Elements.BasicElements;

model NzlCharFixed00_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 500, nPorts = 1, p = 2 * 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir, switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_CdTh = true, use_u_Cv = true) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 1.0 * 101.325 * 1000, offset = 1.5 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_amb(duration = 10, height = 0.0, offset = 1.0 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_AmechTh(duration = 10, height = -0.1 * 0.00287, offset = 0.00287, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {26, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cv(duration = 10, height = 0.04, offset = 0.95, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_CdTh(duration = 10, height = 0.04, offset = 0.95, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ramp_CdTh.y, Nzl.u_CdTh) annotation(
    Line(points = {{16, -18}, {16, -18}, {16, -8}, {16, -8}}, color = {0, 0, 127}));
  connect(ramp_Cv.y, Nzl.u_Cv) annotation(
    Line(points = {{20, -48}, {20, -48}, {20, -6}, {20, -6}}, color = {0, 0, 127}));
  connect(ramp_AmechTh.y, Nzl.u_AmechTh) annotation(
    Line(points = {{26, -79}, {26, -10}}, color = {0, 0, 127}));
  connect(boundary1.p_in, ramp_p_amb.y) annotation(
    Line(points = {{38, 42}, {38, 42}, {38, 50}, {50, 50}, {50, 60}, {50, 60}}, color = {0, 0, 127}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{30, 8}, {30, 20}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-79, 20}, {-73, 20}, {-73, 16}, {-63, 16}, {-63, 16}}, color = {0, 0, 127}));
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-40, 8}, {-30, 8}, {-30, 8}, {-30, 8}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Nzl.port_1) annotation(
    Line(points = {{-10, 8}, {10, 8}, {10, 8}, {10, 8}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.18),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end NzlCharFixed00_ex02;
