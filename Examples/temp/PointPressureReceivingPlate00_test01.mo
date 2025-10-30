within PropulsionSystem.Examples.temp;

model PointPressureReceivingPlate00_test01
  extends Modelica.Icons.Example;
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate annotation(
    Placement(transformation(origin = {-37.4, 20}, extent = {{-11.4, -40}, {11.4, 40}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-100, 20}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_p(T = 1.5e-8) annotation(
    Placement(transformation(origin = {24, 20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = 26e11, width = 1e-7, period = 2, nperiod = 5, startTime = 7e-8) annotation(
    Placement(transformation(origin = {58, 20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-74, 20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-66, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Mean meanForce(f = 1000) annotation(
    Placement(transformation(origin = {-66, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(pulse_p.y, firstOrder_p.u) annotation(
    Line(points = {{47, 20}, {35, 20}}, color = {0, 0, 127}));
  connect(firstOrder_p.y, plate.u_p) annotation(
    Line(points = {{13, 20}, {-28, 20}}, color = {0, 0, 127}));
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-84, 20}, {-100, 20}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{-49, 20}, {-64.8, 20}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-66, 9}, {-66, -7}}, color = {0, 0, 127}));
  connect(impluse.y, meanForce.u) annotation(
    Line(points = {{-66, -29}, {-66, -39}}, color = {0, 0, 127}));
  connect(block_rCore.y, plate.u_rCore) annotation(
    Line(points = {{-19, -20}, {-32, -20}, {-32, -3}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 5e-06, Tolerance = 1e-06, Interval = 1e-09),
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})));
end PointPressureReceivingPlate00_test01;
