within PropulsionSystem.Examples.Tests;

model AirCycleAirConditioner001_v01
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
  PropulsionSystem.Elements.BasicElements.Compressor compressor1(redeclare package Medium = CycleFluid, PRdes = 10, dmDes_1 = 10, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine turbine1(redeclare package Medium = CycleFluid, effDes = 0.95) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0), w(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX(redeclare package Medium1 = HeatSinkFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {10.2, 47}, extent = {{-9.8, -7}, {9.8, 7}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX1(redeclare package Medium1 = HeatSourceFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {40.2, -47}, extent = {{9.8, -7}, {-9.8, 7}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = HeatSinkFluid, T = 30 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-46, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = HeatSinkFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {66, 56}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = HeatSourceFluid, T = 25 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {3, -87}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = HeatSourceFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {76, -86}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
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
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(redeclare package Medium = CycleFluid, T = 288.15, m_flow = 10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-88, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary5(redeclare package Medium = CycleFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary5.ports[1], HX1.port_1_med2) annotation(
    Line(points = {{-18, -40}, {30, -40}, {30, -42}, {30, -42}}, color = {0, 127, 255}));
  connect(HX1.port_2_med1, boundary3.ports[1]) annotation(
    Line(points = {{50, -52.6}, {60, -52.6}, {60, -86.6}, {70, -86.6}, {70, -86.6}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], HX1.port_1_med1) annotation(
    Line(points = {{10, -87}, {20, -87}, {20, -53}, {30, -53}}, color = {0, 127, 255}));
  connect(const1.y, HX1.u_eff) annotation(
    Line(points = {{14.5, -47}, {30, -47}}, color = {0, 0, 127}));
  connect(HX1.port_2_med2, pressure1.port) annotation(
    Line(points = {{50, -41}, {90, -41}, {90, -16}}, color = {0, 127, 255}));
  connect(boundary4.ports[1], compressor1.port_1) annotation(
    Line(points = {{-88, -6}, {-88, -6}, {-88, 18}, {-60, 18}, {-60, 18}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, pressure1.port) annotation(
    Line(points = {{90, -12}, {90, -16}}, color = {0, 127, 255}));
  connect(turbine1.port_2, specificEnthalpy.port) annotation(
    Line(points = {{80, 18}, {90, 18}, {90, -12}}, color = {0, 127, 255}));
  connect(setIndependent1.independent_out, extractPwr1.u_pwrExtr) annotation(
    Line(points = {{129.5, -5}, {123.5, -5}, {123.5, 3}, {123.5, 3}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, turbine1.flange_1) annotation(
    Line(points = {{40, 10}, {60, 10}, {60, 10}, {60, 10}}));
  connect(inertia1.flange_b, constrain_Nmech1.flange_a) annotation(
    Line(points = {{0, 10}, {20, 10}, {20, 10}, {20, 10}}));
  connect(compressor1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}}));
  connect(compressor1.port_2, HX.port_1_med2) annotation(
    Line(points = {{-40, 18}, {-34, 18}, {-34, 41}, {0, 41}}, color = {0, 127, 255}));
  connect(HX.port_2_med2, turbine1.port_1) annotation(
    Line(points = {{20, 41}, {54, 41}, {54, 18}, {60, 18}}, color = {0, 127, 255}));
  connect(HX.port_2_med1, boundary1.ports[1]) annotation(
    Line(points = {{20, 53}, {34, 53}, {34, 56}, {60, 56}}, color = {0, 127, 255}));
  connect(boundary.ports[1], HX.port_1_med1) annotation(
    Line(points = {{-40, 56}, {-14, 56}, {-14, 53}, {0, 53}}, color = {0, 127, 255}));
  connect(turbine1.flange_2, extractPwr1.flange_a) annotation(
    Line(points = {{80, 10}, {120, 10}}));
  connect(const.y, HX.u_eff) annotation(
    Line(points = {{-19, 47}, {0, 47}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AirCycleAirConditioner001_v01;
