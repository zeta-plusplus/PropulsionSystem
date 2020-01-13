within PropulsionSystem.Examples.Elements.DetailedModels;

model Propeller1dAero002_01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.Propeller1dAeroTip propeller1dAeroTip1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_flowAngle(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_flowSpeed(duration = 10, height = 0, offset = 100, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_bladeAngle(duration = 10, height = -1, offset = 25, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0 * 2 * Modelica.Constants.pi / 60, offset = 600 * 2 * Modelica.Constants.pi / 60, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = Modelica.Constants.pi / 180) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(gain1.y, propeller1dAeroTip1.u_bladeAngle) annotation(
    Line(points = {{-10, 28}, {-10, 28}, {-10, 22}, {-10, 22}}, color = {0, 0, 127}));
  connect(ramp_bladeAngle.y, gain1.u) annotation(
    Line(points = {{-10, 60}, {-10, 60}, {-10, 52}, {-10, 52}}, color = {0, 0, 127}));
  connect(speed1.w_ref, ramp_omega.y) annotation(
    Line(points = {{62, 0}, {80, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(boundary.ports[1], propeller1dAeroTip1.port_amb) annotation(
    Line(points = {{-60, 30}, {-52, 30}, {-52, 16}, {-40, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(const_flowAngle.y, propeller1dAeroTip1.u_flowAngle) annotation(
    Line(points = {{-59, 0}, {-54, 0}, {-54, 12}, {-42, 12}}, color = {0, 0, 127}));
  connect(ramp_flowSpeed.y, propeller1dAeroTip1.u_flowSpeed) annotation(
    Line(points = {{-59, -40}, {-48, -40}, {-48, 6}, {-42, 6}}, color = {0, 0, 127}));
  connect(propeller1dAeroTip1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-3.55271e-15, 0}, {10, 0}, {10, 0}, {10, 0}}));
  connect(inertia1.flange_b, speed1.flange) annotation(
    Line(points = {{30, 0}, {40, 0}, {40, 0}, {40, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "csv", s = "dassl"));
end Propeller1dAero002_01;
