within PropulsionSystem.Examples.Engines.DesignPoint;

model GasGenerator_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 0, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 5, height = 0, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2.0 * Modelica.Constants.pi / 60.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable2 annotation(
    Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver variableBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-60, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed00 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-19.6995, 29.7596}, extent = {{-20.3005, -14.2104}, {20.3005, 16.2404}}, rotation = 0)));
equation
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{0, 30}, {30, 30}, {30, 30}, {30, 30}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-60, -4}, {-54, -4}, {-54, 30}, {-40, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(variableBySolver1.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{-48, 90}, {-36, 90}, {-36, 48}, {-36, 48}}, color = {0, 0, 127}));
  connect(constrainVariable2.u_targetValue, ramp_omega.y) annotation(
    Line(points = {{-20, -92}, {-20, -92}, {-20, -98}, {-20, -98}}, color = {0, 0, 127}));
  connect(speedSensor1.w, constrainVariable2.u_variable) annotation(
    Line(points = {{-20, -40}, {-20, -68}}, color = {0, 0, 127}));
  connect(temperature.T, constrainVariable1.u_variable) annotation(
    Line(points = {{38, 40}, {50, 40}, {50, 48}, {50, 48}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, constrainVariable1.u_targetValue) annotation(
    Line(points = {{50, 80}, {50, 80}, {50, 72}, {50, 72}}, color = {0, 0, 127}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{30, 30}, {52, 30}, {52, -4}, {60, -4}}, color = {0, 127, 255}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-89, -100}, {-89, -100.5}, {-80, -100.5}, {-80, -31}}, color = {0, 0, 127}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{41, -100}, {80, -100}, {80, -31}}, color = {0, 0, 127}));
  connect(ramp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-99, -70}, {-99, -71.5}, {-88, -71.5}, {-88, -35}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{-20, -20}, {60, -20}}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-60, -20}, {-20, -20}}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-120, 0}, {-100, 0}, {-100, -4}}, color = {0, 127, 255}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{100, -4}, {110, -4}, {110, 0}, {120, 0}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {-54, -53}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {78, -45}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated"), Line(origin = {-30.22, -50.15}, points = {{-4, 1}, {78, 7}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {-32, -59}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {84, -1}}, textString = "Cmp's op. conditions determines Trb's op. conditions."), Text(origin = {32, 105}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {62, -5}}, textString = "Constrain turbine inlet temperature"), Text(origin = {-78, 73}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {30, -11}}, textString = "fuel consumed is determined"), Line(origin = {37.6112, 72.5574}, points = {{-12, 25}, {-80, -3}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5)}, coordinateSystem(extent = {{-140, -140}, {140, 140}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end GasGenerator_ex02;
