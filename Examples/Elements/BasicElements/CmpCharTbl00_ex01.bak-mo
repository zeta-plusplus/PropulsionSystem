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
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTbl00 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {42, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1, use_T_in = false, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true)  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 100 * 1000, offset = 3000 * 1000, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 100, offset = 9000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{112, 20}, {120, 20}, {120, 20}, {120, 20}}, color = {0, 0, 127}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{82, 20}, {89, 20}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, speed1.flange) annotation(
    Line(points = {{52, 20}, {60, 20}}));
  connect(Constraint.u_variable, powerSensor1.power) annotation(
    Line(points = {{50, 1}, {50, 9}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint.u_targetValue) annotation(
    Line(points = {{50, -29}, {50, -21}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-80, 50}, {-64, 50}, {-64, 36}, {-20, 36}}, color = {0, 127, 255}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{80, 58}, {90, 58}, {90, 60}, {98, 60}, {98, 60}}, color = {0, 0, 127}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 36}, {26, 36}, {26, 50}, {60, 50}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{20, 20}, {32, 20}}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTbl00_ex01;
