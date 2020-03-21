within PropulsionSystem.Examples.Tests;

model PropellerActDisk001_001
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.PropellerActDisk propellerActDisk1 annotation(
    Placement(visible = true, transformation(origin = {-20, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_flowSpeed(duration = 10, height = 0, offset = 200, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 1000) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_torque(duration = 10, height = 1000 * 1000, offset = 1000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(torque1.tau, ramp_torque.y) annotation(
    Line(points = {{62, 0}, {80, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(ramp_flowSpeed.y, propellerActDisk1.u_flowSpeed) annotation(
    Line(points = {{-58, 30}, {-54, 30}, {-54, 6}, {-42, 6}, {-42, 6}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, torque1.flange) annotation(
    Line(points = {{30, 0}, {40, 0}}));
  connect(propellerActDisk1.flange_1, constrain_Nmech1.flange_a) annotation(
    Line(points = {{0, 0}, {10, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PropellerActDisk001_001;
