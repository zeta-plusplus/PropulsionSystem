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
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = -20 * 1000, offset = 1 *101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = engineAir, diameter = 0.01, zeta = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice1(redeclare package Medium = engineAir, diameter = 0.01, zeta = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-79, 60}, {-74.5, 60}, {-74.5, 70}, {-62, 70}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-79, 30}, {-69, 30}, {-69, 66}, {-62, 66}}, color = {0, 0, 127}));
  connect(boundary.ports[1], orifice1.port_a) annotation(
    Line(points = {{-40, 62}, {-40, 40}}, color = {0, 127, 255}));
  connect(orifice1.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-40, 20}, {-40, 20}, {-40, 10}, {-40, 10}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{40, 10}, {56, 10}, {56, 50}, {56, 50}}, color = {0, 127, 255}));
  connect(PistonCylinder.port_2, orifice.port_a) annotation(
    Line(points = {{0, 10}, {20, 10}, {20, 10}, {20, 10}}, color = {0, 127, 255}));
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-58, -10}, {-50, -10}, {-50, 3}, {-35, 3}}, color = {0, 0, 127}));
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
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})),
    __OpenModelica_commandLineOptions = "");
end PistonCylinderIdealOttoMV01_ex01;
