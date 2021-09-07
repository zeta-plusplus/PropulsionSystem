within PropulsionSystem.Examples.Elements.BasicElements;

model NzlDefAeByFlowCharFixed02_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 500, nPorts = 1, p = 2 * 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 1.0 * 101.325 * 1000, offset = 1.5 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_amb(duration = 10, height = 0.0, offset = 1.0 * 101.325 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_kAmech(duration = 10, height = -0.1, offset = 1.0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {26, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl(redeclare package Medium = engineAir, use_u_kAmechTh = true)  annotation(
    Placement(visible = true, transformation(origin = {20, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 10)  annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(MassFlowDes.port_2, Nzl.port_1) annotation(
    Line(points = {{-10, 10}, {10, 10}, {10, 10}, {10, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowDes.port_1) annotation(
    Line(points = {{-40, 10}, {-30, 10}, {-30, 10}, {-30, 10}}, color = {0, 127, 255}));
  connect(ramp_kAmech.y, Nzl.u_kAmechTh) annotation(
    Line(points = {{26, -18}, {26, -18}, {26, -8}, {26, -8}}, color = {0, 0, 127}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{30, 10}, {30, 10}, {30, 20}, {30, 20}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-79, 20}, {-73, 20}, {-73, 18}, {-62, 18}}, color = {0, 0, 127}));
  connect(boundary1.p_in, ramp_p_amb.y) annotation(
    Line(points = {{38, 42}, {38, 42}, {38, 50}, {50, 50}, {50, 60}, {50, 60}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.18),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}})),
  __OpenModelica_commandLineOptions = "");
end NzlDefAeByFlowCharFixed02_ex01;
