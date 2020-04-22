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
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 20.0 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -1.0, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_OutletT(duration = 10, height = 200, offset = 1400, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver variableBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(variableBySolver1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-39, 20}, {-30, 20}, {-30, 10}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-30, -10}, {-30, -20}}, color = {191, 0, 0}));
  connect(temperature.T, constrainVariable1.u_variable) annotation(
    Line(points = {{17, -30}, {30, -30}, {30, -22}}, color = {0, 0, 127}));
  connect(ramp_OutletT.y, constrainVariable1.u_targetValue) annotation(
    Line(points = {{21, 50}, {30, 50}, {30, 2}}, color = {0, 0, 127}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{-10, -40}, {10, -40}}, color = {0, 127, 255}));
  connect(temperature.port, boundary1.ports[1]) annotation(
    Line(points = {{10, -40}, {40, -40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HeatInjector.port_1) annotation(
    Line(points = {{-70, -40}, {-50, -40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -80}, {100, 100}})),
  __OpenModelica_commandLineOptions = "");
end HeatInjector00_ex02;
