within PropulsionSystem.Examples.Tests;

model Trans_Turbojet_test01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 0.01, offset = 0.021, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir, PRdes_paramInput = 20, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_effAud = true, use_u_s_PRaud = true, use_u_s_WcAud = true, use_u_s_effAud = false) annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_effAud = true, use_u_s_WcAud = false) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-140, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {260, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-200, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_s_WcAud(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-112, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_s_PRaud(duration = 10, height = 0, offset = 1, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-80, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_a_effAud(duration = 10, height = 0.0, offset = 0, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_s_WcAud(duration = 10, height = 0, offset = 1, startTime = 90) annotation(
    Placement(visible = true, transformation(origin = {100, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_a_effAud(duration = 10, height = 0.0, offset = 0, startTime = 110) annotation(
    Placement(visible = true, transformation(origin = {130, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {39.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.01, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(volume.ports[2], Comb.port_1) annotation(
    Line(points = {{-30, -40}, {20, -40}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(Cmp.port_2, volume.ports[1]) annotation(
    Line(points = {{-60, -64}, {-60, -64}, {-60, -40}, {-30, -40}, {-30, -40}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-180, -64}, {-160, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-178, -76}, {-170.5, -76}, {-170.5, -88}, {-154, -88}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-200, -40}, {-200, 50}, {200, 50}, {200, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{-120, -64}, {-100, -64}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, Trb.flange_1) annotation(
    Line(points = {{-60, -80}, {100, -80}}));
  connect(ramp_Cmp_s_PRaud.y, Cmp.u_s_PRaud) annotation(
    Line(points = {{-80, -139}, {-80, -139}, {-80, -117}, {-84, -117}, {-84, -99}, {-84, -99}}, color = {0, 0, 127}));
  connect(ramp_Cmp_a_effAud.y, Cmp.u_a_effAud) annotation(
    Line(points = {{-50, -139}, {-50, -109}, {-60, -109}, {-60, -99}}, color = {0, 0, 127}));
  connect(ramp_Cmp_s_WcAud.y, Cmp.u_s_WcAud) annotation(
    Line(points = {{-112, -139}, {-112, -111}, {-100, -111}, {-100, -99}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-126, -88}, {-76, -88}, {-76, -132}, {238, -132}}, color = {0, 0, 127}));
  connect(ramp_m_flow_fuel.y, boundary.m_flow_in) annotation(
    Line(points = {{-28, 20}, {-24, 20}, {-24, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {24, -10}, {24, -24}, {24, -24}}, color = {0, 127, 255}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -58}, {56, -156}, {238, -156}, {238, -156}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{60, -40}, {80, -40}, {80, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(ramp_Trb_s_WcAud.y, Trb.u_s_WcAud) annotation(
    Line(points = {{100, -168}, {100, -168}, {100, -116}, {108, -116}, {108, -98}, {108, -98}}, color = {0, 0, 127}));
  connect(ramp_Trb_a_effAud.y, Trb.u_a_effAud) annotation(
    Line(points = {{130, -168}, {130, -168}, {130, -114}, {132, -114}, {132, -98}, {132, -98}}, color = {0, 0, 127}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{80, -40}, {100, -40}, {100, -64}}, color = {0, 127, 255}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{140, -64}, {160, -64}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{190, -80}, {213, -80}, {213, -124}, {238, -124}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 140, Tolerance = 1e-06, Interval = 0.0466822),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Trans_Turbojet_test01;
