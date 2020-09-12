within PropulsionSystem.Examples.Engines.Transient;

model Turbojet_ex02
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir, NmechDes_paramInput = 9000.0, PRdes_paramInput = 10, T1_des_paramInput = 251.833, m_flow_1_des_paramInput = 1.0, p1_des_paramInput = 40310.6, printCmd = false, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_effAud = false, use_u_s_PRaud = false, use_u_s_WcAud = false, use_u_s_effAud = false) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir, NmechDes_paramInput = 9000.0, T1_des_paramInput = 1600.0, m_flow_1_des_paramInput = 1.03297, p1_des_paramInput = 399075, printCmd = true, use_tableFile_Wc = true, use_tableFile_eff = true, use_u_a_effAud = false, use_u_s_WcAud = false) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {260, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, printCmd = true) annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed00 Nzl(redeclare package Medium = engineAir, m_flow_1_des_paramInput = 1.03297, printCmd = true) annotation(
    Placement(visible = true, transformation(origin = {180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {39.75, -39.8}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 10, a(fixed = true, start = 0), stateSelect = StateSelect.always, w(fixed = false, start = 9000 * Modelica.Constants.pi * 2 / 60))  annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Output.dispVarPyConsole02_00 dispVarPyConsole(nVariables = 5, nameVariables = {"time[s]", "m_flow_fuel[kg/s]", "N[rpm]", "Fn[N]", "TIT[K]"})  annotation(
    Placement(visible = true, transformation(origin = {330, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Utilities.TimeSignalOut timeSignalOut1 annotation(
    Placement(visible = true, transformation(origin = {290, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.InputDevices.KeyboardInput keyboardInput1(sampleTime = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-270, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate(dt = 0.1,scl = 0.001, varInit = 0.021)  annotation(
    Placement(visible = true, transformation(origin = {-240, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate1(dt = 0.1, scl = -0.001)  annotation(
    Placement(visible = true, transformation(origin = {-240, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm1 annotation(
    Placement(visible = true, transformation(origin = {70, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(temperature.T, dispVarPyConsole.u_variables[5]) annotation(
    Line(points = {{88, -30}, {88, -30}, {88, -190}, {320, -190}, {320, -190}}, color = {0, 0, 127}));
  connect(Perf.y_Fn, dispVarPyConsole.u_variables[4]) annotation(
    Line(points = {{282, -128}, {306, -128}, {306, -190}, {320, -190}, {320, -190}}, color = {0, 0, 127}));
  connect(to_rpm1.y, dispVarPyConsole.u_variables[3]) annotation(
    Line(points = {{70, -132}, {70, -132}, {70, -190}, {320, -190}, {320, -190}}, color = {0, 0, 127}));
  connect(add1.y, dispVarPyConsole.u_variables[2]) annotation(
    Line(points = {{-198, 10}, {-194, 10}, {-194, -190}, {320, -190}, {320, -190}}, color = {0, 0, 127}));
  connect(timeSignalOut1.y, dispVarPyConsole.u_variables[1]) annotation(
    Line(points = {{301, -70}, {312, -70}, {312, -190}, {319, -190}}, color = {0, 0, 127}));
  connect(speedSensor1.w, to_rpm1.u) annotation(
    Line(points = {{70, -102}, {70, -102}, {70, -108}, {70, -108}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{70, -80}, {100, -80}, {100, -80}, {100, -80}}));
  connect(inertia1.flange_b, speedSensor1.flange) annotation(
    Line(points = {{40, -80}, {70, -80}, {70, -80}, {70, -80}}));
  connect(add1.y, boundary.m_flow_in) annotation(
    Line(points = {{-198, 10}, {-32, 10}, {-32, -2}, {-10, -2}, {-10, -2}}, color = {0, 0, 127}));
  connect(Accumulate1.y, add1.u2) annotation(
    Line(points = {{-228, 0}, {-226, 0}, {-226, 4}, {-222, 4}, {-222, 4}}, color = {0, 0, 127}));
  connect(keyboardInput1.keyDown, Accumulate1.u) annotation(
    Line(points = {{-270, 18}, {-270, 18}, {-270, 0}, {-252, 0}, {-252, 0}}, color = {255, 0, 255}));
  connect(Accumulate.y, add1.u1) annotation(
    Line(points = {{-228, 32}, {-225, 32}, {-225, 16}, {-222, 16}}, color = {0, 0, 127}));
  connect(keyboardInput1.keyUp, Accumulate.u) annotation(
    Line(points = {{-258, 36}, {-256, 36}, {-256, 32}, {-252, 32}, {-252, 32}}, color = {255, 0, 255}));
  connect(Cmp.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-20, -80}, {20, -80}}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{10, -10}, {24, -10}, {24, -24}, {24, -24}}, color = {0, 127, 255}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{56, -58}, {56, -58}, {56, -156}, {238, -156}, {238, -156}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{60, -40}, {80, -40}, {80, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-20, -64}, {-20, -64}, {-20, -40}, {20, -40}, {20, -40}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-86, -88}, {-76, -88}, {-76, -132}, {238, -132}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-160, -40}, {-160, 50}, {200, 50}, {200, -64}}, color = {0, 127, 255}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{80, -40}, {100, -40}, {100, -64}}, color = {0, 127, 255}));
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
    Diagram(coordinateSystem(extent = {{-300, -200}, {340, 100}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.0100033),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex02;
