within PropulsionSystem.Examples.EngineeringStudies;

model NuclearPulseEngine_Corr_01
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //----------
  parameter units.Time GlbPar_startTime = 7e-8;
  parameter units.Time GlbPar_timeWidth = 1.77e-7;
  parameter units.Time GlbPar_periodRepeat = 10;
  parameter Integer GlbPar_nperiod = -1;
  parameter units.Pressure GlbPar_pulse_p_amp = 3.3e16;
  //----------
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate(d2core_par = 55*9.725^(1/3)) annotation(
    Placement(transformation(origin = {-20.4, 72}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-104, 72}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-60, 72}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-54, 45}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
  NuclearSystem.Kinetics.Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {56, 72}, extent = {{20, -20}, {-20, 20}})));
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate1(d2core_par = plate.d2core_par) annotation(
    Placement(transformation(origin = {-34.4, -20}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(transformation(origin = {-69, -20}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Continuous.Integrator impluse1 annotation(
    Placement(transformation(origin = {-63, -51}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = GlbPar_pulse_p_amp, nperiod = GlbPar_nperiod, period = GlbPar_periodRepeat, startTime = GlbPar_startTime, width = GlbPar_timeWidth) annotation(
    Placement(transformation(origin = {16, -20}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-68, 72}, {-104, 72}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{-31.8, 72}, {-52, 72}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-53.6, 63.2}, {-53.6, 58.2}, {-54, 58.2}, {-54, 53}}, color = {0, 0, 127}));
  connect(FissionCore.y_pCore, plate.u_p) annotation(
    Line(points = {{35, 72}, {-10, 72}}, color = {0, 0, 127}));
  connect(fixed.flange, forceSensor1.flange_b) annotation(
    Line(points = {{-104, 72}, {-94, 72}, {-94, -20}, {-77, -20}}, color = {0, 127, 0}));
  connect(forceSensor1.flange_a, plate1.flange) annotation(
    Line(points = {{-61, -20}, {-46, -20}}, color = {0, 127, 0}));
  connect(forceSensor1.f, impluse1.u) annotation(
    Line(points = {{-63, -29}, {-63, -43}}, color = {0, 0, 127}));
  connect(pulse_p.y, plate1.u_p) annotation(
    Line(points = {{5, -20}, {-24, -20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 5e-07, Tolerance = 1e-06, Interval = 1.002e-09),
    Diagram(coordinateSystem(extent = {{-160, -80}, {160, 100}})));
end NuclearPulseEngine_Corr_01;
