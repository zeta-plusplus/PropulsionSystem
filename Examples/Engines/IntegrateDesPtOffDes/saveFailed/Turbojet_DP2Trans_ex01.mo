within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes.saveFailed;

model Turbojet_DP2Trans_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 0.2, offset = 0.33, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-50, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment(timeRemoveDesConstraint = 2)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {88, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-128, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {280, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-180, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {39.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-52, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb(redeclare package Medium = engineAir, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Sources.NmechAtDesignPoint01 NmechDes(use_u_NmechDes = false)  annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 10.0) annotation(
    Placement(visible = true, transformation(origin = {-90, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {220, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {176, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.01, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(volume.ports[2], Comb.port_1) annotation(
    Line(points = {{-20, -40}, {20, -40}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(Cmp.port_2, volume.ports[1]) annotation(
    Line(points = {{-40, -64}, {-40, -40}, {-20, -40}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, Cmp.port_1) annotation(
    Line(points = {{-80, -64}, {-64, -64}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, NmechDes.flange_1) annotation(
    Line(points = {{-32, -80}, {20, -80}}));
  connect(NmechDes.flange_2, Trb.flange_1) annotation(
    Line(points = {{40, -80}, {120, -80}, {120, -80}, {120, -80}}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-116, -64}, {-100, -64}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-114, -88}, {-108, -88}, {-108, -112}, {258, -112}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-158, -76}, {-152.5, -76}, {-152.5, -88}, {-142, -88}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-160, -64}, {-140, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, temperature1.port) annotation(
    Line(points = {{-180, -40}, {-180, 60}, {176, 60}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, boundary.m_flow_in) annotation(
    Line(points = {{-38, -2}, {-10, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{88, -40}, {128, -40}, {128, -64}}, color = {0, 127, 255}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{152, -64}, {204, -64}}, color = {0, 127, 255}));
  connect(Nzl.port_2, temperature1.port) annotation(
    Line(points = {{236, -64}, {236, 60}, {178, 60}, {178, 59}, {176, 59}, {176, 60}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{230, -80}, {250, -80}, {250, -104}, {258, -104}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -136}, {258, -136}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{59.5, -40}, {88, -40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {24, -10}, {24, -24}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {300, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_DP2Trans_ex01;
