within PropulsionSystem.Examples.EngineeringStudies;

model NuclearPulseEngineByCor_01
  extends Modelica.Icons.Example;
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate annotation(
    Placement(transformation(origin = {-68.4, 40}, extent = {{-11.4, -40}, {11.4, 40}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-140, 40}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {-114, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {-106, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Mean meanForce(f = 1000) annotation(
    Placement(transformation(origin = {-106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_pCore_cor(T = 1.3e-8) annotation(
    Placement(transformation(origin = {62, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = 2.95e17, nperiod = 5, period = 2, startTime = 7e-8, width = 1e-7) annotation(
    Placement(transformation(origin = {96, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_pCore_cor(use_reset = false) annotation(
    Placement(transformation(origin = {24, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain Pa2PPa_firstOrder_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {33, 65}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Gain Pa2PPa_integ_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {-9, 65}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_vCoreExp_cor(T = 1.2e-7) annotation(
    Placement(transformation(origin = {42, -14}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_vCoreExp_cor(use_reset = true) annotation(
    Placement(transformation(origin = {-38, -14}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_der_r(amplitude = 7.6e6, nperiod = 5, period = 2, startTime = 7e-8, width = 0.2e-6) annotation(
    Placement(transformation(origin = {76, -14}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain mps2Mmps_firstOrder_vCoreExp_cor(k = 1e-6) annotation(
    Placement(transformation(origin = {-11, 12}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Logical.LessEqual lessEqual0 annotation(
    Placement(transformation(origin = {-2, -44}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(transformation(origin = {42, -52}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(forceSensor.flange_b, fixed.flange) annotation(
    Line(points = {{-124, 40}, {-140, 40}}, color = {0, 127, 0}));
  connect(plate.flange, forceSensor.flange_a) annotation(
    Line(points = {{-80, 40}, {-104.6, 40}}, color = {0, 127, 0}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{-106, 29}, {-106, 13}}, color = {0, 0, 127}));
  connect(impluse.y, meanForce.u) annotation(
    Line(points = {{-106, -9}, {-106, -19}}, color = {0, 0, 127}));
  connect(pulse_p.y, firstOrder_pCore_cor.u) annotation(
    Line(points = {{85, 40}, {73, 40}}, color = {0, 0, 127}));
  connect(firstOrder_pCore_cor.y, integ_pCore_cor.u) annotation(
    Line(points = {{51, 40}, {36, 40}}, color = {0, 0, 127}));
  connect(Pa2PPa_firstOrder_pCore_cor.u, firstOrder_pCore_cor.y) annotation(
    Line(points = {{39, 65}, {44, 65}, {44, 40}, {52, 40}}, color = {0, 0, 127}));
  connect(integ_pCore_cor.y, Pa2PPa_integ_pCore_cor.u) annotation(
    Line(points = {{13, 40}, {5, 40}, {5, 65}, {-3, 65}}, color = {0, 0, 127}));
  connect(integ_pCore_cor.y, plate.u_p) annotation(
    Line(points = {{13, 40}, {-58, 40}}, color = {0, 0, 127}));
  connect(firstOrder_vCoreExp_cor.y, integ_vCoreExp_cor.u) annotation(
    Line(points = {{31, -14}, {-26, -14}}, color = {0, 0, 127}));
  connect(firstOrder_vCoreExp_cor.u, pulse_der_r.y) annotation(
    Line(points = {{54, -14}, {65, -14}}, color = {0, 0, 127}));
  connect(mps2Mmps_firstOrder_vCoreExp_cor.u, firstOrder_vCoreExp_cor.y) annotation(
    Line(points = {{-5, 12}, {3, 12}, {3, -14}, {31, -14}}, color = {0, 0, 127}));
  connect(const.y, lessEqual0.u2) annotation(
    Line(points = {{31, -52}, {10, -52}}, color = {0, 0, 127}));
  connect(lessEqual0.y, integ_vCoreExp_cor.reset) annotation(
    Line(points = {{-13, -44}, {-44, -44}, {-44, -26}}, color = {255, 0, 255}));
  connect(firstOrder_vCoreExp_cor.y, lessEqual0.u1) annotation(
    Line(points = {{31, -14}, {23, -14}, {23, -44}, {9, -44}}, color = {0, 0, 127}));
  connect(integ_vCoreExp_cor.y, plate.u_rCore) annotation(
    Line(points = {{-49, -14}, {-65, -14}, {-65, 13}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 1e-09),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end NuclearPulseEngineByCor_01;
