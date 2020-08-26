within PropulsionSystem.Examples.ThermoCycleSystems.Transient;

model HeatingConstVol_temp1
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, m_flow_start = 200)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 2 * 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p =  101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 1e-3, nPorts = 2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 1000 * 1000, falling = 0.5, period = 2, rising = 0.5, startTime = 10, width = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(boundary.ports[1], pipe1.port_a) annotation(
    Line(points = {{-40, 50}, {-22, 50}, {-22, 50}, {-20, 50}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, 50}, {80, 50}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{20, 50}, {40, 50}, {40, 50}, {40, 50}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume.ports[1]) annotation(
    Line(points = {{0, 50}, {18, 50}, {18, 50}, {20, 50}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{10, 20}, {10, 20}, {10, 40}, {10, 40}}, color = {191, 0, 0}));
  connect(trapezoid1.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{10, -9}, {10, -9}, {10, -1}, {10, -1}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
    
end HeatingConstVol_temp1;
