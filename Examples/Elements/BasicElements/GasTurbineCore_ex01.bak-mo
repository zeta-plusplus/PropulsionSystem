within PropulsionSystem.Examples.Elements.BasicElements;

model GasTurbineCore_ex01
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
    Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-110, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 0, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {110, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.SetConstraint setConstraint1 annotation(
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2.0 * Modelica.Constants.pi / 60.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetConstraint setConstraint2 annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.SetSolverIndependent setSolverIndependent1 annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{61, -100}, {70, -100}, {70, -26}}, color = {0, 0, 127}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{80, -12}, {100, -12}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-100, -12}, {-70, -12}}, color = {0, 127, 255}));
  connect(ramp_omega.y, setConstraint1.u_targetValue) annotation(
    Line(points = {{0, -99}, {0, -99}, {0, -93}, {0, -93}}, color = {0, 0, 127}));
  connect(speedSensor1.w, setConstraint1.u_variable) annotation(
    Line(points = {{0, -41}, {0, -68}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-50, -20}, {0, -20}}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{0, -20}, {60, -20}}));
  connect(setSolverIndependent1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-29, 50}, {-20, 50}, {-20, 40}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-20, 20}, {-20, 10}}, color = {191, 0, 0}));
  connect(Cmp.port_2, HeatInjector.port_1) annotation(
    Line(points = {{-50, -12}, {-44, -12}, {-44, 0}, {-30, 0}}, color = {0, 127, 255}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{-10, 0}, {10, 0}, {10, -12}, {20, -12}}, color = {0, 127, 255}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{20, -12}, {60, -12}}, color = {0, 127, 255}));
  connect(temperature.T, setConstraint2.u_variable) annotation(
    Line(points = {{27, -2}, {30, -2}, {30, 19}}, color = {0, 0, 127}));
  connect(ramp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-69, -70}, {-64, -70}, {-64, -28}}, color = {0, 0, 127}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-69, -100}, {-60, -100}, {-60, -26}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, setConstraint2.u_targetValue) annotation(
    Line(points = {{22, 60}, {30, 60}, {30, 42}, {30, 42}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {-36, -47}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {56, -39}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated"), Line(origin = {-17.8154, -47.1925}, points = {{-4, 1}, {44, 7}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-12, -55}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {84, -1}}, textString = "Cmp's op. conditions determines Trb's op. conditions.")}, coordinateSystem(extent = {{-120, -120}, {120, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");

end GasTurbineCore_ex01;
