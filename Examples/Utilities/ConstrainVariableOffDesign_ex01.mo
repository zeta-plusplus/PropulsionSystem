within PropulsionSystem.Examples.Utilities;

model ConstrainVariableOffDesign_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 200 + 273.15, nPorts = 1, p = 3 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableOffDesign ConstraintDesPt1 annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const1(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ConstraintDesPt.u_variable, massFlowRate1.m_flow) annotation(
    Line(points = {{-40, 8}, {-40, 8}, {-40, 2}, {-40, 2}}, color = {0, 0, 127}));
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-40, 40}, {-40, 40}, {-40, 32}, {-40, 32}}, color = {0, 0, 127}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{60, -2}, {70, -2}, {70, 0}, {78, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(massFlowRate2.port_b, boundary1.ports[1]) annotation(
    Line(points = {{10, -10}, {40, -10}, {40, -10}, {40, -10}}, color = {0, 127, 255}));
  connect(const1.y, ConstraintDesPt1.u_targetValue) annotation(
    Line(points = {{0, 40}, {0, 40}, {0, 32}, {0, 32}}, color = {0, 0, 127}));
  connect(massFlowRate2.m_flow, ConstraintDesPt1.u_variable) annotation(
    Line(points = {{0, 2}, {0, 2}, {0, 8}, {0, 8}}, color = {0, 0, 127}));
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-80, -10}, {-50, -10}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, massFlowRate2.port_a) annotation(
    Line(points = {{-30, -10}, {-10, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end ConstrainVariableOffDesign_ex01;
