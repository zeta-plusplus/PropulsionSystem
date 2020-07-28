within PropulsionSystem.Examples.temp;

model Turbofan_temp01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-180, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-180, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {130, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {79.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir, PRdes_paramInput = 20, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {20, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable01 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed01 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {260, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 100.0) annotation(
    Placement(visible = true, transformation(origin = {-60, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint NmechDes(NmechDes_paramInput = 10000.0) annotation(
    Placement(visible = true, transformation(origin = {70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp1(redeclare package Medium = engineAir, PRdes_paramInput = 1.5, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {20, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable01 Trb1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {200, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint NmechDes1(NmechDes_paramInput = 3000.0) annotation(
    Placement(visible = true, transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.IdealSpliterBPRatDesignPoint SpltDesPt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-34, -64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-160, -40}, {-160, 128}, {280, 128}, {280, 96}}, color = {0, 127, 255}));
  connect(NmechDes1.flange_2, Trb1.flange_1) annotation(
    Line(points = {{120, 80}, {140, 80}, {140, 60}, {180, 60}}));
  connect(Cmp1.flange_2, NmechDes1.flange_1) annotation(
    Line(points = {{40, 80}, {100, 80}}));
  connect(Cmp1.port_2, Nzl.port_1) annotation(
    Line(points = {{40, 96}, {240, 96}}, color = {0, 127, 255}));
  connect(Trb.port_2, Trb1.port_1) annotation(
    Line(points = {{160, -64}, {168, -64}, {168, 76}, {180, 76}}, color = {0, 127, 255}));
  connect(Trb1.port_2, Nzl.port_1) annotation(
    Line(points = {{220, 76}, {230, 76}, {230, 96}, {240, 96}}, color = {0, 127, 255}));
  connect(SpltDesPt.port_3, Cmp1.port_1) annotation(
    Line(points = {{-28, -60}, {-28, -60}, {-28, 96}, {0, 96}, {0, 96}}, color = {0, 127, 255}));
  connect(SpltDesPt.port_2, Cmp.port_1) annotation(
    Line(points = {{-28, -64}, {0, -64}, {0, -64}, {0, -64}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, SpltDesPt.port_1) annotation(
    Line(points = {{-50, -64}, {-40, -64}, {-40, -64}, {-40, -64}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{130, 19}, {130, 11}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{11, 20}, {17, 20}, {17, -2}, {29, -2}, {29, -2}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{130, -11}, {130, -30}, {127, -30}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{99.5, -39.8}, {120, -39.8}}, color = {0, 127, 255}));
  connect(Trb.port_1, temperature.port) annotation(
    Line(points = {{120, -64}, {120, -64}, {120, -40}, {120, -40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{50, -10}, {64, -10}, {64, -24}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{40, -64}, {40, -40}, {60, -40}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, NmechDes.flange_1) annotation(
    Line(points = {{40, -80}, {60, -80}}));
  connect(NmechDes.flange_2, Trb.flange_1) annotation(
    Line(points = {{80, -80}, {120, -80}, {120, -80}, {120, -80}}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-80, -64}, {-70, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-138, -76}, {-130.5, -76}, {-130.5, -88}, {-114, -88}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-140, -64}, {-120, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -120}, {300, 160}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 140, Tolerance = 1e-06, Interval = 0.0466822),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_temp01;
