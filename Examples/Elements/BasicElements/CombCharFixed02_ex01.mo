within PropulsionSystem.Examples.Elements.BasicElements;

model CombCharFixed02_ex01
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
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 100, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {22, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 1, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = engineAir, X = {1, 0, 0},nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
equation
  connect(ramp_Tfuel.y, boundary2.T_in) annotation(
    Line(points = {{-68, 20}, {-58, 20}, {-58, 34}, {-52, 34}, {-52, 34}}, color = {0, 0, 127}));
  connect(ramp_m_flow_fuel.y, boundary2.m_flow_in) annotation(
    Line(points = {{-68, 60}, {-62, 60}, {-62, 38}, {-50, 38}, {-50, 38}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], Comb.port_fuel) annotation(
    Line(points = {{-30, 30}, {-18, 30}, {-18, -22}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], temperature1.port) annotation(
    Line(points = {{-60, -30}, {-40, -30}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{0, -30}, {22, -30}, {22, -30}, {22, -30}}, color = {0, 127, 255}));
  connect(temperature1.port, Comb.port_1) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(temperature.port, boundary.ports[1]) annotation(
    Line(points = {{22, -30}, {40, -30}, {40, -30}, {40, -30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end CombCharFixed02_ex01;
