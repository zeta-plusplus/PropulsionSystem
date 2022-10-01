within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharTable00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir, m_flow_1_des_paramInput = 10, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {42, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 2, height = 2, offset = -10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {80, 68}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{112, 20}, {120, 20}, {120, 20}, {120, 20}}, color = {0, 0, 127}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{82, 20}, {89, 20}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, speed1.flange) annotation(
    Line(points = {{52, 20}, {60, 20}}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-40, 36}, {-12, 36}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{20, 20}, {32, 20}}));
  connect(boundary1.ports[1], Cmp.port_2) annotation(
    Line(points = {{40, 60}, {12, 60}, {12, 36}}, color = {0, 127, 255}));
  connect(boundary1.m_flow_in, ramp.y) annotation(
    Line(points = {{60, 68}, {69, 68}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTable00_ex01;
