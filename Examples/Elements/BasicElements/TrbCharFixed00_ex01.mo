within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb1(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.param)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0)  annotation(
    Placement(visible = true, transformation(origin = {-74, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantSpeed1.flange, Trb1.flange_1) annotation(
    Line(points = {{-64, 0}, {-50, 0}, {-50, 10}, {-20, 10}, {-20, 10}}));
  connect(Trb1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 18}, {10, 18}, {10, 30}, {20, 30}, {20, 30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Trb1.port_1) annotation(
    Line(points = {{-40, 30}, {-34, 30}, {-34, 18}, {-20, 18}, {-20, 18}}, color = {0, 127, 255}));
end TrbCharFixed00_ex01;
