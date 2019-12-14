within PropulsionSystem.Examples.OpenCAEsymposium2019.Transient;

model Turbojet
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir, m_flow1_init = 11.9, p2_init = 96.26 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 615.3, dPqPdes = 0.02, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 937.9 * 1000, p2_init = 919.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 1554, TtOutletDes(displayUnit = "K") = 1600, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 1554, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 919.2 * 1000, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1(switchCausality_dq = PropulsionSystem.Elements.BasicElements.CombustFuel.switchCausality_GeneratedHeat.input_dmFuel, switchInput_dm_fuel = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, T1_init = 1275, T2_init = 1275, dPqPdes = 0.03, h1_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 359.0 * 1000, p2_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384, T1_init = 1275, T2Tot_init = 1275, T2_init = 945.3, TStat_th_init = 945.3, h1_init = 1.004 * 1000 * 1275, h2Tot_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 945.3, hStat_th_init = 1.004 * 1000 * 945.3, m_flow1_init = 11.9, p1_init = 348.2 * 1000, p2Tot_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {280, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {320, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, T1_init = 1554, T2_init = 1275, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, h1_init = 1.004 * 1000 * 1554, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 359.0 * 1000, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, T2_init = 615.3, Tdes_1(displayUnit = "K") = 288.16, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 96.26 * 1000, p2_init = 937.9 * 1000, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 0.1, height = 0.05, offset = 0.2, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 200, a(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vol042(redeclare package Medium = engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 359 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {190, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol046(redeclare package Medium = engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 348.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = engineAir, T_start = 615.3, V = 1, nPorts = 2, p_start = 937.9 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol040(redeclare package Medium = engineAir, T_start = 1554, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol036(redeclare package Medium = engineAir, T_start = 615.3, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection030 annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor030(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant Gcs(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection036 annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor036(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection040 annotation(
    Placement(visible = true, transformation(origin = {130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor040(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1554)) annotation(
    Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection042 annotation(
    Placement(visible = true, transformation(origin = {200, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor042(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
    Placement(visible = true, transformation(origin = {200, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor046(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
    Placement(visible = true, transformation(origin = {260, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection046 annotation(
    Placement(visible = true, transformation(origin = {260, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, 8}, {-68, 8}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -4}, {-67, -4}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 10}, {-90, 14}, {290, 14}, {290, 8}}, color = {0, 127, 255}));
  connect(ramp_rating.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{1, 60}, {36, 60}, {36, 36}, {60, 36}}, color = {0, 0, 127}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, 8}, {-42, 8}}, color = {0, 127, 255}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -4}, {-48, -4}, {-48, -128}, {309, -128}}, color = {0, 0, 127}));
  connect(Vol030.ports[2], Duct030.port_1) annotation(
    Line(points = {{-2, 10}, {8, 10}, {8, 8}, {18, 8}, {18, 8}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Vol036.ports[1]) annotation(
    Line(points = {{38, 8}, {44, 8}, {44, 10}, {60, 10}, {60, 10}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{80, 30}, {90, 30}, {90, 10}}, color = {191, 0, 0}));
  connect(Vol036.ports[2], Brn036.port_1) annotation(
    Line(points = {{60, 10}, {72, 10}, {72, 8}, {80, 8}, {80, 8}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Vol040.ports[1]) annotation(
    Line(points = {{100, 8}, {108, 8}, {108, 10}, {120, 10}, {120, 10}}, color = {0, 127, 255}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{81, 26}, {295, 26}, {295, -136}, {309, -136}}, color = {0, 0, 127}));
  connect(Vol042.ports[2], Duct045.port_1) annotation(
    Line(points = {{190, 10}, {210, 10}, {210, 8}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Vol046.ports[1]) annotation(
    Line(points = {{230, 8}, {232, 8}, {232, 10}, {250, 10}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{285, 2.22045e-16}, {303.3, 2.22045e-16}, {303.3, -124}, {309, -124}}, color = {0, 0, 127}));
  connect(Vol046.ports[2], Nzl070.port_1) annotation(
    Line(points = {{250, 10}, {260, 10}, {260, 8}, {270, 8}}, color = {0, 127, 255}));
  connect(Vol040.ports[2], Trb041.port_1) annotation(
    Line(points = {{120, 10}, {134, 10}, {134, 8}, {150, 8}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Vol042.ports[1]) annotation(
    Line(points = {{170, 8}, {176, 8}, {176, 10}, {190, 10}}, color = {0, 127, 255}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -100}, {146, -100}, {146, 0}, {150, 0}}));
  connect(Cmp020.port_2, Vol030.ports[1]) annotation(
    Line(points = {{-22, 8}, {-16, 8}, {-16, 10}, {-2, 10}, {-2, 10}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{-22, 0}, {-16, 0}, {-16, -100}, {50, -100}}));
  connect(Vol042.heatPort, convection042.fluid) annotation(
    Line(points = {{200, 0}, {200, 0}, {200, -30}, {200, -30}}, color = {191, 0, 0}));
  connect(Vol046.heatPort, convection046.fluid) annotation(
    Line(points = {{260, 0}, {260, 0}, {260, -30}, {260, -30}}, color = {191, 0, 0}));
  connect(Vol030.heatPort, convection030.fluid) annotation(
    Line(points = {{8, 0}, {10, 0}, {10, -30}, {10, -30}}, color = {191, 0, 0}));
  connect(Vol040.heatPort, convection040.fluid) annotation(
    Line(points = {{130, 0}, {130, 0}, {130, -30}, {130, -30}}, color = {191, 0, 0}));
  connect(Vol036.heatPort, convection036.fluid) annotation(
    Line(points = {{70, 0}, {70, 0}, {70, -30}, {70, -30}}, color = {191, 0, 0}));
  connect(Gcs.y, convection030.Gc) annotation(
    Line(points = {{-19, -50}, {-13, -50}, {-13, -40}, {-1, -40}, {-1, -40}}, color = {0, 0, 127}));
  connect(convection030.solid, heatCapacitor030.port) annotation(
    Line(points = {{10, -50}, {10, -50}, {10, -60}, {10, -60}}, color = {191, 0, 0}));
  connect(Gcs.y, convection036.Gc) annotation(
    Line(points = {{-19, -50}, {47, -50}, {47, -40}, {59, -40}, {59, -40}}, color = {0, 0, 127}));
  connect(Gcs.y, convection040.Gc) annotation(
    Line(points = {{-19, -50}, {107, -50}, {107, -40}, {119, -40}, {119, -40}}, color = {0, 0, 127}));
  connect(Gcs.y, convection042.Gc) annotation(
    Line(points = {{-19, -50}, {171, -50}, {171, -40}, {189, -40}, {189, -40}}, color = {0, 0, 127}));
  connect(Gcs.y, convection046.Gc) annotation(
    Line(points = {{-19, -50}, {237, -50}, {237, -40}, {249, -40}, {249, -40}}, color = {0, 0, 127}));
  connect(convection036.solid, heatCapacitor036.port) annotation(
    Line(points = {{70, -50}, {70, -50}, {70, -60}, {70, -60}}, color = {191, 0, 0}));
  connect(convection040.solid, heatCapacitor040.port) annotation(
    Line(points = {{130, -50}, {130, -50}, {130, -60}, {130, -60}}, color = {191, 0, 0}));
  connect(convection042.solid, heatCapacitor042.port) annotation(
    Line(points = {{200, -50}, {200, -50}, {200, -60}, {200, -60}}, color = {191, 0, 0}));
  connect(convection046.solid, heatCapacitor046.port) annotation(
    Line(points = {{260, -50}, {260, -50}, {260, -60}, {260, -60}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -140}, {340, 100}}), graphics = {Rectangle(origin = {43, 15}, pattern = LinePattern.Dash, extent = {{-27, 29}, {61, -33}}), Text(origin = {70, 47}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -200}, {300, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.0166667),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet;
