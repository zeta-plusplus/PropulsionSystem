within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharFixed00_ex02
  extends Modelica.Icons.Example;
  //-----

package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = -1000 * 1000, offset = -2000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 5, height = 0.1, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2 * Modelica.Constants.pi / 60)  annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_pwr.y, constrainVariable1.u_targetValue) annotation(
    Line(points = {{42, -20}, {52, -20}, {52, -12}, {52, -12}}, color = {0, 0, 127}));
  connect(powerSensor1.power, constrainVariable1.u_variable) annotation(
    Line(points = {{52, 20}, {52, 20}, {52, 12}, {52, 12}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{70, 30}, {80, 30}}));
  connect(Cmp.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{-20, 30}, {50, 30}}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-20, 38}, {8, 38}, {8, 60}, {20, 60}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-60, 60}, {-50, 60}, {-50, 38}, {-40, 38}}, color = {0, 127, 255}));
  connect(ramp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-39, 0}, {-30, 0}, {-30, 24}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
  Diagram(graphics = {Text(origin = {26, 29}, extent = {{-12, 3}, {22, -11}}, textString = "pwr, trq are given"), Text(origin = {-19, 11}, extent = {{-7, 5}, {27, -11}}, textString = "PR is calculated"), Text(origin = {-63, 23}, extent = {{-5, 3}, {21, -7}}, textString = "eff is given"), Line(origin = {2, 20}, points = {{8, 4}, {-8, -8}}, arrow = {Arrow.None, Arrow.Open})}, coordinateSystem(initialScale = 0.1)));
end CmpCharFixed00_ex02;
