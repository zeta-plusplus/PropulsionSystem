within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharTbl00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 9000 * 2 * Modelica.Constants.pi / 60) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTbl00 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {22, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1, use_T_in = false, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true)  annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0 * 1000, offset = 3000 * 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariableAtInitial ConstraintAtInit(tgtValue_paramInput = 10, use_u_targetVal = false)  annotation(
    Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(Cmp.port_1, massFlowRate1.port_b) annotation(
    Line(points = {{-40, -4}, {-46, -4}, {-46, 10}, {-50, 10}, {-50, 10}}, color = {0, 127, 255}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, -4}, {6, -4}, {6, 10}, {40, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-80, 10}, {-70, 10}, {-70, 10}, {-70, 10}}, color = {0, 127, 255}));
  connect(massFlowRate1.m_flow, ConstraintAtInit.u_variable) annotation(
    Line(points = {{-60, 21}, {-60, 21}, {-60, 27}, {-60, 27}}, color = {0, 0, 127}));
  connect(ramp1.y, Constraint.u_targetValue) annotation(
    Line(points = {{30, -69}, {30, -63}}, color = {0, 0, 127}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{60, 18}, {70, 18}, {70, 20}, {78, 20}, {78, 20}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, constantSpeed1.flange) annotation(
    Line(points = {{32, -20}, {60, -20}}));
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{0, -20}, {12, -20}}));
  connect(Constraint.u_variable, powerSensor1.power) annotation(
    Line(points = {{30, -39}, {30, -39}, {30, -31}, {30, -31}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTbl00_ex01;
