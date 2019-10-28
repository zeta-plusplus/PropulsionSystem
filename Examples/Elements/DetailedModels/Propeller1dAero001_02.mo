within PropulsionSystem.Examples.Elements.DetailedModels;

model Propeller1dAero001_02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.Propeller1dAerodynamic propeller1dAerodynamic1(redeclare package Medium = engineAir, alpha_CdpMinDes(displayUnit = ""), omega(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_flowAngle(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_omega(k = 1000) annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_flowSpeed(duration = 10, height = 0, offset = 100, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_bladeAngle(duration = 10, height = 65 * Modelica.Constants.pi / 180, offset = 20 * Modelica.Constants.pi / 180, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1, w(fixed = true, start = 105))  annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(propeller1dAerodynamic1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{20, 20}, {30, 20}, {30, 20}, {30, 20}}));
  connect(inertia1.flange_b, torque1.flange) annotation(
    Line(points = {{50, 20}, {60, 20}, {60, 20}, {60, 20}}));
  connect(torque1.tau, const_omega.y) annotation(
    Line(points = {{82, 20}, {100, 20}, {100, 20}, {100, 20}}, color = {0, 0, 127}));
  connect(boundary.ports[1], propeller1dAerodynamic1.port_amb) annotation(
    Line(points = {{-40, 50}, {-32, 50}, {-32, 36}, {-20, 36}, {-20, 36}}, color = {0, 127, 255}));
  connect(const_flowAngle.y, propeller1dAerodynamic1.u_flowAngle) annotation(
    Line(points = {{-39, 20}, {-34, 20}, {-34, 32}, {-22, 32}}, color = {0, 0, 127}));
  connect(ramp_flowSpeed.y, propeller1dAerodynamic1.u_flowSpeed) annotation(
    Line(points = {{-39, -20}, {-28, -20}, {-28, 26}, {-22, 26}}, color = {0, 0, 127}));
  connect(ramp_bladeAngle.y, propeller1dAerodynamic1.u_bladeAngle) annotation(
    Line(points = {{10, 59}, {10, 42}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
end Propeller1dAero001_02;
