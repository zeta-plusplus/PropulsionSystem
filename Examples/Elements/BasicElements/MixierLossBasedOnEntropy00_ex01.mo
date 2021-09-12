within PropulsionSystem.Examples.Elements.BasicElements;

model MixierLossBasedOnEntropy00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, p = 10 * 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 800, m_flow = 100, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = engineAir, T = 500, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 0, offset = 200, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MixierLossBasedOnEntropy00 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint(tgtValue_paramInput = 5 * 101.325 * 1000, use_u_targetVal = false)  annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint1(tgtValue_paramInput = 3 * 101.325 * 1000, use_u_targetVal = false)  annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {42, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(pressure3.port, boundary.ports[1]) annotation(
    Line(points = {{42, -30}, {60, -30}, {60, -30}, {60, -30}}, color = {0, 127, 255}));
  connect(Mixer.port_3, pressure3.port) annotation(
    Line(points = {{30, -30}, {42, -30}, {42, -30}, {42, -30}}, color = {0, 127, 255}));
  connect(boundary.p_in, VarBySolver.y_independent) annotation(
    Line(points = {{82, -22}, {94, -22}, {94, -30}, {98, -30}, {98, -30}}, color = {0, 0, 127}));
  connect(pressure2.p, Constraint1.u_variable) annotation(
    Line(points = {{-8, 40}, {0, 40}, {0, 40}, {0, 40}}, color = {0, 0, 127}));
  connect(pressure1.p, Constraint.u_variable) annotation(
    Line(points = {{-8, -40}, {0, -40}, {0, -48}, {0, -48}}, color = {0, 0, 127}));
  connect(pressure1.port, Mixer.port_1) annotation(
    Line(points = {{-20, -30}, {10, -30}, {10, -30}, {10, -30}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], pressure1.port) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -30}, {-20, -30}}, color = {0, 127, 255}));
  connect(pressure2.port, Mixer.port_2) annotation(
    Line(points = {{-20, 30}, {-4, 30}, {-4, -26}, {10, -26}, {10, -26}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], pressure2.port) annotation(
    Line(points = {{-40, 30}, {-20, 30}, {-20, 30}, {-20, 30}}, color = {0, 127, 255}));
  connect(ramp_m_flow_fuel.y, boundary2.m_flow_in) annotation(
    Line(points = {{-79, 50}, {-77, 50}, {-77, 38}, {-61, 38}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "plt", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");
end MixierLossBasedOnEntropy00_ex01;
