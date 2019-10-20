within PropulsionSystem.Examples.Elements.DetailedModels;

model AxCmpRotor001_02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.AxCmpRotor_meanLine axCmpRotor_meanLine1(redeclare package Medium = engineAir, m_flow1_init = 100, p2_init = 2 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir,T = 288.15, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_omega(duration = 10, height = 0, offset = 3000 * 2 * Modelica.Constants.pi / 60, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_FlowAngle(duration = 10, height = 0, offset = 0 * Modelica.Constants.pi / 180, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir,V = 0.001, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = engineAir,diameter = 0.1, zeta = 1)  annotation(
    Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(speed1.w_ref, ramp_omega.y) annotation(
    Line(points = {{52, 20}, {68, 20}, {68, 20}, {70, 20}}, color = {0, 0, 127}));
  connect(axCmpRotor_meanLine1.flange_2, speed1.flange) annotation(
    Line(points = {{10, 20}, {30, 20}, {30, 20}, {30, 20}}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{70, 50}, {80, 50}, {80, 50}, {80, 50}}, color = {0, 127, 255}));
  connect(volume.ports[2], orifice.port_a) annotation(
    Line(points = {{30, 50}, {50, 50}, {50, 50}, {50, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], axCmpRotor_meanLine1.port_1) annotation(
    Line(points = {{-70, 50}, {-50, 50}, {-50, 36}, {-30, 36}}, color = {0, 127, 255}));
  connect(axCmpRotor_meanLine1.port_2, volume.ports[1]) annotation(
    Line(points = {{10, 36}, {22, 36}, {22, 50}, {30, 50}, {30, 50}}, color = {0, 127, 255}));
  connect(ramp_FlowAngle.y, axCmpRotor_meanLine1.u_flowAngle) annotation(
    Line(points = {{-49, 10}, {-40, 10}, {-40, 28}, {-32, 28}}, color = {0, 0, 127}));
end AxCmpRotor001_02;
