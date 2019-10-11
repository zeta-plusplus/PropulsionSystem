within PropulsionSystem.Examples.Engines.OffDesignSim;

model TurboJet001_012
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir, m_flow1_init = 11.9, p2_init = 96.26 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 615.3, dPqPdes = 0.02, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 937.9 * 1000, p2_init = 919.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 1554, TtOutletDes(displayUnit = "K") = 1600, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 1554, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 919.2 * 1000, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1(switchCausality_dq = PropulsionSystem.Elements.BasicElements.CombustFuel.switchCausality_GeneratedHeat.input_dmFuel, switchInput_dm_fuel = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, T1_init = 1275, T2_init = 1275, dPqPdes = 0.03, h1_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 359.0 * 1000, p2_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {220, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384, T1_init = 1275, T2Tot_init = 1275, T2_init = 945.3, TStat_th_init = 945.3, h1_init = 1.004 * 1000 * 1275, h2Tot_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 945.3, hStat_th_init = 1.004 * 1000 * 945.3, m_flow1_init = 11.9, p1_init = 348.2 * 1000, p2Tot_init = 348.2 * 1000) annotation(
    Placement(visible = true, transformation(origin = {280, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {320, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, T1_init = 1554, T2_init = 1275, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, h1_init = 1.004 * 1000 * 1554, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 359.0 * 1000, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {160, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, T2_init = 615.3, Tdes_1(displayUnit = "K") = 288.16, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 96.26 * 1000, p2_init = 937.9 * 1000, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 5, height = 0.3, offset = 1.1, startTime = 60) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 100, a(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {60, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vol042(redeclare package Medium = engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 359 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {190, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol046(redeclare package Medium = engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 348.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {250, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = engineAir, T_start = 615.3, V = 1, nPorts = 2, p_start = 937.9 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol040(redeclare package Medium = engineAir, T_start = 1554, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol036(redeclare package Medium = engineAir, T_start = 615.3, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection030 annotation(
    Placement(visible = true, transformation(origin = {10, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor030(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
    Placement(visible = true, transformation(origin = {10, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant Gcs(k = 10000) annotation(
    Placement(visible = true, transformation(origin = {-30, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection036 annotation(
    Placement(visible = true, transformation(origin = {70, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor036(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
    Placement(visible = true, transformation(origin = {70, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection040 annotation(
    Placement(visible = true, transformation(origin = {130, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor040(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1554)) annotation(
    Placement(visible = true, transformation(origin = {130, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection042 annotation(
    Placement(visible = true, transformation(origin = {200, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor042(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
    Placement(visible = true, transformation(origin = {200, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor046(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
    Placement(visible = true, transformation(origin = {260, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection046 annotation(
    Placement(visible = true, transformation(origin = {260, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain ctrlP(k = 1) annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator ctrlI(k = 5) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(Cmp020.elementBus1.NcqNcDes_1, gain2.u) annotation(
    Line(points = {{-22, -98}, {-24, -98}, {-24, -110}, {-40, -110}, {-40, -2}, {-40, -2}}, color = {0, 0, 127}));
  connect(Cmp020.elementBus1.NcqNcDes_1, Cmp020.NcqNcDes_1) annotation(
    Line);
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{-20, -90}, {-16, -90}, {-16, -190}, {50, -190}}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, -82}, {-40, -82}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Vol030.ports[1]) annotation(
    Line(points = {{-20, -82}, {-10, -82}, {-10, -80}, {0, -80}}, color = {0, 127, 255}));
  connect(add1.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{52, 50}, {58, 50}, {58, 8}, {52, 8}, {52, -56}, {60, -56}, {60, -54}}, color = {0, 0, 127}));
  connect(ctrlP.y, add1.u1) annotation(
    Line(points = {{11, 60}, {15, 60}, {15, 56}, {27, 56}, {27, 56}}, color = {0, 0, 127}));
  connect(feedback1.y, ctrlP.u) annotation(
    Line(points = {{-30, 60}, {-12, 60}}, color = {0, 0, 127}));
  connect(ctrlI.y, add1.u2) annotation(
    Line(points = {{11, 30}, {15, 30}, {15, 44}, {27, 44}, {27, 44}}, color = {0, 0, 127}));
  connect(feedback1.y, ctrlI.u) annotation(
    Line(points = {{-30, 60}, {-28, 60}, {-28, 30}, {-12, 30}}, color = {0, 0, 127}));
  connect(ramp_rating.y, feedback1.u1) annotation(
    Line(points = {{-58, 60}, {-48, 60}, {-48, 60}, {-48, 60}}, color = {0, 0, 127}));
  connect(gain2.y, feedback1.u2) annotation(
    Line(points = {{-40, 22}, {-40, 22}, {-40, 52}, {-40, 52}}, color = {0, 0, 127}));
  connect(Vol030.ports[2], Duct030.port_1) annotation(
    Line(points = {{0, -80}, {8, -80}, {8, -82}, {20, -82}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Vol036.ports[1]) annotation(
    Line(points = {{40, -82}, {44, -82}, {44, -80}, {60, -80}}, color = {0, 127, 255}));
  connect(Vol030.heatPort, convection030.fluid) annotation(
    Line(points = {{10, -90}, {10, -120}}, color = {191, 0, 0}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -94}, {-48, -94}, {-48, -218}, {309, -218}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{285, -90}, {303.3, -90}, {303.3, -214}, {309, -214}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{81, -64}, {295, -64}, {295, -226}, {309, -226}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -80}, {-90, -76}, {290, -76}, {290, -82}}, color = {0, 127, 255}));
  connect(Vol046.ports[2], Nzl070.port_1) annotation(
    Line(points = {{250, -80}, {260, -80}, {260, -82}, {270, -82}}, color = {0, 127, 255}));
  connect(convection046.solid, heatCapacitor046.port) annotation(
    Line(points = {{260, -140}, {260, -140}, {260, -150}, {260, -150}}, color = {191, 0, 0}));
  connect(Vol046.heatPort, convection046.fluid) annotation(
    Line(points = {{260, -90}, {260, -90}, {260, -120}, {260, -120}}, color = {191, 0, 0}));
  connect(Gcs.y, convection046.Gc) annotation(
    Line(points = {{-19, -140}, {237, -140}, {237, -130}, {249, -130}, {249, -130}}, color = {0, 0, 127}));
  connect(Vol042.ports[2], Duct045.port_1) annotation(
    Line(points = {{190, -80}, {210, -80}, {210, -82}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Vol046.ports[1]) annotation(
    Line(points = {{230, -82}, {232, -82}, {232, -80}, {250, -80}}, color = {0, 127, 255}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -190}, {146, -190}, {146, -90}, {150, -90}}));
  connect(Trb041.port_2, Vol042.ports[1]) annotation(
    Line(points = {{170, -82}, {176, -82}, {176, -80}, {190, -80}}, color = {0, 127, 255}));
  connect(Vol042.heatPort, convection042.fluid) annotation(
    Line(points = {{200, -90}, {200, -90}, {200, -120}, {200, -120}}, color = {191, 0, 0}));
  connect(convection042.solid, heatCapacitor042.port) annotation(
    Line(points = {{200, -140}, {200, -140}, {200, -150}, {200, -150}}, color = {191, 0, 0}));
  connect(Gcs.y, convection042.Gc) annotation(
    Line(points = {{-19, -140}, {171, -140}, {171, -130}, {189, -130}, {189, -130}}, color = {0, 0, 127}));
  connect(Vol040.ports[2], Trb041.port_1) annotation(
    Line(points = {{120, -80}, {134, -80}, {134, -82}, {150, -82}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Vol040.ports[1]) annotation(
    Line(points = {{100, -82}, {108, -82}, {108, -80}, {120, -80}, {120, -80}}, color = {0, 127, 255}));
  connect(Vol040.heatPort, convection040.fluid) annotation(
    Line(points = {{130, -90}, {130, -90}, {130, -120}, {130, -120}}, color = {191, 0, 0}));
  connect(convection030.solid, heatCapacitor030.port) annotation(
    Line(points = {{10, -140}, {10, -140}, {10, -150}, {10, -150}}, color = {191, 0, 0}));
  connect(convection036.solid, heatCapacitor036.port) annotation(
    Line(points = {{70, -140}, {70, -140}, {70, -150}, {70, -150}}, color = {191, 0, 0}));
  connect(convection040.solid, heatCapacitor040.port) annotation(
    Line(points = {{130, -140}, {130, -140}, {130, -150}, {130, -150}}, color = {191, 0, 0}));
  connect(Gcs.y, convection040.Gc) annotation(
    Line(points = {{-19, -140}, {107, -140}, {107, -130}, {119, -130}, {119, -130}}, color = {0, 0, 127}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{80, -60}, {90, -60}, {90, -80}}, color = {191, 0, 0}));
  connect(Vol036.ports[2], Brn036.port_1) annotation(
    Line(points = {{60, -80}, {72, -80}, {72, -82}, {80, -82}, {80, -82}}, color = {0, 127, 255}));
  connect(Vol036.heatPort, convection036.fluid) annotation(
    Line(points = {{70, -90}, {70, -90}, {70, -120}, {70, -120}}, color = {191, 0, 0}));
  connect(Gcs.y, convection030.Gc) annotation(
    Line(points = {{-19, -140}, {-13, -140}, {-13, -130}, {-1, -130}, {-1, -130}}, color = {0, 0, 127}));
  connect(Gcs.y, convection036.Gc) annotation(
    Line(points = {{-19, -140}, {47, -140}, {47, -130}, {59, -130}, {59, -130}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -82}, {-68, -82}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -94}, {-67, -94}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -300}, {360, 100}}), graphics = {Rectangle(origin = {43, -75}, pattern = LinePattern.Dash, extent = {{-27, 29}, {61, -33}}), Text(origin = {70, -43}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -300}, {360, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end TurboJet001_012;
