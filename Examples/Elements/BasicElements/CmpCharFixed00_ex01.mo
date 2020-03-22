within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2 * Modelica.Constants.pi / 60) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 5, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cmp.flange_2, constantSpeed1.flange) annotation(
    Line(points = {{0, 30}, {60, 30}}));
  connect(ramp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-18, -30}, {-10, -30}, {-10, 24}, {-10, 24}}, color = {0, 0, 127}));
  connect(ramp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-18, 0}, {-14, 0}, {-14, 22}, {-14, 22}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-40, 60}, {-30, 60}, {-30, 38}, {-20, 38}}, color = {0, 127, 255}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 38}, {8, 38}, {8, 60}, {20, 60}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
  Diagram(graphics = {Text(origin = {22, 11}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {6, 1}}, textString = "PR, eff are given"), Text(origin = {60, 9}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {28, -5}}, textString = "pwr, trq are calculated"), Line(origin = {30, 11}, points = {{-6, 1}, {6, -1}}, arrow = {Arrow.None, Arrow.Open})}, coordinateSystem(extent = {{-100, -60}, {100, 100}})),
  __OpenModelica_commandLineOptions = "");
  
end CmpCharFixed00_ex01;
