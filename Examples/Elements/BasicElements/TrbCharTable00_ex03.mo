within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharTable00_ex03
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir, T1_des_paramInput = 800, m_flow_1_des_paramInput = 1, p1_des_paramInput = 1.2 * 100 * 1000, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 3000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pin(duration = 10, height = 5 * 100 * 1000, offset = 1.5 * 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tin(duration = 10, height = 200, offset = 800, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 100 * 1000, use_T_in = false, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(Trb.port_2, pressure1.port) annotation(
    Line(points = {{60, -4}, {70, -4}, {70, 10}}, color = {0, 127, 255}));
  connect(ramp_Tin.y, boundary.T_in) annotation(
    Line(points = {{-38, 20}, {-30, 20}, {-30, 44}, {-22, 44}, {-22, 44}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{-99, -20}, {-83, -20}, {-83, -20}, {-83, -20}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{-30, -20}, {-20, -20}, {-20, -20}, {-20, -20}}));
  connect(powerSensor1.flange_a, Trb.flange_1) annotation(
    Line(points = {{0, -20}, {20, -20}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-59, -20}, {-53, -20}, {-53, -20}, {-53, -20}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Trb.port_1) annotation(
    Line(points = {{0, 40}, {6, 40}, {6, -4}, {20, -4}}, color = {0, 127, 255}));
  connect(ramp_pin.y, boundary.p_in) annotation(
    Line(points = {{-38, 50}, {-30, 50}, {-30, 48}, {-22, 48}, {-22, 48}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], pressure1.port) annotation(
    Line(points = {{80, 50}, {70, 50}, {70, 10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-120, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end TrbCharTable00_ex03;
