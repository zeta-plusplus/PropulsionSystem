within PropulsionSystem.Examples.Elements.BasicElements;

model Inlet_001
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-84, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource massFlowSource1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, m_flow = -10)  annotation(
    Placement(visible = true, transformation(origin = {42, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.Inlet inlet1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, switchCalcFram = PropulsionSystem.Elements.BasicElements.Inlet.switch_calculate_Fram.DoNot) annotation(
    Placement(visible = true, transformation(origin = {-44, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], inlet1.port_1) annotation(
    Line(points = {{-74, 30}, {-56, 30}}, color = {0, 127, 255}, thickness = 0.5));
  connect(inlet1.port_2, massFlowSource1.port_b) annotation(
    Line(points = {{-36, 30}, {32, 30}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
  
  
end Inlet_001;
