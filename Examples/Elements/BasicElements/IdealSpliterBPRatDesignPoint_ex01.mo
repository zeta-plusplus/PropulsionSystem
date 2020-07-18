within PropulsionSystem.Examples.Elements.BasicElements;

model IdealSpliterBPRatDesignPoint_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-46, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.IdealSpliterBPRatDesignPoint SpltDesPt(redeclare package Medium = engineAir, BPRdes_paramInput = 9) annotation(
    Placement(visible = true, transformation(origin = {14, -22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed01 Nzl(redeclare package Medium = engineAir, use_u_kAmechTh = true) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed01 Nzl1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 2, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 10.0) annotation(
    Placement(visible = true, transformation(origin = {-10, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = -0.2, offset = 1.0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 2 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(MassFlowDes.port_2, SpltDesPt.port_1) annotation(
    Line(points = {{0, -22}, {8, -22}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowDes.port_1) annotation(
    Line(points = {{-40, -22}, {-20, -22}}, color = {0, 127, 255}));
  connect(const.y, boundary.p_in) annotation(
    Line(points = {{-78, -10}, {-70, -10}, {-70, -14}, {-62, -14}, {-62, -14}}, color = {0, 0, 127}));
  connect(ramp2.y, Nzl.u_kAmechTh) annotation(
    Line(points = {{50, 31}, {50, 36}, {56, 36}, {56, 42}}, color = {0, 0, 127}));
  connect(SpltDesPt.port_2, Nzl1.port_1) annotation(
    Line(points = {{20, -22}, {40, -22}}, color = {0, 127, 255}));
  connect(SpltDesPt.port_3, Nzl.port_1) annotation(
    Line(points = {{20, -18}, {32, -18}, {32, 58}, {40, 58}}, color = {0, 127, 255}));
  connect(Nzl1.port_2, boundary1.ports[2]) annotation(
    Line(points = {{60, -22}, {80, -22}}, color = {0, 127, 255}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{60, 58}, {70, 58}, {70, -22}, {80, -22}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end IdealSpliterBPRatDesignPoint_ex01;
