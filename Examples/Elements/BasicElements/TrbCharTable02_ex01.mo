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
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = -100, offset = 3000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tin(duration = 10, height = 0, offset = 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {90, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = 1 * 101.325 * 1000, offset = 5 * 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 10)  annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_in(redeclare package Medium = engineAir, T = 1000, nPorts = 1, p = 5 * 101.325 * 1000, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary_in.ports[1], MassFlowDes.port_1) annotation(
    Line(points = {{-40, 40}, {-30, 40}, {-30, 40}, {-30, 40}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, pressure2.port) annotation(
    Line(points = {{-10, 40}, {0, 40}, {0, 40}, {0, 40}}, color = {0, 127, 255}));
  connect(pressure2.port, Trb.port_1) annotation(
    Line(points = {{0, 40}, {20, 40}, {20, -4}}, color = {0, 127, 255}));
  connect(ramp_Tin.y, boundary_in.T_in) annotation(
    Line(points = {{-79, 20}, {-71, 20}, {-71, 44}, {-63, 44}, {-63, 44}}, color = {0, 0, 127}));
  connect(ramp_m_flow.y, boundary_in.p_in) annotation(
    Line(points = {{-79, 60}, {-75, 60}, {-75, 48}, {-63, 48}, {-63, 48}}, color = {0, 0, 127}));
  connect(Trb.port_2, pressure1.port) annotation(
    Line(points = {{60, -4}, {80, -4}}, color = {0, 127, 255}));
  connect(boundary_out.ports[1], pressure1.port) annotation(
    Line(points = {{100, 40}, {80, 40}, {80, -4}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, Trb.flange_1) annotation(
    Line(points = {{0, -20}, {20, -20}, {20, -20}, {20, -20}}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{-99, -20}, {-83, -20}, {-83, -20}, {-83, -20}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{-30, -20}, {-20, -20}, {-20, -20}, {-20, -20}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-59, -20}, {-53, -20}, {-53, -20}, {-53, -20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-120, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end TrbCharTable02_ex01;
