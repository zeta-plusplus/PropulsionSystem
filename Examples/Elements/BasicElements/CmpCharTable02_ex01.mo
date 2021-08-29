within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharTable02_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {42, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 100, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = -0.1, offset = -10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {80, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(boundary1.m_flow_in, ramp_m_flow.y) annotation(
    Line(points = {{50, 68}, {58, 68}, {58, 70}, {70, 70}, {70, 70}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{0, 20}, {32, 20}, {32, 20}, {32, 20}}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 36}, {0, 60}, {30, 60}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-80, 50}, {-40, 50}, {-40, 36}, {-40, 36}}, color = {0, 127, 255}));
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{112, 20}, {120, 20}, {120, 20}, {120, 20}}, color = {0, 0, 127}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{82, 20}, {89, 20}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, speed1.flange) annotation(
    Line(points = {{52, 20}, {60, 20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTable02_ex01;
