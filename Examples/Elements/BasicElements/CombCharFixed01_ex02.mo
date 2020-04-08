within PropulsionSystem.Examples.Elements.BasicElements;

model CombCharFixed01_ex02
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir= PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 10 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 800, m_flow = 100, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_hfuel(duration = 10, height = 0, offset = 600 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed01 Comb(redeclare package Medium = engineAir, use_u_effComb = false)  annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TcombOut(duration = 10, height = 200, offset = 1200, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_hfuel.y, Comb.u_h_fuel) annotation(
    Line(points = {{-28, 50}, {-16, 50}, {-16, -20}, {-16, -20}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{-38, 20}, {-18, 20}, {-18, -20}, {-18, -20}}, color = {0, 0, 127}));
  connect(Constraint.u_targetValue, ramp_TcombOut.y) annotation(
    Line(points = {{20, 22}, {20, 22}, {20, 30}, {20, 30}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{20, -2}, {20, -20}, {18, -20}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{0, -30}, {10, -30}}, color = {0, 127, 255}));
  connect(temperature.port, boundary.ports[1]) annotation(
    Line(points = {{10, -30}, {40, -30}}, color = {0, 127, 255}));
  connect(temperature1.port, Comb.port_1) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], temperature1.port) annotation(
    Line(points = {{-60, -30}, {-40, -30}, {-40, -30}, {-40, -30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end CombCharFixed01_ex02;
