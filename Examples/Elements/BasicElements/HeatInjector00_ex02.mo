within PropulsionSystem.Examples.Elements.BasicElements;

model HeatInjector00_ex02
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
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 600, nPorts = 1, p = 20.0 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_OutletT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetSolverIndependent setSolverIndependent1 annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetConstraint setConstraint1 annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(temperature.port, boundary1.ports[1]) annotation(
    Line(points = {{0, -20}, {40, -20}}, color = {0, 127, 255}));
  connect(ramp_OutletT.y, setConstraint1.u_targetValue) annotation(
    Line(points = {{2, 50}, {10, 50}, {10, 32}, {10, 32}}, color = {0, 0, 127}));
  connect(temperature.T, setConstraint1.u_variable) annotation(
    Line(points = {{8, -10}, {10, -10}, {10, 8}, {10, 8}}, color = {0, 0, 127}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{-20, -20}, {0, -20}, {0, -20}, {0, -20}}, color = {0, 127, 255}));
  connect(setSolverIndependent1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-39, 30}, {-30, 30}, {-30, 20}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-30, 0}, {-30, 0}, {-30, -10}, {-30, -10}}, color = {191, 0, 0}));
  connect(boundary.ports[1], HeatInjector.port_1) annotation(
    Line(points = {{-60, -20}, {-40, -20}, {-40, -20}, {-40, -20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end HeatInjector00_ex02;
