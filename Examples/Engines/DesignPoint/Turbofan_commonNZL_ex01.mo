within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbofan_commonNZL_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {330, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-190, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-170, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp025(redeclare package Medium = engineAir, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {280, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb040(redeclare package Medium = engineAir, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {300, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-90, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {170, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {460, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 100, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 0, height = 0, offset = 20000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {170, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {170, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 0, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-190, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-190, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {510, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {310, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {240, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {220, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech annotation(
    Placement(visible = true, transformation(origin = {200, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {220, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Fg(significantDigits = 5, use_numberPort = true)  annotation(
    Placement(visible = true, transformation(origin = {510, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {480, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp020(redeclare package Medium = engineAir, PRdes_paramInput = 2, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(redeclare package Medium = engineAir, BPR_paramInput = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {60, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, use_u_eff = false) annotation(
    Placement(visible = true, transformation(origin = {380, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint3(tgtValue_paramInput = 9000, use_u_targetVal = false)  annotation(
    Placement(visible = true, transformation(origin = {190, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation(
    Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.MixierLossBasedOnEntropy00 Mixer(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {420, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_TIT.y, Constraint2.u_targetValue) annotation(
    Line(points = {{330, -21}, {330, -21}, {330, -31}, {322, -31}, {322, -31}}, color = {0, 0, 127}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{287, -30}, {299, -30}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{260, -40}, {280, -40}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb040.port_1) annotation(
    Line(points = {{280, -40}, {280, -64}}, color = {0, 127, 255}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{256, -58}, {256, -218}, {499, -218}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{200, -10}, {224, -10}, {224, -24}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Comb.port_1) annotation(
    Line(points = {{120, -64}, {120, -40}, {220, -40}}, color = {0, 127, 255}));
  connect(Trb.port_2, Mixer.port_1) annotation(
    Line(points = {{400, 56}, {400, 90}, {410, 90}}, color = {0, 127, 255}));
  connect(Mixer.port_3, Nzl.port_1) annotation(
    Line(points = {{430, 96}, {440, 96}}, color = {0, 127, 255}));
  connect(Splt.port_3, Mixer.port_2) annotation(
    Line(points = {{70, 62}, {94, 62}, {94, 102}, {410, 102}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, realValue_Fg.numberPort) annotation(
    Line(points = {{470, 80}, {492, 80}, {492, 110}, {498.5, 110}}, color = {0, 0, 127}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{470, 80}, {490, 80}, {490, -202}, {499, -202}}, color = {0, 0, 127}));
  connect(Nzl.port_2, temperature.port) annotation(
    Line(points = {{480, 96}, {480, 160}}, color = {0, 127, 255}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-26, 32}, {-20, 32}, {-20, -206}, {499, -206}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{161, 10}, {169, 10}, {169, -2}, {179, -2}, {179, -2}}, color = {0, 0, 127}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{161, -20}, {165, -20}, {165, -6}, {177, -6}, {177, -6}}, color = {0, 0, 127}));
  connect(Cmp025.flange_2, speedSensor1.flange) annotation(
    Line(points = {{120, -80}, {170, -80}}));
  connect(Splt.port_2, Cmp025.port_1) annotation(
    Line(points = {{70, 56}, {80, 56}, {80, -64}}, color = {0, 127, 255}));
  connect(LossRotMech.flange_2, Trb040.flange_1) annotation(
    Line(points = {{210, -80}, {280, -80}}));
  connect(Trb040.port_2, Trb.port_1) annotation(
    Line(points = {{320, -64}, {348, -64}, {348, 56}, {360, 56}}, color = {0, 127, 255}));
  connect(speedSensor1.flange, LossRotMech.flange_1) annotation(
    Line(points = {{170, -80}, {190, -80}, {190, -80}, {190, -80}}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{170, -101}, {170, -108}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{170, -139}, {170, -132}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{170, -169}, {170, -169}, {170, -163}, {170, -163}}, color = {0, 0, 127}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{220, -139}, {220, -121}}, color = {0, 0, 127}));
  connect(LossRotMech.flange_2, MotGene.flange_1) annotation(
    Line(points = {{210, -80}, {220, -80}, {220, -100}}));
  connect(speedSensor2.flange, Trb.flange_1) annotation(
    Line(points = {{170, 40}, {360, 40}}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-179, 68}, {-162, 68}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-118, 44}, {-110, 44}, {-110, 32}, {-54, 32}}, color = {0, 0, 127}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{-80, 56}, {-60, 56}}, color = {0, 127, 255}));
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
  connect(speedSensor2.w, Constraint3.u_variable) annotation(
    Line(points = {{170, 62}, {170, 62}, {170, 70}, {180, 70}, {180, 70}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, speedSensor2.flange) annotation(
    Line(points = {{40, 40}, {170, 40}, {170, 40}, {170, 40}}));
  connect(Cmp020.port_2, Splt.port_1) annotation(
    Line(points = {{40, 56}, {50, 56}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-200, -260}, {540, 200}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_commonNZL_ex01;
