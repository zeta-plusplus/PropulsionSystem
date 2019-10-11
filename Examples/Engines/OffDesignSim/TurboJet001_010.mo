within PropulsionSystem.Examples.Engines.OffDesignSim;

model TurboJet001_010
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1(switchCausality_dq = PropulsionSystem.Elements.BasicElements.CombustFuel.switchCausality_GeneratedHeat.input_dmFuel, switchInput_dm_fuel = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {210, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384) annotation(
    Placement(visible = true, transformation(origin = {280, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {320, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, Tdes_1(displayUnit = "K") = 288.16, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 1, height = 500, offset = 3000, startTime = 60) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)  annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 100, a(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vol042(redeclare package Medium=engineAir, V = 0.1, nPorts = 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {180, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol046(redeclare package Medium=engineAir,V = 0.1, nPorts = 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {240, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -40}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi))  annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain ctrlP(k = 0.0001)  annotation(
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator ctrlI(k = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection042 annotation(
    Placement(visible = true, transformation(origin = {190, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor042(C = 1000, T(displayUnit = "K", start = 288.15))  annotation(
    Placement(visible = true, transformation(origin = {190, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant Gc042(k = 1000)  annotation(
    Placement(visible = true, transformation(origin = {158, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Gc046(k = 200) annotation(
    Placement(visible = true, transformation(origin = {218, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection046 annotation(
    Placement(visible = true, transformation(origin = {250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor046(C = 100, T(displayUnit = "K", start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {250, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(convection046.solid, heatCapacitor046.port) annotation(
    Line(points = {{250, -110}, {250, -110}, {250, -120}, {250, -120}}, color = {191, 0, 0}));
  connect(Gc046.y, convection046.Gc) annotation(
    Line(points = {{230, -100}, {238, -100}, {238, -100}, {240, -100}}, color = {0, 0, 127}));
  connect(Vol046.heatPort, convection046.fluid) annotation(
    Line(points = {{250, -70}, {250, -70}, {250, -90}, {250, -90}}, color = {191, 0, 0}));
  connect(Vol042.heatPort, convection042.fluid) annotation(
    Line(points = {{190, -70}, {190, -70}, {190, -90}, {190, -90}, {190, -90}}, color = {191, 0, 0}));
  connect(Gc042.y, convection042.Gc) annotation(
    Line(points = {{170, -100}, {180, -100}, {180, -100}, {180, -100}}, color = {0, 0, 127}));
  connect(convection042.solid, heatCapacitor042.port) annotation(
    Line(points = {{190, -110}, {190, -110}, {190, -120}, {190, -120}}, color = {191, 0, 0}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -74}, {-48, -74}, {-48, -148}, {296.5, -148}, {296.5, -128}, {309, -128}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{81, -44}, {295, -44}, {295, -136}, {309, -136}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Vol046.ports[1]) annotation(
    Line(points = {{220, -62}, {226, -62}, {226, -60}, {240, -60}, {240, -60}}, color = {0, 127, 255}));
  connect(Vol046.ports[2], Nzl070.port_1) annotation(
    Line(points = {{240, -60}, {260, -60}, {260, -62}, {270, -62}}, color = {0, 127, 255}));
  connect(Vol042.ports[2], Duct045.port_1) annotation(
    Line(points = {{180, -60}, {200, -60}, {200, -62}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{285, -70}, {303.3, -70}, {303.3, -122}, {309, -122}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -60}, {-90, -56}, {290, -56}, {290, -62}}, color = {0, 127, 255}));
  connect(ctrlI.y, add1.u2) annotation(
    Line(points = {{-9, 30}, {-4, 30}, {-4, 44}, {8, 44}}, color = {0, 0, 127}));
  connect(feedback1.y, ctrlI.u) annotation(
    Line(points = {{-40, 50}, {-36, 50}, {-36, 30}, {-32, 30}}, color = {0, 0, 127}));
  connect(gain2.y, feedback1.u2) annotation(
    Line(points = {{20, 1}, {20, 4}, {-50, 4}, {-50, 42}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, speedSensor1.flange) annotation(
    Line(points = {{10, -70}, {20, -70}, {20, -50}, {20, -50}, {20, -50}}));
  connect(gain2.u, speedSensor1.w) annotation(
    Line(points = {{20, -22}, {20, -22}, {20, -28}, {20, -28}}, color = {0, 0, 127}));
  connect(add1.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{32, 50}, {38, 50}, {38, -34}, {60, -34}, {60, -34}}, color = {0, 0, 127}));
  connect(ctrlP.y, add1.u1) annotation(
    Line(points = {{-9, 60}, {-4, 60}, {-4, 56}, {8, 56}}, color = {0, 0, 127}));
  connect(feedback1.y, ctrlP.u) annotation(
    Line(points = {{-40, 50}, {-36, 50}, {-36, 60}, {-32, 60}}, color = {0, 0, 127}));
  connect(ramp_rating.y, feedback1.u1) annotation(
    Line(points = {{-68, 50}, {-58, 50}, {-58, 50}, {-58, 50}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Vol042.ports[1]) annotation(
    Line(points = {{160, -62}, {166, -62}, {166, -60}, {180, -60}}, color = {0, 127, 255}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -100}, {136, -100}, {136, -70}, {140, -70}}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{100, -62}, {140, -62}, {140, -62}, {140, -62}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{10, -70}, {14, -70}, {14, -100}, {50, -100}}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, -62}, {50, -62}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{70, -62}, {80, -62}, {80, -62}, {80, -62}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{80, -40}, {90, -40}, {90, -60}}, color = {191, 0, 0}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -62}, {-68, -62}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -74}, {-67, -74}}, color = {0, 0, 127}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, -62}, {-10, -62}, {-10, -62}, {-10, -62}}, color = {0, 127, 255}));
  
  
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {280, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {75, -55}, pattern = LinePattern.Dash, extent = {{-27, 29}, {27, -31}}), Text(origin = {70, -23}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {280, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));




end TurboJet001_010;
