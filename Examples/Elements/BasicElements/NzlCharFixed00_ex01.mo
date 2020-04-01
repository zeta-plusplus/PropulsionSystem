within PropulsionSystem.Examples.Elements.BasicElements;

model NzlCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-50, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 18}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-40, 18}, {-30, 18}, {-30, 18}, {-30, 18}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Nzl.port_1) annotation(
    Line(points = {{-10, 18}, {10, 18}, {10, 18}, {10, 18}}, color = {0, 127, 255}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{30, 18}, {30, 40}}, color = {0, 127, 255}));
end NzlCharFixed00_ex01;
