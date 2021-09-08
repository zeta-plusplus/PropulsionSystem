within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes;

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
    Placement(visible = true, transformation(origin = {-390, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-370, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-290, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {320, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-120, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-64, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp120(redeclare package Medium = engineAir, PRdes_paramInput = 1.5, effDes_paramInput = 0.9, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 100)  annotation(
    Placement(visible = true, transformation(origin = {-250, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.IdealSpliterBPRatDesignPoint01 SpltDesPt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-220, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp020(redeclare package Medium = engineAir, PRdes_paramInput = 2, effDes_paramInput = 0.9, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-160, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDesShL(NmechDes_paramInput = 3000)  annotation(
    Placement(visible = true, transformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp025(redeclare package Medium = engineAir, PRdes_paramInput = 20, effDes_paramInput = 0.85, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDesShH(NmechDes_paramInput = 9000)  annotation(
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb041(redeclare package Medium = engineAir, effDes_paramInput = 0.8, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {140, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb049(redeclare package Medium = engineAir, effDes_paramInput = 0.85, use_tableFile_Wc = true, use_tableFile_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {202, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl170(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {140, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {260, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Fittings.TeeJunctionIdeal teeJunctionIdeal1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-340, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
equation
  connect(teeJunctionIdeal1.port_1, Nzl070.port_2) annotation(
    Line(points = {{-340, 170}, {-340, 180}, {280, 180}, {280, 96}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, teeJunctionIdeal1.port_2) annotation(
    Line(points = {{-340, 60}, {-340, 150}}, color = {0, 127, 255}));
  connect(teeJunctionIdeal1.port_3, Nzl170.port_2) annotation(
    Line(points = {{-330, 160}, {160, 160}, {160, 136}}, color = {0, 127, 255}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-379, 90}, {-367, 90}, {-367, 56}, {-362, 56}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-379, 50}, {-371, 50}, {-371, 48}, {-362, 48}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-318, 24}, {-318, 12}, {-304, 12}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-320, 36}, {-310, 36}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Nzl070.port_1) annotation(
    Line(points = {{222, 96}, {240, 96}}, color = {0, 127, 255}));
  connect(NmechDesShL.flange_2, Trb049.flange_1) annotation(
    Line(points = {{20, 80}, {182, 80}}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{160, -34}, {168, -34}, {168, 96}, {182, 96}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Nzl170.port_1) annotation(
    Line(points = {{-110, 110}, {98, 110}, {98, 136}, {120, 136}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, massFlowRate1.port_a) annotation(
    Line(points = {{-160, 96}, {-150, 96}, {-150, 110}, {-130, 110}}, color = {0, 127, 255}));
  connect(Cmp120.flange_2, NmechDesShL.flange_1) annotation(
    Line(points = {{-160, 80}, {0, 80}}));
  connect(SpltDesPt.port_3, Cmp120.port_1) annotation(
    Line(points = {{-210, 44}, {-206, 44}, {-206, 96}, {-200, 96}}, color = {0, 127, 255}));
  connect(Nzl170.y_Fg, add1.u1) annotation(
    Line(points = {{150, 120}, {326, 120}, {326, -18}, {326, -18}}, color = {0, 0, 127}));
  connect(Nzl070.y_Fg, add1.u2) annotation(
    Line(points = {{270, 80}, {314, 80}, {314, -18}, {314, -18}}, color = {0, 0, 127}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{100, -10}, {120, -10}, {120, -34}, {120, -34}}, color = {0, 127, 255}));
  connect(NmechDesShH.flange_2, Trb041.flange_1) annotation(
    Line(points = {{70, -50}, {120, -50}, {120, -50}, {120, -50}}));
  connect(massFlowRate2.port_b, Cmp025.port_1) annotation(
    Line(points = {{-54, -34}, {-40, -34}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Comb036.port_1) annotation(
    Line(points = {{0, -34}, {0, -10}, {50, -10}}, color = {0, 127, 255}));
  connect(Cmp025.flange_2, NmechDesShH.flange_1) annotation(
    Line(points = {{0, -50}, {50, -50}}));
  connect(Cmp020.port_2, massFlowRate2.port_a) annotation(
    Line(points = {{-140, 36}, {-128, 36}, {-128, -34}, {-74, -34}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, NmechDesShL.flange_1) annotation(
    Line(points = {{-140, 20}, {-108, 20}, {-108, 80}, {0, 80}}));
  connect(SpltDesPt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-210, 36}, {-180, 36}, {-180, 36}, {-180, 36}}, color = {0, 127, 255}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-270, 36}, {-260, 36}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-276, 12}, {-214, 12}, {-214, -86}, {339, -86}}, color = {0, 0, 127}));
  connect(MassFlowDes.port_2, SpltDesPt.port_1) annotation(
    Line(points = {{-240, 36}, {-230, 36}, {-230, 36}, {-230, 36}}, color = {0, 127, 255}));
  connect(add1.y, Perf.u_Fg) annotation(
    Line(points = {{320, -41}, {320, -41}, {320, -81}, {340, -81}, {340, -81}}, color = {0, 0, 127}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{86, -28}, {86, -98}, {339, -98}}, color = {0, 0, 127}));
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
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{90, -10}, {100, -10}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-400, -120}, {360, 240}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "csv"));
end Turbofan_ex01;
