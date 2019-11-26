within PropulsionSystem.Examples.OpenCAEsymposium2019.OffDesign;

model Turbofan
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet inlt010(redeclare package Medium = engineAir, effRamDes = 0.98) annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T2_init = 1800, TtOutletDes(displayUnit = "K") = 1800, h2_init = 1800 * 1000, m_flow1_init = 10, p2_init = 1.47097e+06, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel MainComb annotation(
    Placement(visible = true, transformation(origin = {100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance Perf001 annotation(
    Placement(visible = true, transformation(origin = {310, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add calc_engineFg annotation(
    Placement(visible = true, transformation(origin = {280, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp120(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp020(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-18, -32}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Division calc_BPR annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 5, height = -200, offset = 1600, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp120(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 1.4, Tdes_1(displayUnit = "K") = 251.938, dmDes_1 = 100, effDes = 0.8, pDes_1 = 39499.9, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {0, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 2, Tdes_1(displayUnit = "K") = 251.958, dmDes_1 = 10, pDes_1 = 39499.9, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp025(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, Tdes_1(displayUnit = "K") = 320.946, dmDes_1 = 10, effDes = 0.8, pDes_1 = 77419.7, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 4.82914, T1_init = 1800, T2_init = 1352, Tdes_1(displayUnit = "K") = 1800, dmDes_1 = 10, effDes = 0.8, h1_init = 1800 * 1000, h2_init = 1352 * 1000, m_flow1_init = 10, p1_init = 147097e+06, p2_init = 295466, pDes_1 = 1.47097e06, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb046(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 4.43071, T1_init = 1352.18, T2_init = 1020, Tdes_1(displayUnit = "K") = 1352.18, dmDes_1 = 10, effDes = 0.8, h1_init = 1352 * 1000, h2_init = 1020 * 1000, m_flow1_init = 10, p1_init = 295466, p2_init = 65352, pDes_1 = 295466, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {200, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl170(redeclare package Medium = engineAir, Amech_th_def = 0.502433, T1_init = 283.753, T2_init = 232.249, h1_init = 284.150, h2_init = 232474, m_flow1_init = 100, p1_init = 53651.9, p2_init = 26434) annotation(
    Placement(visible = true, transformation(origin = {190, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0788022, T1_init = 1020.52, T2_init = 232.249, h1_init = 1.06994e+06, h2_init = 232474, m_flow1_init = 10, p1_init = 65352.1, p2_init = 26434) annotation(
    Placement(visible = true, transformation(origin = {230, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {120, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 10, a(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(flightToEngine1.port_fluidAmb, Nzl170.port_2) annotation(
    Line(points = {{-90, -30}, {-90, 40}, {200, 40}, {200, 20}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -30}, {-90, 44}, {240, 44}, {240, -32}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{121, 70}, {135, 70}, {135, -38}, {129, -38}, {129, -37}}, color = {0, 0, 127}));
  connect(flightToEngine1.V_tot_out, inlt010.V_tot_in) annotation(
    Line(points = {{-79, -44}, {-67, -44}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, inlt010.port_1) annotation(
    Line(points = {{-80, -32}, {-70, -32}}, color = {0, 127, 255}));
  connect(inlt010.port_2, massFlowRate_Cmp020.port_a) annotation(
    Line(points = {{-50, -32}, {-28, -32}}, color = {0, 127, 255}));
  connect(inlt010.port_2, massFlowRate_Cmp120.port_a) annotation(
    Line(points = {{-50, -32}, {-46, -32}, {-46, 20}, {-40, 20}}, color = {0, 127, 255}));
  connect(inlt010.Fram_out, Perf001.Fram_in) annotation(
    Line(points = {{-53, -44}, {-44, -44}, {-44, -128}, {299, -128}}, color = {0, 0, 127}));
  connect(massFlowRate_Cmp120.m_flow, calc_BPR.u1) annotation(
    Line(points = {{-30, 9}, {-30, -74}, {-2, -74}}, color = {0, 0, 127}));
  connect(massFlowRate_Cmp120.port_b, Cmp120.port_1) annotation(
    Line(points = {{-20, 20}, {-10, 20}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Nzl170.port_1) annotation(
    Line(points = {{10, 20}, {180, 20}}, color = {0, 127, 255}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{10, 12}, {14, 12}, {14, -40}, {20, -40}}));
  connect(Nzl170.Fg_out, calc_engineFg.u2) annotation(
    Line(points = {{195, 12}, {255, 12}, {255, -116}, {268, -116}}, color = {0, 0, 127}));
  connect(MainComb.dm_fuel_out, Perf001.dm_fuel_in) annotation(
    Line(points = {{111, -14}, {262, -14}, {262, -136}, {299, -136}}, color = {0, 0, 127}));
  connect(MainComb.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{110, -10}, {120, -10}, {120, -32}}, color = {191, 0, 0}));
  connect(massFlowRate_Cmp020.m_flow, calc_BPR.u2) annotation(
    Line(points = {{-18, -43}, {-18, -86}, {-2, -86}}, color = {0, 0, 127}));
  connect(massFlowRate_Cmp020.port_b, Cmp020.port_1) annotation(
    Line(points = {{-8, -32}, {20, -32}}, color = {0, 127, 255}));
  connect(Trb041.port_1, Brn036.port_2) annotation(
    Line(points = {{150, -32}, {130, -32}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Brn036.port_1) annotation(
    Line(points = {{80, -32}, {110, -32}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, inertia2.flange_a) annotation(
    Line(points = {{40, -40}, {48, -40}, {48, -90}, {140, -90}}));
  connect(Cmp020.port_2, Cmp025.port_1) annotation(
    Line(points = {{40, -32}, {60, -32}}, color = {0, 127, 255}));
  connect(Cmp025.flange_2, inertia1.flange_a) annotation(
    Line(points = {{80, -40}, {86, -40}, {86, -68}, {110, -68}}));
  connect(inertia1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{130, -68}, {144, -68}, {144, -40}, {150, -40}}));
  connect(Trb041.port_2, Trb046.port_1) annotation(
    Line(points = {{170, -32}, {190, -32}}, color = {0, 127, 255}));
  connect(inertia2.flange_b, Trb046.flange_1) annotation(
    Line(points = {{160, -90}, {184, -90}, {184, -40}, {190, -40}}));
  connect(Trb046.port_2, Nzl070.port_1) annotation(
    Line(points = {{210, -32}, {220, -32}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, calc_engineFg.u1) annotation(
    Line(points = {{235, -40}, {247, -40}, {247, -104}, {268, -104}}, color = {0, 0, 127}));
  connect(calc_engineFg.y, Perf001.Fg_in) annotation(
    Line(points = {{291, -110}, {296, -110}, {296, -124}, {299, -124}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -140}, {320, 100}})),
    Icon(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    version = "",
    uses(Modelica(version = "3.2.2")),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan;
