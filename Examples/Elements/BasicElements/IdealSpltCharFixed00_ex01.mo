within PropulsionSystem.Examples.Elements.BasicElements;

model IdealSpltCharFixed00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 800, nPorts = 2, p =  101.325 * 1000, use_p_in = false) annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_rate(duration = 10, height = 0, offset = 110, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 800, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(redeclare package Medium = engineAir, use_u_BPR = true) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_BPR(duration = 10, height = 5, offset = 10, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_BPR.y, Splt.u_BPR) annotation(
    Line(points = {{10, -2}, {10, -2}, {10, -22}, {10, -22}}, color = {0, 0, 127}));
  connect(pressure1.port, Splt.port_1) annotation(
    Line(points = {{-50, -30}, {0, -30}, {0, -30}, {0, -30}}, color = {0, 127, 255}));
  connect(Splt.port_3, Nzl.port_1) annotation(
    Line(points = {{20, -26}, {44, -26}, {44, 18}, {60, 18}, {60, 18}}, color = {0, 127, 255}));
  connect(Splt.port_2, Nzl1.port_1) annotation(
    Line(points = {{20, -30}, {52, -30}, {52, -22}, {60, -22}, {60, -22}}, color = {0, 127, 255}));
  connect(pressure1.p, Constraint.u_variable) annotation(
    Line(points = {{-38, -20}, {-30, -20}, {-30, -2}, {-30, -2}}, color = {0, 0, 127}));
  connect(Nzl1.port_2, boundary1.ports[2]) annotation(
    Line(points = {{80, -22}, {100, -22}, {100, 40}, {100, 40}}, color = {0, 127, 255}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{80, 18}, {100, 18}, {100, 40}, {100, 40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pressure1.port) annotation(
    Line(points = {{-60, -30}, {-50, -30}}, color = {0, 127, 255}));
  connect(ramp_m_flow_rate.y, boundary.m_flow_in) annotation(
    Line(points = {{-98, -10}, {-88, -10}, {-88, -22}, {-80, -22}, {-80, -22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(coordinateSystem(extent = {{-140, -60}, {140, 100}})),
    __OpenModelica_commandLineOptions = "");
end IdealSpltCharFixed00_ex01;
