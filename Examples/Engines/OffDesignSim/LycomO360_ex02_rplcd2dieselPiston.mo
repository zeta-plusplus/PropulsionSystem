within PropulsionSystem.Examples.Engines.OffDesignSim;

model LycomO360_ex02_rplcd2dieselPiston
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
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {150, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-364, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 inletRestriction(redeclare package Medium = engineFluid, diam_paramInput = 3.5 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-220, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineFluid, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-324, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {210, -55}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {230, -28}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-87, 115}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-145, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.9, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {119, -55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.W2hp W2hp annotation(
    Placement(visible = true, transformation(origin = {142, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.UnitConversion.Pa2inHg Pa2inHg annotation(
    Placement(visible = true, transformation(origin = {-155, 40}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 exhLine(redeclare package Medium = engineFluid, diam_paramInput = 1.4 * 2.54 * 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 110}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-145, 115}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT fuelEnd(redeclare package Medium = liquidFuel, nPorts = 1, p = 101.325 * 1000, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-230, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT CarbResovoirOut(redeclare package Medium = liquidFuel, nPorts = 1, p = 2.0 * 101.325 * 1000, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-310, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fuelThrottle(duration = 10, height = 0.0, offset = 0.75, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-310, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 fuelThrottle(redeclare package Medium = liquidFuel, diam_paramInput = 0.000753) annotation(
    Placement(visible = true, transformation(origin = {-270, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_fuel(redeclare package Medium = liquidFuel) annotation(
    Placement(visible = true, transformation(origin = {-250, -45}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_fuel(redeclare package Medium = liquidFuel) annotation(
    Placement(visible = true, transformation(origin = {-250, -25}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_air(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-175, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_air(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-195, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-185, -37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_fracAir annotation(
    Placement(visible = true, transformation(origin = {-165, -15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-165, -75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.m3perSec2USGperhour V_flow_fuel_usgph annotation(
    Placement(visible = true, transformation(origin = {-231, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.m3perSec2USGperhour V_flow_air_usgph annotation(
    Placement(visible = true, transformation(origin = {-175, 42}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_zeta_exhLine(k = 2)  annotation(
    Placement(visible = true, transformation(origin = {-140, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Cd_throttle(k = 0.7) annotation(
    Placement(visible = true, transformation(origin = {-340, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Cd_mixture(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-310, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Shaft_eff(k = 0.63) annotation(
    Placement(visible = true, transformation(origin = {100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Nmech(k = 2400) annotation(
    Placement(visible = true, transformation(origin = {230, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_MN(k = 0.0) annotation(
    Placement(visible = true, transformation(origin = {-364, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_kA_throttle(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-310, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealDieselMV01 pistonCylinder(redeclare package Medium = engineFluid, CR_paramInput = 18, VolDisp_paramInput = 1.48 *5916 * 10 ^ (-6) / 4.0) annotation(
    Placement(visible = true, transformation(origin = {-103.333, -40}, extent = {{-16.6667, -20}, {16.6667, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealDieselMV01 pistonCylinder1(redeclare package Medium = engineFluid, CR_paramInput = pistonCylinder.CR_paramInput, VolDisp_paramInput = pistonCylinder.VolDisp_paramInput) annotation(
    Placement(visible = true, transformation(origin = {-43.3333, -40}, extent = {{-16.6667, -20}, {16.6667, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealDieselMV01 pistonCylinder2(redeclare package Medium = engineFluid, CR_paramInput = pistonCylinder.CR_paramInput, VolDisp_paramInput = pistonCylinder.VolDisp_paramInput) annotation(
    Placement(visible = true, transformation(origin = {16.6667, -40}, extent = {{-16.6667, -20}, {16.6667, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealDieselMV01 pistonCylinder3(redeclare package Medium = engineFluid, CR_paramInput = pistonCylinder.CR_paramInput, VolDisp_paramInput = pistonCylinder.VolDisp_paramInput) annotation(
    Placement(visible = true, transformation(origin = {76.6667, -40}, extent = {{-16.6667, -20}, {16.6667, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = 60)  annotation(
    Placement(visible = true, transformation(origin = {-340, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Division massSpecificPower annotation(
    Placement(visible = true, transformation(origin = {202, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division PSFC annotation(
    Placement(visible = true, transformation(origin = {202, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const_Cd_throttle.y, inletRestriction.u_Cd) annotation(
    Line(points = {{-328, 130}, {-228, 130}, {-228, 71}}, color = {0, 0, 127}));
  connect(const_zeta_exhLine.y, exhLine.u_zeta) annotation(
    Line(points = {{-128, 150}, {-116, 150}, {-116, 122}, {-116, 122}}, color = {0, 0, 127}));
  connect(volumeFlowRate_air.V_flow, V_flow_air_usgph.u) annotation(
    Line(points = {{-175, 54.5}, {-175, 48}}, color = {0, 0, 127}));
  connect(volumeFlowRate_air.port_b, pressure2.port) annotation(
    Line(points = {{-170, 60}, {-144, 60}}, color = {0, 127, 255}));
  connect(massFlowRate_air.port_b, volumeFlowRate_air.port_a) annotation(
    Line(points = {{-190, 60}, {-180, 60}}, color = {0, 127, 255}));
  connect(volumeFlowRate_fuel.V_flow, V_flow_fuel_usgph.u) annotation(
    Line(points = {{-244.5, -25}, {-238.5, -25}, {-238.5, -25}, {-238.5, -25}}, color = {0, 0, 127}));
  connect(massFlowRate_air.m_flow, division_fracAir.u1) annotation(
    Line(points = {{-195, 54.5}, {-195, -12}, {-171, -12}}, color = {0, 0, 127}));
  connect(add2.y, division_fracAir.u2) annotation(
    Line(points = {{-179, -37}, {-176, -37}, {-176, -18}, {-171, -18}}, color = {0, 0, 127}));
  connect(add2.y, division_fracFuel.u2) annotation(
    Line(points = {{-179, -37}, {-178, -37}, {-178, -78}, {-171, -78}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.m_flow, division_fracFuel.u1) annotation(
    Line(points = {{-244.5, -45}, {-214, -45}, {-214, -72}, {-171, -72}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.port_b, volumeFlowRate_fuel.port_a) annotation(
    Line(points = {{-250, -40}, {-250, -30}}, color = {0, 127, 255}));
  connect(fuelThrottle.port_2, massFlowRate_fuel.port_a) annotation(
    Line(points = {{-260, -70}, {-250, -70}, {-250, -50}}, color = {0, 127, 255}));
  connect(massFlowRate_fuel.m_flow, add2.u2) annotation(
    Line(points = {{-244.5, -45}, {-217.75, -45}, {-217.75, -40}, {-191, -40}}, color = {0, 0, 127}));
  connect(exhLine.port_1, pressure1.port) annotation(
    Line(points = {{-110, 110}, {-87, 110}}, color = {255, 85, 0}));
  connect(temperature.port, exhLine.port_2) annotation(
    Line(points = {{-145, 110}, {-130, 110}}, color = {255, 85, 0}));
  connect(Flt2Fluid.port_amb4sink, temperature.port) annotation(
    Line(points = {{-324, 70}, {-324, 110}, {-145, 110}}, color = {255, 85, 0}));
  connect(CarbResovoirOut.ports[1], fuelThrottle.port_1) annotation(
    Line(points = {{-300, -70}, {-280, -70}}, color = {0, 127, 255}));
  connect(ramp_fuelThrottle.y, fuelThrottle.u_kArea) annotation(
    Line(points = {{-298, -130}, {-272, -130}, {-272, -81}}, color = {0, 0, 127}));
  connect(inletRestriction.port_2, massFlowRate_air.port_a) annotation(
    Line(points = {{-210, 60}, {-200, 60}}, color = {0, 127, 255}));
  connect(massFlowRate_air.m_flow, add2.u1) annotation(
    Line(points = {{-195, 54.5}, {-195, -34}, {-191, -34}}, color = {0, 0, 127}));
  connect(pressure2.p, Pa2inHg.u) annotation(
    Line(points = {{-150.5, 55}, {-155, 55}, {-155, 46}}, color = {0, 0, 127}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-353, 70}, {-344, 70}, {-344, 68}, {-335, 68}}, color = {0, 0, 127}));
  connect(LossRotMech.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{129, -55}, {140, -55}}));
  connect(powerSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{160, -55}, {200, -55}}));
  connect(powerSensor1.power, W2hp.u) annotation(
    Line(points = {{142, -66}, {142, -79}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{230, -39}, {230, -55}, {222, -55}}, color = {0, 0, 127}));
  connect(const_Cd_mixture.y, fuelThrottle.u_Cd) annotation(
    Line(points = {{-298, -100}, {-278, -100}, {-278, -80}}, color = {0, 0, 127}));
  connect(const_Shaft_eff.y, LossRotMech.u_eff) annotation(
    Line(points = {{111, -90}, {125, -90}, {125, -62}}, color = {0, 0, 127}));
  connect(const_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{230, -9}, {230, -16}}, color = {0, 0, 127}));
  connect(Flt2Fluid.u_MN, const_MN.y) annotation(
    Line(points = {{-335, 64}, {-345, 64}, {-345, 40}, {-353, 40}}, color = {0, 0, 127}));
  connect(const_kA_throttle.y, inletRestriction.u_kArea) annotation(
    Line(points = {{-298, 150}, {-222, 150}, {-222, 71}}, color = {0, 0, 127}));
  connect(pistonCylinder.port_2, pressure1.port) annotation(
    Line(points = {{-87, -23}, {-87, 110}}, color = {255, 85, 0}));
  connect(pressure2.port, pistonCylinder.port_1) annotation(
    Line(points = {{-145, 60}, {-120, 60}, {-120, -23}}, color = {0, 127, 255}));
  connect(pistonCylinder3.flange_2, LossRotMech.flange_1) annotation(
    Line(points = {{93, -55}, {109, -55}}));
  connect(pressure2.port, pistonCylinder1.port_1) annotation(
    Line(points = {{-145, 60}, {-60, 60}, {-60, -23}}, color = {0, 127, 255}));
  connect(pressure2.port, pistonCylinder2.port_1) annotation(
    Line(points = {{-145, 60}, {0, 60}, {0, -23}}, color = {0, 127, 255}));
  connect(pressure2.port, pistonCylinder3.port_1) annotation(
    Line(points = {{-145, 60}, {60, 60}, {60, -23}}, color = {0, 127, 255}));
  connect(pistonCylinder2.flange_2, pistonCylinder3.flange_1) annotation(
    Line(points = {{33, -55}, {60, -55}}));
  connect(pistonCylinder1.flange_2, pistonCylinder2.flange_1) annotation(
    Line(points = {{-27, -55}, {0, -55}}));
  connect(pistonCylinder.flange_2, pistonCylinder1.flange_1) annotation(
    Line(points = {{-87, -55}, {-60, -55}}));
  connect(pressure1.port, pistonCylinder1.port_2) annotation(
    Line(points = {{-86, 110}, {-27, 110}, {-27, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, pistonCylinder2.port_2) annotation(
    Line(points = {{-86, 110}, {33, 110}, {33, -23}}, color = {255, 85, 0}));
  connect(pressure1.port, pistonCylinder3.port_2) annotation(
    Line(points = {{-86, 110}, {93, 110}, {93, -23}}, color = {255, 85, 0}));
  connect(Flt2Fluid.port_inlet, inletRestriction.port_1) annotation(
    Line(points = {{-314, 60}, {-230, 60}}, color = {0, 127, 255}));
  connect(fuelEnd.ports[1], volumeFlowRate_fuel.port_b) annotation(
    Line(points = {{-240, 0}, {-250, 0}, {-250, -20}}, color = {0, 127, 255}));
  connect(pistonCylinder.y_p2, fuelEnd.p_in) annotation(
    Line(points = {{-103, -22.5}, {-103, 8}, {-218, 8}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb4source, pressure3.port) annotation(
    Line(points = {{-314, 68}, {-290, 68}, {-290, 0}}, color = {0, 127, 255}));
  connect(pressure3.p, gain.u) annotation(
    Line(points = {{-300, -10}, {-340, -10}, {-340, -18}}, color = {0, 0, 127}));
  connect(gain.y, CarbResovoirOut.p_in) annotation(
    Line(points = {{-340, -40}, {-340, -62}, {-322, -62}}, color = {0, 0, 127}));
  connect(division_fracFuel.y, pistonCylinder.u_fracFuel) annotation(
    Line(points = {{-160, -74}, {-132, -74}, {-132, -36}, {-118, -36}}, color = {0, 0, 127}));
  connect(division_fracFuel.y, pistonCylinder1.u_fracFuel) annotation(
    Line(points = {{-160, -74}, {-70, -74}, {-70, -36}, {-58, -36}}, color = {0, 0, 127}));
  connect(division_fracFuel.y, pistonCylinder2.u_fracFuel) annotation(
    Line(points = {{-160, -74}, {-8, -74}, {-8, -36}, {2, -36}}, color = {0, 0, 127}));
  connect(division_fracFuel.y, pistonCylinder3.u_fracFuel) annotation(
    Line(points = {{-160, -74}, {50, -74}, {50, -36}, {62, -36}}, color = {0, 0, 127}));
  connect(division_fracAir.y, pistonCylinder.u_fracAir) annotation(
    Line(points = {{-160, -14}, {-136, -14}, {-136, -30}, {-122, -30}}, color = {0, 0, 127}));
  connect(division_fracAir.y, pistonCylinder1.u_fracAir) annotation(
    Line(points = {{-160, -14}, {-72, -14}, {-72, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(division_fracAir.y, pistonCylinder2.u_fracAir) annotation(
    Line(points = {{-160, -14}, {-14, -14}, {-14, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(division_fracAir.y, pistonCylinder3.u_fracAir) annotation(
    Line(points = {{-160, -14}, {46, -14}, {46, -30}, {58, -30}}, color = {0, 0, 127}));
  connect(massFlowRate_air.m_flow, massSpecificPower.u2) annotation(
    Line(points = {{-195, 54.5}, {-195, 26}, {172, 26}, {172, -126}, {190, -126}}, color = {0, 0, 127}));
  connect(W2hp.y, massSpecificPower.u1) annotation(
    Line(points = {{142, -100}, {142, -114}, {190, -114}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.m_flow, PSFC.u1) annotation(
    Line(points = {{-244.5, -45}, {-232, -45}, {-232, -144}, {190, -144}}, color = {0, 0, 127}));
  connect(W2hp.y, PSFC.u2) annotation(
    Line(points = {{142, -100}, {142, -156}, {190, -156}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.050025),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-380, -160}, {260, 200}})),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization, --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 -d= --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 ",
  Icon);
end LycomO360_ex02_rplcd2dieselPiston;
