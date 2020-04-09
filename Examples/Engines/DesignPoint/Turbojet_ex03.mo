within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbojet_ex03
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {260, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {60, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {170, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {280, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -64}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct050(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {320, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {170, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {360, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_inlet(duration = 0, height = 0, offset = 100, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {10, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 0, height = 0, offset = 9000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {170, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {170, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {410, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_PR(duration = 10, height = 0, offset = 10, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {112, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {120, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff(duration = 10, height = 0, offset = 0.8, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {280, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed01 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {212, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_hfuel(duration = 10, height = 0, offset = 600 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {170, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {260, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation(
    Placement(visible = true, transformation(origin = {130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_min_m_flow_fuel(k = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-32, -60}, {-30, -60}, {-30, -4}, {380, -4}, {380, -64}}, color = {0, 127, 255}));
  connect(ramp_hfuel.y, Comb.u_h_fuel) annotation(
    Line(points = {{182, 110}, {200, 110}, {200, -22}, {200, -22}}, color = {0, 0, 127}));
  connect(max1.y, Comb.u_m_flow_fuel) annotation(
    Line(points = {{142, 80}, {196, 80}, {196, -22}, {196, -22}}, color = {0, 0, 127}));
  connect(const_min_m_flow_fuel.y, max1.u2) annotation(
    Line(points = {{102, 80}, {110, 80}, {110, 74}, {118, 74}, {118, 74}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, max1.u1) annotation(
    Line(points = {{101, 110}, {114.5, 110}, {114.5, 86}, {118, 86}}, color = {0, 0, 127}));
  connect(Constraint2.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{260, 12}, {260, 99}}, color = {0, 0, 127}));
  connect(Constraint2.u_variable, temperature040.T) annotation(
    Line(points = {{260, -12}, {260, -30}, {258, -30}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{228, -58}, {228, -58}, {228, -258}, {400, -258}, {400, -258}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{232, -40}, {250, -40}, {250, -40}, {250, -40}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Comb.port_1) annotation(
    Line(points = {{180, -40}, {192, -40}, {192, -40}, {192, -40}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{370, -80}, {390, -80}, {390, -242}, {399, -242}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{74, -88}, {86, -88}, {86, -246}, {399, -246}}, color = {0, 0, 127}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{280, -159}, {280, -92}}, color = {0, 0, 127}));
  connect(ramp_Cmp_PR.y, Cmp.u_PR) annotation(
    Line(points = {{112, -159}, {112, -96}}, color = {0, 0, 127}));
  connect(ramp_Cmp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{120, -189}, {120, -92}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{170, -179}, {170, -132}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{170, -209}, {170, -209}, {170, -203}, {170, -203}}, color = {0, 0, 127}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{170, -101}, {170, -108}}, color = {0, 0, 127}));
  connect(massFlowRate010.m_flow, Constraint.u_variable) annotation(
    Line(points = {{10, -76}, {10, -98}}, color = {0, 0, 127}));
  connect(ramp_m_flow_inlet.y, Constraint.u_targetValue) annotation(
    Line(points = {{10, -169}, {10, -122}}, color = {0, 0, 127}));
  connect(temperature040.port, Trb.port_1) annotation(
    Line(points = {{250, -40}, {250, -64}, {260, -64}}, color = {0, 127, 255}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-78, -50}, {-72, -50}, {-72, -72}, {-62, -72}, {-62, -72}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-78, -10}, {-66, -10}, {-66, -64}, {-62, -64}}, color = {0, 0, 127}));
  connect(Duct050.port_2, Nzl.port_1) annotation(
    Line(points = {{330, -64}, {340, -64}, {340, -64}, {340, -64}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-18, -96}, {26, -96}, {26, -88}, {46, -88}}, color = {0, 0, 127}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{80, -64}, {100, -64}, {100, -64}, {100, -64}}, color = {0, 127, 255}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{20, -64}, {40, -64}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Duct030.port_1) annotation(
    Line(points = {{140, -64}, {152, -64}, {152, -40}, {160, -40}, {160, -40}}, color = {0, 127, 255}));
  connect(Trb.port_2, Duct050.port_1) annotation(
    Line(points = {{300, -64}, {310, -64}, {310, -64}, {310, -64}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{140, -80}, {170, -80}, {170, -80}, {170, -80}}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{170, -80}, {260, -80}, {260, -80}, {260, -80}}));
  connect(Flt2Fluid.port_inlet, massFlowRate010.port_a) annotation(
    Line(points = {{-20, -84}, {-14, -84}, {-14, -64}, {0, -64}, {0, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -260}, {420, 140}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex03;
