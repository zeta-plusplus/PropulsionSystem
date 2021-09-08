within PropulsionSystem.Examples.Elements.BasicElements;

model IdealSpliterBPRatDesignPoint01_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-46, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 2, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = -0.2, offset = 1.0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 2 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl01(redeclare package Medium = engineAir, use_u_kAmechTh = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl02(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {50, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.IdealSpliterBPRatDesignPoint01 SpltDesPt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SpltDesPt.port_2, Nzl02.port_1) annotation(
    Line(points = {{20, -10}, {40, -10}, {40, -10}, {40, -10}}, color = {0, 127, 255}));
  connect(SpltDesPt.port_3, Nzl01.port_1) annotation(
    Line(points = {{20, -2}, {28, -2}, {28, 58}, {40, 58}, {40, 58}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, SpltDesPt.port_1) annotation(
    Line(points = {{-10, -10}, {0, -10}, {0, -10}, {0, -10}}, color = {0, 127, 255}));
  connect(ramp2.y, Nzl01.u_kAmechTh) annotation(
    Line(points = {{11, 30}, {56, 30}, {56, 41}}, color = {0, 0, 127}));
  connect(const.y, boundary.p_in) annotation(
    Line(points = {{-79, 2}, {-71, 2}, {-71, -2}, {-63, -2}, {-63, -2}}, color = {0, 0, 127}));
  connect(boundary.ports[1], MassFlowDes.port_1) annotation(
    Line(points = {{-40, -10}, {-30, -10}, {-30, -10}, {-30, -10}}, color = {0, 127, 255}));
  connect(Nzl02.port_2, boundary1.ports[1]) annotation(
    Line(points = {{60, -10}, {80, -10}, {80, -10}, {80, -10}}, color = {0, 127, 255}));
  connect(Nzl01.port_2, boundary1.ports[2]) annotation(
    Line(points = {{60, 58}, {74, 58}, {74, -10}, {80, -10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");
end IdealSpliterBPRatDesignPoint01_ex01;
