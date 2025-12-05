within PropulsionSystem.Examples.Subelements;

model TurboPassage01_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //package fluid1 = FluidSystemComponents.Media.Mixture_N2O2;
  //-----
  PropulsionSystem.Subelements.TurboPassage01 TrboPsg(swCnstrPass = Types.switches.switchConstraintTurboPassage.constHubRad) annotation(
    Placement(transformation(origin = {3, 33}, extent = {{-20, -9}, {20, 9}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 400, nPorts = 1, p = 5*100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 Orifice(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_zeta(duration = 10, height = 1, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {-75, -33}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, m_flow = -100, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(transformation(origin = {0, -10}, extent = {{10, -10}, {-10, 10}})));
  FluidSystemComponents.Sensor.StaticStatesTwoPort StaticStates(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-32, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = fluid1, T = 400, nPorts = 1, p = 5*100*1000, use_T_in = false, use_p_in = false) annotation(
    Placement(transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 Orifice1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {32, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_zeta1(duration = 10, height = 1, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {17, -73}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary11(redeclare package Medium = fluid1, m_flow = -100, nPorts = 1, use_m_flow_in = false) annotation(
    Placement(transformation(origin = {90, -50}, extent = {{10, -10}, {-10, 10}})));
  FluidSystemComponents.Sensor.StaticStatesTwoPort StaticStates1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_zeta.y, Orifice.u_zeta) annotation(
    Line(points = {{-69.5, -33}, {-64, -33}, {-64, -21}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Orifice.port_1) annotation(
    Line(points = {{-80, -10}, {-70, -10}}, color = {0, 127, 255}));
  connect(Orifice.port_2, StaticStates.port_1) annotation(
    Line(points = {{-50, -10}, {-42, -10}}, color = {0, 127, 255}));
  connect(StaticStates.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-22, -10}, {-10, -10}}, color = {0, 127, 255}));
  connect(TrboPsg.bus_Static_1, StaticStates.bus_Static) annotation(
    Line(points = {{-17, 33}, {-32, 33}, {-32, 0}}, color = {255, 204, 51}, thickness = 0.5));
  connect(ramp_zeta1.y, Orifice1.u_zeta) annotation(
    Line(points = {{22.5, -73}, {28, -73}, {28, -61}}, color = {0, 0, 127}));
  connect(TrboPsg.bus_Static_2, StaticStates1.bus_Static) annotation(
    Line(points = {{24, 38}, {60, 38}, {60, -40}}, color = {255, 204, 51}, thickness = 0.5));
  connect(StaticStates1.port_2, boundary11.ports[1]) annotation(
    Line(points = {{70, -50}, {80, -50}}, color = {0, 127, 255}));
  connect(Orifice1.port_2, StaticStates1.port_1) annotation(
    Line(points = {{42, -50}, {50, -50}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], Orifice1.port_1) annotation(
    Line(points = {{10, -50}, {22, -50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.1));
end TurboPassage01_ex01;