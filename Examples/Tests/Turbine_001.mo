within PropulsionSystem.Examples.Tests;

model Turbine_001
  extends Modelica.Icons.Example;
  PropulsionSystem.Elements.BasicElements.Turbine Trb001(redeclare package Medium = Modelica.Media.Air.DryAirNasa, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, nPorts = 1, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource massFlowSource1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1000)  annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = -1000)  annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 0, offset = 45 * 101.3 * 1000, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0, offset = 2000, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step3(height = 0, offset = -10, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massFlowSource1.m_flow_in, step3.y) annotation(
    Line(points = {{32, 20}, {47, 20}}, color = {0, 0, 127}));
  connect(Trb001.port_2, massFlowSource1.port_b) annotation(
    Line(points = {{0, 18}, {12, 18}, {12, 18.2}}, color = {0, 127, 255}));
  connect(constantSpeed1.flange, inertia1.flange_a) annotation(
    Line(points = {{-60, -20}, {-50, -20}}));
  connect(inertia1.flange_b, Trb001.flange_1) annotation(
    Line(points = {{-30, -18}, {-28, -18}, {-28, 12}, {-22, 12}}));
  connect(boundary.ports[1], Trb001.port_1) annotation(
    Line(points = {{-40, 20}, {-18, 20}}, color = {0, 127, 255}, thickness = 0.5));
  connect(step1.y, boundary.p_in) annotation(
    Line(points = {{-79, 50}, {-68, 50}, {-68, 28}, {-62, 28}}, color = {0, 0, 127}));
  connect(step2.y, boundary.T_in) annotation(
    Line(points = {{-79, 20}, {-73, 20}, {-73, 24}, {-63, 24}, {-63, 24}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
  
end Turbine_001;
