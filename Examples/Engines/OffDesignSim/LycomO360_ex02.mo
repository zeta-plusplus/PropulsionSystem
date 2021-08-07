within PropulsionSystem.Examples.Engines.OffDesignSim;

model LycomO360_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineFluid = Modelica.Media.Air.DryAirNasa;
  //package engineFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineFluid
  package fuelLiquid=Modelica.Media.Incompressible.Examples.Glycol47;
  //redeclare package Medium = fuelLiquid
  //-----
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-380, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {160, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-63.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cd_throttle(duration = 10, height = 0, offset = 0.7, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-320, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 3000, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-380, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 throttle(redeclare package Medium = engineFluid, diam_paramInput = 1.52 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-270, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineFluid, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder1(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-13.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder2(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {36.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_throttle(duration = 10, height = -0.0, offset = 0.75, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder3(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {84.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {210, -56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {230, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 2400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {230, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-85, 65}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-205, 35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.9, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {129, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.W2hp W2hp annotation(
    Placement(visible = true, transformation(origin = {152, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.UnitConversion.Pa2inHg Pa2inHg annotation(
    Placement(visible = true, transformation(origin = {-220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 exhLine(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta_exhLine(duration = 10, height = 0, offset = 2, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-140, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-140, 65}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Shaft_eff(duration = 10, height = -0.0, offset = 0.65, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {108, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.RelativePressure relativePressure1(redeclare package Medium = fuelLiquid) annotation(
    Placement(visible = true, transformation(origin = {-294, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_intakeAir(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-165, 40}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_fuel(redeclare package Medium = fuelLiquid) annotation(
    Placement(visible = true, transformation(origin = {-250, -35}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlow_fuel(redeclare package Medium = fuelLiquid) annotation(
    Placement(visible = true, transformation(origin = {-250, -55}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT fuelEnd(redeclare package Medium = fuelLiquid, nPorts = 1, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Sources.Boundary_pT fuelResoviorExit(redeclare package Medium = fuelLiquid, nPorts = 1, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-310, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_mixture(duration = 10, height = -0.2, offset = 1.0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-272, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-330, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-340, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant head_fuelResovior(k = 0.1 * environment.gravity * 720)  annotation(
    Placement(visible = true, transformation(origin = {-380, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-150, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division fracAir annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division fracFuel annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 MixtureValve(redeclare package Medium = fuelLiquid, diam_paramInput = 0.00164)  annotation(
    Placement(visible = true, transformation(origin = {-270, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-300, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRateAir(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-185, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(volumeFlow_fuel.port_b, massFlow_fuel.port_a) annotation(
    Line(points = {{-250, -50}, {-250, -40}}, color = {0, 127, 255}));
  connect(MixtureValve.port_2, volumeFlow_fuel.port_a) annotation(
    Line(points = {{-260, -80}, {-250, -80}, {-250, -60}}, color = {0, 127, 255}));
  connect(massFlow_fuel.port_b, fuelEnd.ports[1]) annotation(
    Line(points = {{-250, -30}, {-250, -10}}, color = {0, 127, 255}));
  connect(relativePressure1.port_b, massFlow_fuel.port_b) annotation(
    Line(points = {{-294, -20}, {-294, -16}, {-250, -16}, {-250, -30}}, color = {0, 127, 255}));
  connect(massFlow_fuel.m_flow, fracFuel.u1) annotation(
    Line(points = {{-244.5, -35}, {-128, -35}, {-128, -74}, {-122, -74}}, color = {0, 0, 127}));
  connect(massFlow_fuel.m_flow, add2.u2) annotation(
    Line(points = {{-244.5, -35}, {-194, -35}, {-194, -92}, {-162, -92}}, color = {0, 0, 127}));
  connect(temperature.port, exhLine.port_2) annotation(
    Line(points = {{-140, 60}, {-130, 60}}, color = {255, 85, 0}));
  connect(Flt2Fluid.port_amb4sink, temperature.port) annotation(
    Line(points = {{-340, 50}, {-340, 60}, {-140, 60}}, color = {255, 85, 0}));
  connect(exhLine.port_1, pressure1.port) annotation(
    Line(points = {{-110, 60}, {-85, 60}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder.port_2) annotation(
    Line(points = {{-85, 60}, {-47, 60}, {-47, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder1.port_2) annotation(
    Line(points = {{-85, 60}, {3, 60}, {3, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder3.port_2) annotation(
    Line(points = {{-85, 60}, {101, 60}, {101, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder2.port_2) annotation(
    Line(points = {{-85, 60}, {53, 60}, {53, -23}}, color = {255, 85, 0}));
  connect(pressure2.port, volumeFlowRateAir.port_a) annotation(
    Line(points = {{-204, 40}, {-190, 40}, {-190, 40}, {-190, 40}}, color = {0, 127, 255}));
  connect(pressure2.p, Pa2inHg.u) annotation(
    Line(points = {{-210.5, 35}, {-220, 35}, {-220, 12}}, color = {0, 0, 127}));
  connect(throttle.port_2, pressure2.port) annotation(
    Line(points = {{-260, 40}, {-205, 40}}, color = {0, 127, 255}));
  connect(pressure2.p, fuelEnd.p_in) annotation(
    Line(points = {{-210.5, 35}, {-242, 35}, {-242, 12}}, color = {0, 0, 127}));
  connect(volumeFlowRateAir.port_b, massFlow_intakeAir.port_a) annotation(
    Line(points = {{-180, 40}, {-170, 40}, {-170, 40}, {-170, 40}}, color = {0, 127, 255}));
  connect(massFlow_intakeAir.m_flow, fracAir.u1) annotation(
    Line(points = {{-165, 34.5}, {-165, -4}, {-122, -4}}, color = {0, 0, 127}));
  connect(massFlow_intakeAir.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-160, 40}, {-80, 40}, {-80, -23}}, color = {0, 127, 255}));
  connect(massFlow_intakeAir.port_b, PistonCylinder1.port_1) annotation(
    Line(points = {{-160, 40}, {-30, 40}, {-30, -23}}, color = {0, 127, 255}));
  connect(massFlow_intakeAir.port_b, PistonCylinder3.port_1) annotation(
    Line(points = {{-160, 40}, {68, 40}, {68, -23}}, color = {0, 127, 255}));
  connect(massFlow_intakeAir.port_b, PistonCylinder2.port_1) annotation(
    Line(points = {{-160, 40}, {20, 40}, {20, -23}}, color = {0, 127, 255}));
  connect(massFlow_intakeAir.m_flow, add2.u1) annotation(
    Line(points = {{-165, 34.5}, {-165, -80}, {-162, -80}}, color = {0, 0, 127}));
  connect(add2.y, fracAir.u2) annotation(
    Line(points = {{-139, -86}, {-132, -86}, {-132, -16}, {-122, -16}}, color = {0, 0, 127}));
  connect(add2.y, fracFuel.u2) annotation(
    Line(points = {{-139, -86}, {-122, -86}}, color = {0, 0, 127}));
  connect(const.y, MixtureValve.u_Cd) annotation(
    Line(points = {{-300, -108}, {-300, -108}, {-300, -102}, {-278, -102}, {-278, -92}, {-278, -92}}, color = {0, 0, 127}));
  connect(ramp_mixture.y, MixtureValve.u_kArea) annotation(
    Line(points = {{-272, -108}, {-272, -108}, {-272, -92}, {-272, -92}}, color = {0, 0, 127}));
  connect(MixtureValve.port_1, relativePressure1.port_a) annotation(
    Line(points = {{-280, -80}, {-294, -80}, {-294, -40}, {-294, -40}}, color = {0, 127, 255}));
  connect(fuelResoviorExit.ports[1], MixtureValve.port_1) annotation(
    Line(points = {{-300, -80}, {-280, -80}, {-280, -80}, {-280, -80}}, color = {0, 127, 255}));
  connect(head_fuelResovior.y, add1.u2) annotation(
    Line(points = {{-368, -78}, {-354, -78}, {-354, -78}, {-352, -78}}, color = {0, 0, 127}));
  connect(pressure3.p, add1.u1) annotation(
    Line(points = {{-330, 0}, {-364, 0}, {-364, -66}, {-352, -66}, {-352, -66}}, color = {0, 0, 127}));
  connect(add1.y, fuelResoviorExit.p_in) annotation(
    Line(points = {{-329, -72}, {-322, -72}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder3.u_fracFuel) annotation(
    Line(points = {{-98, -80}, {62, -80}, {62, -36}, {70, -36}, {70, -36}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder2.u_fracFuel) annotation(
    Line(points = {{-98, -80}, {14, -80}, {14, -36}, {22, -36}, {22, -36}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder1.u_fracFuel) annotation(
    Line(points = {{-98, -80}, {-36, -80}, {-36, -36}, {-28, -36}, {-28, -36}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-99, -80}, {-88, -80}, {-88, -36}, {-78, -36}}, color = {0, 0, 127}));
  connect(fracAir.y, PistonCylinder3.u_fracAir) annotation(
    Line(points = {{-98, -10}, {62, -10}, {62, -30}, {66, -30}}, color = {0, 0, 127}));
  connect(fracAir.y, PistonCylinder2.u_fracAir) annotation(
    Line(points = {{-98, -10}, {14, -10}, {14, -30}, {18, -30}, {18, -30}}, color = {0, 0, 127}));
  connect(PistonCylinder2.flange_2, PistonCylinder3.flange_1) annotation(
    Line(points = {{53, -56}, {68, -56}}));
  connect(PistonCylinder1.flange_2, PistonCylinder2.flange_1) annotation(
    Line(points = {{3, -56}, {20, -56}}));
  connect(PistonCylinder3.flange_2, LossRotMech.flange_1) annotation(
    Line(points = {{101, -56}, {119, -56}}));
  connect(LossRotMech.u_eff, ramp_Shaft_eff.y) annotation(
    Line(points = {{135, -63}, {135, -90}, {120, -90}}, color = {0, 0, 127}));
  connect(powerSensor1.power, W2hp.u) annotation(
    Line(points = {{152, -67}, {152, -67}, {152, -79}, {152, -79}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{170, -56}, {200, -56}}));
  connect(LossRotMech.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{139, -56}, {150, -56}}));
  connect(fracAir.y, PistonCylinder1.u_fracAir) annotation(
    Line(points = {{-98, -10}, {-38, -10}, {-38, -30}, {-32, -30}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, PistonCylinder1.flange_1) annotation(
    Line(points = {{-47, -56}, {-30, -56}}));
  connect(fracAir.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-98, -10}, {-86, -10}, {-86, -30}, {-82, -30}}, color = {0, 0, 127}));
  connect(pressure3.port, Flt2Fluid.port_amb4source) annotation(
    Line(points = {{-320, 10}, {-310, 10}, {-310, 48}, {-330, 48}}, color = {0, 127, 255}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-369, 50}, {-360, 50}, {-360, 48}, {-351, 48}}, color = {0, 0, 127}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-369, 20}, {-358, 20}, {-358, 44}, {-351, 44}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, throttle.port_1) annotation(
    Line(points = {{-330, 40}, {-280, 40}}, color = {0, 127, 255}));
  connect(ramp_Cd_throttle.y, throttle.u_Cd) annotation(
    Line(points = {{-309, 130}, {-278, 130}, {-278, 51}}, color = {0, 0, 127}));
  connect(ramp_throttle.y, throttle.u_kArea) annotation(
    Line(points = {{-279, 150}, {-272, 150}, {-272, 51}}, color = {0, 0, 127}));
  connect(ramp_zeta_exhLine.y, exhLine.u_zeta) annotation(
    Line(points = {{-128, 110}, {-116, 110}, {-116, 71}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{230, -40}, {230, -40}, {230, -56}, {222, -56}, {222, -56}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{230, -10}, {230, -10}, {230, -18}, {230, -18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-400, -140}, {260, 180}})),
    __OpenModelica_commandLineOptions = "");
end LycomO360_ex02;
