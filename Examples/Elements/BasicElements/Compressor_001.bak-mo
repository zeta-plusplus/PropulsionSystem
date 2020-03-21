within PropulsionSystem.Examples.Elements.BasicElements;

model Compressor_001
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(useSupport = true, w_fixed = 1000) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.Compressor compressor1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource massFlowSource1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Step step1(height = 0, offset = 101.3 * 1000, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0, offset = 288.15, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step3(height = 0, offset = -10, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(step1.y, boundary.p_in) annotation(
    Line(points = {{-79, 48}, {-71, 48}, {-71, 46}, {-63, 46}, {-63, 46}}, color = {0, 0, 127}));
  connect(boundary.ports[1], compressor1.port_1) annotation(
    Line(points = {{-40, 38}, {-30, 38}}, color = {0, 127, 255}, thickness = 0.5));
  connect(step2.y, boundary.T_in) annotation(
    Line(points = {{-79, 20}, {-75, 20}, {-75, 44}, {-63, 44}, {-63, 44}}, color = {0, 0, 127}));
  connect(compressor1.port_2, massFlowSource1.port_b) annotation(
    Line(points = {{-10, 38}, {0, 38}, {0, 38.2}}, color = {0, 127, 255}));
  connect(massFlowSource1.m_flow_in, step3.y) annotation(
    Line(points = {{22, 38}, {38, 38}, {38, 38}, {40, 38}}, color = {0, 0, 127}));
  connect(compressor1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-10, 28}, {-6, 28}, {-6, 8}, {0, 8}}));
  connect(inertia1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{20, 8}, {30, 8}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-06, Interval = 0.002));
    
end Compressor_001;
