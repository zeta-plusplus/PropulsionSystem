within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbofan_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1400, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {190, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-390, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-370, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-240, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {440, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {190, -10}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {130, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {110, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {420, -150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp120(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, PRdes_paramInput = 1.6, m_flow_des_1_paramInput = 100, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-150, 112}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp020(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, PRdes_paramInput = 2, m_flow_des_1_paramInput = 10, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp025(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, PRdes_paramInput = 20, m_flow_des_1_paramInput = 10, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb041(redeclare package Medium = engineAir, NmechDes_paramInput = 9000, m_flow_des_1_paramInput = 10, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {200, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb049(redeclare package Medium = engineAir, NmechDes_paramInput = 3000, m_flow_des_1_paramInput = 10, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {290, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl170(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed00 Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {380, 48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Cmp120.flange_2, Trb049.flange_1) annotation(
    Line(points = {{-120, 112}, {-36, 112}, {-36, 40}, {260, 40}}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{168, -30}, {190, -30}, {190, -20}, {190, -20}}, color = {0, 0, 127}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{190, 1}, {190, 8}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 40}, {-340, 172}, {400, 172}, {400, 64}, {400, 64}}, color = {0, 127, 255}));
  connect(Nzl170.y_Fg, add1.u1) annotation(
    Line(points = {{190, 120}, {426, 120}, {426, -138}, {426, -138}}, color = {0, 0, 127}));
  connect(Nzl070.y_Fg, add1.u2) annotation(
    Line(points = {{390, 48}, {414, 48}, {414, -138}, {414, -138}}, color = {0, 0, 127}));
  connect(Trb049.port_2, Nzl070.port_1) annotation(
    Line(points = {{320, 64}, {360, 64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl170.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 168}, {200, 168}, {200, 136}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Nzl170.port_1) annotation(
    Line(points = {{-120, 136}, {160, 136}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-320, 16}, {-260, 16}, {-260, 16}, {-260, 16}}, color = {0, 127, 255}));
  connect(Cmp025.flange_2, Trb041.flange_1) annotation(
    Line(points = {{20, -80}, {180, -80}}));
  connect(Cmp020.port_2, Cmp025.port_1) annotation(
    Line(points = {{-60, 56}, {-52, 56}, {-52, -64}, {-20, -64}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Comb036.port_1) annotation(
    Line(points = {{20, -64}, {20, -40}, {110, -40}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, Trb049.flange_1) annotation(
    Line(points = {{-60, 40}, {260, 40}, {260, 40}, {260, 40}}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{220, -64}, {234, -64}, {234, 64}, {260, 64}}, color = {0, 127, 255}));
  connect(MotGene.flange_1, Trb041.flange_1) annotation(
    Line(points = {{110, -100}, {110, -100}, {110, -80}, {180, -80}, {180, -80}}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{160, -40}, {180, -40}, {180, -64}, {180, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-220, 16}, {-194, 16}, {-194, 56}, {-100, 56}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp120.port_1) annotation(
    Line(points = {{-220, 16}, {-208, 16}, {-208, 136}, {-180, 136}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{41, 10}, {75, 10}, {75, -2}, {80, -2}}, color = {0, 0, 127}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{61, -10}, {63.5, -10}, {63.5, -6}, {78, -6}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{100, -10}, {114, -10}, {114, -24}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{150, -40}, {160, -40}}, color = {0, 127, 255}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{146, -58}, {146, -198}, {429, -198}}, color = {0, 0, 127}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{110, -149}, {110, -121}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-226, -8}, {-214, -8}, {-214, -186}, {429, -186}}, color = {0, 0, 127}));
  connect(add1.y, Perf.u_Fg) annotation(
    Line(points = {{420, -161}, {420, -182}, {429, -182}}, color = {0, 0, 127}));
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
