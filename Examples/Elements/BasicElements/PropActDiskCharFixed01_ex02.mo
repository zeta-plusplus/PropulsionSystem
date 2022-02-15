within PropulsionSystem.Examples.Elements.BasicElements;

model PropActDiskCharFixed01_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_Vinf(duration = 10, height = -50, offset = 300, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effProp(duration = 10, height = 0.00, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-68, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {58, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 5 * 1000, offset = 100 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {58, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed01 Prop(redeclare package Medium = engineAir, Jdes_paramInput = 2.0, printCmd = false, use_u_effProp = true) annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDes annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Prop.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-40, 20}, {-20, 20}}));
  connect(ramp_Vinf.y, Prop.u_Vinf) annotation(
    Line(points = {{-99, 30}, {-94, 30}, {-94, 28}, {-82, 28}}, color = {0, 0, 127}));
  connect(ramp_effProp.y, Prop.u_effProp) annotation(
    Line(points = {{-68, -9}, {-68, -2}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Prop.port_amb) annotation(
    Line(points = {{-90, 70}, {-76, 70}, {-76, 40}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, torque1.flange) annotation(
    Line(points = {{60, 20}, {70, 20}, {70, 20}, {70, 20}}));
  connect(torque1.tau, VarBySolver.y_independent) annotation(
    Line(points = {{92, 20}, {100, 20}, {100, 20}, {98, 20}}, color = {0, 0, 127}));
  connect(powerSensor1.power, Constraint1.u_variable) annotation(
    Line(points = {{58, 9}, {58, 9}, {58, 3}, {58, 3}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint1.u_targetValue) annotation(
    Line(points = {{58, -33}, {58, -33}, {58, -23}, {58, -23}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, NmechDes.flange_1) annotation(
    Line(points = {{-20, 20}, {0, 20}}));
  connect(NmechDes.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{20, 20}, {40, 20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.0166722),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})));
end PropActDiskCharFixed01_ex02;
