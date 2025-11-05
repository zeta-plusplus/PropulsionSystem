within PropulsionSystem.Examples.EngineeringStudies;

model NuclearPulseEngine_Corr_01
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //----------
  parameter units.Time GlbPar_startTime = 7e-8;
  parameter units.Time GlbPar_timeWidth = 1e-7;
  parameter units.Time GlbPar_periodRepeat = 2;
  parameter Integer GlbPar_nperiod = -1;
  parameter units.Pressure GlbPar_pulse_p_amp = 2.94e17;
  //----------
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate annotation(
    Placement(transformation(origin = {-36.4, 72}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-104, 72}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-76, 72}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-70, 45}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
  Modelica.Blocks.Math.Mean meanForce(f = 1000) annotation(
    Placement(transformation(origin = {-70, 22}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  NuclearSystem.Kinetics.Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {40, 72}, extent = {{20, -20}, {-20, 20}})));
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate1 annotation(
    Placement(transformation(origin = {-34.4, -20}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor1 annotation(
    Placement(transformation(origin = {-69, -20}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Continuous.Integrator impluse1 annotation(
    Placement(transformation(origin = {-63, -45}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
  Modelica.Blocks.Math.Mean meanForce1(f = 1000) annotation(
    Placement(transformation(origin = {-63, -68}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_pCore_cor(T = 1.7e-8) annotation(
    Placement(transformation(origin = {34, -20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = GlbPar_pulse_p_amp, nperiod = GlbPar_nperiod, period = GlbPar_periodRepeat, startTime = GlbPar_startTime, width = GlbPar_timeWidth) annotation(
    Placement(transformation(origin = {68, -20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain Pa2PPa_firstOrder_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {5, 5}, extent = {{5, -5}, {-5, 5}})));
equation
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-84, 72}, {-104, 72}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{-47.8, 72}, {-68, 72}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-70, 63}, {-70, 53}}, color = {0, 0, 127}));
  connect(impluse.y, meanForce.u) annotation(
    Line(points = {{-70, 37.3}, {-70, 30.3}}, color = {0, 0, 127}));
  connect(FissionCore.y_pCore, plate.u_p) annotation(
    Line(points = {{19, 72}, {-26, 72}}, color = {0, 0, 127}));
  connect(fixed.flange, forceSensor1.flange_b) annotation(
    Line(points = {{-104, 72}, {-94, 72}, {-94, -20}, {-77, -20}}, color = {0, 127, 0}));
  connect(forceSensor1.flange_a, plate1.flange) annotation(
    Line(points = {{-61, -20}, {-46, -20}}, color = {0, 127, 0}));
  connect(impluse1.y, meanForce1.u) annotation(
    Line(points = {{-63, -53}, {-63, -59.7}}, color = {0, 0, 127}));
  connect(forceSensor1.f, impluse1.u) annotation(
    Line(points = {{-63, -29}, {-63, -37}}, color = {0, 0, 127}));
  connect(pulse_p.y, firstOrder_pCore_cor.u) annotation(
    Line(points = {{57, -20}, {45, -20}}, color = {0, 0, 127}));
  connect(Pa2PPa_firstOrder_pCore_cor.u, firstOrder_pCore_cor.y) annotation(
    Line(points = {{11, 5}, {16, 5}, {16, -20}, {24, -20}}, color = {0, 0, 127}));
  connect(firstOrder_pCore_cor.y, plate1.u_p) annotation(
    Line(points = {{23, -20}, {-24, -20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 2e-06, Tolerance = 1e-06, Interval = 1.0005e-09),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end NuclearPulseEngine_Corr_01;
