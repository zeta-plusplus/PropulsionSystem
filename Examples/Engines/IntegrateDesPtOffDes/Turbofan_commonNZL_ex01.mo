within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes;

model Turbofan_commonNZL_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-390, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-370, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 88}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-286, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {350, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 0, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 100) annotation(
    Placement(visible = true, transformation(origin = {-240, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDesShL(NmechDes_paramInput = 10000) annotation(
    Placement(visible = true, transformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp025(redeclare package Medium = engineAir, PRdes_paramInput = 15, effDes_paramInput = 0.85, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDesShH(NmechDes_paramInput = 20000) annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb041(redeclare package Medium = engineAir, effDes_paramInput = 0.8, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb049(redeclare package Medium = engineAir, effDes_paramInput = 0.85, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {160, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {260, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.IdealSpliterBPRatDesignPoint01 SpltDesPt(redeclare package Medium = engineAir, BPRdes_paramInput = 0.9) annotation(
    Placement(visible = true, transformation(origin = {-142, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp020(redeclare package Medium = engineAir, PRdes_paramInput = 2.5, effDes_paramInput = 0.9, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-192, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MixierLossBasedOnEntropy00 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {210, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SpltDesPt.port_3, Mixer.port_2) annotation(
    Line(points = {{-132, 104}, {34, 104}, {34, 108}, {200, 108}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Mixer.port_1) annotation(
    Line(points = {{180, 96}, {200, 96}}, color = {0, 127, 255}));
  connect(Mixer.port_3, Nzl070.port_1) annotation(
    Line(points = {{220, 102}, {230, 102}, {230, 116}, {240, 116}}, color = {0, 127, 255}));
  connect(Nzl070.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{270, 100}, {324, 100}, {324, -82}, {340, -82}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-340, 108}, {-340, 184}, {280, 184}, {280, 116}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{110, -34}, {126, -34}, {126, 96}, {140, 96}}, color = {0, 127, 255}));
  connect(NmechDesShL.flange_2, Trb049.flange_1) annotation(
    Line(points = {{20, 80}, {140, 80}}));
  connect(SpltDesPt.port_2, Cmp025.port_1) annotation(
    Line(points = {{-132, 96}, {-114, 96}, {-114, -34}, {-90, -34}, {-90, -34}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, SpltDesPt.port_1) annotation(
    Line(points = {{-172, 96}, {-152, 96}, {-152, 96}, {-152, 96}}, color = {0, 127, 255}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{80, 32}, {80, 39}}, color = {0, 0, 127}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{57, 0}, {79, 0}, {79, 10}, {79, 10}}, color = {0, 0, 127}));
  connect(NmechDesShH.flange_2, Trb041.flange_1) annotation(
    Line(points = {{20, -50}, {70, -50}, {70, -50}, {70, -50}}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{50, -10}, {70, -10}, {70, -34}, {70, -34}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{40, -10}, {50, -10}}, color = {0, 127, 255}));
  connect(Cmp025.flange_2, NmechDesShH.flange_1) annotation(
    Line(points = {{-50, -50}, {0, -50}}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{-10, 20}, {4, 20}, {4, 6}}, color = {0, 127, 255}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{36, -28}, {36, -98}, {339, -98}}, color = {0, 0, 127}));
  connect(Cmp025.port_2, Comb036.port_1) annotation(
    Line(points = {{-50, -34}, {-50, -10}, {0, -10}}, color = {0, 127, 255}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{-49, 20}, {-42.5, 20}, {-42.5, 24}, {-32, 24}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-49, 50}, {-35, 50}, {-35, 28}, {-30, 28}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-272, 72}, {-256, 72}, {-256, -86}, {339, -86}}, color = {0, 0, 127}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-266, 96}, {-250, 96}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-320, 84}, {-315, 84}, {-315, 96}, {-306, 96}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-318, 72}, {-300, 72}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-379, 98}, {-371, 98}, {-371, 96}, {-362, 96}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-379, 138}, {-367, 138}, {-367, 104}, {-362, 104}}, color = {0, 0, 127}));
  connect(MassFlowDes.port_2, Cmp020.port_1) annotation(
    Line(points = {{-230, 96}, {-212, 96}, {-212, 96}, {-212, 96}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, NmechDesShL.flange_1) annotation(
    Line(points = {{-172, 80}, {0, 80}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-400, -120}, {360, 240}}, preserveAspectRatio = false, initialScale = 0.1), graphics = {Text(origin = {189, 151}, extent = {{-61, 17}, {61, -17}}, textString = "*unfinished yet")}),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_commonNZL_ex01;
