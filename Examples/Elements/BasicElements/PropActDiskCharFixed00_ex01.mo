within PropulsionSystem.Examples.Elements.BasicElements;

model PropActDiskCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  Modelica.Blocks.Sources.Ramp ramp_Vinf(duration = 10, height = -290, offset = 300, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed00 Prop(switch_FnSaturation = PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed00.switchThrustSaturation.byVinf) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effProp(duration = 10, height = 0.00, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {38, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 50 * 1000, offset = 100 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {38, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nprop(duration = 10, height = 0, offset = 2000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ramp_Nprop.y, from_rpm1.u) annotation(
    Line(points = {{0, -48}, {0, -48}, {0, -42}, {0, -42}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint.u_targetValue) annotation(
    Line(points = {{0, -18}, {0, -18}, {0, -12}, {0, -12}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint1.u_targetValue) annotation(
    Line(points = {{38, -13}, {38, -13}, {38, -3}, {38, -3}}, color = {0, 0, 127}));
  connect(torque1.tau, VarBySolver.y_independent) annotation(
    Line(points = {{72, 40}, {80, 40}, {80, 40}, {78, 40}}, color = {0, 0, 127}));
  connect(ramp_effProp.y, Prop.u_effProp) annotation(
    Line(points = {{-40, 11}, {-40, 11}, {-40, 17}, {-40, 17}}, color = {0, 0, 127}));
  connect(speedSensor1.w, Constraint.u_variable) annotation(
    Line(points = {{0, 19}, {0, 19}, {0, 13}, {0, 13}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, torque1.flange) annotation(
    Line(points = {{40, 40}, {50, 40}, {50, 40}, {50, 40}}));
  connect(powerSensor1.power, Constraint1.u_variable) annotation(
    Line(points = {{38, 29}, {38, 29}, {38, 23}, {38, 23}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{0, 40}, {20, 40}, {20, 40}, {20, 40}}));
  connect(Prop.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-20, 40}, {7.15249e-06, 40}, {7.15249e-06, 40}, {7.15249e-06, 40}}));
  connect(ramp_Vinf.y, Prop.u_Vinf) annotation(
    Line(points = {{-79, 70}, {-75, 70}, {-75, 48}, {-63, 48}, {-63, 48}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PropActDiskCharFixed00_ex01;
