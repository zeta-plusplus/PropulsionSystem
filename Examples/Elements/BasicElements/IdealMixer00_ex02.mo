within PropulsionSystem.Examples.Elements.BasicElements;

model IdealMixer00_ex02
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 10 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 800, m_flow = 100, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = engineAir, T = 288.15, X = {1, 0, 0}, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.IdealMixer00 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFractions massFraction(redeclare package Medium = engineAir, substanceName = "Methane")  annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_X_methane(duration = 10, height = 0.02, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = { 40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(VarBySolver.y_independent, boundary2.m_flow_in) annotation(
    Line(points = {{-78, 20}, {-68, 20}, {-68, 18}, {-60, 18}, {-60, 18}}, color = {0, 0, 127}));
  connect(Constraint.u_targetValue, ramp_X_methane.y) annotation(
    Line(points = {{40, 12}, {40, 12}, {40, 20}, {40, 20}}, color = {0, 0, 127}));
  connect(massFraction.Xi, Constraint.u_variable) annotation(
    Line(points = {{32, -20}, {40, -20}, {40, -12}}, color = {0, 0, 127}));
  connect(massFraction.port, boundary.ports[1]) annotation(
    Line(points = {{20, -30}, {60, -30}, {60, -30}, {60, -30}}, color = {0, 127, 255}));
  connect(Mixer.port_3, massFraction.port) annotation(
    Line(points = {{0, -30}, {20, -30}, {20, -30}, {20, -30}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], Mixer.port_2) annotation(
    Line(points = {{-40, 10}, {-26, 10}, {-26, -26}, {-20, -26}, {-20, -26}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], Mixer.port_1) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -30}, {-20, -30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end IdealMixer00_ex02;
