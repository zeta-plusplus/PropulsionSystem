within PropulsionSystem.Examples.Engines.Transient;

model LycomO360turboCharged_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineFluid = Modelica.Media.Air.DryAirNasa;
  //package engineFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineFluid
  //-----
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0.0, offset = 0.056, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-180, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {160, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-103.5, -40.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cd_throttle(duration = 10, height = 0, offset = 0.6, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-190, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-310, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.5, w(fixed = false, start = 2000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {190, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-180, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 throttle(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-160, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineFluid, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-270, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder1(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-43.5, -40.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder2(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {16.5, -40.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_throttle(duration = 0.01, height = 0.2, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-180, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder3(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {76.5, -40.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-90, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-132, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.9) annotation(
    Placement(visible = true, transformation(origin = {130, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.W2hp W2hp annotation(
    Placement(visible = true, transformation(origin = {152, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.UnitConversion.Pa2inHg Pa2inHg annotation(
    Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 exhLine(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-248, 160}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta_exhLine(duration = 10, height = 0, offset = 2, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-280, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-150, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 0.05, w(fixed = true, start = 30000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {-220, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_trqLoad(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {240, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 2.0) annotation(
    Placement(visible = true, transformation(origin = {220, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {240, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {220, -56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor_crankshaft annotation(
    Placement(visible = true, transformation(origin = {106, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm_crankshaft annotation(
    Placement(visible = true, transformation(origin = {106, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm_turboCharger annotation(
    Placement(visible = true, transformation(origin = {-290, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor_turboCharger annotation(
    Placement(visible = true, transformation(origin = {-230, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineFluid, PRdes_paramInput = 5, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-220, 34}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-220, 136}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
equation
  connect(inertia2.flange_b, Cmp.flange_2) annotation(
    Line(points = {{-220, 60}, {-220, 44}}));
  connect(inertia2.flange_a, speedSensor_turboCharger.flange) annotation(
    Line(points = {{-220, 80}, {-220, 80}, {-220, 100}, {-220, 100}}));
  connect(Trb.flange_1, speedSensor_turboCharger.flange) annotation(
    Line(points = {{-220, 126}, {-220, 100}}));
  connect(to_rpm_turboCharger.u, speedSensor_turboCharger.w) annotation(
    Line(points = {{-278, 100}, {-241, 100}}, color = {0, 0, 127}));
  connect(exhLine.port_1, Trb.port_2) annotation(
    Line(points = {{-238, 160}, {-212, 160}, {-212, 142}, {-212, 142}}, color = {0, 127, 255}));
  connect(Trb.port_1, temperature.port) annotation(
    Line(points = {{-212, 130}, {-150, 130}}, color = {0, 127, 255}));
  connect(Cmp.port_2, throttle.port_1) annotation(
    Line(points = {{-212, 40}, {-170, 40}, {-170, 40}, {-170, 40}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Cmp.port_1) annotation(
    Line(points = {{-260, 0}, {-212, 0}, {-212, 28}, {-212, 28}}, color = {0, 127, 255}));
  connect(ramp_zeta_exhLine.y, exhLine.u_zeta) annotation(
    Line(points = {{-269, 180}, {-244, 180}, {-244, 171}}, color = {0, 0, 127}));
  connect(exhLine.port_2, Flt2Fluid.port_amb4sink) annotation(
    Line(points = {{-258, 160}, {-270, 160}, {-270, 10}, {-270, 10}}, color = {0, 127, 255}));
  connect(speedSensor_crankshaft.w, to_rpm_crankshaft.u) annotation(
    Line(points = {{106, -78}, {106, -78}, {106, -88}, {106, -88}}, color = {0, 0, 127}));
  connect(powerSensor1.power, W2hp.u) annotation(
    Line(points = {{152, -67}, {152, -67}, {152, -79}, {152, -79}}, color = {0, 0, 127}));
  connect(LossRotMech.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{140, -56}, {150, -56}}));
  connect(powerSensor1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{170, -56}, {180, -56}}));
  connect(torque1.tau, ramp_trqLoad.y) annotation(
    Line(points = {{232, -56}, {240, -56}, {240, -10}, {240, -10}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, torque1.flange) annotation(
    Line(points = {{200, -56}, {210, -56}, {210, -56}, {210, -56}}));
  connect(inertia1.flange_b, damper1.flange_a) annotation(
    Line(points = {{200, -56}, {204, -56}, {204, -90}, {210, -90}, {210, -90}}));
  connect(damper1.flange_b, fixed1.flange) annotation(
    Line(points = {{230, -90}, {240, -90}, {240, -90}, {240, -90}}));
  connect(speedSensor_crankshaft.flange, LossRotMech.flange_1) annotation(
    Line(points = {{106, -56}, {120, -56}}));
  connect(PistonCylinder3.flange_2, speedSensor_crankshaft.flange) annotation(
    Line(points = {{93, -56}, {106, -56}}));
  connect(temperature.port, pressure1.port) annotation(
    Line(points = {{-150, 130}, {-90, 130}, {-90, 130}, {-90, 130}}, color = {0, 127, 255}));
  connect(pressure1.port, PistonCylinder3.port_2) annotation(
    Line(points = {{-90, 130}, {93, 130}, {93, -24}}, color = {0, 127, 255}));
  connect(pressure1.port, PistonCylinder2.port_2) annotation(
    Line(points = {{-90, 130}, {33, 130}, {33, -24}}, color = {0, 127, 255}));
  connect(pressure1.port, PistonCylinder.port_2) annotation(
    Line(points = {{-90, 130}, {-87, 130}, {-87, -24}}, color = {0, 127, 255}));
  connect(pressure1.port, PistonCylinder1.port_2) annotation(
    Line(points = {{-90, 130}, {-27, 130}, {-27, -24}}, color = {0, 127, 255}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-299, -20}, {-288, -20}, {-288, 4}, {-281, 4}}, color = {0, 0, 127}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-299, 10}, {-290, 10}, {-290, 8}, {-281, 8}}, color = {0, 0, 127}));
  connect(ramp_Cd_throttle.y, throttle.u_Cd) annotation(
    Line(points = {{-179, 70}, {-168, 70}, {-168, 51}}, color = {0, 0, 127}));
  connect(ramp_throttle.y, throttle.u_kArea) annotation(
    Line(points = {{-169, 100}, {-162, 100}, {-162, 51}}, color = {0, 0, 127}));
  connect(throttle.port_2, pressure2.port) annotation(
    Line(points = {{-150, 40}, {-132, 40}}, color = {0, 127, 255}));
  connect(pressure2.p, Pa2inHg.u) annotation(
    Line(points = {{-143, 30}, {-150, 30}, {-150, 12}}, color = {0, 0, 127}));
  connect(pressure2.port, PistonCylinder3.port_1) annotation(
    Line(points = {{-132, 40}, {60, 40}, {60, -24}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder2.port_1) annotation(
    Line(points = {{-132, 40}, {0, 40}, {0, -24}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder.port_1) annotation(
    Line(points = {{-132, 40}, {-120, 40}, {-120, -24}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder1.port_1) annotation(
    Line(points = {{-132, 40}, {-60, 40}, {-60, -24}}, color = {0, 127, 255}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-169, -70}, {-158, -70}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, feedback1.u2) annotation(
    Line(points = {{-169, -100}, {-159.5, -100}, {-159.5, -100}, {-150, -100}, {-150, -89}, {-150, -89}, {-150, -78}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder3.u_fracAir) annotation(
    Line(points = {{-141, -70}, {44, -70}, {44, -31}, {58, -31}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder2.u_fracAir) annotation(
    Line(points = {{-141, -70}, {-12, -70}, {-12, -31}, {-2, -31}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-141, -70}, {-134, -70}, {-134, -31}, {-122, -31}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder1.u_fracAir) annotation(
    Line(points = {{-141, -70}, {-76, -70}, {-76, -31}, {-62, -31}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder2.u_fracFuel) annotation(
    Line(points = {{-169, -100}, {-6, -100}, {-6, -37}, {2, -37}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder3.u_fracFuel) annotation(
    Line(points = {{-169, -100}, {48, -100}, {48, -37}, {62, -37}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-169, -100}, {-128, -100}, {-128, -37}, {-118, -37}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder1.u_fracFuel) annotation(
    Line(points = {{-169, -100}, {-70, -100}, {-70, -37}, {-58, -37}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, PistonCylinder1.flange_1) annotation(
    Line(points = {{-87, -56}, {-60, -56}}));
  connect(PistonCylinder1.flange_2, PistonCylinder2.flange_1) annotation(
    Line(points = {{-27, -56}, {0, -56}}));
  connect(PistonCylinder2.flange_2, PistonCylinder3.flange_1) annotation(
    Line(points = {{33, -56}, {60, -56}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-320, -160}, {280, 200}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.1),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end LycomO360turboCharged_ex02;
