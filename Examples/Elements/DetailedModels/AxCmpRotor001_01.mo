within PropulsionSystem.Examples.Elements.DetailedModels;

model AxCmpRotor001_01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.AxCmpRotor_meanLine axCmpRotor_meanLine1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-7.10543e-15, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir,T = 288.15, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {70,50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2 * Modelica.Constants.pi / 60, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_FlowAngle(duration = 10, height = 0, offset = 3000 * 2 * Modelica.Constants.pi / 60, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_FlowAngle.y, axCmpRotor_meanLine1.u_flowAngle) annotation(
    Line(points = {{-39, 10}, {-30, 10}, {-30, 28}, {-22, 28}}, color = {0, 0, 127}));
  connect(speed1.w_ref, ramp_omega.y) annotation(
    Line(points = {{62, 10}, {80, 10}, {80, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(axCmpRotor_meanLine1.flange_2, speed1.flange) annotation(
    Line(points = {{20, 20}, {28, 20}, {28, 10}, {40, 10}, {40, 10}}));
  connect(axCmpRotor_meanLine1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 36}, {32, 36}, {32, 50}, {60, 50}, {60, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], axCmpRotor_meanLine1.port_1) annotation(
    Line(points = {{-60, 50}, {-40, 50}, {-40, 36}, {-20, 36}}, color = {0, 127, 255}));
end AxCmpRotor001_01;
