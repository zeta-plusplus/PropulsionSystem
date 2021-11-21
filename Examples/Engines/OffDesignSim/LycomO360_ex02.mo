within PropulsionSystem.Examples.Engines.OffDesignSim;

model LycomO360_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineFluid = Modelica.Media.Air.DryAirNasa;
  //package engineFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineFluid
  package liquidFuel= Modelica.Media.CompressibleLiquids.Common.LinearWater_pT;
  //redeclare package Medium = liquidFuel
  //-----
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0.0, offset = 0.056, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-190, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-364, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {150, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-103.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 2000, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-364, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-190, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-160, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 throttle(redeclare package Medium = engineFluid, diam_paramInput = 2.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-220, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineFluid, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-324, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder1(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-43.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder2(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {16.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_throttle(duration = 10, height = 0.25, offset = 0.75, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-310, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder3(redeclare package Medium = engineFluid, CR_paramInput = 8.5, VolDisp_paramInput = 5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {76.5, -39.8}, extent = {{-16.5, -19.8}, {16.5, 19.8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {210, -56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {230, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 0, offset = 2400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {230, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-87, 115}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-145, 35}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.9, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {119, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.W2hp W2hp annotation(
    Placement(visible = true, transformation(origin = {142, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.UnitConversion.Pa2inHg Pa2inHg annotation(
    Placement(visible = true, transformation(origin = {-155, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 exhLine(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 110}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-145, 115}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Shaft_eff(duration = 10, height = -0.0, offset = 0.63, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {98, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT fuelEnd(redeclare package Medium = liquidFuel, nPorts = 1, p = 101.325 * 1000, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-250, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT CarbResovoirOut(redeclare package Medium = liquidFuel, nPorts = 1, p = 2.0 * 101.325 * 1000, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-304, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-334, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.1 * 720 * environment.gravity)  annotation(
    Placement(visible = true, transformation(origin = {-370, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_mixture(duration = 10, height = -0.1, offset = 1, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-310, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cd_mixture(duration = 10, height = -0.0, offset = 0.6, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-310, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 MixtureValve(redeclare package Medium = liquidFuel, diam_paramInput = 0.00174) annotation(
    Placement(visible = true, transformation(origin = {-270, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_fuel(redeclare package Medium = liquidFuel) annotation(
    Placement(visible = true, transformation(origin = {-250, -40}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_fuel(redeclare package Medium = liquidFuel) annotation(
    Placement(visible = true, transformation(origin = {-250, -20}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_air(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-175, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_air(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-195, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-185, -37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-165, -15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {-165, -75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.Orifice00 Venturi(redeclare package Medium = engineFluid, diam_paramInput = 1.5 * 2.54 * 0.01)  annotation(
    Placement(visible = true, transformation(origin = {-260, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.m3perSec2USGperhour V_flow_fuel_usgph annotation(
    Placement(visible = true, transformation(origin = {-231, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.m3perSec2USGperhour V_flow_air_usgph annotation(
    Placement(visible = true, transformation(origin = {-175, 22}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_zeta_exhLine(k = 2)  annotation(
    Placement(visible = true, transformation(origin = {-140, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Cd_throttle(k = 0.7) annotation(
    Placement(visible = true, transformation(origin = {-340, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const_Cd_throttle.y, throttle.u_Cd) annotation(
    Line(points = {{-328, 130}, {-228, 130}, {-228, 52}, {-228, 52}}, color = {0, 0, 127}));
  connect(const_zeta_exhLine.y, exhLine.u_zeta) annotation(
    Line(points = {{-128, 150}, {-116, 150}, {-116, 122}, {-116, 122}}, color = {0, 0, 127}));
  connect(volumeFlowRate_air.V_flow, V_flow_air_usgph.u) annotation(
    Line(points = {{-175, 34.5}, {-175, 28}}, color = {0, 0, 127}));
  connect(volumeFlowRate_air.port_b, pressure2.port) annotation(
    Line(points = {{-170, 40}, {-144, 40}}, color = {0, 127, 255}));
  connect(massFlowRate_air.port_b, volumeFlowRate_air.port_a) annotation(
    Line(points = {{-190, 40}, {-180, 40}}, color = {0, 127, 255}));
  connect(volumeFlowRate_fuel.V_flow, V_flow_fuel_usgph.u) annotation(
    Line(points = {{-244, -20}, {-238, -20}, {-238, -20}, {-238, -20}}, color = {0, 0, 127}));
  connect(division1.y, PistonCylinder3.u_fracAir) annotation(
    Line(points = {{-159.5, -15}, {50, -15}, {50, -30}, {58, -30}}, color = {0, 0, 127}));
  connect(division1.y, PistonCylinder2.u_fracAir) annotation(
    Line(points = {{-159.5, -15}, {-12, -15}, {-12, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(division1.y, PistonCylinder1.u_fracAir) annotation(
    Line(points = {{-159.5, -15}, {-70, -15}, {-70, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(division1.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-159.5, -15}, {-134, -15}, {-134, -30}, {-122, -30}}, color = {0, 0, 127}));
  connect(massFlowRate_air.m_flow, division1.u1) annotation(
    Line(points = {{-195, 34.5}, {-195, -12}, {-171, -12}}, color = {0, 0, 127}));
  connect(add2.y, division1.u2) annotation(
    Line(points = {{-179, -37}, {-176, -37}, {-176, -18}, {-171, -18}}, color = {0, 0, 127}));
  connect(division2.y, PistonCylinder3.u_fracFuel) annotation(
    Line(points = {{-159.5, -75}, {48, -75}, {48, -36}, {62, -36}}, color = {0, 0, 127}));
  connect(division2.y, PistonCylinder2.u_fracFuel) annotation(
    Line(points = {{-159.5, -75}, {-10, -75}, {-10, -36}, {2, -36}}, color = {0, 0, 127}));
  connect(division2.y, PistonCylinder1.u_fracFuel) annotation(
    Line(points = {{-159.5, -75}, {-68, -75}, {-68, -36}, {-58, -36}}, color = {0, 0, 127}));
  connect(division2.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-159.5, -75}, {-138, -75}, {-138, -36}, {-118, -36}}, color = {0, 0, 127}));
  connect(add2.y, division2.u2) annotation(
    Line(points = {{-179, -37}, {-178, -37}, {-178, -78}, {-171, -78}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.m_flow, division2.u1) annotation(
    Line(points = {{-244.5, -40}, {-214, -40}, {-214, -72}, {-171, -72}}, color = {0, 0, 127}));
  connect(volumeFlowRate_fuel.port_b, fuelEnd.ports[1]) annotation(
    Line(points = {{-250, -15}, {-250, 0}}, color = {0, 127, 255}));
  connect(Venturi.y_ps_th, fuelEnd.p_in) annotation(
    Line(points = {{-250, 34}, {-242, 34}, {-242, 22}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.port_b, volumeFlowRate_fuel.port_a) annotation(
    Line(points = {{-250, -35}, {-250, -25}}, color = {0, 127, 255}));
  connect(MixtureValve.port_2, massFlowRate_fuel.port_a) annotation(
    Line(points = {{-260, -70}, {-250, -70}, {-250, -45}}, color = {0, 127, 255}));
  connect(massFlowRate_fuel.m_flow, add2.u2) annotation(
    Line(points = {{-244.5, -40}, {-191, -40}}, color = {0, 0, 127}));
  connect(Venturi.port_2, throttle.port_1) annotation(
    Line(points = {{-250, 40}, {-230, 40}, {-230, 40}, {-230, 40}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Venturi.port_1) annotation(
    Line(points = {{-314, 40}, {-270, 40}, {-270, 40}, {-270, 40}}, color = {0, 127, 255}));
  connect(exhLine.port_1, pressure1.port) annotation(
    Line(points = {{-110, 110}, {-87, 110}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder.port_2) annotation(
    Line(points = {{-87, 110}, {-87, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder1.port_2) annotation(
    Line(points = {{-87, 110}, {-27, 110}, {-27, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder2.port_2) annotation(
    Line(points = {{-87, 110}, {33, 110}, {33, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, PistonCylinder3.port_2) annotation(
    Line(points = {{-87, 110}, {93, 110}, {93, -23}}, color = {255, 85, 0}));
  connect(temperature.port, exhLine.port_2) annotation(
    Line(points = {{-145, 110}, {-130, 110}}, color = {255, 85, 0}));
  connect(Flt2Fluid.port_amb4sink, temperature.port) annotation(
    Line(points = {{-324, 50}, {-324, 110}, {-145, 110}}, color = {255, 85, 0}));
  connect(ramp_throttle.y, throttle.u_kArea) annotation(
    Line(points = {{-299, 150}, {-222, 150}, {-222, 51}}, color = {0, 0, 127}));
  connect(CarbResovoirOut.ports[1], MixtureValve.port_1) annotation(
    Line(points = {{-294, -70}, {-280, -70}}, color = {0, 127, 255}));
  connect(ramp_Cd_mixture.y, MixtureValve.u_Cd) annotation(
    Line(points = {{-299, -100}, {-278, -100}, {-278, -81}}, color = {0, 0, 127}));
  connect(ramp_mixture.y, MixtureValve.u_kArea) annotation(
    Line(points = {{-298, -130}, {-272, -130}, {-272, -81}}, color = {0, 0, 127}));
  connect(throttle.port_2, massFlowRate_air.port_a) annotation(
    Line(points = {{-210, 40}, {-200, 40}}, color = {0, 127, 255}));
  connect(massFlowRate_air.m_flow, add2.u1) annotation(
    Line(points = {{-195, 34.5}, {-195, -34}, {-191, -34}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb4source, pressure3.port) annotation(
    Line(points = {{-314, 48}, {-290, 48}, {-290, 0}}, color = {0, 127, 255}));
  connect(pressure3.p, add1.u1) annotation(
    Line(points = {{-301, -10}, {-353, -10}, {-353, -56}, {-345, -56}}, color = {0, 0, 127}));
  connect(pressure2.p, Pa2inHg.u) annotation(
    Line(points = {{-150.5, 35}, {-155, 35}, {-155, 26}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, feedback1.u2) annotation(
    Line(points = {{-179, -130}, {-169.5, -130}, {-169.5, -130}, {-160, -130}, {-160, -119}, {-160, -119}, {-160, -108}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-179, -100}, {-168, -100}}, color = {0, 0, 127}));
  connect(pressure2.port, PistonCylinder3.port_1) annotation(
    Line(points = {{-145, 40}, {60, 40}, {60, -23}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder2.port_1) annotation(
    Line(points = {{-145, 40}, {0, 40}, {0, -23}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder.port_1) annotation(
    Line(points = {{-145, 40}, {-120, 40}, {-120, -23}}, color = {0, 127, 255}));
  connect(pressure2.port, PistonCylinder1.port_1) annotation(
    Line(points = {{-145, 40}, {-60, 40}, {-60, -23}}, color = {0, 127, 255}));
  connect(add1.y, CarbResovoirOut.p_in) annotation(
    Line(points = {{-323, -62}, {-316, -62}}, color = {0, 0, 127}));
  connect(const1.y, add1.u2) annotation(
    Line(points = {{-359, -68}, {-347, -68}}, color = {0, 0, 127}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-353, 20}, {-342, 20}, {-342, 44}, {-335, 44}}, color = {0, 0, 127}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-353, 50}, {-344, 50}, {-344, 48}, {-335, 48}}, color = {0, 0, 127}));
  connect(LossRotMech.u_eff, ramp_Shaft_eff.y) annotation(
    Line(points = {{125, -63}, {125, -90}, {110, -90}}, color = {0, 0, 127}));
  connect(PistonCylinder3.flange_2, LossRotMech.flange_1) annotation(
    Line(points = {{94, -56}, {109, -56}}));
  connect(LossRotMech.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{129, -56}, {140, -56}}));
  connect(powerSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{160, -56}, {200, -56}, {200, -56}, {200, -56}}));
  connect(powerSensor1.power, W2hp.u) annotation(
    Line(points = {{142, -66}, {142, -66}, {142, -78}, {142, -78}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, PistonCylinder1.flange_1) annotation(
    Line(points = {{-87, -56}, {-60, -56}}));
  connect(PistonCylinder1.flange_2, PistonCylinder2.flange_1) annotation(
    Line(points = {{-27, -56}, {0, -56}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{230, -40}, {230, -40}, {230, -56}, {222, -56}, {222, -56}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{230, -10}, {230, -10}, {230, -18}, {230, -18}}, color = {0, 0, 127}));
  connect(PistonCylinder2.flange_2, PistonCylinder3.flange_1) annotation(
    Line(points = {{33, -56.3}, {60, -56.3}}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-380, -140}, {260, 200}})),
    __OpenModelica_commandLineOptions = "",
  Icon);
end LycomO360_ex02;
