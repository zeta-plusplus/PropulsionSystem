within PropulsionSystem.Examples.Tests;

model NozzleConv_001
  extends Modelica.Icons.Example;
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, dmDes = 10) annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 1000, nPorts = 1, p = 2 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(Nzl070.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-20, 68}, {-8, 68}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Nzl070.port_1) annotation(
    Line(points = {{-50, 68}, {-38, 68}}, color = {0, 127, 255}));
  connect(boundary.ports[1], constrain_dm1.port_1) annotation(
    Line(points = {{-80, 70}, {-68, 70}}, color = {0, 127, 255}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "3.2.2")));

end NozzleConv_001;
