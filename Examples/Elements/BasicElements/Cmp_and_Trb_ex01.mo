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
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 5, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {62, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.SetConstraint setConstraint1 annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 5, offset = 3000 * 2.0 * Modelica.Constants.pi / 60.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ramp_omega.y, setConstraint1.u_targetValue) annotation(
    Line(points = {{-10, -59}, {-10, -59}, {-10, -53}, {-10, -53}}, color = {0, 0, 127}));
  connect(speedSensor1.w, setConstraint1.u_variable) annotation(
    Line(points = {{-10, -2}, {-10, -29}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-80, 50}, {-74, 50}, {-74, 28}, {-70, 28}}, color = {0, 127, 255}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-50, 28}, {-46, 28}, {-46, 50}, {-40, 50}}, color = {0, 127, 255}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{-10, 20}, {52, 20}, {52, 20}, {52, 20}}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-50, 20}, {-10, 20}, {-10, 20}, {-10, 20}}));
  connect(ramp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-69, -10}, {-65, -10}, {-65, 12}, {-65, 12}}, color = {0, 0, 127}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-69, -40}, {-61, -40}, {-61, 14}, {-61, 14}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], Trb.port_1) annotation(
    Line(points = {{40, 50}, {46, 50}, {46, 28}, {52, 28}, {52, 28}}, color = {0, 127, 255}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{72, 28}, {76, 28}, {76, 50}, {80, 50}, {80, 50}}, color = {0, 127, 255}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{51, -40}, {62, -40}, {62, 14}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
  Diagram(graphics = {Text(origin = {-36, -7}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {48, 1}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated"), Line(origin = {-17.8154, -7.1925}, points = {{-4, 1}, {34, 7}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-20, -15}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {84, -1}}, textString = "Cmp's op. conditions determines Trb's op. conditions.")}, coordinateSystem(extent = {{-120, -100}, {120, 100}}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "");

end Cmp_and_Trb_ex01;
