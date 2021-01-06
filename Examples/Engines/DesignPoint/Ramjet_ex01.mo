within PropulsionSystem.Examples.Engines.DesignPoint;

model Ramjet_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, alt_paramInput = 10000, use_u_MN = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 7.10543e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct(redeclare package Medium = engineAir, dPqP_paramInput = 0.05) annotation(
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -4}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct1(redeclare package Medium = engineAir, dPqP_paramInput = 0.05) annotation(
    Placement(visible = true, transformation(origin = {250, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {300, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {350, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {120, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {200, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {210, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_m_flow(k = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 200, offset = 1400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {210, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropy s_amb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropy s_inlt_in(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEntropy s_comb_in(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {120, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEntropy s_comb_out(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {210, -14}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid_MnFlt(amplitude = -0.5, falling = 10, nperiod = 1, offset = 0.9, period = 50, rising = 10, startTime = 10, width = 30)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(trapezoid_MnFlt.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-78, 10}, {-74, 10}, {-74, 8}, {-62, 8}, {-62, 8}}, color = {0, 0, 127}));
  connect(s_comb_out.port, Duct1.port_1) annotation(
    Line(points = {{210, -4}, {240, -4}, {240, -4}, {240, -4}}, color = {0, 127, 255}));
  connect(temperature.port, s_comb_out.port) annotation(
    Line(points = {{200, -4}, {210, -4}, {210, -4}, {210, -4}}, color = {0, 127, 255}));
  connect(s_comb_in.port, Comb.port_1) annotation(
    Line(points = {{120, -4}, {140, -4}, {140, -4}, {140, -4}}, color = {0, 127, 255}));
  connect(Duct.port_2, s_comb_in.port) annotation(
    Line(points = {{110, -4}, {120, -4}, {120, -4}, {120, -4}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Duct.port_1) annotation(
    Line(points = {{80, -4}, {90, -4}, {90, -4}, {90, -4}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, s_inlt_in.port) annotation(
    Line(points = {{10, -4}, {30, -4}, {30, -4}, {30, -4}}, color = {0, 127, 255}));
  connect(s_inlt_in.port, Inlt.port_1) annotation(
    Line(points = {{30, -4}, {40, -4}, {40, -4}, {40, -4}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-18, -16}, {-8, -16}, {-8, -28}, {46, -28}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{74, -28}, {74, -66}, {339, -66}}, color = {0, 0, 127}));
  connect(s_amb.port, Nzl.port_2) annotation(
    Line(points = {{-40, 40}, {-40, 40}, {-40, 68}, {320, 68}, {320, -4}, {320, -4}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, s_amb.port) annotation(
    Line(points = {{-40, 20}, {-40, 20}, {-40, 40}, {-40, 40}}, color = {0, 127, 255}));
  connect(ramp1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{210, 60}, {210, 60}, {210, 46}, {210, 46}}, color = {0, 0, 127}));
  connect(Duct1.port_2, Nzl.port_1) annotation(
    Line(points = {{260, -4}, {280, -4}}, color = {0, 127, 255}));
  connect(const_m_flow.y, Constraint.u_targetValue) annotation(
    Line(points = {{0, 58}, {0, 58}, {0, 42}, {0, 42}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, Constraint.u_variable) annotation(
    Line(points = {{0, 8}, {0, 19}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{92, 40}, {96, 40}, {96, 48}, {110, 48}, {110, 48}}, color = {0, 0, 127}));
  connect(temperature.T, Constraint1.u_variable) annotation(
    Line(points = {{208, 6}, {210, 6}, {210, 24}, {210, 24}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{180, -4}, {200, -4}, {200, -4}, {200, -4}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, massFlowRate1.port_a) annotation(
    Line(points = {{-20, -4}, {-12, -4}, {-12, -4}, {-10, -4}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{130, 40}, {144, 40}, {144, 12}, {144, 12}}, color = {0, 127, 255}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{176, -22}, {176, -78}, {339, -78}}, color = {0, 0, 127}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{310, -20}, {324, -20}, {324, -62}, {338, -62}, {338, -62}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {360, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Ramjet_ex01;
