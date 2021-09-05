within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharTable02_ex04
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {42, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {100, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir, printCmd = false, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, switch_calcOnlyDes = true, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = 0, offset = -10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0.1e6, offset = 3.37e6, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, Constraint.u_targetValue) annotation(
    Line(points = {{60, -50}, {50, -50}, {50, -32}, {50, -32}}, color = {0, 0, 127}));
  connect(powerSensor1.power, Constraint.u_variable) annotation(
    Line(points = {{50, 0}, {50, 0}, {50, -8}, {50, -8}}, color = {0, 0, 127}));
  connect(boundary1.m_flow_in, ramp_m_flow.y) annotation(
    Line(points = {{50, 58}, {58, 58}, {58, 60}, {70, 60}, {70, 60}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-80, 40}, {-40, 40}, {-40, 26}, {-40, 26}}, color = {0, 127, 255}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 26}, {0, 50}, {30, 50}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, speed1.flange) annotation(
    Line(points = {{52, 10}, {60, 10}}));
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{0, 10}, {32, 10}, {32, 10}, {32, 10}}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{82, 10}, {89, 10}}, color = {0, 0, 127}));
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{112, 10}, {120, 10}, {120, 10}, {120, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTable02_ex04;
