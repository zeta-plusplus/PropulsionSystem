within PropulsionSystem.Examples.Elements.BasicElements;

model NozzleConv_defAmech_001
  extends Modelica.Icons.Example;
  
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl002(redeclare package Medium = engineAir, Amech_th_def = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 9, height = 1.09 * 101.3 * 1000, offset = 1.01 * 101.3 * 1000, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 9, height = 0, offset = 288.15, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 9, height = -0.5 * 101.3 * 1000, offset = 101.3 * 1000, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(boundary1.p_in, ramp3.y) annotation(
    Line(points = {{22, 52}, {32, 52}, {32, 70}, {40, 70}, {40, 70}}, color = {0, 0, 127}));
  connect(ramp2.y, boundary.T_in) annotation(
    Line(points = {{-78, 40}, {-72, 40}, {-72, 64}, {-60, 64}}, color = {0, 0, 127}));
  connect(ramp1.y, boundary.p_in) annotation(
    Line(points = {{-78, 70}, {-74, 70}, {-74, 68}, {-60, 68}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Nzl002.port_1) annotation(
    Line(points = {{-38, 60}, {-33, 60}, {-33, 58}, {-28, 58}}, color = {0, 127, 255}, thickness = 0.5));
  connect(Nzl002.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-8, 58}, {-5.5, 58}, {-5.5, 60}, {2.5, 60}, {2.5, 58}, {2, 58}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));

end NozzleConv_defAmech_001;
