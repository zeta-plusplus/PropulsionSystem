within PropulsionSystem.Examples.Elements.BasicElements;

model Volume002_001
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, use_T_in = false, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 101.3 * 1000, offset = 10 * 101.3 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = engineAir, diameter = 0.1, zeta = 0.01) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.ControlVolume controlVolume1(redeclare package Medium = engineAir, vol = 10) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(controlVolume1.port_2, orifice.port_a) annotation(
    Line(points = {{20, 28}, {26, 28}, {26, 20}, {30, 20}, {30, 20}}, color = {0, 127, 255}));
  connect(boundary.ports[1], controlVolume1.port_1) annotation(
    Line(points = {{-20, 20}, {-12, 20}, {-12, 28}, {0, 28}, {0, 28}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{50, 20}, {60, 20}, {60, 20}, {60, 20}}, color = {0, 127, 255}));
  connect(ramp1.y, boundary.p_in) annotation(
    Line(points = {{-58, 30}, {-50, 30}, {-50, 28}, {-42, 28}, {-42, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));

end Volume002_001;
