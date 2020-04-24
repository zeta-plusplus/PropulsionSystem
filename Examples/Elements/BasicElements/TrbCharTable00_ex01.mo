within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharTable00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {90, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pout(duration = 10, height = 0, offset = 10 *101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {80, -70}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = -100, offset = 3000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pin(duration = 10, height = 5 * 101.325 * 1000, offset = 20 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tin(duration = 10, height = 100, offset = 1400, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(pressure1.p, Constraint.u_variable) annotation(
    Line(points = {{80, 0}, {80, 0}, {80, -28}, {80, -28}}, color = {0, 0, 127}));
  connect(Constraint.u_targetValue, ramp_pout.y) annotation(
    Line(points = {{80, -51}, {80, -59}}, color = {0, 0, 127}));
  connect(Trb.port_2, pressure1.port) annotation(
    Line(points = {{60, -4}, {70, -4}, {70, 10}}, color = {0, 127, 255}));
  connect(pressure1.port, boundary1.ports[1]) annotation(
    Line(points = {{70, 10}, {70, 40}, {80, 40}}, color = {0, 127, 255}));
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
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{100, 48}, {110, 48}, {110, 50}, {118, 50}, {118, 50}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-120, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end TrbCharTable00_ex01;
