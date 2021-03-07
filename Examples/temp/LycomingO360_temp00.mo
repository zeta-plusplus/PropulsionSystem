within PropulsionSystem.Examples.temp;

model LycomingO360_temp00
  extends Modelica.Icons.Example;
  //-----
  package engineFluid = Modelica.Media.Air.DryAirNasa;
  //package engineFluid = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineFluid
  //-----
  inner Modelica.Fluid.System system(allowFlowReversal = false) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineFluid, T = 15 + 273.15, nPorts = 2, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0.06, offset = 0.04, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_trq(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineFluid, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {56, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.PistonCylinderNonidealOttoMV01 PistonCylinder(redeclare package Medium = engineFluid) annotation(
    Placement(visible = true, transformation(origin = {-20.3333, -10.6}, extent = {{-19.6667, -23.6}, {19.6667, 23.6}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 Orifice(redeclare package Medium = engineFluid, AmechTh_paramInput = Modelica.Constants.pi / 4.0 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta(duration = 10, height = 2, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.CommonAnyFluid.Components.VariableZetaOrifice00 Orifice1(redeclare package Medium = engineFluid, AmechTh_paramInput = Modelica.Constants.pi / 4.0 * 0.05 ^ 2) annotation(
    Placement(visible = true, transformation(origin = {30, 9}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_zeta1(duration = 10, height = 2, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 5 * 1000, offset = 101.325 * 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 5e-3, w(fixed = true, start = 2000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 5e-2) annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-99, -60}, {-62, -60}, {-62, -3}, {-35, -3}}, color = {0, 0, 127}));
  connect(feedback1.y, PistonCylinder.u_fracAir) annotation(
    Line(points = {{-71, -30}, {-66, -30}, {-66, 3}, {-35, 3}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, feedback1.u2) annotation(
    Line(points = {{-99, -60}, {-80, -60}, {-80, -38}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-99, -30}, {-88, -30}}, color = {0, 0, 127}));
  connect(Orifice1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{40, 9}, {56, 9}, {56, 50}}, color = {0, 127, 255}));
  connect(ramp_zeta1.y, Orifice1.u_zeta) annotation(
    Line(points = {{22, 50}, {26, 50}, {26, 18}}, color = {0, 0, 127}));
  connect(PistonCylinder.port_2, Orifice1.port_1) annotation(
    Line(points = {{-1, 9}, {20, 9}}, color = {0, 127, 255}));
  connect(Orifice.port_2, PistonCylinder.port_1) annotation(
    Line(points = {{-50, 20}, {-40, 20}, {-40, 9}}, color = {0, 127, 255}));
  connect(PistonCylinder.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{-1, -30}, {10, -30}}));
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
    Line(points = {{-118, 40}, {-110, 40}, {-110, 28}, {-102, 28}, {-102, 28}}, color = {0, 0, 127}));
  connect(ramp_zeta.y, Orifice.u_zeta) annotation(
    Line(points = {{-68, 50}, {-64, 50}, {-64, 30}, {-64, 30}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Orifice.port_1) annotation(
    Line(points = {{-80, 20}, {-70, 20}, {-70, 20}, {-70, 20}}, color = {0, 127, 255}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-119, 0}, {-115, 0}, {-115, 24}, {-103, 24}, {-103, 24}, {-103, 24}, {-103, 24}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.180723),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}})),
    __OpenModelica_commandLineOptions = "");
end LycomingO360_temp00;
