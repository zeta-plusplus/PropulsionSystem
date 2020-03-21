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
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb1(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 2, offset = 5, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 10, height = 0, offset = 0.8, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_eff.y, Trb1.u_eff) annotation(
    Line(points = {{-19, -60}, {-10, -60}, {-10, 4}}, color = {0, 0, 127}));
  connect(ramp_PR.y, Trb1.u_PR) annotation(
    Line(points = {{-19, -30}, {-14, -30}, {-14, 6}}, color = {0, 0, 127}));
  connect(constantSpeed1.flange, Trb1.flange_1) annotation(
    Line(points = {{-80, 10}, {-20, 10}}));
  connect(Trb1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 18}, {10, 18}, {10, 50}, {20, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Trb1.port_1) annotation(
    Line(points = {{-40, 50}, {-34, 50}, {-34, 18}, {-20, 18}}, color = {0, 127, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(graphics = {Text(origin = {14, -11}, extent = {{-18, 5}, {18, -5}}, textString = "PR, eff are given"), Text(origin = {-58, 1}, extent = {{-18, 5}, {26, -7}}, textString = "pwr, trq are calculated"), Line(origin = {-17, -8}, points = {{11, -4}, {-11, 4}}, arrow = { Arrow.None,Arrow.Open})}));
  
end TrbCharFixed00_ex01;
