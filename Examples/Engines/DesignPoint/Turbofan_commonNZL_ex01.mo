within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbofan_commonNZL_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {280, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-190, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-170, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp025(redeclare package Medium = engineAir, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {100, -110}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {270, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb040(redeclare package Medium = engineAir, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {300, -110}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-90, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {170, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {170, -150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {460, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 100, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 0, height = 0, offset = 20000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {170, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {170, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 0, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-190, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-190, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {510, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {280, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {240, -70}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {220, -140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech annotation(
    Placement(visible = true, transformation(origin = {200, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {220, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {190, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Fg(significantDigits = 5, use_numberPort = true)  annotation(
    Placement(visible = true, transformation(origin = {510, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {480, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp020(redeclare package Medium = engineAir, PRdes_paramInput = 2, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(redeclare package Medium = engineAir, BPR_paramInput = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {60, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {360, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint3(tgtValue_paramInput = 9000, use_u_targetVal = false)  annotation(
    Placement(visible = true, transformation(origin = {190, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation(
    Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.MixierLossBasedOnEntropy00 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {410, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-179, 68}, {-162, 68}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-118, 44}, {-110, 44}, {-110, 32}, {-54, 32}}, color = {0, 0, 127}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{-80, 56}, {-60, 56}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-26, 32}, {-20, 32}, {-20, -246}, {499, -246}}, color = {0, 0, 127}));
  connect(Inlt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 56}, {0, 56}}, color = {0, 127, 255}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-179, 110}, {-167, 110}, {-167, 76}, {-163, 76}}, color = {0, 0, 127}));
  connect(ramp_m_flow_inlet.y, Constraint.u_targetValue) annotation(
    Line(points = {{-90, -49}, {-90, -12}}, color = {0, 0, 127}));
  connect(massFlowRate010.m_flow, Constraint.u_variable) annotation(
    Line(points = {{-90, 45}, {-90, 13}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, massFlowRate010.port_a) annotation(
    Line(points = {{-120, 56}, {-100, 56}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, temperature.port) annotation(
    Line(points = {{-140, 80}, {-140, 160}, {480, 160}}, color = {0, 127, 255}));
  connect(Splt.port_3, Mixer.port_2) annotation(
    Line(points = {{70, 62}, {94, 62}, {94, 122}, {400, 122}, {400, 122}}, color = {0, 127, 255}));
  connect(Mixer.port_3, Nzl.port_1) annotation(
    Line(points = {{420, 116}, {440, 116}, {440, 116}, {440, 116}}, color = {0, 127, 255}));
  connect(Trb.port_2, Mixer.port_1) annotation(
    Line(points = {{380, 56}, {380, 56}, {380, 110}, {400, 110}, {400, 110}}, color = {0, 127, 255}));
  connect(speedSensor2.w, Constraint3.u_variable) annotation(
    Line(points = {{170, 62}, {170, 62}, {170, 70}, {180, 70}, {180, 70}}, color = {0, 0, 127}));
  connect(Trb040.port_2, Trb.port_1) annotation(
    Line(points = {{320, -94}, {332, -94}, {332, 56}, {340, 56}, {340, 56}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, realValue_Fg.numberPort) annotation(
    Line(points = {{470, 100}, {492, 100}, {492, 130}, {498.5, 130}}, color = {0, 0, 127}));
  connect(Nzl.port_2, temperature.port) annotation(
    Line(points = {{480, 116}, {480, 160}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{470, 100}, {490, 100}, {490, -242}, {499, -242}}, color = {0, 0, 127}));
  connect(speedSensor2.flange, Trb.flange_1) annotation(
    Line(points = {{170, 40}, {340, 40}}));
  connect(Cmp020.flange_2, speedSensor2.flange) annotation(
    Line(points = {{40, 40}, {170, 40}, {170, 40}, {170, 40}}));
  connect(Splt.port_2, Cmp025.port_1) annotation(
    Line(points = {{70, 56}, {80, 56}, {80, -94}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Splt.port_1) annotation(
    Line(points = {{40, 56}, {50, 56}}, color = {0, 127, 255}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{280, -18}, {280, -1}}, color = {0, 0, 127}));
  connect(Cmp025.port_2, Comb.port_1) annotation(
    Line(points = {{120, -94}, {120, -70}, {220, -70}}, color = {0, 127, 255}));
  connect(Cmp025.flange_2, speedSensor1.flange) annotation(
    Line(points = {{120, -110}, {170, -110}}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{161, -50}, {165, -50}, {165, -36}, {177, -36}, {177, -36}}, color = {0, 0, 127}));
  connect(Constraint2.u_variable, temperature040.T) annotation(
    Line(points = {{280, -41}, {280, -59}, {278, -59}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{161, -20}, {169, -20}, {169, -32}, {179, -32}, {179, -32}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{200, -40}, {224, -40}, {224, -54}, {224, -54}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb040.port_1) annotation(
    Line(points = {{270, -70}, {270, -94}, {280, -94}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{260, -70}, {270, -70}}, color = {0, 127, 255}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{170, -131}, {170, -138}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, LossRotMech.flange_1) annotation(
    Line(points = {{170, -110}, {190, -110}, {190, -110}, {190, -110}}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{170, -179}, {170, -162}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{256, -88}, {256, -258}, {499, -258}}, color = {0, 0, 127}));
  connect(LossRotMech.flange_2, Trb040.flange_1) annotation(
    Line(points = {{210, -110}, {280, -110}}));
  connect(LossRotMech.flange_2, MotGene.flange_1) annotation(
    Line(points = {{210, -110}, {220, -110}, {220, -130}}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{220, -179}, {220, -151}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{170, -209}, {170, -209}, {170, -203}, {170, -203}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -260}, {540, 200}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_commonNZL_ex01;
