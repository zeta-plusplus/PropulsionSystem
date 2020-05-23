within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbojet_ex05
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {300, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.01, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {100, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {190, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {290, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {320, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -64}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {10, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {190, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct050(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {360, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {190, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {400, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 100, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {10, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 0, height = 0, offset = 9000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {190, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {190, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {450, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_PR(duration = 10, height = 5, offset = 10, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {132, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {140, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {320, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Tfuel(duration = 10, height = 200, offset = 400, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {170, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {300, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {260, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.MotorGeneratorCharFixed00 MotGene annotation(
    Placement(visible = true, transformation(origin = {240, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech annotation(
    Placement(visible = true, transformation(origin = {220, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pwrExt(duration = 10, height = 0, offset = 100 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {240, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, X = {1, 0, 0}, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {210, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(volume.ports[2], Cmp.port_1) annotation(
    Line(points = {{100, -64}, {120, -64}, {120, -64}, {120, -64}}, color = {0, 127, 255}));
  connect(Inlt.port_2, volume.ports[1]) annotation(
    Line(points = {{80, -64}, {98, -64}, {98, -64}, {100, -64}}, color = {0, 127, 255}));
  connect(ramp_Cmp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{132, -159}, {132, -96}}, color = {0, 0, 127}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{140, -189}, {140, -92}}, color = {0, 0, 127}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{300, 11}, {300, 28}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{160, -80}, {190, -80}, {190, -80}, {190, -80}}));
  connect(Cmp.port_2, Duct030.port_1) annotation(
    Line(points = {{160, -64}, {172, -64}, {172, -40}, {180, -40}, {180, -40}}, color = {0, 127, 255}));
  connect(Constraint2.u_variable, temperature040.T) annotation(
    Line(points = {{300, -11}, {300, -29}, {298, -29}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{181, 10}, {189, 10}, {189, -2}, {199, -2}, {199, -2}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Comb.port_fuel) annotation(
    Line(points = {{220, -10}, {244, -10}, {244, -24}, {244, -24}}, color = {0, 127, 255}));
  connect(ramp_Tfuel.y, boundary.T_in) annotation(
    Line(points = {{181, -20}, {185, -20}, {185, -6}, {197, -6}, {197, -6}}, color = {0, 0, 127}));
  connect(Duct030.port_2, Comb.port_1) annotation(
    Line(points = {{200, -40}, {240, -40}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb.port_1) annotation(
    Line(points = {{290, -40}, {290, -64}, {300, -64}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{280, -40}, {290, -40}}, color = {0, 127, 255}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{320, -159}, {320, -92}}, color = {0, 0, 127}));
  connect(Trb.port_2, Duct050.port_1) annotation(
    Line(points = {{340, -64}, {350, -64}, {350, -64}, {350, -64}}, color = {0, 127, 255}));
  connect(LossRotMech.flange_2, Trb.flange_1) annotation(
    Line(points = {{230, -80}, {300, -80}}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{190, -101}, {190, -108}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, LossRotMech.flange_1) annotation(
    Line(points = {{190, -80}, {210, -80}, {210, -80}, {210, -80}}));
  connect(Duct050.port_2, Nzl.port_1) annotation(
    Line(points = {{370, -64}, {380, -64}, {380, -64}, {380, -64}}, color = {0, 127, 255}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{190, -179}, {190, -132}}, color = {0, 0, 127}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{410, -80}, {430, -80}, {430, -242}, {439, -242}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-40, -40}, {-40, 24}, {420, 24}, {420, -64}}, color = {0, 127, 255}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{190, -209}, {190, -209}, {190, -203}, {190, -203}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{276, -58}, {276, -258}, {439, -258}}, color = {0, 0, 127}));
  connect(LossRotMech.flange_2, MotGene.flange_1) annotation(
    Line(points = {{230, -80}, {240, -80}, {240, -100}}));
  connect(ramp_pwrExt.y, MotGene.u_pwr) annotation(
    Line(points = {{240, -179}, {240, -122}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{74, -88}, {86, -88}, {86, -246}, {439, -246}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, massFlowRate010.port_a) annotation(
    Line(points = {{-20, -64}, {0, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-18, -76}, {26, -76}, {26, -88}, {46, -88}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-78, -10}, {-66, -10}, {-66, -44}, {-62, -44}}, color = {0, 0, 127}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-78, -50}, {-72, -50}, {-72, -52}, {-62, -52}}, color = {0, 0, 127}));
  connect(ramp_m_flow_inlet.y, Constraint.u_targetValue) annotation(
    Line(points = {{10, -169}, {10, -132}}, color = {0, 0, 127}));
  connect(massFlowRate010.m_flow, Constraint.u_variable) annotation(
    Line(points = {{10, -76}, {10, -108}}, color = {0, 0, 127}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{20, -64}, {40, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -260}, {440, 60}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex05;
