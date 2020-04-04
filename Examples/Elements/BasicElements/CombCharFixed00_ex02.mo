within PropulsionSystem.Examples.Elements.BasicElements;

model CombCharFixed00_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -100, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_effComb(duration = 10, height = 0.05, offset = 0.90, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed00 Comb(redeclare package Medium = engineAir, use_u_effComb = true, use_u_m_flow_fuel = true) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -7}, {10, 8}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = { 40, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_TcombOut(duration = 10, height = 1600, offset = 1400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_TcombOut.y, Constraint.u_targetValue) annotation(
    Line(points = {{40, 60}, {40, 60}, {40, 42}, {40, 42}}, color = {0, 0, 127}));
  connect(ramp_effComb.y, Comb.u_effComb) annotation(
    Line(points = {{0, 29}, {0, 15}, {-10, 15}, {-10, -2}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{-30, 29}, {-30, 29}, {-30, 15}, {-18, 15}, {-18, -1}, {-18, -1}}, color = {0, 0, 127}));
  connect(temperature.T, Constraint.u_variable) annotation(
    Line(points = {{29, 0}, {39, 0}, {39, 18}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_1) annotation(
    Line(points = {{-40, -10}, {-20, -10}}, color = {0, 127, 255}));
  connect(temperature.port, boundary1.ports[1]) annotation(
    Line(points = {{22, -10}, {60, -10}, {60, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{0, -10}, {22, -10}, {22, -10}, {22, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end CombCharFixed00_ex02;
