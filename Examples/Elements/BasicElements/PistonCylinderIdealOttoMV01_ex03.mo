within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderIdealOttoMV01_ex03
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 2, p = 101.325 * 1000, use_T_in = true, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {56, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderIdealOttoMV01 PistonCylinder(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20.3333, -10.6}, extent = {{-19.6667, -23.6}, {19.6667, 23.6}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = engineAir, dp_nominal(displayUnit = "Pa") = 20 * 1000, m_flow_nominal = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_throttle(duration = 10, height = 0.3, offset = 0.7, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = engineAir, dp_nominal(displayUnit = "Pa") = 50 * 1000, m_flow_nominal = 0.001) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_exhValve(duration = 10, height = -0.5, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_exhValve.y, valveLinear2.opening) annotation(
    Line(points = {{22, 50}, {30, 50}, {30, 18}, {30, 18}}, color = {0, 0, 127}));
  connect(valveLinear2.port_b, boundary1.ports[1]) annotation(
    Line(points = {{40, 10}, {56, 10}, {56, 50}, {56, 50}}, color = {0, 127, 255}));
  connect(PistonCylinder.port_2, valveLinear2.port_a) annotation(
    Line(points = {{0, 10}, {20, 10}, {20, 10}, {20, 10}}, color = {0, 127, 255}));
  connect(ramp_throttle.y, valveLinear1.opening) annotation(
    Line(points = {{-69, 50}, {-60, 50}, {-60, 28}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-59, -30}, {-50, -30}, {-50, 3}, {-35, 3}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-50, 20}, {-40, 20}, {-40, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], valveLinear1.port_a) annotation(
    Line(points = {{-80, 20}, {-70, 20}, {-70, 20}, {-70, 20}}, color = {0, 127, 255}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-119, 0}, {-115, 0}, {-115, 24}, {-103, 24}, {-103, 24}, {-103, 24}, {-103, 24}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{-1, -30}, {10, -30}}));
  connect(powerSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{30, -30}, {35, -30}, {35, -30}, {40, -30}, {40, -30}, {40, -30}, {40, -30}, {40, -30}}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{62, -30}, {68, -30}, {68, -30}, {68, -30}}, color = {0, 0, 127}));
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{92, -30}, {100, -30}, {100, -30}, {100, -30}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140562),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}})),
    __OpenModelica_commandLineOptions = "");
end PistonCylinderIdealOttoMV01_ex03;
