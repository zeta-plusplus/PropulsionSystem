within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model AirCycleAirConditioner001_v02
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
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor compressor1(redeclare package Medium = CycleFluid, PRdes = 2, dmDes_1 = 10, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine turbine1(redeclare package Medium = CycleFluid, effDes = 0.95) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0), w(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX(redeclare package Medium1 = HeatSinkFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {10.2, 47}, extent = {{-9.8, -7}, {9.8, 7}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX1(redeclare package Medium1 = HeatSourceFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {40.2, -47}, extent = {{9.8, -7}, {-9.8, 7}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = HeatSinkFluid, T = 30 + 273.15, m_flow = 50, nPorts = 1, use_T_in = true) annotation(
    Placement(visible = true, transformation(origin = {-46, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = HeatSinkFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {66, 52}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = HeatSourceFluid, T = 25 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {4, -86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = HeatSourceFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {92, -86}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-25, 47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {9, -47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.extractPwr extractPwr1(switchInput_pwr = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(switchConstraint = PropulsionSystem.Elements.BasicElements.constrain_Nmech.switch_executeConstraint.Execute, switchInput_Nmech = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.SetIndependent setIndependent1 annotation(
    Placement(visible = true, transformation(origin = {135, -5}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {84, -12}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(redeclare package Medium = CycleFluid, T = 288.15, m_flow = 5, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-81, 21}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = CycleFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-54, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = HeatSourceFluid, V = 0.001, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {65, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = HeatSinkFluid, V = 0.001, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {39, 59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_THot(duration = 10, height = 0, offset = 30 + 273.15, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-117, 57}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_cycle(duration = 10, height = 0, offset = 10, startTime = 20)  annotation(
    Placement(visible = true, transformation(origin = {-127, 27}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR(duration = 10, height = 5.0, offset = 2.0, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-34, -6}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
equation
  connect(compressor1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}}));
  connect(inertia1.flange_b, constrain_Nmech1.flange_a) annotation(
    Line(points = {{0, 10}, {20, 10}}));
  connect(boundary5.ports[1], HX1.port_1_med2) annotation(
    Line(points = {{-48, -36}, {20, -36}, {20, -42}, {30, -42}}, color = {0, 127, 255}));
  connect(ramp_THot.y, boundary.T_in) annotation(
    Line(points = {{-109, 57}, {-81.5, 57}, {-81.5, 58}, {-54, 58}}, color = {0, 0, 127}));
  connect(ramp_THot.y, boundary4.T_in) annotation(
    Line(points = {{-109, 57}, {-104, 57}, {-104, 24}, {-89, 24}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], HX1.port_1_med1) annotation(
    Line(points = {{10, -86}, {20, -86}, {20, -53}, {30, -53}}, color = {0, 127, 255}));
  connect(volume1.ports[2], boundary1.ports[1]) annotation(
    Line(points = {{39, 52}, {60, 52}}, color = {0, 127, 255}, thickness = 0.5));
  connect(HX.port_2_med1, volume1.ports[1]) annotation(
    Line(points = {{20, 52}, {39, 52}}, color = {0, 127, 255}));
  connect(ramp_m_flow_cycle.y, boundary4.m_flow_in) annotation(
    Line(points = {{-119, 27}, {-88, 27}}, color = {0, 0, 127}));
  connect(ramp_PR.y, compressor1.PR_in) annotation(
    Line(points = {{-40, -6}, {-50, -6}, {-50, 4}, {-50, 4}}, color = {0, 0, 127}));
  connect(HX1.port_2_med1, volume.ports[1]) annotation(
    Line(points = {{50, -52}, {65, -52}}, color = {0, 127, 255}));
  connect(volume.ports[2], boundary3.ports[1]) annotation(
    Line(points = {{65, -52}, {80, -52}, {80, -86}, {86, -86}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary4.ports[1], compressor1.port_1) annotation(
    Line(points = {{-74, 21}, {-67, 21}, {-67, 18}, {-60, 18}}, color = {0, 127, 255}));
  connect(const1.y, HX1.u_eff) annotation(
    Line(points = {{14.5, -47}, {30, -47}}, color = {0, 0, 127}));
  connect(HX1.port_2_med2, pressure1.port) annotation(
    Line(points = {{50, -41}, {90, -41}, {90, -16}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, pressure1.port) annotation(
    Line(points = {{90, -12}, {90, -16}}, color = {0, 127, 255}));
  connect(turbine1.port_2, specificEnthalpy.port) annotation(
    Line(points = {{80, 18}, {90, 18}, {90, -12}}, color = {0, 127, 255}));
  connect(setIndependent1.independent_out, extractPwr1.u_pwrExtr) annotation(
    Line(points = {{129.5, -5}, {123.5, -5}, {123.5, 3}, {123.5, 3}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, turbine1.flange_1) annotation(
    Line(points = {{40, 10}, {60, 10}, {60, 10}, {60, 10}}));
  connect(compressor1.port_2, HX.port_1_med2) annotation(
    Line(points = {{-40, 18}, {-34, 18}, {-34, 41}, {0, 41}}, color = {0, 127, 255}));
  connect(HX.port_2_med2, turbine1.port_1) annotation(
    Line(points = {{20, 41}, {54, 41}, {54, 18}, {60, 18}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-40, 56}, {-14, 56}, {-14, 53}, {0, 53}}, color = {0, 127, 255}));
  connect(turbine1.flange_2, extractPwr1.flange_a) annotation(
    Line(points = {{80, 10}, {120, 10}}));
  connect(const.y, HX.u_eff) annotation(
    Line(points = {{-19, 47}, {0, 47}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}}, initialScale = 0.1), graphics = {Text(origin = {0, 63}, extent = {{-14, 3}, {16, -5}}, textString = "outside air"), Text(origin = {38, -59}, extent = {{-14, 3}, {16, -5}}, textString = "room air"), Text(origin = {-26, -31}, extent = {{-14, 3}, {26, -5}}, textString = "exhaust to outside"), Text(origin = {-82, 9}, extent = {{-14, 3}, {14, -3}}, textString = "cycle air")}),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AirCycleAirConditioner001_v02;
