within PropulsionSystem.Examples.Elements.BasicElements;

model IdealMixer00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 10 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 800, m_flow = 100, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = engineAir, T = 288.15, X = {1, 0, 0}, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 1, offset = 1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealMixer00 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
equation
  connect(boundary2.ports[1], Mixer.port_2) annotation(
    Line(points = {{-40, 10}, {-26, 10}, {-26, -26}, {-20, -26}, {-20, -26}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], Mixer.port_1) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(Mixer.port_3, boundary.ports[1]) annotation(
    Line(points = {{0, -30}, {40, -30}, {40, -30}, {40, -30}}, color = {0, 127, 255}));
  connect(ramp_m_flow_fuel.y, boundary2.m_flow_in) annotation(
    Line(points = {{-78, 30}, {-76, 30}, {-76, 18}, {-60, 18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end IdealMixer00_ex01;
