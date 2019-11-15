within PropulsionSystem.Examples.Elements.DetailedModels;

model Propeller1dAero002_03
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0149381) annotation(
    Placement(visible = true, transformation(origin = {180, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {250, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb046(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 2, Tdes_1(displayUnit = "K") = 900, WcDes_1_def = 10, dmDes_1 = 10, effDes = 0.8, pDes_1 = 295466, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.DetailedModels.Propeller1dAeroTip propeller1dAeroTip1(redeclare package Medium = engineAir, CdfDes = 0.01, alpha_CdpMinDes(displayUnit = ""), kCdpDes = 0.2, lAxial_def = 0.05, rHub_1_def = 0.05, rHub_2_def = 0.05, rTip_1_def = 0.5, rTip_2_def = 0.5) annotation(
    Placement(visible = true, transformation(origin = {20, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShProp(J = 10, a(fixed = false, start = 0), w(fixed = true, start = 2 *9000 * (1 / 1) * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {60, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {210, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_bladeAngle(k = 75) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = false, start = 0), w(fixed = true, start = 2 *9000 * (2 * Modelica.Constants.pi / 60))) annotation(
    Placement(visible = true, transformation(origin = {120, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 1 / 1) annotation(
    Placement(visible = true, transformation(origin = {90, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = Modelica.Constants.pi / 180) annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {200, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {200, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 900, m_flow = 10, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(propeller1dAeroTip1.y_Fg, add1.u2) annotation(
    Line(points = {{42, -150}, {172, -150}, {172, -56}, {198, -56}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, add1.u1) annotation(
    Line(points = {{185, -10}, {191, -10}, {191, -44}, {198, -44}}, color = {0, 0, 127}));
  connect(add1.y, perf001.Fg_in) annotation(
    Line(points = {{221, -50}, {223, -50}, {223, -64}, {239, -64}}, color = {0, 0, 127}));
  connect(const1.y, perf001.Fram_in) annotation(
    Line(points = {{211, -90}, {225, -90}, {225, -68}, {239, -68}, {239, -68}}, color = {0, 0, 127}));
  connect(const2.y, perf001.dm_fuel_in) annotation(
    Line(points = {{211, -120}, {231, -120}, {231, -76}, {239, -76}, {239, -76}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Trb046.port_1) annotation(
    Line(points = {{110, -20}, {120, -20}, {120, -2}, {140, -2}}, color = {0, 127, 255}));
  connect(inertia1.flange_b, Trb046.flange_1) annotation(
    Line(points = {{130, -140}, {140, -140}, {140, -10}}));
  connect(Trb046.port_2, Nzl070.port_1) annotation(
    Line(points = {{160, -2}, {170, -2}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 0}, {-90, 5}, {190, 5}, {190, -2}}, color = {0, 127, 255}));
  connect(idealGear1.flange_b, inertia1.flange_a) annotation(
    Line(points = {{100, -140}, {110, -140}}));
  connect(ShProp.flange_b, idealGear1.flange_a) annotation(
    Line(points = {{70, -140}, {80, -140}}));
  connect(propeller1dAeroTip1.flange_2, ShProp.flange_a) annotation(
    Line(points = {{40, -140}, {50, -140}}));
  connect(flightToEngine1.port_fluid2Eng, boundary1.ports[1]) annotation(
    Line(points = {{-80, -2}, {-60, -2}, {-60, -30}, {-40, -30}}, color = {0, 127, 255}));
  connect(gain1.y, propeller1dAeroTip1.u_bladeAngle) annotation(
    Line(points = {{22, -90}, {30, -90}, {30, -118}, {30, -118}}, color = {0, 0, 127}));
  connect(const_bladeAngle.y, gain1.u) annotation(
    Line(points = {{-18, -90}, {-2, -90}, {-2, -90}, {-2, -90}}, color = {0, 0, 127}));
  connect(const.y, propeller1dAeroTip1.u_flowAngle) annotation(
    Line(points = {{-39, -160}, {-14, -160}, {-14, -128}, {-2, -128}}, color = {0, 0, 127}));
  connect(flightToEngine1.V_tot_out, propeller1dAeroTip1.u_flowSpeed) annotation(
    Line(points = {{-79, -14}, {-76, -14}, {-76, -134}, {-2, -134}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, propeller1dAeroTip1.port_amb) annotation(
    Line(points = {{-90, 0}, {-90, 10}, {-72, 10}, {-72, -124}, {0, -124}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -180}, {260, 40}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Propeller1dAero002_03;
