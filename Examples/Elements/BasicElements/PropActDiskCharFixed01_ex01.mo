within PropulsionSystem.Examples.Elements.BasicElements;

model PropActDiskCharFixed01_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_Vinf(duration = 10, height = -50, offset = 300, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effProp(duration = 10, height = 0.00, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-48, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {38, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 5 * 1000, offset = 100 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {38, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nprop(duration = 10, height = 0, offset = 2000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed01 Prop(redeclare package Medium = engineAir, Jdes_paramInput = 2.0, printCmd = false, use_u_effProp = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Prop.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-20, 20}, {0, 20}}));
  connect(ramp_Vinf.y, Prop.u_Vinf) annotation(
    Line(points = {{-79, 30}, {-74, 30}, {-74, 28}, {-62, 28}}, color = {0, 0, 127}));
  connect(ramp_effProp.y, Prop.u_effProp) annotation(
    Line(points = {{-48, -9}, {-48, -2}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Prop.port_amb) annotation(
    Line(points = {{-70, 70}, {-56, 70}, {-56, 40}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, torque1.flange) annotation(
    Line(points = {{40, 20}, {50, 20}, {50, 20}, {50, 20}}));
  connect(torque1.tau, VarBySolver.y_independent) annotation(
    Line(points = {{72, 20}, {80, 20}, {80, 20}, {78, 20}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{0, 20}, {20, 20}, {20, 20}, {20, 20}}));
  connect(powerSensor1.power, Constraint1.u_variable) annotation(
    Line(points = {{38, 9}, {38, 9}, {38, 3}, {38, 3}}, color = {0, 0, 127}));
  connect(speedSensor1.w, Constraint.u_variable) annotation(
    Line(points = {{0, -1}, {0, -1}, {0, -7}, {0, -7}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint.u_targetValue) annotation(
    Line(points = {{0, -39}, {0, -39}, {0, -33}, {0, -33}}, color = {0, 0, 127}));
  connect(ramp_Nprop.y, from_rpm1.u) annotation(
    Line(points = {{0, -69}, {0, -69}, {0, -63}, {0, -63}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint1.u_targetValue) annotation(
    Line(points = {{38, -33}, {38, -33}, {38, -23}, {38, -23}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.0166722),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PropActDiskCharFixed01_ex01;
