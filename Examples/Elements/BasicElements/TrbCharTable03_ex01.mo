within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharTable03_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = Modelica.Media.Air.MoistAir;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 5.0)  annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 100, offset = 3000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_in(redeclare package Medium = engineAir, T = 1000, X = {0.01, 0.79, 0.2}, nPorts = 1, p = 5 * 101.325 * 1000, use_T_in = false, use_p_in = false)  annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = -1, offset = -10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {110, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable03 Trb(redeclare package Medium = engineAir, printCmd = true, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(pressure1.port, boundary.ports[1]) annotation(
    Line(points = {{50, -4}, {50, 40}, {60, 40}}, color = {0, 127, 255}));
  connect(boundary.m_flow_in, ramp_m_flow.y) annotation(
    Line(points = {{80, 48}, {98, 48}, {98, 48}, {100, 48}}, color = {0, 0, 127}));
  connect(pressure2.port, massFlowRate1.port_a) annotation(
    Line(points = {{-40, 40}, {-20, 40}, {-20, 40}, {-20, 40}}, color = {0, 127, 255}));
  connect(boundary_in.ports[1], pressure2.port) annotation(
    Line(points = {{-60, 40}, {-40, 40}}, color = {0, 127, 255}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{-119, -20}, {-103, -20}, {-103, -20}, {-103, -20}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-79, -20}, {-73, -20}, {-73, -20}, {-73, -20}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{-50, -20}, {-40, -20}, {-40, -20}, {-40, -20}}));
  connect(Trb.port_2, pressure1.port) annotation(
    Line(points = {{42, -4}, {50, -4}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Trb.port_1) annotation(
    Line(points = {{0, 40}, {18, 40}, {18, -4}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, Trb.flange_1) annotation(
    Line(points = {{-20, -20}, {10, -20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end TrbCharTable03_ex01;
