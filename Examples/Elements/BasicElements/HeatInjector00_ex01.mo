within PropulsionSystem.Examples.Elements.BasicElements;

model HeatInjector00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 600, nPorts = 1, p = 20.0 * 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 1000 * 1000, offset = 1000 * 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-18, 60}, {-10, 60}, {-10, 50}, {-10, 50}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-10, 30}, {-10, 30}, {-10, 20}, {-10, 20}}, color = {191, 0, 0}));
  connect(boundary.ports[1], HeatInjector.port_1) annotation(
    Line(points = {{-40, 10}, {-20, 10}, {-20, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(HeatInjector.port_2, boundary1.ports[1]) annotation(
    Line(points = {{1.49012e-07, 10}, {20, 10}, {20, 10}, {20, 10}}, color = {0, 127, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));

  
end HeatInjector00_ex01;
