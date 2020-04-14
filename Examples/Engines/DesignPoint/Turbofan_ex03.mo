within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbofan_ex03
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {170, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-340, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-240, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp025(redeclare package Medium = engineAir, effDes_paramInput = 0.9, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb041(redeclare package Medium = engineAir, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {190, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-290, 16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct055(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {350, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {400, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 1000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-290, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_NmechShH(duration = 0, height = 0, offset = 9000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-390, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {450, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp025_PR(duration = 10, height = 5, offset = 10, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {2, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp025_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 10, height = 0, offset = 0.85, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {190, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {170, 80}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {130, 40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMechShH annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct130(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {170, 176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl170(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {240, 160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp020(redeclare package Medium = engineAir, PRdes_paramInput = 2, effDes_paramInput = 0.9) annotation(
    Placement(visible = true, transformation(origin = {-78, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct023(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct045(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {230, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb049(redeclare package Medium = engineAir, effDes_paramInput = 0.85) annotation(
    Placement(visible = true, transformation(origin = {290, -40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation(
    Placement(visible = true, transformation(origin = {60, -140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMechShL annotation(
    Placement(visible = true, transformation(origin = {90, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm2 annotation(
    Placement(visible = true, transformation(origin = {60, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint3 annotation(
    Placement(visible = true, transformation(origin = {60, -170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech_ShL(duration = 0, height = 0, offset = 3000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {60, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp120(redeclare package Medium = engineAir, PRdes_paramInput = 1.5, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true)  annotation(
    Placement(visible = true, transformation(origin = {-150, 110}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.IdealSpltCharFixed00 Splt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-200, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {430, -150}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp120_PR(duration = 10, height = 0.7, offset = 1.1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp120_eff(duration = 10, height = 0, offset = 0.9, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(Duct055.port_2, Nzl070.port_1) annotation(
    Line(points = {{360, -26}, {380, -26}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Duct055.port_1) annotation(
    Line(points = {{320, -16}, {329, -16}, {329, -26}, {340, -26}}, color = {0, 127, 255}));
  connect(Splt.port_3, Cmp120.port_1) annotation(
    Line(points = {{-194, 20}, {-190, 20}, {-190, 134}, {-180, 134}}, color = {0, 127, 255}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{-120, 110}, {-110, 110}, {-110, -40}, {-98, -40}}));
  connect(Cmp120.port_2, Duct130.port_1) annotation(
    Line(points = {{-120, 134}, {-94, 134}, {-94, 176}, {160, 176}}, color = {0, 127, 255}));
  connect(ramp_Cmp120_PR.y, Cmp120.u_PR) annotation(
    Line(points = {{-162, 71}, {-162, 86}}, color = {0, 0, 127}));
  connect(ramp_Cmp120_eff.y, Cmp120.u_eff) annotation(
    Line(points = {{-150, 41}, {-150, 92}}, color = {0, 0, 127}));
  connect(from_rpm2.y, Constraint3.u_targetValue) annotation(
    Line(points = {{60, -189}, {60, -183}}, color = {0, 0, 127}));
  connect(ramp_Nmech_ShL.y, from_rpm2.u) annotation(
    Line(points = {{60, -219}, {60, -212}}, color = {0, 0, 127}));
  connect(speedSensor2.flange, LossRotMechShL.flange_1) annotation(
    Line(points = {{60, -130}, {80, -130}, {80, -130}, {80, -130}}));
  connect(LossRotMechShL.flange_2, Trb049.flange_1) annotation(
    Line(points = {{100, -130}, {246, -130}, {246, -40}, {261, -40}}));
  connect(Constraint3.u_variable, speedSensor2.w) annotation(
    Line(points = {{60, -158}, {60, -158}, {60, -150}, {60, -150}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, speedSensor2.flange) annotation(
    Line(points = {{-58, -40}, {-50, -40}, {-50, -130}, {60, -130}}));
  connect(ramp_NmechShH.y, from_rpm1.u) annotation(
    Line(points = {{60, -89}, {60, -82}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{60, -59}, {60, -52}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl070.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 216}, {420, 216}, {420, -26}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl170.port_2) annotation(
    Line(points = {{-340, 40}, {-340, 206}, {260, 206}, {260, 176}}, color = {0, 127, 255}));
  connect(Duct130.port_2, Nzl170.port_1) annotation(
    Line(points = {{180, 176}, {220, 176}}, color = {0, 127, 255}));
  connect(Nzl170.y_Fg, add1.u2) annotation(
    Line(points = {{250, 160}, {372, 160}, {372, -126}, {424, -126}, {424, -138}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Trb049.port_1) annotation(
    Line(points = {{240, 16}, {246, 16}, {246, -16}, {260, -16}}, color = {0, 127, 255}));
  connect(add1.y, Perf.u_Fg) annotation(
    Line(points = {{430, -162}, {430, -162}, {430, -182}, {440, -182}, {440, -182}}, color = {0, 0, 127}));
  connect(Nzl070.y_Fg, add1.u1) annotation(
    Line(points = {{410, -42}, {436, -42}, {436, -138}, {436, -138}}, color = {0, 0, 127}));
  connect(Cmp020.port_2, Duct023.port_1) annotation(
    Line(points = {{-58, -24}, {-50, -24}, {-50, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(Splt.port_2, Cmp020.port_1) annotation(
    Line(points = {{-194, 16}, {-106, 16}, {-106, -24}, {-98, -24}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Splt.port_1) annotation(
    Line(points = {{-220, 16}, {-206, 16}, {-206, 16}, {-206, 16}}, color = {0, 127, 255}));
  connect(Comb036.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{146, 22}, {146, -198}, {439, -198}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{-226, -8}, {-214, -8}, {-214, -186}, {439, -186}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{210, 16}, {220, 16}, {220, 16}, {220, 16}}, color = {0, 127, 255}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{170, 92}, {170, 99}}, color = {0, 0, 127}));
  connect(Comb036.port_2, temperature040.port) annotation(
    Line(points = {{150, 40}, {160, 40}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb041.port_1) annotation(
    Line(points = {{160, 40}, {160, 16}, {170, 16}}, color = {0, 127, 255}));
  connect(Constraint2.u_variable, temperature040.T) annotation(
    Line(points = {{170, 68}, {170, 50}, {167, 50}}, color = {0, 0, 127}));
  connect(LossRotMechShH.flange_2, Trb041.flange_1) annotation(
    Line(points = {{100, 0}, {170, 0}}));
  connect(ramp_Trb_eff.y, Trb041.u_eff) annotation(
    Line(points = {{190, -49}, {190, -12}}, color = {0, 0, 127}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{60, -21}, {60, -28}}, color = {0, 0, 127}));
  connect(ramp_Cmp025_PR.y, Cmp025.u_PR) annotation(
    Line(points = {{2, -49}, {2, -16}}, color = {0, 0, 127}));
  connect(ramp_Cmp025_eff.y, Cmp025.u_eff) annotation(
    Line(points = {{10, -79}, {10, -12}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{100, 70}, {114, 70}, {114, 56}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Comb036.port_1) annotation(
    Line(points = {{70, 40}, {110, 40}}, color = {0, 127, 255}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{61, 70}, {63.5, 70}, {63.5, 74}, {78, 74}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{61, 100}, {75, 100}, {75, 78}, {80, 78}}, color = {0, 0, 127}));
  connect(LossRotMechShH.flange_2, MotGene.flange_1) annotation(
    Line(points = {{100, 0}, {110, 0}, {110, -20}}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{110, -69}, {110, -41}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, LossRotMechShH.flange_1) annotation(
    Line(points = {{60, 0}, {80, 0}}));
  connect(Cmp025.flange_2, speedSensor1.flange) annotation(
    Line(points = {{30, 0}, {60, 0}}));
  connect(Duct023.port_2, Cmp025.port_1) annotation(
    Line(points = {{-20, 16}, {-10, 16}, {-10, 16}, {-10, 16}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Duct030.port_1) annotation(
    Line(points = {{30, 16}, {42, 16}, {42, 40}, {50, 40}}, color = {0, 127, 255}));
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
    Diagram(coordinateSystem(extent = {{-400, -260}, {460, 260}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbofan_ex03;
