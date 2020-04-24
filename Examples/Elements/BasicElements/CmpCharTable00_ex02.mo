within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharTable00_ex02
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
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_PRaud = true, use_u_a_WcAud = true, use_u_a_effAud = true, use_u_s_PRaud = true, use_u_s_WcAud = true, use_u_s_effAud = true) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {102, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = 0, offset = 200 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {160, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {190, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_s_Wc(duration = 10, height = 0.1, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_s_PR(duration = 10, height = 0.9, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30,-30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_s_eff(duration = 10, height = 0.95, offset = 1, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_a_Wc(duration = 10, height = 0.1, offset = 0, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_a_PR(duration = 10, height = 1, offset = 0, startTime = 90) annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_a_eff(duration = 10, height = -0.05, offset = 0, startTime = 110) annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ramp_a_eff.y, Cmp.u_a_effAud) annotation(
    Line(points = {{70, -48}, {70, -48}, {70, -6}, {20, -6}, {20, 2}, {20, 2}}, color = {0, 0, 127}));
  connect(ramp_a_PR.y, Cmp.u_a_PRaud) annotation(
    Line(points = {{30, -48}, {30, -48}, {30, -14}, {4, -14}, {4, 2}, {4, 2}}, color = {0, 0, 127}));
  connect(ramp_a_Wc.y, Cmp.u_a_WcAud) annotation(
    Line(points = {{-10, -48}, {-10, -48}, {-10, -10}, {-12, -10}, {-12, 2}, {-12, 2}}, color = {0, 0, 127}));
  connect(ramp_s_Wc.y, Cmp.u_s_WcAud) annotation(
    Line(points = {{-70, -19}, {-70, -6}, {-20, -6}, {-20, 2}}, color = {0, 0, 127}));
  connect(ramp_s_PR.y, Cmp.u_s_PRaud) annotation(
    Line(points = {{-30, -19}, {-30, -14}, {-4, -14}, {-4, 2}}, color = {0, 0, 127}));
  connect(ramp_s_eff.y, Cmp.u_s_effAud) annotation(
    Line(points = {{10, -19}, {10, -8.5}, {12, -8.5}, {12, 2}}, color = {0, 0, 127}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{80, 58}, {90, 58}, {90, 60}, {98, 60}, {98, 60}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, powerSensor1.power) annotation(
    Line(points = {{110, 1}, {110, 9}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{20, 20}, {92, 20}}));
  connect(powerSensor1.flange_a, speed1.flange) annotation(
    Line(points = {{112, 20}, {120, 20}}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{142, 20}, {149, 20}}, color = {0, 0, 127}));
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{172, 20}, {180, 20}, {180, 20}, {180, 20}}, color = {0, 0, 127}));
  connect(ramp_pwr.y, Constraint.u_targetValue) annotation(
    Line(points = {{110, -29}, {110, -21}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-80, 50}, {-64, 50}, {-64, 36}, {-20, 36}}, color = {0, 127, 255}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 36}, {26, 36}, {26, 50}, {60, 50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 130, Tolerance = 1e-06, Interval = 0.26),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTable00_ex02;
