within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model AirCycleCooler_ex01
  extends Modelica.Icons.Example;
  //-----
  package CycleFluid = Modelica.Media.Air.DryAirNasa;
  package HeatSinkFluid = Modelica.Media.Air.DryAirNasa;
  package HeatSourceFluid = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = CycleFluid
  //redeclare package Medium = HeatSinkFluid
  //redeclare package Medium = HeatSourceFluid
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-28, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-8, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0), w(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX(redeclare package Medium1 = HeatSinkFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {0.2, 70.1429}, extent = {{-19.8, -14.1429}, {19.8, 14.1429}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX1(redeclare package Medium1 = HeatSourceFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {31.8, -88.143}, extent = {{20.2, -14.4286}, {-20.2, 14.4286}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = HeatSinkFluid, T = 30 + 273.15, m_flow = 50, nPorts = 1, use_T_in = true) annotation(
    Placement(visible = true, transformation(origin = {-150, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = HeatSinkFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {102, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = HeatSourceFluid, T = 25 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = HeatSourceFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, -112}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(redeclare package Medium = CycleFluid, T = 288.15, m_flow = 5, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-170, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = CycleFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-84, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = HeatSourceFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {70, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = HeatSinkFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_THot(duration = 10, height = 0, offset = 30 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-210, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cycle(duration = 10, height = 0, offset = 10, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-210, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_PR(duration = 10, height = 10, offset = 10, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = CycleFluid, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput)  annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = CycleFluid, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated)  annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const_pamb(k = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-140, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const2(k = 3000 * 2 * Modelica.Constants.pi / 60) annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {170, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {140, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable1 annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver variableBySolver1 annotation(
    Placement(visible = true, transformation(origin = {200, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable constrainVariable2 annotation(
    Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(boundary2.ports[1], HX1.port_1_med1) annotation(
    Line(points = {{-40, -130}, {12, -130}, {12, -100}}, color = {0, 127, 255}));
  connect(volume.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{70, -112}, {100, -112}}, color = {0, 127, 255}, thickness = 0.5));
  connect(specificEnthalpy.port, pressure1.port) annotation(
    Line(points = {{120, -40}, {120, -60}}, color = {0, 127, 255}));
  connect(HX1.port_2_med2, pressure1.port) annotation(
    Line(points = {{52, -77}, {120, -77}, {120, -60}}, color = {0, 127, 255}));
  connect(Trb.port_2, specificEnthalpy.port) annotation(
    Line(points = {{100, 26}, {120, 26}, {120, -40}}, color = {0, 127, 255}));
  connect(const1.y, HX1.u_eff) annotation(
    Line(points = {{-19, -100}, {-4.5, -100}, {-4.5, -88}, {10, -88}}, color = {0, 0, 127}));
  connect(boundary5.ports[1], HX1.port_1_med2) annotation(
    Line(points = {{-74, -70}, {-9, -70}, {-9, -77}, {12, -77}}, color = {0, 127, 255}));
  connect(HX1.port_2_med1, volume.ports[1]) annotation(
    Line(points = {{52, -100}, {61, -100}, {61, -111.686}, {70, -111.686}}, color = {0, 127, 255}));
  connect(constrainVariable1.u_targetValue, const2.y) annotation(
    Line(points = {{32, -20}, {39, -20}}, color = {0, 0, 127}));
  connect(speedSensor1.w, constrainVariable1.u_variable) annotation(
    Line(points = {{0, -10}, {0, -20}, {8, -20}}, color = {0, 0, 127}));
  connect(pressure2.p, constrainVariable2.u_variable) annotation(
    Line(points = {{-130, 20}, {-140, 20}, {-140, 12}, {-140, 12}, {-140, 12}}, color = {0, 0, 127}));
  connect(const_pamb.y, constrainVariable2.u_targetValue) annotation(
    Line(points = {{-140, -18}, {-140, -18}, {-140, -12}, {-140, -12}}, color = {0, 0, 127}));
  connect(torque1.tau, variableBySolver1.y_independent) annotation(
    Line(points = {{182, 10}, {190, 10}, {190, 10}, {188, 10}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, torque1.flange) annotation(
    Line(points = {{150, 10}, {160, 10}}));
  connect(Trb.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{100, 10}, {130, 10}}));
  connect(ramp_Cmp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-99, -30}, {-88, -30}, {-88, -6}}, color = {0, 0, 127}));
  connect(pressure2.port, Cmp.port_1) annotation(
    Line(points = {{-120, 30}, {-106, 30}, {-106, 26}, {-100, 26}}, color = {0, 127, 255}));
  connect(boundary4.ports[1], pressure2.port) annotation(
    Line(points = {{-160, 30}, {-120, 30}}, color = {0, 127, 255}));
  connect(ramp_THot.y, boundary.T_in) annotation(
    Line(points = {{-199, 100}, {-180.5, 100}, {-180.5, 94}, {-162, 94}}, color = {0, 0, 127}));
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-140, 90}, {-20, 90}, {-20, 81}}, color = {0, 127, 255}));
  connect(ramp_m_flow_cycle.y, boundary4.m_flow_in) annotation(
    Line(points = {{-199, 54}, {-189.5, 54}, {-189.5, 38}, {-180, 38}}, color = {0, 0, 127}));
  connect(ramp_THot.y, boundary4.T_in) annotation(
    Line(points = {{-199, 100}, {-194, 100}, {-194, 34}, {-182, 34}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{0, 10}, {60, 10}}));
  connect(HX.port_2_med2, Trb.port_1) annotation(
    Line(points = {{20, 59}, {52, 59}, {52, 26}, {60, 26}}, color = {0, 127, 255}));
  connect(inertia1.flange_b, speedSensor1.flange) annotation(
    Line(points = {{-20, 10}, {0, 10}}));
  connect(Cmp.port_2, HX.port_1_med2) annotation(
    Line(points = {{-60, 26}, {-46, 26}, {-46, 59.5}, {-20, 59.5}, {-20, 59}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-60, 10}, {-40, 10}}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{50, 82}, {92, 82}}, color = {0, 127, 255}, thickness = 0.5));
  connect(HX.port_2_med1, volume1.ports[1]) annotation(
    Line(points = {{20, 81}, {34, 81}, {34, 82}, {50, 82}}, color = {0, 127, 255}));
  connect(const.y, HX.u_eff) annotation(
    Line(points = {{-59, 70}, {-21, 70}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -160}, {220, 160}}), graphics = {Text(origin = {-78, 97}, extent = {{-14, 3}, {16, -5}}, textString = "outside air"), Text(origin = {-90, -125}, extent = {{-14, 3}, {16, -5}}, textString = "room air"), Text(origin = {-30, -65}, extent = {{-40, 5}, {16, -5}}, textString = "exhaust to outside"), Text(origin = {-166, 13}, extent = {{-14, 3}, {16, -3}}, textString = "cycle air")}),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AirCycleCooler_ex01;
