within PropulsionSystem.Examples.Tests;

model Compressor_Map_WcPReff_001
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary_Cmp(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Cmp(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech_Cmp(duration = 4, height = 0, offset = 3000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.FlowSink flowSink_Cmp(redeclare package Medium = engineAir, m_flow(start = -10)) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech_Cmp(switchInput_Nmech = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_Cmp annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_torque_Cmp(duration = 4, height = 0, offset = -10458.8, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torque_Cmp.tau, ramp_torque_Cmp.y) annotation(
    Line(points = {{62, 0}, {80, 0}, {80, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(constrain_Nmech_Cmp.NmechDes_in, ramp_Nmech_Cmp.y) annotation(
    Line(points = {{14, -6.6}, {14, -6.6}, {14, -12.6}, {20, -12.6}, {20, -18.6}, {20, -18.6}}, color = {0, 0, 127}));
  connect(constrain_Nmech_Cmp.flange_b, torque_Cmp.flange) annotation(
    Line(points = {{30, 0}, {40, 0}, {40, 0}, {40, 0}}));
  connect(inertia_Cmp.flange_b, constrain_Nmech_Cmp.flange_a) annotation(
    Line(points = {{0, 0}, {10, 0}, {10, 0}, {10, 0}}));
  connect(Cmp020.flange_2, inertia_Cmp.flange_a) annotation(
    Line(points = {{-30, 30}, {-26, 30}, {-26, 0}, {-20, 0}, {-20, 0}}));
  connect(Cmp020.port_2, flowSink_Cmp.port_a) annotation(
    Line(points = {{-30, 38}, {-24, 38}, {-24, 40}, {-10, 40}, {-10, 40}}, color = {0, 127, 255}));
  connect(boundary_Cmp.ports[1], Cmp020.port_1) annotation(
    Line(points = {{-70, 40}, {-54, 40}, {-54, 38}, {-50, 38}, {-50, 38}}, color = {0, 127, 255}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end Compressor_Map_WcPReff_001;
