within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbofan_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-350, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-330, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-300, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-240, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-350, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-350, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {350, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 0, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp025(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, PRdes_paramInput =  10, T1_des_paramInput = 312.983, effDes_paramInput = 0.8, m_flow_1_des_paramInput = 90.9091, p1_des_paramInput = 79815, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt", use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb041(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, T1_des_paramInput = 1600, effDes_paramInput = 0.85, m_flow_1_des_paramInput = 93.5793, p1_des_paramInput = 790169, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt", use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {140, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed00 Nzl070(redeclare package Medium = engineAir, m_flow_1_des_paramInput = 93.5793) annotation(
    Placement(visible = true, transformation(origin = {280, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb049(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, T1_des_paramInput = 1329.58, effDes_paramInput = 0.85, m_flow_1_des_paramInput = 93.5793, p1_des_paramInput = 285788, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt", use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {220, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp120(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, PRdes_paramInput = 1.5, T1_des_paramInput = 251.833, effDes_paramInput = 0.9, m_flow_1_des_paramInput = 909.091, p1_des_paramInput = 40310.6, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt", use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-180, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed00 Nzl170(redeclare package Medium = engineAir, m_flow_1_des_paramInput = 909.091) annotation(
    Placement(visible = true, transformation(origin = {140, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {320, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-130, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Modelica.Constants.inf, uMin = 0.0 + 1.0e-10)  annotation(
    Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Division getBPR annotation(
    Placement(visible = true, transformation(origin = {-70, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp020(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, PRdes_paramInput = 2.0, T1_des_paramInput = 251.833, effDes_paramInput = 0.9, m_flow_1_des_paramInput = 90.091, p1_des_paramInput = 40310.6, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1.0, a(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1.0, a(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inertia2.flange_b, Trb049.flange_1) annotation(
    Line(points = {{60, 80}, {200, 80}, {200, 80}, {200, 80}}));
  connect(Cmp020.flange_2, inertia2.flange_a) annotation(
    Line(points = {{-80, 20}, {-52, 20}, {-52, 80}, {40, 80}, {40, 80}}));
  connect(inertia1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -50}, {120, -50}, {120, -50}, {120, -50}}));
  connect(Cmp025.flange_2, inertia1.flange_a) annotation(
    Line(points = {{20, -50}, {50, -50}}));
  connect(Cmp020.port_2, massFlowRate2.port_a) annotation(
    Line(points = {{-80, 36}, {-70, 36}, {-70, -34}, {-50, -34}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-220, 36}, {-120, 36}}, color = {0, 127, 255}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{-160, 100}, {-152, 100}, {-152, 20}, {-120, 20}}));
  connect(massFlowRate1.m_flow, getBPR.u1) annotation(
    Line(points = {{-130, 127}, {-130, 138}, {-76, 138}}, color = {0, 0, 127}));
  connect(limiter1.y, getBPR.u2) annotation(
    Line(points = {{-38, 11}, {-38, 62.5}, {-64, 62.5}, {-64, 138}}, color = {0, 0, 127}));
  connect(Cmp120.port_2, massFlowRate1.port_a) annotation(
    Line(points = {{-160, 116}, {-140, 116}, {-140, 116}, {-140, 116}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Nzl170.port_1) annotation(
    Line(points = {{-120, 116}, {26, 116}, {26, 136}, {120, 136}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp120.port_1) annotation(
    Line(points = {{-220, 36}, {-212, 36}, {-212, 116}, {-200, 116}}, color = {0, 127, 255}));
  connect(massFlowRate2.m_flow, limiter1.u) annotation(
    Line(points = {{-40, -23}, {-40, -17.5}, {-38, -17.5}, {-38, -12}}, color = {0, 0, 127}));
  connect(massFlowRate2.port_b, Cmp025.port_1) annotation(
    Line(points = {{-30, -34}, {-20, -34}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Comb036.port_1) annotation(
    Line(points = {{20, -34}, {20, -10}, {50, -10}}, color = {0, 127, 255}));
  connect(Nzl070.y_Fg, add1.u2) annotation(
    Line(points = {{290, 80}, {314, 80}, {314, -18}}, color = {0, 0, 127}));
  connect(add1.y, Perf.u_Fg) annotation(
    Line(points = {{320, -41}, {320, -41}, {320, -81}, {340, -81}, {340, -81}}, color = {0, 0, 127}));
  connect(Nzl170.y_Fg, add1.u1) annotation(
    Line(points = {{150, 120}, {326, 120}, {326, -18}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-226, 12}, {-214, 12}, {-214, -86}, {339, -86}}, color = {0, 0, 127}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{86, -28}, {86, -98}, {339, -98}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-300, 60}, {-300, 172}, {300, 172}, {300, 96}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Nzl070.port_1) annotation(
    Line(points = {{240, 96}, {260, 96}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{160, -34}, {176, -34}, {176, 96}, {200, 96}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl170.port_2) annotation(
    Line(points = {{-300, 60}, {-300, 168}, {160, 168}, {160, 136}}, color = {0, 127, 255}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{130, 31}, {130, 38}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{1, 50}, {15, 50}, {15, 28}, {20, 28}}, color = {0, 0, 127}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{1, 20}, {7.5, 20}, {7.5, 24}, {18, 24}}, color = {0, 0, 127}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{107, 0}, {129, 0}, {129, 10}, {129, 10}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{40, 20}, {54, 20}, {54, 6}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{100, -10}, {120, -10}, {120, -34}, {120, -34}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{90, -10}, {100, -10}}, color = {0, 127, 255}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-339, 90}, {-327, 90}, {-327, 56}, {-323, 56}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-339, 50}, {-331, 50}, {-331, 48}, {-323, 48}, {-323, 48}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-278, 24}, {-274, 24}, {-274, 12}, {-254, 12}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-280, 36}, {-260, 36}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-360, -120}, {360, 180}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "csv"));
end Turbofan_ex01;
