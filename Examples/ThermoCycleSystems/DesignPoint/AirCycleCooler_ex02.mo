within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model AirCycleCooler_ex02
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
    Placement(visible = true, transformation(origin = {31.8, -90.143}, extent = {{20.2, -14.4286}, {-20.2, 14.4286}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = HeatSinkFluid, T = 30 + 273.15, m_flow = 10, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-150, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = HeatSinkFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {102, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = HeatSourceFluid, T = 25 + 273.15, m_flow = 1, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = HeatSourceFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {140, -130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = CycleFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-132, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = HeatSourceFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {110, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = HeatSinkFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_THot(duration = 10, height = 0, offset = 35 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-210, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cycle(duration = 10, height = 0, offset = 5, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-210, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_PR(duration = 10, height = 0.5, offset = 1.5, startTime = 20) annotation(
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
    Placement(visible = true, transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = { -50, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {-70, -80}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_h boundary4(redeclare package Medium = CycleFluid, nPorts = 1, use_h_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-176, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = HeatSourceFluid) annotation(
    Placement(visible = true, transformation(origin = {80, -140}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = HeatSourceFluid) annotation(
    Placement(visible = true, transformation(origin = {-10, -140}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TCold(duration = 10, height = 0, offset = 25 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_hot(duration = 10, height = 0, offset = 5, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-210, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cold(duration = 10, height = 0, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, HX.u_eff) annotation(
    Line(points = {{-59, 70}, {-21, 70}}, color = {0, 0, 127}));
  connect(Cmp.port_2, HX.port_1_med2) annotation(
    Line(points = {{-60, 26}, {-46, 26}, {-46, 59.5}, {-20, 59.5}, {-20, 59}}, color = {0, 127, 255}));
  connect(HX.port_2_med2, Trb.port_1) annotation(
    Line(points = {{20, 59}, {52, 59}, {52, 26}, {60, 26}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-140, 110}, {-20, 110}, {-20, 81}}, color = {0, 127, 255}));
  connect(HX.port_2_med1, volume1.ports[1]) annotation(
    Line(points = {{20, 81}, {34, 81}, {34, 110}, {50, 110}}, color = {0, 127, 255}));
  connect(ramp_TCold.y, boundary2.T_in) annotation(
    Line(points = {{-79, -140}, {-74, -140}, {-74, -126}, {-62, -126}}, color = {0, 0, 127}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{50, 110}, {92, 110}}, color = {0, 127, 255}, thickness = 0.5));
  connect(ramp_m_flow_hot.y, boundary.m_flow_in) annotation(
    Line(points = {{-199, 140}, {-171, 140}, {-171, 118}, {-161, 118}, {-161, 118}}, color = {0, 0, 127}));
  connect(ramp_THot.y, boundary.T_in) annotation(
    Line(points = {{-199, 110}, {-172.5, 110}, {-172.5, 114}, {-162, 114}}, color = {0, 0, 127}));
  connect(ramp_m_flow_cycle.y, boundary4.m_flow_in) annotation(
    Line(points = {{-199, 50}, {-192, 50}, {-192, 38}, {-186, 38}}, color = {0, 0, 127}));
  connect(specificEnthalpy1.h_out, boundary4.h_in) annotation(
    Line(points = {{-61, -60}, {-198, -60}, {-198, 34}, {-188, 34}}, color = {0, 0, 127}));
  connect(ramp_m_flow_cold.y, boundary2.m_flow_in) annotation(
    Line(points = {{-78, -110}, {-70, -110}, {-70, -122}, {-60, -122}, {-60, -122}}, color = {0, 0, 127}));
  connect(const_pamb.y, boundary5.p_in) annotation(
    Line(points = {{-158, -30}, {-152, -30}, {-152, -70}, {-144, -70}}, color = {0, 0, 127}));
  connect(boundary5.ports[1], temperature.port) annotation(
    Line(points = {{-122, -78}, {-104, -78}, {-104, -70}, {-70, -70}}, color = {0, 127, 255}));
  connect(const1.y, HX1.u_eff) annotation(
    Line(points = {{-19, -90}, {10, -90}}, color = {0, 0, 127}));
  connect(HX1.port_2_med2, pressure1.port) annotation(
    Line(points = {{52, -79}, {120, -79}, {120, -60}}, color = {0, 127, 255}));
  connect(temperature2.port, HX1.port_1_med1) annotation(
    Line(points = {{-10, -130}, {2, -130}, {2, -102}, {12, -102}}, color = {0, 127, 255}));
  connect(HX1.port_2_med1, temperature1.port) annotation(
    Line(points = {{52, -102}, {68, -102}, {68, -130}, {80, -130}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, HX1.port_1_med2) annotation(
    Line(points = {{-50, -70}, {-4, -70}, {-4, -79}, {12, -79}}, color = {0, 127, 255}));
  connect(temperature.port, specificEnthalpy1.port) annotation(
    Line(points = {{-70, -70}, {-50, -70}}, color = {0, 127, 255}));
  connect(temperature1.port, volume.ports[1]) annotation(
    Line(points = {{80, -130}, {110, -130}}, color = {0, 127, 255}));
  connect(volume.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{110, -130}, {130, -130}}, color = {0, 127, 255}, thickness = 0.5));
  connect(const_pamb.y, constrainVariable2.u_targetValue) annotation(
    Line(points = {{-158, -30}, {-140, -30}, {-140, -12}, {-140, -12}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], temperature2.port) annotation(
    Line(points = {{-40, -130}, {-10, -130}}, color = {0, 127, 255}));
  connect(boundary4.ports[1], pressure2.port) annotation(
    Line(points = {{-166, 30}, {-120, 30}, {-120, 30}, {-120, 30}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, pressure1.port) annotation(
    Line(points = {{120, -40}, {120, -60}}, color = {0, 127, 255}));
  connect(Trb.port_2, specificEnthalpy.port) annotation(
    Line(points = {{100, 26}, {120, 26}, {120, -40}}, color = {0, 127, 255}));
  connect(constrainVariable1.u_targetValue, const2.y) annotation(
    Line(points = {{32, -20}, {39, -20}}, color = {0, 0, 127}));
  connect(speedSensor1.w, constrainVariable1.u_variable) annotation(
    Line(points = {{0, -10}, {0, -20}, {8, -20}}, color = {0, 0, 127}));
  connect(pressure2.p, constrainVariable2.u_variable) annotation(
    Line(points = {{-130, 20}, {-140, 20}, {-140, 12}, {-140, 12}, {-140, 12}}, color = {0, 0, 127}));
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
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{0, 10}, {60, 10}}));
  connect(inertia1.flange_b, speedSensor1.flange) annotation(
    Line(points = {{-20, 10}, {0, 10}}));
  connect(Cmp.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-60, 10}, {-40, 10}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -160}, {220, 160}}, initialScale = 0.1), graphics = {Text(origin = {-78, 97}, extent = {{-14, 3}, {16, -5}}, textString = "outside air"), Text(origin = {-50, -151}, extent = {{-14, 3}, {16, -5}}, textString = "room air"),  Text(origin = {-166, 13}, extent = {{-14, 3}, {16, -3}}, textString = "cycle air")}),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AirCycleCooler_ex02;
