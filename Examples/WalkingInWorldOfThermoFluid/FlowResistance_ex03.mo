within PropulsionSystem.Examples.WalkingInWorldOfThermoFluid;

model FlowResistance_ex03
  extends Modelica.Icons.Example;
  //----------
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, p_ambient(displayUnit = "Pa") = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = fluid1, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.05, length = 5) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, V = 1.0e-3, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = 1.0e-3, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 10, offset = 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(volume.ports[2], pipe.port_a) annotation(
    Line(points = {{-20, 50}, {0, 50}}, color = {0, 127, 255}));
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-40, 50}, {-20, 50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{40, 50}, {60, 50}, {60, 50}, {60, 50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(ramp1.y, boundary.m_flow_in) annotation(
    Line(points = {{-78, 50}, {-76, 50}, {-76, 58}, {-60, 58}, {-60, 58}}, color = {0, 0, 127}));
  connect(pipe.port_b, volume1.ports[1]) annotation(
    Line(points = {{20, 50}, {38, 50}, {38, 50}, {40, 50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end FlowResistance_ex03;
