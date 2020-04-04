within PropulsionSystem.Examples.Elements.BasicElements;

model Cmp_and_Trb_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 5, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {16, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {114, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2.0 * Modelica.Constants.pi / 60.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{51, -40}, {60, -40}, {60, 9}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], Trb.port_1) annotation(
    Line(points = {{26, 50}, {26, 50.5}, {40, 50.5}, {40, 36}}, color = {0, 127, 255}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{-10, 20}, {40, 20}}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{80, 36}, {81, 36}, {81, 46}, {104, 46}}, color = {0, 127, 255}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-99, -70}, {-80, -70}, {-80, 9}}, color = {0, 0, 127}));
  connect(ramp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-99, -30}, {-88, -30}, {-88, 5}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-110, 36}, {-100, 36}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-60, 20}, {-10, 20}}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-60, 36}, {-46, 36}, {-46, 50}, {-40, 50}}, color = {0, 127, 255}));
  connect(constrainVariable1.u_variable, speedSensor1.w) annotation(
    Line(points = {{-10, -28}, {-10, -28}, {-10, 0}, {-10, 0}}, color = {0, 0, 127}));
  connect(constrainVariable1.u_targetValue, ramp_omega.y) annotation(
    Line(points = {{-10, -52}, {-10, -52}, {-10, -58}, {-10, -58}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
  Diagram(graphics = {Text(origin = {-36, -7}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {44, -1}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated"), Line(origin = {-17.8154, -7.1925}, points = {{-4, 1}, {34, 7}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-20, -15}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {84, -1}}, textString = "Cmp's op. conditions determines Trb's op. conditions.")}, coordinateSystem(extent = {{-140, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");

end Cmp_and_Trb_ex01;
