within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderIdealOtto_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  PropulsionSystem.Elements.BasicElements.PistonCylinderIdealOttoMV00 PistonCylinder(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 16}, extent = {{-20, -24}, {20, 24}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {50, -4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 0, offset = 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {80, -4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-70, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {30, 36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 0, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_m_flow_fuel.y, PistonCylinder.u_m_flow_fuel) annotation(
    Line(points = {{-59, 0}, {-54, 0}, {-54, 28}, {-34, 28}}, color = {0, 0, 127}));
  connect(boundary.ports[1], PistonCylinder.port_1) annotation(
    Line(points = {{-60, 36}, {-40, 36}, {-40, 36}, {-40, 36}}, color = {0, 127, 255}));
  connect(PistonCylinder.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 36}, {20, 36}, {20, 36}, {20, 36}}, color = {0, 127, 255}));
  connect(speed1.w_ref, ramp_N.y) annotation(
    Line(points = {{62, -4}, {70, -4}, {70, -4}, {68, -4}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, torqueSensor1.flange_a) annotation(
    Line(points = {{0, -4}, {10, -4}, {10, -4}, {10, -4}}));
  connect(torqueSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{30, -4}, {40, -4}, {40, -4}, {40, -4}}));
end PistonCylinderIdealOtto_ex01;
