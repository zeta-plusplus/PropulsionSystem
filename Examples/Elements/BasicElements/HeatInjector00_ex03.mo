within PropulsionSystem.Examples.Elements.BasicElements;

model HeatInjector00_ex03
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
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 600, nPorts = 1, p = 20.0 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints1 annotation(
    Placement(visible = true, transformation(origin = {0, 48}, extent = {{20, -12}, {-20, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(temperature.T, inverseBlockConstraints1.u1) annotation(
    Line(points = {{17, -20}, {30, -20}, {30, 48}, {22, 48}}, color = {0, 0, 127}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{-10, -30}, {10, -30}}, color = {0, 127, 255}));
  connect(temperature.port, boundary1.ports[1]) annotation(
    Line(points = {{10, -30}, {40, -30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HeatInjector.port_1) annotation(
    Line(points = {{-80, -30}, {-50, -30}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-30, 0}, {-30, -10}}, color = {191, 0, 0}));
  connect(inverseBlockConstraints1.y1, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-22, 48}, {-30, 48}, {-30, 20}, {-30, 20}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, inverseBlockConstraints1.u2) annotation(
    Line(points = {{8, 48}, {14, 48}, {14, 48}, {16, 48}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -80}, {100, 100}})),
  __OpenModelica_commandLineOptions = "");
end HeatInjector00_ex03;
