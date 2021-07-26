within PropulsionSystem.Examples.Engines.OffDesignSim;

model LycomO360_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineFluid = Modelica.Media.Air.DryAirNasa;
  //package engineFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineFluid
  //-----
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0.0, offset = 0.056, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-200, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-240, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {150, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-103.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cd_throttle(duration = 10, height = 0, offset = 0.6, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-220, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-240, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-200, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 throttle(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-170, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineFluid, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-200, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder1(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-43.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder2(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {16.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_throttle(duration = 10, height = 0.3, offset = 0.7, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-190, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder3(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {76.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {210, -56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {230, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 2700, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {230, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.9) annotation(
    Placement(visible = true, transformation(origin = {119, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.W2hp W2hp annotation(
    Placement(visible = true, transformation(origin = {142, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.UnitConversion.Pa2inHg Pa2inHg annotation(
    Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 exhLine(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta_exhLine(duration = 10, height = 0, offset = 2, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-140, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(exhLine.port_1, pressure1.port) annotation(
    Line(points = {{-110, 60}, {-90, 60}, {-90, 60}, {-90, 60}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder.port_2) annotation(
    Line(points = {{-90, 60}, {-87, 60}, {-87, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder1.port_2) annotation(
    Line(points = {{-90, 60}, {-27, 60}, {-27, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder2.port_2) annotation(
    Line(points = {{-90, 60}, {33, 60}, {33, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder3.port_2) annotation(
    Line(points = {{-90, 60}, {93, 60}, {93, -23}}, color = {255, 85, 0}));
  connect(powerSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{160, -56}, {200, -56}, {200, -56}, {200, -56}}));
  connect(temperature.port, exhLine.port_2) annotation(
    Line(points = {{-150, 60}, {-130, 60}, {-130, 60}, {-130, 60}}, color = {0, 127, 255}));
  connect(ramp_zeta_exhLine.y, exhLine.u_zeta) annotation(
    Line(points = {{-128, 110}, {-116, 110}, {-116, 71}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb4sink, temperature.port) annotation(
    Line(points = {{-200, 50}, {-200, 60}, {-150, 60}}, color = {0, 127, 255}));
  connect(pressure2.p, Pa2inHg.u) annotation(
    Line(points = {{-150, 30}, {-160, 30}, {-160, 12}, {-160, 12}}, color = {0, 0, 127}));
  connect(powerSensor1.power, W2hp.u) annotation(
    Line(points = {{142, -66}, {142, -66}, {142, -78}, {142, -78}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder1.u_fracFuel) annotation(
    Line(points = {{-188, -100}, {-70, -100}, {-70, -36}, {-58, -36}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder1.u_fracAir) annotation(
    Line(points = {{-160, -70}, {-76, -70}, {-76, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, PistonCylinder1.flange_1) annotation(
    Line(points = {{-87, -56}, {-60, -56}}));
  connect(PistonCylinder1.flange_2, PistonCylinder2.flange_1) annotation(
    Line(points = {{-27, -56}, {0, -56}}));
  connect(pressure2.port, PistonCylinder1.port_1) annotation(
    Line(points = {{-140, 40}, {-60, 40}, {-60, -23}}, color = {0, 127, 255}));
  connect(feedback1.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-161, -70}, {-134, -70}, {-134, -30}, {-122, -30}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-189, -100}, {-128, -100}, {-128, -36}, {-120, -36}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder3.u_fracFuel) annotation(
    Line(points = {{-188, -100}, {48, -100}, {48, -36}, {60, -36}, {60, -36}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder2.u_fracAir) annotation(
    Line(points = {{-160, -70}, {-12, -70}, {-12, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, PistonCylinder2.u_fracFuel) annotation(
    Line(points = {{-188, -100}, {-6, -100}, {-6, -36}, {0, -36}, {0, -36}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder3.u_fracAir) annotation(
    Line(points = {{-160, -70}, {44, -70}, {44, -30}, {58, -30}, {58, -30}}, color = {0, 0, 127}));
  connect(pressure2.port, PistonCylinder.port_1) annotation(
    Line(points = {{-140, 40}, {-120, 40}, {-120, -23}}, color = {0, 127, 255}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{230, -40}, {230, -40}, {230, -56}, {222, -56}, {222, -56}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{230, -10}, {230, -10}, {230, -18}, {230, -18}}, color = {0, 0, 127}));
  connect(LossRotMech.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{129, -56}, {140, -56}}));
  connect(PistonCylinder3.flange_2, LossRotMech.flange_1) annotation(
    Line(points = {{94, -56}, {109, -56}}));
  connect(PistonCylinder2.flange_2, PistonCylinder3.flange_1) annotation(
    Line(points = {{33, -56.3}, {60, -56.3}}));
  connect(pressure2.port, PistonCylinder2.port_1) annotation(
    Line(points = {{-140, 40}, {0, 40}, {0, -23}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder3.port_1) annotation(
    Line(points = {{-140, 40}, {60, 40}, {60, -23}}, color = {0, 127, 255}));
  connect(ramp_fracFuel.y, feedback1.u2) annotation(
    Line(points = {{-189, -100}, {-179.5, -100}, {-179.5, -100}, {-170, -100}, {-170, -89}, {-170, -89}, {-170, -78}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-189, -70}, {-178, -70}}, color = {0, 0, 127}));
  connect(throttle.port_2, pressure2.port) annotation(
    Line(points = {{-160, 40}, {-140, 40}, {-140, 40}, {-140, 40}}, color = {0, 127, 255}));
  connect(ramp_Cd_throttle.y, throttle.u_Cd) annotation(
    Line(points = {{-209, 90}, {-178, 90}, {-178, 51}}, color = {0, 0, 127}));
  connect(ramp_throttle.y, throttle.u_kArea) annotation(
    Line(points = {{-179, 110}, {-172, 110}, {-172, 51}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, throttle.port_1) annotation(
    Line(points = {{-190, 40}, {-180, 40}}, color = {0, 127, 255}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-229, 20}, {-218, 20}, {-218, 44}, {-211, 44}}, color = {0, 0, 127}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-229, 50}, {-220, 50}, {-220, 48}, {-211, 48}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-260, -140}, {260, 140}})),
    __OpenModelica_commandLineOptions = "");
end LycomO360_ex01;
