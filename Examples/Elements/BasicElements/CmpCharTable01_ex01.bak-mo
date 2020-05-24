within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharTable01_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 2, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtInit MassFlowAtInit(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {42, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene(eff_paramInput = 1.0, use_u_pwr = false)  annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{20, 20}, {32, 20}}));
  connect(MassFlowAtInit.port_2, Cmp.port_1) annotation(
    Line(points = {{-40, 36}, {-20, 36}, {-20, 36}, {-20, 36}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowAtInit.port_1) annotation(
    Line(points = {{-80, 50}, {-70, 50}, {-70, 36}, {-60, 36}, {-60, 36}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, MotGene.flange_1) annotation(
    Line(points = {{52, 20}, {90, 20}, {90, 20}, {90, 20}}));
  connect(Cmp.port_2, nzl.port_1) annotation(
    Line(points = {{20, 36}, {20, 36}, {20, 58}, {60, 58}, {60, 58}}, color = {0, 127, 255}));
  connect(boundary.ports[2], nzl.port_2) annotation(
    Line(points = {{-80, 50}, {-80, 50}, {-80, 70}, {80, 70}, {80, 58}, {80, 58}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTable01_ex01;
