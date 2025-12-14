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
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {54, 5}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.TimeTable timeTable_p1(table = [0, 2e5; 10, 2e5; 20, 5e5; 30, 5e5]) annotation(
    Placement(transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable timeTable_T1(table = [0, 1600; 30, 1600; 40, 2000; 50, 2000]) annotation(
    Placement(transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable timeTable_m_flow_1(table = [0, 100; 50, 100; 60, 200; 70, 200]) annotation(
    Placement(transformation(origin = {-24, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary_amb(redeclare package Medium = engineAir, nPorts = 1, p = 100*1000, T(displayUnit = "K") = 288.15) annotation(
    Placement(transformation(origin = {-20, 60}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor Nzl_Fg annotation(
    Placement(transformation(origin = {41, 5}, extent = {{-4, -4}, {4, 4}})));
  PropulsionSystem.Elements.BasicElements.NozzleDesignPoint00 Nzl(redeclare package Medium = engineAir, use_flangeThrust = true, switchDetermine_m_flow_1 = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(transformation(origin = {16.2, 4.66667}, extent = {{-16.2, -14.3333}, {16.2, 14.3333}})));
  Modelica.Blocks.Interaction.Show.RealValue disp_Nzl_Fg(significantDigits = 5, use_numberPort = true) annotation(
    Placement(transformation(origin = {13, -30}, extent = {{9, -4}, {-9, 4}})));
  Modelica.Blocks.Math.Gain Nzl_Fg_kN(k = 1/1000) annotation(
    Placement(transformation(origin = {31, -30}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Blocks.Sources.RealExpression realExpression_Nzl_AmechTh(y = Nzl.AmechTh) annotation(
    Placement(transformation(origin = {5, -14}, extent = {{-3, -2}, {3, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue disp_Nzl_Fg1(significantDigits = 5, use_numberPort = true) annotation(
    Placement(transformation(origin = {19, -14}, extent = {{-7, -4}, {7, 4}})));
equation
  connect(timeTable_p1.y, boundary.p_in) annotation(
    Line(points = {{-69, 30}, {-59, 30}, {-59, 24}, {-43, 24}}, color = {0, 0, 127}));
  connect(timeTable_T1.y, boundary.T_in) annotation(
    Line(points = {{-69, -10}, {-63, -10}, {-63, 20}, {-43, 20}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Nzl.port_1) annotation(
    Line(points = {{-20, 16}, {0, 16}}, color = {0, 127, 255}));
  connect(Nzl.port_2, boundary_sink.ports[1]) annotation(
    Line(points = {{32, 16}, {70, 16}}, color = {0, 127, 255}));
  connect(timeTable_m_flow_1.y, Nzl.u_m_flow_1) annotation(
    Line(points = {{-13, -24}, {0, -24}, {0, -8}}, color = {0, 0, 127}));
  connect(Nzl.flangeThrust, Nzl_Fg.flange_a) annotation(
    Line(points = {{30, 5}, {37, 5}}, color = {0, 127, 0}));
  connect(Nzl_Fg.flange_b, fixed.flange) annotation(
    Line(points = {{45, 5}, {54, 5}}, color = {0, 127, 0}));
  connect(boundary_amb.ports[1], Nzl.port_amb) annotation(
    Line(points = {{-10, 60}, {27, 60}, {27, 19}}, color = {0, 127, 255}));
  connect(disp_Nzl_Fg.numberPort, Nzl_Fg_kN.y) annotation(
    Line(points = {{23.35, -30}, {27.35, -30}}, color = {0, 0, 127}));
  connect(Nzl_Fg_kN.u, Nzl_Fg.f) annotation(
    Line(points = {{35, -30}, {38, -30}, {38, 1}}, color = {0, 0, 127}));
  connect(realExpression_Nzl_AmechTh.y, disp_Nzl_Fg1.numberPort) annotation(
    Line(points = {{8.3, -14}, {11.3, -14}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {17, -35}, extent = {{-5, 2}, {5, -2}}, textString = "[kN]"), Text(origin = {21, -19}, extent = {{-5, 2}, {5, -2}}, textString = "[m2]")}));
end NozzleDesignPoint00_ex00;