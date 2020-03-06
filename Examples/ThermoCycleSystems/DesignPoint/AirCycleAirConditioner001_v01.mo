within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

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
  PropulsionSystem.Elements.BasicElements.Compressor compressor1(redeclare package Medium = CycleFluid, PRdes = 2, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine turbine1(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0), w(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX(redeclare package Medium1 = HeatSinkFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {10.2, 47}, extent = {{-9.8, -7}, {9.8, 7}}, rotation = 0)));
  FluidSystemComponents.HeatTransfer.Components.HX_modulatedEff00 HX1(redeclare package Medium1 = HeatSourceFluid, redeclare package Medium2 = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {-9.8, -47}, extent = {{9.8, -7}, {-9.8, 7}}, rotation = 180)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = HeatSinkFluid, T = 30 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-46, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = HeatSinkFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {66, 56}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = HeatSourceFluid, T = 25 + 273.15, m_flow = 5, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-47, -87}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = HeatSourceFluid, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {26, -86}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-25, 47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-41, -47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.extractPwr extractPwr1(switchInput_pwr = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = CycleFluid) annotation(
    Placement(visible = true, transformation(origin = {85, -11}, extent = {{-5, 5}, {5, -5}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(switchConstraint = PropulsionSystem.Elements.BasicElements.constrain_Nmech.switch_executeConstraint.Execute, switchInput_Nmech = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.SetIndependent setIndependent1 annotation(
    Placement(visible = true, transformation(origin = {135, -5}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(tgtVal = 20 + 273.15) annotation(
    Placement(visible = true, transformation(origin = {66, -74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = HeatSourceFluid) annotation(
    Placement(visible = true, transformation(origin = {24, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.SetIndependent setIndependent2 annotation(
    Placement(visible = true, transformation(origin = {-35, -13}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = CycleFluid, crossArea = Modelica.Constants.pi / 4.0 * 0.2 ^ 2, height = 0.5, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {58, -30}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(tank.ports[2], specificEnthalpy.port) annotation(
    Line(points = {{58, -38}, {60, -38}, {60, -42}, {90, -42}, {90, -10}, {90, -10}}, color = {0, 127, 255}));
  connect(HX1.port_2_med2, tank.ports[1]) annotation(
    Line(points = {{0, -42}, {56, -42}, {56, -38}, {58, -38}}, color = {0, 127, 255}));
  connect(compressor1.PR_in, setIndependent2.independent_out) annotation(
    Line(points = {{-50, 4}, {-50, -14}, {-40.5, -14}, {-40.5, -13}}, color = {0, 0, 127}));
  connect(temperature.T, setDependent1.dependent_in) annotation(
    Line(points = {{24, -68}, {24, -68}, {24, -74}, {60, -74}, {60, -74}}, color = {0, 0, 127}));
  connect(HX1.port_2_med1, temperature.port) annotation(
    Line(points = {{0, -52}, {14, -52}, {14, -62}, {14, -62}}, color = {0, 127, 255}));
  connect(HX1.port_1_med2, compressor1.port_1) annotation(
    Line(points = {{-20, -41}, {-68, -41}, {-68, 18}, {-60, 18}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], HX1.port_1_med1) annotation(
    Line(points = {{-40, -87}, {-30, -87}, {-30, -53}, {-20, -53}}, color = {0, 127, 255}));
  connect(const1.y, HX1.u_eff) annotation(
    Line(points = {{-35.5, -47}, {-20, -47}}, color = {0, 0, 127}));
  connect(temperature.port, boundary3.ports[1]) annotation(
    Line(points = {{14, -62}, {14, -86}, {20, -86}}, color = {0, 127, 255}));
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
  connect(turbine1.port_2, specificEnthalpy.port) annotation(
    Line(points = {{80, 18}, {90, 18}, {90, -10}, {90, -10}}, color = {0, 127, 255}));
  connect(turbine1.flange_2, extractPwr1.flange_a) annotation(
    Line(points = {{80, 10}, {120, 10}}));
  connect(const.y, HX.u_eff) annotation(
    Line(points = {{-19, 47}, {0, 47}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AirCycleAirConditioner001_v01;
