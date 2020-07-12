within PropulsionSystem.Examples.temp;

model Turbojet_transient_temp01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 2, height = 0.01, offset = 0.021, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {260, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, printCmd = true) annotation(
    Placement(visible = true, transformation(origin = {-180, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {59.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0), stateSelect = StateSelect.always, w(fixed = false, start = 9000 * Modelica.Constants.pi * 2 / 60)) annotation(
    Placement(visible = true, transformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 1.0)  annotation(
    Placement(visible = true, transformation(origin = {-80, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint NmechDes(NmechDes_paramInput = 9000.0)  annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable01 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed01 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-106, -88}, {-92, -88}, {-92, -172}, {238, -172}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{76, -58}, {76, -196}, {238, -196}}, color = {0, 0, 127}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{190, -80}, {226, -80}, {226, -164}, {238, -164}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-180, -40}, {-180, -40}, {-180, 70}, {200, 70}, {200, -64}, {200, -64}}, color = {0, 127, 255}));
  connect(inertia1.flange_b, Trb.flange_1) annotation(
    Line(points = {{50, -80}, {100, -80}, {100, -80}, {100, -80}}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{140, -64}, {160, -64}, {160, -64}, {160, -64}}, color = {0, 127, 255}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{100, -40}, {100, -40}, {100, -64}, {100, -64}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-20, -64}, {-20, -64}, {-20, -40}, {40, -40}, {40, -40}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, Cmp.port_1) annotation(
    Line(points = {{-70, -64}, {-60, -64}, {-60, -64}, {-60, -64}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, NmechDes.flange_1) annotation(
    Line(points = {{-20, -80}, {0, -80}, {0, -80}, {0, -80}}));
  connect(NmechDes.flange_2, inertia1.flange_a) annotation(
    Line(points = {{20, -80}, {30, -80}, {30, -80}, {30, -80}}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{79.5, -39.8}, {99.5, -39.8}, {99.5, -39.8}, {99.5, -39.8}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {44, -10}, {44, -24}}, color = {0, 127, 255}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-100, -64}, {-90, -64}, {-90, -64}, {-90, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-160, -64}, {-140, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-158, -76}, {-150.5, -76}, {-150.5, -88}, {-134, -88}}, color = {0, 0, 127}));
  connect(ramp_m_flow_fuel.y, boundary.m_flow_in) annotation(
    Line(points = {{-28, 20}, {-22, 20}, {-22, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {300, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 140, Tolerance = 1e-06, Interval = 0.0466822),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_transient_temp01;
