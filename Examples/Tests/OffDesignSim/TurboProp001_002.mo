within PropulsionSystem.Examples.Tests.OffDesignSim;

model TurboProp001_002
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0149381) annotation(
    Placement(visible = true, transformation(origin = {230, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {300, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 4.95292, Tdes_1(displayUnit = "K") = 1600, WcDes_1_def = 10, dmDes_1 = 10, effDes = 0.8, pDes_1 = 1.88665e+06, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, Tdes_1(displayUnit = "K") = 288.16, dmDes_1 = 10, effDes = 0.80, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 20, height = 200, offset = 1600, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb046(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 4.43071, Tdes_1(displayUnit = "K") = 1352.18, WcDes_1_def = 10, dmDes_1 = 10, effDes = 0.8, pDes_1 = 295466, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {200, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.Propeller1dAeroTip propeller1dAeroTip1(redeclare package Medium = engineAir, CdfDes = 0.001, alpha_CdpMinDes(displayUnit = ""), lAxial_def = 0.05, rHub_1_def = 0.05, rHub_2_def = 0.05, rTip_1_def = 0.4, rTip_2_def = 0.4) annotation(
    Placement(visible = true, transformation(origin = {20, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShProp(J = 1, a(fixed = false, start = 0), w(fixed = true, start = 1 / 1 * 2 * 9000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {70, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {260, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_bladeAngle(k = 75) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShH(J = 1, a(fixed = true, start = 0), w(fixed = false, start = 11000)) annotation(
    Placement(visible = true, transformation(origin = {36, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1, a(fixed = false, start = 0), w(fixed = true, start = 2 * 9000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {160, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 1 / 1) annotation(
    Placement(visible = true, transformation(origin = {110, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = Modelica.Constants.pi / 180) annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain1.y, propeller1dAeroTip1.u_bladeAngle) annotation(
    Line(points = {{22, -90}, {30, -90}, {30, -118}, {30, -118}}, color = {0, 0, 127}));
  connect(const_bladeAngle.y, gain1.u) annotation(
    Line(points = {{-18, -90}, {-2, -90}, {-2, -90}, {-2, -90}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, Trb046.flange_1) annotation(
    Line(points = {{170, -140}, {184, -140}, {184, -10}, {190, -10}, {190, -10}}));
  connect(idealGear1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{120, -140}, {150, -140}, {150, -140}, {150, -140}}));
  connect(ShProp.flange_b, idealGear1.flange_a) annotation(
    Line(points = {{80, -140}, {100, -140}, {100, -140}, {100, -140}}));
  connect(Cmp020.flange_2, ShH.flange_a) annotation(
    Line(points = {{-10, -10}, {-4, -10}, {-4, -32}, {26, -32}, {26, -32}}));
  connect(ShH.flange_b, Trb041.flange_1) annotation(
    Line(points = {{46, -32}, {76, -32}, {76, -10}, {80, -10}, {80, -10}}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-43, -14}, {-34, -14}, {-34, -40}, {169.5, -40}, {169.5, -68}, {289, -68}}, color = {0, 0, 127}));
  connect(propeller1dAeroTip1.flange_2, ShProp.flange_a) annotation(
    Line(points = {{40, -140}, {60, -140}, {60, -140}, {60, -140}}));
  connect(const.y, propeller1dAeroTip1.u_flowAngle) annotation(
    Line(points = {{-39, -160}, {-14, -160}, {-14, -128}, {-2, -128}}, color = {0, 0, 127}));
  connect(propeller1dAeroTip1.y_Fg, add1.u2) annotation(
    Line(points = {{42, -150}, {212, -150}, {212, -56}, {248, -56}}, color = {0, 0, 127}));
  connect(flightToEngine1.V_tot_out, propeller1dAeroTip1.u_flowSpeed) annotation(
    Line(points = {{-79, -14}, {-76, -14}, {-76, -134}, {-2, -134}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, propeller1dAeroTip1.port_amb) annotation(
    Line(points = {{-90, 0}, {-90, 10}, {-72, 10}, {-72, -124}, {0, -124}}, color = {0, 127, 255}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{41, 16}, {279, 16}, {279, -76}, {289, -76}}, color = {0, 0, 127}));
  connect(add1.y, perf001.Fg_in) annotation(
    Line(points = {{271, -50}, {273, -50}, {273, -64}, {289, -64}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, add1.u1) annotation(
    Line(points = {{235, -10}, {243, -10}, {243, -44}, {247, -44}, {247, -44}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 0}, {-90, 5}, {240, 5}, {240, -2}}, color = {0, 127, 255}));
  connect(Trb046.port_2, Nzl070.port_1) annotation(
    Line(points = {{210, -2}, {220, -2}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Trb046.port_1) annotation(
    Line(points = {{130, -2}, {190, -2}}, color = {0, 127, 255}));
  connect(Brn036.TtOutlet_in, ramp_TIT.y) annotation(
    Line(points = {{59, -7}, {64, -7}, {64, 60}, {51, 60}}, color = {0, 0, 127}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-40, -2}, {-35, -2}, {-35, -1}, {-30, -1}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -14}, {-57, -14}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -2}, {-60, -2}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{40, 20}, {50, 20}, {50, 0}}, color = {191, 0, 0}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{30, -2}, {40, -2}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{-10, -2}, {10, -2}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{60, -2}, {80, -2}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, -2}, {108, -2}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -180}, {340, 100}}), graphics = {Rectangle(origin = {35, 5}, pattern = LinePattern.Dash, extent = {{-33, 29}, {35, -31}}), Text(origin = {20, 37}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end TurboProp001_002;
