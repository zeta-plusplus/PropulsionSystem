within PropulsionSystem.Examples.EngineeringStudies;

model NuclearPulseEngineByCor_01
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //----------
  parameter units.Time GlbPar_startTime = 10;
  parameter units.Time GlbPar_timeWidth = 1e-7;
  parameter units.Time GlbPar_periodRepeat = 10;
  parameter Integer GlbPar_nperiod = -1;
  parameter units.Pressure GlbPar_pulse_p_amp = 2.94e17;
  //----------
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate annotation(
    Placement(transformation(origin = {35.6, 52}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-128, 52}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-72, 52}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-66, 11}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_pCore_cor(T = 1.7e-8) annotation(
    Placement(transformation(origin = {90, 52}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = GlbPar_pulse_p_amp, nperiod = GlbPar_nperiod, period = GlbPar_periodRepeat, startTime = GlbPar_startTime, width = GlbPar_timeWidth) annotation(
    Placement(transformation(origin = {124, 52}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain Pa2PPa_firstOrder_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {61, 73}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Division meanThrust annotation(
    Placement(transformation(origin = {-40, -12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = time) annotation(
    Placement(transformation(origin = {-130, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation(
    Placement(transformation(origin = {-102, -18}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(transformation(origin = {-72, -18}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(transformation(origin = {-65, -33}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.ContinuousMean continuousMean annotation(
    Placement(transformation(origin = {-8.35, -11.9286}, extent = {{-8.5, -7.65}, {8.5, 7.65}})));
  Modelica.Blocks.Math.ContinuousMean continuousMean1 annotation(
    Placement(transformation(origin = {-44.35, 27.0714}, extent = {{-6.5, -6.65}, {6.5, 6.65}})));
equation
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-80, 52}, {-128, 52}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{24, 52}, {-64, 52}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-65.6, 43.2}, {-65.6, 19.2}}, color = {0, 0, 127}));
  connect(pulse_p.y, firstOrder_pCore_cor.u) annotation(
    Line(points = {{113, 52}, {101, 52}}, color = {0, 0, 127}));
  connect(Pa2PPa_firstOrder_pCore_cor.u, firstOrder_pCore_cor.y) annotation(
    Line(points = {{67, 73}, {72, 73}, {72, 52}, {79, 52}}, color = {0, 0, 127}));
  connect(plate.u_p, firstOrder_pCore_cor.y) annotation(
    Line(points = {{46, 52}, {80.05, 52}}, color = {0, 0, 127}));
  connect(realExpression.y, greaterThreshold.u) annotation(
    Line(points = {{-119, -18}, {-107, -18}}, color = {0, 0, 127}));
  connect(greaterThreshold.y, switch1.u2) annotation(
    Line(points = {{-97.6, -18}, {-81.6, -18}}, color = {255, 0, 255}));
  connect(realExpression.y, switch1.u1) annotation(
    Line(points = {{-119, -18}, {-115, -18}, {-115, -12}, {-82, -12}}, color = {0, 0, 127}));
  connect(const.y, switch1.u3) annotation(
    Line(points = {{-59.5, -33}, {-55.5, -33}, {-55.5, -24}, {-82, -24}}, color = {0, 0, 127}));
  connect(meanThrust.u1, impluse.y) annotation(
    Line(points = {{-52, -6}, {-66, -6}, {-66, 3}}, color = {0, 0, 127}));
  connect(switch1.y, meanThrust.u2) annotation(
    Line(points = {{-63.2, -18}, {-52.2, -18}}, color = {0, 0, 127}));
  connect(meanThrust.y, continuousMean.u) annotation(
    Line(points = {{-29, -12}, {-19, -12}}, color = {0, 0, 127}));
  connect(continuousMean1.u, forceSensor.f) annotation(
    Line(points = {{-52.15, 27.0714}, {-66.15, 27.0714}, {-66.15, 43.0714}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-09, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end NuclearPulseEngineByCor_01;
