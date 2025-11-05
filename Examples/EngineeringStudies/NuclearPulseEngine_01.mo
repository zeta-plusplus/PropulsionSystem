within PropulsionSystem.Examples.EngineeringStudies;

model NuclearPulseEngine_01
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //----------
  parameter units.Time GlbPar_startTime = 0;
  parameter units.Time GlbPar_timeWidth = 1e-7;
  parameter units.Time GlbPar_periodRepeat = 1;
  parameter Integer GlbPar_nperiod = -1;
  parameter units.Pressure GlbPar_pulse_p_amp = 2.95e17;
  parameter units.Velocity GlbPar_pulse_der_r_amp = 7.6e6;
  //----------
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate annotation(
    Placement(transformation(origin = {-16.4, 40}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-84, 40}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-58, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-50, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Mean meanForce(f = 1000) annotation(
    Placement(transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  NuclearSystem.Kinetics.Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {60, 40}, extent = {{20, -20}, {-20, 20}})));
equation
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-68, 40}, {-84, 40}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{-27.8, 40}, {-48.2, 40}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-50, 29}, {-50, 13}}, color = {0, 0, 127}));
  connect(impluse.y, meanForce.u) annotation(
    Line(points = {{-50, -9}, {-50, -19}}, color = {0, 0, 127}));
  connect(FissionCore.y_pCore, plate.u_p) annotation(
    Line(points = {{39, 40}, {-6, 40}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 2e-6, Tolerance = 1e-06, Interval = 1e-09),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end NuclearPulseEngine_01;
