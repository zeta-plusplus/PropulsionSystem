within PropulsionSystem.Examples.Elements.Turbines;

model TurbineDesignPoint00_ex00
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 20*101.325*1000) annotation(
    Placement(visible = true, transformation(origin = {-66, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -1.0, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {52, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000*2.0*Modelica.Constants.pi/60.0) annotation(
    Placement(visible = true, transformation(origin = {-88, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 1, height = 1, offset = 3, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-33, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 1, height = 0.05, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 TrbDesPt(redeclare package Medium = Modelica.Media.Air.DryAirNasa, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {-10, 15}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
equation
  connect(boundary.ports[1], TrbDesPt.port_1) annotation(
    Line(points = {{-56, 52}, {-19, 52}, {-19, 27}}, color = {0, 127, 255}));
  connect(TrbDesPt.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-1, 27}, {-1, 52}, {42, 52}}, color = {0, 127, 255}));
  connect(constantSpeed1.flange, TrbDesPt.flange_1) annotation(
    Line(points = {{-78, 15}, {-25, 15}}));
  connect(ramp_PR.y, TrbDesPt.u_PR) annotation(
    Line(points = {{-22, -30}, {-22, -30.5}, {-16, -30.5}, {-16, 9}}, color = {0, 0, 127}));
  connect(ramp_eff.y, TrbDesPt.u_eff) annotation(
    Line(points = {{-18, -60}, {-10, -60}, {-10, 6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(graphics = {Text(origin = {14, -11}, extent = {{-18, 5}, {18, -5}}, textString = "PR, eff are given"), Text(origin = {-58, 1}, extent = {{-18, 5}, {26, -7}}, textString = "pwr, trq are calculated"), Line(origin = {-17, -8}, points = {{11, -4}, {-11, 4}}, arrow = {Arrow.None, Arrow.Open})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end TurbineDesignPoint00_ex00;
