within PropulsionSystem.Examples.Engines.OffDesignSim;

model Turbojet_ex01_temp01
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {180, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 200, offset = 1600, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable00 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable00 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir, AmechTh_paramInput = 0.0014, switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {90, 40}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed00 Comb(redeclare package Medium = engineAir, use_u_m_flow_fuel = true) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet inlet1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inlet1.Fram_out, perf001.u_Fram) annotation(
    Line(points = {{-13, -14}, {-8, -14}, {-8, -46}, {170, -46}}, color = {0, 0, 127}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{110, -2}, {130, -2}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, Trb.flange_1) annotation(
    Line(points = {{20, -10}, {90, -10}}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{70, 10}, {80, 10}, {80, -2}, {90, -2}}, color = {0, 127, 255}));
  connect(ramp_TIT.y, Constraint.u_targetValue) annotation(
    Line(points = {{90, 59}, {90, 59}, {90, 51}, {90, 51}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{90, 29}, {90, 21}, {77, 21}}, color = {0, 0, 127}));
  connect(Comb.port_2, temperature.port) annotation(
    Line(points = {{60, 10}, {70, 10}, {70, 10}, {70, 10}}, color = {0, 127, 255}));
  connect(Cmp.port_2, Comb.port_1) annotation(
    Line(points = {{20, -2}, {28, -2}, {28, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(inlet1.port_2, Cmp.port_1) annotation(
    Line(points = {{-10, -2}, {0, -2}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{21, 30}, {30, 30}, {30, 14}, {38, 14}}, color = {0, 0, 127}));
  connect(Comb.y_m_flow_fuel, perf001.u_m_flow_fuel) annotation(
    Line(points = {{58, 1}, {58, -58}, {170, -58}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, inlet1.port_1) annotation(
    Line(points = {{-80, -2}, {-30, -2}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, inlet1.V_tot_in) annotation(
    Line(points = {{-78, -14}, {-27, -14}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl.port_2) annotation(
    Line(points = {{-90, 0}, {-90, 56}, {150, 56}, {150, -2}}, color = {0, 127, 255}));
  connect(Nzl.y_Fg, perf001.u_Fg) annotation(
    Line(points = {{146, -10}, {162, -10}, {162, -42}, {170, -42}, {170, -42}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -60}, {200, 100}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.0166722),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_ex01_temp01;
