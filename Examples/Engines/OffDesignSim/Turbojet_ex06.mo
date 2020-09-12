within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbojet_ex06
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
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir, NmechDes_paramInput = 9000.0, PRdes_paramInput = 20, T1_des_paramInput = 251.833, m_flow_1_des_paramInput = 100.0, p1_des_paramInput = 40310.6, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_effAud = true, use_u_s_PRaud = true, use_u_s_WcAud = true, use_u_s_effAud = false) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir, NmechDes_paramInput = 9000.0, T1_des_paramInput = 1600.0, m_flow_1_des_paramInput = 103.297, p1_des_paramInput = 399075, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_effAud = true, use_u_s_WcAud = false) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
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
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed00 Nzl(redeclare package Medium = engineAir, m_flow_1_des_paramInput = 103.297) annotation(
    Placement(visible = true, transformation(origin = {180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_s_WcAud(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-72, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_s_PRaud(duration = 10, height = 0, offset = 1, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-40, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_a_effAud(duration = 10, height = 0.0, offset = 0, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-10, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_s_WcAud(duration = 10, height = 0, offset = 1, startTime = 90) annotation(
    Placement(visible = true, transformation(origin = {100, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_a_effAud(duration = 10, height = 0.0, offset = 0, startTime = 110) annotation(
    Placement(visible = true, transformation(origin = {130, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {39.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Output.dispVarPyConsole02_00 dispVarPyConsole(nVariables = 2, nameVariables = {"time[s]", "Fn[N]"})  annotation(
    Placement(visible = true, transformation(origin = {310, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Utilities.TimeSignalOut timeSignalOut1 annotation(
    Placement(visible = true, transformation(origin = {170, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Perf.y_Fn, dispVarPyConsole.u_variables[2]) annotation(
    Line(points = {{282, -128}, {292, -128}, {292, -190}, {298, -190}, {298, -190}}, color = {0, 0, 127}));
  connect(timeSignalOut1.y, dispVarPyConsole.u_variables[1]) annotation(
    Line(points = {{182, -190}, {299, -190}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-28, 20}, {-22, 20}, {-22, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {24, -10}, {24, -24}, {24, -24}}, color = {0, 127, 255}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -58}, {56, -156}, {238, -156}, {238, -156}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{60, -40}, {80, -40}, {80, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-20, -64}, {-20, -64}, {-20, -40}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(ramp_Cmp_s_WcAud.y, Cmp.u_s_WcAud) annotation(
    Line(points = {{-72, -138}, {-72, -110}, {-60, -110}, {-60, -98}}, color = {0, 0, 127}));
  connect(ramp_Cmp_a_effAud.y, Cmp.u_a_effAud) annotation(
    Line(points = {{-10, -138}, {-10, -108}, {-20, -108}, {-20, -98}}, color = {0, 0, 127}));
  connect(ramp_Trb_s_WcAud.y, Trb.u_s_WcAud) annotation(
    Line(points = {{100, -168}, {100, -168}, {100, -116}, {108, -116}, {108, -98}, {108, -98}}, color = {0, 0, 127}));
  connect(ramp_Cmp_s_PRaud.y, Cmp.u_s_PRaud) annotation(
    Line(points = {{-40, -138}, {-40, -138}, {-40, -116}, {-44, -116}, {-44, -98}, {-44, -98}}, color = {0, 0, 127}));
  connect(ramp_Trb_a_effAud.y, Trb.u_a_effAud) annotation(
    Line(points = {{130, -168}, {130, -168}, {130, -114}, {132, -114}, {132, -98}, {132, -98}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-86, -88}, {-76, -88}, {-76, -132}, {238, -132}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-160, -40}, {-160, 50}, {200, 50}, {200, -64}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{90, 19}, {90, 11}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{90, -11}, {90, -30}, {87, -30}}, color = {0, 0, 127}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{80, -40}, {100, -40}, {100, -64}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, Trb.flange_1) annotation(
    Line(points = {{-20, -80}, {100, -80}}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{140, -64}, {160, -64}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{190, -80}, {213, -80}, {213, -124}, {238, -124}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-138, -76}, {-130.5, -76}, {-130.5, -88}, {-114, -88}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-140, -64}, {-120, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{-80, -64}, {-60, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {340, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.0200067),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex06;
