within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharFixed00_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb1(redeclare package Medium = engineAir, printCmd = true, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 10, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 1000 * 1000, offset = 3000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-52, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {-52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(constantSpeed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{-80, 10}, {-70, 10}, {-70, 10}, {-70, 10}}));
  connect(boundary.ports[1], Trb1.port_1) annotation(
    Line(points = {{-40, 50}, {-34, 50}, {-34, 18}, {0, 18}}, color = {0, 127, 255}));
  connect(Trb1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 18}, {30, 18}, {30, 50}, {40, 50}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, Trb1.flange_1) annotation(
    Line(points = {{-50, 10}, {2.08615e-06, 10}, {2.08615e-06, 10}, {2.08615e-06, 10}}));
  connect(constrainVariable1.u_variable, powerSensor1.power) annotation(
    Line(points = {{-52, -9}, {-52, -9}, {-52, -1}, {-52, -1}}, color = {0, 0, 127}));
  connect(constrainVariable1.u_targetValue, ramp_pwr.y) annotation(
    Line(points = {{-52, -31}, {-52, -31}, {-52, -37}, {-52, -37}}, color = {0, 0, 127}));
  connect(ramp_eff.y, Trb1.u_eff) annotation(
    Line(points = {{1, -50}, {10, -50}, {10, 4}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(graphics = {Text(origin = {-34, 1}, extent = {{-12, 5}, {22, -3}}, textString = "pwr, trq are given"), Text(origin = {32, -9}, extent = {{-12, 5}, {22, -3}}, textString = "PR is calculated"), Text(origin = {18, -59}, extent = {{-12, 5}, {14, -1}}, textString = "eff is given"), Line(origin = {1, -9}, points = {{-13, 7}, {15, 1}}, arrow = {Arrow.None, Arrow.Open})}, coordinateSystem(initialScale = 0.1)));
end TrbCharFixed00_ex02;
