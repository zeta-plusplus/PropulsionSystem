within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes;

model Turbojet_ex04
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner EngineSimEnvironment environment(timeRemoveDesConstraint = 2)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {260, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {39.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed01 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 10.0)  annotation(
    Placement(visible = true, transformation(origin = {-60, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb(redeclare package Medium = engineAir, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Sources.NmechAtDesignPoint01 NmechDes(use_u_NmechDes = false)  annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(NmechDes.flange_2, Trb.flange_1) annotation(
    Line(points = {{40, -80}, {80, -80}, {80, -80}, {80, -80}}));
  connect(Cmp.flange_2, NmechDes.flange_1) annotation(
    Line(points = {{0, -80}, {20, -80}, {20, -80}, {20, -80}}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{80, -40}, {80, -40}, {80, -64}, {80, -64}}, color = {0, 127, 255}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{120, -64}, {140, -64}, {140, -64}, {140, -64}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{0, -64}, {0, -64}, {0, -40}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, Cmp.port_1) annotation(
    Line(points = {{-50, -64}, {-40, -64}, {-40, -64}, {-40, -64}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-86, -88}, {-76, -88}, {-76, -112}, {238, -112}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -136}, {238, -136}}, color = {0, 0, 127}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{170, -80}, {216, -80}, {216, -104}, {238, -104}}, color = {0, 0, 127}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-80, -64}, {-70, -64}, {-70, -64}, {-70, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-160, -40}, {-160, -40}, {-160, 66}, {180, 66}, {180, -64}, {180, -64}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{59.5, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {24, -10}, {24, -24}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-28, 20}, {-22, 20}, {-22, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{90, 19}, {90, 11}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{90, -11}, {90, -30}, {87, -30}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-138, -76}, {-130.5, -76}, {-130.5, -88}, {-114, -88}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-140, -64}, {-120, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {300, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.0166722),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex04;
