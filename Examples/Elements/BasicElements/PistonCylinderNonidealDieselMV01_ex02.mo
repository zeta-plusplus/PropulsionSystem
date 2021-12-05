within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderNonidealDieselMV01_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineFluid = Modelica.Media.Air.DryAirNasa;
  //package engineFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineFluid
  package liquidFuel= Modelica.Media.CompressibleLiquids.Common.LinearWater_pT;
  //redeclare package Medium = liquidFuel
  //-----
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-210, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-250, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_trq(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {56, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 Orifice(redeclare package Medium = Modelica.Media.Air.DryAirNasa, AmechTh_paramInput = Modelica.Constants.pi / 4.0 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta(duration = 10, height = 0, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-190, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 Orifice1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, AmechTh_paramInput = Modelica.Constants.pi / 4.0 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta1(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 0 * 1000, offset = 101.325 * 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-250, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 5e-2, w(fixed = true, start = 2000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 5e-2) annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealDieselMV01 PistonCylinder(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-20, -12}, extent = {{-20, -24}, {20, 24}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fuelThrottle(duration = 10, height = 0.0, offset = 0.75, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-200, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_fuel(redeclare package Medium = liquidFuel) annotation(
    Placement(visible = true, transformation(origin = {-140, -35}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT fuelStart(redeclare package Medium = liquidFuel, nPorts = 1, p = 2.0 * 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-200, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure3(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-170, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const_Cd_mixture(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-200, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_fracAir annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT fuelEnd(redeclare package Medium = liquidFuel, nPorts = 1, p = 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-87, -27}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_fuel(redeclare package Medium = liquidFuel) annotation(
    Placement(visible = true, transformation(origin = {-140, -15}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain(k = 56) annotation(
    Placement(visible = true, transformation(origin = {-224, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Division division_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-59, -44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.OrificeVariableAreaCd00 fuelThrottle(redeclare package Medium = liquidFuel, diam_paramInput = 0.0001) annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.UnitConversion.m3perSec2USGperhour V_flow_fuel_usgph annotation(
    Placement(visible = true, transformation(origin = {-121, -15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_air(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
equation
  connect(fuelThrottle.port_2, massFlowRate_fuel.port_a) annotation(
    Line(points = {{-150, -60}, {-140, -60}, {-140, -40}}, color = {0, 127, 255}));
  connect(const_Cd_mixture.y, fuelThrottle.u_Cd) annotation(
    Line(points = {{-189, -90}, {-168, -90}, {-168, -71}}, color = {0, 0, 127}));
  connect(fuelStart.ports[1], fuelThrottle.port_1) annotation(
    Line(points = {{-190, -60}, {-170, -60}}, color = {0, 127, 255}));
  connect(ramp_fuelThrottle.y, fuelThrottle.u_kArea) annotation(
    Line(points = {{-189, -120}, {-162, -120}, {-162, -71}}, color = {0, 0, 127}));
  connect(ramp_zeta1.y, Orifice1.u_zeta) annotation(
    Line(points = {{22, 50}, {26, 50}, {26, 21}}, color = {0, 0, 127}));
  connect(Orifice1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{40, 10}, {56, 10}, {56, 50}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{30, -30}, {40, -30}, {40, -30}, {40, -30}}));
  connect(inertia1.flange_b, damper1.flange_a) annotation(
    Line(points = {{60, -30}, {64, -30}, {64, -60}, {70, -60}, {70, -60}}));
  connect(torque1.tau, ramp_trq.y) annotation(
    Line(points = {{92, -30}, {100, -30}, {100, -30}, {100, -30}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, torque1.flange) annotation(
    Line(points = {{60, -30}, {70, -30}, {70, -30}, {70, -30}}));
  connect(damper1.flange_b, fixed1.flange) annotation(
    Line(points = {{90, -60}, {110, -60}, {110, -60}, {110, -60}}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-239, 70}, {-231, 70}, {-231, 58}, {-222, 58}}, color = {0, 0, 127}));
  connect(ramp_zeta.y, Orifice.u_zeta) annotation(
    Line(points = {{-179, 80}, {-154, 80}, {-154, 61}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-239, 30}, {-235, 30}, {-235, 54}, {-222, 54}}, color = {0, 0, 127}));
  connect(PistonCylinder.port_2, Orifice1.port_1) annotation(
    Line(points = {{0, 8}, {10, 8}, {10, 10}, {20, 10}}, color = {0, 127, 255}));
  connect(PistonCylinder.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{0, -30}, {10, -30}}));
  connect(fuelEnd.ports[1], volumeFlowRate_fuel.port_b) annotation(
    Line(points = {{-140, 10}, {-140, -10}}, color = {0, 127, 255}));
  connect(add2.y, division_fracAir.u2) annotation(
    Line(points = {{-81.5, -27}, {-72.5, -27}, {-72.5, -3}, {-66, -3}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.m_flow, division_fracFuel.u1) annotation(
    Line(points = {{-134.5, -35}, {-104, -35}, {-104, -41}, {-65, -41}}, color = {0, 0, 127}));
  connect(gain.y, fuelStart.p_in) annotation(
    Line(points = {{-224, -31}, {-224, -53}, {-212, -53}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.m_flow, add2.u2) annotation(
    Line(points = {{-134.5, -35}, {-107.75, -35}, {-107.75, -30}, {-93, -30}}, color = {0, 0, 127}));
  connect(massFlowRate_fuel.port_b, volumeFlowRate_fuel.port_a) annotation(
    Line(points = {{-140, -30}, {-140, -20}}, color = {0, 127, 255}));
  connect(add2.y, division_fracFuel.u2) annotation(
    Line(points = {{-81.5, -27}, {-76.5, -27}, {-76.5, -47}, {-65, -47}}, color = {0, 0, 127}));
  connect(volumeFlowRate_fuel.V_flow, V_flow_fuel_usgph.u) annotation(
    Line(points = {{-134.5, -15}, {-128.5, -15}, {-128.5, -15}, {-128.5, -15}}, color = {0, 0, 127}));
  connect(Orifice.port_2, massFlowRate_air.port_a) annotation(
    Line(points = {{-140, 50}, {-100, 50}}, color = {0, 127, 255}));
  connect(massFlowRate_air.port_b, PistonCylinder.port_1) annotation(
    Line(points = {{-80, 50}, {-40, 50}, {-40, 8}}, color = {0, 127, 255}));
  connect(massFlowRate_air.m_flow, division_fracAir.u1) annotation(
    Line(points = {{-90, 40}, {-90, 3}, {-66, 3}}, color = {0, 0, 127}));
  connect(division_fracAir.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-54, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(fuelEnd.p_in, PistonCylinder.y_p2) annotation(
    Line(points = {{-118, 18}, {-20, 18}, {-20, 10}}, color = {0, 0, 127}));
  connect(division_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-53.5, -44}, {-48, -44}, {-48, -8}, {-38, -8}}, color = {0, 0, 127}));
  connect(massFlowRate_air.m_flow, add2.u1) annotation(
    Line(points = {{-90, 40}, {-90, -8}, {-104, -8}, {-104, -24}, {-92, -24}}, color = {0, 0, 127}));
  connect(boundary.ports[1], pressure3.port) annotation(
    Line(points = {{-200, 50}, {-170, 50}}, color = {0, 127, 255}));
  connect(pressure3.port, Orifice.port_1) annotation(
    Line(points = {{-170, 50}, {-160, 50}}, color = {0, 127, 255}));
  connect(pressure3.p, gain.u) annotation(
    Line(points = {{-180, 40}, {-196, 40}, {-196, 10}, {-224, 10}, {-224, -8}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-260, -140}, {120, 100}})),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization, --maxMixedDeterminedIndex=1000, --maxSizeLinearTearing=400, --maxSizeNonlinearTearing=600 ");
end PistonCylinderNonidealDieselMV01_ex02;
