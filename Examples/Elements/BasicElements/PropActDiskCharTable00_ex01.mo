within PropulsionSystem.Examples.Elements.BasicElements;

model PropActDiskCharTable00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_Vinf(duration = 20, height = -95, offset = 100, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-90, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {38, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 50 * 1000, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {38, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharTable00 Prop(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_theta_deg(duration = 10, height = 10, offset = 25, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg1 annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_pwr.y, Constraint1.u_targetValue) annotation(
    Line(points = {{38, -29}, {38, -23}}, color = {0, 0, 127}));
  connect(from_deg1.y, Prop.u_theta) annotation(
    Line(points = {{-21, 70}, {-28, 70}, {-28, 32}, {-38, 32}}, color = {0, 0, 127}));
  connect(from_deg1.u, ramp_theta_deg.y) annotation(
    Line(points = {{2, 70}, {20, 70}, {20, 70}, {20, 70}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Prop.port_amb) annotation(
    Line(points = {{-70, 70}, {-56, 70}, {-56, 40}, {-56, 40}}, color = {0, 127, 255}));
  connect(ramp_Vinf.y, Prop.u_Vinf) annotation(
    Line(points = {{-79, 28}, {-63, 28}, {-63, 28}, {-63, 28}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, torque1.flange) annotation(
    Line(points = {{40, 20}, {50, 20}, {50, 20}, {50, 20}}));
  connect(torque1.tau, VarBySolver.y_independent) annotation(
    Line(points = {{72, 20}, {80, 20}, {80, 20}, {78, 20}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{0, 20}, {20, 20}, {20, 20}, {20, 20}}));
  connect(powerSensor1.power, Constraint1.u_variable) annotation(
    Line(points = {{38, 9}, {38, 9}, {38, 3}, {38, 3}}, color = {0, 0, 127}));
  connect(Prop.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-20, 20}, {3.57625e-06, 20}, {3.57625e-06, 20}, {3.57625e-06, 20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-06, Interval = 0.0266667),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PropActDiskCharTable00_ex01;
