within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbofan_ex04
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_Fn(duration = 10, height = 0, offset = 120000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {470, -130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-390, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-370, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-240, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp025(redeclare package Medium = engineAir, effDes_paramInput = 0.9, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb041(redeclare package Medium = engineAir, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {190, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-290, 16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct055(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {350, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {60, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {400, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 1000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-290, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_NmechShH(duration = 0, height = 0, offset = 9000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {60, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {60, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {440, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp025_PR(duration = 10, height = 5, offset = 10, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {2, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp025_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 10, height = 0, offset = 0.85, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {190, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {470, -160}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {130, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {110, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMechShH annotation(
    Placement(visible = true, transformation(origin = {90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct130(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {170, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl170(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {240, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp020(redeclare package Medium = engineAir, PRdes_paramInput = 2, effDes_paramInput = 0.9) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct023(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct045(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {230, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb049(redeclare package Medium = engineAir, effDes_paramInput = 0.85) annotation(
    Placement(visible = true, transformation(origin = {290, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMechShL annotation(
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm2 annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint3 annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech_ShL(duration = 0, height = 0, offset = 3000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp120(redeclare package Medium = engineAir, PRdes_paramInput = 1.5, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-150, 120}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-200, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {420, -150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp120_PR(duration = 10, height = 0.7, offset = 1.1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-162, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp120_eff(duration = 10, height = 0, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(Flt2Fluid.port_amb, Nzl170.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 164}, {260, 164}, {260, 136}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 174}, {420, 174}, {420, 56}}, color = {0, 127, 255}));
  connect(Duct130.port_2, Nzl170.port_1) annotation(
    Line(points = {{180, 136}, {220, 136}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Duct130.port_1) annotation(
    Line(points = {{-120, 144}, {20, 144}, {20, 136}, {160, 136}}, color = {0, 127, 255}));
  connect(Nzl170.y_Fg, add1.u2) annotation(
    Line(points = {{250, 120}, {372, 120}, {372, -126}, {414, -126}, {414, -138}}, color = {0, 0, 127}));
  connect(ramp_Cmp120_eff.y, Cmp120.u_eff) annotation(
    Line(points = {{-150, 51}, {-150, 102}}, color = {0, 0, 127}));
  connect(ramp_Cmp120_PR.y, Cmp120.u_PR) annotation(
    Line(points = {{-162, 81}, {-162, 96}}, color = {0, 0, 127}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{-120, 120}, {-112, 120}, {-112, 40}, {-100, 40}}));
  connect(Splt.port_3, Cmp120.port_1) annotation(
    Line(points = {{-194, 20}, {-190, 20}, {-190, 144}, {-180, 144}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Duct055.port_1) annotation(
    Line(points = {{320, 64}, {329, 64}, {329, 56}, {340, 56}}, color = {0, 127, 255}));
  connect(Duct055.port_2, Nzl070.port_1) annotation(
    Line(points = {{360, 56}, {380, 56}}, color = {0, 127, 255}));
  connect(Nzl070.y_Fg, add1.u1) annotation(
    Line(points = {{410, 40}, {426, 40}, {426, -138}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{41, 10}, {75, 10}, {75, -2}, {80, -2}}, color = {0, 0, 127}));
  connect(Duct023.port_2, Cmp025.port_1) annotation(
    Line(points = {{-20, -64}, {-10, -64}, {-10, -64}, {-10, -64}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Duct023.port_1) annotation(
    Line(points = {{-60, 56}, {-45, 56}, {-45, -64}, {-40, -64}}, color = {0, 127, 255}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{61, -10}, {63.5, -10}, {63.5, -6}, {78, -6}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{100, -10}, {114, -10}, {114, -24}}, color = {0, 127, 255}));
  connect(ramp_Cmp025_PR.y, Cmp025.u_PR) annotation(
    Line(points = {{2, -129}, {2, -96}}, color = {0, 0, 127}));
  connect(Cmp025.port_2, Duct030.port_1) annotation(
    Line(points = {{30, -64}, {42, -64}, {42, -40}, {50, -40}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Comb036.port_1) annotation(
    Line(points = {{70, -40}, {110, -40}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{150, -40}, {160, -40}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{160, -40}, {160, -64}, {170, -64}}, color = {0, 127, 255}));
  connect(ramp_Cmp025_eff.y, Cmp025.u_eff) annotation(
    Line(points = {{10, -159}, {10, -92}}, color = {0, 0, 127}));
  connect(Cmp025.flange_2, speedSensor1.flange) annotation(
    Line(points = {{30, -80}, {60, -80}}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{146, -58}, {146, -198}, {429, -198}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{210, -64}, {220, -64}, {220, -64}, {220, -64}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Trb049.port_1) annotation(
    Line(points = {{240, -64}, {250, -64}, {250, 64}, {260, 64}}, color = {0, 127, 255}));
  connect(speedSensor1.flange, LossRotMechShH.flange_1) annotation(
    Line(points = {{60, -80}, {80, -80}}));
  connect(LossRotMechShH.flange_2, MotGene.flange_1) annotation(
    Line(points = {{100, -80}, {110, -80}, {110, -100}}));
  connect(LossRotMechShH.flange_2, Trb041.flange_1) annotation(
    Line(points = {{100, -80}, {170, -80}}));
  connect(ramp_Trb_eff.y, Trb041.u_eff) annotation(
    Line(points = {{190, -129}, {190, -92}}, color = {0, 0, 127}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{60, -101}, {60, -108}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{60, -139}, {60, -132}}, color = {0, 0, 127}));
  connect(ramp_NmechShH.y, from_rpm1.u) annotation(
    Line(points = {{60, -169}, {60, -162}}, color = {0, 0, 127}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{110, -149}, {110, -121}}, color = {0, 0, 127}));
  connect(LossRotMechShL.flange_2, Trb049.flange_1) annotation(
    Line(points = {{110, 40}, {261, 40}}));
  connect(ramp_Nmech_ShL.y, from_rpm2.u) annotation(
    Line(points = {{1, 70}, {8, 70}}, color = {0, 0, 127}));
  connect(from_rpm2.y, Constraint3.u_targetValue) annotation(
    Line(points = {{31, 70}, {37, 70}}, color = {0, 0, 127}));
  connect(Constraint3.u_variable, speedSensor2.w) annotation(
    Line(points = {{62, 70}, {70, 70}, {70, 61}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, speedSensor2.flange) annotation(
    Line(points = {{-60, 40}, {70, 40}}));
  connect(speedSensor2.flange, LossRotMechShL.flange_1) annotation(
    Line(points = {{70, 40}, {90, 40}}));
  connect(Splt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-194, 16}, {-106, 16}, {-106, 56}, {-100, 56}}, color = {0, 127, 255}));
  connect(Perf.y_Fn, Constraint2.u_variable) annotation(
    Line(points = {{452, -184}, {470, -184}, {470, -172}, {470, -172}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-226, -8}, {-214, -8}, {-214, -186}, {429, -186}}, color = {0, 0, 127}));
  connect(add1.y, Perf.u_Fg) annotation(
    Line(points = {{420, -161}, {420, -182}, {429, -182}}, color = {0, 0, 127}));
  connect(Constraint2.u_targetValue, ramp_Fn.y) annotation(
    Line(points = {{470, -148}, {470, -141}}, color = {0, 0, 127}));
  connect(Inlt.port_2, Splt.port_1) annotation(
    Line(points = {{-220, 16}, {-206, 16}, {-206, 16}, {-206, 16}}, color = {0, 127, 255}));
  connect(ramp_m_flow_inlet.y, Constraint.u_targetValue) annotation(
    Line(points = {{-290, -59}, {-290, -52}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-378, 30}, {-370, 30}, {-370, 28}, {-362, 28}, {-362, 28}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-379, 70}, {-367, 70}, {-367, 36}, {-363, 36}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-318, 4}, {-274, 4}, {-274, -8}, {-254, -8}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, massFlowRate010.port_a) annotation(
    Line(points = {{-320, 16}, {-300, 16}}, color = {0, 127, 255}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{-280, 16}, {-260, 16}}, color = {0, 127, 255}));
  connect(massFlowRate010.m_flow, Constraint.u_variable) annotation(
    Line(points = {{-290, 5}, {-290, -27}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-400, -200}, {480, 180}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_ex04;
