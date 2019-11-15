within PropulsionSystem.Examples.Elements.DetailedModels;

model Propeller1dAero002_02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.Propeller1dAeroTip propeller1dAeroTip1(redeclare package Medium = engineAir, alpha_CdpMinDes(displayUnit = ""), omega(fixed = false), rTip_1_def = 2, rTip_2_def = 2) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_flowAngle(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_trq(k = 40000) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_flowSpeed(duration = 10, height = 0, offset = 240, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_bladeAngle(duration = 10, height = 0 * Modelica.Constants.pi / 180, offset = 20 * Modelica.Constants.pi / 180, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.1, a(fixed = false, start = 0), w(fixed = true, start = 104)) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_bladeAngle.y, propeller1dAeroTip1.u_bladeAngle) annotation(
    Line(points = {{-10, 39}, {-10, 22}}, color = {0, 0, 127}));
  connect(boundary.ports[1], propeller1dAeroTip1.port_amb) annotation(
    Line(points = {{-60, 30}, {-52, 30}, {-52, 16}, {-40, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(const_flowAngle.y, propeller1dAeroTip1.u_flowAngle) annotation(
    Line(points = {{-59, 0}, {-54, 0}, {-54, 12}, {-42, 12}}, color = {0, 0, 127}));
  connect(ramp_flowSpeed.y, propeller1dAeroTip1.u_flowSpeed) annotation(
    Line(points = {{-59, -40}, {-48, -40}, {-48, 6}, {-42, 6}}, color = {0, 0, 127}));
  connect(propeller1dAeroTip1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-3.55271e-15, 0}, {10, 0}, {10, 0}, {10, 0}}));
  connect(torque1.tau, const_trq.y) annotation(
    Line(points = {{62, 0}, {80, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, torque1.flange) annotation(
    Line(points = {{30, 0}, {40, 0}, {40, 0}, {40, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Propeller1dAero002_02;
