within PropulsionSystem.Examples.Engines.OffDesignSim;

model GasTurbineEngine_1Spool_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-172, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-20, 68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver variableBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {162, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtInit MassFlowAtInit(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-128, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtInit NmechAtInit annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(NmechAtInit.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-10, -20}, {40, -20}, {40, -20}, {40, -20}}));
  connect(Cmp.flange_2, NmechAtInit.flange_1) annotation(
    Line(points = {{-60, -20}, {-30, -20}, {-30, -20}, {-30, -20}}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{40, -20}, {60, -20}}));
  connect(MassFlowAtInit.port_2, Cmp.port_1) annotation(
    Line(points = {{-118, -4}, {-100, -4}, {-100, -4}, {-100, -4}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowAtInit.port_1) annotation(
    Line(points = {{-162, 20}, {-152, 20}, {-152, -4}, {-138, -4}, {-138, -4}}, color = {0, 127, 255}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{100, -4}, {106, -4}, {106, 38}, {120, 38}, {120, 38}}, color = {0, 127, 255}));
  connect(Nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{140, 38}, {140, 38}, {140, 50}, {152, 50}, {152, 50}}, color = {0, 127, 255}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{30, 30}, {48, 30}, {48, -4}, {60, -4}, {60, -4}}, color = {0, 127, 255}));
  connect(Cmp.port_2, HeatInjector.port_1) annotation(
    Line(points = {{-60, -4}, {-48, -4}, {-48, 30}, {-40, 30}, {-40, 30}}, color = {0, 127, 255}));
  connect(variableBySolver1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-28, 90}, {-20, 90}, {-20, 78}, {-20, 78}}, color = {0, 0, 127}));
  connect(temperature.T, constrainVariable1.u_variable) annotation(
    Line(points = {{38, 40}, {50, 40}, {50, 48}, {50, 48}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, constrainVariable1.u_targetValue) annotation(
    Line(points = {{50, 80}, {50, 80}, {50, 72}, {50, 72}}, color = {0, 0, 127}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{0, 30}, {30, 30}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-20, 58}, {-20, 50}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {32, 105}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {62, -5}}, textString = "Constrain turbine inlet temperature"), Text(origin = {-66, 59}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {30, -11}}, textString = "Heat injected is determined"), Line(origin = {37.6112, 72.5574}, points = {{-12, 25}, {-80, -9}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {-10, 7}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {30, -11}}, textString = "≒Combustion chamber")}, coordinateSystem(extent = {{-180, -140}, {200, 140}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end GasTurbineEngine_1Spool_ex01;
