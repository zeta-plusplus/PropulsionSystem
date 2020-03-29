within PropulsionSystem.Examples.Engines.DesignPoint;

model MSZ006A1_engine002_001
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, PRdes = 20, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 10) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {210, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 5, height = 0, offset = 2000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel2 annotation(
    Placement(visible = true, transformation(origin = {130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector heatInjector1(redeclare package Medium = engineAir, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)  annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 5, height = 0, offset = 1600, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {120, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp2.y, heatInjector1.TtOutlet_in) annotation(
    Line(points = {{132, 70}, {166, 70}, {166, 14}, {160, 14}, {160, 14}}, color = {0, 0, 127}));
  connect(combustFuel2.HeatPort_b, heatInjector1.HeatPort_1) annotation(
    Line(points = {{140, 40}, {150, 40}, {150, 20}, {150, 20}}, color = {191, 0, 0}));
  connect(heatInjector1.port_2, Nzl070.port_1) annotation(
    Line(points = {{160, 18}, {170, 18}, {170, 18}, {170, 18}}, color = {0, 127, 255}));
  connect(Duct045.port_2, heatInjector1.port_1) annotation(
    Line(points = {{130, 18}, {140, 18}, {140, 18}, {140, 18}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{185, 10}, {191, 10}, {191, -34}, {199, -34}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 22}, {-90, 28}, {190, 28}, {190, 18}}, color = {0, 127, 255}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 8}, {-17, 8}, {-17, -38}, {199, -38}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{51, 38}, {106, 38}, {106, -46}, {199, -46}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{40, -20}, {74, -20}, {74, 10}, {80, 10}, {80, 10}}));
  connect(ramp1.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{51, 72}, {73, 72}, {73, 16}, {69, 16}, {69, 16}}, color = {0, 0, 127}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 8}, {-73.4, 8}, {-73.4, -8}, {-43.4, -8}, {-43.4, 6}, {-37, 6}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 20}, {-68, 20}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 42}, {58, 42}, {58, 22}}, color = {191, 0, 0}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 18}, {-45, 18}, {-45, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 20}, {-15, 20}, {-15, 22}, {-10, 22}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 20}, {15, 20}, {15, 18}, {20, 18}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 12}, {15, 12}, {15, -20}, {20, -20}}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 20}, {45, 20}, {45, 22}, {50, 22}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 20}, {75, 20}, {75, 18}, {80, 18}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, 20}, {105, 20}, {105, 22}, {110, 22}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));


end MSZ006A1_engine002_001;
