within PropulsionSystem.Examples.Tests.DesignPoint;

model MSZ006A1_engine002_002
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
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 417.8) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combust036 annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 10000) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {230, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T040(duration = 5, height = 0, offset = 2000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combust046 annotation(
    Placement(visible = true, transformation(origin = {130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn046(redeclare package Medium = engineAir, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp rampT070(duration = 30, height = 195405, offset = 300 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {230, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(switchInput_tgtVal = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, tgtVal = 600000) annotation(
    Placement(visible = true, transformation(origin = {230, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetIndependent setIndependent1(independent_init = 1600) annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {190, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 6}, {-17, 6}, {-17, -36}, {207, -36}, {207, -48}, {219, -48}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{185, 10}, {211, 10}, {211, -44}, {219, -44}}, color = {0, 0, 127}));
  connect(add1.y, perf001.dm_fuel_in) annotation(
    Line(points = {{201, -50}, {205, -50}, {205, -56}, {219, -56}}, color = {0, 0, 127}));
  connect(perf001.Fn_out, setDependent1.dependent_in) annotation(
    Line(points = {{241, -46}, {251, -46}, {251, -64}, {207, -64}, {207, -80}, {217, -80}, {217, -80}}, color = {0, 0, 127}));
  connect(combust036.dm_fuel_out, add1.u2) annotation(
    Line(points = {{52, 36}, {66, 36}, {66, -56}, {178, -56}}, color = {0, 0, 127}));
  connect(combust046.dm_fuel_out, add1.u1) annotation(
    Line(points = {{142, 36}, {148, 36}, {148, -44}, {178, -44}}, color = {0, 0, 127}));
  connect(rampT070.y, setDependent1.tgtVal_in) annotation(
    Line(points = {{241, -110}, {251, -110}, {251, -80}, {241, -80}, {241, -80}}, color = {0, 0, 127}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 18}, {50, 18}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 18}, {20, 18}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 18}, {80, 18}}, color = {0, 127, 255}));
  connect(combust036.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 42}, {60, 42}, {60, 20}}, color = {191, 0, 0}));
  connect(ramp_T040.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{51, 72}, {73, 72}, {73, 13}, {69, 13}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 10}, {15, 10}, {15, -20}, {20, -20}}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 18}, {-10, 18}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 18}, {-40, 18}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 8}, {-73.4, 8}, {-73.4, -8}, {-43.4, -8}, {-43.4, 6}, {-37, 6}}, color = {0, 0, 127}));
  connect(setIndependent1.independent_out, Brn046.TtOutlet_in) annotation(
    Line(points = {{142, 70}, {166, 70}, {166, 13}, {159, 13}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Brn046.port_1) annotation(
    Line(points = {{130, 18}, {140, 18}}, color = {0, 127, 255}));
  connect(Brn046.port_2, Nzl070.port_1) annotation(
    Line(points = {{160, 18}, {170, 18}}, color = {0, 127, 255}));
  connect(combust046.HeatPort_b, Brn046.HeatPort_1) annotation(
    Line(points = {{140, 40}, {150, 40}, {150, 20}}, color = {191, 0, 0}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 22}, {-90, 28}, {190, 28}, {190, 18}}, color = {0, 127, 255}));
  connect(constrain_Nmech1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{40, -20}, {74, -20}, {74, 10}, {80, 10}, {80, 10}}));
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 20}, {-68, 20}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, 20}, {105, 20}, {105, 22}, {110, 22}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.004),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end MSZ006A1_engine002_002;
