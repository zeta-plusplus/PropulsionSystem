within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderIdealOttoMV01_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 2, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 5 * 1000, offset = 1 *101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_trq(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {56, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderIdealOttoMV01 PistonCylinder(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20.3333, -10.6}, extent = {{-19.6667, -23.6}, {19.6667, 23.6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {20, 9}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1e-3, w(fixed = true, start = 2000 * (2 * Modelica.Constants.pi / 60)))  annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 1e-2)  annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PistonCylinder.port_2, pipe1.port_a) annotation(
    Line(points = {{-1, 9}, {10, 9}}, color = {0, 127, 255}));
  connect(pipe1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{30, 9}, {56, 9}, {56, 50}}, color = {0, 127, 255}));
  connect(PistonCylinder.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{-1, -30}, {10, -30}}));
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-58, -10}, {-50, -10}, {-50, 3}, {-35, 3}}, color = {0, 0, 127}));
  connect(pipe.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-40, 20}, {-40, 9}}, color = {0, 127, 255}));
  connect(torque1.tau, ramp_trq.y) annotation(
    Line(points = {{92, -30}, {110, -30}, {110, -30}, {110, -30}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, damper1.flange_a) annotation(
    Line(points = {{60, -30}, {64, -30}, {64, -60}, {70, -60}, {70, -60}}));
  connect(inertia1.flange_b, torque1.flange) annotation(
    Line(points = {{60, -30}, {70, -30}, {70, -30}, {70, -30}}));
  connect(damper1.flange_b, fixed1.flange) annotation(
    Line(points = {{90, -60}, {110, -60}, {110, -60}, {110, -60}}));
  connect(powerSensor1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{30, -30}, {40, -30}, {40, -30}, {40, -30}}));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-40, 62}, {-40, 40}}, color = {0, 127, 255}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-79, 60}, {-74.5, 60}, {-74.5, 70}, {-62, 70}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-79, 30}, {-69, 30}, {-69, 66}, {-62, 66}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140562),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-120, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");
end PistonCylinderIdealOttoMV01_ex01;
