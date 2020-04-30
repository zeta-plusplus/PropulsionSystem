within PropulsionSystem.Examples.Engines.OffDesignSim;

model TurbofanLowBPR_ex02
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1400, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-390, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-370, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-260, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {330, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 0, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp025(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, PRdes_paramInput = 20, m_flow_des_1_paramInput = 10, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt", use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb041(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, m_flow_des_1_paramInput = 10, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt", use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl070(redeclare package Medium = engineAir, m_flow_des_1_paramInput = 20) annotation(
    Placement(visible = true, transformation(origin = {280, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb049(redeclare package Medium = engineAir, NmechDes_paramInput = 6000, effDes_paramInput = 0.9, m_flow_des_1_paramInput = 10, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt", use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {160, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp020(redeclare package Medium = engineAir, NmechDes_paramInput = 6000, PRdes_paramInput = 1.4, effDes_paramInput = 0.9, m_flow_des_1_paramInput = 20, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt", use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-201, 101}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealMixer01 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {220, 56}, extent = {{-20, -12}, {20, 12}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-140, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-160, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Division getBPR annotation(
    Placement(visible = true, transformation(origin = {-90, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = Modelica.Constants.inf, uMin = 0.0 + 1.0e-10)  annotation(
    Placement(visible = true, transformation(origin = {-130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{-59, 40}, {-52.5, 40}, {-52.5, 44}, {-42, 44}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-59, 70}, {-45, 70}, {-45, 48}, {-40, 48}}, color = {0, 0, 127}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{60, 51}, {60, 58}}, color = {0, 0, 127}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{37, 20}, {59, 20}, {59, 30}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{-20, 40}, {-16, 40}, {-16, 26}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{30, 10}, {80, 10}, {80, -14}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{20, 10}, {30, 10}}, color = {0, 127, 255}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{16, -8}, {16, -78}, {319, -78}}, color = {0, 0, 127}));
  connect(Cmp025.port_2, Comb036.port_1) annotation(
    Line(points = {{-100, -14}, {-100, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{120, -14}, {120, 56}, {140, 56}}, color = {0, 127, 255}));
  connect(Cmp025.flange_2, Trb041.flange_1) annotation(
    Line(points = {{-100, -30}, {80, -30}}));
  connect(limiter1.y, getBPR.u2) annotation(
    Line(points = {{-118, 80}, {-114, 80}, {-114, 144}, {-102, 144}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, getBPR.u1) annotation(
    Line(points = {{-140, 130}, {-140, 156}, {-102, 156}}, color = {0, 0, 127}));
  connect(massFlowRate2.m_flow, limiter1.u) annotation(
    Line(points = {{-148, 80}, {-142, 80}, {-142, 80}, {-142, 80}}, color = {0, 0, 127}));
  connect(Cmp020.port_2, massFlowRate2.port_a) annotation(
    Line(points = {{-180, 118}, {-160, 118}, {-160, 90}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, Cmp025.port_1) annotation(
    Line(points = {{-160, 70}, {-160, -14}, {-140, -14}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, massFlowRate1.port_a) annotation(
    Line(points = {{-180, 118}, {-150, 118}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Mixer.port_2) annotation(
    Line(points = {{-130, 118}, {188, 118}, {188, 64}, {200, 64}}, color = {0, 127, 255}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-379, 80}, {-370.5, 80}, {-370.5, 76}, {-362, 76}}, color = {0, 0, 127}));
  connect(Nzl070.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{290, 40}, {312, 40}, {312, -62}, {319, -62}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-246, 72}, {-236, 72}, {-236, -66}, {319, -66}}, color = {0, 0, 127}));
  connect(Mixer.port_3, Nzl070.port_1) annotation(
    Line(points = {{240, 56}, {260, 56}, {260, 56}, {260, 56}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Mixer.port_1) annotation(
    Line(points = {{180, 56}, {200, 56}, {200, 56}, {200, 56}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-340, 80}, {-340, 172}, {300, 172}, {300, 56}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, Trb049.flange_1) annotation(
    Line(points = {{-180, 101}, {126, 101}, {126, 40}, {140, 40}}));
  connect(Inlt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-240, 96}, {-240, 118}, {-222, 118}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-318, 44}, {-286, 44}, {-286, 72}, {-274, 72}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-320, 56}, {-306, 56}, {-306, 96}, {-280, 96}}, color = {0, 127, 255}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-378, 30}, {-370, 30}, {-370, 68}, {-362, 68}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-400, -100}, {380, 180}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end TurbofanLowBPR_ex02;
