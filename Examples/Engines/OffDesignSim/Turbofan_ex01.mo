within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbofan_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1400, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {190, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-390, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-370, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-240, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {440, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 0, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {190, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {130, -60}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp025(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, PRdes_paramInput = 20, m_flow_des_1_paramInput = 10, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt", use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb041(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, m_flow_des_1_paramInput = 10, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt", use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {200, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl070(redeclare package Medium = engineAir, m_flow_des_1_paramInput = 10) annotation(
    Placement(visible = true, transformation(origin = {380, 48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb049(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, effDes_paramInput = 0.9, m_flow_des_1_paramInput = 10, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt", use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {290, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp120(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, PRdes_paramInput = 1.4, effDes_paramInput = 0.9, m_flow_des_1_paramInput = 100, pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt", use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-150, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl170(redeclare package Medium = engineAir, m_flow_des_1_paramInput = 100) annotation(
    Placement(visible = true, transformation(origin = {200, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {410, -130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Cmp025.flange_2, Trb041.flange_1) annotation(
    Line(points = {{20, -100}, {180, -100}, {180, -100}, {180, -100}}));
  connect(Cmp120.flange_2, Trb049.flange_1) annotation(
    Line(points = {{-120, 40}, {262, 40}, {262, 40}, {260, 40}}));
  connect(Inlt.port_2, Cmp025.port_1) annotation(
    Line(points = {{-220, 16}, {-196, 16}, {-196, -84}, {-20, -84}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Nzl170.port_1) annotation(
    Line(points = {{-120, 64}, {31, 64}, {31, 136}, {180, 136}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp120.port_1) annotation(
    Line(points = {{-220, 16}, {-212, 16}, {-212, 64}, {-180, 64}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Nzl070.port_1) annotation(
    Line(points = {{320, 64}, {360, 64}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{220, -84}, {230, -84}, {230, 64}, {260, 64}}, color = {0, 127, 255}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{61, -30}, {67.5, -30}, {67.5, -26}, {78, -26}}, color = {0, 0, 127}));
  connect(Nzl170.y_Fg, add1.u1) annotation(
    Line(points = {{210, 120}, {416, 120}, {416, -118}, {416, -118}}, color = {0, 0, 127}));
  connect(add1.y, Perf.u_Fg) annotation(
    Line(points = {{410, -142}, {410, -142}, {410, -182}, {430, -182}, {430, -182}}, color = {0, 0, 127}));
  connect(Nzl070.y_Fg, add1.u2) annotation(
    Line(points = {{390, 48}, {404, 48}, {404, -118}, {404, -118}}, color = {0, 0, 127}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{190, -19}, {190, -12}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{61, 0}, {75, 0}, {75, -22}, {80, -22}}, color = {0, 0, 127}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{167, -50}, {189, -50}, {189, -40}, {189, -40}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{100, -30}, {114, -30}, {114, -44}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{150, -60}, {160, -60}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{160, -60}, {180, -60}, {180, -84}, {180, -84}}, color = {0, 127, 255}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{146, -78}, {146, -198}, {429, -198}}, color = {0, 0, 127}));
  connect(Cmp025.port_2, Comb036.port_1) annotation(
    Line(points = {{20, -84}, {20, -60}, {110, -60}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl170.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 168}, {220, 168}, {220, 136}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 40}, {-340, 172}, {400, 172}, {400, 64}, {400, 64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-320, 16}, {-260, 16}, {-260, 16}, {-260, 16}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-226, -8}, {-214, -8}, {-214, -186}, {429, -186}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-378, 30}, {-370, 30}, {-370, 28}, {-362, 28}, {-362, 28}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-379, 70}, {-367, 70}, {-367, 36}, {-363, 36}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-318, 4}, {-274, 4}, {-274, -8}, {-254, -8}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-400, -200}, {480, 180}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_ex01;
