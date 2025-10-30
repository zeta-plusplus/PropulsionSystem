within PropulsionSystem.Examples.temp;

model NuclearPulseEngineByCor_01
  extends Modelica.Icons.Example;
  //----------
  import units= Modelica.Units.SI;
  //----------
  parameter units.Time GlbPar_startTime= 0;
  parameter units.Time GlbPar_timeWidth=1e-7;
  parameter units.Time GlbPar_periodRepeat=1;
  parameter Integer GlbPar_nperiod=-1;
  parameter units.Pressure GlbPar_pulse_p_amp= 2.95e17;
  parameter units.Velocity GlbPar_pulse_der_r_amp= 7.6e6;
  //----------
  
  Modelica.Blocks.Continuous.FirstOrder firstOrder_pCore_cor(T = 1.3e-8) annotation(
    Placement(transformation(origin = {98, 38}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = GlbPar_pulse_p_amp, nperiod = GlbPar_nperiod, period = GlbPar_periodRepeat, startTime = GlbPar_startTime, width = GlbPar_timeWidth) annotation(
    Placement(transformation(origin = {132, 38}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_pCore_cor(use_reset = false) annotation(
    Placement(transformation(origin = {24, 69}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain Pa2PPa_firstOrder_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {69, 63}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Gain Pa2PPa_integ_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {-1, 69}, extent = {{5, -5}, {-5, 5}})));
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate annotation(
    Placement(transformation(origin = {-68.4, 38}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-136, 38}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-110, 38}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-102, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Mean meanForce(f = 1000) annotation(
    Placement(transformation(origin = {-102, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(pulse_p.y, firstOrder_pCore_cor.u) annotation(
    Line(points = {{121, 38}, {109, 38}}, color = {0, 0, 127}));
  connect(firstOrder_pCore_cor.y, integ_pCore_cor.u) annotation(
    Line(points = {{87, 38}, {43.5, 38}, {43.5, 69}, {36, 69}}, color = {0, 0, 127}));
  connect(Pa2PPa_firstOrder_pCore_cor.u, firstOrder_pCore_cor.y) annotation(
    Line(points = {{75, 63}, {80, 63}, {80, 38}, {88, 38}}, color = {0, 0, 127}));
  connect(integ_pCore_cor.y, Pa2PPa_integ_pCore_cor.u) annotation(
    Line(points = {{13, 69}, {5, 69}}, color = {0, 0, 127}));
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-120, 38}, {-136, 38}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{-80, 38}, {-100.4, 38}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-102, 27}, {-102, 11}}, color = {0, 0, 127}));
  connect(impluse.y, meanForce.u) annotation(
    Line(points = {{-102, -11}, {-102, -21}}, color = {0, 0, 127}));
  connect(firstOrder_pCore_cor.y, plate.u_p) annotation(
    Line(points = {{88, 38}, {-58, 38}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end NuclearPulseEngineByCor_01;
