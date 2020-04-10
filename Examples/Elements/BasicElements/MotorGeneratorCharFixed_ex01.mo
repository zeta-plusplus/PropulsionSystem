within PropulsionSystem.Examples.Elements.BasicElements;

model MotorGeneratorCharFixed_ex01
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
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-160, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 0, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {62, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {86, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2.0 * Modelica.Constants.pi / 60.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene(use_u_eff = true, use_u_pwr = true)  annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff_MotorGene(duration = 10, height = 0.1, offset = 0.85, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-12, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_pwr_MotGene(duration = 10, height = 100 * 1000, offset = 1000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(MotGene.u_pwr, ramp_pwr_MotGene.y) annotation(
    Line(points = {{22, -60}, {39, -60}}, color = {0, 0, 127}));
  connect(ramp_eff_MotorGene.y, MotGene.u_eff) annotation(
    Line(points = {{-12, -99}, {-12, -74}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, MotGene.flange_1) annotation(
    Line(points = {{-70, 20}, {-46, 20}, {-46, -60}, {-20, -60}}));
  connect(constrainVariable1.u_targetValue, ramp_omega.y) annotation(
    Line(points = {{-70, -32}, {-70, -58}}, color = {0, 0, 127}));
  connect(constrainVariable1.u_variable, speedSensor1.w) annotation(
    Line(points = {{-70, -8}, {-70, 0}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-100, 20}, {-70, 20}}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{-70, 20}, {80, 20}}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{120, 36}, {127, 36}, {127, 50}, {140, 50}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], Trb.port_1) annotation(
    Line(points = {{72, 50}, {72, 50.5}, {80, 50.5}, {80, 36}}, color = {0, 127, 255}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{97, -40}, {100, -40}, {100, 8}}, color = {0, 0, 127}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-139, -70}, {-120, -70}, {-120, 9}}, color = {0, 0, 127}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-100, 36}, {-46, 36}, {-46, 50}, {-40, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-150, 36}, {-140, 36}}, color = {0, 127, 255}));
  connect(ramp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-139, -30}, {-128, -30}, {-128, 5}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {-114, -13}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {96, -5}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated")}, coordinateSystem(extent = {{-180, -140}, {180, 100}})),
    __OpenModelica_commandLineOptions = "");
end MotorGeneratorCharFixed_ex01;
