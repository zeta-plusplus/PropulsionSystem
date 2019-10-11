within PropulsionSystem.Examples.Engines.OffDesignSim;

model TurboFan001_005
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet inlt010(redeclare package Medium = engineAir, effRamDes = 0.98) annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T2_init = 1800, TtOutletDes(displayUnit = "K") = 1800, h2_init = 1800 * 1000, m_flow1_init = 10, p2_init = 1.47097e+06, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {180, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel MainComb annotation(
    Placement(visible = true, transformation(origin = {160, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance Perf001 annotation(
    Placement(visible = true, transformation(origin = {390, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add calc_engineFg annotation(
    Placement(visible = true, transformation(origin = {360, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp120(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, -12}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp020(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, -52}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Division calc_BPR annotation(
    Placement(visible = true, transformation(origin = {10, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 5, height = -200, offset = 1800, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {160, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp120(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 1.4, Tdes_1(displayUnit = "K") = 251.938, dmDes_1 = 100, effDes = 0.8, pDes_1 = 39499.9, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 2, Tdes_1(displayUnit = "K") = 251.958, dmDes_1 = 10, pDes_1 = 39499.9, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp025(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, Tdes_1(displayUnit = "K") = 320.946, dmDes_1 = 10, effDes = 0.8, pDes_1 = 77419.7, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 4.82914, T1_init = 1800, T2_init = 1352, Tdes_1(displayUnit = "K") = 1800, dmDes_1 = 10, effDes = 0.8, h1_init = 1800 * 1000, h2_init = 1352 * 1000, m_flow1_init = 10, p1_init = 147097e+06, p2_init = 295466, pDes_1 = 1.47097e06, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {212, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb046(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 4.43071, T1_init = 1352.18, T2_init = 1020, Tdes_1(displayUnit = "K") = 1352.18, dmDes_1 = 10, effDes = 0.8, h1_init = 1352 * 1000, h2_init = 1020 * 1000, m_flow1_init = 10, p1_init = 295466, p2_init = 65352, pDes_1 = 295466, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {270, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl170(redeclare package Medium = engineAir, Amech_th_def = 0.502433, T1_init = 283.753, T2_init = 232.249, h1_init = 284.150, h2_init = 232474, m_flow1_init = 100, p1_init = 53651.9, p2_init = 26434) annotation(
    Placement(visible = true, transformation(origin = {290, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0788022, T1_init = 1020.52, T2_init = 232.249, h1_init = 1.06994e+06, h2_init = 232474, m_flow1_init = 10, p1_init = 65352.1, p2_init = 26434) annotation(
    Placement(visible = true, transformation(origin = {330, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cmp020.flange_2, Trb046.flange_1) annotation(
    Line(points = {{70, -60}, {76, -60}, {76, -110}, {244, -110}, {244, -60}, {260, -60}, {260, -60}}));
  connect(Cmp025.flange_2, Trb041.flange_1) annotation(
    Line(points = {{130, -60}, {138, -60}, {138, -86}, {198, -86}, {198, -60}, {202, -60}, {202, -60}}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{10, -20}, {28, -20}, {28, -60}, {50, -60}, {50, -60}}));
  connect(Trb046.port_2, Nzl070.port_1) annotation(
    Line(points = {{280, -52}, {320, -52}, {320, -52}, {320, -52}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Trb046.port_1) annotation(
    Line(points = {{222, -52}, {260, -52}, {260, -52}, {260, -52}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Brn036.port_1) annotation(
    Line(points = {{130, -52}, {170, -52}, {170, -52}, {170, -52}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Cmp025.port_1) annotation(
    Line(points = {{70, -52}, {108, -52}, {108, -52}, {110, -52}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Nzl170.port_1) annotation(
    Line(points = {{10, -12}, {280, -12}, {280, -12}, {280, -12}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp020.port_b, Cmp020.port_1) annotation(
    Line(points = {{0, -52}, {50, -52}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{171, 40}, {191, 40}, {191, -58}, {189, -58}, {189, -56}}, color = {0, 0, 127}));
  connect(MainComb.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{170, -30}, {180, -30}, {180, -52}}, color = {191, 0, 0}));
  connect(Trb041.port_1, Brn036.port_2) annotation(
    Line(points = {{202, -52}, {190, -52}, {190, -52}, {190, -52}}, color = {0, 127, 255}));
  connect(MainComb.dm_fuel_out, Perf001.dm_fuel_in) annotation(
    Line(points = {{171, -34}, {316, -34}, {316, -156}, {379, -156}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl170.port_2) annotation(
    Line(points = {{-90, -50}, {-90, 10}, {300, 10}, {300, -12}}, color = {0, 127, 255}));
  connect(Nzl170.Fg_out, calc_engineFg.u2) annotation(
    Line(points = {{295, -20}, {301, -20}, {301, -136}, {347, -136}, {347, -136}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -50}, {-90, 16}, {340, 16}, {340, -52}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, calc_engineFg.u1) annotation(
    Line(points = {{335, -60}, {343, -60}, {343, -100}, {337, -100}, {337, -124}, {347, -124}, {347, -124}}, color = {0, 0, 127}));
  connect(calc_engineFg.y, Perf001.Fg_in) annotation(
    Line(points = {{371, -130}, {376, -130}, {376, -144}, {379, -144}}, color = {0, 0, 127}));
  connect(inlt010.Fram_out, Perf001.Fram_in) annotation(
    Line(points = {{-53, -64}, {-44, -64}, {-44, -148}, {379, -148}}, color = {0, 0, 127}));
  connect(massFlowRate_Cmp120.port_b, Cmp120.port_1) annotation(
    Line(points = {{-20, -12}, {-10, -12}}, color = {0, 127, 255}));
  connect(inlt010.port_2, massFlowRate_Cmp120.port_a) annotation(
    Line(points = {{-50, -52}, {-46, -52}, {-46, -12}, {-40, -12}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp120.m_flow, calc_BPR.u1) annotation(
    Line(points = {{-30, -23}, {-30, -124}, {-2, -124}}, color = {0, 0, 127}));
  connect(inlt010.port_2, massFlowRate_Cmp020.port_a) annotation(
    Line(points = {{-50, -52}, {-20, -52}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp020.m_flow, calc_BPR.u2) annotation(
    Line(points = {{-10, -63}, {-10, -81}, {-16, -81}, {-16, -134}, {-2, -134}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, inlt010.port_1) annotation(
    Line(points = {{-80, -54}, {-70, -54}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, inlt010.V_tot_in) annotation(
    Line(points = {{-79, -66}, {-67, -66}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    Icon(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    version = "",
    uses(Modelica(version = "3.2.2")),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TurboFan001_005;
