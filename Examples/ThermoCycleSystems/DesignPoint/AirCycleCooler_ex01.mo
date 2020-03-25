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
    Placement(visible = true, transformation(origin = {31.8, -100.143}, extent = {{20.2, -14.4286}, {-20.2, 14.4286}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = HeatSinkFluid, T = 30 + 273.15, m_flow = 50, nPorts = 1, use_T_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = HeatSinkFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {102, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = HeatSourceFluid, T = 25 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = HeatSourceFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {110, -150}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {130, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(redeclare package Medium = CycleFluid, T = 288.15, m_flow = 5, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = CycleFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-84, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = HeatSourceFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {70, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = HeatSinkFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {50, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_THot(duration = 10, height = 0, offset = 30 + 273.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-170, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cycle(duration = 10, height = 0, offset = 10, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-170, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_PR(duration = 10, height = 10, offset = 10, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-130, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = CycleFluid, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput)  annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = CycleFluid, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated)  annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_omega(k = 3000 * 2 * Modelica.Constants.pi / 60) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetConstraint setConstraint1(switchDetermine_targetVal = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput)  annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetSolverIndependent setSolverIndependent1 annotation(
    Placement(visible = true, transformation(origin = {170, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.extractPwr extractPwr1(switchConstraint = PropulsionSystem.Elements.BasicElements.extractPwr.switch_executeConstraint.Execute, switchInput_pwr = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)  annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(extractPwr1.u_pwrExtr, setSolverIndependent1.y_independent) annotation(
    Line(points = {{144, 2}, {144, 2}, {144, -10}, {160, -10}, {160, -10}}, color = {0, 0, 127}));
  connect(Trb.flange_2, extractPwr1.flange_a) annotation(
    Line(points = {{100, 10}, {140, 10}, {140, 10}, {140, 10}}));
  connect(HX1.port_2_med1, volume.ports[1]) annotation(
    Line(points = {{52, -111.686}, {70, -111.686}}, color = {0, 127, 255}));
  connect(volume.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{70, -112}, {94, -112}, {94, -150}, {100, -150}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary5.ports[1], HX1.port_1_med2) annotation(
    Line(points = {{-74, -70}, {-9, -70}, {-9, -89}, {12, -89}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], HX1.port_1_med1) annotation(
    Line(points = {{-40, -150}, {12, -150}, {12, -112}}, color = {0, 127, 255}));
  connect(const1.y, HX1.u_eff) annotation(
    Line(points = {{-19, -100}, {10, -100}}, color = {0, 0, 127}));
  connect(HX1.port_2_med2, pressure1.port) annotation(
    Line(points = {{52, -89}, {120, -89}, {120, -79.6}}, color = {0, 127, 255}));
  connect(const_omega.y, setConstraint1.u_targetValue) annotation(
    Line(points = {{-38, -30}, {-32, -30}, {-32, -30}, {-32, -30}}, color = {0, 0, 127}));
  connect(setConstraint1.u_variable, speedSensor1.w) annotation(
    Line(points = {{-8, -30}, {0, -30}, {0, -12}, {0, -12}}, color = {0, 0, 127}));
  connect(ramp_Cmp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-119, -30}, {-88, -30}, {-88, -6}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{0, 10}, {60, 10}}));
  connect(Trb.port_2, specificEnthalpy.port) annotation(
    Line(points = {{100, 26}, {120, 26}, {120, -60}}, color = {0, 127, 255}));
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
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-100, 90}, {-20, 90}, {-20, 81}}, color = {0, 127, 255}));
  connect(boundary4.ports[1], Cmp.port_1) annotation(
    Line(points = {{-120, 30}, {-108, 30}, {-108, 26}, {-100, 26}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, pressure1.port) annotation(
    Line(points = {{120, -60}, {120, -80}}, color = {0, 127, 255}));
  connect(ramp_THot.y, boundary4.T_in) annotation(
    Line(points = {{-159, 100}, {-154, 100}, {-154, 34}, {-142, 34}}, color = {0, 0, 127}));
  connect(ramp_m_flow_cycle.y, boundary4.m_flow_in) annotation(
    Line(points = {{-159, 54}, {-149.5, 54}, {-149.5, 38}, {-140, 38}}, color = {0, 0, 127}));
  connect(ramp_THot.y, boundary.T_in) annotation(
    Line(points = {{-159, 100}, {-140.5, 100}, {-140.5, 94}, {-122, 94}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -160}, {200, 160}}), graphics = {Text(origin = {-78, 97}, extent = {{-14, 3}, {16, -5}}, textString = "outside air"), Text(origin = {-82, -133}, extent = {{-14, 3}, {16, -5}}, textString = "room air"), Text(origin = {-30, -65}, extent = {{-40, 5}, {16, -5}}, textString = "exhaust to outside"), Text(origin = {-126, 13}, extent = {{-14, 3}, {16, -3}}, textString = "cycle air")}),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AirCycleCooler_ex01;
