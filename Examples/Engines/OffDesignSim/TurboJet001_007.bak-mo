within PropulsionSystem.Examples.Engines.OffDesignSim;

model TurboJet001_007
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
    Placement(visible = true, transformation(origin = {210, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384, T1_init = 1275, T2Tot_init = 1275, T2_init = 945.3, TStat_th_init = 945.3, h1_init = 1.004 * 1000 * 1275, h2Tot_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 945.3, hStat_th_init = 1.004 * 1000 * 945.3, m_flow1_init = 11.9, p1_init = 348.2 * 1000, p2Tot_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {260, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {300, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, T1_init = 1554, T2_init = 1275, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, h1_init = 1.004 * 1000 * 1554, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 359.0 * 1000, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, T2_init = 615.3, Tdes_1(displayUnit = "K") = 288.16, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 96.26 * 1000, p2_init = 937.9 * 1000, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-32, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 0.1, height = 0.1, offset = 0.2, startTime = 60) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)  annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 100, a(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vol042(redeclare package Medium=engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 359 * 1000, s(fixed = false), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {180, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol046(redeclare package Medium=engineAir, T_start = 1275,V = 1, nPorts = 2, p_start = 348.2 * 1000, s(fixed = false), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {230, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium=engineAir, T_start = 615.3,V = 1, nPorts = 2, p_start = 937.9 * 1000, s(fixed = false), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol040(redeclare package Medium=engineAir,T_start = 1554, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol036(redeclare package Medium=engineAir,T_start = 615.3, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(ramp_rating.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{-19, 50}, {36, 50}, {36, 6}, {60, 6}}, color = {0, 0, 127}));
  connect(Vol036.ports[2], Brn036.port_1) annotation(
    Line(points = {{60, -20}, {72, -20}, {72, -22}, {80, -22}, {80, -22}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Vol036.ports[1]) annotation(
    Line(points = {{38, -22}, {44, -22}, {44, -20}, {60, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{-22, -30}, {-16, -30}, {-16, -60}, {50, -60}}));
  connect(Vol030.ports[2], Duct030.port_1) annotation(
    Line(points = {{-2, -20}, {8, -20}, {8, -22}, {18, -22}, {18, -22}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Vol030.ports[1]) annotation(
    Line(points = {{-22, -22}, {-16, -22}, {-16, -20}, {-2, -20}, {-2, -20}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, -22}, {-42, -22}}, color = {0, 127, 255}));
  connect(Vol040.ports[2], Trb041.port_1) annotation(
    Line(points = {{120, -20}, {134, -20}, {134, -22}, {140, -22}, {140, -22}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Vol040.ports[1]) annotation(
    Line(points = {{100, -22}, {108, -22}, {108, -20}, {120, -20}, {120, -20}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Vol046.ports[1]) annotation(
    Line(points = {{220, -22}, {222, -22}, {222, -20}, {230, -20}}, color = {0, 127, 255}));
  connect(Vol046.ports[2], Nzl070.port_1) annotation(
    Line(points = {{230, -20}, {240, -20}, {240, -22}, {250, -22}}, color = {0, 127, 255}));
  connect(Vol042.ports[2], Duct045.port_1) annotation(
    Line(points = {{180, -20}, {200, -20}, {200, -22}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Vol042.ports[1]) annotation(
    Line(points = {{160, -22}, {166, -22}, {166, -20}, {180, -20}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{265, -30}, {283.3, -30}, {283.3, -82}, {289, -82}}, color = {0, 0, 127}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -34}, {-48, -34}, {-48, -88}, {289, -88}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{81, -4}, {259, -4}, {259, -96}, {289, -96}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -20}, {-90, -16}, {270, -16}, {270, -22}}, color = {0, 127, 255}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -60}, {136, -60}, {136, -30}, {140, -30}}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{80, 0}, {90, 0}, {90, -20}}, color = {191, 0, 0}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -32}, {-67, -32}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -20}, {-68, -20}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {280, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {43, -15}, pattern = LinePattern.Dash, extent = {{-27, 29}, {61, -33}}), Text(origin = {70, 17}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {280, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));

end TurboJet001_007;
