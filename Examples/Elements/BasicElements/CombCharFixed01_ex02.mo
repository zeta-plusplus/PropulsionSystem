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
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 800, m_flow = 100, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_hfuel(duration = 10, height = 0, offset = 600 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed01 Comb(redeclare package Medium = engineAir, use_u_effComb = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TcombOut(duration = 10, height = 200, offset = 1200, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effComb(duration = 10, height = 0.04, offset = 0.95, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_effComb.y, Comb.u_effComb) annotation(
    Line(points = {{-28, 60}, {-4, 60}, {-4, -41}}, color = {0, 0, 127}));
  connect(temperature1.port, Comb.port_1) annotation(
    Line(points = {{-40, -50}, {-20, -50}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{0, -50}, {10, -50}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{-39, 0}, {-18, 0}, {-18, -41}}, color = {0, 0, 127}));
  connect(ramp_hfuel.y, Comb.u_h_fuel) annotation(
    Line(points = {{-29, 30}, {-16, 30}, {-16, -41}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], temperature1.port) annotation(
    Line(points = {{-60, -50}, {-40, -50}, {-40, -50}, {-40, -50}}, color = {0, 127, 255}));
  connect(Constraint.u_targetValue, ramp_TcombOut.y) annotation(
    Line(points = {{20, 2}, {20, 2}, {20, 10}, {20, 10}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{20, -22}, {20, -40}, {18, -40}}, color = {0, 0, 127}));
  connect(temperature.port, boundary.ports[1]) annotation(
    Line(points = {{10, -50}, {40, -50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end CombCharFixed01_ex02;
