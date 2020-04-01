within PropulsionSystem.Examples.Engines.Transient;

model TurboJet001_009
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir, m_flow1_init = 11.9, p2_init = 96.26 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 615.3, dPqPdes = 0.02, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 937.9 * 1000, p2_init = 919.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {28, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 1554, TtOutletDes(displayUnit = "K") = 1600, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 1554, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 919.2 * 1000, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1(switchCausality_dq = PropulsionSystem.Elements.BasicElements.CombustFuel.switchCausality_GeneratedHeat.input_dmFuel, switchInput_dm_fuel = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, T1_init = 1275, T2_init = 1275, dPqPdes = 0.03, h1_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 359.0 * 1000, p2_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {220, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384, T1_init = 1275, T2Tot_init = 1275, T2_init = 945.3, TStat_th_init = 945.3, h1_init = 1.004 * 1000 * 1275, h2Tot_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 945.3, hStat_th_init = 1.004 * 1000 * 945.3, m_flow1_init = 11.9, p1_init = 348.2 * 1000, p2Tot_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {280, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {320, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, T1_init = 1554, T2_init = 1275, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, h1_init = 1.004 * 1000 * 1554, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 359.0 * 1000, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {160, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, T2_init = 615.3, Tdes_1(displayUnit = "K") = 288.16, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 96.26 * 1000, p2_init = 937.9 * 1000, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-32, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 0.1, height = 0.1, offset = 0.2, startTime = 60) annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)  annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 100, a(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {60, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vol042(redeclare package Medium=engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 359 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {190, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol046(redeclare package Medium=engineAir, T_start = 1275,V = 1, nPorts = 2, p_start = 348.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium=engineAir, T_start = 615.3,V = 1, nPorts = 2, p_start = 937.9 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol040(redeclare package Medium=engineAir,T_start = 1554, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol036(redeclare package Medium=engineAir,T_start = 615.3, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection030 annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor030(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3))  annotation(
    Placement(visible = true, transformation(origin = {10, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant Gcs(k = 10000)  annotation(
    Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection036 annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor036(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection040 annotation(
    Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor040(C = 10 *1000, T(displayUnit = "K", fixed = true, start = 1554)) annotation(
    Placement(visible = true, transformation(origin = {130, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection042 annotation(
    Placement(visible = true, transformation(origin = {200, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor042(C = 10 *1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
    Placement(visible = true, transformation(origin = {200, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor046(C = 10 *1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
    Placement(visible = true, transformation(origin = {260, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection046 annotation(
    Placement(visible = true, transformation(origin = {260, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(Gcs.y, convection046.Gc) annotation(
    Line(points = {{-18, -80}, {238, -80}, {238, -70}, {250, -70}, {250, -70}}, color = {0, 0, 127}));
  connect(Gcs.y, convection042.Gc) annotation(
    Line(points = {{-18, -80}, {172, -80}, {172, -70}, {190, -70}, {190, -70}}, color = {0, 0, 127}));
  connect(Gcs.y, convection040.Gc) annotation(
    Line(points = {{-18, -80}, {108, -80}, {108, -70}, {120, -70}, {120, -70}}, color = {0, 0, 127}));
  connect(Gcs.y, convection036.Gc) annotation(
    Line(points = {{-18, -80}, {48, -80}, {48, -70}, {60, -70}, {60, -70}}, color = {0, 0, 127}));
  connect(Vol046.heatPort, convection046.fluid) annotation(
    Line(points = {{260, -30}, {260, -30}, {260, -60}, {260, -60}}, color = {191, 0, 0}));
  connect(Vol042.heatPort, convection042.fluid) annotation(
    Line(points = {{200, -30}, {200, -30}, {200, -60}, {200, -60}}, color = {191, 0, 0}));
  connect(Vol040.heatPort, convection040.fluid) annotation(
    Line(points = {{130, -30}, {130, -30}, {130, -60}, {130, -60}}, color = {191, 0, 0}));
  connect(Vol036.heatPort, convection036.fluid) annotation(
    Line(points = {{70, -30}, {70, -30}, {70, -60}, {70, -60}}, color = {191, 0, 0}));
  connect(convection046.solid, heatCapacitor046.port) annotation(
    Line(points = {{260, -80}, {260, -80}, {260, -90}, {260, -90}}, color = {191, 0, 0}));
  connect(convection042.solid, heatCapacitor042.port) annotation(
    Line(points = {{200, -80}, {200, -80}, {200, -90}, {200, -90}}, color = {191, 0, 0}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{81, -4}, {295, -4}, {295, -166}, {309, -166}}, color = {0, 0, 127}));
  connect(Vol046.ports[2], Nzl070.port_1) annotation(
    Line(points = {{250, -20}, {260, -20}, {260, -22}, {270, -22}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Vol046.ports[1]) annotation(
    Line(points = {{230, -22}, {232, -22}, {232, -20}, {250, -20}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -20}, {-90, -16}, {290, -16}, {290, -22}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{285, -30}, {303.3, -30}, {303.3, -154}, {309, -154}}, color = {0, 0, 127}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -34}, {-48, -34}, {-48, -158}, {309, -158}}, color = {0, 0, 127}));
  connect(convection040.solid, heatCapacitor040.port) annotation(
    Line(points = {{130, -80}, {130, -80}, {130, -90}, {130, -90}}, color = {191, 0, 0}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -130}, {146, -130}, {146, -30}, {150, -30}}));
  connect(Vol042.ports[2], Duct045.port_1) annotation(
    Line(points = {{190, -20}, {210, -20}, {210, -22}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Vol042.ports[1]) annotation(
    Line(points = {{170, -22}, {176, -22}, {176, -20}, {190, -20}}, color = {0, 127, 255}));
  connect(Vol040.ports[2], Trb041.port_1) annotation(
    Line(points = {{120, -20}, {134, -20}, {134, -22}, {150, -22}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Vol040.ports[1]) annotation(
    Line(points = {{100, -22}, {108, -22}, {108, -20}, {120, -20}, {120, -20}}, color = {0, 127, 255}));
  connect(convection036.solid, heatCapacitor036.port) annotation(
    Line(points = {{70, -80}, {70, -80}, {70, -90}, {70, -90}}, color = {191, 0, 0}));
  connect(convection030.solid, heatCapacitor030.port) annotation(
    Line(points = {{10, -80}, {10, -80}, {10, -90}, {10, -90}}, color = {191, 0, 0}));
  connect(Vol030.heatPort, convection030.fluid) annotation(
    Line(points = {{8, -30}, {10, -30}, {10, -60}, {10, -60}}, color = {191, 0, 0}));
  connect(Gcs.y, convection030.Gc) annotation(
    Line(points = {{-18, -80}, {-12, -80}, {-12, -70}, {0, -70}, {0, -70}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{-22, -30}, {-16, -30}, {-16, -130}, {50, -130}}));
  connect(ramp_rating.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{-19, 60}, {36, 60}, {36, 6}, {60, 6}}, color = {0, 0, 127}));
  connect(Vol036.ports[2], Brn036.port_1) annotation(
    Line(points = {{60, -20}, {72, -20}, {72, -22}, {80, -22}, {80, -22}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Vol036.ports[1]) annotation(
    Line(points = {{38, -22}, {44, -22}, {44, -20}, {60, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(Vol030.ports[2], Duct030.port_1) annotation(
    Line(points = {{-2, -20}, {8, -20}, {8, -22}, {18, -22}, {18, -22}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Vol030.ports[1]) annotation(
    Line(points = {{-22, -22}, {-16, -22}, {-16, -20}, {-2, -20}, {-2, -20}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, -22}, {-42, -22}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{80, 0}, {90, 0}, {90, -20}}, color = {191, 0, 0}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -32}, {-67, -32}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -20}, {-68, -20}}, color = {0, 127, 255}));
  
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -200}, {300, 100}}), graphics = {Rectangle(origin = {43, -15}, pattern = LinePattern.Dash, extent = {{-27, 29}, {61, -33}}), Text(origin = {70, 17}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -200}, {300, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));

end TurboJet001_009;
