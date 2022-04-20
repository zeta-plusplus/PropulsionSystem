within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharFixed_steam_01_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 400 + 273.15, nPorts = 1, p = 5 * 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb1(redeclare package Medium = Modelica.Media.Water.StandardWater, printCmd = true, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 10, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-60, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = 0.0, offset = 1.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1(use_u_targetVal = true)  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 400 + 273.15, nPorts = 1, p = 1 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pin(duration = 10, height = 1 * 101.325 * 1000, offset = 5 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantSpeed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{-80, -20}, {-70, -20}, {-70, -20}, {-70, -20}}));
  connect(boundary.ports[1], Trb1.port_1) annotation(
    Line(points = {{-40, 20}, {-34, 20}, {-34, -12}, {0, -12}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, Trb1.flange_1) annotation(
    Line(points = {{-50, -20}, {2.08615e-06, -20}, {2.08615e-06, -20}, {2.08615e-06, -20}}));
  connect(ramp_eff.y, Trb1.u_eff) annotation(
    Line(points = {{1, -60}, {10, -60}, {10, -26}}, color = {0, 0, 127}));
  connect(Trb1.port_2, massFlowRate.port_a) annotation(
    Line(points = {{20, -12}, {32, -12}, {32, 20}, {40, 20}}));
  connect(massFlowRate.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, 20}, {80, 20}}, color = {0, 127, 255}));
  connect(constrainVariable1.u_variable, massFlowRate.m_flow) annotation(
    Line(points = {{41, 50}, {50, 50}, {50, 31}}, color = {0, 0, 127}));
  connect(ramp_m_flow.y, constrainVariable1.u_targetValue) annotation(
    Line(points = {{11, 50}, {17, 50}}, color = {0, 0, 127}));
  connect(ramp_pin.y, boundary.p_in) annotation(
    Line(points = {{-78, 50}, {-72, 50}, {-72, 28}, {-62, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(graphics = {Text(origin = {4, -3}, extent = {{-36, 11}, {66, -8}}, textString = "mass flow, inlet/outlet pressure are given"), Text(origin = {46, -37}, extent = {{-26, 7}, {48, -4}}, textString = "power, torque are calculated"), Text(origin = {18, -69}, extent = {{-12, 5}, {14, -1}}, textString = "eff is given"), Line(origin = {39.4071, -13.292}, points = {{-13, 7}, {-9, -19}}, arrow = {Arrow.None, Arrow.Open})}, coordinateSystem(initialScale = 0.1)));
end TrbCharFixed_steam_01_ex01;
