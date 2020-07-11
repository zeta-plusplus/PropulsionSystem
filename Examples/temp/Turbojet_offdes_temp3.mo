within PropulsionSystem.Examples.temp;

model Turbojet_offdes_temp3
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner EngineSimEnvironment environment annotation(
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
    Placement(visible = true, transformation(origin = {260, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {39.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-60, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable01 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed01 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt1 annotation(
    Placement(visible = true, transformation(origin = {30, -150}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 3000) annotation(
    Placement(visible = true, transformation(origin = {30, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm1 annotation(
    Placement(visible = true, transformation(origin = {30, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ConstraintDesPt1.u_variable, to_rpm1.y) annotation(
    Line(points = {{30, -138}, {30, -138}, {30, -132}, {30, -132}}, color = {0, 0, 127}));
  connect(speedSensor1.w, to_rpm1.u) annotation(
    Line(points = {{30, -100}, {30, -100}, {30, -108}, {30, -108}}, color = {0, 0, 127}));
  connect(ConstraintDesPt1.u_targetValue, const1.y) annotation(
    Line(points = {{30, -162}, {30, -162}, {30, -168}, {30, -168}}, color = {0, 0, 127}));
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-98, -30}, {-92, -30}, {-92, -30}, {-92, -30}}, color = {0, 0, 127}));
  connect(ConstraintDesPt.u_variable, massFlowRate1.m_flow) annotation(
    Line(points = {{-68, -30}, {-60, -30}, {-60, -52}, {-60, -52}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{30, -80}, {80, -80}, {80, -80}, {80, -80}}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{170, -80}, {216, -80}, {216, -124}, {238, -124}, {238, -124}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-160, -40}, {-160, -40}, {-160, 66}, {180, 66}, {180, -64}, {180, -64}}, color = {0, 127, 255}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{120, -64}, {140, -64}, {140, -64}, {140, -64}}, color = {0, 127, 255}));
  connect(Trb.port_1, temperature.port) annotation(
    Line(points = {{80, -64}, {80, -64}, {80, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{0, -80}, {30, -80}, {30, -80}, {30, -80}}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{0, -64}, {8, -64}, {8, -40}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{59.5, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -156}, {238, -156}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {24, -10}, {24, -24}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, Cmp.port_1) annotation(
    Line(points = {{-50, -64}, {-40, -64}, {-40, -64}, {-40, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, massFlowRate1.port_a) annotation(
    Line(points = {{-80, -64}, {-70, -64}, {-70, -64}, {-70, -64}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-28, 20}, {-22, 20}, {-22, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-86, -88}, {-76, -88}, {-76, -132}, {238, -132}}, color = {0, 0, 127}));
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
    experiment(StartTime = 0, StopTime = 140, Tolerance = 1e-06, Interval = 0.0466822),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_offdes_temp3;
