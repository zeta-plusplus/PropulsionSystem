within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes;

model Turboprop_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {38, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment(timeRemoveDesConstraint = 2)  annotation(
    Placement(visible = true, transformation(origin = {-150, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-130, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {28, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {38, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-160, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20.25, 60.2}, extent = {{-19.75, -15.8}, {19.75, 15.8}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, T = 400, X = {1, 0, 0}, nPorts = 1, use_T_in = false, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-60, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = { -80, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable03 TrbGG(redeclare package Medium = engineAir, printCmd = false, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDes(use_u_NmechDes = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 100.0) annotation(
    Placement(visible = true, transformation(origin = {-120, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {176, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineAir, MN_paramInput = 0.5, alt_paramInput = 5000) annotation(
    Placement(visible = true, transformation(origin = {-240, 36}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable03 TrbPwr(redeclare package Medium = engineAir, printCmd = true, switch_calcOnlyDes = false, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Sensor.PressureRatio pressureRatio1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {150, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {-80, -160}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = 0, offset = 1.5, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {150, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed00 Prop(printCmd = true, pwr_init = 5000)  annotation(
    Placement(visible = true, transformation(origin = {-180, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_NmechProp(duration = 10, height = 100, offset = 3000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-42, -160}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm annotation(
    Placement(visible = true, transformation(origin = {-100, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint constraintDesPt annotation(
    Placement(visible = true, transformation(origin = {150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(speedSensor1.flange, TrbPwr.flange_1) annotation(
    Line(points = {{-100, -80}, {80, -80}, {80, -80}, {80, -80}}));
  connect(Prop.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-160, -80}, {-100, -80}, {-100, -80}, {-100, -80}}));
  connect(Flt2Fluid.y_V_inf, Prop.u_Vinf) annotation(
    Line(points = {{-218, 20}, {-214, 20}, {-214, -72}, {-202, -72}, {-202, -72}}, color = {0, 0, 127}));
  connect(temperature.port, TrbGG.port_1) annotation(
    Line(points = {{28, 60}, {28, 36}}, color = {0, 127, 255}));
  connect(NmechDes.flange_2, TrbGG.flange_1) annotation(
    Line(points = {{-20, 20}, {20, 20}}));
  connect(TrbGG.port_2, TrbPwr.port_1) annotation(
    Line(points = {{52, 36}, {88, 36}, {88, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-148, 36}, {-130, 36}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-218, 20}, {-212, 20}, {-212, 12}, {-174, 12}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt.port_1) annotation(
    Line(points = {{-220, 36}, {-172, 36}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb4sink, temperature1.port) annotation(
    Line(points = {{-240, 56}, {-240, 160}, {176, 160}}, color = {0, 127, 255}));
  connect(Nzl.port_2, temperature1.port) annotation(
    Line(points = {{176, -64}, {176, 160}}, color = {0, 127, 255}));
  connect(pressureRatio1.port_b, Nzl.port_2) annotation(
    Line(points = {{160, 20}, {176, 20}, {176, -64}}, color = {0, 127, 255}));
  connect(pressureRatio1.port_a, Nzl.port_1) annotation(
    Line(points = {{140, 20}, {140, -24}, {144, -24}, {144, -64}}, color = {0, 127, 255}));
  connect(TrbPwr.port_2, Nzl.port_1) annotation(
    Line(points = {{112, -64}, {144, -64}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{-0.5, 60}, {28, 60}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{-50, 90}, {-36, 90}, {-36, 76}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{-68, 36}, {-68, 60}, {-40, 60}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{38, 119}, {38, 111}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{38, 89}, {38, 81.5}, {38, 81.5}, {38, 70}, {36.5, 70}, {36.5, 70}, {35, 70}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, NmechDes.flange_1) annotation(
    Line(points = {{-60, 20}, {-40, 20}}));
  connect(MassFlowDes.port_2, Cmp.port_1) annotation(
    Line(points = {{-110, 36}, {-92, 36}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-89, 90}, {-83, 90}, {-83, 98}, {-71, 98}}, color = {0, 0, 127}));
  connect(speedSensor1.w, to_rpm.u) annotation(
    Line(points = {{-100, -100}, {-100, -118}}, color = {0, 0, 127}));
  connect(to_rpm.y, Constraint2.u_variable) annotation(
    Line(points = {{-100, -140}, {-100, -160}, {-90, -160}}, color = {0, 0, 127}));
  connect(ramp_NmechProp.y, Constraint2.u_targetValue) annotation(
    Line(points = {{-52, -160}, {-68, -160}}, color = {0, 0, 127}));
  connect(constraintDesPt.u_targetValue, ramp2.y) annotation(
    Line(points = {{150, 62}, {150, 80}}, color = {0, 0, 127}));
  connect(pressureRatio1.p_ratio, constraintDesPt.u_variable) annotation(
    Line(points = {{150, 30}, {150, 40}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})),
    Icon,
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "plt"));

end Turboprop_ex01;
