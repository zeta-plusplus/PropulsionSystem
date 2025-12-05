within PropulsionSystem.Examples.Subelements;

model TurboPassage01_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //package fluid1 = FluidSystemComponents.Media.Mixture_N2O2;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 373.15, nPorts = 1, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, m_flow = -100, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(transformation(origin = {0, -10}, extent = {{10, -10}, {-10, 10}})));
  FluidSystemComponents.Sensor.StaticStatesTwoPort01 StaticStates(redeclare package Medium = fluid1, sw_input_calcStat = FluidSystemComponents.Types.Switches.switch_input_CalcStaticStates.input_Mn, AeffPath_par = 0.5790, Mn_par = 0.2) annotation(
    Placement(transformation(origin = {-32, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 373.15, nPorts = 1, p = 100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary11(redeclare package Medium = fluid1, m_flow = -100, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(transformation(origin = {90, -50}, extent = {{10, -10}, {-10, 10}})));
  FluidSystemComponents.Sensor.StaticStatesTwoPort01 StaticStates1(redeclare package Medium = fluid1, AeffPath_par = 0.1610, sw_input_calcStat = FluidSystemComponents.Types.Switches.switch_input_CalcStaticStates.input_Mn, Mn_par = 0.8) annotation(
    Placement(transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}})));
  PropulsionSystem.Subelements.TurboPassage01 TrboPsg annotation(
    Placement(transformation(origin = {10, 36}, extent = {{-10, -4}, {10, 4}})));
equation
  connect(StaticStates.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-22, -10}, {-10, -10}}, color = {0, 127, 255}));
  connect(StaticStates1.port_2, boundary11.ports[1]) annotation(
    Line(points = {{70, -50}, {80, -50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], StaticStates.port_1) annotation(
    Line(points = {{-80, -10}, {-42, -10}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], StaticStates1.port_1) annotation(
    Line(points = {{10, -50}, {50, -50}}, color = {0, 127, 255}));
  connect(TrboPsg.portStatIn_inlet, StaticStates.PortStatOut) annotation(
    Line(points = {{0, 36}, {-32, 36}, {-32, 0}}, color = {0, 127, 255}));
  connect(TrboPsg.portStatIn_outlet, StaticStates1.PortStatOut) annotation(
    Line(points = {{20, 38}, {60, 38}, {60, -40}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.1));
end TurboPassage01_ex01;