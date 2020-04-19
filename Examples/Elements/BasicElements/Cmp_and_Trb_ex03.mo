within PropulsionSystem.Examples.Elements.BasicElements;

model Cmp_and_Trb_ex03
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
    Placement(visible = true, transformation(origin = {-120, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1, use_T_in = true, use_m_flow_in = false) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 0, offset = 5, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {170, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2.0 * Modelica.Constants.pi / 60.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CmpCharTbl00 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver1 annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-110, 16}, {-100, 16}, {-100, 16}, {-100, 16}}, color = {0, 127, 255}));
  connect(boundary1.T_in, VarBySolver1.y_independent) annotation(
    Line(points = {{-18, 34}, {-12, 34}, {-12, 30}, {-1, 30}}, color = {0, 0, 127}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-60, 16}, {-52, 16}, {-52, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], Trb.port_1) annotation(
    Line(points = {{90, 30}, {90, 30.5}, {100, 30.5}, {100, 16}}, color = {0, 127, 255}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{140, 16}, {141, 16}, {141, 30}, {160, 30}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-60, 0}, {10, 0}}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{10, 0}, {100, 0}}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{101, -90}, {120, -90}, {120, -11}}, color = {0, 0, 127}));
  connect(ramp_PR.y, Trb.u_PR) annotation(
    Line(points = {{101, -60}, {111, -60}, {111, -8}, {111, -8}}, color = {0, 0, 127}));
  connect(constrainVariable1.u_variable, speedSensor1.w) annotation(
    Line(points = {{10, -48}, {10, -48}, {10, -20}, {10, -20}}, color = {0, 0, 127}));
  connect(ramp_omega.y, constrainVariable1.u_targetValue) annotation(
    Line(points = {{10, -79}, {10, -79}, {10, -73}, {10, -73}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {106, -25}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {-58, -27}, fillPattern = FillPattern.Solid, extent = {{-20, 5}, {18, -3}}, textString = "PR is calculated"), Line(origin = {39.2001, -31.2623}, points = {{50, 7}, {-100, 1}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {44, -39}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {84, -1}}, textString = "Trb's op. conditions determines Cmp's op. conditions.")}, coordinateSystem(extent = {{-140, -100}, {180, 100}})),
    __OpenModelica_commandLineOptions = "");
end Cmp_and_Trb_ex03;
