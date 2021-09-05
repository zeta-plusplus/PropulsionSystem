within PropulsionSystem.Examples.Elements.BasicElements;

model TrbCharTable02_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 5.0) annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_in(redeclare package Medium = engineAir, T = 1000, nPorts = 1, p = 5 * 101.325 * 1000, use_T_in = false, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb(redeclare package Medium = engineAir, printCmd = true, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-42, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 1e5, offset = 4.6e6, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-60, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = -1, offset = -10, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDes annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(powerSensor1.flange_a, NmechDes.flange_1) annotation(
    Line(points = {{-40, -20}, {-30, -20}, {-30, -20}, {-30, -20}}));
  connect(NmechDes.flange_2, Trb.flange_1) annotation(
    Line(points = {{-10, -20}, {0, -20}, {0, -20}, {0, -20}}));
  connect(powerSensor1.power, Constraint.u_variable) annotation(
    Line(points = {{-42, -31}, {-42, -31}, {-42, -39}, {-42, -39}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint.u_targetValue) annotation(
    Line(points = {{-49, -80}, {-43, -80}, {-43, -62}, {-43, -62}}, color = {0, 0, 127}));
  connect(boundary.m_flow_in, ramp1.y) annotation(
    Line(points = {{80, 48}, {94, 48}, {94, 40}, {100, 40}, {100, 40}}, color = {0, 0, 127}));
  connect(pressure1.port, boundary.ports[1]) annotation(
    Line(points = {{50, -4}, {50, 40}, {60, 40}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Trb.port_1) annotation(
    Line(points = {{0, 40}, {0, 40}, {0, -4}, {0, -4}}, color = {0, 127, 255}));
  connect(pressure2.port, massFlowRate1.port_a) annotation(
    Line(points = {{-40, 40}, {-20, 40}, {-20, 40}, {-20, 40}}, color = {0, 127, 255}));
  connect(boundary_in.ports[1], pressure2.port) annotation(
    Line(points = {{-60, 40}, {-40, 40}}, color = {0, 127, 255}));
  connect(Trb.port_2, pressure1.port) annotation(
    Line(points = {{40, -4}, {50, -4}, {50, -4}, {50, -4}}, color = {0, 127, 255}));
//-----
//-----
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");
end TrbCharTable02_ex02;
