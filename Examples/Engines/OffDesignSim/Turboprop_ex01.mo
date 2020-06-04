within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turboprop_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-270, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-200, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp020(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-140, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech annotation(
    Placement(visible = true, transformation(origin = {-80, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb041(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-79.75, 99.8}, extent = {{-20.25, -16.2}, {20.25, 16.2}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-120, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-170, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb049(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharTable00 Prop(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-220, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 1 / 3)  annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {30, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {80, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {-150, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Nprop(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, -120}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{-150, -78}, {-150, -78}, {-150, -70}, {-150, -70}}, color = {0, 0, 127}));
  connect(ramp_Nprop.y, from_rpm1.u) annotation(
    Line(points = {{-150, -108}, {-150, -102}}, color = {0, 0, 127}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{-150, -42}, {-150, -42}, {-150, -48}, {-150, -48}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, idealGear1.flange_a) annotation(
    Line(points = {{-150, -20}, {-120, -20}, {-120, -20}, {-120, -20}}));
  connect(Prop.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-200, -20}, {-150, -20}, {-150, -20}, {-150, -20}}));
  connect(Constraint.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{42, 110}, {68, 110}, {68, 110}, {68, 110}}, color = {0, 0, 127}));
  connect(temperature.T, Constraint.u_variable) annotation(
    Line(points = {{-22, 110}, {18, 110}, {18, 110}, {18, 110}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Prop.u_Vinf) annotation(
    Line(points = {{-258, 62}, {-252, 62}, {-252, -12}, {-242, -12}, {-242, -12}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt010.u_V_infini) annotation(
    Line(points = {{-258, 62}, {-244, 62}, {-244, 44}, {-214, 44}, {-214, 44}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Prop.port_amb) annotation(
    Line(points = {{-270, 80}, {-270, 80}, {-270, 92}, {-236, 92}, {-236, 0}, {-236, 0}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-270, 80}, {-270, 172}, {200, 172}, {200, -4}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Nzl.port_1) annotation(
    Line(points = {{120, -4}, {160, -4}, {160, -4}, {160, -4}}, color = {0, 127, 255}));
  connect(idealGear1.flange_b, Trb049.flange_1) annotation(
    Line(points = {{-100, -20}, {80, -20}, {80, -20}, {80, -20}}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{40, 68}, {64, 68}, {64, -4}, {80, -4}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, LossRotMech.flange_1) annotation(
    Line(points = {{-120, 52}, {-90, 52}, {-90, 52}, {-90, 52}}));
  connect(LossRotMech.flange_2, Trb041.flange_1) annotation(
    Line(points = {{-70, 52}, {1.49012e-07, 52}}));
  connect(temperature.port, Trb041.port_1) annotation(
    Line(points = {{-30, 100}, {0, 100}, {0, 68}, {0, 68}}, color = {0, 127, 255}));
  connect(Comb036.port_2, temperature.port) annotation(
    Line(points = {{-59.5, 99.8}, {-29.5, 99.8}, {-29.5, 99.8}, {-29.5, 99.8}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{-110, 130}, {-96, 130}, {-96, 116}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Comb036.port_1) annotation(
    Line(points = {{-120, 68}, {-120, 100}, {-100, 100}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, Inlt010.port_1) annotation(
    Line(points = {{-260, 68}, {-220, 68}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-180, 68}, {-160, 68}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-159, 150}, {-145, 150}, {-145, 138}, {-131, 138}, {-131, 138}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})),
    __OpenModelica_commandLineOptions = "");end Turboprop_ex01;
