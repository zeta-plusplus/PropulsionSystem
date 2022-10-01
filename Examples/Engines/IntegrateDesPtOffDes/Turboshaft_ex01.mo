within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes;

model Turboshaft_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {90, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 2)  annotation(
    Placement(visible = true, transformation(origin = {-150, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-130, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {28, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-130, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {56, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-200, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30.5, 60.4}, extent = {{-30, -24}, {30, 24}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-90, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-90, -8}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDes(use_u_NmechDes = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 100.0) annotation(
    Placement(visible = true, transformation(origin = {-160, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {200, -82}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {216, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineAir, MN_paramInput = 0.5, alt_paramInput = 5000) annotation(
    Placement(visible = true, transformation(origin = {-260, 16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Sensor.PressureRatio pressureRatio1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {194, 16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_NmechProp(duration = 10, height = 0, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, -90}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm annotation(
    Placement(visible = true, transformation(origin = {0, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 TrbGG(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {40, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 TrbPwr(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {130, -90}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-70, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = 0, offset = 1.2, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint constraintDesPt annotation(
    Placement(visible = true, transformation(origin = {190, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerGenerated annotation(
    Placement(visible = true, transformation(origin = {60, -90}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-187.6, 16}, {-170, 16}}, color = {0, 127, 255}, thickness = 1.5));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-238, 0}, {-232, 0}, {-232, -8}, {-214, -8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-240, 16}, {-212, 16}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb4sink, temperature1.port) annotation(
    Line(points = {{-260, 36}, {-260, 112}, {216, 112}}, color = {0, 127, 255}));
  connect(Nzl.port_2, temperature1.port) annotation(
    Line(points = {{216, -66}, {216, 112}}, color = {0, 127, 255}));
  connect(pressureRatio1.port_b, Nzl.port_2) annotation(
    Line(points = {{204, 16}, {216, 16}, {216, -66}}, color = {0, 127, 255}));
  connect(pressureRatio1.port_a, Nzl.port_1) annotation(
    Line(points = {{184, 16}, {184, -66}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{0, 60}, {28, 60}}, color = {0, 127, 255}, thickness = 1.5));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{-80, 84}, {-54.5, 84}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-72.6, 16}, {-72.6, 60}, {-60.5, 60}}, color = {0, 127, 255}, thickness = 1.5));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{79, 70}, {68, 70}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{45, 70}, {35, 70}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(Cmp.flange_2, NmechDes.flange_1) annotation(
    Line(points = {{-60, -8}, {-40, -8}}, thickness = 1.5));
  connect(MassFlowDes.port_2, Cmp.port_1) annotation(
    Line(points = {{-150, 16}, {-109, 16}}, color = {0, 127, 255}, thickness = 1.5));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-119, 84}, {-113, 84}, {-113, 92}, {-101, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(temperature.port, TrbGG.port_1) annotation(
    Line(points = {{28, 60}, {28, 8}}, color = {0, 127, 255}, thickness = 1.5));
  connect(TrbGG.port_2, TrbPwr.port_1) annotation(
    Line(points = {{52, 8}, {112, 8}, {112, -66}}, color = {0, 127, 255}, thickness = 1.5));
  connect(TrbPwr.port_2, Nzl.port_1) annotation(
    Line(points = {{148.6, -66}, {184, -66}}, color = {0, 127, 255}, thickness = 1.5));
  connect(NmechDes.flange_2, TrbGG.flange_1) annotation(
    Line(points = {{-20, -8}, {20, -8}}, thickness = 1.5));
  connect(speedSensor.w, to_rpm.u) annotation(
    Line(points = {{0, -111}, {0, -128}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(from_rpm1.y, speed.w_ref) annotation(
    Line(points = {{-59, -90}, {-42, -90}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_NmechProp.y, from_rpm1.u) annotation(
    Line(points = {{-99, -90}, {-82, -90}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp2.y, constraintDesPt.u_targetValue) annotation(
    Line(points = {{181, 70}, {190, 70}, {190, 61}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(pressureRatio1.p_ratio, constraintDesPt.u_variable) annotation(
    Line(points = {{194, 25}, {194, 31}, {190, 31}, {190, 39}}, color = {0, 0, 127}));
  connect(powerGenerated.flange_a, TrbPwr.flange_1) annotation(
    Line(points = {{80, -90}, {101, -90}}, thickness = 1.5));
  connect(powerGenerated.flange_b, speedSensor.flange) annotation(
    Line(points = {{40, -90}, {0, -90}}, thickness = 1.5));
  connect(speed.flange, speedSensor.flange) annotation(
    Line(points = {{-20, -90}, {0, -90}}, thickness = 1.5));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "plt"));

end Turboshaft_ex01;
