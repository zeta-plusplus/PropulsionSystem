within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderIdealOttoMV00_ex05
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 2, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.02, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0, offset = 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.02, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {20, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {56, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.ExpansionToAmbient ExpToAmb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {50, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderIdealOttoMV00 PistonCylinder(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-19.8333, -10.2}, extent = {{-20.1667, -24.2}, {20.1667, 24.2}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1e-3, w(fixed = true, start = 1000 * (2 * Modelica.Constants.pi / 60)))  annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_trqLoad(duration = 10, height = 0, offset = -5.2, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 1e-3)  annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = engineAir, dp_nominal(displayUnit = "Pa") = 10 * 1000, m_flow_nominal = 0.005)  annotation(
    Placement(visible = true, transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_throttle(duration = 10, height = 0.15, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_throttle.y, valveLinear1.opening) annotation(
    Line(points = {{-78, 60}, {-60, 60}, {-60, 38}, {-60, 38}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-50, 30}, {-44, 30}, {-44, 10}, {-40, 10}, {-40, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], valveLinear1.port_a) annotation(
    Line(points = {{-80, 30}, {-70, 30}, {-70, 30}, {-70, 30}}, color = {0, 127, 255}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-119, 40}, {-111, 40}, {-111, 38}, {-103, 38}, {-103, 38}, {-103, 38}, {-103, 38}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-119, 10}, {-115, 10}, {-115, 34}, {-103, 34}, {-103, 34}, {-103, 34}, {-103, 34}}, color = {0, 0, 127}));
  connect(damper1.flange_b, fixed1.flange) annotation(
    Line(points = {{90, -60}, {100, -60}, {100, -60}, {100, -60}}));
  connect(inertia1.flange_b, damper1.flange_a) annotation(
    Line(points = {{60, -30}, {66, -30}, {66, -60}, {70, -60}, {70, -60}}));
  connect(torque1.tau, ramp_trqLoad.y) annotation(
    Line(points = {{102, -30}, {109, -30}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, torque1.flange) annotation(
    Line(points = {{60, -30}, {80, -30}}));
  connect(powerSensor1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{30, -30}, {40, -30}}));
  connect(PistonCylinder.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{0, -30}, {10, -30}}));
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-58, -10}, {-48, -10}, {-48, 2}, {-35, 2}}, color = {0, 0, 127}));
  connect(PistonCylinder.port_2, pipe.port_a) annotation(
    Line(points = {{0, 10}, {5, 10}, {5, 16}, {10, 16}}, color = {0, 127, 255}));
  connect(pipe.port_b, ExpToAmb.port_1) annotation(
    Line(points = {{30, 16}, {40, 16}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], ExpToAmb.port_2) annotation(
    Line(points = {{56, 50}, {56, 26}}, color = {0, 127, 255}));
  annotation(
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");
end PistonCylinderIdealOttoMV00_ex05;
