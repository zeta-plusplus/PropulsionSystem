within PropulsionSystem.Examples.temp;

model Pulsejet_temp
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, m_flow_start = 200) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Comb036(redeclare package Medium = engineAir, V = 20.0e-3, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {150, 26}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe020(redeclare package Medium = engineAir, diameter = 0.1, length = 0.2) annotation(
    Placement(visible = true, transformation(origin = {60, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 1200, falling = 0.1, offset = 400, period = 0.2, rising = 0.1, startTime = 10, width = 0) annotation(
    Placement(visible = true, transformation(origin = {170, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, MN_paramInput = 0.2, alt_paramInput = 0.0, use_u_MN = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl070(redeclare package Medium = engineAir, AmechTh_paramInput = Modelica.Constants.pi / 4 * 0.05 ^ 2, switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {250, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {140, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {140, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback Fn annotation(
    Placement(visible = true, transformation(origin = {290, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.HydroThermal.Components.CheckValveSpringLoad_Linear Valve030(redeclare package Medium = engineAir, deltapCrack = 0.001, gradientQP = 0.001 * 1 / 1.0) annotation(
    Placement(visible = true, transformation(origin = {120, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = engineAir, V = 1e-3, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {90, 26}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MnFlt(duration = 10, height = -0.2, offset = 0.2, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe040(redeclare package Medium = engineAir, diameter = 0.1, length = 1, nNodes = 2, useLumpedPressure = true)  annotation(
    Placement(visible = true, transformation(origin = {190, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pipe040.port_b, Nzl070.port_1) annotation(
    Line(points = {{200, 36}, {230, 36}}, color = {0, 127, 255}));
  connect(Comb036.ports[2], pipe040.port_a) annotation(
    Line(points = {{150, 36}, {180, 36}}, color = {0, 127, 255}));
  connect(ramp_MnFlt.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-78, 50}, {-70, 50}, {-70, 48}, {-62, 48}, {-62, 48}}, color = {0, 0, 127}));
  connect(trapezoid1.y, Constraint.u_targetValue) annotation(
    Line(points = {{170, -49}, {172, -49}, {172, -49}, {170, -49}, {170, -43}, {171, -43}, {171, -43}, {170, -43}}, color = {0, 0, 127}));
  connect(temperatureSensor1.T, Constraint.u_variable) annotation(
    Line(points = {{160, -10}, {170, -10}, {170, -19}}, color = {0, 0, 127}));
  connect(Vol030.ports[2], Valve030.port_1) annotation(
    Line(points = {{90, 36}, {110, 36}, {110, 36}, {110, 36}}, color = {0, 127, 255}));
  connect(pipe020.port_b, Vol030.ports[1]) annotation(
    Line(points = {{70, 36}, {86, 36}, {86, 36}, {90, 36}}, color = {0, 127, 255}));
  connect(Valve030.port_2, Comb036.ports[1]) annotation(
    Line(points = {{130, 36}, {148, 36}, {148, 36}, {150, 36}}, color = {0, 127, 255}));
  connect(Comb036.heatPort, temperatureSensor1.port) annotation(
    Line(points = {{140, 26}, {140, -10}}, color = {191, 0, 0}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-40, 60}, {-40, 70}, {270, 70}, {270, 36}}, color = {0, 127, 255}));
  connect(Nzl070.y_Fg, Fn.u1) annotation(
    Line(points = {{260, 20}, {290, 20}, {290, -82}, {290, -82}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, temperatureSensor1.port) annotation(
    Line(points = {{140, -30}, {140, -10}}, color = {191, 0, 0}));
  connect(VarBySolver.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{140, -59}, {140, -59}, {140, -51}, {140, -51}}, color = {0, 0, 127}));
  connect(Inlt010.y_FdRam, Fn.u2) annotation(
    Line(points = {{34, 12}, {50, 12}, {50, -90}, {282, -90}}, color = {0, 0, 127}));
  connect(pipe020.port_a, Inlt010.port_2) annotation(
    Line(points = {{50, 36}, {40, 36}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt010.port_1) annotation(
    Line(points = {{-20, 36}, {0, 36}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt010.u_V_infini) annotation(
    Line(points = {{-18, 24}, {-3.5, 24}, {-3.5, 12}, {6, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -160}, {300, 100}})),
    __OpenModelica_commandLineOptions = "");
end Pulsejet_temp;
