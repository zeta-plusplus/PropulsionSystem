within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbojet_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {310, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_MN = true, use_u_alt = true) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {210, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed00 Comb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {250.5, -40}, extent = {{-20, -16}, {20, 16}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver(independent(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {179, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {290, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb(redeclare package Medium = engineAir, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {320, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -64}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {210, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct050(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {360, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint1 annotation(
    Placement(visible = true, transformation(origin = {210, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint2 annotation(
    Placement(visible = true, transformation(origin = {310, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 0, height = 0, offset = 9000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {210, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {210, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_fltAlt(duration = 0, height = 0, offset = 10000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fltMN(duration = 0, height = 0, offset = 0.8, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {450, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Trb_eff annotation(
    Placement(visible = true, transformation(origin = {320, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir, AmechTh_paramInput = 0.03, switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.param)  annotation(
    Placement(visible = true, transformation(origin = {400, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-40, -60}, {-40, -60}, {-40, 36}, {420, 36}, {420, -64}, {420, -64}}, color = {0, 127, 255}));
  connect(massFlowRate010.port_b, Inlt.port_1) annotation(
    Line(points = {{20, -64}, {80, -64}, {80, -64}, {80, -64}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, Perf.u_Fg) annotation(
    Line(points = {{410, -80}, {422, -80}, {422, -242}, {440, -242}, {440, -242}}, color = {0, 0, 127}));
  connect(Duct050.port_2, Nzl.port_1) annotation(
    Line(points = {{370, -64}, {380, -64}, {380, -64}, {380, -64}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{180, -80}, {210, -80}, {210, -80}, {210, -80}}));
  connect(Cmp.port_2, Duct030.port_1) annotation(
    Line(points = {{180, -64}, {186, -64}, {186, -40}, {200, -40}, {200, -40}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{120, -64}, {140, -64}, {140, -64}, {140, -64}}, color = {0, 127, 255}));
  connect(ramp_Trb_eff.y, Trb.u_eff) annotation(
    Line(points = {{320, -159}, {320, -92}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, Constraint2.u_targetValue) annotation(
    Line(points = {{310, 59}, {310, 59}, {310, 11}, {310, 11}}, color = {0, 0, 127}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-18, -96}, {26, -96}, {26, -88}, {86, -88}}, color = {0, 0, 127}));
  connect(Inlt.y_FdRam, Perf.u_Fram) annotation(
    Line(points = {{114, -88}, {126, -88}, {126, -246}, {439, -246}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{190, -10}, {205.25, -10}, {205.25, -32}, {228.5, -32}}, color = {0, 0, 127}));
  connect(temperature040.T, Constraint2.u_variable) annotation(
    Line(points = {{297, -30}, {309, -30}, {309, -12}}, color = {0, 0, 127}));
  connect(Duct030.port_2, Comb.port_1) annotation(
    Line(points = {{220, -40}, {230.5, -40}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb.port_1) annotation(
    Line(points = {{290, -40}, {290, -64}, {300, -64}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{270.5, -40}, {290, -40}}, color = {0, 127, 255}));
  connect(speedSensor1.flange, Trb.flange_1) annotation(
    Line(points = {{210, -80}, {300, -80}, {300, -80}, {300, -80}}));
  connect(speedSensor1.w, Constraint1.u_variable) annotation(
    Line(points = {{210, -101}, {210, -108}}, color = {0, 0, 127}));
  connect(from_rpm1.y, Constraint1.u_targetValue) annotation(
    Line(points = {{210, -179}, {210, -132}}, color = {0, 0, 127}));
  connect(ramp_Nmech.y, from_rpm1.u) annotation(
    Line(points = {{210, -209}, {210, -209}, {210, -203}, {210, -203}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, Perf.u_m_flow_fuel) annotation(
    Line(points = {{266.5, -58}, {266.5, -258}, {439, -258}}, color = {0, 0, 127}));
  connect(Trb.port_2, Duct050.port_1) annotation(
    Line(points = {{340, -64}, {350, -64}, {350, -64}, {350, -64}}, color = {0, 127, 255}));
  connect(ramp_fltMN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-78, -50}, {-72, -50}, {-72, -72}, {-62, -72}, {-62, -72}}, color = {0, 0, 127}));
  connect(ramp_fltAlt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-78, -10}, {-66, -10}, {-66, -64}, {-62, -64}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, massFlowRate010.port_a) annotation(
    Line(points = {{-20, -84}, {-14, -84}, {-14, -64}, {0, -64}, {0, -64}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -260}, {460, 100}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex01;
