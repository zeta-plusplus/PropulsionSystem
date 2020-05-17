within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbojet_ex01
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir, NmechDes_paramInput = 9000.0, T1_des_paramInput = 251.833, m_flow_1_des_paramInput = 100.0, p1_des_paramInput = 40310.6, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir, NmechDes_paramInput = 9000.0, T1_des_paramInput = 1600.0, m_flow_1_des_paramInput = 103.297, p1_des_paramInput = 399075, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed00 Comb(redeclare package Medium = engineAir, use_u_m_flow_fuel = true) annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {260, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed00 Nzl(redeclare package Medium = engineAir, m_flow_1_des_paramInput = 103.297) annotation(
    Placement(visible = true, transformation(origin = {180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-160, -40}, {-160, 50}, {200, 50}, {200, -64}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{90, 19}, {90, 11}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{90, -11}, {90, -30}, {87, -30}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{60, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{80, -40}, {100, -40}, {100, -64}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{1, -10}, {10, -10}, {10, -32}, {18, -32}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -156}, {238, -156}}, color = {0, 0, 127}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-20, -64}, {-20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, Trb.flange_1) annotation(
    Line(points = {{-20, -80}, {100, -80}}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{140, -64}, {160, -64}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{190, -80}, {213, -80}, {213, -124}, {238, -124}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-86, -88}, {-74, -88}, {-74, -132}, {238, -132}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-138, -76}, {-130.5, -76}, {-130.5, -88}, {-114, -88}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-140, -64}, {-120, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{-80, -64}, {-60, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {300, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.0166722),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex01;
