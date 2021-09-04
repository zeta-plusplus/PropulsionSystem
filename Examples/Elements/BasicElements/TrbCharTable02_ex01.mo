within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharTable02_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 5.0)  annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_out(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 1 * 101.325 * 1000, use_T_in = false, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
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
  Modelica.Blocks.Sources.Ramp ramp_Tin(duration = 10, height = 0, offset = 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 0 * 101.325 * 1000, offset = 5 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_in(redeclare package Medium = engineAir, T = 1000, nPorts = 1, p = 5 * 101.325 * 1000, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {44, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ConstraintDesPt.u_targetValue, const.y) annotation(
    Line(points = {{22, 60}, {32, 60}, {32, 60}, {32, 60}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, ConstraintDesPt.u_variable) annotation(
    Line(points = {{-10, 52}, {-10, 52}, {-10, 60}, {-2, 60}, {-2, 60}}, color = {0, 0, 127}));
  connect(pressure1.port, boundary_out.ports[1]) annotation(
    Line(points = {{50, -4}, {50, -4}, {50, 20}, {120, 20}, {120, 20}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Trb.port_1) annotation(
    Line(points = {{0, 40}, {0, 40}, {0, -4}, {0, -4}}, color = {0, 127, 255}));
  connect(pressure2.port, massFlowRate1.port_a) annotation(
    Line(points = {{-40, 40}, {-20, 40}, {-20, 40}, {-20, 40}}, color = {0, 127, 255}));
  connect(boundary_in.ports[1], pressure2.port) annotation(
    Line(points = {{-60, 40}, {-40, 40}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, Trb.flange_1) annotation(
    Line(points = {{-20, -20}, {0, -20}, {0, -20}, {0, -20}}));
  connect(Trb.port_2, pressure1.port) annotation(
    Line(points = {{40, -4}, {50, -4}, {50, -4}, {50, -4}}, color = {0, 127, 255}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{-119, -20}, {-103, -20}, {-103, -20}, {-103, -20}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, boundary_in.p_in) annotation(
    Line(points = {{-99, 60}, {-95, 60}, {-95, 48}, {-83, 48}, {-83, 48}}, color = {0, 0, 127}));
  connect(ramp_Tin.y, boundary_in.T_in) annotation(
    Line(points = {{-99, 20}, {-91, 20}, {-91, 44}, {-83, 44}, {-83, 44}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-79, -20}, {-73, -20}, {-73, -20}, {-73, -20}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{-50, -20}, {-40, -20}, {-40, -20}, {-40, -20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end TrbCharTable02_ex01;
