within PropulsionSystem.Examples.temp;

model Pulsejet_temp1
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, m_flow_start = 200) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {180, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 1e-3, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {130, 26}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {90, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 1200, falling = 0.1, offset = 400, period = 0.3, rising = 0.1, startTime = 10, width = 0) annotation(
    Placement(visible = true, transformation(origin = {180, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, MN_paramInput = 0.8, alt_paramInput = 0.0) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir, AmechTh_paramInput = Modelica.Constants.pi / 4 * 0.05 ^ 2, switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.param)  annotation(
    Placement(visible = true, transformation(origin = {230, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {180, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {120, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback Fn annotation(
    Placement(visible = true, transformation(origin = {270, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Inlt.y_FdRam, Fn.u2) annotation(
    Line(points = {{34, 12}, {50, 12}, {50, -90}, {262, -90}, {262, -90}}, color = {0, 0, 127}));
  connect(Nzl.y_Fg, Fn.u1) annotation(
    Line(points = {{240, 20}, {270, 20}, {270, -82}, {270, -82}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{120, -58}, {120, -58}, {120, -50}, {120, -50}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-40, 60}, {-40, 70}, {250, 70}, {250, 36}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-20, 36}, {0, 36}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-18, 24}, {-3.5, 24}, {-3.5, 12}, {6, 12}}, color = {0, 0, 127}));
  connect(Inlt.port_2, pipe1.port_a) annotation(
    Line(points = {{40, 36}, {80, 36}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{130, 36}, {170, 36}}, color = {0, 127, 255}));
  connect(pipe.port_b, Nzl.port_1) annotation(
    Line(points = {{190, 36}, {210, 36}}, color = {0, 127, 255}));
  connect(volume.heatPort, temperatureSensor1.port) annotation(
    Line(points = {{120, 26}, {120, -10}}, color = {191, 0, 0}));
  connect(pipe1.port_b, volume.ports[1]) annotation(
    Line(points = {{100, 36}, {130, 36}}, color = {0, 127, 255}));
  connect(temperatureSensor1.T, Constraint.u_variable) annotation(
    Line(points = {{140, -10}, {180, -10}, {180, -19}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, temperatureSensor1.port) annotation(
    Line(points = {{120, -30}, {120, -10}}, color = {191, 0, 0}));
  connect(trapezoid1.y, Constraint.u_targetValue) annotation(
    Line(points = {{180, -49}, {182, -49}, {182, -49}, {180, -49}, {180, -43}, {181, -43}, {181, -43}, {180, -43}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -160}, {300, 100}})),
  __OpenModelica_commandLineOptions = "");
end Pulsejet_temp1;
