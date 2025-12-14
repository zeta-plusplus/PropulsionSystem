within PropulsionSystem.Examples.Elements.JetNozzles;

model NozzleDesignPoint00_ex00
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 900, nPorts = 1, p = 5*100*1000, use_p_in = true, use_T_in = true) annotation(
    Placement(transformation(origin = {-30, 16}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_sink(redeclare package Medium = engineAir, nPorts = 1, p = 100*1000) annotation(
    Placement(transformation(origin = {80, 16}, extent = {{10, -10}, {-10, 10}})));
  PropulsionSystem.Elements.BasicElements.NozzleDesignPoint00 Nzl070(redeclare package Medium = engineAir, use_flangeThrust = true, switchDetermine_m_flow_1 = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput)  annotation(
    Placement(transformation(origin = {20, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {37, -34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable timeTable_p1(table = [0, 2e5; 10, 2e5; 20, 5e5; 30, 5e5])  annotation(
    Placement(transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable timeTable_T1(table = [0, 1600; 30, 1600; 40, 2000; 50, 2000])  annotation(
    Placement(transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable timeTable_m_flow_1(table = [0, 100; 50, 100; 60, 200; 70, 200])  annotation(
    Placement(transformation(origin = {-28, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary_amb(redeclare package Medium = engineAir, nPorts = 1, p = 100*1000, T(displayUnit = "K") = 288.15) annotation(
    Placement(transformation(origin = {-20, 60}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
equation
  connect(boundary.ports[1], Nzl070.port_1) annotation(
    Line(points = {{-20, 16}, {0, 16}}, color = {0, 127, 255}));
  connect(Nzl070.port_2, boundary_sink.ports[1]) annotation(
    Line(points = {{40, 16}, {69.8, 16}}, color = {0, 127, 255}));
  connect(Nzl070.flangeThrust, fixed.flange) annotation(
    Line(points = {{37, 0}, {37, -34}}, color = {0, 127, 0}));
  connect(timeTable_m_flow_1.y, Nzl070.u_m_flow_1) annotation(
    Line(points = {{-17, -50}, {0, -50}, {0, -18}}, color = {0, 0, 127}));
  connect(timeTable_p1.y, boundary.p_in) annotation(
    Line(points = {{-69, 30}, {-59, 30}, {-59, 24}, {-43, 24}}, color = {0, 0, 127}));
  connect(timeTable_T1.y, boundary.T_in) annotation(
    Line(points = {{-69, -10}, {-63, -10}, {-63, 20}, {-43, 20}}, color = {0, 0, 127}));
  connect(boundary_amb.ports[1], Nzl070.port_amb) annotation(
    Line(points = {{-10, 60}, {30, 60}, {30, 20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end NozzleDesignPoint00_ex00;