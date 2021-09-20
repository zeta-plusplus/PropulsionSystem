within PropulsionSystem.Examples.Engines.DesignPoint;

model Turboprop_ex03
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-280, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-260, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {140, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-150, -24}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {-150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct050(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {190, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {360, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 100, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 0, height = 0, offset = 9000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {10, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-290, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-290, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_PR(duration = 10, height = 5, offset = 10, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-48, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {130, -150}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {130, -122}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Division division_NPR annotation(
    Placement(visible = true, transformation(origin = {350, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb049(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {250, -48}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_NmechLP(duration = 0, height = 0, offset = 2000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm2 annotation(
    Placement(visible = true, transformation(origin = {-20, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint3 annotation(
    Placement(visible = true, transformation(origin = {14, -220}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation(
    Placement(visible = true, transformation(origin = {40, -190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 1 / 5)  annotation(
    Placement(visible = true, transformation(origin = {70, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {320, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {370, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint4 annotation(
    Placement(visible = true, transformation(origin = {320, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_NPR(duration = 10, height = 0, offset = 1.1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {290, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed01 Prop(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-100, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-240, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {192, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2(use_u_targetVal = true)  annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-218, -16}, {-204, -16}, {-204, -48}, {-114, -48}, {-114, -48}}, color = {0, 0, 127}));
  connect(ramp1.y, Constraint2.u_targetValue) annotation(
    Line(points = {{182, 32}, {172, 32}, {172, 10}, {162, 10}, {162, 10}}, color = {0, 0, 127}));
  connect(Trb.port_2, Duct050.port_1) annotation(
    Line(points = {{160, -24}, {180, -24}}, color = {0, 127, 255}));
  connect(Duct050.port_2, Trb049.port_1) annotation(
    Line(points = {{200, -24}, {220, -24}}, color = {0, 127, 255}));
  connect(idealGear1.flange_b, Trb049.flange_1) annotation(
    Line(points = {{80, -180}, {194, -180}, {194, -48}, {221, -48}}));
  connect(Trb049.port_2, pressure1.port) annotation(
    Line(points = {{280, -24}, {320, -24}}, color = {0, 127, 255}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{128, 10}, {138, 10}, {138, 10}, {140, 10}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb4sink, pressure2.port) annotation(
    Line(points = {{-240, 20}, {-240, 20}, {-240, 80}, {380, 80}, {380, 0}, {380, 0}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb4source, Prop.port_amb) annotation(
    Line(points = {{-220, 16}, {-186, 16}, {-186, -160}, {-116, -160}, {-116, -160}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Prop.u_Vinf) annotation(
    Line(points = {{-218, -16}, {-210, -16}, {-210, -172}, {-122, -172}, {-122, -172}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-278, -10}, {-274, -10}, {-274, 10}, {-262, 10}, {-262, 8}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-278, 30}, {-270, 30}, {-270, 16}, {-262, 16}, {-262, 16}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, massFlowRate010.port_a) annotation(
    Line(points = {{-220, 0}, {-170, 0}, {-170, -24}, {-160, -24}, {-160, -24}}, color = {0, 127, 255}));
  connect(Prop.flange_1, speedSensor2.flange) annotation(
    Line(points = {{-80, -180}, {40, -180}, {40, -180}, {40, -180}}));
  connect(temperature040.port, Trb.port_1) annotation(
    Line(points = {{120, 0}, {120, -24}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{100, 0}, {120, 0}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Duct030.port_1) annotation(
    Line(points = {{-20, -24}, {-20, 0}, {0, 0}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{-88, -24}, {-60, -24}}, color = {0, 127, 255}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{-140, -24}, {-112, -24}}, color = {0, 127, 255}));
  connect(ramp_NPR.y, Constraint4.u_targetValue) annotation(
    Line(points = {{301, 60}, {308, 60}}, color = {0, 0, 127}));
  connect(idealGear1.flange_b, MotGene.flange_1) annotation(
    Line(points = {{80, -180}, {130, -180}, {130, -160}, {130, -160}}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{130, -133}, {130, -139}}, color = {0, 0, 127}));
  connect(Constraint4.u_variable, division_NPR.y) annotation(
    Line(points = {{332, 60}, {350, 60}, {350, 52}, {350, 52}}, color = {0, 0, 127}));
  connect(pressure1.p, division_NPR.u2) annotation(
    Line(points = {{332, -14}, {344, -14}, {344, 28}, {344, 28}}, color = {0, 0, 127}));
  connect(division_NPR.u1, pressure2.p) annotation(
    Line(points = {{356, 28}, {356, 28}, {356, 20}, {370, 20}, {370, 12}, {370, 12}}, color = {0, 0, 127}));
  connect(Nzl.port_2, pressure2.port) annotation(
    Line(points = {{380, -24}, {380, 0}}, color = {0, 127, 255}));
  connect(pressure1.port, Nzl.port_1) annotation(
    Line(points = {{320, -24}, {340, -24}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{1, 50}, {19, 50}, {19, 38}, {30, 38}}, color = {0, 0, 127}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{1, 22}, {14.5, 22}, {14.5, 34}, {28, 34}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{50, 30}, {64, 30}, {64, 16}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Comb.port_1) annotation(
    Line(points = {{20, 0}, {60, 0}}, color = {0, 127, 255}));
  connect(massFlowRate010.m_flow, Constraint.u_variable) annotation(
    Line(points = {{-150, -35}, {-150, -67}}, color = {0, 0, 127}));
  connect(ramp_m_flow_inlet.y, Constraint.u_targetValue) annotation(
    Line(points = {{-150, -99}, {-150, -92}}, color = {0, 0, 127}));
  connect(ramp_Cmp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{-48, -69}, {-48, -56}}, color = {0, 0, 127}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-40, -99}, {-40, -52}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{-20, -40}, {10, -40}, {10, -40}, {10, -40}}));
  connect(LossRotMech.flange_2, Trb.flange_1) annotation(
    Line(points = {{50, -40}, {120, -40}}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{140, -69}, {140, -52}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, LossRotMech.flange_1) annotation(
    Line(points = {{10, -40}, {30, -40}, {30, -40}, {30, -40}}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{10, -61}, {10, -68}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{10, -99}, {10, -92}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{10, -129}, {10, -129}, {10, -123}, {10, -123}}, color = {0, 0, 127}));
  connect(ramp_NmechLP.y, from_rpm2.u) annotation(
    Line(points = {{-39, -220}, {-33, -220}}, color = {0, 0, 127}));
  connect(from_rpm2.y, Constraint3.u_targetValue) annotation(
    Line(points = {{-9, -220}, {-32, -220}, {-32, -220}, {1, -220}, {1, -220}, {-1, -220}, {-1, -220}, {1, -220}}, color = {0, 0, 127}));
  connect(Constraint3.u_variable, speedSensor2.w) annotation(
    Line(points = {{26, -220}, {40, -220}, {40, -200}}, color = {0, 0, 127}));
  connect(speedSensor2.flange, idealGear1.flange_a) annotation(
    Line(points = {{40, -180}, {60, -180}, {60, -180}, {60, -180}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-300, -280}, {440, 100}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turboprop_ex03;
