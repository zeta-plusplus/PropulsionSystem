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
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 1000, offset = 0, startTime = 10) annotation(
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
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-200, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
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
    Placement(visible = true, transformation(origin = {-140, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Shaft_eff(duration = 10, height = -0.0, offset = 0.65, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {108, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.RelativePressure relativePressure1(redeclare package Medium = fuelLiquid) annotation(
    Placement(visible = true, transformation(origin = {-294, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_intakeAir(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-180, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlow_fuel(redeclare package Medium = fuelLiquid) annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlow_fuel(redeclare package Medium = fuelLiquid) annotation(
    Placement(visible = true, transformation(origin = {-250, -62}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT fuelEnd(redeclare package Medium = fuelLiquid, nPorts = 1, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Valves.ValveLinear MixtureValve(redeclare package Medium = fuelLiquid, dp_nominal(displayUnit = "Pa") = (101.325 - 85.34) * 1000 + head_fuelResovior.k, m_flow_nominal = 847.9296e-5)  annotation(
    Placement(visible = true, transformation(origin = {-280, -80}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT fuelResoviorExit(redeclare package Medium = fuelLiquid, nPorts = 1, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-310, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_mixture(duration = 10, height = -0.4, offset = 1.0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-280, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-330, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-340, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant head_fuelResovior(k = 0.1 * environment.gravity * 720)  annotation(
    Placement(visible = true, transformation(origin = {-380, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-160, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division fracAir annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division fracFuel annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant p_fuelResovoir(k = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-380, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add1.y, fuelResoviorExit.p_in) annotation(
    Line(points = {{-329, -72}, {-322, -72}}, color = {0, 0, 127}));
  connect(p_fuelResovoir.y, add1.u2) annotation(
    Line(points = {{-369, -78}, {-352, -78}}, color = {0, 0, 127}));
  connect(head_fuelResovior.y, add1.u1) annotation(
    Line(points = {{-368, -40}, {-366, -40}, {-366, -66}, {-352, -66}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder3.u_fracFuel) annotation(
    Line(points = {{-98, -80}, {62, -80}, {62, -36}, {70, -36}, {70, -36}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder2.u_fracFuel) annotation(
    Line(points = {{-98, -80}, {14, -80}, {14, -36}, {22, -36}, {22, -36}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder1.u_fracFuel) annotation(
    Line(points = {{-98, -80}, {-36, -80}, {-36, -36}, {-28, -36}, {-28, -36}}, color = {0, 0, 127}));
  connect(add2.y, fracFuel.u2) annotation(
    Line(points = {{-149, -86}, {-122, -86}}, color = {0, 0, 127}));
  connect(add2.y, fracAir.u2) annotation(
    Line(points = {{-149, -86}, {-142, -86}, {-142, -16}, {-122, -16}}, color = {0, 0, 127}));
  connect(massFlow_fuel.m_flow, add2.u2) annotation(
    Line(points = {{-238, -30}, {-194, -30}, {-194, -92}, {-172, -92}}, color = {0, 0, 127}));
  connect(massFlow_intakeAir.m_flow, add2.u1) annotation(
    Line(points = {{-180, 28}, {-180, -80}, {-172, -80}}, color = {0, 0, 127}));
  connect(fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-99, -80}, {-88, -80}, {-88, -36}, {-78, -36}}, color = {0, 0, 127}));
  connect(massFlow_fuel.m_flow, fracFuel.u1) annotation(
    Line(points = {{-238, -30}, {-128, -30}, {-128, -74}, {-122, -74}}, color = {0, 0, 127}));
  connect(fracAir.y, PistonCylinder3.u_fracAir) annotation(
    Line(points = {{-98, -10}, {62, -10}, {62, -30}, {66, -30}}, color = {0, 0, 127}));
  connect(fracAir.y, PistonCylinder2.u_fracAir) annotation(
    Line(points = {{-98, -10}, {14, -10}, {14, -30}, {18, -30}, {18, -30}}, color = {0, 0, 127}));
  connect(massFlow_intakeAir.port_b, PistonCylinder2.port_1) annotation(
    Line(points = {{-170, 40}, {20, 40}, {20, -23}}, color = {0, 127, 255}));
  connect(PistonCylinder2.flange_2, PistonCylinder3.flange_1) annotation(
    Line(points = {{53, -56}, {68, -56}}));
  connect(PistonCylinder1.flange_2, PistonCylinder2.flange_1) annotation(
    Line(points = {{3, -56}, {20, -56}}));
  connect(pressure1.port, PistonCylinder2.port_2) annotation(
    Line(points = {{-90, 60}, {53, 60}, {53, -23}}, color = {255, 85, 0}));
  connect(massFlow_intakeAir.port_b, PistonCylinder3.port_1) annotation(
    Line(points = {{-170, 40}, {68, 40}, {68, -23}}, color = {0, 127, 255}));
  connect(pressure1.port, PistonCylinder3.port_2) annotation(
    Line(points = {{-90, 60}, {101, 60}, {101, -23}}, color = {255, 85, 0}));
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
  connect(massFlow_intakeAir.port_b, PistonCylinder1.port_1) annotation(
    Line(points = {{-170, 40}, {-30, 40}, {-30, -23}}, color = {0, 127, 255}));
  connect(PistonCylinder.flange_2, PistonCylinder1.flange_1) annotation(
    Line(points = {{-47, -56}, {-30, -56}}));
  connect(pressure1.port, PistonCylinder1.port_2) annotation(
    Line(points = {{-90, 60}, {3, 60}, {3, -23}}, color = {255, 85, 0}));
  connect(fracAir.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-98, -10}, {-86, -10}, {-86, -30}, {-82, -30}}, color = {0, 0, 127}));
  connect(massFlow_intakeAir.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-170, 40}, {-80, 40}, {-80, -23}}, color = {0, 127, 255}));
  connect(pressure1.port, PistonCylinder.port_2) annotation(
    Line(points = {{-90, 60}, {-47, 60}, {-47, -23}}, color = {255, 85, 0}));
  connect(massFlow_intakeAir.m_flow, fracAir.u1) annotation(
    Line(points = {{-180, 28}, {-180, -4}, {-122, -4}}, color = {0, 0, 127}));
  connect(pressure2.port, massFlow_intakeAir.port_a) annotation(
    Line(points = {{-200, 40}, {-190, 40}}, color = {0, 127, 255}));
  connect(pressure3.port, Flt2Fluid.port_amb4source) annotation(
    Line(points = {{-320, 10}, {-310, 10}, {-310, 48}, {-330, 48}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb4sink, temperature.port) annotation(
    Line(points = {{-340, 50}, {-340, 50}, {-340, 60}, {-140, 60}, {-140, 60}}, color = {255, 85, 0}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-369, 50}, {-360, 50}, {-360, 48}, {-351, 48}}, color = {0, 0, 127}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-369, 20}, {-358, 20}, {-358, 44}, {-351, 44}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, throttle.port_1) annotation(
    Line(points = {{-330, 40}, {-280, 40}}, color = {0, 127, 255}));
  connect(temperature.port, exhLine.port_2) annotation(
    Line(points = {{-140, 60}, {-130, 60}}, color = {255, 85, 0}));
  connect(ramp_Cd_throttle.y, throttle.u_Cd) annotation(
    Line(points = {{-309, 130}, {-278, 130}, {-278, 51}}, color = {0, 0, 127}));
  connect(ramp_throttle.y, throttle.u_kArea) annotation(
    Line(points = {{-279, 150}, {-272, 150}, {-272, 51}}, color = {0, 0, 127}));
  connect(ramp_mixture.y, MixtureValve.opening) annotation(
    Line(points = {{-280, -98}, {-280, -98}, {-280, -88}, {-280, -88}}, color = {0, 0, 127}));
  connect(MixtureValve.port_a, relativePressure1.port_a) annotation(
    Line(points = {{-290, -80}, {-294, -80}, {-294, -40}}, color = {0, 127, 255}));
  connect(relativePressure1.port_b, massFlow_fuel.port_b) annotation(
    Line(points = {{-294, -20}, {-294, -16}, {-250, -16}, {-250, -20}}, color = {0, 127, 255}));
  connect(fuelResoviorExit.ports[1], MixtureValve.port_a) annotation(
    Line(points = {{-300, -80}, {-290, -80}}, color = {0, 127, 255}));
  connect(MixtureValve.port_b, volumeFlow_fuel.port_a) annotation(
    Line(points = {{-270, -80}, {-250, -80}, {-250, -72}, {-250, -72}}, color = {0, 127, 255}));
  connect(massFlow_fuel.port_b, fuelEnd.ports[1]) annotation(
    Line(points = {{-250, -20}, {-250, -20}, {-250, -10}, {-250, -10}}, color = {0, 127, 255}));
  connect(volumeFlow_fuel.port_b, massFlow_fuel.port_a) annotation(
    Line(points = {{-250, -52}, {-250, -40}}, color = {0, 127, 255}));
  connect(pressure2.p, fuelEnd.p_in) annotation(
    Line(points = {{-210, 30}, {-242, 30}, {-242, 12}}, color = {0, 0, 127}));
  connect(throttle.port_2, pressure2.port) annotation(
    Line(points = {{-260, 40}, {-200, 40}}, color = {0, 127, 255}));
  connect(pressure2.p, Pa2inHg.u) annotation(
    Line(points = {{-211, 30}, {-220, 30}, {-220, 12}}, color = {0, 0, 127}));
  connect(exhLine.port_1, pressure1.port) annotation(
    Line(points = {{-110, 60}, {-90, 60}, {-90, 60}, {-90, 60}}, color = {255, 85, 0}));
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
